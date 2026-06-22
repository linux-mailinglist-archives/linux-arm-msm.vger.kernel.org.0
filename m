Return-Path: <linux-arm-msm+bounces-114060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PyDQCpjFOWoDxQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:30:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 992826B2D3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:30:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TcC7r8ig;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A9OMSyvr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114060-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114060-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A679B304043F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 23:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9AB372EDE;
	Mon, 22 Jun 2026 23:30:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70953672A9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782171000; cv=none; b=rDIDLJ+AhdGKy4Bd2DxqeX/cpYvMbmcJ74G76tCX4xH5IliILblDIgVXkKzZmKTNvVPtzatespQ8SfWQEGymPC98jmUn5HvZ9JFheHPChafcF+nrqmEEr2DQDndi6jZue6PMpyMahiiO+dqBuvHUg7Zwv79+zKx0JVu/BjpNwnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782171000; c=relaxed/simple;
	bh=n+V8Ij++nB/XurH4DgW2kmsiKtSiS1Yo8She/fAAbsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A8sMxidxPGA+552JXnv0QwSfEB4uf61s63BBDuM5+laRKY+B+hdD/WDpbmQTZ8QPUCJcvRv8+JHdfGDEs0NyvI1+x1V4GdQCHcq+WMJZMEHgIH6bJOImbkf2XBlYXpcV+Tm57oju7hNaaWfsekso+f39XFLCf7yejP0Uz5gq7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcC7r8ig; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9OMSyvr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJawbq1902481
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cS/YRntKch/F3MsHjSW5Moxk6fuht0J2zx2Zz1OCPjM=; b=TcC7r8igKfnikfSA
	9SqRMjBpQacNDtHLPgB1nmQu/qtrDauz+ZWeEl4tmWJbE8ymgCJabsNScaHRcn5N
	MoX3uNQQhX5MIdO/enJ2f65OfsKnDRx5PsbzDsPV5ikU/IaNUa8RQsnAMS3UO5P3
	+QjY5yIUFcYl+N/hQEWxjPxKKXiJDxEQWXuu/6cEie1vw36MHF40v5d9WD7isjUp
	9e4N6EhOv9uImpbsY12D0/LJ2xeHR8MmAq4U4LL4t5DRD61tGCQYIVrkwOQqrVL1
	ZTmYzOh4odF+y5agZ4N+n5eKM8qGU8J9pCuODXP7m0XX1qZYVk1uxHc1hhNUNUzS
	81evPQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1uqug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 23:29:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9077222eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 16:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782170994; x=1782775794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS/YRntKch/F3MsHjSW5Moxk6fuht0J2zx2Zz1OCPjM=;
        b=A9OMSyvr0KYiRIp5YEgaTweTPIIhPMnS5sTAAU8BMV+ENmh+QQP/+nV461MVcL56SO
         uzH5ureilsudFrtWpIDJx+/fiS4f/qC1zZYnt65RU/2tN/MXF/CYCTdgPkwlL8SIQ+dD
         c5renGTfkKn9DGq3Xmc86X0EsJwhQ8L7RCP1iTDtnahU9P7dAhu8tJO1/J8Q4O50Rd9z
         QV9c0NOjZJpZVTvqmWx3+z4mBVlwNJFiF2IwcLYZbwhDSK2KjLe2bZaUzwLDLyvkUgXk
         xs5uTr6eKiID7CSZW7f8jCajEpavPQa+JYtXUm7Tt7Cbq0XpwgiriyVd47lxVBLiOqnH
         KB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782170994; x=1782775794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cS/YRntKch/F3MsHjSW5Moxk6fuht0J2zx2Zz1OCPjM=;
        b=jMEEyzPR0MWmgDqlPEzZaulOylLzuOniEQ2HWXQXwFNyeEEoow9Wa9WBIQefGk0Dwg
         aI2OpFxxsPmUhEbbGf0m8IESOXKGV10UI2ezX/ZVNFDJcEGHdiwBQxjO/pEUvx7q0b+N
         NG9ms6i4CD7CZUv2rnDAg6CFaJhGvfulUTM3Wa76nAsN90jLnZFbTqV6ZNLOfxjemNXQ
         9Y51KZOYSqJhekVLpuKLpWHZxZLFoU8LXgO+BGNg0uxZi1ksfc4BqHOvqOl2iO4Bg/TR
         bYDg+yp5EDaHXLa3Vc4uEfLuKwsp0h2JgYWUMXphHhASTGqxLQJgCkIlwmN+KVPy9aDp
         aTRw==
