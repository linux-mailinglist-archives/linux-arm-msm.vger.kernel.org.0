Return-Path: <linux-arm-msm+bounces-103813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dv1MF9W5mlQvAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:37:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9E442FBC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FC3C30715F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42E534D4D2;
	Mon, 20 Apr 2026 16:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pb+Kmkoj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOPcHHAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13435BDBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702625; cv=none; b=mrh7ZJMVLZNqa/W8JJ5erWTPyQoNBsRzB/8TjBZB1I209QwRa9ehZMfbQOBU4GFx8EHppKLnnjDnMif2+SYuTob8XnHpbYXVtzHkF5IB935SrkcGfCY6h+UItccuu/sPAY2gbVCavvuIvKUxIWs0jMLrN5ix7tvGk8wx9s+bIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702625; c=relaxed/simple;
	bh=GkuGBtz0vm1ur5SbWsJoyFWyyIBKgm/VPzpwgEa5Hlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YnfmJzEC3WiAWp+vyoTT6ewbWgpRK7kViZgOW/uXaiRW3hXspfzgDffrKUSAcUD6q/LVRhhtL6zsWblmPTQl4rJ1vMTYX9wzv3tSHwWDA3q7zRfAneTDuvBH5hep8hE9flyXTRUc7FdGtunYFSisYIas2G/lTwKpxg4bGVcC1Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pb+Kmkoj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOPcHHAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KAvOQF3015211
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=; b=pb+KmkojbYnV1bIa
	X54gArqJ6FYMEDPvI71/S5elsHYOZyYCjX33is3QL90MI95EynuA7Ujsdl4ulU7/
	5f4c4ZOXcC1RaO4uzK88u0kc5JhRmG/MM08vER6nw0G7tNtft+ZGhqAeKgBmsh/p
	BaHsdywlbTAo60ysT+Gk6eU3q9s6TRKJ6tBAzCeqyhfHRoqHGEsHU59wcKZhbMlc
	cDCgVSbtZX6CqDzjPwDpLXxdRa8HP4AtgslCCnszyF40H7jSbo+jylP3SRRk7toW
	HrTxMk6x7k8NZ6VmZiO1eotcfUjCUxFDF4772Q0cDsEKoQ6oyErtDL5/81G9X86f
	yuU0Fg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnjuks7qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso2019510b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702622; x=1777307422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=;
        b=bOPcHHAinADlZ4tMY6lRZiq2fHklKxZ7v5qY7ArmMxNAQspVaVIZmx2NpH9MDBomGk
         N5LBxbPOK8mHTSGKnjix7teu2U81NdnfBv/OvzT5FG7z2nd30Gk7kLSP92QIXlNrLSFW
         KhLB6G11Lw1G8r28S6gw27VDYFLY4sfnBRvYAzvxLlw6OIuijXDdPxL3i+z1ZnjWNdy8
         JPFg0csioDUoSCoogstILhfDQhFNSkDGv7PpePESVGNVJA6yHEAqixHc18IUZjzSgvOV
         WU01sa2yUe659Rpog2pqNrTdaYc/Qb/fxJyutMdhLYV8tZYJ7hIbvaAHikjNBxX7u/xY
         L9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702622; x=1777307422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LzJ5ge+EfXqrbVBAlUAXmfQmBnk818A5VV6UdTh6l78=;
        b=epk+phCH1vR/7YArDVvuAuIdqc5V0CKdi8JED0DuBOHu4DmhKY/r1JaBU7aWKfoYQO
         pPIIdSxc8mtKYe+GkHPvNcwQ87MnzKqCiVB5UMdtnuRFb4284fVRseUl/pj2re86cwhv
         IwsYunV/C0C7JvgU7Zi3HzjULBALYaklGa5qi75jso1V1zSbO/sWNoCE2pqj/tRBWTrN
         23OgoSn9c3TGVE9XeQ+3R78l87NY5bzFlbK65liCUuXNGxbjLErAjpiPyeyFXwl3aSgm
         rHmgpLlJOit4mV7AKc+vwnEUfZr/eH7VAd+uEPAzQQu18tZrjiVzaAAR8ALZZtuOHjs1
         f0sA==
X-Forwarded-Encrypted: i=1; AFNElJ+OdT8IW9QYzfgBd82/gWkBv+TszHq97TZF+h72BmJBMllh/VsfA5IRycXEe7XRjT/Ncvy2XlCSbtbnKEQn@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmoll9hfHyl8oflWez03nGFlOh4GMzx3n2tKJ4IW6Crn+TSaq
	Vqlc4mitQP4p2VB0jKh7B4cuDuSoZ9IXdJmkpAJFemGQv3IXvGGaWg/VFhKIR7mIXhUUoB1rQUu
	zcBAajiINR4ICWvBFfz0OrD0pQHOfNcC3O2O1PrtWDv1cS/6fWdnTfwJTCL3VlmRnDTnR
