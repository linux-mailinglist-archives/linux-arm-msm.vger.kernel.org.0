Return-Path: <linux-arm-msm+bounces-104018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJiFGrlk6GmpJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:03:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F174423EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E4DF303852B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 06:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0AF2D8DC2;
	Wed, 22 Apr 2026 06:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lm2LrJV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGWXfAag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0329B8E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837742; cv=none; b=mMQNitZT/Q5S4XXRgYKnTx0MFnBjvkahSXpTlSKapd7h3sprsN2LZTYTD7R4Qjz3EGKbMXcp2/TIc7/K6PXZp6Uj+6Zl0PL4wbEeqWB2edzksZuuDdEXZzGIghkL/3y9kXlWzkrPN0sNurHJ+lg96QXVGkj6r0BTjLnQr0JvEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837742; c=relaxed/simple;
	bh=koMmfDgY6enq9c552pstA8QV5P3AcIvAKR/xucXdwSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXxt8V8jquc2Mj7ima9iI6poSXGnu9t2XbRigWkkBsJ74h0LYuJiD4bcEsQwBMtwidsdxbchaVNCrieJcobC0VNB1OmfTHyIa0JyCUIH157sv5pC5wXytSuwJj4x5L18H4K7cJrtX2P9cMnc8F6zn1iLj5Cjbfxiqzf4uzlnjFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lm2LrJV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGWXfAag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5qYl32965899
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFsNyAPQYJKzJfr5Ys2tu91JQOWqhh8cnTV/8Y7H4qs=; b=Lm2LrJV5sqR28LbT
	sAdcnAuAPN1TnYodA2rrM2FdEIxiZfqKbGAke/Y08uLv3oUbW7jfWRzC3acoQRF2
	Iq7FH5yDZKID7nhmX2MQwiJZWj6GRc/ImNhHIyy/+oS/f7AVRtC32KMUj+l9ErjV
	4BPUZ7MPznhYiwBwLvMJ5y1hqkyCOAPozZOYZLX1e3MnF0TqrsX0t7vYq4z2zAwF
	sdQF6TfaJXh0iwXvzpmiGPZ6MMP+RGi0OM6oDh6cvfG3LQicVgAWgLyfCosBIH8M
	VMyYqq2VeFKT1vRKEykOhcZishHLVTRLcbYAzNyBHrUGKYepGr9d6zQVS9EpRVa/
	rPVEdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfhvau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:02:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8e8950b3ee1so1308758585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 23:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776837738; x=1777442538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFsNyAPQYJKzJfr5Ys2tu91JQOWqhh8cnTV/8Y7H4qs=;
        b=VGWXfAagq0G2A+RbrJ8NVBtOyK8bSXjkkfh+EYmxHrgIuwhhdlyJ5E+6GhvO7+vw1x
         N+z2cxZVf0lI6rt0PS4PGETJu+3VUGTr5APKZYLs1psa4QXbIOb4OPls1Tgq5pOu7KYk
         t6axT1CHB1LNHe1bBmjGZqbua//tzln+IAeX9A5BcJB+hRAStOXjOnN9XnYn5iZFxKz4
         UQCXXa+2NmEJLXGEeX8h0jTxjGEbnimDotZVA3HOXIjxTuqcZgTWrSWHv7Lacvr4EPH3
         oxFWcfLQgtxFsznazhyEPJYgzNpMIDVtOcwGpuGWFkXp0MDpsHlpoEipmjZqVLqFX0EF
         563A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837738; x=1777442538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QFsNyAPQYJKzJfr5Ys2tu91JQOWqhh8cnTV/8Y7H4qs=;
        b=Qz2rPwds0edk31FwLaggeJtk7GW5cHEZrpCy1xJ97fCwZA9AaA1FhbnYJg7Q0udXDq
         iJELoUvclNMITqffbc42KJP4yjxXfPzUWMVBY6+Uq5CKI/YqQ8Ix8C2ag4mb42IYXLB3
         mH8KGiCBKRPRzuzLiI61Eig5P/BQgQQXh6xWA/92clPliW/QQD98VYwnrD4Q7tOfUYB0
         4mPHPZKgdEdKgsIw1XJvncg9mEZG62DgNELIW5ai/kkeO2PuugsFgRVfS7Gs7aCXhmh5
         J2Nyk7z/1bZKN8AIcblstolHfgHQIoppdsRAmAhrmvr36Mq2n6YkQnQNVXK3Q4y+rFxq
         jiHA==
