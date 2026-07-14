Return-Path: <linux-arm-msm+bounces-118938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3sRiJWTJVWqjtAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:30:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7875123C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="MaEM3Jz/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TPjmngh2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118938-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118938-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CCDA302DB4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1F232F748;
	Tue, 14 Jul 2026 05:30:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEF2D7DD7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:30:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007010; cv=none; b=sB0HrCCN2mRiL+h/t7PYytRZO9YO1jimJGgdYKTMwxLGEgJnI9ReOeJpMSKRdHNKyWIrWpyQjUST4MvrkPRUm4lAaTM/YHf5ySKho/JdsHIaPgaKym+D5e2zbWy3LylnzrOaqwdt+hb84Lhvl/sHmGTQ+GqVlsFzFBGPSk9a+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007010; c=relaxed/simple;
	bh=f6RWPu7OSYsDVLIJlL5RPbvktQugKFzgNsgyhrDHawU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ep0wzJJ65Ng+CeG20nefgmVk1WYDD4RXXQRiKAq1bbV1JfG7avEZcYDi6CkOBNgbXH7u77OXZGpqiTKJtT6+QEaZm+RQ+ue2Tx1/yUN3T2sfkJEkkygFXvipjH1xeAk3gczwXVvNuJiqodRe49C77NCFE6nI1NLYXPZ0SHuKbp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MaEM3Jz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPjmngh2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38I5o3556891
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/EH/kDTOFfl9ll8nU+LHJ/
	gslhkAK0/qlAc45wOhX4E=; b=MaEM3Jz/RdLyWBA4WlEsbzSxcBn4yhjN1skm1y
	DrKpzT985rzWxWvET5XBcLFu2Gmc3G3ZiTgCOvq6X1itYt1Qhc/lJ0yEPMEBFsKH
	xoOjIb183G5zCh+mpWCYRa9fFWQWmDoszIez38n/yMtdRwXpWXzBc/Q6/YNvX2CZ
	gOOnC/KFREiD37/MfuE5tEKfu4o4VTzkwW0lWpU3PJcED4fpfQcxAt1cxElZLALP
	3Qos7LOobsmoS5/s9G9RcjTUW9FXINxTfWg4wvLnRygs2MLQvZPb5tf/lP+kpYj6
	Bla593FYj57i3HAOo1Bm2MVaHOFxz8dY2RbdzDOgSv17WMbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct454-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:30:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e095fd889so1208274a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007007; x=1784611807; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/EH/kDTOFfl9ll8nU+LHJ/gslhkAK0/qlAc45wOhX4E=;
        b=TPjmngh2WITqkXzfzBwK3OGCB3zMW9nvbfWgU5AoF4Jgn7u9WQDHcFRzXW8hD3iLCY
         ykHGMFitl9ItGtUF01vL5D/iuEiCoeTwMP8SQ3d+un6o/tFBxAFMUcSLKqGuTioUPcMB
         Y1ZYpT2WHUkay57pbNUNzMnSU46zJihSeS+7i7R5FchqAjjiOYArXzr0krCIDz5x9WEE
         5VHtIKn4WQRTW9Uuukt3kauzmAaQvuO2EmN6qR6g6YTQAQKciHgtE94sW9j4HqPyHS7u
         /meIQloYcrLi7dE0CGaMNjUmV1XqQt6/BnVt57VffHscu7LjBr35ZJqVVVOxYu2MzCrZ
         2Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007007; x=1784611807;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/EH/kDTOFfl9ll8nU+LHJ/gslhkAK0/qlAc45wOhX4E=;
        b=D9N5Uq1QkS2wYdcPBYtMQTSsG4OCGmWMnyaBk/VM9qQcrSHpIuN6Sxc4LXe/1htWsQ
         RkM4Ld1UAAORouU05UZzUdAL6ohPvGoIbefmQv9ycFvJ/Z/rdZsboYUNIYmdgphUogLP
         MO3rK4gZSEK+u5ke/K+zMx+210PFkjaYLstucOupAPTkEgVqf6WkZFGqpzmKQnpMn1TO
         sv84ciBPXLxV+jAAKI2IlAF+FUFG+BrOvu/wtfu4RCh5AMvoLt2IGZNshOjEkno9S+7s
         38uoibhbaTxFa4xBqXmRZDF9PhG3bbSUnLP+NaCp12MuUE/N/SmqZFe450jAOmR+X/GD
         KLhQ==
X-Gm-Message-State: AOJu0YwzzXUk++YRZnFWJOtK+2qcU4sfBnPzCNCLfagT/P4+msrvweg6
	JIRvwHBnghxyEDiLnPdQ4ER7XLYzX/ANejvIkIUvxk9dUsxxu1LKXwMBqFzZakmWLerAaBpmDOQ
	GaLpgXW+OxMh6ZuiWDahKghVjT/3Yjz/KMCJzVW/m2kAo2mqJoLkGIZqc0bAYQVHtSVpFvz//JJ
	fW
