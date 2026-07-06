Return-Path: <linux-arm-msm+bounces-116706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0nqJ6V1S2o8RwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:30:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 096BF70E9C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:30:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SQ4Z8HOZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TT7KLoFh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116706-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116706-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F22330449F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5782F480947;
	Mon,  6 Jul 2026 08:58:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536F53E92B0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:57:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328291; cv=none; b=X5Qzm+BKlKquoEw3qPX230kB+u46pSiMqsbqwjx6BYeTRgw5u95jCFlrRl3kGE6AC2GLiRE6HgDnSrAo33Ke+zbB8P46uJ2Eg72YBIN1cYllQJ3l8yUUDKFEZAXOtRmtQvv4gyqV02ZDPY81KQafc/gGDM4UUuNOsh9AcHNmHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328291; c=relaxed/simple;
	bh=mhpIB5Q4OlE0vTTtkXJJ72eiy36VJs+SN6lIET2i5yo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ug0Plz5YkM+5yG0l1L/YnE1LwXmhMMXqWW4wWV6rRxYyKkgxa49H+xi+RDQxBX/rwzJirDOAj+iVYUinrPJWZjwPB/gy9XFRHdnfHCQzkweMf14t4BatMBUT7iRGc2MkXMRIU2Xa0+8CeSFifRqhccgqbrDcdAiajfS+42uopRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQ4Z8HOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TT7KLoFh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641fxa3470549
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXYosdm/L3uXG9pBMxB2fC3yczj1x5IOEXauGvm48R4=; b=SQ4Z8HOZvqmgtXZ9
	f0tswCYKmu4/DH274uz710yaQDsV2B0HLyo2oMCB99lhTd3gnL8vKZ7U4lGp4uHU
	/V3PdJJ7Kqvd13lLGXAGuvjMIYYYiERhQ48EuKhW5YuVB9EjqL9RLhPXEYlT5WAd
	QynDDlEXFo/ML8tXpgwNoVUOt1+wpbFtrJN0CL18HK3wOvZm2MPK72Thy9sukG4t
	tQJmsv9pdwsRpOHy4ERBNkjzQ6jbIfPL6mGo/zdYPfCEnRF3gPB9V4AbVSe40LQ+
	td7pOx6HBd6dl/Rv+ne78vwO2EGG3atUve/GthXjTvtcdPGG4OB2rOZ0FsAYtDdL
	XAOKpg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen95d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:57:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81db324caso65115405ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328269; x=1783933069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXYosdm/L3uXG9pBMxB2fC3yczj1x5IOEXauGvm48R4=;
        b=TT7KLoFhdXA5VfXhTDee91fewifzLIV0/fKVkuv+Ygvlh5ZJs3S0eV/MYLdtOfhRZb
         MBkt/ntyZqtc6KjzwcSng0rPxX+vKPSUXvQTMGgRD3eYEuvHBMZ82eemBrPOBjozGojX
         sP8Ub4e/yr/JiHQZilIaScsBL2vMw1vl03vsu/bIfwBSHHEwBc2/tDnkIO/fe5AwCL11
         7DBHs6b6cl3nCDdvlI8alRswJNzTV3qcEWGBest3ajzZEwTDtmfwm5bmGtLAl9SaToeC
         h5EgjEcy5oPEfnivc11ZT4QJvPlB4j1Mx8fk0g8mMyl36wZLSDKew3OMnwS8Oy2h2t7G
         mVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328269; x=1783933069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iXYosdm/L3uXG9pBMxB2fC3yczj1x5IOEXauGvm48R4=;
        b=VyPgrVAJ1Wad7tGhtgLiDizUOdoCnhCmq7rVt8QqRHb5rYvstBX4LhBvBW8eLen4Z1
         kWVWeYWOc8EJkqF7UgnvJx5PMGij1I0+jNiW6q3oi8z9eoumsAw4QmrK2wfvY0XwgRst
         f9M0wox7HziXs5dS16MIAujdUnnBV2cHvqKu46QO3/e/icpK62De1tHdPQiwMlkuHQiZ
         W+CS3InfJzE76rg7tYv65YZAZSRsmu4SyhcJx/Y9mZ6eB3gWMVR+FmwK4nkl6mPa/ZMh
         aOogFD2ThqUq+XwQvK6AJqiMSeNK9cYNosEy4IkJQ0SsIAYlDvXLPHs+thnyVo8YOihF
         6aEQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYgtbc5AUY9m9fPyL1Io5GT7zLP2/bwYIZm/lgh2GRUNnwNFubLO93beXRo1gBBAhkhVyrqlEE37MB1Wo8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq4RjCwgwSY1zmt9dVx7XH06dTQAPZieB8ZE9nYGAjtKw/ZSXP
	p1+6Fq/mE640jPD9ETM7kNpxBDSoMAlQBU+AgoiMiRyuQNX67AS4cjK9r8Nb7Aw0bDG6A2zFGIq
	YT5R+i/flDf6dmkvx+4sLO5jiv5T4mMrdsc1ORjRo/xi9HTgWifmvsa6JvO/530dMW2bj
X-Gm-Gg: AfdE7cn2as6vQGoj+OZppvFLNKK+FdDZ1YDBi0ZpRJRfuz2jSgGbDo/A4c6PiF3A271
	HrlDK3njLgwxk45dZxH1BqYXj/v1biUI3ZM7UyiHnbSgG13xgZwpM6w/AgFue48phRhAOhFCy3h
	cYXofobtCR6NbSTA2UXCFPQFMI3ZMRCWJ/9xK/6NLQ1EawxS0xqBQxJybkUR6XmSxdgTO+FEFxC
	8SmVWDl6LEbOOLcr47ntbrXLdKjLwuzrWR6KuqmGX/fLxBHt87uNJKfwE66yJZEOXXkYKL31joW
	B8XpeFI/SFC7zNUZTx0akJwfbLBW1XX04Oh29txjqRVaAhsRhK3UCKBZef+kZ+eFMZggVKvjUwt
	ac1xxRoYdL7K9oJySDKDhFBkRLke3mxMZkTY=
