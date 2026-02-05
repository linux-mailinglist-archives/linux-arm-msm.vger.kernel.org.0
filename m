Return-Path: <linux-arm-msm+bounces-91889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB4xEqpihGkK2wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:28:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1EBF0B18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 10:28:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EAE73066BD8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 09:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA223939A5;
	Thu,  5 Feb 2026 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaysqcZQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eB4sYVnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C8392C58
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770283275; cv=none; b=k20fiJlOO3XTxr1/KNbJhPSHlQikOsyOjSOn4NK2LQduJb2gm3e/+bR4ebSKP1B618lfowPCkfUqp/FuKRctbSnEKF0JWojmuOl2dmt/UVfJIWLTjqw84fO7GNMLXQDIadZMXY/hKyqjx5cvQsRhQcfjMns7s1tcHw6RCsh72jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770283275; c=relaxed/simple;
	bh=0safHmvjAF5Dl2bJ32O0Wb8Fy67lbHdFK61KTGNQChU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GpIOImBHZHvwrKEni2kcWG3734dK8smRT0KIwjiZPF6xzkKrqB8Ftk2GJRMXMOi8eohot40EnLtLlzUE1AXZzWphKWJcLFtSV4XPqT8GGAtxFXRtEkjz3V2HhSFw4UmEvzoFigzdI89HcNHK/YcHqkifbqf6bPhDMKUdEKAA2tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaysqcZQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eB4sYVnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61555tOR3047932
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 09:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2kz66T+V0rtwnMGBDRu8aeEFpABci/zcGgd00rNWRwU=; b=oaysqcZQO9Ai89FV
	7B8EZvAHjtNkUJEZBE1V1Aw2Q1YrgBMnjm6euiMDsZerSnzeUM4i/sMiF5ZUSA/9
	mpbsE1kh4VRSNro8k/grwJjYBAP7cNAw6uywsriPXJdmou+JQVLaoMFDImYj9wpg
	B11hZDZmHwe6ytPH/dcsa9XEARDB7IZSaeQ2/B8HlExjtCwCndnb9fYP+HqO6b3H
	8zSZsqOLevco5rhHKxcFRHm/2IAcns+Rxauqcgl8bC1dv44jkVrp/8UP6S25jEP5
	2NDZ1BJ+ckhPGtAT837WBpjMufQEfzGeq8De7hjY2K878zaZ6E2rqseOEDzoAC/C
	jN+csQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4mrtgr8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:21:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a87029b6so202162485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 01:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770283273; x=1770888073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kz66T+V0rtwnMGBDRu8aeEFpABci/zcGgd00rNWRwU=;
        b=eB4sYVnuT92XIgUxA4lMHWXfglPPb/3rImOXy+lq8N9dho2bsLymGT1HrEUzPndxPX
         tOFVfbk5pjcmgn0sFG4nsrwmFVVW9tbbbnC17SPSft0kl81GrTyGMjgs9COMYgMeV0p7
         x2lv1qc8RPkGi8bGtt7SbVT5LDhhLQdAV6yiQ8EN557MkjrwvqMdZl4himytSS6VQItK
         /h6HjiWiyXdaFX2Gr+lzRQ6XR8qYB02zRQLIrJK9TzqyF+yPBOSBNsVMTp7jUKktKg/Z
         a8h6YiuzqTXzIdNZ8lST4sw/pptw/kcRAU5G8KtYh2Yr53Hkm6jCfig+WG4FxhpVt/8+
         3Lyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770283273; x=1770888073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2kz66T+V0rtwnMGBDRu8aeEFpABci/zcGgd00rNWRwU=;
        b=NaUogbc3n2am6IKQ2+QkYi+xv3v+rkCQkl06cp/IuCEjvX7nWnKd/irHTCn+4/jV3Q
         RnAWEgvW1KMlBEAghijcr+aEjtoj7ED/Lq3x/U3NwRjVBwtWnzRprDFuFGt3thnvuE1G
         Ah8vXjFRATBcLa71kbDNoOuNe77XCg2/jf4SgeUo9otYBgwckmWJi53R417DWvNTyhRx
         AELxa4l3dEd/9GB/s/pqQEg2e8Ry58Jzefihar7vULDBQS3xhxUd58qPQEKTfXilH0tX
         sphDpSvf1AR7leT7XwNmeY5cBKllRDp9sqRaPU+dIUVSqonmIqOIECVQw8XuYeE5ZRSU
         goRQ==
