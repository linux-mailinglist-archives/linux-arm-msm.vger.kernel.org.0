Return-Path: <linux-arm-msm+bounces-91055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNRpMEExemkx4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:54:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D9A4B42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A28A306111E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8635242D7F;
	Wed, 28 Jan 2026 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pI5MwmJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHaGrQny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241B302741
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769614998; cv=none; b=rgqqtn4bJA6nJ6Bl5+8NlmTAj7a+4XkwjBX/QVQt02S0Gl5b6Kl1EzEbJs/WJ3Ngko4ihEvb1mMYIZDBqPSCOcyleWPpdBBYUfCtqoGuGSe3OsJEPe48y/jc0sS6JfCQM4lcztvM8Q96f8NzMOPnpjo/dL8jVlw2OXZ/2+0FvV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769614998; c=relaxed/simple;
	bh=uAdUi2PcEKOUBFsGcYGabugs1F7YktxD7G4E6g/mjeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNpGnDNdTQQ0TEt9OfFaEX56jMvIWFlou8LnhPkDInF3cbzCNliOOq8noQ772cNQiJPypiapbXbiSAIrSwnGQQlOJdyP0ALaUmV3Cv+bfk7LBM467dBjBh+vnCcFNcmZ4bSEXjFbvD9qlZbZ1D+SaYIW/3ipA4vJe3unjG38nqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pI5MwmJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHaGrQny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFWpQc811663
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvS
	cNCLq/go=; b=pI5MwmJIgCsNpLQMgIKMm77mkOWsaYQ8K1qX8GIeyLq7rkfQ8lp
	WC2zilQEJ8qk07yht+8SPVwfGZSt54mO0wC9cc7nPbR+Jy9FJtgrCTA06CdiYyLU
	lozTWufwmQBAatB9iXrXZBMkIdJI2xQ4RZPakz9i2izUURmKOmP3X2yawMkALrVd
	YGCec5XpK9Wk5QuK9o+t3Tk/Cft092gofZptDFguVgkabJnPxysFaNocv9r1mJYl
	Xyg2NP23edokFNyxLAYu4FPi2UHimGlLf0yv1BlnwM4tEutYWpE2q62tme1Wfpnd
	lObeRG77Sdi5XW2FzKzUnxXtHEAUxTuascA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbk7sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:43:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c921886so766661685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769614993; x=1770219793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
        b=GHaGrQnyLTQY1agQlkQuWjSQxH+ITcP7pQwaAB6QSpRD1/fDVh12IYaCzBNF+P31AH
         MXcqSULQOTjLsnzwZYj4Ijfq24gdZDqLrhNi+JkG14oEJxcT4K2SnY3z1BIbRaa44GLF
         F5d4iu2ZhX4BdOioZb585A9cvl2xUpNFa/yU4hP+y4Mq2G+e1dIL8ZtTYijfnpEDjoPA
         1pTerNPgryFfJjTL2e7O8qHX0diF91igPQfBxt9FgTRl+XzSHXaAPLCtd2J5KTzTsqBa
         5wE3oynPdCAiGca39AVMayTxi55YP3AOe9gKV61/eeapmUX0eVHA/6rpBuy+w4Sq17mC
         6d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614993; x=1770219793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3yfVqchQWMJHTTJ91dDeCW7/cxzdTD+XvScNCLq/go=;
        b=noCDlynMBGN0Gi8OfVtgsS6jOspq5rkNhK0CnYV2rhWqoTW+vRYmVwxJmg6we9s4Jg
         UzAjp3EMFWy6/0lHHZlvR6Rx3VvPGHpWOb8v+g5muuOuavA+wKxeKWt0zVeH8/iDXvyN
         duYjFknDw89fZLeJ+qZO8kgU+Zu9ag7sSdO8FtfWdAZjNxzWoHSna/dAsg1+COgsu80j
         zdOZ122gvLXWggdjF/GRIhno/Ss8PW/VhtU6DWFZcYWeAmc3G03jD79uTqB7Rkk6op40
         CtL+2+xIkyCbAiletLbab32jOzUjH9zR1GPqu+vVDHKBxDiEwEAe3K3ZRo75aW+wOHYc
         bNzA==
X-Forwarded-Encrypted: i=1; AJvYcCU6rohCj17RJICQ+3lkqIiSmLxYk6vyHbacsEdUblH5xLMkJczZHe37hqJr/OaBj8F0SGU5Cre1iPAN2pAk@vger.kernel.org
X-Gm-Message-State: AOJu0YzSoo/HCreR0J6T6CtYSgG95FpcmNH09CJXBqV5jyHBaHLRANzh
	/38p6rKL5aylx0MTHePzEtd5ETsPYc1fdAbhYlzj55hTQYdl1EUpwebJ9MHjlkYcKLhjPNbHl5A
	r0gIz1nYQRg7eHh4Y1r5HR20hcOTacJPsrlZ16FBj60ot20Rda1rlTmRnIhwu7xvNUh1v
