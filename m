Return-Path: <linux-arm-msm+bounces-110037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGCoFPupF2qhMQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:35:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5B05EBDC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1853147B51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 02:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B732F547F;
	Thu, 28 May 2026 02:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idCtpraf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLZTPW53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848152F8E8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779935371; cv=none; b=bIUrCzxlue4zWpWGsNpng/EOpvId7GEXgQsPt3VGKW6l/QXLH/aQ7fjVlIZwEd+BD2n3Zv/Fc29r8DsVSjWTvsVJB+MVvNT/dXMpdp8a+7PjkBsCcWw9Y24fHgdjmB6mljUVI2Dx0+s4nEHVLEEoIx7fWLox4K0eKiMuWx4OVoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779935371; c=relaxed/simple;
	bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4WUObVs2rR23D4ClxLfff810DBrDK3F/ZjJU3y4a3guUrfiJX1Gm265ilxxrgCg6HG9074UOOLXyn/9eVBBKrNlZ0CZl4wyjCJ5Aq9D6dY762NHHbaW0q/eFSS+VQuQnLn6CQYm982kERGvc8zHC9fk61WBS0ah1fCF0V2OnE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idCtpraf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLZTPW53; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RKlk7w125217
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=; b=idCtprafIt4IyKEj
	3NzC7ZMUZLCQ9ldaJFrvxD88NaVgxoN092otJgYxFwCwP1tGYaIKShJ1QKtgnrY8
	ELTfWGRfbnPro3Z/kZ1cvWISIhiNS+VX3YaTJ0GO0F/hbxATM9rYSUG0munAlK1A
	JtZ0F99hc1B3zsHHXyLXegflWF7Ewb2QZ8x1+ZakYxxNX3GXDZ+PSLeSqjcBQbiL
	AUmRRcCjSaVjwHnsLHY5qDZ3tc2SnwkwNKqwFREc6ONq7cc+ZT7e2CVTaSSd3rpH
	at3ohdEI5OW/yJhXGRCk26NZfxttZnClb4v6wSGWWKVtcmH1U4jwC72cuLPY1aBK
	YVwvZw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yagyct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 02:29:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304cb3508e1so2459054eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 19:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779935368; x=1780540168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=PLZTPW53pPkJHHWPa6PaoSkW+cnsBtMYIwPFvCUOlZC7jRazSHtl3S3TIDD63LsnoS
         zV4/0U05DsqvDrMtYzjk1+IXKtuM+jsxUTvR5+RL/2oG7I7i3+l2wJ7+D6cHcrY+WhnV
         jx7pWzwmEfqjYKyvX/ErJyX6sGV9JPwPuxtxPxsSxRoQS4F9jKNNaq3YloIWGTtASZwh
         cEMUxfMGsbqizqp5P1XVBt/sxtzEmJTaMwEiFyX9fUQ+uogLBd+FcLVJmm1T3FAJAUu5
         BBqT/iUuoe5Z3+xFGuxphXqrkywUJ97yRDQuybqE2vRFyzfQbKlDiMw3pAQHp9+UMQh0
         q8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935368; x=1780540168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERneOOSqk3fJDl/IDfF7U0+PswB+KENJBSCUoP3GiDM=;
        b=Rr6at7CqUU3BbCdLK3PdQUh/x+fqziRs+HkFzBob8c2PcS/yhJJi+OvL60RIRJYz9Y
         HrCU+VI8sEUQgBhMKif2ZVcgc9X6/6CK6LLZVXT90WbrVFefG4FvE7c8lqgtcBZbq3Z6
         US+bVcIh+UVfFlNdtgWfo08sJdU0OHunfLp56e44cjbNPPfPPFFRExrvDIcESINxZ0Tq
         CH4g5tX/hWwSnKt5DWMMsxNx9igBgha6EmsDOrB2mf7I4oyASIOu8a6DlWe+iS6LOLEy
         IQWmd2Eq/GPQdfKGVApas5rxez+KkE/gPn1zshG+PMMB2is4+VkqQdSDqVkDKB8pi4MO
         7psQ==
X-Gm-Message-State: AOJu0YzzO551ai16TauaJ6tUEInPal9kKUKzTqRVPCx8wRzYw8fYwYxR
	8IH0buvIUwpNg5MpRWdGlC2jFXelOfMKZ0J4FYdZZ6/gfn/0xHagQfKY7mllmAw9NBM3u6F7RfR
	AcP2pIgtNKEtSt899QSMMuicTu05Nnd3RbFiAvR5lhl8pV6O71b1zsfZw/R0f08xbcs/b
