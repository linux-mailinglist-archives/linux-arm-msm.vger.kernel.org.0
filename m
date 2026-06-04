Return-Path: <linux-arm-msm+bounces-111124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N7raApUNIWrK+gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:31:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A963CFE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 07:31:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FLBhzVxG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=I8kgcvQe;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111124-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111124-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78B06308BF04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 05:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D623C1976;
	Thu,  4 Jun 2026 05:27:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0082C3C0639
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 05:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550833; cv=none; b=ct+ETqsR0TQDYuSGAsX3YqQQQsIrwaDtoTAxqWDiIdD/5J2aXPQRaOQmXhKYIyoMZ5/H/7bvINM08fm3g+KSr2m5iprRkLfkdY28H1BwOXaHX9nBVVryK+4Feyusoc6O+zycQ0GCmEIiIPToKZDnygzOJ2YgzFfkurOuTvdDWwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550833; c=relaxed/simple;
	bh=QV1T2jQecsdrWuJKbVRoH9hUbldR74noUF6ZVYYiUhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXmrePWCUShVXRO7J13rstbVuA5NMHSvIX/O3Pi636HZsVETEZteF06cHJUi8MwP9mRPs4oGh7PAfukFegpv4GnKWBHz9EkXfOH6KQRX9RVXXB6KtJpyr9KLy7kASWvT382JVKmKxvi57QWtkoK9P5XoxzkMEBYt8OpSj3DXd30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLBhzVxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I8kgcvQe; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6543FbE41993971
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 05:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUEqgQxNX1Os6oM9bQGsHLB2AOvejl/HCO6K5ihAV2A=; b=FLBhzVxGg0uYeMAR
	vAwi/H3mz2/RynPzm0nDmfb6rUNM96M9qoMW/g3dVnh6KuUc25gUZdzEy7KQxLsp
	0c3wzsq5jW3Vt322IhOgBfvtwDqD/L3l1r00sh6bJB+qsuc5FryOOS4OHgT376MQ
	n6dxl/adO+0UJPjotlbzztJ8Wve6Vap/3MhoFPaMGkbJO7rHQBjCHFkeEOVh4kwN
	CV9Skc8X1TvUIObbrdyOWa5Pa8IMiDPjoy33EprWcjFU8PLW3AGEDKxQPBI3lmIW
	unVPGnhZO93Tp1lHvpVBe37xoFkHjv+SfM7u47osOPhBOEp/O9x9ecXdqSnx65N1
	z7YUcQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs8pt392-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:27:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240b58211so267426b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780550830; x=1781155630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUEqgQxNX1Os6oM9bQGsHLB2AOvejl/HCO6K5ihAV2A=;
        b=I8kgcvQezlu07NlsQsO7rPKRYBIgKaHC2rfPYsU9s3iVZpypZ6rakPl1q/kVIfCh1p
         A4Drt0Rn1ol3JfQi4+7BZQT4mlhGPXYQ8cUsfiMW0ed0wA3POvPeHwuHRTI+nYtBelx3
         OMKI9S8ipnkzX4f2HSPfkojuLlytzfwPluPUdbKGLIxMOVjgCx+CkfU4LF9Yi05Zgtb9
         vehckfxd8sf+8xhFrfJ+CplaOT/5BKJ4yqCwv6NeSmmpZt0FeV22naTrnNgnw2YN8u+L
         xs2WIUN2SMfcaL2Ef+9i8m/w0bliFnad4fMeEG+dGedoVYnyL6G6ksJ+JrGhEb4pLjvI
         egNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780550830; x=1781155630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xUEqgQxNX1Os6oM9bQGsHLB2AOvejl/HCO6K5ihAV2A=;
        b=Oxb5jBFCd5mwzGo2SMyjOSNQR6pSGMA8pn2vT+W1RADzyk7o2GEkFhRp1NQrpb/wt/
         AufWuE4o3O11q+t4u6pHzqXOpShSEP4iPhduqrBfLdicGK0+FvzJm2zIlSDKTXg/gV2P
         ID8i6blvZNQdTy5CcszyFvRmIVDVvRBZV9JmM3a/WVOfryPEObvqQjHdNgtlzXAnQuh9
         G+3O5M2dHJZVjvqskg1GHYR7XM2iBzdhZ/lk8Sxur9lKE/RqQuRdk55t4DyV7lenFZwC
         taFZPervLBWnCwMsIvTNIXi2LakYJGgcosuaWIJl/ToYXwm3OgoGPVn8GrfZHpS0FFYJ
         kVZA==
X-Forwarded-Encrypted: i=1; AFNElJ9hvATPKnYMvfKjsRVpiROEv404t80mWVreqEULrx20BmUzR6QTHajWkt31cEY49fUt/brgyUeODjwQGk+b@vger.kernel.org
X-Gm-Message-State: AOJu0YwyZJyG3E2rcQuYv3b01uH1uFDPTIeU8ODKXjtWpJIiYEae+BHb
	xdk5odMHACfAe0S/FlkFr/R4jhGESAERAK1lq/qyVi4rnK5VT4ZTUDxbkabQYjp+8Au0FWrmYVU
	QEcd2TY1nBFbozt5aJ89/i47QjDuvEwZRtFcbAahfRM4ovE0tHH7VxyVGK+mafbZiChbd
