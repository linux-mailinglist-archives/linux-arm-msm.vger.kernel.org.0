Return-Path: <linux-arm-msm+bounces-109515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFRQNd9QE2pR+gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 543A25C38D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01534300D173
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290FA314A60;
	Sun, 24 May 2026 19:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGiUW9lX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GT/EMdJb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217D330C371
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650763; cv=none; b=suqmS+uQfFG18zRsGGBXUZoiPeNSItZjyXYmU2Bolxht56wr1gyvmbfl15wZuCKl1YjFfYZMkrizJLehtmyOWERMCJxEc7cP/jD8F/isCAzZLlnd71EgFYw5ryt7Bo98UaiDaKZKZ7JNk11qsAZtFECeEP8CJz+3H8XUU0zBFAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650763; c=relaxed/simple;
	bh=B0VOJ8/zBjMf8dfuHg3C5wV5Cxjtl1G9OKnradFyiuc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FyBDoewuT3Dtp9LZKOkC5r0qwS1Ku/OlV+DnWZoY/mAB5QelyqQvy8q5p3GePAcGgjf45QGpYJthJLOAGtTFFXuFl3uC8+Sz409PKZ9+amEV/y/gfmmjTi8bypNe8cHv6oCFGrC8UKZ3a8nPgf8K+M2gOpwxcdSPAyTobqHF9VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGiUW9lX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GT/EMdJb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJ7qnD1508064
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lSDEZFV0/adqoqTXO5ClTK
	ea3q1A4n43J+lnyR29SHw=; b=DGiUW9lXnokL1Bl9DRVxBaCMOP4sk//PsJsvWe
	CWzxLMFmU8DKsFHt0LG+oQtUH6cUqZ+GzY5J6RYeDShjy4zEiwlrqmhmJUD7ixUS
	Iw+JVpR5UTz9Ca4qSG2CUjq02FZUCFzEFjDdqMNDdYWFTqI0u4chj/4TTFkYsPLd
	gULfO1cILdPJXoyQW+2I+i0bBPpWQWljCmA4VRWx3YwvMUxgHJarF7A2zfq/TLVg
	fJr1Clc9CTSEjTAEpI0zJpCgP7O5YwuuJLH+XqAojwH8DOIqnKZDBWNbg4tJdJ16
	sEJr4kLnpr2gHEmGWyXCVevp/0gEwIExi7c56p5kekpj+VWw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0u30s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:25:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd00a65673so67045025ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650759; x=1780255559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lSDEZFV0/adqoqTXO5ClTKea3q1A4n43J+lnyR29SHw=;
        b=GT/EMdJbkMl1O+Pq1PxgS0cW0OUAKzh3yh1JT7t4DsrqC3fsGFOcdZidAF4aQ8HlZO
         w88UwV3jrpU5jFGGn/Co+4rHkemkeZlVodELQdd63YXEel+uuvs1RMF69guxpm6LzbuA
         zCXIDtIukRi2zkMF/11mp6CI8A5GTgcfu7f3Yqm+FacA+OrNJfEsDVr9d46hBZOEhwc1
         itYQ0AaNP5D3Ar1pSof5kfZCPLbEjAUQw3kVz72tqMrejr4kKLbcQReSQs3wMGuY64Jt
         ewrYMR4cnjtE9HEfrzha/w0OjsZcF1MAcSg6Ojglr1Uu7XkJhm3q4nr+zPDSjuGjt2sf
         Hu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650759; x=1780255559;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSDEZFV0/adqoqTXO5ClTKea3q1A4n43J+lnyR29SHw=;
        b=FyNgBXyl1/ELqhH4cIrHbGgU7iaEwztN7Mm6oU9M7x1WzeNpeXEFLWRh6B9Wt/pQhM
         1VGpTUtIo+bG27QF9mNFqRDzj4aQFA5RiBWr11aD045+niAvy8kNAOeZt8zVKWdy8aeu
         zEzP4WkxgL3cCAUGhNCFAvYgoFle1FkExRLoFrHBW6EJOBtZgGdUSefHIwk4Dp0Om+MU
         80k2SfGgwORssxee54wQtR9hfMRSvBkiWip48eZEWq620+0P2OjTvx4/iZ9HlikyAZ/B
         dALg4aU0lf1GjQzq3jMuLgwxanMKM7bNBMXu+PPzfQU8RI0nsyUchBfBFyxqv147oKAE
         JdwA==