X-Gm-Gg: Acq92OHIsjw7feM8xj+NG9NidP07HdtqwN0da9JEys3b0Ob8Li9oO3ZO/J4qRdI6233
	73qCCmdOqFhlknD5MLwFf88lYjChs1o5Sr5sKR+rQyw0zfAszBqaPjDmrleddnmV8lkqrKBMnzs
	QfX0w7Flu/zoyDZ07bRCD2fpOHDmGycR3ExkNq9ZT+aUJPhvXINTxZZaGlrvZc8fTqZhHJ8WSfg
	/iWR+oiWp4qaTtxMiDiMmoSJflj1rPN1pmaRvJsntu44trgT4+czk0W86j0BE7Wloq85OzNHkMu
	kNiE8weZa6ccnbUnaKh3cm47DlqYgdmlmywi4hEJxBJeTfjWNV591vfZr2K8PmiYIKgDEi/GErG
	2CBlSjm90IFgRusaIN7sZEW13j3ine178tc15sqwPMj9m/MMuPCywtXdz182tOLwjnlGEzccJTp
	IDCjU=
X-Received: by 2002:a05:7301:2c89:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-30448fbf229mr12039186eec.7.1779935367948;
        Wed, 27 May 2026 19:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:2c89:b0:2de:cc07:e99 with SMTP id 5a478bee46e88-30448fbf229mr12039164eec.7.1779935367472;
        Wed, 27 May 2026 19:29:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304d4222060sm691653eec.29.2026.05.27.19.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:29:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:29:15 -0700
Subject: [PATCH v4 4/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-tcsr_qref_0527-v4-4-ded83866c9d9@oss.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
In-Reply-To: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779935361; l=4461;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=wsIfzYkqIgUdZWrV5+PdN0Qh7eYY91KcaR7Usw26blQ=;
 b=K48SexN3wye/ZO6WKJ2IfUX3S+Jtx/LZc8dZfpxrb1CrKCIMCldBrgAGtX1FPo6SbPx3i1qJ5
 +otzLy/0bAxATdrXkROALKiKlps/p8nqna2YVKDo5cKC8qyOJnYv1ht
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: f21qgB2FvRTv5DbSacx_gAWfHmpYfVbf
X-Proofpoint-GUID: f21qgB2FvRTv5DbSacx_gAWfHmpYfVbf
X-Authority-Analysis: v=2.4 cv=E/r9Y6dl c=1 sm=1 tr=0 ts=6a17a888 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ejsaoIeHybvuXmj4E6UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAyMSBTYWx0ZWRfX0HYRhO/qdfg8
 GIHydKLsgWPwsEbCBkdSN0gYyiDgZ7dh6cssMq0vpqEwukQOi6CjLezauiBkbIb8zZUe6RjUUTl
 FkxgdpgSeQYspR+++bLC39MV7ry5dBjr/WDLDiXrx0xrukTWO9kYaSieM2qQNkIikIwgRYnJE60
 hQsL1rLHda/LhMyD+hNfXLOI5/fH6Nebu05VEbjN5YJPj9knmvlRD6ocjNC6MzfCVRgM16nchbd
 ntC+3eAgu1Nki1WVJ06vyIGCXRzal1jhZLqb4CPiOWhLzgFfolpLZuRPQryUtqhr1mg47zpBgix
 gDIz7iFruT84WDC767F1MOSSxU/Zi8Zke05gWcSzvs5sciL+rrj5zIRMR2SjyMSqgkvq9eLzNP5
 51oSE1KE0RowEV0KD2e4yLU8UQtBYuFHezgw8cl9tSIdFLVsPvMp9WWBrs3P4iISTWCq1XhHZRu
 YWivgfdV9vPT70GMsHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280021
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110037-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BD5B05EBDC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mahua is based on Glymur but uses a different QREF topology, requiring
distinct regulator lists and clock descriptors for its PCIe clock
references.

Add mahua-specific regulator arrays and clk descriptor table, and use
match_data to select the correct descriptor table per compatible string at
probe time.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 99 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index e317003398d1..deca9b8794b4 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -13,6 +13,11 @@
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
+struct tcsrcc_glymur_data {
+	const struct qcom_clk_ref_desc *descs;
+	size_t num_descs;
+};
+
 static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
 	"vdda-refgen3-0p9",
 	"vdda-refgen3-1p2",
@@ -40,6 +45,25 @@ static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
 	"vdda-qrefrx2-0p9",
 };
 
+static const char * const mahua_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const mahua_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -111,17 +135,86 @@ static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
 	},
 };
 
+static const struct qcom_clk_ref_desc tcsr_cc_mahua_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+	},
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
+	},
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
+	},
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+	},
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+	},
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+	},
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+	},
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+	},
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+	},
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+	},
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+	},
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_glymur_data = {
+	.descs     = tcsr_cc_glymur_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_glymur_clk_descs),
+};
+
+static const struct tcsrcc_glymur_data tcsr_cc_mahua_data = {
+	.descs     = tcsr_cc_mahua_clk_descs,
+	.num_descs = ARRAY_SIZE(tcsr_cc_mahua_clk_descs),
+};
+
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
-	{ .compatible = "qcom,glymur-tcsr" },
+	{ .compatible = "qcom,glymur-tcsr", .data = &tcsr_cc_glymur_data },
+	{ .compatible = "qcom,mahua-tcsr",  .data = &tcsr_cc_mahua_data  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
+	const struct tcsrcc_glymur_data *data = device_get_match_data(&pdev->dev);
+
 	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
-				  tcsr_cc_glymur_clk_descs,
-				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+				  data->descs, data->num_descs);
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1


