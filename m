Return-Path: <linux-arm-msm+bounces-85907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79378CD051A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 15:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD4D730CF2E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 14:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C895339B41;
	Fri, 19 Dec 2025 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAO6xiK7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaqxpZsf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3587339701
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154961; cv=none; b=mbmcGL6vICG1wb8Lie57OXM0FpeRVaAolIbyTmonFC7MENccGoX+bdhZepmFd8ZSNisHZGbKoiL4xZmsL1/P0JqhsKARIuvD5ZLAHa/x0zgRKR0pE9f9722UQ/sYpwWDP32IYwE8fU4el4Orevi9ztVhP7Vu0SpMy5VdRQq1WEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154961; c=relaxed/simple;
	bh=z3gIGj1oIvvmH82pocqz/4k2PQOnpGa3jr5JHcWhyj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhZUROW3KFc/GECf1eunHD2uDjm25ikI9jQP1bD+5wghVdL4uDi9PH/hj6QZ6N29T6uLIn86CSCT8L+wEMeI8J7CJdA7ekj+k79bPNcNorl3ln2X+3g8NRZP8QauVpncUvu5MckMDL46/w8CppOL8rZ6hpKuiUavP1BNFx9YFQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAO6xiK7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaqxpZsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBXZ4A3991031
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=; b=aAO6xiK7B2Ahpu0Q
	tStX64yB/Oyj6iYNxsdek7WORUjXVMmB1EL6+Wo81vsth5sEsUNHmvEBxPaakkiT
	3WXMe9musPUKGR66HMiUIVPfcEIYimPkz8v+nn5K5fZ/ot581KTdLa2XOFf9SC3G
	yKvrcxcYJxj5Zm2LKOXeDZS61VYFmeBQk4w+V48PN/LZSjl4Hvuyy9Rak2s+wL9V
	GRCZXgEVJ5hMXictveqt3ggt1808OhVYh55oeeXcA4/BqHqX8Qj8pBVlO07OmyJI
	tUd5Qv3CNWYPQZF0FaRzPBUdlbC7lgYYqyx6sA3bQ0YIuCRo22y6rQg+MYvAEJOf
	t2aX0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2daw0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 14:35:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b6a9c80038so173520785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 06:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154957; x=1766759757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=;
        b=JaqxpZsf9sw3FdzTGwsPCaYwypSmPdzFIuLChBu5daWVSpFEtrcBDNXLnZt45NbysL
         J+ETCxizcWlRUFQqF7rUhIb2jRfiK0ksET9xwKHjGPTWvjVLlTVjrrhI1O/giT+S4kOA
         pR4U3PSCv4VhDw1lgIaNFXtC/BqhODhXuhTgtKw+Pv4YLsOJcjNNGhrZ31oLNaPizoDn
         cmOaNjESgjj9Hn3HTpJCw9Su7trUQNpmvROEk4L33kHX2M0OZ5nIoX2XHY7nAW5mXmlt
         n+BZRLX+5dl0zovn4B5zokxW52RsRS1njMdEh3Ynq51i7Mfr/orol1Sv7ABYAiihZpaL
         aiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154957; x=1766759757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xV7Sj1lP+ipO/vMdQQDAnXh1FyZ9JEzti6vulzMdahc=;
        b=ZytnblvBqyJi4yjhUM1RqbKmP0H0t9LiAeocibgMxP0wLv2hPsQmC3yr/vASNG6Vmp
         mGc9ZwgWQNGTs2Cx86xnOB7guxuDNtvCVXLoM+deMNS3U97LNdp+M13HdEB1Nkft6uvH
         0HUEq7jgUs+nA/PZBqnzptsRsmCxLN/spH7xKGz+4MQ8WjwOiJl2MXAkDm0+5xut7OU8
         lqUNdeZ0ZNdRB00KGY81N2wHvSgyPeI6PGR9cnCmb6WLFiShux6UfFgclumGjaQWTTZR
         i87myfqTc0mz3d7Qs5HvaYFX+aSe56wI/tinN5Q/X19ue2+qqLDn5pgpgao1nR0fOBV7
         WnBA==
X-Forwarded-Encrypted: i=1; AJvYcCU4QtpCOvinHXdP5K8gAYN7kRshaLtKBewRl5GGjWZRwLVibSHbncn3MhPIjtHwE4MZbs+yZrSL7M+G5g+m@vger.kernel.org
X-Gm-Message-State: AOJu0YyU5d34SwnLKuFpUP1HTFLepXqKqhOrdQuNuXsvySl7WA3aPR8e
	hIWZtt/9mm8mptVhydXSs3/m2qVlcYzmwiC//wz8VllbP8fuGFGy0TDYk020dfRRfCwqSInhcPL
	iGiUxVbW4TM42uEAUSi7WDn6+6fF1gdpCQFQj7W86kTWdpMOxT+Bbce0y+oHotBep3Wga
X-Gm-Gg: AY/fxX7Md4ZVVM56o3m83FjXaLZ5Vana7Xb+A+v6iwzV55o540GfGXMkydLgOobrsGX
	aR4/8nyz9Ac42VxCDnxayMva3uUzpGu6IRPGGV75Evi8p0voEqHKbsIt+Xm+xapMSoar5oGYMXY
	wzAOY6hYNydySF6AeBVJXu1GkUfrO+sLP9XSKRm79V1DmyZD88FH+WP2p4oV8r636faqizLgqdz
	BH+7ATfI71abz5UsHbllevB2H8SUQBECq6lQ1JrSJjVO+PmDF2S3d5nTHAO7pPzfI9a5oj6OiZy
	AW5rBiCuyvp5erpYE1UskRftZR8+TmDhyqUluIhgFSxt5poZLDBVO4DXQSznS9M390O1qsppZvh
	LI6DoAhTGDl+ZyfI6z17roBjxoVQUklIH2c5DotqQewtzs91UfBmytDheVrvWWpa9VGoo
