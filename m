Return-Path: <linux-arm-msm+bounces-105361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKElJDBD82kMzAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:55:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EDF4A26EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 13:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82F5030461A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 11:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37AAB40627A;
	Thu, 30 Apr 2026 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTCq+PRP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBgjVwnc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C07402BAF
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550013; cv=none; b=A24w3vkeIB+hjWad6uwGj+H9ozHqLEFcVOFv0NxkBsq2Z89yuhQXHrR7xNl5UuMQY121KQ7USHVjAy2OP7y3cv5qVfyZUxT5ial194eQ/4YWBWijL4uXRwsWP74bHFq8fXiwbLkxVe4/qGX8ntmsBcXYxVAwlBO38hgpGI843X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550013; c=relaxed/simple;
	bh=glAUnslPhbMwD/sFXe6BFap3FDs/pmoREZOqlEys1Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMNeD8rETdD117WxIeqzSXk3U/iP8VnBPxSJBg09Mricwcf1l0k//Z1bqpA9bZ/hH/rXG9bIbbxI4MO3NfgvKJcMAU/u+5FrslC7UwqsQ9EZzjsGWf83+g64vhNwnNGEFxRZDY6FRpwlsC9bl4qNfWSiiL5qjIF/2mtbqPTT/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTCq+PRP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBgjVwnc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UAFnXQ3730733
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=; b=WTCq+PRPVkeGHc5N
	4E4YFwhZCC0aLpYfOjyVEUbQEHg4rQWAKmu7GvjtrC/AovOiaqGNA3bDkECWOBh/
	hxMro0KI/hrFLS+/UGbqtoJrrWbqv1TGw4FnFIqH2KYg/wkqfHYMgfS9zF1F87oR
	TeIvfzYDJWQr3ZdUE4FgoCHIZVUA80muLmW6zI913AdVvb1PiyRzPXRHNfd5yX6f
	chZGN1ts+LtfC4CutHifXQDTshoZ8u+4b7YQs+0wAYWIMVtce6q2LATQ9GSWmhmM
	a0eRGkz0EzCTsDrYq6qhhPnIUY4AduhGEeRhpoBsEFaw1k6CrMTHibxYBLyeWVub
	eYHbhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w9xk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 11:53:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so9188935ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 04:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777550007; x=1778154807; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=;
        b=DBgjVwnc4c+VfQLFSNon+idN4tPdDGfCzr4mBRDO8vhal00dFC9oi9o6XPi0Ruymgy
         msF+i1PdAtz8GMVZpO28eXQniAmuZEY6hVhKpfIZJ+ZiZrwujcp/Ytda5aZ5E6iKaD9k
         wKQ9RR32+yDMdJ542Z0RTfrfcMVMr0OimDiqb65PPmSnpl5Norw+E3oBeyN64nIszSX0
         DR3mb+H+3/tVSM3LVTM2ynjGGASWsHXk+7ylR/ntQwOE5pHL2O5Hus/ieNmkp9k9/fZD
         NOMTZeNk/kqKoykwK1KkfIKiXjC+37pKIe8Bar8T2zBujrx8zC7KepGZDcITxKR7pWaD
         dIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550007; x=1778154807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ps5zXr8KvxD7La8ND/9uOCAL3O/rduP00pOV5kPiIIU=;
        b=e7ucgqdTVw/JvrEhfbSKrrOZlAcuf3tnR23Xj3KfPbSJGwNeeZZ5Xdvz6YqPv9O1bT
         R6D3ya9uhkcJNw5VxN6LTTT5mWu4NgxE0QsIF3X7r0w1jdM8tUJ4vEikvEuFWvzvUTp5
         U50DhHF7xu+Mo2cvvwoGcX3qkx9oAOzqxrzDxZusWLft5iFtAdQANeNcuFgo8xgc3P03
         xmgjxQZRgIOqRIXMJsvnE8eWfu4I1P2pW+CMJXg4ebcVkNGYrCrCGwkOSA+Z5fu/zR4s
         YAd6theLoThpby1DgJS4ZTT92euqO0szBHw9Upisl1xUY9IFBf8KoBtdxQjU51xohQyb
         90Lw==