X-Gm-Gg: AeBDiesaA8COTlsDndFwOSxa0j283fL78nzgHVdsYGJMnPvkZsAtC3Q8H5i+klcViFY
	Fs51qGo5QDCARUVoSv0NradcSobhF33EPtx3Q0rL/yySrZNOowZgVteiFSuI4sBhBk6fYtxT/wK
	wXL86TmmpWv1beg4cvwC3s2rvO71XIeJFIECQMF1Ay9isIKemOi32b0PqtIIGBXdvp3SJysmqLX
	1TIWBrRzu7nR2H/kWfocS1kOsbyqbdqtR9mgU1Uw4L8V+sK1JHFgodz9VTWuuGJsynTUIAjj/33
	KH05K9liPMlGt7OMFyLE0eupv70uTm+ZJnZjtLcUW8isqWPFudx7WuO71WX+t195c51lDaeTVsf
	OOOU6YwIx6ytpqnmqdnDFjm2y07fo2YpdHgKSWo1L9aY62tvTC/0thQ/sGBAlYxM=
X-Received: by 2002:a05:6a00:23c4:b0:82f:5f2c:dc1e with SMTP id d2e1a72fcca58-82f8c902066mr14297789b3a.30.1776702621572;
        Mon, 20 Apr 2026 09:30:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:23c4:b0:82f:5f2c:dc1e with SMTP id d2e1a72fcca58-82f8c902066mr14297745b3a.30.1776702620966;
        Mon, 20 Apr 2026 09:30:20 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:17 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:59 +0530
Subject: [PATCH 06/13] clk: qcom: clk-alpha-pll: Add support for CRM based
 PLL ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-6-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ucD16iVW_g8jKDmpWtSWdTLL1pQfvMLF
X-Proofpoint-ORIG-GUID: ucD16iVW_g8jKDmpWtSWdTLL1pQfvMLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX56dvbgh9W6SH
 wtlNzBOuTDukbGuZPjLpJiSvCuez1xCxpuythYzAIo+jz0YmEl71iXgGPRDh9uaSeI+HDf/8j34
 NbqMI4aseutKhH5pmImINg7XqnyNHzlvANqyRE+d3lE8HE053uELQM/NSPgPZ1YINEqU7WDraBN
 pfOeSzxKZC8f42JyMunWQICytvgjDYMfHm83cQkr11ee15Eic8d8Hso8t09w01lcIRdp7B+7FFM
 Cza3mAslBGPU819DxnGO924R0p5d3w0LDejlwJS0YAzj0cdmgQIjnhkfWtoMb31y3LO16Oq1tw5
 WLFfcuSWTP0dIVANuBoIFEtevcwQwe2TEs5O4NsYhAAXqD3DkrMsCeDl2hNoirJyB3XBf19ojRE
 Fze/AAED9NWbgQutwHTlKqqxpkWoMtR9o/7NZ0ylcA1YtLEbI+yW1JMLX6gGV212IiTCTkU5tBD
 vMANewT6VQubGDSazXg==
X-Authority-Analysis: v=2.4 cv=WuUb99fv c=1 sm=1 tr=0 ts=69e6549f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=UWxg1GitlfQtNyvJ0DMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103813-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5C9E442FBC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock ops for PLLs that are controlled by the CESTA Resource
Manager(CRM). For these PLLs, CRM programs the hardware based on
aggregated votes, so the clock driver does not need to program the
PLL registers directly, but can still model the PLLs and expose
them as parents to RCGs in the common clock framework.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 7 +++++++
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f8313f9d0e30ffd5393e3163ebc0e51b2bd96437..67fc97739d0d4c26aec0bac5d43d1b87d297bc6a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, 2018, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/kernel.h>
@@ -2585,6 +2586,12 @@ const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
 
+const struct clk_ops clk_alpha_pll_crm_ops = {
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.determine_rate = clk_alpha_pll_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_crm_ops);
+
 static int alpha_pll_pongo_elu_prepare(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 42d3344921457c39deadcca5c43d72ded3b572a3..1ef515708ce19e636eb9a59b126df5048e262d85 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2015, 2018, 2021 The Linux Foundation. All rights reserved.
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 
@@ -219,6 +220,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 extern const struct clk_ops clk_alpha_pll_regera_ops;
 extern const struct clk_ops clk_alpha_pll_slew_ops;
 
+extern const struct clk_ops clk_alpha_pll_crm_ops;
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,

-- 
2.34.1


