Return-Path: <linux-arm-msm+bounces-108327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGN0FCP6C2qISwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FC257790F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 891E0306F00C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BF735A933;
	Tue, 19 May 2026 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rt//YA81";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxVOzOpM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8547D34EF03
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169650; cv=none; b=rrp25MAQUV28NdktuyMQ9TP1YbLdo5fFX/UGJ7+5MkMKQ30+ae2HIoKxzB2eFWZ/B6fAv0joWeoR8tgOPJvLSJ8i4WhvKbBImMCpXE0pTuKkoDswS/Gq+3tkQuc803y0XzsDz2EiE7ra+BU0KjkjFE5IfpW56Vmu/SDICwGrwPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169650; c=relaxed/simple;
	bh=6l47wGwpcdS+i8z+96tTAR26f2jAl5baUJvJx2wGmVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeylYTlZDBVPV/pIqFEU+P+ZNmcWRl4RLHODh/IKosDKnFGdSd6N4ubnm2dHmHCepd955DE1CfmFSEGvO5ICU/4GWfxPe71bZfc2EEgSwa373kQJfNoD0dVABMOaRwf6JRwVTjNY5IlTxynrW9CX6g51MJnguBcALatu5QFpX9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rt//YA81; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxVOzOpM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IM7IfN2892690
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytn8hC+NMMnLU7PiLjFRS9m0hFgHKNq4bt/poY0T1tM=; b=Rt//YA81zM+mrLYi
	jU2KPCTCo3kLls912E+1OpCYhDqtb/zzUb77KReevcvVtq7JRi7xR2o3ZRTEZl0Z
	DkO+c3cFs0hPl/JNm+f61Y6OTYj1qxiRnTvhPN9RiI5AlaWaMuq6kMHno7FnXx5E
	jaT+V4jaYdiLdGWpambl9Hm1qbWk0VgsYee3RjEdfJj2Mu4fYzcdgNCJ9pfssbU7
	CRiVhk33qWpNwW0RQ0QB6LWeniPuI5De+OLNTtnTSzslauBAbsPFaGqemYJnxRHA
	MqUln9ExXHVjvXHtnVv61N+1BiKgWg2BFarFWk5enb58IRi3T3Yv9o7MYaOe+S7D
	vf1trw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1ckw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:47:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-303b38ec2f6so4301263eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 22:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779169647; x=1779774447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytn8hC+NMMnLU7PiLjFRS9m0hFgHKNq4bt/poY0T1tM=;
        b=DxVOzOpMqUM+F7Q9L52rCSf+QUhYlTfVMjVUV4ZGgw/EUt8pWtLk9UULVBGHi1+SZF
         cV4k0A5W64YPN2wmeorhKpx5Oxggq9PmdNgIxTKGPftVMiihRQlXKCs1MwFWD5wnEyKb
         xwh099QUvCbHtVrdXEnPzmLyS/vgiePR7rVnhEdQUhGQQkdBWne0eZg5jZuo78bXyV7Z
         VuGlW8s+dmJrMvLduTdMG7EBdfFhiJzufpLpzbzecJdXp0E+46nVkzSAqhFIEo0N8PZI
         UEaMFiHWfZ3psEj5xJgen1XY5Yx8RSh9gqVzoOVv9vOczZGpIynetxb14y4+c9Exy4hH
         V4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169647; x=1779774447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ytn8hC+NMMnLU7PiLjFRS9m0hFgHKNq4bt/poY0T1tM=;
        b=FxvDrEu5T8qJZaeYnf0H2lE/Byz3beJAxs1L8bTrC32ct3tp9AkE1yh27KVoOFEqik
         KT0hhWGcrUG2w2x8hN74/Je7B84IEqieiInX+8HY9Blp8dir/sJdAdAk/1LJfUw0lsib
         RJ+btpCGI5y/1Zd2IODf2ID9yvG5XHjllxGUiREe+eJhqGizhcaWWdLn00XBqWdVf0kz
         NYvpcoiAP3RvvJZsf/GqzLAMjft68j8Ob88H6Vy21wDvE9K3H1U5WZZTfnzmAWUgrxpY
         M3YiQMkGcI4ABrWgLRxkOYqXA4+NLtyUdVngL7chLV8pdYBSuWpOqtwb/3GPQiuo45mn
         DMPw==
