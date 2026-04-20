Return-Path: <linux-arm-msm+bounces-103815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJeBM1Nd5ml6vQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 861B343096C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED17130A5D41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 16:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FACD35CBC3;
	Mon, 20 Apr 2026 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3TZzfiv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMKdiDme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66934FF78
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702638; cv=none; b=jmQQG5t1YUTdxzkfd5Di1xanQiNBJ8NOGG3VtabCRedbM1y9RmMOKZqPC87K7nButtyEoU/AsXxl9pMcibwaV0ODjW06jnULA3wvABO+jf3T0avm8yXsVdwYsc0rYMuz2azmyMfClkJc36etR12S0w6g+Zcfm/YRqMXOytA/8mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702638; c=relaxed/simple;
	bh=rtobRT1PjA1jbAn6P6pjOCDsBSURAoTMG1bw1/JByG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ygw+Mo+ehvMCfXnkmaN13POY/1dHilUqh2LW/JDAjHqvTG2T8TgWfTv00GFmbjGxnh2QT4rs7edQOB69nYpFf2BWp0Jj72k++DCXglSc8TurGxZ+OCHMnSwl0xCojvqnuW2hdPSqAAmMRXhoVWAd+dgqvcnGPufpFweT5UqHLv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3TZzfiv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMKdiDme; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFpLO02281651
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qFYzwR778xQL2d0bCJ2p/Ngc+5WmkhhM+pkWUTimr5g=; b=G3TZzfiv5S9xPvHe
	25wgkDIubFWaMGT2OPl/qfLXA2EMZ1llQmj8s3DRy6GMXyFLMQyiuTVkkWf0/Zsv
	+iXjQU02RgaCWWeoKKsmUCNft4edAT8XJ+wPLrycRfr0cHuEUMyIVPmGJIJDAvxW
	pJOMl0JcNud8EDoMuVVfYZP4fX/wlPUbrVn+mU3QPAtZ9y7IjA8sv703CUMCAPwG
	UiyLiQ9VQTvj/P5sgOUcZQV3Xvvvhy5CAPMkwidmQ90Nzzyssx6+k299XRaOmwYp
	VP+ELYr7B5TzmNVRLz6ew6U/mWDkx9OVUaEN68szPB426IGQc++vdw10ioqRD6iP
	8a70gg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh599nc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 16:30:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so2601013b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 09:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702634; x=1777307434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFYzwR778xQL2d0bCJ2p/Ngc+5WmkhhM+pkWUTimr5g=;
        b=OMKdiDmewTpY39Rzv4UiTZ0fsp3H81MAf7iwxwoUWaLnbMF09ZqHHGemH0UO3CXVzw
         Ts5mCvbGyk0Qw2gMJW9qNBgCiIqW82No28CCE5Id6P3t6wmPVLCu9paUocXEUlymlY1h
         lQEXPh6SP9nBJA3fmn2BSwJWHCXX4+vPpC0xaVqSNNTWPWxK75Fs1CwMGlNg7MBkVNol
         cbVpzFnnkT7wTD1igEDXHqCEFHcIVezJGSbdQfDGk+7VAjuues5hsOJBPr8aNAcgbbz1
         3RmyRMoliNXOmji6Y3V1ZSJgz/ywndvr4Kdsp8+S75zqGROfVl7EhvrtyD5PJIEtgMsI
         W9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702634; x=1777307434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qFYzwR778xQL2d0bCJ2p/Ngc+5WmkhhM+pkWUTimr5g=;
        b=kcfbu6AtYv+pJf0gS5DiDu7I3wI0vtPl+CK8rZWml1gGZ/9POWeb5kHI+RuR8Pt4IE
         WeYs65D67woCJ6EphkiSpWB16vXIQLe8D7PWT4XJUmoerSzmzVaFwQFTaRp7ByhTkFfi
         R0zAFc94rDNvJ+GWBJpbhBupv3ujIEQVohQG3qiB+DfGWIvQqAj0/c5CGGKzHjYNtQSz
         DfOPRkbhDzIXFdVbCU13P8MzhNoUXJQlFzdl87XHeTMMlXDGvSW5eSiC66Q4fMEQL430
         8NZ/3Tr9xypZi4vjYEs+5nn6C4i9vPkZRJ+bPngeEi7XbbDv71qPdykNahpvNP4lJGEq
         lTFw==
