Return-Path: <linux-arm-msm+bounces-102550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPXcNLER2GldXAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:53:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A633CFA2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 22:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D925D3032072
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 20:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D709344DBD;
	Thu,  9 Apr 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yec0/o1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjcMaJEQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F5B33F8C1
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 20:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767906; cv=none; b=Vm1tSkWogMm+7ETCLvmrKf14XGZ4VJOtUrM4FrMdpbdAaF2Xnh9st9YQWBty9f5whZmNQFYL96UJ5DcULJnTl/Gjc7O9gahjVGqXkJCyWAeaXvQ/G5/86Nk3FnoxX1IaRWSyD4RavKsZYzJnPuAgoc6gQ7U20GMefBFECAdgjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767906; c=relaxed/simple;
	bh=CCX5ERKILcZef6gbTvaCYDy7WMKbpX9Nk1m9SGgEkGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SmM+TFqmv9XW5duSKx4wW7YaF78B39UL3cJmRJJY9zYfWcnnw2WL/lREmq450CVtyyh/BbZ3fgWDWDFLQiaB1xrW56ualkJJ7e0lcHXnj6gk4+Wj7P6Bhb7RaOB4XAsarvZHkpp4J+uItoeL1kamW1debKk4BmkpWLacoACz1zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yec0/o1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjcMaJEQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Kbia31433097
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 20:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=; b=Yec0/o1ip3fYenUT
	MKDF+8zhwoM/XX4Ut3KTdFyWpemI/rosgl8JMWOHDcJd+bTykWP6nPckB2wzBenM
	+4KjzVKrDRv79uvVhvT+u6L121vR1ghCcxj2m465N3Pyx9KYNtMhjB6rbeI0sUyZ
	Kcm2Nqaz21gvyrklc4YQ6kiF6JkbLHbpQQKiFCTPeKiVjZSrizm5nVMTMjaV+jVQ
	jk9j+e//Rz0VWaWvDXGv8Fmve4tqUq3UpfsVajB3sFC2eETkwJO0Vba3go059VVF
	X5+LRGev3bnsOmxfyYeFYpXfqROHtf679zhsWsTrc44O9n7quGUSSedZxGCC0nMC
	F41cqQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckf9npq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 20:51:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so5430076eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767902; x=1776372702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=;
        b=WjcMaJEQT+PyBS5eO1Y1WID4bsQ0aWaK5F0oVUfNCKaT+XjRyzyiBHP/sERj8AcY/T
         CTZ7+y3CO3FcVXl6z7PmYgkUCYJG8m+t1vW7lyaSaxVBf1cHZS6XBrbkzqslaECz/Ogc
         tyWj+DC+2RHpL8BYi2T7PG9JwOJSVr+IxCiw1D45UaH8H4yY4Kpy7OczBH1IcbdvBQnO
         uxsxVBxWZx0kAzs2na/CJDbhssCVfXenOfKBnwc4B79pir5/BBJoECPHlo0MFx4Wch3e
         lA/IELmNRJCTMOmYljaFBN5tZTtJCpArwiSyicXlqxIn5ySX3312OvUkXyuEQHYxMV3e
         z3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767902; x=1776372702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=;
        b=r3ilYFis9/FcVPHCRC1rqGyn6rQ0Mbvtck01HDxbiJ1iLLVj6g3kvEdfz+ZLQVqssW
         Bz8a+WZxslU//MvBKGgi99Z9MIN5ZbjxxTv/HmDm0ib8+XM+TH2qOujMzHDGDyv+JKQO
         Wt54AA1rlB8Fjlq3LJUJQd66pUlwRH7iBCF3fiyfrMHGchan5neYPIoTm0YYbwdlLlPs
         qe1wVOwPIvNpgq/7I1tBh6TTkrbsKgilND7DG5RFJezRby/Iz/JETvEXBNEQluTVR9FD
         1Ufk7nb63iywzRw15QuyFeOGti33vL7mu610tpLswHb1esVfi982nLnldKD0Y45JHHBH
         mX6Q==