X-Forwarded-Encrypted: i=1; AFNElJ++YeBNOXf14KuKayyXf6NyWO2yvs5bBMGXvb7UNLMWMe23S6/jvRQFcjbsRkDNjgm9ZB7A/zek9hw0n6Ur@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0JZ3neYeY4nrIHKMN0mySDXZTej+5Vp85QMlvkmL9Yh6vHeGB
	Jd9dAsqiUhXuoy+3WMFZk2FRVC/nkj9n/+rNnwkr16zpCWMZH0J1Vwi9TJ/RUQ2xZP4CwadiGdV
	nsZm8llHjTV4C0d/BJzqrPg4MM8PWMUKv8SypkLVx8dHh5R5CCZe9BJqGAROICa0N9Fo9
X-Gm-Gg: Acq92OH9dgg8drP84KjA4Spz5wREKpDLdpGD9wTWXYqqIv/0aFFtvHzQJbOJolvlazk
	BQ+Nw/6SQ+EgCuetyNuCP3vQO9SN0qEZGy4mIrrs1HgSfFDwRepWcbvTIRksIfFEWOwsJyCjlpm
	5DaFDFLyLraa0WR8njT6Q2ITg14qGAvq7H26WIapdxYT+8aE0DdCShSAKqJUnGClnFbAC+LRExc
	x75Z4oTfW6tzqrbz6zCt8kHjH1CPOSscVTYFkBDuprvfEx79PY84nnEJPxiHlBqV/8SKk/jX2Nw
	g5dUyhFzrjouwcZ/upp7igi7+JAU1Lg7191iEAlZsxKjnxT6A5WO0IRu486suoCq4iUUHEya1UW
	ZhvdnYVVsV6s8shPUL/NrH1VVK/h+BzSKVOU9wBH5p78js+3HRviWd9+1ggxVCWD57f4x
X-Received: by 2002:a05:7300:e7a2:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-303986948camr7474778eec.27.1779169647106;
        Mon, 18 May 2026 22:47:27 -0700 (PDT)
X-Received: by 2002:a05:7300:e7a2:b0:2ea:b85c:153d with SMTP id 5a478bee46e88-303986948camr7474764eec.27.1779169646587;
        Mon, 18 May 2026 22:47:26 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffdf0sm16288683eec.8.2026.05.18.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:47:26 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 18 May 2026 22:47:17 -0700
Subject: [PATCH RFC v4 6/9] phy: qcom: qmp-pcie: Add clock and reset lists
 for secondary PHY selector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-link_mode_0519-v4-6-269cd73cc5d1@oss.qualcomm.com>
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
In-Reply-To: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779169640; l=4489;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=6l47wGwpcdS+i8z+96tTAR26f2jAl5baUJvJx2wGmVk=;
 b=tI+M9vo4rfmkJHBISreYDBHdrX+sGAXFh9++C+YnE/xQL8MIXjFsLioMqHH2TrO7750kRU3Nu
 H8j3v/bQPN/CNxaRDMTldfJKYU89Zz4ECL8idv4ADT7LCrZmQHTaRFf
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: Zo7L0oI0D2DSpd0UffIE2wwTevx3EcD6
X-Proofpoint-ORIG-GUID: Zo7L0oI0D2DSpd0UffIE2wwTevx3EcD6
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0bf96f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ee-eAjM40MESQSg1XYEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA1MyBTYWx0ZWRfX079A6Dz9+PDq
 c52jTLpAguIoJKvBxcPOb/ZCruyvYYls42wxRnCYaReweqW6DhAnXbE5dYkIVUZUbVHWRrrvXTd
 zKU0CsHSfumeqtxlENofOKRjPPB79CI7oYf8pCGtb18zhSTGmd9UkuS46dxMuYtaPH+IuM5mzUK
 u+0pfZ14eAPnTHFBG4pCK/Z3Ru7jw0Uw3OMF/iCAIKWFDL3ZHKz+/L/Qdd1clV25O9CMoQebyM1
 4KCrKRsZPoLroq2vJZnJQ3G1Nwad8Zfyz8kaLo7nBjw31nshctfkZd25Y6cqOKPVVlp6MgUPHZx
 9fdE8cp23gjaiMWVMG5vQpAKlR5yBjkTcolqgj5O2DS1UPPJvYOJGJrPI1MIhD62OJI22FGh17h
 YBbVEg7ZtEXgzQsC5arvUl9nkwWwssiJ589lp0oLTnbAlohl2r3eJ+gA69yNFuxfDElapRNOu10
 aH/YosON9M8ns76jtPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108327-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2FC257790F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PHY instances sharing a single DT node each need their own clocks and