X-Gm-Message-State: AOJu0Yw+ZLD4lT3183mQzBYJ9+KzGt2NfvhzTvgOqIj8CytnZ6E4k2RG
	/UPJGGz5wCB4IvDL/oS7wQUp+NCgDtdRPQ8cZP2B+y9N710nSwkDddBSjDEnxcqn5XbNlttUfKq
	JvfbCKeGw7Nc5sQjoTgaw5pYDM9L5KVnVCGFd4uQ8qe9McVYLt8iThlRgnFosnIQCUdCG
X-Gm-Gg: AfdE7ckupp5J1I0kXB2dkLvEMPLlNggCNV9lbKv90vQpcpBOM/Gcfb1fwYTvL2TTAFv
	igVqwhbH88i/Pc7JA1NFGMotmjHSd0xmTYrRH4U9izQ77M6WdJJy5YsbymrPZhHLtv1WX9NHyRi
	XxGJ45mq1qRbkOjrIZ42ORmJcMmn2xC7kYVRw6w7oGE1FswmDYv3nqLM1eflDnOzvb8sdm5sEMn
	uZJIawgZwJzYpNBKFJUiAg05I44H2qHV7K1/0pjX/htE3UNl5lEudx8oLjArZuvgpxME7s1f7YO
	1yMDBef4nLzyZ3gg+aHTgR7Uiv1K1ljctbccVP5X0KwZjJWU7ZhMCzJlelbjLckv8R48hup/MSI
	DeCsHf2FPE+U91cbcf8MXMfQR1e5ekWaMDLENKBzDRLTilS3dkRo=
X-Received: by 2002:a05:7300:a2cd:b0:2ed:e12:3769 with SMTP id 5a478bee46e88-30c58cea75emr427185eec.31.1782170993583;
        Mon, 22 Jun 2026 16:29:53 -0700 (PDT)
X-Received: by 2002:a05:7300:a2cd:b0:2ed:e12:3769 with SMTP id 5a478bee46e88-30c58cea75emr427168eec.31.1782170992993;
        Mon, 22 Jun 2026 16:29:52 -0700 (PDT)
Received: from [169.254.0.2] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba8fb35sm15339727eec.12.2026.06.22.16.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 16:29:52 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 23:29:49 +0000
Subject: [PATCH 1/2] phy: qcom: edp: split power-on sequencing by PHY
 version
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-glymur-edp-phy-v1-1-814b45089ac9@oss.qualcomm.com>
References: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
In-Reply-To: <20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782170991; l=10732;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=n+V8Ij++nB/XurH4DgW2kmsiKtSiS1Yo8She/fAAbsY=;
 b=ODtbI+c0A+PNjqTE74EMgH26dWNeWQmMQuDFvz2h+G9574UYjvelwyd+SJPiQSNqSTtqttLgG
 2MG+cu3AVN1DNwmuQCOIjepNcdXDY+TCUrPNUyjgtRYelYLWXWTsXCi
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: xAqkCMgZ9WQVLrpq2vFe60fbzVX8gfO7
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a39c572 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Dq9sv3uMWgnwB1ACyxoA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDIyNSBTYWx0ZWRfX+caXBhMnDY7l
 9cWkc9nnap0WuQl5T8/1EnMwzxIJ87h+Z2d7lB5Gg+Q2wyO3UtvRJ+gSpec9Wu+F3qXyx9PzdHt
 agXAH8DJkAmYZQESfNjEH9v5K+gLMDU=
