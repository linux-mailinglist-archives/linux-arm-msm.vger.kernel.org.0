Return-Path: <linux-arm-msm+bounces-109518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBx1ACFRE2oI+gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:27:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A558F5C395C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7EE4300899C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFDA333434;
	Sun, 24 May 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZ+7v7ND";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQXfYmB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898D531A549
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650780; cv=none; b=KRB+m5kuGx5SrJW0rs9MpVBwPdiKYXdKuOqZ5DdQ9lSTIGYpfyblWMIEEuRWVAq+0lYNY0W+J326MOfC9Gw3zaVbWiSrZeXgnogm9pRpHxZyZBKEOwVX+89qULWVSH/JVnKNL10oi8aMMK4v3MfAE5S6DDH21bXPaijsMvfiupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650780; c=relaxed/simple;
	bh=WLJrEQF9Y7NigQZClz8IucXv+mmGIUfUo3zkdRhYPGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EIg8mtuTRGa0x1bRyrymvS43Bzu9OD40PMmZ+pulrppkYAYO5QLp6g2gPnC2QiVVs6H6kT9j/UYxVmxiSB9GgerDSDZgmTFHZoG/VY12/ptvCG9wUJIIkFo3wDrHULDeZB2eRo3/OKfjvl+nyCOg/Q2dohau+5wdDWXwTRuzE4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZ+7v7ND; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQXfYmB7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OBVj5I400542
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8XmU6cOQ/nUtzY4wcyLNE01H6LUhVcm8naRNpnvf7E=; b=jZ+7v7NDQIGCudWU
	xUjP2SFcxjJzcaCnekSSD1CkYG0EJ9h+0dve/XZpnPR4BWKXYRAJQMT1WaWsJWCp
	2KbvemIr9zaMXS6e4NPc6R8mgpeGKLw34tMuHYnKJSrNNtPwifZ79uCXHDzlFam1
	pr15z3wdPZNuMU9CCGl4gk6NFdg/PW2BwEoIZBOG7qquLAg8vCX7oDsOdqvidV5w
	hYefZqjDoEjhSio2wn/HekkZ8z3hx/DWMgRp3tu0ow09Cs4TGmU/RTAbi1VExVoP
	lVslYY1QApPU5w6h00800sTDPwNC60lxE9xFne1P835B9qdrPHnV/Jy0nVjSr9yS
	Tc26MA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w3bux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba15e384c7so60794985ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650777; x=1780255577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8XmU6cOQ/nUtzY4wcyLNE01H6LUhVcm8naRNpnvf7E=;
        b=BQXfYmB7/BqLV3VjFY6cOaclIb9uk2Omfwfv5Faf6SgbSj3kA5MgXC4HiJM5gCsie5
         AodPloeFeOr6gG8MGNTBSmLYJ6xeP/iB7mULV3FU4E2mQLzJoTOr0FaLGy0SClIujX6E
         W4fR08rPfTFY/TX/xBKZSPYM4djHDuL2LeZk5n9GVJTPF+sgAsB/hPn/5gTbgYXyAIq8
         b8xUtTAK4NMz0srpul5OJIKxspCEkMgJ2IUbOzsFltqMdHRe/qAYlukkiZRVzZulVE0p
         USqoBaeFfayuWwNTKSLqyHjdJlGzKgQxj1o3xmxv03mz3t9aSF9F+vzce/IofmWT3Rmn
         cpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650777; x=1780255577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R8XmU6cOQ/nUtzY4wcyLNE01H6LUhVcm8naRNpnvf7E=;
        b=het/6BlTZTP7JZRmU6Sn7769GjrgLiazKBhGQ0n9FaZ8EEOgbCYIW1SmnpKtjsoUdr
         mBl/O0sHVaDZGcRKtNxP07V6ip5DrXdxuOVbVp38lMFDtiFzicVTpcPIzvEDtArn9PZ6
         RXlZNFYDPtniN7of/rpyKSLNFQgmgrIezXjB2lep0r77hF5EhQSkmwiIB3VjkSur8Elw
         REj2SpwW+4+XViKs1PBgvZ6/cfl3uTyFZz2e68Y9M6wTzJq6KdZjVtA7rnnE2JHqDySJ
         83lhO2DuJCZGuJUhHQa0hXNUVBO0fuN83+nA5ZIU84g7I2sc5r0eT0kKv9cKk9oopKvt
         OwaQ==