X-Received: by 2002:a05:622a:4c15:b0:4ec:fdaa:b31e with SMTP id d75a77b69052e-4f4abce094cmr43174161cf.32.1766154957187;
        Fri, 19 Dec 2025 06:35:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpXU5pTYf8IAIDbE0Sqzc6Vk3SDvjFDfm4RPQu+aDyXRPlzu/xbQTB4M/gboaQR6K2hZYIIA==
X-Received: by 2002:a05:622a:4c15:b0:4ec:fdaa:b31e with SMTP id d75a77b69052e-4f4abce094cmr43173611cf.32.1766154956699;
        Fri, 19 Dec 2025 06:35:56 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 15:31:50 +0100
Subject: [PATCH 1/5] iio: adc: aspeed: Simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-iio-dev-err-probe-v1-1-bd0fbc83c8a0@oss.qualcomm.com>
References: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
In-Reply-To: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z3gIGj1oIvvmH82pocqz/4k2PQOnpGa3jr5JHcWhyj8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLEcsg/U41BoWF/u0CzNiG+xeoGWVjGVoXoT
 NfSmwwYEgaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUVixAAKCRDBN2bmhouD
 17LSD/9ruRFSUuxVXUPfzteRn2rDyimSpK7gTLu+xZB/8ccc5jh3NFxaTc82kprKc9KeXopFpk7
 sxqJAClDY/CkpObXefij8urEBNLvrMDnI2eShXdGAumF4Re2rxTN2eN4fpTrEsHeVCeRn/GUiTm
 aqd8AWv2WVpUQocZdUlWsHte9x4AyuaQiclWlO2P/+ESmUygqA526P77fL+zqusY8dl1Qx/mLZl
 0Fj9c5zLge/Pdq6xHeypu8XYSNPOeFtFIu4bjKsusMTEzUmFcfEs4PcejG89bsqU21BGciXyuCj
 VDozY6YnIFEx8SvMmhcSZeXZ1hH9yn6PHBevAuaxu4jdUVVhe7WFjiKht6Q/J1KECutkpfaQ7Ut
 /CZjinA1SFtrdElPEAfnk5RXoXjxH8VdVzcEFz/hbgzOR0pDj81MJnNJYyX0wBCFZ6uqWFfQfxw
 foCaRbwDfrobfvdERQQb8brmubRaYWsJPduVobsoGGGm9GCqzCFf8QoqtaWV0vG55G6vnuLCktx
 jK8PiB2fsLJ6Tf8T938FxIEAkBGN799ClXQq6w07f+8xN1d6kqIGHE3RDvu8eVdfqEvu9PEeyKm
 oUutIFIRV+Ua5vv9o5gi4gWG3SfHKRQq+UEMXE1nm7Z8KS7cy4Kymsd/ds1yZD71QXN8clXwwKl
 b/wRwDEQRYvMMdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=694562cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dK7io7gEiNwTpUlzFjcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfXxRBcUW5KeWPt
 zFrAVT3E3CUpdbjHpYj365+MmTLkcMM+gDFUaYbPzoKJFXRWgpH7Gy1RHlU1JDPhzgMNA9IMCp6
 2plsQZi6sIl4P6eVLavFE/RNhC5+ALceQm09MMdrrxnqlAGmi5QAeQQd4PI3Z/NwzzZnJj3YdoG
 Mq0+IVaMUaq+age4ziMbbvlLXAmK/BRwm/KZrbPr5vUhRn1LaCvhsakWxqQ6U8HvtP7Ss+QHVEv
 kHkSzFs9DO+aieMCYTu14xc8tIqmeCbT/MRek3gz47rNkVVYUPBCpPtOpziWt3sOyoKpNoTSNFh
 smInWUzh8d0Zok4W78LBAnSN0GViG9GofMDitQbZQ918ocEm7cUTEnwEdABjVAJD75vMnc3O3+o
 S/wtHeg7/Y6LU2H9eup6A/kBDqLvmUeTdTCx13y6BlifPrEayXHtiveOVDzTB+bxUTdKiiCDEUP
 HjosXNLkcRgVd7pb2WA==
X-Proofpoint-GUID: j9DeAx22-BCrHPflfPG5F7SNASXMiUl0
X-Proofpoint-ORIG-GUID: j9DeAx22-BCrHPflfPG5F7SNASXMiUl0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190122

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/iio/adc/aspeed_adc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index bf2bfd6bdc41..1ae45fe90e6c 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -535,11 +535,10 @@ static int aspeed_adc_probe(struct platform_device *pdev)
 		return PTR_ERR(data->clk_scaler);
 
 	data->rst = devm_reset_control_get_shared(&pdev->dev, NULL);
-	if (IS_ERR(data->rst)) {
-		dev_err(&pdev->dev,
-			"invalid or missing reset controller device tree entry");
-		return PTR_ERR(data->rst);
-	}
+	if (IS_ERR(data->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->rst),
+				     "invalid or missing reset controller device tree entry");
+
 	reset_control_deassert(data->rst);
 
 	ret = devm_add_action_or_reset(data->dev, aspeed_adc_reset_assert,

-- 
2.51.0