X-Gm-Message-State: AOJu0YwtCAEEBw8WUAdwQXmsx3mUECJ0hOg9azbWF+chhobXyifZwGI3
	9sAaOzEGzPmTGKu2ZSkTg1SOd0NMymW/se1yyjy+mq0v67uxJWejpv3+2AeTtrWmpZ03odW8+31
	Pi6YOKUwAdhzDwMxhQMpPvCWSG/VQNU3gpPSpvoLCu+X3k6/9cKHnVNVh13+H7zxsnneD
X-Gm-Gg: AZuq6aLk5TcCQxFl8AAcRbZyZjXMOeuwbtVN6O/xcD/2Wc1TgJmb3HMLvMbd9LsRQ3Z
	axOu7D2qTCxhdawqmjmXwz8BvrDUJDEaZjKFPubTcy9Cd/O8Lm21yMCU9FHnEqgUNkDm0F20bRT
	DamS7fK6fX0elZbGvGaXpsYFjUVEzkPbBhJT0S0bfv43bK2gcGA03NXyeL6iP3Whz79wD1xa4AJ
	GRPKVnnpg4x1iCoIqU74VM14VARIbeach4AzUzWx44QTEw9thTKP+MXQUXxZUtSYe+YcCTxU7Hz
	yoHtA9QYXdKw+BljtW0Qay7UXDNnhpiktqlVrbDeTrjVC4lcgm4ZB98v5UA+xGZJrGoczQFG5Fg
	MUfJdUuHv1QND8i1syMK4i0xfLEMCz01oza2CBZDDdtLInvo5SnBmn65D8815uFxQVFztaUM=
X-Received: by 2002:a05:620a:8301:b0:8c7:17b3:ae1a with SMTP id af79cd13be357-8ca2f9b71admr527874185a.45.1770283273081;
        Thu, 05 Feb 2026 01:21:13 -0800 (PST)
X-Received: by 2002:a05:620a:8301:b0:8c7:17b3:ae1a with SMTP id af79cd13be357-8ca2f9b71admr527872685a.45.1770283272631;
        Thu, 05 Feb 2026 01:21:12 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca2fd2c3easm353674885a.32.2026.02.05.01.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 01:21:12 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 05 Feb 2026 17:20:55 +0800
Subject: [PATCH 3/3] phy: qcom: edp: Add eDP phy mode switch support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
In-Reply-To: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770283262; l=6361;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=0safHmvjAF5Dl2bJ32O0Wb8Fy67lbHdFK61KTGNQChU=;
 b=LxoAlPOd5KyXUKpqF5UgKAM/Bmy4B6FstzpfXjLB42qMA5avYihFxiB1FReCgRX15mjn+xiKD
 bE9DcO69SwlBYzUNqXVE7URHZcvx2O6JmDa64Nyl8ZU0fp5tT0z/zeO
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDA2NyBTYWx0ZWRfXxn6Zs/f3I/QM
 uC2RQhdThtu0vB6B336ES6/lTT3CZ/3B4qgBlsYN673Xd/KfaZoQeioZJNAAtiN2X9JJJfD0KaJ
 D34wFcfyfdIQKF4iT0x4A6ulS0MWaHoqsbNQDGlRLXN9zS0xdVQQamfi9xPownUfTEd/yHgFmq+
 FX77HQAjFZI6T6Vrr6WZdHFBTOe5s6UpBfNhY49Her90RZadvsv5kp4MieszWUsP5yW9z+P+yva
 fXuWBckqqllD4YR/3eE0OjQApt6ErKXy/pEv9enmEhESsJJSgJ9Uz2ifk4L/EzqkPmtncV92oFD
 Lu54TScLEqp4FYxfL5iOGZOdLS+k7lZZMBdzUaI8bYO9MAzek6BUQEnyDTCJdYgmYnhoIxNmfT0
 vBbJ6mAUriWUNouTKi24FLkXZyqoAMv576oc2bHJshc6vaxus15AqYKRY1DvHaXoeSDqHQOIKTu
 I2COWeohtik7IwoaXFQ==
