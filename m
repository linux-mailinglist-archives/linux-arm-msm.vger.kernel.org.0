Return-Path: <linux-arm-msm+bounces-106150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP4FHahy+2lgbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:56:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1667B4DE6ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5031830AD7F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B854ADD9B;
	Wed,  6 May 2026 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4GuygyQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TyYryf90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1A4A1399
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086300; cv=none; b=nHQVkUsPtuLzdOw0yK9VtgXVsTqvk7HCeKBy4mAf3ioQc/7dWQvgQ6P0bHc7HPzONCr64YdrU79oGU6crx6lKd0uKiR3iVU+Z66EmvsEXNva6vOVVZTT+p98BJ8CaYDWpn1e8WqPJBHH4Hmy7N8LaGsYRNppws+a/HeMLK55R2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086300; c=relaxed/simple;
	bh=40NxVXovUiixWCXyomPxXiMim4vp3tig+MiKVM0oErA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k4WYmYgg+NUbXLv7VSu+TOr1YzI4kHwQNSBf45BrQaC6/e/Zo0BwMmWQ/ORM+/U6/5hkXgAAr3p7zV7dNVqw0XzVberrDnsYJsADGQ0iU5h5omlKjldAuHBHw6OfuR3k21ZFLRWj9mvMD1rqQTha1UAvwM7FYc5+/6ndo6/QTL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4GuygyQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TyYryf90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EFlDf2427624
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 16:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=; b=K4GuygyQva6PX61I
	xQEL8/0NtzhsXP7i3SOXqrGXW8baguTS6SH7A2a0XUdZLVEPDdnNv6MuSHXfaKmX
	7Wd/aioOwZ/aBZRXyB++licGlu7XzaY6JcBOhNObeOWoRVFCxUnhdBKepUowUZWf
	9YKN1SRulMpgOipbACXr4v3ZMOb26sLD2CB0pBz1eo4D5RG4q6GBalz8wS3K6ZnA
	1QYx6PFsRYzUDo1G6pe/7Y4CNBCoZQ9pYObQ+7YVqDQ2HPZm12pHWB5Sn3S9CM1M
	Ich/tQ9gb3xT9JYUr+ACHI6yYmxTj0JZRxbvNsq3zyDyNn5ZKwjpBUDtRU/WfWtF
	8LxsGQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01ph23e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 16:51:36 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dba1e866dso940068c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778086295; x=1778691095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=;
        b=TyYryf90ouM9yxdY6vIGOsqcBAvhL+oOJbqheggO1pe8xFRuHid+7mjA/NezIzRrTU
         aoN2V9tjYCg5mHyKwSXzsXPJlwriofTwFpQDE9KtC88j2hLgZcGWj8H2AWx9jCG3SGe/
         7kPOfpLjgCWKbUtC8sb5uXG0i8Vb4tRV+zu6NdSCgByAF8jkEGGThuKArLqPo8VlFunX
         aDHqVqPKrizi9eTaIzvkRpytb8F2NJwrpi+uLaPnxfDxbpucoqL/VCegI/Wmqvylb2Sl
         ulli7jpTBC81H08y0hHj7nT9PR8ej1iUAKouRrrjkM2duvwvZKpVya5nUQw51tRdcpdK
         F2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086295; x=1778691095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IzNYzFHoxvD46pWkAWSFVcW4/RTuh1Ic/IvgIy3sPcw=;
        b=qxws37BdNhL+5qpBYMOR8dvfX8wVSozxn9EOntsEa5HSeGL9W4URm/qvg1tB8n3vUH
         39jh4WpjQnWWajWaGOce4qVLIsATEPe0jOtclQR3ku3QzbKEHhnJ89zlqGf/cCpiRxrs
         K0iJRxFBdGw/NPVO/aM9UNAnc9voqzECpdojoxrmtC3eY3gFxVLBa00qu5tXQd6hutim
         YQsYFZVO5RvjLGz7aG3aQLNTtn48cFknlSBQmMK6Vq+JVZFl3X8QZAWO9Ey4obWBpqFI
         AkkKD3fGsjTDm0EYWbm+y0hiUM4o+zhEmcxu8vHKRsk6z7dBqZmvL30ZNmGYbRByRFnG
         Kl0w==
X-Gm-Message-State: AOJu0YwyNtq9Q5N9Gq3uC0o+wauMxonp2Fk1e4iy7Of2/h6bLJOcKSAd
	eSrNR0z204AheNXYR5EoPoTFJGfsTNDzrUv3nZjx50M8rNM/VMxe8w8hvF13G75thY+p3HUbQlE
	s8PYErLy91tA+FwYMNGjZP8Q+Jm0JZvisD4rhTSe21JpSEQuX9BH2YkUGvWFtY2N8LbSx
