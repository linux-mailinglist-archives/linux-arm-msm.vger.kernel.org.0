Return-Path: <linux-arm-msm+bounces-115770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TLg1MSVHRWrP9woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:58:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD916F0104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:58:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fiTukh4w;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MIfjNZHh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115770-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115770-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 618EB30EBEB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49A03812EC;
	Wed,  1 Jul 2026 16:51:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB29374A16
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:51:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924697; cv=none; b=EiOS5u25wjXPX/y0iw85vh8tucGMqaiYr7TrPJIA4sgS9MLN/COEVhBSXmmDq4PukANqdsQOZ7Vxu0wbfoJt7UMK2QqWMID+hsyKtNho2fnb+uSbZ2RlXLE54ELnB+rrrmkXJg+IDfKwTR77Lbmb6Ql0tOyATOQyCZNAD5aEyuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924697; c=relaxed/simple;
	bh=pbtAlqAtciPyZLApsIuSzsmZ5up6NekgbBPTk2/K2mY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=o5TyH5+frPZoQjh4IfV4V9GdXPLHqorWzuuD8Ad+dbhfStD5pdo+Q8ikh6xxgDXr551RnGQNOpxAjz2tnHtJphqgXNcE46gB3EFmxm2gJHPkXghpsv9FDypG1HYnoQSIN5XeoYhGM+k1uTZrJKc5U3dANENPyQZbvJCCVPb6FeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiTukh4w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIfjNZHh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661GmWBE1712805
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DySryhhOCAk
	VsOqghjH6N3boVFZ/zvc1535VchMsR3A=; b=fiTukh4wumIPlge6T03oChYnj7c
	d0WpmggZ/4aSE8knBLoWRIKVBxrO0VyEoCBQKnpoll9yAhom7ANxhc5Q2tfHAkhq
	1wXBmCUIuHjmCMN6bfNc+0Lbpmm3+FLvPJ80bLjMjXuNXO+M0PFPGdrvoxaCAs/U
	0JLoTXOgLwS5zGzc4NvGCGCxPa5IX3sQHhg5SD6TCBulHbu1Esl3eVBFVIrw2eTV
	ak7TkmFl9vf7AA0585UQ4CmGev/E9FQTKGC870peffjMsZdHq6ogMkk4pDnbMFqG
	h3y4MgXBJqgKyA9mmiGmxjSzWvKyhvoiBXh1tWlOo0Mkx+lyhoiWyFhElmQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1py1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:51:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37fc66ee6a4so1200191a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782924695; x=1783529495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DySryhhOCAkVsOqghjH6N3boVFZ/zvc1535VchMsR3A=;
        b=MIfjNZHh85Oq5Pz+az5Tk4WG2f7OkkNeX1xxmgUZ0/CQx8/SK0iVAWFK0zcXtXlQEG
         eI/6bpV1C9xFTLsVNHTnx31XdBdz3K33oZh2vFtUT3Q5n/RrRIL28aWK7iy+Pdo5YHFo
         I9I5HCgCp2f2XH/7r50Y9pzotA68T5P0U5WviseZx/MnU033WYtHtKc/qU04VtpBD1Kw
         P87yFB+r88stV+YV5KAFNaDqSAa4BSvJ7W3yWZZfJYUuxBGZMf+ADn2VBNbV+y58rXKR
         GyjdrUp5xh3plp+QjdpPQ6a2vo1pI63uhNq8pSYbyZ3WxP1fRLacXruUaiGNvOFgn3Ak
         AbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924695; x=1783529495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DySryhhOCAkVsOqghjH6N3boVFZ/zvc1535VchMsR3A=;
        b=mrrMI+ssDFW47ngEAl0qUeJaB/cExl4GvFljpYAg6CFY+REXO8PjMOVKyj+SqZLR90
         iAAiDMh2uJfs1PtSNB+uFL9UteaAzoBD2UeHnCgipgZtPYaTEYPdmMMYFT6ZuWJTwMaI
         rF0qWs/5zbVtbBdownQbnpmlqxCg8zfczCm+r2himigO1j3GLiJ7VtkosSJZb1gyptD+
         AEVO4MpYiCcTAy3Mx8eAcVb/KLXothG8rJVV/ug3pVT38jjxN2fOEV2pZHkDlpHVpItG
         CSJcLKzEFVRia+9ruK3E7JYeXUhlb6ltowR5THLAzytZ+4MgAku1mR26XLOhbkUsUgPV
         GeUg==
X-Gm-Message-State: AOJu0YzfSSiShahnAiQmtQcaJaE/WOEQXMRsoROb3AjKicqEofgvMYrh
	jF8paTJzU2FSZpXgxmlNb5718l73YyCeGA1lJeKbt6TgdUIQ00qcQRxdCC4qWLSipcS8O6yHao1
	ksCsMnUGfRl3sMUqdpEeeTgWjlpA7XhRu/2SAPimJV9b22JqaAchpVxQc/sJgiaXFUpPT