X-Gm-Message-State: AOJu0YyHK96YoLhugrAriKDBvJieJKk+be6TCaDFANxvg//oy3juih2i
	qn3jgZd1b9Le8wkQ1fQxq7xjosBWMV9vr5zUOdUVuj2RNnu1qdw1m6hcG0UpmNy4mopOK9CzfLe
	6Rz6BBmiczLa8091k46eS5hmwAdYMeufCc2IPAPCkLq+L9mdpcmWtPKrp5DQap2TWA7//
X-Gm-Gg: AeBDieuP4EV0aqE2Dk4DJYCcr1E4f0cuk8E/C6KehiZRDKhmt4hZQi73NIZSUKCRghT
	0SLpRtQQs6SYzhRAGAiemEm/r2stmq4nlbXvAYwfd73FnUZQkAIcEjGMZ2LFumYiw5Gg8emvRSD
	M/jPoXkerATbY5YQ3mslr/WfkUrmUC05bmh7qHEMcPkZmc7PBPUthCKebVSWfbKfQ7yFkUYts1E
	g7ZuNzUdD0LSUuJxTVsq5Ue6tYzqcwds0kKsDJ9t39CO3EuHi/DVh8UlD9bWvAWrCMRmc2DRpi1
	wy2u7MxsYiB+PwJ509PRMrA5P2VpAdgS/uRWXzYkQs7R8bs0JBNUbVlM1mMSWHxJoZevtTZrbfJ
	p2hsAccgseWXPKGFFgD9ppDSG/7+H4SP4HSLT6OorTW3jMDwc26pQ7dTqhjeqlqyzPqIQYn0JbT
	9waxvUourBxTb2d3nC6w==
X-Received: by 2002:a05:620a:e98:b0:8eb:49b5:bdb1 with SMTP id af79cd13be357-8eb49b5bfb0mr1206077285a.18.1776837738562;
        Tue, 21 Apr 2026 23:02:18 -0700 (PDT)
X-Received: by 2002:a05:620a:e98:b0:8eb:49b5:bdb1 with SMTP id af79cd13be357-8eb49b5bfb0mr1206074185a.18.1776837738070;
        Tue, 21 Apr 2026 23:02:18 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm237379985a.18.2026.04.21.23.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:02:17 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 14:01:52 +0800
Subject: [PATCH v4 2/5] phy: qcom: edp: Add eDP/DP mode switch support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-edp_phy-v4-2-c38bef2d027b@oss.qualcomm.com>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
In-Reply-To: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>, stable@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776837726; l=5695;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=koMmfDgY6enq9c552pstA8QV5P3AcIvAKR/xucXdwSU=;
 b=4njF7bVd40+2M5r00zYKejJksd05Hb3dd9BkdXPx3lh83ZcOzqWPg2uzhEvYFLbap3kTFhUIe
 +gVt4TP5w3lDrqStpudtWi3+eSo02lv3JHRZZOIuLlmSfSBthRoobz2
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=Y6rIdBeN c=1 sm=1 tr=0 ts=69e8646b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=se8qGc9sdx2UsIF7nuMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA1NiBTYWx0ZWRfX6yyPLP8MGv6x
 2sUJkspF3SedTz4p1Wo+N2A9OPxPnoOTnRpsWzv2R6JH4heaCcl12k/I2NODif5RT2y7yNdCWlu
 P/0eSANB14T41DTtGRNI/dGHGDFdBBORNk3JyLQT93bo76CL0vTVQLeHgyhbCP56W5wg9dmu9cS
 OD1YEPGt7RJbE6WbGhmF1YYJ/NuXlAra+bBfeUs+Ap8WR8FFy+CCDsK16tY2CHfxw9hKqK3/5CV
 mu92NyBxrvliZpDHwBptm/kqbMRTUV7Ji/koksuvE19vwYCv4N3VNirJ9F4xkrjVflHoyQXJ2xf
 ijbSEk1J8tuInPl8ttKMaKW58cgMjDUmrGrJX01kFl4GIE2vpf2HEBJ4Dkul8Bf3B72jx9sMGm+
 cjd/6viKZLnQ1wZ++X+p+qzo3QbmFkKQlhOdEepyxJZ+BMAjQMLj3M7AeTdEXY7WI0edYthh6te
 UFasgJAx1RIYU/7G1OA==