X-Proofpoint-ORIG-GUID: xAqkCMgZ9WQVLrpq2vFe60fbzVX8gfO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDIyNSBTYWx0ZWRfX5CzgR2XRNWnJ
 qO7m0BwmLPVwUgU+ZxaIffC2NykbUnh7xS6hv+EMqJV+8XLBNjTHZWf7g1bXUUTcE/45cxJzCrd
 jf6YJ9XHA8wp4fWxuyYPELGgbfEe2fGmKAcIqaXZhauG5JeGPMbMros5/xeJKfkaECt1qwLXZnY
 ewecPT8zV8HksyNl65e7n/QiaewiEz0L+Jmh+04fxWr/AzNvczoERipnK4KQPZSkR4kNKd8m4lG
 jkyeKN3nngCrxlAHUejD/MTSDMvaV7mqfFs2vdFP/o7jZOpdwG9udbL64cIRh1BMmPily9a0nVB
 +tT/L4EXtFus4FPCfTabmrXodvO0AADnhkflwZ5vGN4aNnso49NLGqJ+F9T+3REPE2pEErgAMjY
 iV3D01z1NZ9Dg78WAoMYL+/ZHoOAK1gc28e35ynDeUz1FP4Ea2/Ita2vInNFk5gYVdfchXDG7Hp
 Yee0WLbZlIa31Xu+RFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220225
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114060-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 992826B2D3F

The eDP PHY power-on sequence has grown version-specific differences,
but qcom_edp_phy_power_on() still contains the sequence as one shared
flow. This makes it difficult to add newer PHY programming without
interleaving it with the v4/v6 sequence.

Split the power-on sequence into version callbacks for the parts that
differ between PHY revisions:

  - pre-power-on preparation
  - TX programming before PLL enable
  - rate/PCS programming
  - lane programming after PLL enable
  - final status polling

Keep the existing v4/v6 sequence as the v46 implementation, and wire v8
to the same callbacks for now. This keeps the programming unchanged
while making the next patch a v8-only programming update.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 175 +++++++++++++++++++++++++-----------
 1 file changed, 125 insertions(+), 50 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index a3c893f72908..6588419d4860 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -48,13 +48,10 @@
 /* LANE_TXn registers */
 #define TXn_CLKBUF_ENABLE                       0x0000
 #define TXn_TX_EMP_POST1_LVL                    0x0004
-
 #define TXn_TX_DRV_LVL                          0x0014
 #define TXn_TX_DRV_LVL_OFFSET                   0x0018
 #define TXn_RESET_TSYNC_EN                      0x001c
-#define TXn_LDO_CONFIG                          0x0084
 #define TXn_TX_BAND                             0x0028
-
 #define TXn_RES_CODE_LANE_OFFSET_TX0            0x0044
 #define TXn_RES_CODE_LANE_OFFSET_TX1            0x0048
 
@@ -64,6 +61,7 @@
 #define TXn_LANE_MODE_1                         0x0064
 
 #define TXn_TRAN_DRVR_EMP_EN                    0x0078
+#define TXn_LDO_CONFIG                          0x0084
 
 struct qcom_edp_swing_pre_emph_cfg {
 	const u8 (*swing_hbr_rbr)[4][4];
@@ -82,6 +80,12 @@ struct phy_ver_ops {
 	int (*com_configure_pll)(const struct qcom_edp *edp);
 	int (*com_configure_ssc)(const struct qcom_edp *edp);
 	int (*com_ldo_config)(const struct qcom_edp *edp);
+	int (*prepare_power_on)(const struct qcom_edp *edp);
+	int (*configure_tx_pre_pll)(const struct qcom_edp *edp);
+	int (*configure_rate_pcs)(const struct qcom_edp *edp,
+				  unsigned long *pixel_freq);
+	void (*configure_lanes_after_pll)(const struct qcom_edp *edp);
+	int (*finish_power_on)(const struct qcom_edp *edp);
 };
 
 struct qcom_edp_phy_cfg {
@@ -117,6 +121,13 @@ struct qcom_edp {
 	bool is_edp;
 };
 
+static int qcom_edp_prepare_power_on_v46(const struct qcom_edp *edp);
+static int qcom_edp_configure_tx_pre_pll_v46(const struct qcom_edp *edp);
+static int qcom_edp_configure_rate_pcs_v46(const struct qcom_edp *edp,
+					   unsigned long *pixel_freq);
+static void qcom_edp_configure_lanes_after_pll_v46(const struct qcom_edp *edp);
+static int qcom_edp_finish_power_on_v46(const struct qcom_edp *edp);
+
 static const u8 dp_swing_hbr_rbr[4][4] = {
 	{ 0x07, 0x0f, 0x16, 0x1f },
 	{ 0x11, 0x1e, 0x1f, 0xff },
@@ -653,6 +664,11 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v3 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
 	.com_ldo_config		= qcom_edp_ldo_config_v3,
+	.prepare_power_on	= qcom_edp_prepare_power_on_v46,
+	.configure_tx_pre_pll	= qcom_edp_configure_tx_pre_pll_v46,
+	.configure_rate_pcs	= qcom_edp_configure_rate_pcs_v46,
+	.configure_lanes_after_pll = qcom_edp_configure_lanes_after_pll_v46,
+	.finish_power_on	= qcom_edp_finish_power_on_v46,
 };
 
 static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
@@ -663,6 +679,11 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v4 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v4,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v4,
 	.com_ldo_config		= qcom_edp_ldo_config_v4,
+	.prepare_power_on	= qcom_edp_prepare_power_on_v46,
+	.configure_tx_pre_pll	= qcom_edp_configure_tx_pre_pll_v46,
+	.configure_rate_pcs	= qcom_edp_configure_rate_pcs_v46,
+	.configure_lanes_after_pll = qcom_edp_configure_lanes_after_pll_v46,
+	.finish_power_on	= qcom_edp_finish_power_on_v46,
 };
 
 static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
@@ -898,6 +919,11 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v6,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v6,
 	.com_ldo_config		= qcom_edp_ldo_config_v6,
+	.prepare_power_on	= qcom_edp_prepare_power_on_v46,
+	.configure_tx_pre_pll	= qcom_edp_configure_tx_pre_pll_v46,
+	.configure_rate_pcs	= qcom_edp_configure_rate_pcs_v46,
+	.configure_lanes_after_pll = qcom_edp_configure_lanes_after_pll_v46,
+	.finish_power_on	= qcom_edp_finish_power_on_v46,
 };
 
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
@@ -1079,6 +1105,11 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 	.com_configure_pll	= qcom_edp_com_configure_pll_v8,
 	.com_configure_ssc	= qcom_edp_com_configure_ssc_v8,
 	.com_ldo_config		= qcom_edp_ldo_config_v6,