X-Gm-Message-State: AOJu0YwCZPpkxNWulr6FnI1ArpEOcnBikSUw+SkJa9NjnyuMheD3ffNM
	Wqbaj0BfhrXh+vVPaavNJ7/9TyWrE9ntdSBufXoZoJSlYRDh5eVRFaMdqsSLsyefGgUZMnMjEJT
	1yyylqo5zcnb9JUNzSo1LlF07bGYfsUz7K4NlMmpdEfpdywT0/Kl6GLcsyDBTQTisoivW
X-Gm-Gg: AeBDiet5v1C9JC+A0fHLeAYJ/U8DFOQjEn34B7sJx2L7xcmZuyiEof00GGszbLARECs
	qJpiHArm69ePii5LNN5YoHbsUq+fpl+h4VXAFtG/PPC5AAoWQe5ATJ+PWevspbsHsGxGLrptunk
	rAva3LZ/DMBUGdkvgN3ycJyEq4mzd4kcu074EKF5nvIrNqVUaAhTux0EEaoa7+Kz7CcAzKyEvJT
	TQA5kS7LSQIiEyDaiSWOkjcLCaLPH9nls76h94UHEoJPtrAF1rJgB1eVvLPrWeJNTC93o5RBvLo
	MCCN0F03jSisB4GGJaNrndQdsWs8/FTQ5BGnadhmaHcpHu8PmLfUWJhghJr5nZWKnkUFYcuEKNk
	Eyv2S41zgi9OZ9xteyqYTliYcopfutf5l8UXtzW4+0SNFdWI=
X-Received: by 2002:a17:902:bd04:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b9a2345232mr18800185ad.15.1777550007304;
        Thu, 30 Apr 2026 04:53:27 -0700 (PDT)
X-Received: by 2002:a17:902:bd04:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b9a2345232mr18800005ad.15.1777550006729;
        Thu, 30 Apr 2026 04:53:26 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b988971138sm53834955ad.70.2026.04.30.04.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:53:26 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 17:20:29 +0530
Subject: [PATCH 4/5] phy: qcom-qusb2: Add support for Shikra
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-shikra-usb-v1-4-c9c108536fdc@oss.qualcomm.com>
References: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
In-Reply-To: <20260430-shikra-usb-v1-0-c9c108536fdc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777549983; l=1446;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=z9a9ilodfoaZe6rWbutpepb+HOnjBSdkp1kFi8ZpYi4=;
 b=IOE9Vdz9TdJzaNgyiwXdVYxmmFDYF9VHTqzy5dEJC1AehxKvn7ZNiOEZ5b8sjuLAwE7dJ9Yr2
 RkKC9X1+cFGAHVfnRoo/InDVj7ljVl1kbIEcjeZVigHOKnB1Ht82W38
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: aeaZ3Soe5MLQayS-dIKcrhRYPh9cVs1V
X-Proofpoint-ORIG-GUID: aeaZ3Soe5MLQayS-dIKcrhRYPh9cVs1V
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f342b8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2jleMYo8EjVMK2M3yooA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDEyMCBTYWx0ZWRfXyNb4hBwCpo0w
 sEfwsu9mGb0pesHoBpBnzrOkqbiLwXKw5Iv8jH8oUVic9/03zGBrICw6UiTQKbc51w+2GlwWVw2
 smhAUDVP2udwpgZsy+S/2ZHBlXU5bpVYgL7oXRpo/1abPxFIeLwYWw5h4q4i1m/DAwJVye1szt2
 QqaMoqjq3QCWPHq1PG6uItjcd58tk5cbfuhS1rXrvvFr6VCf1DrJ4GktousZ9S8HjUX3rBWFv0x
 dkmG6GiSBwuJsaSFuYyrUMwGiokoG5Tra9Ld0gVQvBWNRjdLBUjKWCjdwkBiaran6J3q4Jxz3O3
 1GUno+mTdg5c1ayhQm/vUQvwm9oQLbJ/7bcIZbtolAPNwOkE+Rb1aAYvmcvTPmPZrJrsBzF/gG5
 OnNGIiaF8Ztxithm68lw9rdDfZ0YMvFE8qa4G3xhmJgcOAwq5RC+Z/ax6imvpjiMQP2M80/BU8i
 gku9b7LGf3v28zpAOSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300120
X-Rspamd-Queue-Id: 19EDF4A26EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105361-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,

-- 
2.34.1


