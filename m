Return-Path: <linux-arm-msm+bounces-102483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HfDJIWR12k2PwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E43C9CEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD1E303B4E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE96F3BED75;
	Thu,  9 Apr 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8+jmh/x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AV0RI0Dd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604973C141F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735101; cv=none; b=CHF2ItdGEfskQi59Ye6V6gqZBFbqSUMrqfrMd8UfKO9QH0fhnhSlk2ONsLqt8KeJonjCJlHdr/CXtmKWdxiylG+/8wMGT0dxOtUnc7moHck8Pp+E7QIVhICY6bj9M02xubESpHv2BVPFEFxlGTmpI1AjReOu0AIGmHnw0tR4wkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735101; c=relaxed/simple;
	bh=mqwO6vhHa/WasNF61nJHaYRSrbFR2Z3ArE3JxzJ07ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mHa4NQeoLsfbRJk72vdg/RlYs2Qpu9Gewy7x+nlIgqHe1O6Y0b5yvsl2xZbUkqUkQau412ug1V6gykC+75Db0g13xsIpuoqVhMIVzFrwpCbMrexCC4T/Fsj6ZMNolH2FdVSKYRwmnWeKJcyozCCSV+7ivBv03qvDNZaTO9g7It0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8+jmh/x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AV0RI0Dd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6397l8gv1071887
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 11:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZvb5TNGnSRnh7Yw6ww/CSSTnFHggTtfN6hnf4UNCVs=; b=L8+jmh/xUqy/HsMy
	Xwj1VWwP0uhmM7RTLUoV3ZMdvF7aRVlqOTG8DMt456d9/fsG/7gW9vjdT8ytwtL6
	JzcnE4ybvjixeGKH/sYzRIcK+XT8ixmgDL4xiarrwouNjcqyq9aS5eHgldKULNqU
	UyRJcGbC/c6vuZbf5tHLi18qB1xU6RkzJ+De387I5PXFxtBqF9U9GMqa1ocLl+8A
	ijcncpHo7Vnz8g5IOCdquQoaoIwdX1Crc9KonHgSjaE2QfZyc93vfu2xgoRjvFoz
	P6QND+4DW30s8y8WF1JRX6KMzi5duu+YD85SlHo84edhFLL7PfJsnHC1e2C176sz
	ZA4z6A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3btkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:44:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0b57e192bso5740675ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775735098; x=1776339898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZvb5TNGnSRnh7Yw6ww/CSSTnFHggTtfN6hnf4UNCVs=;
        b=AV0RI0DdE51ydyuHtIxVJRRZBSU2dWNxekjwRXqvJtzzTP9taJDustR9/PrVoVHlwr
         BVDX7pgz3fIL94RwclI2yWj3G+e4vHMu5axYcSWpuSwZtp368Zx7tQ9bZGCouXJe4/ye
         zbp//8zg+IZmmFw7qCNwrB1/pQSWQhpWSZqnsLVPGixjFciipu9fnrjmycuI2QKsQfgu
         aGe4OLy6MS7ALWu9bUsmkvrmTStNxGwE9IxMCuJvc6Y9PYISW4JLadJR4IUnxC+r2MiT
         5GxFYwGEe+pCXUwEVx7cT0P+lcybZair/lxdKwdMfOja2ebZ8X3QM6EP9Py5ie0rShV1
         /7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735098; x=1776339898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZvb5TNGnSRnh7Yw6ww/CSSTnFHggTtfN6hnf4UNCVs=;
        b=aecervfLoNTvYRSrlUuSj4hS3nD3/V4QUIs82Bd49j1C7d4Fpc0BfHBtFbFBgKC+ev
         aN4Lz+GdmQcTogaRET7NL7dJUl01u3CreLj9IfIa7ZSyQECxyGbhncOJ/LVRj/Jsyh70
         6N9y30Chclgs/sLJSZopf0P4eUJXhb+3AbZgL7zFWdVHE0TMubNpkodTg8TUcLcCp2g9
         4kQzlhiEXOgM8MIdIGBYB1vhNcn+H+6C+IV5DNYdZYcA1FOEqohVd0b2CXEAfcjrAxli
         N/rDnfF2oSaDR04fSHcmq3wl+vBBFenRs4ihjO3L9S/0GhTZvl62scrxoOVftYvbaURA
         y5nw==
X-Gm-Message-State: AOJu0Yzm89Vcth2JIJc1H0BGUPEyxvmfWZgGRIHVL6paJkExxJygucZU
	UpZLzOUh/p/K6WFxn/iuzjiTZG/Tyj/XiSYtXdh7YLlJwdqiWqsEzQK/jEBRbqLIB2GU00bEgXJ
	p2sGXiWggO3DCaGrpByAVEpBBnCBQoo/rvSiyTQYwEsUuwn1aoOmmGxoYZvYv1BK3ADXf
