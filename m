Return-Path: <linux-arm-msm+bounces-106571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF+LHGBs/Wm+dwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 06:53:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3534F1C29
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 06:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 576BA300F63F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 04:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F321633A029;
	Fri,  8 May 2026 04:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fXFMNio8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULHrpjcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A26F332EBA
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 04:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778215952; cv=none; b=WML/qpY7WRs9gijOVMloQ9Y/8bpHxk7oY1EcVBteeIoXDL6tRDWaWP0aOhX16B6VegJJAzylMYMi4cAqrP7/xlNTg8I9/SnNM3mV9+MQlwBde4AgIompqvwFRXsGILP1zyy1B6WKWDN2dsKHWRfBJ6phu2DkDY27fhweKgncxxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778215952; c=relaxed/simple;
	bh=9M7+Un4uOA2mP0+irpw/9cfUa3uTDc4U4GO2YOaXzqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=abJYCxZNQ9SuFiu+eNXnFkTTQVVFPwnswuE+viHxC/mu/XryfnCioxQPshfIcH4EoFg1TwiJLip8/O+yyrHnALTdD7+qbsDAK1K+zSHCmKesoeKego04/iAhS0YakuivUwAXALZFHVSPyYhV65BDX50BGpl2cM0i4ezpwOjkDwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fXFMNio8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULHrpjcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6480rWmZ2384154
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 04:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LxIxOuAppLbUqNKehD1V/7+XyuShk2Wq0w5OaqEiRkk=; b=fXFMNio8DIUiQ2/1
	u74NSdfa45+Zrj0YWUhI2oIwZ+qBF+DKf6H/HaXpQfUOj9Y9c+eMbnW7aeUY2oRP
	bvv87ruqbehCMr1+pUoZH7FXrCzmweE5Syv3ypK8Ecs7gS/1Rc3xewIYhdYsEle9
	StLV4fO4W4vMv39GELwucni4KCAz/KMfERgqxylGHJIpqsBIAAB590Ik6BPx/NAE
	7euOaqQgVqY0R6oMa1w8pdgvZbS79rnPuBHP+vmWC1Q6mpCe3Khn4s+oU2i+m4Fh
	Dv2Q0rbMI/TG87KzrN8OyeYYWo29yuYOOYHwMZQkdXg137hQPFAq9hdaetQFqk+i
	o3CXFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwujchm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 04:52:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fc4636bbso3055262a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 21:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778215949; x=1778820749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxIxOuAppLbUqNKehD1V/7+XyuShk2Wq0w5OaqEiRkk=;
        b=ULHrpjcybwrZUqSZN5Cnt7mnBfbV/gjEu5dpdv5J3N73V7NICDMs46aedAvbHN8BOH
         WRcEAcavkjNCYinfH1FB9bGE3/gA2JxXgFkPmn4BpsTQcA8wSB0PjcMQI+fMvzxh/1Vz
         d+aSNPDzrVN8CiA9iDF46iRXVFGI9C30CssXwWlkq7oqf0wJKB2DhayPH58YZ0hknvD0
         0n11rHFvA69MUGAmw+YrLjL4twag1pk/IwbbKNK84OAi4KpjB8xrHZuKJ1u5PxLig3sZ
         ZCYnrjhStVi2m4JyxjYSdrJUsfPpZpl6yx2TCRAdlzsOiBUO0WaYCcOK8m7IBmRyiWHF
         o8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778215949; x=1778820749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LxIxOuAppLbUqNKehD1V/7+XyuShk2Wq0w5OaqEiRkk=;
        b=lroxjY/E09lo/OA+t11jvcn+6S6zqZp50poDywhnJMs/yc0nyVRveR4A23bk8lYP/r
         m+BDmTLok1Y1qYKWCn1E+jUlUykodwW0WclR5moffL9lEieBG7ydiX61KSv5puZUTPJc
         focI1YDOWxakc8KzKOitdNQ01FoGluHPNjCupk5xVar4S1I8W+Y4LBXgvVHi02D9hmID
         Xwr6VDDHs+lxuNZ7XI8kgEArY0mySpB8QIviZdqW9xBoiDzNV8raiutP7cZQfs+hUDqu
         XBgN4cn5G/C7WCHSlAblmoGFOQZlyuBSzUH54JUMPytf8mhRMehqBjCcMJSYgzgx1Yn1
         yvTw==
X-Forwarded-Encrypted: i=1; AFNElJ/mDlik0kiy1XEMzBOAARuDyc0EN8LeMOl5Uy7l99To+0RoiPvQ4KUaW5bgRiUoS/XE0+E9R2BLPOEoDR45@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm2pkVi/JM+DdD7eWvz7T5wTSB9SWZa+zQh9eN1mB8KVrf/TiY
	03Z9Vy6Oup730V9t18v37sCA6YH6mo30Juv8Qm8eM74ExDEV1Vb9Ehk47uXekF7OJ6j5FoX0z+w
	Te71fEJ0vrJvhefKvCi82/kZD9DfLvsSnJlvIjiK9m7pvvnV4R5MNGUPNwzzIA/J8vzXH
