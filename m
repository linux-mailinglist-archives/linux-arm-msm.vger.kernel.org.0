Return-Path: <linux-arm-msm+bounces-86315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 267B2CD8F39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44F5D30A930C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C1A34DCD2;
	Tue, 23 Dec 2025 10:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlvL8scH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwlOZs2U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8D234D38E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484308; cv=none; b=AfP9tQZCu2IfjgxTub79hzUb67onKoTPn+g9JIT/FVLPw5mormsATehcdRQI6SNY+ZGCL74SKWQ1D3USWpYklGKvW+GD3mlLfjS1JpGysR4DXqHlb/7o6slUORTpCRofJAmWggiBizWI1V8UfVfiGfOEJjUgyF7vOAWkubL+sq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484308; c=relaxed/simple;
	bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xb9w73E7qQkYQ6ufFyk+x1Stfffj7MMzdv2AtGz5Hq4/npyvCZDlmtHs2wJCWilvSoDfNm4fT5VT/uuwNbfUQp7qMKyP5y1oRQqsve8CjMgDFGnBse5RnRmNNtxnoemcVLjr8yroRNM++IldbB8/hzDyF5dYzJUeE3cu+tx12Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlvL8scH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwlOZs2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7xqMN024545
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=hlvL8scH029COHcp
	+MBV+1qog3pQXgXaGIMWNNAFXha2eZDWPkpmb0kt8+JA/oHqoDZHISR2sWq+praC
	HHxBiRQ06uUW7sy5zZFS01duUSrv97XuA2slOO0N0KaAfi8S3NfFphOFtzaO8MoP
	9hGzubKxtuH+Yj9v54rVzMPz2n92fo9xMvb/tIwZm9awgbshwoF4Ut8BRfggpk2K
	fqJWym2jYS4vHia/jtTLRQRA/SbNQ+btysGLs30mSRQ+8BxnK4l2PLpey/9YpRmU
	nDIkntfUtPWPkzK0+uiTJZ8BbmzDGeyzF4IDHlmVNeJVzVDlvQCEGL9o0xGSDTXj
	9ypubQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 10:05:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso45751501cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484303; x=1767089103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=hwlOZs2UB1WEsHDGO06oHn73ItpH+oS1OsFGueS5BAB+f162dTuqPHgC/g4JtqFQzP
         MPQINU2YENwiEIT1THRxOuyiAba15W3KugE9ONC1k4iUDylJlXzqSeTwpM6Wa+A3Po8O
         3tDkpW/4eBvU0L2YSfj0ZUA3DnWVEjgnm0F/DeXgNze5t9agFnxqhwhuKZDUX5FzCatF
         gQnQo9qtDHRyZzXokWMRxaQz2c/OA2U8ib869NgmcyAFqHytat88c7eiShccH9TKTCOZ
         DT9aoupMGntvrVUMS3Ma+ggSH16ZJ/Ljmdwr1ey/8TH0ntRTOiqL0NC/0iSdPzNt/eHx
         sQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484303; x=1767089103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=Sah4yjd/gvix6/M86bIslXnOVj9CagLtalWz3IQtYwaDXaLg7jSPss5cJj9nfdY37L
         qpcQMDkCf4IrV0pz/0z2/ilvfQizjXmKp1CrKaX1HbWRvfm25TOax1Os6nTF9KoHM+D8
         1haQ/1MXTDs0qYl5qcOaUqmWrNPE7farsKwFot3jscw12l8W0Z7Uo3Svkl6aZjyBbctW
         l2KwpjH69dUWjFUifCT8tuIQWcZ+YyMPMWJiX6ESIlciEXa5sL+IgmaMKck/OH1ajqSS
         Nfbz5gSdJ5GSGrJRh7lwN6fYPviZTX+T5g3b7jtjTrBQYccJMR7M+r6G525aVFDRhCiY
         OgGg==
X-Forwarded-Encrypted: i=1; AJvYcCXQj55IViYb4fJ+9DsbJ3zI3Azag/dgIuAR5VqLUby3MSsQKCdx3/z+2hldEEVZMHMzmRQYPrihxyCcw1Gn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3nkoZ7Cx0X+pb0nNiuyUSMd5xmj2MrQn+5MfMTANggBylzFqB
	s+jEierQN1AaFyV0sxu/K4s1g5EeC+gb1tWGINtBeKmdh6KZM3nxqLqIpX897WejtDpLhBkakuG
	Dr45m5SAoHQaxRt4v5F7+SQoPbOVql211PEEu+F54yrRzNJyrYClFh9KATXGLwQPWFwwi