X-Proofpoint-ORIG-GUID: V5CJHYC_ssEuBnz45mK5LgH6vQC6u-NR
X-Authority-Analysis: v=2.4 cv=UoBu9uwB c=1 sm=1 tr=0 ts=69846109 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GUg6TPUWjBfrtBjo8qYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: V5CJHYC_ssEuBnz45mK5LgH6vQC6u-NR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_01,2026-02-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91889-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9E1EBF0B18
X-Rspamd-Action: no action

Add DP/eDP switch support by splitting the PHY swing/pre-emphasis tables
into separate DP and eDP configurations. This allows the driver to select
the correct table based on the is_edp flag.

Add a dedicated table for the SC7280/glymur platforms, as they are not
compatible with the others.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 72 ++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 16 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 388226dbad7f..85caa869a8c0 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -88,7 +88,8 @@ struct qcom_edp_phy_cfg {
 	bool is_edp;
 	const u8 *aux_cfg;
 	const u8 *vco_div_cfg;
-	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
 
@@ -151,6 +152,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 dp_pre_emp_hbr_rbr_v8[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg_v8 = {
+	.swing_hbr_rbr = &dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr = &dp_pre_emp_hbr_rbr_v8,
+	.pre_emphasis_hbr3_hbr2 = &dp_pre_emp_hbr2_hbr3,
+};
+
 static const u8 edp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x0d, 0x16, 0x1e, 0xff },
@@ -186,6 +201,27 @@ static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg = {
 	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3,
 };
 
+static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
+	{ 0x0b, 0x11, 0x16, 0x1b },
+	{ 0x0b, 0x19, 0x1f, 0xff },
+	{ 0x18, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff }
+};
+
+static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x09, 0x14, 0x19, 0xff },
+	{ 0x0f, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff }
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg edp_phy_swing_pre_emph_cfg_v3 = {
+	.swing_hbr_rbr = &edp_swing_hbr_rbr,
+	.swing_hbr3_hbr2 = &edp_swing_hbr2_hbr3_v3,
+	.pre_emphasis_hbr_rbr = &edp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2 = &edp_pre_emp_hbr2_hbr3_v3,
+};
+
 static const u8 edp_phy_aux_cfg_v4[DP_AUX_CFG_SIZE] = {
 	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x00,
 };
@@ -242,12 +278,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
 	       edp->edp + DP_PHY_PD_CTL);
 
-	/*
-	 * TODO: Re-work the conditions around setting the cfg8 value
-	 * when more information becomes available about why this is
-	 * even needed.
-	 */
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (!edp->is_edp)
 		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);
@@ -271,7 +302,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
 {
-	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
 	int ret;
@@ -279,12 +310,14 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
 	u8 emph;
 	int i;
 
+	if (edp->is_edp)
+		cfg = edp->cfg->edp_swing_pre_emph_cfg;
+	else
+		cfg = edp->cfg->dp_swing_pre_emph_cfg;
+
 	if (!cfg)
 		return 0;
 
-	if (edp->is_edp)
-		cfg = &edp_phy_swing_pre_emph_cfg;
-
 	for (i = 0; i < dp_opts->lanes; i++) {
 		v_level = max(v_level, dp_opts->voltage[i]);
 		p_level = max(p_level, dp_opts->pre[i]);
@@ -591,20 +624,24 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
 static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg_v3,
 	.ver_ops = &qcom_edp_phy_ops_v3,
 };
 
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -612,7 +649,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.is_edp = true,
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -811,7 +849,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
 
@@ -991,7 +1030,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 

-- 
2.43.0