X-Gm-Gg: AeBDievorunwJ0i8qYlp/mGTowdQ7Vek0MrIeHCKjlJJgMr+wrg6WLenedBlI84ixVH
	ejD0xuVPxOfQaopCCx6w2sjcZvmgBVw36y9KUUV94bdtqIEd45RxTdKVFhWag6j7BJXFOqHS62B
	9/FiBR1f2SpfPCWJFmWaI2mIk1mf2JipDpAQ3ubUMeD8ZVWtEZtcCapcPW3+q87RbNrQPEoTSc2
	XBidv5JZbnwg4+Q+d1BuvrPbsRJyfMV3dXD9iuUtwJFw47Rf4fCPFIwDXuJHTK/hQo+lG2mNQyA
	acgCW8L/n66Q//762BNDbOdM3+fw6b1Jul5EcT5hNQK0e4gs3w5CHOgcmAAVmICTyY7uB8MCzoo
	oFBGPBzxUep9FV0oS7bXIfSLx8DiHH5axVaqfCOI6tG0frG9IExz1sQWEwm5+pMj1R+aFj6H+R8
	rgt+ag80qI2nQ=
X-Received: by 2002:a05:7022:6187:b0:128:ceac:6db4 with SMTP id a92af1059eb24-131acfeec10mr1995893c88.6.1778086295060;
        Wed, 06 May 2026 09:51:35 -0700 (PDT)
X-Received: by 2002:a05:7022:6187:b0:128:ceac:6db4 with SMTP id a92af1059eb24-131acfeec10mr1995832c88.6.1778086293088;
        Wed, 06 May 2026 09:51:33 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1320f16b189sm2696087c88.12.2026.05.06.09.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:51:32 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Wed, 06 May 2026 09:50:43 -0700
Subject: [PATCH v3 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-clk-hawi-v3-4-530b538679f1@oss.qualcomm.com>
References: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
In-Reply-To: <20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778086289; l=3051;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=40NxVXovUiixWCXyomPxXiMim4vp3tig+MiKVM0oErA=;
 b=c+XjCtSNJc7nTfD5N5hOh1UxYyN1MjW9YZnKBJdKoT3KT1btu5w/rV3cZYHyqMrigGOepk9Sp
 Bv45AU3OTYUCUcCDBup/23udKJtQGIElky4t+5gLSD43FiJlG2Vj6zJ
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2NCBTYWx0ZWRfXyi2O7dFyaMyH
 Md/JR/l4XxNrq/K2wmAqcAwidhjU6FJfBINRrfM/jqRhbbGCDn8ZxLfyYPF9mnDY/t1bjPHlXY2
 gmxiPx2DfBc4aRtO5Ycqa0/rgpn3KFd89MTFPekXmes+fEOjptYo0oyorSgkdoeBmq246yWS/tf
 VZs7b++DylGPwL5Zn8xAiv7fS+COt4SciAageo2CfBbUWJc9KyeDcIndwf+62ySDaY8nqSn3gTs
 dF1Dx/KXpfmp8fT/rou+dxyKrenBmlnjDNkqNJgE233wjU7HdN1aMPDHXWyqj401pU2Oyc3GPJG
 6MUELxI2ojikxxzdqfyZHKDH+gMSmHlz/zDLuD+hSnU1RdA2axsBsGvkxy/7uEC9FMSwa/numCa
 NTITfYisidh1ruSIPI571lbTrXpB0PDdFw/u6KzvgIqHxXafB2kzmjSuHIJn+qHcwrZpBsbFObT
 VM2PsHSmcJsVCRYhLsQ==
X-Proofpoint-GUID: CF3Aua9Bx6InvMdfJyCMQVGp8TWfDfVN
X-Proofpoint-ORIG-GUID: CF3Aua9Bx6InvMdfJyCMQVGp8TWfDfVN
X-Authority-Analysis: v=2.4 cv=MYhcfZ/f c=1 sm=1 tr=0 ts=69fb7198 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060164
X-Rspamd-Queue-Id: 1667B4DE6ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106150-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.aknurwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add RPMH clocks present in Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 339a6bbcdc4c..8eae6fccc127 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -409,7 +409,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -984,6 +986,36 @@ static const struct clk_rpmh_desc clk_rpmh_nord = {
 	.num_clks = ARRAY_SIZE(nord_rpmh_clocks),
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
@@ -1075,6 +1107,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},

-- 
2.34.1