X-Gm-Gg: AY/fxX7sO81QJb/lfGlxOAPNMsZvD2Fr1XOjrk3j5dYTVTje1vk4ghv7trkPHDaMPX7
	9EYUq6lCUfTuCm4EBdNyx+Xpdqwl6ljRj+s36M9rDa5myTJtu28+bimI/0uTo/e3OldusorUy0r
	VMGobkI+3+fTj9daJyqPM9pxykekYCysK+tSB1totDbncqQcmizXqr37g7kV+eOmP2K57ZYvWQA
	WcGXjxOJwreiCqhlJVmfcoe9t8sFSeVRu91qbbF2S4+q+UbN8V2QIRJi3bZ1DjlzpYv2/lvl0Wc
	ZHDyREfhtdnmad94YQ00xIpoqd92xZ8icnj4Ezt0O5ceQyWAiKBZnd4a0AYKC1luShT+/4pWisI
	sz+6FowIn0rq6NgExApwBrfF+rPIyvTo2J/2MKLk=
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr219666671cf.19.1766484302890;
        Tue, 23 Dec 2025 02:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe5BKZC1HMpaoJ6m22Bw5JHQ2k3vKZ1lflXeYj8W+wWpZagHFrQE5aCx2Ca5x5xFVbk/k3Sg==
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr219666011cf.19.1766484302373;
        Tue, 23 Dec 2025 02:05:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:41 +0100
Subject: [PATCH 03/12] i2c: bcm-kona: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-3-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk9+7EXI/ovwZ/c+XYelh08kqOlDbOBxj2/k
 VttIDHL2WiJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPQAKCRAFnS7L/zaE
 wy4UD/dSL57NbV3RzqtwqkJOlX6sp2CYEYArQJX8tFc9k9osPA7RTFFwDYR077EsO+x6swQWmec
 m3ebsw5P/vUS5BJqv5zs99rA6OREaF/bLsFJdXSEhoAX9RP1kg2FzLORu1zVGuyD5o0+yzDj9ZT
 QNLPrQpqDGLfersmjlqVWmrhVOjOe+Y/ZOjnQEGBcZd0A8JmdhWKnflhWiMHrG8lyri3ExaG+Gn
 c+TnA/WlWcN3vfN/aZOihX9QJW1TM6GBBr2g3GB8L4GMWheCavF6WtEGIW9TqAoOplupBi+/a/3
 SJaSI1L/C6Mg0Ab/d2lh87/sFaZHTyPmVzqRO668D9AysNGfdRCBaR/WAev2AriKdwet6miHmPl
 qytLMwT0ra/pC/P0t6N1C3aDCtPir+t/VakOsLnHOFmThFS+i93ESC8BVZNh5lOl2gHotAjP9Ot
 Bjh7w2/MXmjGWbrheu1uiYIZnr4X85hsQUpBrRM/RFMWm9S58QHIe8cjqbapaXGMmNOy2Ylp/LI
 eE2nwiiyC0wrSr4X/olOtXW7J+U3edWLDgbiEbzud1360InLPOGvicfsMUZ1fsKZy+BJkXS0JRW
 AWzg1yWqYZH3x3uOVCkZZZI4ty0Ks9K9B4qWzbGQbPP5u2fSIwfnsaQwl70eaWQ4LMEnn5PJ5qx
 p8LWm/LnMJHds
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wbLTx2hw8OS_uh17BHcOnVOhMvgsbVt-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXykbo1ERWp4sI
 EjsRfpO7XaWu6QAKVb6HfRiGCwq3iXUVxwAlhl0cCZBcp/6KjplGj7SKHs6haAOhARXcyldd/rE
 DHBlo1UDLuj2/rheKlksZwbpFfOSwfxsYysqIgsEoI8E6QanttirQjcLfvZ3emtlDdbzFOtNh2E
 9g5lEDLwqySpCBnrLGi1I2Rfu2XhcyTVtv8Zw7zCFxBCG3zwxXQJsqcnBFmiJcmz5aEbWF0RBut
 U+caygdT/7LyY8SdFAkvy9eCCUibxpn6QRb6eUVgT2AQSXcEDIUnsfNbQIlII81AdvoNDjY/ZZK
 Xst8UW0ySeVnLHzyhk59emI7Vp6tvykVsxHZ5lrXH55q6LG1HhJ9q5O8/v9Gqk5suXOlwqHOM+K
 lXWWyXjRbdSbdr4NW+1ylRGWJqYNsuz4nLEKYvdGoSrG7rikckwpTRjGwPPAFRs0gn2uviwfBSs
 prSgliQSyC5l0VKKKJQ==
X-Proofpoint-GUID: wbLTx2hw8OS_uh17BHcOnVOhMvgsbVt-
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a6950 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xxYytfOIdaUIj31isgUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 9d8838bbd938bf6c43d9553d9f54acac1282f7e8..edd79689f40f451fc216455c9da5704bdc73c62f 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -840,8 +840,8 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	strscpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
 	adap->algo = &bcm_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	rc = i2c_add_adapter(adap);
 	if (rc)

-- 
2.47.3