+	.prepare_power_on	= qcom_edp_prepare_power_on_v46,
+	.configure_tx_pre_pll	= qcom_edp_configure_tx_pre_pll_v46,
+	.configure_rate_pcs	= qcom_edp_configure_rate_pcs_v46,
+	.configure_lanes_after_pll = qcom_edp_configure_lanes_after_pll_v46,
+	.finish_power_on	= qcom_edp_finish_power_on_v46,
 };
 
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
@@ -1089,81 +1120,49 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 
-static int qcom_edp_phy_power_on(struct phy *phy)
+static int qcom_edp_prepare_power_on_v46(const struct qcom_edp *edp)
 {
-	const struct qcom_edp *edp = phy_get_drvdata(phy);
-	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
-	unsigned long pixel_freq;
-	int ret;
-	u32 val;
-	u8 cfg1;
-
-	ret = edp->cfg->ver_ops->com_power_on(edp);
-	if (ret)
-		return ret;
-
-	ret = edp->cfg->ver_ops->com_ldo_config(edp);
-	if (ret)
-		return ret;
-
-	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
-	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
-
-	if (edp->dp_opts.ssc) {
-		ret = qcom_edp_configure_ssc(edp);
-		if (ret)
-			return ret;
-	}
-
-	ret = qcom_edp_configure_pll(edp);
-	if (ret)
-		return ret;
+	return 0;
+}
 
-	/* TX Lane configuration */
+static int qcom_edp_configure_tx_pre_pll_v46(const struct qcom_edp *edp)
+{
 	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
 	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
 
-	/* TX-0 register configuration */
 	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
 	writel(0x0f, edp->tx0 + TXn_CLKBUF_ENABLE);
 	writel(0x03, edp->tx0 + TXn_RESET_TSYNC_EN);
 	writel(0x01, edp->tx0 + TXn_TRAN_DRVR_EMP_EN);
 	writel(0x04, edp->tx0 + TXn_TX_BAND);
 
-	/* TX-1 register configuration */
 	writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
 	writel(0x0f, edp->tx1 + TXn_CLKBUF_ENABLE);
 	writel(0x03, edp->tx1 + TXn_RESET_TSYNC_EN);
 	writel(0x01, edp->tx1 + TXn_TRAN_DRVR_EMP_EN);
 	writel(0x04, edp->tx1 + TXn_TX_BAND);
 
-	ret = qcom_edp_set_vco_div(edp, &pixel_freq);
-	if (ret)
-		return ret;
-
-	writel(0x01, edp->edp + DP_PHY_CFG);
-	writel(0x05, edp->edp + DP_PHY_CFG);
-	writel(0x01, edp->edp + DP_PHY_CFG);
-	writel(0x09, edp->edp + DP_PHY_CFG);
+	return 0;
+}
 