X-Forwarded-Encrypted: i=1; AFNElJ8sJr4e9FqhLJpfIry7DykC2ky6sRi0vB4GiJBb3i7XV87HBLvTMQ6uHp1kiqQRbnee0OlaEWx0P4tIiCq2@vger.kernel.org
X-Gm-Message-State: AOJu0YwtXV0qJmwCCizyIMMRTsOagFN+c35fWmWNycI1dN/7OkqZUUhv
	0dlkPCsagJ1yg8ne+ZsgCQy1C/eqFFVVRAtVgOUrU3ohyIaqFNFm+J8Z1fjV/24cWZ5sX6pgTxx
	789hmrDnVILlaPnEJijSDAe5DqpXihuxjukrcNiXVfeFaixn+zAanNUTTKtkanj40rTpl
X-Gm-Gg: AeBDietDdy3rsHRfOyCh68acKGa1F8A/O4wdiHts2Uhiqhl+Zaq3A7t6Iit9ak2Sta4
	FDd/j0vqhd1ccRJ5Pl3Jzfp2OwP7le4lls4fsVCjFuWYD6x5gZH1aTQ080NmbBmfx9YFznDwVB8
	GT2fR4ahB7hZEpyBpSDUgBRtyr3Mau6TlYscgqtO1e5cXTOXC8uXvN7T0uXC68gPxTw+6DuvkDd
	37EDCe75zCF3hJu8wlw4hA3ZmrwpkQEWx8HtHe9X/CjcBzbClxMh3GoIFpSzi8RIFSGgnUlWiix
	7lyUXFXpXOm0BhFXtC2297iJMSd0rKWMRiA97Ur279QrM/dpEtjECMk7dAp3nXSjPqLtg0dCgVU
	P7UrUqFyHkXilo9oyKfj3p8v2aLMHj98NE5LUYXMbaFO/cZagEi0zPJmaymfbZI0=
X-Received: by 2002:a05:6a00:3397:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-82f8c821430mr15905892b3a.13.1776702634156;
        Mon, 20 Apr 2026 09:30:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:3397:b0:82f:50cd:e586 with SMTP id d2e1a72fcca58-82f8c821430mr15905824b3a.13.1776702633527;
        Mon, 20 Apr 2026 09:30:33 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:32 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:59:01 +0530
Subject: [PATCH 08/13] clk: qcom: clk-rcg2: Add support for CRM based RCG
 ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-8-eb27d845df9c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: HdRwr3tqhP3NvPLa9jb7NFpT2_1_x--b
X-Proofpoint-GUID: HdRwr3tqhP3NvPLa9jb7NFpT2_1_x--b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfXyftuAIiXa2pN
 Vz+7rUh9d8MFxzzeoEeEyRtLhEgX22m2OkPfsmVYzh8H7fZOqtzoyQ4Ukz5AU5oyz0xe9DmA0or
 /S4wFUjf3CYgyDzUB/nXkH18NJsbWzAnQQjzmzmLY6xzzqwG9RvG5fGmkr47JB7mqzgfEgQSo6S
 wKXCYCcAb6N+ucfZYC4grJ0IQ+WUKNw2DlS1aT1Rdcqt50Xsfo+TrnN6XD1ax6Hi1Y3Y4orxomS
 fY9nGvmQtjrPqf5gvyBnvF2h5hdpBdQARa387KPNMSRiTmIqRGTwI/VMa9vVJx4rYJ1KCP0tV0m
 ZTnb8EYZrqjYQT4K08Q6BiVNTlNlxbQjrJhc7P+XkVxD7PFmew33ehSymauAfAa97eGYhaGe4iV
 cTR9ZjzLAlu7gk8tGWPPw5fECQv7z73sYuykzf3NMlz0wQpCIiDofw0Hs79/F7cc2U9n9o3etUk
 IsnoQX08Q0gmG6WGouA==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e654ab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NNO5VbLtoeey9YZzRQ4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103815-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,cmd.data:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 861B343096C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add clock ops to control RCGs via the CESTA Resource Manager(CRM).
