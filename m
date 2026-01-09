Return-Path: <linux-arm-msm+bounces-88214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F3D07D24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:30:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 415F83007E5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7776C344046;
	Fri,  9 Jan 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BwDLoawG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzZ+8SK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8B22FE598
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767947435; cv=none; b=c3lqrs0XDB0lU2uT9v55TE/MRfU+4lO95B+giQGSheHAlDRq0f4EB0hZ9NjLBlBSItVCgmxbcmZlp4SuTuJ+sEkYabteoM/zMyKQ78i/APtHag3Qk/z5Wx3slAqf+K0TIBaKuN1gy5LKr94wljWwK7WE0BE5894t4sI5QGw60lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767947435; c=relaxed/simple;
	bh=47ICDv/i8JfnrPPrWxcQsA8JfO1i9z1ltS6R54IEzVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n4BYTnLV5M36w/tRqeHJNWEOW/juT3uyXVB0Xy8QufQ4y4p++3Trsm4EnukuIw35YQAQRDoqz8nxfbb0uUfoIIcMvL+A2j0Pb8Z0MRDRvpR3V2xmgLfpwABwf9Hb8TQ3SHoAINXlVu2W7qQFqw5Gy4Hw9Dd68i31RlcDjbP/zdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BwDLoawG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzZ+8SK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982Wne2183971
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=50+/gJ+IsXhBIpPLZMUP5y
	jPLB3bzvhy9frEyPnkqvY=; b=BwDLoawGDpW3Ret0vQYeleAZmT8Bm1Ra/hr2F6
	S6PhC+Zk2a1rd+wa4ZPN4zcfDuNHqxJkeJJQgQW4JdMu+eiIC0dDPw9v4i7x9DkW
	Wpt0t2wWDFEt0MgK8wkx42ForSzBn6eOAP73ER1TlGFbKeEmWs4Okt0NOdsDb8Yj
	OsGCFPSME6it8G9KH9CVmg8nBaTEC8jhPRSLniIn7Fcwfsl7oEuNkFJm3JlF//Ak
	t9FCUfSULZTgJigl5lP3pZP/gkVNBwMxFAX2UjeRNj+8tyyvEecPmzsQMBbvRrxB
	sFD/u4qB7jr8VWRPhcmNNhDhor5cb3mpjmBm3oBu6VUhwICw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn82ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:30:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b991976so98920506d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767947428; x=1768552228; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50+/gJ+IsXhBIpPLZMUP5yjPLB3bzvhy9frEyPnkqvY=;
        b=IzZ+8SK9NOnfDpWZXQxA0buSODG9J+gjVzHbMgMQYXlR4NpciSEzsUHCWvQZsmD3ax
         G/nPvYbrMxhVplISL+xZcHfFimBz2wfpiMROTjQP3Uv/58HKztGTvomtwYtvtXkFVVM5
         wXKyvwHsNZWgRQ0a9X7E4WjO/n280epYBBJFZJsgI14FxJ4xrS18CCvXJB43qNXyaRpe
         XrT2bJtq09hJhMb2IwXxo6zc0VJCO+gWt4UAYtOv7svQnojLb3LbNObGawN+ab0p2B2B
         ItoDph1JKGvu4UjwTY2LGE0k+aZklWOLiCtdk01qs4pGRJjNrUR6tjEpQcqrjeHhGfZ+
         w/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767947428; x=1768552228;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50+/gJ+IsXhBIpPLZMUP5yjPLB3bzvhy9frEyPnkqvY=;
        b=bvu4+4vnT1djKb611FpSU+WEkf9XtC0v9qm/l45pa6cfHOAWH55kybUGzxvq9cFNp5
         tLBSFZSZRhSOp3/w4waf7Jz281vI5sdvAH/rsNb4tXw2kan2hGoH/HB4pO4na0NA0Erg
         cIruBaIF18jBxN7m2C25+myX+9+g/Gq8iEepkapEiAslv5BftzuncfD57i4xh1xjRIam
         bRsKcy8WVF4kMhgklrzRCyUvlXa+f2/k74/OipqPZsdZXDmd4w1pCFvmSMsjmzvs4o4e
         Ih5tiYucXhUSR8yLGst0jMAof3gBNEv1a8YwO7OaTcmVV1MAV40pVs4i/wDFS5J9jHHp
         Ogrg==
X-Gm-Message-State: AOJu0Yx+FSHE5FC8tyVqqb2m2uzIv+gjbS2Pp7S3R2qPXwoyHlnGicVu
	aSZJ5CxMyks1spkMTPxAplAqxTJJ6I8YAWXq5JvzQzC9cLflXYUpXvRVNfgq+G9/Q1elrIbxIdf
	9vGVMAInaRGdB8dRln4ZwcS4aykhn1821rwlm1744vauKm1G55ykMyBPbEEGKMqfy5PUK
X-Gm-Gg: AY/fxX7qnDl79vD2mMbvWkFDnf0Ups1reTJyCY+/p8AZ53U0zLtnV38YAgIK689BWkc
	V6gdcNRQrj00knE3W7x+SNinPV4nOVlhY4EQHkqAEadlChCelUzqFLhh4509An6cQItmtakH57I
	ntxZnQN8USjwsVX+ETWBaMR/sQrdXKpkY3qyQgIgtJli6R9u6ue7hxLpHRsdrtBRXDUMNTDei/q
	zw6Uc1cDtok9/SpcBqSAjUWQ8n4jhF2UBoZb5z3V6ICKlasIP+gYZPCiGxg096pP5LJA4/gbe1M
	H/0eg0eVDUGHhPA1K6SwU9ab/Ch6Kd+jSpRGWDNlePWb6nL7NBXhQPc4bOlfOiSftr+R37sgNru
	V1RNoBSvz7e1sdEzjdu0stkr5ZbBJ6bD+l8EhyjTQyzJIN+bTionAlgtEiiuGV1aV+131JA0=