X-Gm-Gg: AeBDievtwVyEhgFJW6xQA5lIgHB4QTZjx8kIX9NgfvjjRjjHPKFxNNGiwin8Il6tZZS
	yzOu/Fl60J1AqQcgiDfPavSYhn3BSbL+k07DmbHnG3/mvfaDPqXERr2GR5MA25kIrHDXm0ugQ6l
	5/z/Fdv+QYdTDJ+QhageejKZx6nzV5as0zw377JlfwLKc+l0558wyasNW4+Esb6YtSWOLPPINlf
	mI8SeVWhar04mOXGN3TrV8nqZUYSyqx1wISugahE0I99wwK6JYGlMHMwz1b5QiXbIglYfndqY+N
	ydSAe5xPKiWMdREK3000Zl1eP8btIGRw2+dc91Wzc97F4VmlgrcbyCygjqjEB5A0XD30dlCbR/4
	RrUhc6+rVj41dvKD/2afQR/fNTBzKWjxwprFANvpK2CBA+WCIWQXFoCsdO6w=
X-Received: by 2002:a17:902:f70f:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b28178afb9mr277907815ad.25.1775735098380;
        Thu, 09 Apr 2026 04:44:58 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:2b0:61c2:8e7a with SMTP id d9443c01a7336-2b28178afb9mr277907515ad.25.1775735097871;
        Thu, 09 Apr 2026 04:44:57 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm230957355ad.75.2026.04.09.04.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:44:57 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 17:14:10 +0530
Subject: [PATCH v8 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-enable-ice-clock-scaling-v8-3-ca1129798606@oss.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwNSBTYWx0ZWRfX3K/AuPUePKdK
 IKi+fvbA3ll8FDvP+kDhTXs3m3qf4qdCsh3oj118dVTweRQAtJwRzM1cGZ0cjmNFl+Jx6QsDN1v
 D+PFdRYArVI5FjG1VvJPAIEUJ+Dk1vbFuoKbMYo8uGy65DFNs93n6CiYxgTAqVVqVc21gllMqNG
 j5gv0bJTD3vzBfv+fOu2LmaC6oV9TdGHLRfxajToirLu7qrX9ks9Bhtz05HAB6iJTmix6fxky+t
 bSflt/mFqsq4mCuXuaIIGNocU5FkMyRo4/iRSTZ5wfJhVNtWui2ZtI9SzzNGB5BluAz+0YzRYSc
 EVd8adik4rqArqAeqksO+1qNmh1GOYehgK9E+kuPaV68L+Tzudby97NJ/icFuvSJIuZ2P1Lmx20
 xP4IWD/JLUgLHMDyfLkSZX8xRpqlS+BTuPlmO7kDIHC69NVAJcJ2IxC1LEZsfwDdSttnCy8y/nr
 IGs5+nYp5fF3MBvEqMw==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d7913b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: nkioeFWryPWMD5ET-CeUYtykuoyZJen1
X-Proofpoint-ORIG-GUID: nkioeFWryPWMD5ET-CeUYtykuoyZJen1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090105
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102483-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:~];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 313E43C9CEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MMC controller lacks a clock scaling mechanism, unlike the UFS
controller. By default, the MMC controller is set to TURBO mode
during probe, but the ICE clock remains at XO frequency,
leading to read/write performance degradation on eMMC.

To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
to align it with the controller clock. This ensures consistent
performance and avoids mismatches between the controller
and ICE clock frequencies.

For platforms where ICE is represented as a separate device,
use the OPP framework to vote for TURBO mode, maintaining
proper voltage and power domain constraints.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index da356627d9de6a11ed5779bf057fa8eb23c38bc0..32e3f37fe425f66c00290a373e06e8ab6257824e 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 #ifdef CONFIG_MMC_CRYPTO
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+				   bool round_ceil); /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
@@ -1964,6 +1966,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, INT_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -1989,6 +1996,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 	return 0;
 }
 
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
+				   unsigned long target_freq,
+				   bool round_ceil)
+{
+	if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
+		return qcom_ice_scale_clk(msm_host->ice, target_freq, round_ceil);
+
+	return 0;
+}
+
 static inline struct sdhci_msm_host *
 sdhci_msm_host_from_crypto_profile(struct blk_crypto_profile *profile)
 {
@@ -2114,6 +2131,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
 {
 	return 0;
 }
+
+static inline int
+sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+			bool round_ceil)
+{
+	return 0;
+}
 #endif /* !CONFIG_MMC_CRYPTO */
 
 /*****************************************************************************\

-- 
2.34.1