X-Proofpoint-GUID: OkZ77J51Bn4n0ryBIhtMuX12j0YQBxnM
X-Proofpoint-ORIG-GUID: OkZ77J51Bn4n0ryBIhtMuX12j0YQBxnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220056
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104018-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C2F174423EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The eDP PHY supports both eDP/DP modes, each requires a different table.
The current driver doesn't support both modes and use either the eDP or
DP table when enable the platform. Add a separate set of tables for eDP
and DP modes, and select the appropriate table based on the current mode.

Glymur's DP mode table differs from the other platforms, add a dedicated
table for it.

Since both modes are supported, so also fixes the table mismatch for
X1E80100(eDP) and SA8775P(DP).

Cc: stable@vger.kernel.org
Fixes: 3f12bf16213c ("phy: qcom: edp: Add support for eDP PHY on SA8775P")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 46 +++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 2af3fd63832f..3266026cfe37 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -87,7 +87,8 @@ struct qcom_edp_phy_cfg {
 	bool is_edp;
 	const u8 *aux_cfg;
 	const u8 *vco_div_cfg;
-	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *dp_swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *edp_swing_pre_emph_cfg;
 	const struct phy_ver_ops *ver_ops;
 };
 
@@ -150,6 +151,20 @@ static const struct qcom_edp_swing_pre_emph_cfg dp_phy_swing_pre_emph_cfg = {
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
@@ -246,7 +261,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 	 * when more information becomes available about why this is
 	 * even needed.
 	 */
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (edp->cfg->dp_swing_pre_emph_cfg && !edp->is_edp)
 		aux_cfg[8] = 0xb7;
 
 	writel(0xfc, edp->edp + DP_PHY_MODE);
@@ -270,7 +285,7 @@ static int qcom_edp_phy_init(struct phy *phy)
 
 static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configure_opts_dp *dp_opts)
 {
-	const struct qcom_edp_swing_pre_emph_cfg *cfg = edp->cfg->swing_pre_emph_cfg;
+	const struct qcom_edp_swing_pre_emph_cfg *cfg;
 	unsigned int v_level = 0;
 	unsigned int p_level = 0;
 	u8 ldo_config;
@@ -278,12 +293,14 @@ static int qcom_edp_set_voltages(struct qcom_edp *edp, const struct phy_configur
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
@@ -543,7 +560,8 @@ static const struct qcom_edp_phy_cfg sa8775p_dp_phy_cfg = {
 	.is_edp = false,
 	.aux_cfg = edp_phy_aux_cfg_v5,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -556,7 +574,8 @@ static const struct qcom_edp_phy_cfg sc7280_dp_phy_cfg = {
 static const struct qcom_edp_phy_cfg sc8280xp_dp_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -564,7 +583,8 @@ static const struct qcom_edp_phy_cfg sc8280xp_edp_phy_cfg = {
 	.is_edp = true,
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v4,
 };
 
@@ -745,7 +765,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
 static struct qcom_edp_phy_cfg x1e80100_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v4,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v4,
-	.swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v6,
 };
 
@@ -924,7 +945,8 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v8 = {
 static struct qcom_edp_phy_cfg glymur_phy_cfg = {
 	.aux_cfg = edp_phy_aux_cfg_v8,
 	.vco_div_cfg = edp_phy_vco_div_cfg_v8,
-	.swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
+	.dp_swing_pre_emph_cfg = &dp_phy_swing_pre_emph_cfg_v8,
+	.edp_swing_pre_emph_cfg = &edp_phy_swing_pre_emph_cfg,
 	.ver_ops = &qcom_edp_phy_ops_v8,
 };
 
@@ -942,7 +964,7 @@ static int qcom_edp_phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	if (edp->cfg->swing_pre_emph_cfg && !edp->is_edp)
+	if (edp->cfg->edp_swing_pre_emph_cfg && !edp->is_edp)
 		ldo_config = 0x1;
 
 	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);

-- 
2.43.0


