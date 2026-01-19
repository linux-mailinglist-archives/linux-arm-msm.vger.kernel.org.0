Return-Path: <linux-arm-msm+bounces-89664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C3D3A92A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5F1A30B3C1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561FE35B149;
	Mon, 19 Jan 2026 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2KqMNYs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVsKsmy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC16131281C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826258; cv=none; b=pC8IqPk9pDWRjFpQ9btF8Jr7cf5OACRlXAAUU2gr5z3aRC7n6vUWW6BDiehcPJa6s7UfYR0Id4E80I0rjg0sukSVcI0eL29fR3l28l+2dzDp51LabLMwR7q6gcgjp4PIcUSsEgS0o1PZmF94u9mHY9odlFH5XWAyUZH2UvGo0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826258; c=relaxed/simple;
	bh=NZRyf1dFwiNbqdkWNPc6DEipJCrOLZWSeo1BDrPkkl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=acWdijWGnlL+wEhNfZFgFcuAGgeRMtokkzvhWHXYMYyEry+aWgFaX5ik0QgWzOrLQ+hME/+ChE62V4HJocPPktlKySXpayB2NHZJ3F1VpcfwkWB5VOzu83AQyxPEdQCpUk2XtlxcgtMRsRZhjNr2Xr+scqIs0vmI0zE5AyxThcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2KqMNYs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVsKsmy4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90mES1904969
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8WVBmlebpTLAZoV1cZHD41
	7RyW/bIktDE2JF6nvOrdE=; b=F2KqMNYsUuDCAOq9KxMptzTFKnmdpV+LzneO7f
	/w8EB6YSu7VocmDITh/bnh2WhSbYTvk3LK8H1zO45DdcRwgPD0qwQumUUVXDaEWk
	20GtlCwBOMj7v//N9vmW57zck+yxky1O+8pNex6pxeHYw/ODd8oNBudOa2oPEXNv
	KWK3gldCFZqWshiB1/S6YTUHKeNyw4awQQWb7IiInZAHUBI6IDOWL+jwywPWYSpk
	xWIanih7UVgJJgJJtyo7kcpm5AlFC49Qlob8nFWbLPcEfOmAu6QRfhuO6rRJA1m2
	ZpJzJnBjjn4YJi/YsX847oKs8chxarPIBeQLTO2PydjnMW0g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgmu8wb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 12:37:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014c9ee70bso113150551cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 04:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768826255; x=1769431055; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WVBmlebpTLAZoV1cZHD417RyW/bIktDE2JF6nvOrdE=;
        b=aVsKsmy4VUTZ1rAqwi7k+vAuRXsN5nrrUSbBnVjPKCFgEHXfjioV9gOBkxRE7PCyju
         J+f5kNCD43arOAdF/rPuYD1PC34cN8au/q9Qi1tq1kpprrEhLuIsdDEcldY+pVNCVpIl
         G2GrRRF+N8Ugu+Jn1OTi5jh5ZXyZ5RzmI534R5X/lsBCHba1Pst+e/ANBu3E8Rb5JMH/
         jsk+OWHlVtnhS5nvuRTBRDJLSzboQHr27uwGlCrduS8RFcPZMDiKwOGmTlxZC3u4J7R6
         QmSTdhMYI0hYFJ4rB75zfm5U3CeZBECQRAClDOBHwnVmQGPlASx1uRf3m2Tb9+22dmmI
         RzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826255; x=1769431055;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8WVBmlebpTLAZoV1cZHD417RyW/bIktDE2JF6nvOrdE=;
        b=Porms7V7O/F4/GbKQAdCtFBHocMlNFLmLeVi8aGzebG+GhD4T/pGia0jzz4P9xeeXn
         bGy/S7GNZpYBCL/6kZuQvUgcvXTtiobB0nFHTJ7eFcTHN4zr/iBlSykKcNZuIV4dVgYf
         Wqrp3En3VKT0IF/zHTD39XiwN8EO9rSmAstuZqC2ynOKQS4bUrQ6U3mGrKcu4iaxV0b+
         iLUvvi14T+g4OJgpCS6k/Wcji1HF3UtX3PBQ6gfEIH+3qMjq1bm+893dYY4fuVTaDri0
         1X4Z0mOFVcbpegmREps2rd0Ewm9wTgK60sU6k+JOLTCOa3DBhlkFa3vKVioaPSxR5NIS
         FFzg==
X-Gm-Message-State: AOJu0YxJn64Z3owkd5hGYOkWw5xpD0vZfdMJ5JugjeZbtne5Ns0IlLy+
	7QqAn/czlhu6dKqW+dA5T2p9uAeE6/i/WpoKfiRclns7QPMWnVKDfAQHs20+U2JUHus5DeqzNCU
	dbcygx7Asekaq7+1HEl95Lel9D7CC7Wtjx4q8AZR/CZe/4BmFVbUswW/7hxIedYO4nbvg