This adds support for clk_rcg2_crmb_ops where the RCG's frequency
table is dynamically populated by reading the LUT entries provided
by CRM. For scaling the RCG, the RCG frequency is converted to BCM
TCS bandwidth vote and sent to CESTA HW using CRM APIs. The CESTA
HW would then scale the RCG to the desired frequency requested via
CRM.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg.h  |  23 ++++-
 drivers/clk/qcom/clk-rcg2.c | 242 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 264 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 4fbdf4880d0308714a2d1dc8c510ec3819206b9e..4872e7f9caa1096bdebca36dfbb439dc790638ef 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2013, 2018, The Linux Foundation. All rights reserved. */
+/*
+ * Copyright (c) 2013, 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 #ifndef __QCOM_CLK_RCG_H__
 #define __QCOM_CLK_RCG_H__
@@ -175,9 +178,26 @@ struct clk_rcg2 {
 	u8			cfg_off;
 	u32			parked_cfg;
 	bool			hw_clk_ctrl;
+
+};
+
+/**
+ * struct clk_rcg2_crm - root clock generator controlled via CRM
+ * (CESTA Resource Manager)
+ *
+ * @rcg: root clock generator
+ * @crm_vcd: Virtual Clock Domain(VCD) index for a CRM controlled RCG
+ * @crm: pointer to CLK CRM instance used for reading frequency LUTs
+ *	 and to communicate with CESTA HW
+ */
+struct clk_rcg2_crm {
+	struct clk_rcg2		rcg;
+	u8			crm_vcd;
+	struct clk_crm		*crm;
 };
 
 #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