X-Received: by 2002:a17:902:ecc8:b0:2c9:97a7:71ad with SMTP id d9443c01a7336-2cbb9f29599mr90914595ad.40.1783328265824;
        Mon, 06 Jul 2026 01:57:45 -0700 (PDT)
X-Received: by 2002:a17:902:ecc8:b0:2c9:97a7:71ad with SMTP id d9443c01a7336-2cbb9f29599mr90914035ad.40.1783328264862;
        Mon, 06 Jul 2026 01:57:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:44 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:27:16 +0530
Subject: [PATCH 4/4] clk: qcom: camcc: Add support for camera clock
 controller for Nord
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-nord_videocc_camcc-v1-4-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfX+4ptwwYUj1WP
 bo+TKQlRD3baLjmyyGXTW1E8uvCHCMhAeOHJ/gzALxvf8xJbSBRsjmUslhk3Y4142yDrPvHK5Mj
 dVVeCRmGJnwjoMA655WxaOc+DnNLaXM=
X-Proofpoint-GUID: 6uEUezd1AAq1LSZCsuxy6qeRzFdpyKDE
X-Proofpoint-ORIG-GUID: 6uEUezd1AAq1LSZCsuxy6qeRzFdpyKDE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MCBTYWx0ZWRfXyaeNm8ZYkxl9
 KssFluVVkfBXGd67VusGSzGQjYVLMem8pGmRCFNS869k2fBA8fkvq+bUNl9Hw8N8g8LXVCYPmVh
 bO+RdjFNGuXsXKXhsgApEGY6DwvepW30Q+6FmYRNExuiKf3tbwppiwxohov6tHxPtb9YnXf6CMo
 BkqMv4GIGCeeYrCXm/FrT/HGr6nX8wmiPNxJF6VXcUOm3Eph6VuD+NMiJclxAtcDlXwHse7pHhQ
 sWtMKfNzumSjqs+cqbw6wISbXsLdhe66DLVI5FN3BqX0EfGyYnvg1StwRlOlVn6OdnnoKGtr/Ok
 YsL8SvXkoAxAXeCbf7M9f1EEQtGvymOcTocd193MgaZAXNPAkiTD2PH2cfmsqqPLOaJWedIKhe2
 5zO27PLoXM5g4xKUukB4wF+LWXBUge6x8vq6p9EAIa8HYCfhkNuN3rR3xBVSmB9i84McFrG9qHz
 D67bY3mNMCgV0N7HFvw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6e0d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ajiYKY61hDecEpAsj8QA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116706-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_jkona@quicinc.com,m:vladimir.zapolskiy@linaro.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taniya.das@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 096BF70E9C6

Add support for the Camera Clock Controller (CAMCC) on the Nord
platform for camera SW drivers to request for these clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig      |   11 +
 drivers/clk/qcom/Makefile     |    1 +
 drivers/clk/qcom/camcc-nord.c | 2941 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 2953 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index b634036d7e9f5dfff44d2ce871d0776b09b6d4a0..e9e1ba81274e6581d947cd2108149987c4793dd9 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -145,6 +145,17 @@ config CLK_KAANAPALI_VIDEOCC
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
+config CLK_NORD_CAMCC
+	tristate "Nord Camera Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the camera clock controller on Qualcomm Technologies, Inc
+	  Nord devices.
+	  Say Y if you want to support camera devices and functionality such as
+	  capturing pictures.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index d76675b9d6fc2b5b1fff4513ccb203ca8f5c9c7c..998dac883b13af589a8057135e8357c68919fa1a 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_KAANAPALI_GCC) += gcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_GPUCC) += gpucc-kaanapali.o gxclkctl-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
+obj-$(CONFIG_CLK_NORD_CAMCC) += camcc-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
 obj-$(CONFIG_CLK_NORD_VIDEOCC) += videocc-nord.o