X-Gm-Gg: AY/fxX5p/pOCpBjDdLSIngy0/j4Xuxz35M39lzevpZGzKEZYJiXg0IHYl6BkmFsfnea
	J4jrR7nLTuvzYZG0/aw0cJO6Ng1y8smGltGBOMniXIEprmJn/SiP+j/n7XjyxeMYWxU/1Ft+VKz
	6hkxV94TsGVs/JT9ALx+uUB3pXttmONvDl0j2gCbgqtvCqDOtyyS/UYR/rwvFeSyQwqGHCdN8lR
	O4dxJSCC68usySQvJEE61ACB1TfNl4+RWNDYaGdV4zhghjSBvLRosjzjPPSgxnI3Yi9k7Aqg53v
	AWjH7/y8cIERzcCGwvMiWU4jRfJqQbxIgW8SUpB/UdbvzpPLMrnOgRKnqE2bPPnx/7wOZk1OdYt
	ICMnS3u/6A42o+dzxgYHvNqVvpmFa1CCCTLcRm4K0GcLEuS95JvzJqLUIJko6BFrg0l3OssI=
X-Received: by 2002:ac8:5a93:0:b0:501:4c41:989f with SMTP id d75a77b69052e-502a1f89b69mr142296121cf.69.1768826255027;
        Mon, 19 Jan 2026 04:37:35 -0800 (PST)
X-Received: by 2002:ac8:5a93:0:b0:501:4c41:989f with SMTP id d75a77b69052e-502a1f89b69mr142295821cf.69.1768826254457;
        Mon, 19 Jan 2026 04:37:34 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1f228d7sm74133531cf.35.2026.01.19.04.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:37:34 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 20:37:20 +0800
Subject: [PATCH v2] drm/msm/dp: Correct LeMans/Monaco DP phy Swing/Emphasis
 setting
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-klm_dpphy-v2-1-52252190940b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH8lbmkC/22Oyw6CMBBFf4XM2pqW0kJd+R/GmD4GaRSKLRKN4
 d+tsHVzk3MzOXM/kDB6THAoPhBx9smHIUO5K8B2ergi8S4zlLSUlFFFbvf+4saxe5PGcK1ELWh
 bN5Dvx4itf62u03njiI9nVk5bCUYnJDb0vZ8ORWsrVMxKrizVreJOcsudMJYiVkIw4Vx2Vxp+r
 s6nKcT3OnNmq+zPopkRRrQ0UhvkTenwGFLaP576/nu6zwHnZVm+K/Rlg/UAAAA=
X-Change-ID: 20260109-klm_dpphy-8b3a95750f78
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768826251; l=2874;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=NZRyf1dFwiNbqdkWNPc6DEipJCrOLZWSeo1BDrPkkl0=;
 b=VAtzYSp7SCDmdm9jCDEYIBq4YMGH1LldcK/8dxc87qzqVUHUx/BCVnrSBMKBYZzYwI3Tg+LCp
 2Qm8Kk1W6kZBb8r1h2zt/jSZx9HPm4GlH64kk3FP1f1ZVmttn3HgHgr
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEwNCBTYWx0ZWRfX1IPZJC13eZxK
 orB1CdQXQdvZl8+4bs2+FEgk1yldxqNivMW9P7ofejSY8EYO4QXvBhYRScSKNyHAUqkhcVczeDA
 jCTUyFzX/djaplZTe5drRx0/PEOS53igJl3Uz0qox1Nndub/wUC0zTfwX3ekof8nVzb2Kv27qMb
 +l+3Si+tt3csmP58zcYIz5DNfuV5r6FxccanczZO4EBg8nqaTq1eCWSSpzA04bIKnVg8Hsvl6Un
 AUz6FvMHEVnVzZ/gchcVkft6rg+fTPtu+9a7aQp9WALMR1izuyutlvvaW4ixTRMMdgD0u1zrDyu
 W50FKKUN/f66UBB4nshxk6ZaePLSJKmELWstOU+oGzwFWYEOV8f2zqhsKRSRU6kBi0hADs/7tfz
 gMH/T+9uk+UYhTighu9IY0dRvLcnkT6uvzlMNdn63Z1NMC/lkfW1pcXaVqKgj9hVkx93pl3W/b+
 5rO4VlmICx/6+A0Zcfg==
X-Authority-Analysis: v=2.4 cv=Is4Tsb/g c=1 sm=1 tr=0 ts=696e258f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4O7gz8BUHgUS6mrrnVAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 1k73m60BD9UAQJnaZJ1yoL7z_m4zi6md
X-Proofpoint-GUID: 1k73m60BD9UAQJnaZJ1yoL7z_m4zi6md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190104

Currently, the LeMans/Monaco devices and their derivative platforms
operate in DP mode rather than eDP mode. Per the PHY HPG, the Swing and
Emphasis settings need to be corrected to the proper values.

This will help achieve successful link training on some dongles.

Cc: stable@vger.kernel.org
Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v2:
- Separate the LDO change out.[Konrad][Dmitry]
- Modify the commit message.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20260109-klm_dpphy-v1-1-a6b6abe382de@oss.qualcomm.com
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 13feab99feec..ae98f0a3cf3a 100644
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
@@ -564,7 +585,7 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v5,
+	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v1,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 

---
base-commit: fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
change-id: 20260109-klm_dpphy-8b3a95750f78

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