+#define to_clk_rcg2_crm(_hw) container_of(to_clk_rcg2(_hw), struct clk_rcg2_crm, rcg)
 
 struct clk_rcg2_gfx3d {
 	u8 div;
@@ -202,6 +222,7 @@ extern const struct clk_ops clk_rcg2_shared_ops;
 extern const struct clk_ops clk_rcg2_shared_floor_ops;
 extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
+extern const struct clk_ops clk_rcg2_crmb_ops;
 
 struct clk_rcg_dfs_data {
 	struct clk_rcg2 *rcg;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 6064a0e17d5190e9d228688c04c0d4947876b4e6..668115b94a0f202cf3ac4f68efe3cef1684055be 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013, 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/kernel.h>
@@ -16,9 +17,12 @@
 #include <linux/math64.h>
 #include <linux/gcd.h>
 #include <linux/minmax.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include <asm/div64.h>
+#include <soc/qcom/crm.h>
+#include <soc/qcom/tcs.h>
 
 #include "clk-rcg.h"
 #include "common.h"
@@ -59,6 +63,33 @@
 #define SE_PERF_M_DFSR(level)	(0x5c + 0x4 * (level))
 #define SE_PERF_N_DFSR(level)	(0x9c + 0x4 * (level))
 
+/* Cesta configuration*/
+#define MAX_CRM_SW_DRV_STATE	3
+
+/* Address offset for specific VCD */
+#define CRMC_OFFS_VCD(crm, _vcd) \
+	((crm)->regs.vcd_offset * (_vcd))
+
+/* LUT registers address offset for specific vcd and lut entry level */
+#define CRMC_OFFS_LUT(crm, vcd, _level) \
+	(CRMC_OFFS_VCD(crm, vcd) + ((crm)->regs.lut_level_offset * (_level)))
+
+/* CFG_RCGR LUT register address offset for specific vcd and lut entry level */
+#define CRMC_OFFS_CFG_RCGR(crm, vcd, level) \
+	(CRMC_OFFS_LUT(crm, vcd, level) + (crm)->regs.reg_cfg_rcgr_lut_base)
+
+/* L_VAL LUT register address offset for specific vcd and lut entry level */
+#define CRMC_OFFS_L_VAL(crm, vcd, level) \
+	(CRMC_OFFS_LUT(crm, vcd, level) + (crm)->regs.reg_l_val_lut_base)
+
+#define PLL_L_VAL_MASK		GENMASK(7, 0)
+#define PLL_ALPHA_VAL_MASK	GENMASK(31, 16)
+#define PLL_ALPHA_VAL_SHIFT	16
+#define PERF_OL_OFF		0
+#define XO_FREQ			19200000ULL
+#define CALC_PLL_RATE(l, a)	((XO_FREQ * (l)) + ((XO_FREQ * (a)) >> 16))
+#define HZ_TO_MHZ(rate)		(rate / 1000000ULL)
+
 enum freq_policy {
 	FLOOR,
 	CEIL,
@@ -1859,3 +1890,214 @@ const struct clk_ops clk_dp_ops = {
 	.determine_rate = clk_rcg2_dp_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_dp_ops);
+
+static int clk_rcg2_crm_populate_freq(struct clk_hw *hw, unsigned int lut_index,
+				      struct freq_tbl *f)
+{
+	u32 mask, cfg_rcgr, src, pll_lval, lval, alpha_val, num_parents, pindex;
+	struct clk_rcg2_crm *rcg_crm = to_clk_rcg2_crm(hw);
+	struct clk_rcg2 *rcg = &rcg_crm->rcg;
+	struct clk_crm *crm = rcg_crm->crm;
+	u32 vcd = rcg_crm->crm_vcd;
+	unsigned long prate = 0;
+	struct clk_hw *parent;
+
+	/* Read CFG_RCGR and PLL LUT entries */
+	regmap_read(crm->regmap_crmc, CRMC_OFFS_CFG_RCGR(crm, vcd, lut_index), &cfg_rcgr);
+	regmap_read(crm->regmap_crmc, CRMC_OFFS_L_VAL(crm, vcd, lut_index), &pll_lval);
+
+	/* Calculate the pre_div and parent source from LUT entry */
+	mask = BIT(rcg->hid_width) - 1;
+	f->pre_div = 1;
+	if (cfg_rcgr & mask)
+		f->pre_div = cfg_rcgr & mask;
+
+	src = cfg_rcgr & CFG_SRC_SEL_MASK;
+	src >>= CFG_SRC_SEL_SHIFT;
+
+	lval = pll_lval & PLL_L_VAL_MASK;
+	alpha_val = (pll_lval & PLL_ALPHA_VAL_MASK) >> PLL_ALPHA_VAL_SHIFT;
+
+	/* Find the matching parent and calculate it's rate for LUT entry */
+	num_parents = clk_hw_get_num_parents(hw);
+	for (pindex = 0; pindex < num_parents; pindex++) {
+		if (src == rcg->parent_map[pindex].cfg) {
+			f->src = rcg->parent_map[pindex].src;
+
+			parent = clk_hw_get_parent_by_index(hw, pindex);
+			if (!parent)
+				return -EINVAL;
+
+			if (!lval)
+				prate = clk_hw_get_rate(parent);
+			else
+				prate = CALC_PLL_RATE(lval, alpha_val);
+
+			break;
+		}
+	}
+
+	if (!prate)
+		return -EINVAL;
+
+	/* Calculate the RCG's rate from parent rate */
+	f->freq = calc_rate(prate, 0, 0, 0, f->pre_div);
+
+	return 0;
+}
+
+static int clk_rcg2_crm_populate_freq_table(struct clk_hw *hw)
+{
+	struct freq_tbl *freq_tbl, *curr_freq_tbl;
+	struct clk_rcg2_crm *rcg_crm = to_clk_rcg2_crm(hw);
+	struct clk_rcg2 *rcg = &rcg_crm->rcg;
+	struct clk_crm *crm = rcg_crm->crm;
+	u32 prev_freq = 0;
+	int i, ret;
+
+	/* Allocate space for 1 extra since table is NULL terminated */
+	freq_tbl = kcalloc(crm->max_perf_ol + 1, sizeof(*freq_tbl), GFP_KERNEL);
+	if (!freq_tbl)
+		return -ENOMEM;
+
+	for (i = 0; i < crm->max_perf_ol; i++) {
+		/* Skip first LUT entry as first entry is used to disable RCG */
+		ret = clk_rcg2_crm_populate_freq(hw, i + 1, freq_tbl + i);
+		if (ret) {
+			kfree(freq_tbl);
+			return ret;
+		}
+
+		curr_freq_tbl = freq_tbl + i;
+
+		/* Two of the same/decreasing frequencies means end of LUT */
+		if (prev_freq >= curr_freq_tbl->freq) {
+			curr_freq_tbl->freq = 0;
+			break;
+		}
+
+		prev_freq = curr_freq_tbl->freq;
+	}
+
+	rcg->freq_tbl = freq_tbl;
+
+	return 0;
+}
+
+static int clk_rcg2_crm_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	struct device *dev = clk_hw_get_dev(hw);
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	int ret;
+
+	if (!rcg->freq_tbl) {
+		ret = pm_runtime_get_sync(dev);
+		if (ret < 0)
+			return ret;
+
+		ret = clk_rcg2_crm_populate_freq_table(hw);
+		if (ret) {
+			pm_runtime_put(dev);
+			return ret;
+		}
+
+		pm_runtime_put(dev);
+	}
+
+	return clk_rcg2_determine_rate(hw, req);
+}
+
+static unsigned long
+clk_rcg2_crm_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	if (!rcg->freq_tbl)
+		return clk_rcg2_recalc_rate(hw, parent_rate);
+
+	return rcg->freq_tbl[rcg->parked_cfg].freq;
+}
+
+static int clk_rcg2_crm_init(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	rcg->freq_tbl = NULL;
+
+	return 0;
+}
+
+static int clk_rcg2_vote_bw(struct clk_hw *hw, unsigned long rate)
+{
+	struct clk_rcg2_crm *rcg_crm = to_clk_rcg2_crm(hw);
+	struct clk_crm *crm = rcg_crm->crm;
+	struct crm_cmd cmd;
+	int ret, i;
+
+	cmd.resource_idx = 0;
+	cmd.wait = true;
+	cmd.data = BCM_TCS_CMD(1, 1, 0, HZ_TO_MHZ(rate));
+
+	for (i = 0; i < MAX_CRM_SW_DRV_STATE; i++) {
+		cmd.pwr_state = i;
+		ret = crm_write_bw_vote(crm->crm_dev, crm->client_idx, &cmd);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int clk_rcg2_crmb_prepare(struct clk_hw *hw)
+{
+	unsigned long rate = clk_hw_get_rate(hw);
+
+	if (!rate)
+		return -EINVAL;
+
+	return clk_rcg2_vote_bw(hw, rate);
+}
+
+static void clk_rcg2_crmb_unprepare(struct clk_hw *hw)
+{
+	clk_rcg2_vote_bw(hw, PERF_OL_OFF);
+}
+
+static int clk_rcg2_crmb_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_rcg2_crm *rcg_crm = to_clk_rcg2_crm(hw);
+	struct clk_rcg2 *rcg = &rcg_crm->rcg;
+	struct clk_crm *crm = rcg_crm->crm;
+	int perf_index;
+
+	perf_index = qcom_find_crm_freq_index(rcg->freq_tbl, rate);
+	if (perf_index <= PERF_OL_OFF || perf_index > crm->max_perf_ol)
+		return -EINVAL;
+
+	/*
+	 * perf_index returned from qcom_find_crm_freq_index() starts from
+	 * index 1 since 0 is treated as OFF by CRM, but RCG's frequency
+	 * table starts from index 0, store parked_cfg aligning to RCG's
+	 * frequency table index.
+	 */
+	rcg->parked_cfg = perf_index - 1;
+
+	if (!clk_hw_is_prepared(hw))
+		return 0;
+
+	return clk_rcg2_vote_bw(hw, rate);
+}
+
+const struct clk_ops clk_rcg2_crmb_ops = {
+	.prepare = clk_rcg2_crmb_prepare,
+	.unprepare = clk_rcg2_crmb_unprepare,
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_rate = clk_rcg2_crmb_set_rate,
+	.determine_rate = clk_rcg2_crm_determine_rate,
+	.recalc_rate = clk_rcg2_crm_recalc_rate,
+	.init = clk_rcg2_crm_init,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_crmb_ops);

-- 
2.34.1