X-Gm-Message-State: AOJu0YyckB7NuZE7VhZpRY6UP5mmV2Jgar4R0Xb9rhyq5HMJCg82JPCW
	TBYaiEIl0AycNjQzl/8pZmU/0B5Ejz4JQGTMVlm5zGZAClEjjuXnfXdbksCpHNBw8np7GxvCr28
	TUAuIKWK7Q3FDV6/XSozHBQgsWLRzlmvFBPgQUThop5JSibloNVyj13Tju4lxzDdlxuQp
X-Gm-Gg: Acq92OFIZDm+M+lCxM9wj5wiTPWiMqWqo9ks1Wwnes4I3tfmvpJ0wecOB2QuYKK6YqJ
	xs8hEi9BfFpjFdx7h6iM0/pLGvvl0nITy3vBOoC4ADMfETotd6vUz41HPW1g/bLtXA8E3U8arBP
	SIaCUGPrQlug5JSuBidWf0H+9XMLhSes5MuC7j06113gsvywNX9eyQKUISW/A3BMl8JVa4RmyOs
	SUoxlZAoj4/0m+nYq/vAneJ+FRznXL0ENZCdwOrV1FAd06PEc/YUvxo3ORnNZxb1eqgmOxGaNbW
	V3X1Aaxq5FBKDv0AWHbU3bLTfVaBYKZJO1VGbXSryN+8DVFQ0qs1z19Wa54cv1pOxOBf42DJBSo
	m55jszW5wyb0I1kZ5mPApQ8ZkHKWOQDBD1A3vH3qEVeNuWs0cbABjwHmzYKw=
X-Received: by 2002:a17:903:24c:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2beb09b70f0mr98436385ad.20.1779650758475;
        Sun, 24 May 2026 12:25:58 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2beb09b70f0mr98436225ad.20.1779650757926;
        Sun, 24 May 2026 12:25:57 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:25:57 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Subject: [PATCH v9 0/5] Enable ICE clock scaling
Date: Mon, 25 May 2026 00:55:47 +0530
Message-Id: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALxQE2oC/3WRUU/DIBSF/8rCszQXKLQ0xvg/zEIYXCauLVvpq
 mbZf5d1PpioLyTnBr57zuFCMk4RM+k2FzLhEnNMYxH6YUPcqx33SKMvmnDgCiSXFEe768vUIXV
 9cgeane3juKc74RtwDUrnAynPjxOG+LGiX7ZFv8Y8p+lz3bS0t+kdWoP+H7q0FKizjHHd6FaBe
 k45V6ez7V0ahqocZHu9L5vwdC725/tGsrO5wMqlOJc4QjnOQLW+sR4BBJdYg2/5LngeRODa66C
 kJj9jd5vVH+NATwVkijtzTO84GTt64/qDWdKMtFG6gTpIEMp2i7whBszZfjMeV4hgwJiQsqlE3
 UrglNERcbJvVU5j/BXq6S8jNahbQwaHwZm1JmO9j3P5MYpMh5KRBWdlt/BSyvULUYNvy9sBAAA
 =
X-Change-ID: 20260525-enable-ice-clock-scaling-b3d70c7e5cdf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: k5FGC_hqqODL2huJKAd5YUbH_0DF9Vyx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX2hxyrkD5rOjc
 LuOVhky6Fioot2uSkMB4tNck5EKf8ZL51EUvDstlxatXl9e4xPlXDfBgJ+51QI/YjApjErG8PKR
 HCe+322P6dfqmWJ+toTBVC89Q0JzAcMZAaEDiYRDFIqqkv2lhvrvA9bLsKHciERE3O8vErptcBM
 DC/Lvs3zFBSRTDb2ftZBC/C73pfg4xAWBKjHgn8PlZdogGPGErqujYKf/XApDJaY1qyDSvW+nFd
 /wuLIjqjL0ErkYSDJR3WsSj2ZBhLin3hIfRJFMNUKluyed7bxBb7ZLwP0orMW5r/8PCh773Na9+
 wpLIeGbb09iyW27lRyC+a7x4JG9VtAdGlFppvz3m+yNArvdxp/uFHHk/vVgYwgsl+e+Z6d1T/pT
 pNqz0TpZyDhOFNz34Pt3A/ZTHnOlpDhbz1evFlwJs/m8P2lefvRR7k2CExa1KEsJt4HrP/4VucY
 BFQTLKNOKreYuTCP+7A==