X-Gm-Message-State: AOJu0Yxh5DgsXAiyYx7qAGAmcBwwT/m5LGuODL20vf83oDJA8re9KrqJ
	tAUF+/K0gW7dJY3fPUk5nS+vHuNZlpgZEvgxa3P/6S6dLaFxdYL3uHTu7++yfh3Q8L45q9hO/7G
	OWOHGY7xoxLQMwJzvSVECrrFePzKXjaQrsjCwf5Jy8ifxEURhwjVV4Bbn2DsdCKKM6BSh
X-Gm-Gg: Acq92OGwjkAzs3rTLta5lc9yF8Uj/fNvf/8Gf9vxoK845oMsUiVD2DmcAuUwOrzw6qX
	ZmMGIueU20+Yff8Pl/tH3lY62cQS49Kt3IGutEYqKMbXtagmIYBVVfDZ+5MGeoZhjgmqfWg7qUS
	71iAEjwoYmX2mlBKb169ZTTaoSdycqgiIL0yFVJwCcoQv89sYg9TwrwCofyhCfr/Pk+MOaOCfp6
	eQPAu/+dizTbSlmkMuaP06og6MDChTxNBkA9qHFDXbwLVGD4jMk4GC3Ma6NHg25A6cG1lrzcRuu
	2eLFPPxI8zwl4+5SoudnXuVamIUd01XPsRebNslT8NQ8lYle8pRmqhhuJPS1GlPdSpbk0kTwQ7y
	rd4/C3xiwREBTh/lDTnOITKa9RCd3TZZoKBnOg+oeKr3YJWD/sR6akVLeDUo=
X-Received: by 2002:a17:903:3b8c:b0:2be:1db0:f166 with SMTP id d9443c01a7336-2beb0346484mr129305785ad.10.1779650777089;
        Sun, 24 May 2026 12:26:17 -0700 (PDT)
X-Received: by 2002:a17:903:3b8c:b0:2be:1db0:f166 with SMTP id d9443c01a7336-2beb0346484mr129305495ad.10.1779650776559;
        Sun, 24 May 2026 12:26:16 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:16 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:50 +0530
Subject: [PATCH v9 3/5] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE
 init
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-3-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a1350d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=PzEurhthzZq-M9kHIYIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfX213h6GYQKdpg
 s4TINuqnAzoVGmNwIivaT9yPOwuX7UmFZfikcMndTccd3b2w0fAPCf8Jpa2fMiQRHJkGJ81XGxk
 sn2x2FurkUuI8PvunOLdoGQWLpbcawXjeNXv8iQkTQtJpvZzUAbf5UaKOxbrhGeEqU9Z2MLLoYA
 0jB2WHmZDLvhz7PEl679xjOW7m3i6Bh05iJVAEC1q9k4hsJrGuTxIcTrD49T3XXK6PiDjxnWC90
 zL3OyUY8Bc2qWOm3GwuQlmT7eOTajkl0yOPzcsZnICNddHHlBlzi7Nb20Z1dBQqlPQaF5t7YPJg
 MRdvOvHRnHnr0m3FRrefpOz1wlim8ExoPeHQiPvAWGrXtgFgauTn8uiVaKE2uF8K2ErqQj8lLwd
 st75UFimCIL8iPK2SMknNRJc2d3tpiQV89X8qYMR3sq4dO7vZIQk/UjlUOPijQYVgbIhsNALN7z
 yEuAGFe2LNza4+WdLQQ==
X-Proofpoint-ORIG-GUID: P8vIZ9wGK9qlQMm89fdA0-Ev4pYfZ9uy
X-Proofpoint-GUID: P8vIZ9wGK9qlQMm89fdA0-Ev4pYfZ9uy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240194
X-Spamd-Result: default: False [-0.56 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109518-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:~];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A558F5C395C
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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 633462c0be5f43c06c497520faf9f6fa03fa652a..cabcb75ebbac392eb6dce7ac8c756724ef9e1b49 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1901,6 +1901,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 #ifdef CONFIG_MMC_CRYPTO
 
 static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
+static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long target_freq,
+				   bool round_ceil); /* forward decl */
 
 static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 			      struct cqhci_host *cq_host)
@@ -1959,6 +1961,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	mmc->caps2 |= MMC_CAP2_CRYPTO;
+
+	err = sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
+	if (err && err != -EOPNOTSUPP)
+		dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
+
 	return 0;
 }
 
@@ -1984,6 +1991,16 @@ static int sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
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
@@ -2149,6 +2166,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_host)
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