X-Gm-Gg: AfdE7cn1Afs6wxmE1/fNUMJNGf2jCjNwVH3BJp4m58mx7Ga42ui+WEaPPRt2N5nQqdR
	ajcKIuq1J4sz1AWoiAQC40uc+gTIOvM5LAMMgTGGwNW2en84wLMbDm+7IKm2fhW+avM1ROKw2vv
	CJoDwKdEbr5NBRzFPt4LvJbBKxAZfpO32bEFWlqe5diaNf2Zm/6LKnUCtdFh3so+FR3SOYbfR2y
	KBrqbG4Gwgh1I2lWud/lwYm5l7Su+0NT2Y2UNrRj869un/+LCqfCo4Vw90VubqhlZcGlEfFAcy+
	vxSq0vcwW2dfOr70XN9zf9Qy+Lw743ctUIZy3nLNVwZ57l0dvYeYc1HI5ThbMP4Wn3IrkN+dZnJ
	tftCJ8QSwBjiD3228FOH5e1VvsTtgjetjqfJkI/NokwYYmK1WoXsT8e43/oBZFyuerkaGmu0/Wg
	P93f+t
X-Received: by 2002:a17:90b:548b:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-380baa971aemr1557097a91.33.1782924694831;
        Wed, 01 Jul 2026 09:51:34 -0700 (PDT)
X-Received: by 2002:a17:90b:548b:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-380baa971aemr1557050a91.33.1782924694380;
        Wed, 01 Jul 2026 09:51:34 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee317095dsm33038935eec.15.2026.07.01.09.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:51:33 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 4/4] phy: qcom: qmp-usbc: Add qmp configuration for Shikra
Date: Wed,  1 Jul 2026 22:20:51 +0530
Message-Id: <20260701165051.4122259-5-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
References: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a454597 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=BrUXx0GcgBZ9W2fV7PIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cn81jzwXKe-SbRKKT6oNNjJQaRay5sKr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX+JPqHd2lIAs6
 bJCsmL3qQQ30dW91zO1MLBXgyVHB4NekhO7AIDPBGd70hQSnCHiG4ymZkB/b7JNNNv6DJ6TuKCn
 pbqvwuyObq5ZXKnToMaJpDwFY9zmw9g=
X-Proofpoint-GUID: cn81jzwXKe-SbRKKT6oNNjJQaRay5sKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3OCBTYWx0ZWRfX6OjLzr8kq8vR
 2EP9ggRPkZvVCbVlgdY2d3BK7KQP4I9wj5Y/tY/uaL03Rs3Fqs7+hEUkjkT+tcEcm/cEi2O0gwT
 DYj8aVYdwK7cfm2NBYfb1wJ0D2X+fQiDy72/lS14LxNGrxeWM/Qq15hbxzHU8/gKDQv7hUaTgWr
 wV041rxZK/DGU1lMcpz7fFX7N+kXSKc67mq2jkqwTYR9+7hnNoAlvaLStWdb/b/JDANyWKygRJt
 GEd9rgJcz33a85yp6vM7xtM1Es95WKxpgTyPT1fW7xYTwjvq/F+5LzvFMUXEEpvUP89x1i63siq
 KVjfqIFLBvI71zV5MMWkWPCtzjbQjOZuvz7PyBS9LsEUIchKCxkBPfX7w4hEpbEc3cCuk3ctca3
 9bGYzvaZMlgYo9oRoeMR2/2DOAtG5/SGpsUjzwBD+wQRuZSFTcJDXRiuZXuNuk9xilRTv32vHuS
 po3JMS9y9v84sjBHl2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010178
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115770-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:xiangxu.yin@oss.qualcomm.com,m:johan+linaro@kernel.org,m:loic.poulain@oss.qualcomm.com,m:shengchao.guo@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AD916F0104

Add init sequence and phy configuration for the Super Speed port on Shikra
SoC. Also since Shikra uses 3 resets, add support for the third reset and
configure Shikra platform data to use 3 resets.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 53 ++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index ab3055bb5b0c..fa8492b487d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -512,10 +512,14 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-static const char * const usb3dpphy_reset_l[] = {
+static const char * const qcs615_usb3dpphy_reset_l[] = {
 	"phy_phy", "dp_phy",
 };
 
+static const char * const shikra_usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy", "phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -680,8 +684,48 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
 	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
 
-	.reset_list		= usb3dpphy_reset_l,
-	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.reset_list		= qcs615_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(qcs615_usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
+};
+
+static const struct qmp_phy_cfg shikra_usb3dp_phy_cfg = {
+	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+
+	.dp_serdes_tbl		= qcs615_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qcs615_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qcs615_dp_pre_emphasis_hbr2_rbr,
+
+	.dp_aux_init		= qcs615_qmp_dp_aux_init,
+	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
+	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
+	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
+
+	.reset_list		= shikra_usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(shikra_usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
@@ -2019,6 +2063,9 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,shikra-qmp-usb3-dp-phy",
+		.data =  &shikra_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
 		.data = &qcm2290_usb3phy_cfg,
-- 
2.34.1