X-Gm-Message-State: AOJu0YyZNcWVw5Iht+CgZInZFW+RXpLD9HhFT9MvvC4GwfCeFvTk9B4A
	WqdaTj48Jdn4V46kgD6VXWUPdM1lqOwUmcCcjxEaBFO5kSFqaKg8W9QAIuJNPNoOcuqz3/PZwbr
	o2voCs1AzuvztxiA2G6mV4RUjY1rOeejw255cZzvB1TkWbxE0W0xSL62GCLT0J5O2rnT8
X-Gm-Gg: AeBDiet2LMhCy7bwElvGjK8PchxeaEm/jHkSdrL5AUkf/h11ZG6jWLKUOhxVOAtr9Ys
	VIxO6fjER6s0GJfH8acWO711SrziusmSe/uNzCmJYxDIPYnjSaeXgo+VdKU0u9qpYFP4Cy3uEHW
	P/ee5NSuj2tibgamdeCgo5dVoSE3ipm5xYATiddaX29BLGTNyGeoK/VQpWyoZf54ts0spEEi89j
	I+r1KcxXbh6RhRO4M3n4baVnguf1Rs0eWmJwwdG056wBfsazpdDF55zFxWYlIDHq0xgW08ZLij4
	v/8OT/W94VCf/Bkf23qw6Avl/PQIw0fTZI698R+whZ+PZ3QdPclVhM+rN9tGTMdKMMhlDYmnUKA
	CjEqGrSN+Dtxu/fMybEBJTy8R673G+ZwHtogOg2wxPuq8CWu2g3Yg50/D3BDIsvfTfVg2DbGzvn
	AB
X-Received: by 2002:a05:7300:8c85:b0:2be:8216:57db with SMTP id 5a478bee46e88-2d5873ad987mr327350eec.3.1775767902457;
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
X-Received: by 2002:a05:7300:8c85:b0:2be:8216:57db with SMTP id 5a478bee46e88-2d5873ad987mr327326eec.3.1775767901923;
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:38 -0700
Subject: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=3000;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=CCX5ERKILcZef6gbTvaCYDy7WMKbpX9Nk1m9SGgEkGo=;
 b=ohN+oVkVLRFI03wdpX/CHpGmLrH5oThDRRHLNfPNiwFVUFeHshBcMiWnmnAwvKNSc9TWCQ6fe
 UYA0tYj3xIjAZtFb85hrcKVcreCWxCtueRnnI+r3S6x5ADrXNBJZBlA
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d8115f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfXwljIaY0AFtX2
 ZRTx33vMOYBq8IkBgQF9dZGQT4lOd67Xe46ShaD77DI4tTCNeHCcKOvSBDwfHSeNPByueCdvtxp
 AXtxxXMBfkHYL7Tjjqen05USo1C9ly9nnI+2srOO+mmvsHOV7UR0LMD7UHy0MpJX1c633aIQYJd
 U/oJkxTlBzH7Psb/OK7f2mGaYHpVuZJieuDMUqx6ai4SQ9TwckeznZw2nW1cKpfZAYfunQvhdWs
 pmStUrFgxLQcEeu/c9l7Og2ocWzjIdu4lwMZ19R3BxOi/sOdltdeRqf/lB+F55tqwrFju2eXkeM
 1pY5pALB6HC0/j37k3RaAEZDcYLPTVMQ43OEvKtff5xcIf0dzA0ZGUkowupoL5amsAqUrxDyRbI
 9s1/V1e+RRHYTUE3YR93ID+m9J30kumjfoeRnx90wsAJhIsCh49/NEVCv2+s9HJ26vPJ+LJC3pt
 BrRru0cDxk9qFC9gXSg==
X-Proofpoint-ORIG-GUID: 0oVaTHa-kBbUWZET2Qiz9njARVFnPFV8
X-Proofpoint-GUID: 0oVaTHa-kBbUWZET2Qiz9njARVFnPFV8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090192
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
	TAGGED_FROM(0.00)[bounces-102550-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 42A633CFA2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add RPMH clocks present in Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae..f9084c15467c 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.34.1