X-Gm-Gg: Acq92OFVn/z8xeEgsjgwCEpOyEjg53/RnMEvuMo+KNwZxKaPv0OAc6xoHHJefPBHhts
	I1MNZlGAD3E8htjG6IETxeHR/fsERl4jjQqCid7jq/leOR0LK+iIoUMxDipYgznH3ehdHD3QZNP
	YFNx/ETSH+pjKz18nDOPXR2TSzA4ypoKiPm/vXArP0Xl/BoB0J/BXkQGOzfr2tG77BtWhCoOa2t
	FTmx85H5Tvy81/7Or34b15rgel5ze3CTNq0KfgHRk6uKzyClOM0c9z8vZsb8k2GWAUSZLLXKXui
	cF8hsYB6/0UgQLa2L50YFj/sQdGqpa9mfNn0xXqZ7jMunKIBP+UV3NR3cuRqSjAMknH8gQpghnR
	VJrToyFtsqUMLFQpN1RQ446m/dzx1G6VEzlbi2mWQQ9HBWFSJrxPXL6HFzy88/AA=
X-Received: by 2002:a05:6a00:1885:b0:842:21f0:5110 with SMTP id d2e1a72fcca58-84284f78f43mr6095766b3a.27.1780550829932;
        Wed, 03 Jun 2026 22:27:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:1885:b0:842:21f0:5110 with SMTP id d2e1a72fcca58-84284f78f43mr6095745b3a.27.1780550829459;
        Wed, 03 Jun 2026 22:27:09 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842820e8e6asm4493678b3a.0.2026.06.03.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 22:27:09 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 10:56:14 +0530
Subject: [PATCH v4 08/13] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-shikra-dispcc-gpucc-v4-8-8204f1029311@oss.qualcomm.com>
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
In-Reply-To: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: KAElfdd5caOYhz2HI1rgSlud3Fr371t_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA1MCBTYWx0ZWRfX/O/1mBNJaHPG
 Gpq2WjXpx2x0JL/UcbUE5S5WDl3+tD418GQyzmoM6TGmI75UcQPP+FGIM5EWCIHSee7Mw4Dewaf
 E981iZhcDHQZ0THdnMzEbIUpdXxRCihkmPhjz01+lzguR/EY9rIevpMifjFVouiuhAf9Z6WH9fp
 jLUoaAvNFJvPJzV56ksAPaC/+HHlmFPvhDfkvTv9MiEqXxOXVXHk+Ia+ycGGwBoFlCXSXHjjq8K
 aG5tT3gGZLKEBOpihMEfe9vaV+kGGKeBawDVhoBNkRs9VWP2LtWpEplt3CMeFWZ5C0os1XnfQYK
 lqAtgnxJN/q/TAqmDLBObAqw2G5Qpab5d0BE7e6uU2HvdbALgXhoYxWPeX5fQspUKo+lPZ7rNdd
 kwdsGx2gbyPR3vQYKPBLi5f999NY7uG9NDE/j99myNTE6V67qVzJk+VUWlwzV6vzIGmR066M3LV
 WI9sS9NcWkW2+carVRQ==
X-Authority-Analysis: v=2.4 cv=E779Y6dl c=1 sm=1 tr=0 ts=6a210cae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hOWgcHCWboPR0Rv3GuQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: KAElfdd5caOYhz2HI1rgSlud3Fr371t_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040050
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111124-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA9A963CFE2

Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention. While at it, drop the
modelling of gpu_cc_ahb_clk and gpu_cc_cxo_aon_clk clocks and keep them
enabled from probe as per the hardware requirements, and drop pm_clk
handling as the required GCC clocks are kept always-on from GCC probe.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 92 +++++++++-------------------------------
 1 file changed, 21 insertions(+), 71 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index dc369dff882e69a8c0acd260953d5fcae9453120..1c8ed12f6bf8154596d031347540ef621314edc6 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,14 +2,13 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_clock.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -20,7 +19,7 @@
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
-#include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -57,6 +56,7 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
@@ -148,20 +148,6 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 	},
 };
 
-static struct clk_branch gpu_cc_ahb_clk = {
-	.halt_reg = 0x1078,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1078,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_ahb_clk",
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_crc_ahb_clk = {
 	.halt_reg = 0x107c,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -224,19 +210,6 @@ static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
 	},
 };
 
-static struct clk_branch gpu_cc_cxo_aon_clk = {
-	.halt_reg = 0x1004,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpu_cc_cxo_aon_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gpu_cc_cxo_clk = {
 	.halt_reg = 0x109c,
 	.halt_check = BRANCH_HALT,
@@ -318,12 +291,10 @@ static struct gdsc gpu_gx_gdsc = {
 };
 
 static struct clk_regmap *gpu_cc_qcm2290_clocks[] = {
-	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
 	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
 	[GPU_CC_CX_GFX3D_CLK] = &gpu_cc_cx_gfx3d_clk.clkr,
 	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
 	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
-	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
 	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
 	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
 	[GPU_CC_GX_GFX3D_CLK] = &gpu_cc_gx_gfx3d_clk.clkr,
@@ -342,6 +313,16 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1078, /* GPU_CC_AHB_CLK */
+	0x1004, /* GPU_CC_CXO_AON_CLK */
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -350,6 +331,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
+	.alpha_plls = gpu_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
+	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
+};
 
 static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.config = &gpu_cc_qcm2290_regmap_config,
@@ -359,6 +346,7 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
@@ -369,45 +357,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_clk_create(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_clk_add(&pdev->dev, NULL);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "failed to acquire ahb clock\n");
-		return ret;
-	}
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	clk_huayra_2290_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-
-	regmap_update_bits(regmap, 0x1060, BIT(0), BIT(0)); /* GPU_CC_GX_CXO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-out_pm_runtime_put:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1