X-Gm-Gg: AZuq6aI7MkkEqVaKJtPQApFlKrdYsYdfnpibs0wA1uH4B5A/IE3CE/zgGgpYuaMFRDK
	errQRNkjR3sIGIQf74ar5Ui0hnqKB6rQcO3puSUeZi2jCQD2JI56xF+Oh7uVy1/vOOssSc++qfM
	dNF5oEDpHUl3oTfCOnICX9zH4JZGNsQvAYV229ixK7JmRSMY0bIis4rvYE/E1mF6Tx3HR5Tj1QF
	UYlcMtC5oiWc0gTMPeAitYBgvE4g4zVsR70r+L23ei4279HZZpuMsD1ZqukC8OS9YzQ3vSPJY38
	x2Jaewea9kjwA+cjK+XGMhzUnKwxWr79ajT1/HJoXemW4YmmPHevJMxqstmTwcqLXJifKRZdTzW
	CHdErwuZMpHILvzNPDmK6cXh9Ow==
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c70b90f77dmr676221585a.70.1769614993351;
        Wed, 28 Jan 2026 07:43:13 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8c70b90f77dmr676206585a.70.1769614991262;
        Wed, 28 Jan 2026 07:43:11 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354205sm8003551f8f.41.2026.01.28.07.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:43:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: sm8750: Constify 'qcom_cc_desc' in SM8750 camcc
Date: Wed, 28 Jan 2026 16:43:07 +0100
Message-ID: <20260128154306.133047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=uAdUi2PcEKOUBFsGcYGabugs1F7YktxD7G4E6g/mjeY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpei6K6nwUOJpgDl7kWWIEgfjSRExvZiycp4pGw
 WfIx5JujLyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaXouigAKCRDBN2bmhouD
 11PBD/0ZygzFDBZ9XPkkHolSm/vx7daUl7dBNJxgRosngJmB203l5VWqsZXQ/g4yv8v8/rB/H7I
 VzabTmmP4kzKBzfVQ0WL1ww92RpfDkZ29rJea7Zq6MC7UiMnO+b8O0mkszoghxJdjwCo/uvLUWW
 aRW1oP8QlTD9XP2xUfeNqLjOt95WzAq6zjCqwYrJz/GltGbgdTr7K1rtjfnafvsE1w86wiL60Xf
 MCN4atase69g18LHCtU1Br4YP5BxluqTT8XlUhd2L9Xvbq5Cg4GMno/uBXfuSdIDWUATz4Ay1Xl
 gnPF6WAC0UdsktUYcxUEH/XrXekTzCOWOvTl0cy0VaGXQc3tkmM145rLWPptxIW3vKpbRu+v2TC
 NFsCbL2RW9IAeCfVF0kQcFBldmWdoNNDS1/Xr59vg09eRR/LqhFkpIez1Q8OBLV7VqtJgJE201F
 z8KXLnIuWLhu65H8X39TBy88FsfNjUxu0pHucFIOq8sy8sLVokM1xSd7ibHNvUevoF2vb7lSBUy
 sl5q8WWctr/ZkbRaxh/UukLybUgKnNbn+0nYc2ErpR0cKQWrNMJZ4IjpmOoRH6wipwqIn4MSb1M
 wiYvnA7e2dQ2yLa1nuMuKQEAVPytnLnrNaZGisqLxoiKMF2u6vVPr5En5bihzfrwyQOQbu34kmN kSoH2O7xd0PyLwA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GDX_aPW-JyRGzbvwEanopqGCGsDikNZR
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=697a2e92 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=euIjOI2ikgTaeCi9kv0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: GDX_aPW-JyRGzbvwEanopqGCGsDikNZR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzMCBTYWx0ZWRfX6nbuVxK2gjks
 GIrqGxhk9grLO7fyNyw3gwxBJ0IgupmTumM4A2oYNFjxunzIJI75Uj7tPo5h+m2k96TnxnfucTi
 u//d1J8IrmJBu/lchf7K5E/bsO5OwHMF56PyJXxbZVwkyGcOd41JUCv0eQZRh3KfbVYAPUTjjmv
 pCycYsVcUQUckDKUkNMRMa8dKdd8vjYRbJbKidOFDc6WDqlD4jcOTrRm1wIoSROD0GMIgQHvVi8
 nJjWHsoD8fBNKJaFF3qUHSpQHKay2v56ZJqxyRRMSZ2EesBFQSXDpU6QJ3dp04VTTpW2/vbdHUa
 xyk59TORBYLAoxu5ZWynKDRY05QO9jyBxmzZTIgU7o/t8Ms4c+bVLKld6o5Mq45tEl0+TbSNlNZ
 6eQo1gVJqJjRIfHL6I3vSQhTEV7IK8BtCkIAKD3rttlgXFKdfbcOh5Eu/uMY4kR1MpNzVEVIZud
 W5FcHs0EiUJpqzXxJvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91055-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 597D9A4B42
X-Rspamd-Action: no action

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-sm8750.c | 2 +-
 drivers/clk/qcom/camcc-sm8750.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 952581f86db5..d889a8f6561d 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -421,7 +421,7 @@ static struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
 	.config = &cam_bist_mclk_cc_sm8750_regmap_config,
 	.clks = cam_bist_mclk_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8750.c b/drivers/clk/qcom/camcc-sm8750.c
index c09fa75be457..a797b783d4a9 100644
--- a/drivers/clk/qcom/camcc-sm8750.c
+++ b/drivers/clk/qcom/camcc-sm8750.c
@@ -2673,7 +2673,7 @@ static struct qcom_cc_driver_data cam_cc_sm8750_driver_data = {
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8750_critical_cbcrs),
 };
 
-static struct qcom_cc_desc cam_cc_sm8750_desc = {
+static const struct qcom_cc_desc cam_cc_sm8750_desc = {
 	.config = &cam_cc_sm8750_regmap_config,
 	.clks = cam_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8750_clocks),
-- 
2.51.0