X-Proofpoint-GUID: k5FGC_hqqODL2huJKAd5YUbH_0DF9Vyx
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a1350c7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=D0JgdhPY6ITr9mA7PGIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605240194
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109515-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 543A25C38D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
using the OPP framework. During ICE device probe, the driver now attempts to
parse an optional OPP table from the ICE-specific device tree node for 
DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
and is invoked by UFS host controller driver in response to clock scaling
requests, ensuring coordination between ICE and host controller.

For MMC controllers that do not support clock scaling, the ICE clock frequency
is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
consistent operation.

Dynamic clock scaling based on OPP tables enables better power-performance
trade-offs. By adjusting ICE clock frequencies according to workload and power
constraints, the system can achieve higher throughput when needed and 
reduce power consumption during idle or low-load conditions.

The OPP table remains optional, absence of the table will not cause
probe failure. However, in the absence of an OPP table, ICE clocks will
remain at their default rates, which may limit performance under
high-load scenarios or prevent performance optimizations during idle periods.

Testing:
* dtbs_check
* Validated on Rb3Gen2 and qcs8300-ride-sx

Merge Order and Dependencies
============================

Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk API to be available.
Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk API to be available.

Due to dependency, all patches should go through Qcom SoC tree.

This patchset supersedes earlier ICE clock scaling series (v1–v8) with updated dependencies.
Hence, this patchset also *Depends-On* the following patchseries:

[1] Add explicit clock vote and enable power-domain for QCOM-ICE
    https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com/

[2] Enable Inline crypto engine for kodiak and monaco
    https://lore.kernel.org/all/20260310113557.348502-1-neeraj.soni@oss.qualcomm.com/

[3] Enable iface clock and power domain for kodiak and monaco ice sdhc
    https://lore.kernel.org/linux-arm-msm/20260409-ice_emmc_clock_addition-v2-0-90bbcc057361@oss.qualcomm.com/

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
Changes in v9: 
- Kodiak ICE eMMC OPP-table entry corresponding to 300MHz is updated with SVS_L1.
- Add 75MHz for Monaco ICE eMMC OPP-table.
- Fix error handling and initialization of has_opp variable.
- Pass ULONG_MAX as target freq instead of INT_MAX from sdhci_ice_init as it better adjusts the data-type of
  the function qcom_ice_scale_clk.
- Link to v8: https://lore.kernel.org/r/20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com

Changes in v8: 
- Instead of scaling to TURBO in ICE probe, sdhci_msm_ice_init calls qcom_ice_scale_clk for setting freq to max.
- Fix error handling in qcom_ice_scale_clk.
- Fix error handling in ufs_qcom_clk_scale_notify for the call to qcom_ice_scale_clk.
- Move the registering of OPP-table to qcom_ice_probe and remove passing legacy_bindings argument to qcom_ice_create.
- Add OPP-table for kodiak and monaco ICE eMMC and UFS device nodes.
- Link to v7: https://lore.kernel.org/r/20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com

Changes in v7: 
- Replace the custom rounding flags with 'bool round_ceil' as suggested.
- Update the dev_info log-line.
- Dropped dt-bindings patch (already applied by in previous patchseries).
- Add merge order and dependencies as suggested.
- Link to v6: https://lore.kernel.org/r/20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com

Changes in v6: 
- Remove scale_up parameter from qcom_ice_scale_clk API.
- Remove having max_freq and min_freq as the checks for overclocking and underclocking is no-longer needed.
- UFS driver passes rounding flags depending on scale_up value.
- Ensure UFS driver does not fail devfreq requests if ICE OPP is not supported.
- Link to v5: https://lore.kernel.org/all/20260211-enable-ufs-ice-clock-scaling-v5-0-221c520a1f2e@oss.qualcomm.com/