resets. The current driver uses a single hardcoded clock list with no
way to select per-instance resources. Add the infrastructure needed
before wiring up multi-PHY probe.

qmp_pciephy_secondary_clk_l[] and qmp_pcie_get_clk_list(id) are added
to select the appropriate clock list by PHY selector index.
qmp_pcie_num_clks() replaces the hard-coded ARRAY_SIZE(qmp_pciephy_clk_l)
in qmp_pcie_init(), qmp_pcie_exit(), and qmp_pcie_clk_init().

struct qmp_pcie::phy is replaced with an id field so each instance can
identify its index within a multi-PHY provider.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 49 ++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 6332f15f78ca..b100302be12a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3335,7 +3335,7 @@ struct qmp_pcie {
 	struct reset_control_bulk_data *nocsr_reset;
 	struct regulator_bulk_data *vregs;
 
-	struct phy *phy;
+	u32 id;
 	int mode;
 
 	struct clk_fixed_rate pipe_clk_fixed;
@@ -3379,6 +3379,24 @@ static const char * const qmp_pciephy_clk_l[] = {
 	"aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
 };
 
+static const char * const qmp_pciephy_secondary_clk_l[] = {
+	"ref", "phy_b_aux", "cfg_ahb_b", "rchng_b",
+};
+
+static int qmp_pcie_get_clk_list(u32 id, const char * const **clk_list)
+{
+	switch (id) {
+	case QMP_PHY_SELECTOR_0:
+		*clk_list = qmp_pciephy_clk_l;
+		return ARRAY_SIZE(qmp_pciephy_clk_l);
+	case QMP_PHY_SELECTOR_1:
+		*clk_list = qmp_pciephy_secondary_clk_l;
+		return ARRAY_SIZE(qmp_pciephy_secondary_clk_l);
+	default:
+		return -EINVAL;
+	}
+}
+
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
@@ -4781,6 +4799,13 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
 	qmp_configure(qmp->dev, ln_shrd, tbls->ln_shrd, tbls->ln_shrd_num);
 }
 
+static int qmp_pcie_num_clks(const struct qmp_pcie *qmp)
+{
+	const char * const *clk_list;
+
+	return qmp_pcie_get_clk_list(qmp->id, &clk_list);
+}
+
 static int qmp_pcie_init(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
@@ -4840,7 +4865,7 @@ static int qmp_pcie_init(struct phy *phy)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+	ret = clk_bulk_prepare_enable(qmp_pcie_num_clks(qmp), qmp->clks);
 	if (ret)
 		goto err_assert_reset;
 
@@ -4865,7 +4890,7 @@ static int qmp_pcie_exit(struct phy *phy)
 	else
 		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
+	clk_bulk_disable_unprepare(qmp_pcie_num_clks(qmp), qmp->clks);
 
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -5079,16 +5104,21 @@ static int qmp_pcie_reset_init(struct qmp_pcie *qmp)
 
 static int qmp_pcie_clk_init(struct qmp_pcie *qmp)
 {
+	const char * const *clk_list;
 	struct device *dev = qmp->dev;
-	int num = ARRAY_SIZE(qmp_pciephy_clk_l);
+	int num;
 	int i;
 
+	num = qmp_pcie_get_clk_list(qmp->id, &clk_list);
+	if (num < 0)
+		return num;
+
 	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
 	if (!qmp->clks)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->clks[i].id = qmp_pciephy_clk_l[i];
+		qmp->clks[i].id = clk_list[i];
 
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
@@ -5414,6 +5444,7 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device_node *np;
 	struct qmp_pcie *qmp;
+	struct phy *phy;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -5468,14 +5499,14 @@ static int qmp_pcie_probe(struct platform_device *pdev)
 
 	qmp->mode = PHY_MODE_PCIE_RC;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_pcie_phy_ops);
-	if (IS_ERR(qmp->phy)) {
-		ret = PTR_ERR(qmp->phy);
+	phy = devm_phy_create(dev, np, &qmp_pcie_phy_ops);
+	if (IS_ERR(phy)) {
+		ret = PTR_ERR(phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
 		goto err_node_put;
 	}
 
-	phy_set_drvdata(qmp->phy, qmp);
+	phy_set_drvdata(phy, qmp);
 
 	of_node_put(np);
 

-- 
2.34.1