X-Gm-Gg: AfdE7cl2XmJg+xxXQrScivK6gtUaK9yn2OsSfulxrkld9VdID44YZgq77XT85H6NGnU
	JE97gVdWSvzYs0SXEheR3e/TWz+31EJwvRKTzvObgcOoHSjLTP90/5ZZwOlHM3fsLzTellUdJBw
	KfVKF/lzKqNfPZ3V6LRbhS1RDhq6d5/GWnCJZ4fxfvuO2avhqTZRtd0WSCuxPdaRakIX/KCT2a2
	Q3G/hEOzm2bnp2cqvnUqs+Pg0tCjE+OsoWggYEGxddspEIq/r/DCrRRP2m9/VDJdopIkXv64+x2
	mR3tzHML9DmKFsDIVcyX5hqun06TII0S3vZ3BDJCZBJEwdyUetTW1wb4SIB3VFqJsg9H2gBBdyh
	t0HYJ/s0eOhX69t8ZT19VO5LTrBO6QXNxSe6tkOvu2A==
X-Received: by 2002:a17:90a:c883:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38e101fc92fmr3278754a91.18.1784007007306;
        Mon, 13 Jul 2026 22:30:07 -0700 (PDT)
X-Received: by 2002:a17:90a:c883:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38e101fc92fmr3278718a91.18.1784007006848;
        Mon, 13 Jul 2026 22:30:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e16e1d010sm889684a91.0.2026.07.13.22.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:30:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:59:35 +0530
Subject: [PATCH] clk: qcom: camcc-glymur: Add const qualifier for
 driver_data & CBCRs list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-glymur_camcc_const_fixes-v1-1-c635123ebbeb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAD7JVWoC/x3LUQqFIBBA0a3EfCeoSEFbiYfkNNVA2cOpKKK9J
 30eLvcGocQk0BQ3JDpYeI0ZpiwApy6OpLjPBqttpWvj1Dhfy548dguixzXK5gc+SdQQtAvGajT
 BQd7/ib6Q7/b3PC9x6obDagAAAA==
X-Change-ID: 20260714-glymur_camcc_const_fixes-fb04b120c1b4
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: jMbZcDeYpcBvKMxUM4Sf46ZkJtAl0D6V
X-Proofpoint-ORIG-GUID: jMbZcDeYpcBvKMxUM4Sf46ZkJtAl0D6V
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NCBTYWx0ZWRfX7b5I53J4BCFP
 RgobVW9x5qcWhQvDZVD7nuvxnLFaYvm/wqULGeSnEJJDbAZsl01C2t6hqcugUOQVT9WSqL6SRgW
 UXGaCDGNhhwN+NEnO6jvCVWTmiwc5Lo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NCBTYWx0ZWRfX+toOULcZ1Scd
 v/KFfyOVuyEPpjEA0Kn/Arjxap4REIt8QcB4DChmk0MVoEe4rIEKtRgBzRSUgAcwcE6ckLMKhrd
 IInrv5NHCOGSWqyeDiwYFZfjceK64658jQjwPaF6A4Xm+QucPdlfuQ+SQJvx6DGr9Vo+0O9+ti0
 bx08qT8ghMQRP8gII0+vSK4bJQDgMfGARP5j2GaaIPX3Z8Lr85MTKw2TdEWqEU8fYRDqoZkXqA1
 sW9Na0LXm+iZllDaJI6LlpB6OAYH92R+MFKr+M5JwOGalvBYhybaqB2DfcKb5rBLGTQ9Q8VOR1B
 PzVsRljvJA1c2HeRdenAYhNrn7saRcDV/HRmv0SVl5SGFWQ2p7c29Ift9PNhEr+gCYtGJLBDa9s
 TTYb0g4PYWdJCA86RhTSQKeckV68dSjGnLKzvXN+tqKZp+2rlFVzc2CfyXuULpZD4ozmQfsuVcf
 y4U1A7hATuY9WOdUKdg==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55c960 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=tcLhrl5LxFYkqpN5Pw0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118938-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAD7875123C

The qcom_cc_driver_data and critical CBCRs list are never modified by
common code and are expected to be const. Hence add const qualifier for
these fields.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-glymur.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
index a80f05b7bc4841f97d03544c11a77e8821437925..044cc590624e5fa5c3254c48defb754e4b856e63 100644
--- a/drivers/clk/qcom/camcc-glymur.c
+++ b/drivers/clk/qcom/camcc-glymur.c
@@ -2223,7 +2223,7 @@ static struct clk_alpha_pll *cam_cc_glymur_plls[] = {
 	&cam_cc_pll5,
 };
 
-static u32 cam_cc_glymur_critical_cbcrs[] = {
+static const u32 cam_cc_glymur_critical_cbcrs[] = {
 	0x13960, /* CAM_CC_GDSC_CLK */
 	0x1397c, /* CAM_CC_SLEEP_CLK */
 };
@@ -2236,7 +2236,7 @@ static const struct regmap_config cam_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
+static const struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
 	.alpha_plls = cam_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_glymur_plls),
 	.clk_cbcrs = cam_cc_glymur_critical_cbcrs,

---
base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
change-id: 20260714-glymur_camcc_const_fixes-fb04b120c1b4

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