-	ret = edp->cfg->ver_ops->com_resetsm_cntrl(edp);
-	if (ret)
-		return ret;
+static void qcom_edp_configure_lanes_after_pll_v46(const struct qcom_edp *edp)
+{
+	u32 bias0_en, drvr0_en, bias1_en, drvr1_en;
+	u8 cfg1;
 
-	writel(0x19, edp->edp + DP_PHY_CFG);
 	writel(0x1f, edp->tx0 + TXn_HIGHZ_DRVR_EN);
 	writel(0x04, edp->tx0 + TXn_HIGHZ_DRVR_EN);
 	writel(0x00, edp->tx0 + TXn_TX_POL_INV);
 	writel(0x1f, edp->tx1 + TXn_HIGHZ_DRVR_EN);
 	writel(0x04, edp->tx1 + TXn_HIGHZ_DRVR_EN);
 	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
+
 	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
 	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
 	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
 	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
 	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
 	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
-
 	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
 	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
 	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
@@ -1194,14 +1193,90 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	writel(drvr1_en, edp->tx1 + TXn_HIGHZ_DRVR_EN);
 	writel(bias1_en, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
 	writel(cfg1, edp->edp + DP_PHY_CFG_1);
+}
+
+static int qcom_edp_configure_rate_pcs_v46(const struct qcom_edp *edp,
+					   unsigned long *pixel_freq)
+{
+	return qcom_edp_set_vco_div(edp, pixel_freq);
+}
+
+static int qcom_edp_start_pll(const struct qcom_edp *edp)
+{
+	int ret;
+
+	writel(0x01, edp->edp + DP_PHY_CFG);
+	writel(0x05, edp->edp + DP_PHY_CFG);
+	writel(0x01, edp->edp + DP_PHY_CFG);
+	writel(0x09, edp->edp + DP_PHY_CFG);
+
+	ret = edp->cfg->ver_ops->com_resetsm_cntrl(edp);
+	if (ret)
+		return ret;
+
+	writel(0x19, edp->edp + DP_PHY_CFG);
+
+	return 0;
+}
+
+static int qcom_edp_finish_power_on_v46(const struct qcom_edp *edp)
+{
+	u32 val;
 
 	writel(0x18, edp->edp + DP_PHY_CFG);
 	usleep_range(100, 1000);
-
 	writel(0x19, edp->edp + DP_PHY_CFG);
 
-	ret = readl_poll_timeout(edp->edp + DP_PHY_STATUS,
-				 val, val & BIT(1), 500, 10000);
+	return readl_poll_timeout(edp->edp + DP_PHY_STATUS, val, val & BIT(1),
+				  500, 10000);
+}
+
+static int qcom_edp_phy_power_on(struct phy *phy)
+{
+	const struct qcom_edp *edp = phy_get_drvdata(phy);
+	unsigned long pixel_freq;
+	int ret;
+
+	ret = edp->cfg->ver_ops->com_power_on(edp);
+	if (ret)
+		return ret;
+
+	ret = edp->cfg->ver_ops->prepare_power_on(edp);
+	if (ret)
+		return ret;
+
+	ret = edp->cfg->ver_ops->com_ldo_config(edp);
+	if (ret)
+		return ret;
+
+	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
+	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
+
+	if (edp->dp_opts.ssc) {
+		ret = qcom_edp_configure_ssc(edp);
+		if (ret)
+			return ret;
+	}
+
+	ret = qcom_edp_configure_pll(edp);
+	if (ret)
+		return ret;
+
+	ret = edp->cfg->ver_ops->configure_tx_pre_pll(edp);
+	if (ret)
+		return ret;
+
+	ret = edp->cfg->ver_ops->configure_rate_pcs(edp, &pixel_freq);
+	if (ret)
+		return ret;
+
+	ret = qcom_edp_start_pll(edp);
+	if (ret)
+		return ret;
+
+	edp->cfg->ver_ops->configure_lanes_after_pll(edp);
+
+	ret = edp->cfg->ver_ops->finish_power_on(edp);
 	if (ret)
 		return ret;
 

-- 
2.53.0