X-Received: by 2002:a05:6214:3b83:b0:882:6d84:ebc3 with SMTP id 6a1803df08f44-89084271257mr132321716d6.34.1767947428255;
        Fri, 09 Jan 2026 00:30:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqUkiOM/ii1556fLzkZFoM3udxFOUEW7nNFOAw+6Mm6KQoc2unZuy3WSVioTa2744hFenJzg==
X-Received: by 2002:a05:6214:3b83:b0:882:6d84:ebc3 with SMTP id 6a1803df08f44-89084271257mr132321416d6.34.1767947427725;
        Fri, 09 Jan 2026 00:30:27 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm70573926d6.8.2026.01.09.00.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:30:27 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 16:30:21 +0800
Subject: [PATCH] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJy8YGkC/yXM4QqDIBSG4VuJ83uCZlZ2KxHDjsclW+W0jY3o3
 ifr5/vx8eyQKHpK0BU7RHr75Nclh7gUgJNZbsS8zQ0lL2suuGb3x3y1IUxf1o7SaNUo7poW8j9
 Ecv7zt/rh7EjPVya3c4TRJGK4zrPfusJhRVpgLTVy47S0tURp1YicqFJKKGuzXRkYjuMHxSbvj
 acAAAA=
X-Change-ID: 20260109-klm_dpphy-8b3a95750f78
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767947425; l=3230;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=47ICDv/i8JfnrPPrWxcQsA8JfO1i9z1ltS6R54IEzVw=;
 b=RYICtqFVglOkYQB/eS59jM7kqnvciulHlc6ribtwEnbWnBHhu4+D9D9NLdIp/Y785NqgdaIXA
 eGf43a9Plw3AN/9B3ZD0+TPYq8oWbKjaX7ldA93OyspSUZY6fEwYay7
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: vbIWCpYX5uvYswBqlqqphG_EkO82hlsg
X-Proofpoint-ORIG-GUID: vbIWCpYX5uvYswBqlqqphG_EkO82hlsg
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960bca5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pSICJWmwak5-Gv9eA8IA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1OSBTYWx0ZWRfX/NPrwZRvmfsP
 l8UB9NG3iIlsgvEUnPgLujJQmUK+1/53xFmgyPQOdSh5ZVkFjU2CbZUdXZAcS2hWwpoQPsvtNJY
 2qa0vC9R4uKFrXKlEF8oK6wvdV8CPUuXCmoJHFLJVOw8XQ0CeOEpEPzGeXPx7vxQ29vuWeqHu7A
 ZppbEJdlAGNUTbwWS2fts9Zke00lQRNwLoowfl4xPBna8XE10vPo1W1y7wj1j2jj1H67zR/r/Ij
 7vRqwLmWkFIufqR3n2te7XRPZGpYPrtzhseR53N5mhIvcjwbUoMNyqzsaHWXIqB7lxk9k+Vv5SK
 UYmpWK/zHkdZLPiQKZB4wP0nxfSjvbtrgpZyGLmKjH6UgIx6Rivv28UjYzy+T3iLyIuj6wnRxiu
 ADHtqlZ8VG3sz4ro8fr7RBLtaiJRGgvr9EarQSoX+phRW+Y24d02hgs1YZ7zytORUpLFCkyZ5lO
 7Fz5I2SH/bf4KZxxzTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090059

Currently, the LeMans/Monaco DP PHY operates in DP mode rather than eDP
mode. Per the PHY HPG, the Swing and Emphasis settings have been corrected
to the appropriate DP-mode values.

Additionally, the HPG specifies that the LDO value should be set to 0 when
in DP mode. These misconfigurations can lead to link training failures on
certain dongles.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 13feab99feec..5b0d774bd715 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -122,6 +122,13 @@ static const u8 dp_swing_hbr_rbr[4][4] = {
 	{ 0x1f, 0xff, 0xff, 0xff }
 };
 
+static const u8 dp_swing_hbr_rbr_v1[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
 static const u8 dp_pre_emp_hbr_rbr[4][4] = {
 	{ 0x00, 0x0d, 0x14, 0x1a },
 	{ 0x00, 0x0e, 0x15, 0xff },
@@ -129,6 +136,13 @@ static const u8 dp_pre_emp_hbr_rbr[4][4] = {
 	{ 0x03, 0xff, 0xff, 0xff }
 };
 
+static const u8 dp_pre_emp_hbr_rbr_v1[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff }
+};
+
 static const u8 dp_swing_hbr2_hbr3[4][4] = {
 	{ 0x02, 0x12, 0x16, 0x1a },
 	{ 0x09, 0x19, 0x1f, 0xff },
@@ -150,6 +164,13 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
 };
 
+static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v1 = {
+	.swing_hbr_rbr = &dp_swing_hbr_rbr_v1,
+	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v1,
+	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
+};
+
 static const u8 edp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x0d, 0x16, 0x1e, 0xff },
@@ -321,7 +342,7 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	if (swing == 0xff || emph == 0xff)
 		return -EINVAL;
 
-	ldo_config = edp->is_edp ? 0x0 : 0x1;
+	ldo_config = !edp->is_edp ? 0x0 : 0x1;
 
 	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
 	writel(swing, edp->tx0 + TXn_TX_DRV_LVL);
@@ -564,7 +585,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v1,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -962,7 +983,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (edp->cfg->swing_pre_emph_cfg && edp->is_edp)
 		ldo_config = 0x1;
 
 	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);

---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260109-klm_dpphy-8b3a95750f78

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