X-Gm-Gg: Acq92OG3/GagbvlR5XUK6pjXhKETZxcebG9WnHZG9z/CdlVv25cq6/x9OixoVeA4J8p
	PBBbtOdi8SQZcP4SmYh7QoMWJgJbihsNCqxbEXyTeGF78q3hJA+Ot8PRyJ5q0rDYzabkT5UWFn2
	eMnO+jVP5MAzkuNNAqvK5vffJLEXufNWWa/nLQz2QX2u37/lCtI2mtJdctK2MSi47Ul/woasddm
	aDLoxJAxEKBlMfGJh4jAejwLr/43nXvso1U4JMQp8hI7UmnDyIihW7o7xu1NhqgVZyVKDS6w8aN
	mbB8NlfiflbSTLxBPo2AIBS6zeTCjOrP/HF12CftZs5Io6q3DDkkkunmSGb3Rn/+HuOw/xdlJSy
	YUkVEZWoik2crMCc7Ocb+v5ASWvMWot2xYhjRqyeW4mezHcbaxSMw
X-Received: by 2002:a17:90b:134e:b0:364:6558:99bd with SMTP id 98e67ed59e1d1-365ac47c3b4mr10419197a91.23.1778215949261;
        Thu, 07 May 2026 21:52:29 -0700 (PDT)
X-Received: by 2002:a17:90b:134e:b0:364:6558:99bd with SMTP id 98e67ed59e1d1-365ac47c3b4mr10419163a91.23.1778215948743;
        Thu, 07 May 2026 21:52:28 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36645bb9c02sm556076a91.1.2026.05.07.21.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:52:28 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 08 May 2026 10:21:52 +0530
Subject: [PATCH v2 3/4] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-shikra-gcc-rpmcc-clks-v2-3-83238ba24060@oss.qualcomm.com>
References: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
In-Reply-To: <20260508-shikra-gcc-rpmcc-clks-v2-0-83238ba24060@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: NnjFJYpygh-exiYUYdJTfAdGk3gLxI9k
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fd6c0e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=L5rjUTd7AGozPMB3QYUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA0NSBTYWx0ZWRfX+IqMo8C5xqAr
 4PRHEs7adUBGlPw0R0Zishw9yrZKYX4QMQbh6rorYKfnHQjSGKpOfrdwS9NVopPjHQ2VIdyY8d8
 64LE75n/c5lpfEOHzKvixIeSPEiBjK3wtzxR/cVd3aPkbNKxkfrunQef3HiUCE54lAsWV76T88v
 teGicp/a5pMN2jL+gCDF6SL4Y5VOzj+ts3Txxdv1LYG6Eev5ofz0tCiSfvoL58wguMcsUuT5VRV
 bIOVWO7SXkKWYd0RDJHr8Kf4jLgLzxFbMYwA8IynQ8pr7SLva/8eMwwte5H+FbXESiQPuRdokwm
 26es+EJTiKNwusS7w2DWawDnCi8NCn+Cyx47oxQLMb1kMbj4FNzkaeEospA36XBixQf4nU3+GyH
 DaJue5Y82JLj5ptm+jWFDR/Ka0+UKRhW6Wvl5kfzF55kJ/rKrW/29DozEWme8kLLTeKWbnMPuc0
 09jbg1rbym1sLEtVmwA==
X-Proofpoint-GUID: NnjFJYpygh-exiYUYdJTfAdGk3gLxI9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080045
X-Rspamd-Queue-Id: 8F3534F1C29
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106571-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
list is same as QCM2290, hence reuse the same for Shikra.

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 103db984a40b950bd33fba668a292be46af6326e..d0d19bf0616efd5f1bc2caa037ff36d830a3495c 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1289,6 +1289,44 @@ static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
 	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
 };
 
+static struct clk_smd_rpm *shikra_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &clk_smd_rpm_branch_bi_tcxo_a,
+	[RPM_SMD_QDSS_CLK] = &clk_smd_rpm_branch_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
+	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_rf_clk2_a,
+	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &clk_smd_rpm_38m4_rf_clk3_a,
+	[RPM_SMD_IPA_CLK] = &clk_smd_rpm_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &clk_smd_rpm_ipa_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &clk_smd_rpm_bus_0_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &clk_smd_rpm_bus_0_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &clk_smd_rpm_bus_5_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &clk_smd_rpm_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &clk_smd_rpm_ce1_a_clk,
+	[RPM_SMD_QPIC_CLK] = &clk_smd_rpm_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &clk_smd_rpm_qpic_a_clk,
+	[RPM_SMD_HWKM_CLK] = &clk_smd_rpm_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &clk_smd_rpm_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &clk_smd_rpm_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &clk_smd_rpm_pka_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &clk_smd_rpm_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &clk_smd_rpm_bimc_gpu_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_shikra = {
+	.clks = shikra_clks,
+	.num_clks = ARRAY_SIZE(shikra_clks),
+	.icc_clks = qcm2290_icc_clks,
+	.num_icc_clks = ARRAY_SIZE(qcm2290_icc_clks)
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
@@ -1309,6 +1347,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm429",  .data = &rpm_clk_sdm429  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-shikra",  .data = &rpm_clk_shikra  },
 	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ .compatible = "qcom,rpmcc-sm6125",  .data = &rpm_clk_sm6125  },
 	{ .compatible = "qcom,rpmcc-sm6375",  .data = &rpm_clk_sm6375  },

-- 
2.34.1