Changes in v5: 
- Update operating-points-v2 property in dtbindings as suggested.
- Fix comment styles.
- Add argument in qcom_ice_create to distinguish between legacy bindings and newer bindings.
- Ensure to drop votes in suspend and enable the last vote in resume.
- Link to v4: https://lore.kernel.org/r/20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com

Changes in v4: 
- Enable multiple frequency scaling based OPP-entries as suggested in v3 patchset.
- Include bindings change: https://lore.kernel.org/all/20260123-add-operating-points-v2-property-for-qcom-ice-bindings-v1-1-2155f7aacc28@oss.qualcomm.com/.
- Link to v3: https://lore.kernel.org/r/20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com

Changes in v3: 
- Avoid clock scaling in case of legacy bindings as suggested.
- Use of_device_is_compatible to distinguish between legacy and non-legacy bindings.
- Link to v2: https://lore.kernel.org/r/20251121-enable-ufs-ice-clock-scaling-v2-0-66cb72998041@oss.qualcomm.com

Changes in v2: 
- Use OPP-table instead of freq-table-hz for clock scaling.
- Enable clock scaling for legacy targets as well, by fetching frequencies from storage opp-table.
- Introduce has_opp variable in qcom_ice structure to keep track, if ICE instance has dedicated OPP-table registered.
- Combined the changes for patch-series <20251001-set-ice-clock-to-turbo-v1-1-7b802cf61dda@oss.qualcomm.com> as suggested.
- Link to v1: https://lore.kernel.org/r/20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com

---
Abhinaba Rakshit (5):
      soc: qcom: ice: Add OPP-based clock scaling support for ICE
      ufs: host: Add ICE clock scaling during UFS clock changes
      mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
      arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS and ICE eMMC nodes
      arm64: dts: qcom: monaco: Add OPP-table for ICE UFS and ICE eMMC nodes

 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++
 drivers/mmc/host/sdhci-msm.c         | 24 ++++++++++
 drivers/soc/qcom/ice.c               | 93 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c          | 21 ++++++++
 include/soc/qcom/ice.h               |  2 +
 6 files changed, 219 insertions(+)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260525-enable-ice-clock-scaling-b3d70c7e5cdf
prerequisite-change-id: 20260120-qcom_ice_power_and_clk_vote-769704f5036a:v5
prerequisite-patch-id: 1750aded4cac0105fbf943c5bfd9f844acf4f227
prerequisite-patch-id: 8cf945709b92296c73859515bb67820360d785a2
prerequisite-patch-id: bc8821cbbe222f208c5d86d96f3640c169b972d6
prerequisite-patch-id: a1baf04d3cce803fcb47b1a80591bf7759de8a76
prerequisite-patch-id: b7de0f216e54e264e054f6333b3067abce8d05c5
prerequisite-patch-id: 57f21e8a9505564caebbf89cafa9bd80be1dfe9f
prerequisite-patch-id: 5128586130e3f5847e0417de47ef755b2e2fba93
prerequisite-patch-id: fa46b7d6710907c5eb5ad01e84d28f09a0b26e5a
prerequisite-patch-id: e375d6e54a55c055f5d8673c65d35073df396646
prerequisite-patch-id: ec670d98300863c4b68155a3b0feeace56a4a55a
prerequisite-patch-id: c5ee690afd7f7105963e991dff760de62a403d9b
prerequisite-patch-id: 4d792e5cbecd8946fed4c7fb7c192b78b4f30bee
prerequisite-patch-id: 52c56183a63f9b75068635533d37aa9e45d935a2
prerequisite-message-id: <20260310113557.348502-1-neeraj.soni@oss.qualcomm.com>
prerequisite-patch-id: ab9cc8bd28b2e1e27df6e44907e8d758dfeee3df
prerequisite-patch-id: 40f239f7f06573ed45452249f444e54e3565ada7
prerequisite-patch-id: 59129ed0aeba84f6b50f42261d51fe323806a240
prerequisite-change-id: 20260406-ice_emmc_clock_addition-e19f36c1fca5:v2
prerequisite-patch-id: 5b6a436bd949a93e44f912d2565103f6bf0ef55a
prerequisite-patch-id: 7f9ff2b708418a77578e154102f72f0da243eb71

Best regards,
-- 
Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>