diff --git a/drivers/clk/qcom/camcc-nord.c b/drivers/clk/qcom/camcc-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..9e3c40cb3ad5f06196bab87593afb7d1c7da411d
--- /dev/null
+++ b/drivers/clk/qcom/camcc-nord.c
@@ -0,0 +1,2941 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+#include "reset.h"
+
+enum {
+	DT_IFACE,
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_SLEEP_CLK
+};
+
+enum {
+	P_BI_TCXO,
+	P_CAM_CC_PLL0_OUT_EVEN,
+	P_CAM_CC_PLL0_OUT_MAIN,
+	P_CAM_CC_PLL0_OUT_ODD,
+	P_CAM_CC_PLL2_OUT_EVEN,
+	P_CAM_CC_PLL3_OUT_EVEN,
+	P_CAM_CC_PLL4_OUT_EVEN,
+	P_CAM_CC_PLL5_OUT_EVEN,
+	P_CAM_CC_PLL6_OUT_EVEN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+/* 1200.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll0_config = {
+	.l = 0x3e,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00008400,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll cam_cc_pll0 = {
+	.offset = 0x0,
+	.config = &cam_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO_AO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll0_out_odd[] = {
+	{ 0x2, 3 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll0_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 14,
+	.post_div_table = post_div_table_cam_cc_pll0_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll0_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll0_out_odd",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll2_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll cam_cc_pll2 = {
+	.offset = 0x2000,
+	.config = &cam_cc_pll2_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll2",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll2_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll2_out_even = {
+	.offset = 0x2000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll2_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll2_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll2_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll2.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll3_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll cam_cc_pll3 = {
+	.offset = 0x3000,
+	.config = &cam_cc_pll3_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll3",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll3_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
+	.offset = 0x3000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll3_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll3_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll3_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll3.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll4_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll cam_cc_pll4 = {
+	.offset = 0x4000,
+	.config = &cam_cc_pll4_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll4",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll4_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll4_out_even = {
+	.offset = 0x4000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll4_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll4_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll4_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll4.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll5_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll cam_cc_pll5 = {
+	.offset = 0x5000,
+	.config = &cam_cc_pll5_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll5",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll5_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll5_out_even = {
+	.offset = 0x5000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll5_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll5_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll5_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll5.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+/* 720.0 MHz Configuration */
+static const struct alpha_pll_config cam_cc_pll6_config = {
+	.l = 0x25,
+	.alpha = 0x8000,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000400,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll cam_cc_pll6 = {
+	.offset = 0x6000,
+	.config = &cam_cc_pll6_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_pll6",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_cam_cc_pll6_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv cam_cc_pll6_out_even = {
+	.offset = 0x6000,
+	.post_div_shift = 10,
+	.post_div_table = post_div_table_cam_cc_pll6_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_cam_cc_pll6_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_pll6_out_even",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_pll6.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
+	},
+};
+
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL0_OUT_ODD, 3 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_odd.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 3 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_2[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 2 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_3[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL4_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_4[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll4_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL5_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_5[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll5_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_6[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL6_OUT_EVEN, 6 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_6[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll6_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_7[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL0_OUT_MAIN, 1 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 2 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_7[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &cam_cc_pll0.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+};
+
+static const struct parent_map cam_cc_parent_map_8[] = {
+	{ P_SLEEP_CLK, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_8[] = {
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map cam_cc_parent_map_9[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static const struct clk_parent_data cam_cc_parent_data_9[] = {
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct freq_tbl ftbl_cam_cc_camnoc_rt_axi_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_camnoc_rt_axi_clk_src = {
+	.cmd_rcgr = 0x13244,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_camnoc_rt_axi_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_camnoc_rt_axi_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cci_0_clk_src[] = {
+	F(37500000, P_CAM_CC_PLL0_OUT_EVEN, 16, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cci_0_clk_src = {
+	.cmd_rcgr = 0x13110,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_0_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_1_clk_src = {
+	.cmd_rcgr = 0x13130,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_1_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_2_clk_src = {
+	.cmd_rcgr = 0x13150,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_2_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_3_clk_src = {
+	.cmd_rcgr = 0x13170,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_3_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_cci_4_clk_src = {
+	.cmd_rcgr = 0x13190,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cci_4_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_cphy_rx_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
+	.cmd_rcgr = 0x120ac,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_cphy_rx_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_cphy_rx_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csi0phytimer_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_ODD, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
+	.cmd_rcgr = 0x10000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi0phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
+	.cmd_rcgr = 0x10028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi1phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
+	.cmd_rcgr = 0x1004c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi2phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
+	.cmd_rcgr = 0x10070,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi3phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
+	.cmd_rcgr = 0x10094,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csi0phytimer_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csi4phytimer_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_csid_clk_src[] = {
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	F(480000000, P_CAM_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_csid_clk_src = {
+	.cmd_rcgr = 0x13214,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_csid_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_fast_ahb_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(400000000, P_CAM_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
+	.cmd_rcgr = 0x131dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_fast_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_fast_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_icp_0_clk_src[] = {
+	F(360000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_CAM_CC_PLL3_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_icp_0_clk_src = {
+	.cmd_rcgr = 0x130a4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_0_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_icp_1_clk_src = {
+	.cmd_rcgr = 0x130dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_2,
+	.freq_tbl = ftbl_cam_cc_icp_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_icp_1_clk_src",
+		.parent_data = cam_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_0_main_clk_src[] = {
+	F(360000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_CAM_CC_PLL4_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_0_main_clk_src = {
+	.cmd_rcgr = 0x12018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_4,
+	.freq_tbl = ftbl_cam_cc_ife_0_main_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_0_main_clk_src",
+		.parent_data = cam_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_1_main_clk_src[] = {
+	F(360000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_CAM_CC_PLL5_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_1_main_clk_src = {
+	.cmd_rcgr = 0x120dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_5,
+	.freq_tbl = ftbl_cam_cc_ife_1_main_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_1_main_clk_src",
+		.parent_data = cam_cc_parent_data_5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ife_2_main_clk_src[] = {
+	F(360000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_CAM_CC_PLL6_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ife_2_main_clk_src = {
+	.cmd_rcgr = 0x12188,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_6,
+	.freq_tbl = ftbl_cam_cc_ife_2_main_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_2_main_clk_src",
+		.parent_data = cam_cc_parent_data_6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
+	.cmd_rcgr = 0x13000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
+	.cmd_rcgr = 0x13024,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_1,
+	.freq_tbl = ftbl_cam_cc_csid_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ife_lite_csid_clk_src",
+		.parent_data = cam_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_ipe_0_clk_src[] = {
+	F(360000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(480000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	F(650000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
+	.cmd_rcgr = 0x11018,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ipe_0_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_ipe_1_clk_src = {
+	.cmd_rcgr = 0x11074,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_3,
+	.freq_tbl = ftbl_cam_cc_ipe_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_ipe_1_clk_src",
+		.parent_data = cam_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_qdss_debug_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qdss_debug_clk_src = {
+	.cmd_rcgr = 0x13330,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qdss_debug_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qdss_debug_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_qup_ahbm_clk_src[] = {
+	F(150000000, P_CAM_CC_PLL0_OUT_EVEN, 4, 0, 0),
+	F(240000000, P_CAM_CC_PLL0_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qup_ahbm_clk_src = {
+	.cmd_rcgr = 0x132e8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qup_ahbm_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qup_ahbm_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_qup_core_2x_clk_src[] = {
+	F(200000000, P_CAM_CC_PLL0_OUT_ODD, 2, 0, 0),
+	F(300000000, P_CAM_CC_PLL0_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_qup_core_2x_clk_src = {
+	.cmd_rcgr = 0x132a0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_qup_core_2x_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qup_core_2x_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 cam_cc_qup_se_clk_src = {
+	.cmd_rcgr = 0x13308,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_7,
+	.freq_tbl = ftbl_cam_cc_cci_0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qup_se_clk_src",
+		.parent_data = cam_cc_parent_data_7,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_7),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_sleep_clk_src[] = {
+	F(32000, P_SLEEP_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_sleep_clk_src = {
+	.cmd_rcgr = 0x13384,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_8,
+	.freq_tbl = ftbl_cam_cc_sleep_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_sleep_clk_src",
+		.parent_data = cam_cc_parent_data_8,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_8),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_slow_ahb_clk_src[] = {
+	F(80000000, P_CAM_CC_PLL0_OUT_EVEN, 7.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
+	.cmd_rcgr = 0x131f8,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_0,
+	.freq_tbl = ftbl_cam_cc_slow_ahb_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_slow_ahb_clk_src",
+		.parent_data = cam_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_cam_cc_xo_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 cam_cc_xo_clk_src = {
+	.cmd_rcgr = 0x13368,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = cam_cc_parent_map_9,
+	.freq_tbl = ftbl_cam_cc_xo_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_xo_clk_src",
+		.parent_data = cam_cc_parent_data_9,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_9),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div cam_cc_qup_core_2x_div_clk_src = {
+	.reg = 0x132cc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "cam_cc_qup_core_2x_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&cam_cc_qup_core_2x_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_dcd_xo_clk = {
+	.halt_reg = 0x13290,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13290,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_dcd_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_nrt_axi_clk = {
+	.halt_reg = 0x13278,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13278,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_nrt_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_camnoc_rt_axi_clk = {
+	.halt_reg = 0x13260,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13260,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_camnoc_rt_axi_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_camnoc_rt_axi_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_0_clk = {
+	.halt_reg = 0x1312c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1312c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_1_clk = {
+	.halt_reg = 0x1314c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1314c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_2_clk = {
+	.halt_reg = 0x1316c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1316c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_3_clk = {
+	.halt_reg = 0x1318c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1318c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_cci_4_clk = {
+	.halt_reg = 0x131ac,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x131ac,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_cci_4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cci_4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ccu_fast_ahb_clk = {
+	.halt_reg = 0x1329c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1329c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ccu_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi0phytimer_clk = {
+	.halt_reg = 0x1001c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1001c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi0phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi0phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi1phytimer_clk = {
+	.halt_reg = 0x10044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi1phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi1phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi2phytimer_clk = {
+	.halt_reg = 0x10068,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi2phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi2phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi3phytimer_clk = {
+	.halt_reg = 0x1008c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1008c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi3phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi3phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csi4phytimer_clk = {
+	.halt_reg = 0x100b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csi4phytimer_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csi4phytimer_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_clk = {
+	.halt_reg = 0x13230,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13230,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csid_csiphy_rx_clk = {
+	.halt_reg = 0x10024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csid_csiphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy0_clk = {
+	.halt_reg = 0x10020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy1_clk = {
+	.halt_reg = 0x10048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy2_clk = {
+	.halt_reg = 0x1006c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1006c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy3_clk = {
+	.halt_reg = 0x10090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy3_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_csiphy4_clk = {
+	.halt_reg = 0x100b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_csiphy4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_0_ahb_clk = {
+	.halt_reg = 0x130d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x130d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_0_clk = {
+	.halt_reg = 0x130c0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x130c0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_1_ahb_clk = {
+	.halt_reg = 0x1310c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1310c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_icp_1_clk = {
+	.halt_reg = 0x130f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x130f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_icp_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_icp_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_main_clk = {
+	.halt_reg = 0x12034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_main_fast_ahb_clk = {
+	.halt_reg = 0x12054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_pcp_clk = {
+	.halt_reg = 0x12058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_pcp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_pcp_fast_ahb_clk = {
+	.halt_reg = 0x12070,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12070,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_pcp_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_scalar_clk = {
+	.halt_reg = 0x12074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_scalar_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_scalar_fast_ahb_clk = {
+	.halt_reg = 0x1208c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1208c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_scalar_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_tmc_clk = {
+	.halt_reg = 0x12090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_tmc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_0_tmc_fast_ahb_clk = {
+	.halt_reg = 0x120a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x120a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_0_tmc_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_main_clk = {
+	.halt_reg = 0x120f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x120f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_main_fast_ahb_clk = {
+	.halt_reg = 0x12118,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12118,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_pcp_clk = {
+	.halt_reg = 0x1211c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1211c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_pcp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_pcp_fast_ahb_clk = {
+	.halt_reg = 0x12134,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12134,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_pcp_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_scalar_clk = {
+	.halt_reg = 0x12138,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12138,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_scalar_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_scalar_fast_ahb_clk = {
+	.halt_reg = 0x12150,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12150,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_scalar_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_tmc_clk = {
+	.halt_reg = 0x12154,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12154,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_tmc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_1_tmc_fast_ahb_clk = {
+	.halt_reg = 0x1216c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1216c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_1_tmc_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_main_clk = {
+	.halt_reg = 0x121a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_main_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_main_fast_ahb_clk = {
+	.halt_reg = 0x121c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_main_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_pcp_clk = {
+	.halt_reg = 0x121c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_pcp_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_pcp_fast_ahb_clk = {
+	.halt_reg = 0x121e0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_pcp_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_scalar_clk = {
+	.halt_reg = 0x121e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_scalar_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_scalar_fast_ahb_clk = {
+	.halt_reg = 0x121fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_scalar_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_tmc_clk = {
+	.halt_reg = 0x12200,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12200,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_tmc_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_2_tmc_fast_ahb_clk = {
+	.halt_reg = 0x12218,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12218,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_2_tmc_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_ahb_clk = {
+	.halt_reg = 0x13054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_clk = {
+	.halt_reg = 0x1301c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1301c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_cphy_rx_clk = {
+	.halt_reg = 0x13050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13050,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_cphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ife_lite_csid_clk = {
+	.halt_reg = 0x1303c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1303c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ife_lite_csid_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_csid_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_ahb_clk = {
+	.halt_reg = 0x11054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11054,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_clk = {
+	.halt_reg = 0x11034,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11034,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_0_fast_ahb_clk = {
+	.halt_reg = 0x11058,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_0_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_1_ahb_clk = {
+	.halt_reg = 0x110b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_1_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_1_clk = {
+	.halt_reg = 0x11090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_ipe_1_fast_ahb_clk = {
+	.halt_reg = 0x110b4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_ipe_1_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_clk = {
+	.halt_reg = 0x13348,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13348,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qdss_debug_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qdss_debug_xo_clk = {
+	.halt_reg = 0x1334c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1334c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qdss_debug_xo_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_xo_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qup_ahbm_clk = {
+	.halt_reg = 0x13300,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13300,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qup_ahbm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qup_ahbm_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qup_core_2x_clk = {
+	.halt_reg = 0x132b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x132b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qup_core_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qup_core_2x_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qup_core_clk = {
+	.halt_reg = 0x132d0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x132d0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qup_core_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qup_core_2x_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_qup_se_clk = {
+	.halt_reg = 0x13320,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13320,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_qup_se_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qup_se_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sfe_lite_0_clk = {
+	.halt_reg = 0x1305c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1305c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sfe_lite_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sfe_lite_0_fast_ahb_clk = {
+	.halt_reg = 0x1306c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1306c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sfe_lite_0_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sfe_lite_1_clk = {
+	.halt_reg = 0x13074,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13074,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sfe_lite_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sfe_lite_1_fast_ahb_clk = {
+	.halt_reg = 0x13084,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13084,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sfe_lite_1_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sfe_lite_2_clk = {
+	.halt_reg = 0x1308c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1308c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sfe_lite_2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sfe_lite_2_fast_ahb_clk = {
+	.halt_reg = 0x1309c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1309c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sfe_lite_2_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_sm_obs_clk = {
+	.halt_reg = 0x1401c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1401c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_sm_obs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ahb_clk = {
+	.halt_reg = 0x131b0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x131b0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_slow_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_fast_ahb_clk = {
+	.halt_reg = 0x131c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x131c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_fast_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_fast_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ife_0_clk = {
+	.halt_reg = 0x12048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ife_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ife_1_clk = {
+	.halt_reg = 0x1210c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1210c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ife_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ife_2_clk = {
+	.halt_reg = 0x121b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x121b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ife_2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ife_lite_clk = {
+	.halt_reg = 0x13020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ife_lite_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_lite_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ipe_0_clk = {
+	.halt_reg = 0x11048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11048,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ipe_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_ipe_1_clk = {
+	.halt_reg = 0x110a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x110a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_ipe_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ipe_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_qup_ahbm_clk = {
+	.halt_reg = 0x13304,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13304,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_qup_ahbm_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_qup_ahbm_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_sfe_lite_0_clk = {
+	.halt_reg = 0x13060,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13060,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_sfe_lite_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_0_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_sfe_lite_1_clk = {
+	.halt_reg = 0x13078,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13078,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_sfe_lite_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_1_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_top_sfe_lite_2_clk = {
+	.halt_reg = 0x13090,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13090,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_top_sfe_lite_2_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_ife_2_main_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch cam_cc_tpg_csiphy_rx_clk = {
+	.halt_reg = 0x100b8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x100b8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "cam_cc_tpg_csiphy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cam_cc_cphy_rx_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc cam_cc_titan_top_gdsc = {
+	.gdscr = 0x13350,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_titan_top_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ife_0_gdsc = {
+	.gdscr = 0x12004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ife_0_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ife_1_gdsc = {
+	.gdscr = 0x120c8,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ife_1_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ife_2_gdsc = {
+	.gdscr = 0x12174,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ife_2_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ipe_0_gdsc = {
+	.gdscr = 0x11004,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ipe_0_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc cam_cc_ipe_1_gdsc = {
+	.gdscr = 0x11060,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
+	.pd = {
+		.name = "cam_cc_ipe_1_gdsc",
+	},
+	.parent = &cam_cc_titan_top_gdsc.pd,
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *cam_cc_nord_clocks[] = {
+	[CAM_CC_CAMNOC_DCD_XO_CLK] = &cam_cc_camnoc_dcd_xo_clk.clkr,
+	[CAM_CC_CAMNOC_NRT_AXI_CLK] = &cam_cc_camnoc_nrt_axi_clk.clkr,
+	[CAM_CC_CAMNOC_RT_AXI_CLK] = &cam_cc_camnoc_rt_axi_clk.clkr,
+	[CAM_CC_CAMNOC_RT_AXI_CLK_SRC] = &cam_cc_camnoc_rt_axi_clk_src.clkr,
+	[CAM_CC_CCI_0_CLK] = &cam_cc_cci_0_clk.clkr,
+	[CAM_CC_CCI_0_CLK_SRC] = &cam_cc_cci_0_clk_src.clkr,
+	[CAM_CC_CCI_1_CLK] = &cam_cc_cci_1_clk.clkr,
+	[CAM_CC_CCI_1_CLK_SRC] = &cam_cc_cci_1_clk_src.clkr,
+	[CAM_CC_CCI_2_CLK] = &cam_cc_cci_2_clk.clkr,
+	[CAM_CC_CCI_2_CLK_SRC] = &cam_cc_cci_2_clk_src.clkr,
+	[CAM_CC_CCI_3_CLK] = &cam_cc_cci_3_clk.clkr,
+	[CAM_CC_CCI_3_CLK_SRC] = &cam_cc_cci_3_clk_src.clkr,
+	[CAM_CC_CCI_4_CLK] = &cam_cc_cci_4_clk.clkr,
+	[CAM_CC_CCI_4_CLK_SRC] = &cam_cc_cci_4_clk_src.clkr,
+	[CAM_CC_CCU_FAST_AHB_CLK] = &cam_cc_ccu_fast_ahb_clk.clkr,
+	[CAM_CC_CPHY_RX_CLK_SRC] = &cam_cc_cphy_rx_clk_src.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK] = &cam_cc_csi0phytimer_clk.clkr,
+	[CAM_CC_CSI0PHYTIMER_CLK_SRC] = &cam_cc_csi0phytimer_clk_src.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK] = &cam_cc_csi1phytimer_clk.clkr,
+	[CAM_CC_CSI1PHYTIMER_CLK_SRC] = &cam_cc_csi1phytimer_clk_src.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK] = &cam_cc_csi2phytimer_clk.clkr,
+	[CAM_CC_CSI2PHYTIMER_CLK_SRC] = &cam_cc_csi2phytimer_clk_src.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK] = &cam_cc_csi3phytimer_clk.clkr,
+	[CAM_CC_CSI3PHYTIMER_CLK_SRC] = &cam_cc_csi3phytimer_clk_src.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK] = &cam_cc_csi4phytimer_clk.clkr,
+	[CAM_CC_CSI4PHYTIMER_CLK_SRC] = &cam_cc_csi4phytimer_clk_src.clkr,
+	[CAM_CC_CSID_CLK] = &cam_cc_csid_clk.clkr,
+	[CAM_CC_CSID_CLK_SRC] = &cam_cc_csid_clk_src.clkr,
+	[CAM_CC_CSID_CSIPHY_RX_CLK] = &cam_cc_csid_csiphy_rx_clk.clkr,
+	[CAM_CC_CSIPHY0_CLK] = &cam_cc_csiphy0_clk.clkr,
+	[CAM_CC_CSIPHY1_CLK] = &cam_cc_csiphy1_clk.clkr,
+	[CAM_CC_CSIPHY2_CLK] = &cam_cc_csiphy2_clk.clkr,
+	[CAM_CC_CSIPHY3_CLK] = &cam_cc_csiphy3_clk.clkr,
+	[CAM_CC_CSIPHY4_CLK] = &cam_cc_csiphy4_clk.clkr,
+	[CAM_CC_FAST_AHB_CLK_SRC] = &cam_cc_fast_ahb_clk_src.clkr,
+	[CAM_CC_ICP_0_AHB_CLK] = &cam_cc_icp_0_ahb_clk.clkr,
+	[CAM_CC_ICP_0_CLK] = &cam_cc_icp_0_clk.clkr,
+	[CAM_CC_ICP_0_CLK_SRC] = &cam_cc_icp_0_clk_src.clkr,
+	[CAM_CC_ICP_1_AHB_CLK] = &cam_cc_icp_1_ahb_clk.clkr,
+	[CAM_CC_ICP_1_CLK] = &cam_cc_icp_1_clk.clkr,
+	[CAM_CC_ICP_1_CLK_SRC] = &cam_cc_icp_1_clk_src.clkr,
+	[CAM_CC_IFE_0_MAIN_CLK] = &cam_cc_ife_0_main_clk.clkr,
+	[CAM_CC_IFE_0_MAIN_CLK_SRC] = &cam_cc_ife_0_main_clk_src.clkr,
+	[CAM_CC_IFE_0_MAIN_FAST_AHB_CLK] = &cam_cc_ife_0_main_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_0_PCP_CLK] = &cam_cc_ife_0_pcp_clk.clkr,
+	[CAM_CC_IFE_0_PCP_FAST_AHB_CLK] = &cam_cc_ife_0_pcp_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_0_SCALAR_CLK] = &cam_cc_ife_0_scalar_clk.clkr,
+	[CAM_CC_IFE_0_SCALAR_FAST_AHB_CLK] = &cam_cc_ife_0_scalar_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_0_TMC_CLK] = &cam_cc_ife_0_tmc_clk.clkr,
+	[CAM_CC_IFE_0_TMC_FAST_AHB_CLK] = &cam_cc_ife_0_tmc_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_1_MAIN_CLK] = &cam_cc_ife_1_main_clk.clkr,
+	[CAM_CC_IFE_1_MAIN_CLK_SRC] = &cam_cc_ife_1_main_clk_src.clkr,
+	[CAM_CC_IFE_1_MAIN_FAST_AHB_CLK] = &cam_cc_ife_1_main_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_1_PCP_CLK] = &cam_cc_ife_1_pcp_clk.clkr,
+	[CAM_CC_IFE_1_PCP_FAST_AHB_CLK] = &cam_cc_ife_1_pcp_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_1_SCALAR_CLK] = &cam_cc_ife_1_scalar_clk.clkr,
+	[CAM_CC_IFE_1_SCALAR_FAST_AHB_CLK] = &cam_cc_ife_1_scalar_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_1_TMC_CLK] = &cam_cc_ife_1_tmc_clk.clkr,
+	[CAM_CC_IFE_1_TMC_FAST_AHB_CLK] = &cam_cc_ife_1_tmc_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_2_MAIN_CLK] = &cam_cc_ife_2_main_clk.clkr,
+	[CAM_CC_IFE_2_MAIN_CLK_SRC] = &cam_cc_ife_2_main_clk_src.clkr,
+	[CAM_CC_IFE_2_MAIN_FAST_AHB_CLK] = &cam_cc_ife_2_main_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_2_PCP_CLK] = &cam_cc_ife_2_pcp_clk.clkr,
+	[CAM_CC_IFE_2_PCP_FAST_AHB_CLK] = &cam_cc_ife_2_pcp_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_2_SCALAR_CLK] = &cam_cc_ife_2_scalar_clk.clkr,
+	[CAM_CC_IFE_2_SCALAR_FAST_AHB_CLK] = &cam_cc_ife_2_scalar_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_2_TMC_CLK] = &cam_cc_ife_2_tmc_clk.clkr,
+	[CAM_CC_IFE_2_TMC_FAST_AHB_CLK] = &cam_cc_ife_2_tmc_fast_ahb_clk.clkr,
+	[CAM_CC_IFE_LITE_AHB_CLK] = &cam_cc_ife_lite_ahb_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK] = &cam_cc_ife_lite_clk.clkr,
+	[CAM_CC_IFE_LITE_CLK_SRC] = &cam_cc_ife_lite_clk_src.clkr,
+	[CAM_CC_IFE_LITE_CPHY_RX_CLK] = &cam_cc_ife_lite_cphy_rx_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK] = &cam_cc_ife_lite_csid_clk.clkr,
+	[CAM_CC_IFE_LITE_CSID_CLK_SRC] = &cam_cc_ife_lite_csid_clk_src.clkr,
+	[CAM_CC_IPE_0_AHB_CLK] = &cam_cc_ipe_0_ahb_clk.clkr,
+	[CAM_CC_IPE_0_CLK] = &cam_cc_ipe_0_clk.clkr,
+	[CAM_CC_IPE_0_CLK_SRC] = &cam_cc_ipe_0_clk_src.clkr,
+	[CAM_CC_IPE_0_FAST_AHB_CLK] = &cam_cc_ipe_0_fast_ahb_clk.clkr,
+	[CAM_CC_IPE_1_AHB_CLK] = &cam_cc_ipe_1_ahb_clk.clkr,
+	[CAM_CC_IPE_1_CLK] = &cam_cc_ipe_1_clk.clkr,
+	[CAM_CC_IPE_1_CLK_SRC] = &cam_cc_ipe_1_clk_src.clkr,
+	[CAM_CC_IPE_1_FAST_AHB_CLK] = &cam_cc_ipe_1_fast_ahb_clk.clkr,
+	[CAM_CC_PLL0] = &cam_cc_pll0.clkr,
+	[CAM_CC_PLL0_OUT_EVEN] = &cam_cc_pll0_out_even.clkr,
+	[CAM_CC_PLL0_OUT_ODD] = &cam_cc_pll0_out_odd.clkr,
+	[CAM_CC_PLL2] = &cam_cc_pll2.clkr,
+	[CAM_CC_PLL2_OUT_EVEN] = &cam_cc_pll2_out_even.clkr,
+	[CAM_CC_PLL3] = &cam_cc_pll3.clkr,
+	[CAM_CC_PLL3_OUT_EVEN] = &cam_cc_pll3_out_even.clkr,
+	[CAM_CC_PLL4] = &cam_cc_pll4.clkr,
+	[CAM_CC_PLL4_OUT_EVEN] = &cam_cc_pll4_out_even.clkr,
+	[CAM_CC_PLL5] = &cam_cc_pll5.clkr,
+	[CAM_CC_PLL5_OUT_EVEN] = &cam_cc_pll5_out_even.clkr,
+	[CAM_CC_PLL6] = &cam_cc_pll6.clkr,
+	[CAM_CC_PLL6_OUT_EVEN] = &cam_cc_pll6_out_even.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK] = &cam_cc_qdss_debug_clk.clkr,
+	[CAM_CC_QDSS_DEBUG_CLK_SRC] = &cam_cc_qdss_debug_clk_src.clkr,
+	[CAM_CC_QDSS_DEBUG_XO_CLK] = &cam_cc_qdss_debug_xo_clk.clkr,
+	[CAM_CC_QUP_AHBM_CLK] = &cam_cc_qup_ahbm_clk.clkr,
+	[CAM_CC_QUP_AHBM_CLK_SRC] = &cam_cc_qup_ahbm_clk_src.clkr,
+	[CAM_CC_QUP_CORE_2X_CLK] = &cam_cc_qup_core_2x_clk.clkr,
+	[CAM_CC_QUP_CORE_2X_CLK_SRC] = &cam_cc_qup_core_2x_clk_src.clkr,
+	[CAM_CC_QUP_CORE_2X_DIV_CLK_SRC] = &cam_cc_qup_core_2x_div_clk_src.clkr,
+	[CAM_CC_QUP_CORE_CLK] = &cam_cc_qup_core_clk.clkr,
+	[CAM_CC_QUP_SE_CLK] = &cam_cc_qup_se_clk.clkr,
+	[CAM_CC_QUP_SE_CLK_SRC] = &cam_cc_qup_se_clk_src.clkr,
+	[CAM_CC_SFE_LITE_0_CLK] = &cam_cc_sfe_lite_0_clk.clkr,
+	[CAM_CC_SFE_LITE_0_FAST_AHB_CLK] = &cam_cc_sfe_lite_0_fast_ahb_clk.clkr,
+	[CAM_CC_SFE_LITE_1_CLK] = &cam_cc_sfe_lite_1_clk.clkr,
+	[CAM_CC_SFE_LITE_1_FAST_AHB_CLK] = &cam_cc_sfe_lite_1_fast_ahb_clk.clkr,
+	[CAM_CC_SFE_LITE_2_CLK] = &cam_cc_sfe_lite_2_clk.clkr,
+	[CAM_CC_SFE_LITE_2_FAST_AHB_CLK] = &cam_cc_sfe_lite_2_fast_ahb_clk.clkr,
+	[CAM_CC_SLEEP_CLK_SRC] = &cam_cc_sleep_clk_src.clkr,
+	[CAM_CC_SLOW_AHB_CLK_SRC] = &cam_cc_slow_ahb_clk_src.clkr,
+	[CAM_CC_SM_OBS_CLK] = &cam_cc_sm_obs_clk.clkr,
+	[CAM_CC_TOP_AHB_CLK] = &cam_cc_top_ahb_clk.clkr,
+	[CAM_CC_TOP_FAST_AHB_CLK] = &cam_cc_top_fast_ahb_clk.clkr,
+	[CAM_CC_TOP_IFE_0_CLK] = &cam_cc_top_ife_0_clk.clkr,
+	[CAM_CC_TOP_IFE_1_CLK] = &cam_cc_top_ife_1_clk.clkr,
+	[CAM_CC_TOP_IFE_2_CLK] = &cam_cc_top_ife_2_clk.clkr,
+	[CAM_CC_TOP_IFE_LITE_CLK] = &cam_cc_top_ife_lite_clk.clkr,
+	[CAM_CC_TOP_IPE_0_CLK] = &cam_cc_top_ipe_0_clk.clkr,
+	[CAM_CC_TOP_IPE_1_CLK] = &cam_cc_top_ipe_1_clk.clkr,
+	[CAM_CC_TOP_QUP_AHBM_CLK] = &cam_cc_top_qup_ahbm_clk.clkr,
+	[CAM_CC_TOP_SFE_LITE_0_CLK] = &cam_cc_top_sfe_lite_0_clk.clkr,
+	[CAM_CC_TOP_SFE_LITE_1_CLK] = &cam_cc_top_sfe_lite_1_clk.clkr,
+	[CAM_CC_TOP_SFE_LITE_2_CLK] = &cam_cc_top_sfe_lite_2_clk.clkr,
+	[CAM_CC_TPG_CSIPHY_RX_CLK] = &cam_cc_tpg_csiphy_rx_clk.clkr,
+	[CAM_CC_XO_CLK_SRC] = &cam_cc_xo_clk_src.clkr,
+};
+
+static struct gdsc *cam_cc_nord_gdscs[] = {
+	[CAM_CC_TITAN_TOP_GDSC] = &cam_cc_titan_top_gdsc,
+	[CAM_CC_IFE_0_GDSC] = &cam_cc_ife_0_gdsc,
+	[CAM_CC_IFE_1_GDSC] = &cam_cc_ife_1_gdsc,
+	[CAM_CC_IFE_2_GDSC] = &cam_cc_ife_2_gdsc,
+	[CAM_CC_IPE_0_GDSC] = &cam_cc_ipe_0_gdsc,
+	[CAM_CC_IPE_1_GDSC] = &cam_cc_ipe_1_gdsc,
+};
+
+static const struct qcom_reset_map cam_cc_nord_resets[] = {
+	[CAM_CC_CCU_BCR] = { 0x13298 },
+	[CAM_CC_ICP_0_BCR] = { 0x130a0 },
+	[CAM_CC_ICP_1_BCR] = { 0x130d8 },
+	[CAM_CC_IFE_0_BCR] = { 0x12000 },
+	[CAM_CC_IFE_1_BCR] = { 0x120c4 },
+	[CAM_CC_IFE_2_BCR] = { 0x12170 },
+	[CAM_CC_IPE_0_BCR] = { 0x11000 },
+	[CAM_CC_IPE_1_BCR] = { 0x1105c },
+	[CAM_CC_QDSS_DEBUG_BCR] = { 0x1332c },
+	[CAM_CC_SFE_LITE_0_BCR] = { 0x13058 },
+	[CAM_CC_SFE_LITE_1_BCR] = { 0x13070 },
+	[CAM_CC_SFE_LITE_2_BCR] = { 0x13088 },
+};
+
+static struct clk_alpha_pll *cam_cc_nord_plls[] = {
+	&cam_cc_pll0,
+	&cam_cc_pll2,
+	&cam_cc_pll3,
+	&cam_cc_pll4,
+	&cam_cc_pll5,
+	&cam_cc_pll6,
+};
+
+static const u32 cam_cc_nord_critical_cbcrs[] = {
+	0x13294, /* CAM_CC_CAMNOC_XO_CLK */
+	0x13364, /* CAM_CC_CORE_AHB_CLK */
+	0x13380, /* CAM_CC_GDSC_CLK */
+	0x132e4, /* CAM_CC_QUP_SLEEP_CLK */
+	0x1339c, /* CAM_CC_SLEEP_CLK */
+};
+
+static const struct regmap_config cam_cc_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x17000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_driver_data cam_cc_nord_driver_data = {
+	.alpha_plls = cam_cc_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(cam_cc_nord_plls),
+	.clk_cbcrs = cam_cc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_nord_critical_cbcrs),
+};
+
+static const struct qcom_cc_desc cam_cc_nord_desc = {
+	.config = &cam_cc_nord_regmap_config,
+	.clks = cam_cc_nord_clocks,
+	.num_clks = ARRAY_SIZE(cam_cc_nord_clocks),
+	.resets = cam_cc_nord_resets,
+	.num_resets = ARRAY_SIZE(cam_cc_nord_resets),
+	.gdscs = cam_cc_nord_gdscs,
+	.num_gdscs = ARRAY_SIZE(cam_cc_nord_gdscs),
+	.use_rpm = true,
+	.driver_data = &cam_cc_nord_driver_data,
+};
+
+static const struct of_device_id cam_cc_nord_match_table[] = {
+	{ .compatible = "qcom,nord-camcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cam_cc_nord_match_table);
+
+static int cam_cc_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &cam_cc_nord_desc);
+}
+
+static struct platform_driver cam_cc_nord_driver = {
+	.probe = cam_cc_nord_probe,
+	.driver = {
+		.name = "camcc-nord",
+		.of_match_table = cam_cc_nord_match_table,
+	},
+};
+
+module_platform_driver(cam_cc_nord_driver);
+
+MODULE_DESCRIPTION("QTI CAMCC Nord Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


