Return-Path: <linux-arm-msm+bounces-81802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C5193C5BFA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F1D3344B84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9523F2FB962;
	Fri, 14 Nov 2025 08:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DgHLNdtC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NN+QE1zK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0605A2FB63A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763108923; cv=none; b=ECRaMFH3OQgvXTLRg1tiijZqlfpUVqEMAMVl7xchmjZ9CjsnEapn/8zD7TQ0eTprCh9CrF3Bz53maJayRk6KBTtDRLfAy9laHh2TvoxeOOm4XaSpaMYnbFpevDEd9IPc+zdkyPDirpn8SYzVRqVoLrvW7TQOoXYWBbTku8yhV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763108923; c=relaxed/simple;
	bh=AI4KO6aV7yUOTSXbEIrkTgQTAW7EX6hPVYZmqkw3FBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FX/qTYkbZJH3+Fa5hMlkwkyYnPX7XD5Lnbi+l3z325YzkfrOFWGZT+YyqkmJHjPhH24TxPrvS8hQQdhqahmZvd6a/GkVaOC+ZoQeJ7aylN6G1+QBirHgDOXQTUoezLM0SBZhCOXryBe8aIKdSllWTlPzqMkFyu+yoYD3XDedl1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DgHLNdtC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NN+QE1zK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8I6eA1629375
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:28:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T9lYcon+xXMFEgw5UyE3UtNnlyVIpRVbOX5
	LleJNgHw=; b=DgHLNdtCEEfzIxhEL2i4m0Sg5U2Co+HWBgfzNReRf2hnasA+w2B
	qVXbc7P0D+VpnXjc6MnzJW6DvVFW8M+5n+28pcXFV3n9cRfbCccj+Xf0hSnXQe1T
	EkSUggG9Z+g0A9RGoVbyInpOysB5Of484O9DsZV11CF/DBI95L+3FPDkZY6Mr3Sl
	PVcWUaAsB4rZ0yJ0BuE8F0JoHTwjgY6+Wm61FfNsRJQgH/v5kDICK9MouJY71X+y
	at16vAdcKH7TlXR+I8ZY6nQo4670XSNZRIJm35qI6NXzTARSCyoxjjUH2OstKuMI
	3LNIJ7YQGAVyOIybM1NxQDKQrVIt6zdk4bw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d9ebp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 08:28:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b94527a3d7so446190b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763108920; x=1763713720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9lYcon+xXMFEgw5UyE3UtNnlyVIpRVbOX5LleJNgHw=;
        b=NN+QE1zKsGhH41fhAraexwm3WSQ6Q6j+c6cDfg4k6te7nhfmXPR0pSdg8Z+wpQVvfA
         Q4BE5OcMj8Bzsh5ydS23v+2FzpZoySK0B6QjdYwxyQ/m5W5q7jgAOdeMGZJgozkrvFKo
         y6ST71TbnNjkS/ALyGZwiT6zCQvuaUj2hCzOVXBJOwfc5RH7oO2Nn6qAuB9xVsaWm4YL
         pM2jPvVJ3mukty3qaGi6V7eHZ/uO4GtZwamSOE11lOxMR9ReG/v7gUFy3zm9h6DvMg4s
         bsprzCUEYrU8L9au+/zfrwm+MzeaUehQgI/aeubJAIhTQyiaiiBbsEuylz/TdoTl8+4o
         8ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108920; x=1763713720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9lYcon+xXMFEgw5UyE3UtNnlyVIpRVbOX5LleJNgHw=;
        b=ZslNcmwKtn0bOefymmZ/tHk+4D8F/9+lGsLHyG7BVjaKkFka7SH6+fudb0G45nCgIC
         i7OADAdt067dHFMS9s9PQGWmmQzcWyTOiY/SUSDEw5roUZI47AxunC8LzY6O+LqxjguQ
         I+Luk3uSWHQDyfIR4EmjpOh+3edrTaRxrj1QWvpW4fxAV1xNMK8MBhPwPYuEm9Y9/hPd
         jWidhEr8xjlHzRlRq7buL+AErTyK9d6LkTZJyYSkeb1/c1ZxW8B3+8w8yZm4Sf/vQe8m
         HLiy+rvcrvtf2pz30i5x6ruNmYSB19pzdscTmYiLEiNlelblQRZDxs2FD5fQ9DAj6JOC
         Fowg==
X-Gm-Message-State: AOJu0YxFlj8Wpckwsi15mw5qzCaWrec2MFOtkmfYe8HTU4S3xqnztOP8
	JixRm3UXVwnjgAITdUF3rwKKs/IIJaEvr375qtT9avFNDuWLvqvSP0OLxso8kf+h3vGXVcaM7qI
	XnFARTy/z9lALb89NDR0rucUkA4VXYS83Mao7Eyg1LcCHTZ+DrT8RmlIANI1Vgoq6PHI=
X-Gm-Gg: ASbGncvIGuLm+dnkqSojaDHGwxdu2G5SL3hyjihNWGDE+hEGEHXnnP00ONiSpeopTKv
	XBaGhA77jdsCPJO0w9nbcQijbYquhZf2sL6rvJ5dWzqr4X3vkLcG/Xe0Y6YINNq6hlD6syGKvgl
	c2G+9HWpYLJxj3OO1+CInKXkDqrO+akeBN+mL6hZ60K7Pu1gxcDYkc4yFwHr+X4e90y4SoljGiZ
	iVzZS0aVHKflT0hUnMzcTwVyCPXk39cle38fzlfaKVZnkSsO0HuGsGM0x+4Y4M8x3wZ9HwD4M8V
	NLicgFpuEOMP6L1e8E8oFi6/ZFKsAGqvinxdY3TQQEQLRFbed6gGW9U09a5IiJ9iVcZIWq2dlDe
	2TZS+IhpwDDk5AjmXdfEuc25ZEpIP9y5Fr20QrpZS
X-Received: by 2002:a05:6a00:2e21:b0:7b6:ebcb:63fa with SMTP id d2e1a72fcca58-7ba6b790a4emr1296780b3a.0.1763108920176;
        Fri, 14 Nov 2025 00:28:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYSYA8F1SPeFVBxbuKdJm09PVEUwa31Jjh9DyS8E5KBXBwQeJQ/M8+eje7PDPADKFDSZOS0A==
X-Received: by 2002:a05:6a00:2e21:b0:7b6:ebcb:63fa with SMTP id d2e1a72fcca58-7ba6b790a4emr1296762b3a.0.1763108919589;
        Fri, 14 Nov 2025 00:28:39 -0800 (PST)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927c24254sm4485425b3a.64.2025.11.14.00.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:28:39 -0800 (PST)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH V2] mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
Date: Fri, 14 Nov 2025 13:58:24 +0530
Message-Id: <20251114082824.3825501-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -LjzN7qOByAimhR2GFCG8qvGFoeQmDpX
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916e839 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZhLSBf8pC8IsRUYoglEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: -LjzN7qOByAimhR2GFCG8qvGFoeQmDpX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA2NSBTYWx0ZWRfX1AYYnAmJOVc2
 w1AYKnie3j0RfmDm1DcpKMmQYMgyOdk96XXI0ZR3cSiLx/0TVvA/13K3KNLKO8k7kANLeAq3+Bw
 zKpHOaDkysb5bufCIe8XDgtqqfQQL2ZToZpxme0tH5tLprlpQUa46i/4pXRbd1bYQdE8t/n4HiB
 Mw/D1Tp1Jpjq6kxzcCLJEJ4V9YNo+k1knkndwSlZ+TopnXZkrpX1l5vc1Ykpd/lK2vNE/0/pvcE
 h0VorxGi156QQC2Tzh6YYEVbNWYmjXVVEDQ/cM+lN+oYDaBc1XkiQDdspP12Y5sLToj/aspMpQq
 HP1HgyfSGVPhzCl2sO0GNLT6dtaXNQlAoezZ2s6z+ooIHomRS9YzieqSGCid4jbswIW6kGg3N4E
 HrjpOpX7cVfZKa+GxW+7sjHJj9mtOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140065

According to the hardware programming guide, the clock frequency must
remain below 52MHz during the transition to HS400 mode.

However,in the current implementation, the timing is set to HS400 (a
DDR mode) before adjusting the clock. This causes the clock to double
prematurely to 104MHz during the transition phase, violating the
specification and potentially resulting in CRC errors or CMD timeouts.

This change ensures that clock doubling is avoided during intermediate
transitions and is applied only when the card requires a 200MHz clock
for HS400 operation.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 Changes from v1:
 As per Bjorn Andersson's comment :
 - Pass "timing" as an argument to msm_set_clock_rate_for_bus_mode(), and
 then pass host, clock, and timing to msm_get_clock_mult_for_bus_mode() to
 align with the original intent of the prototype.
---
 drivers/mmc/host/sdhci-msm.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4e5edbf2fc9b..3b85233131b3 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -344,41 +344,43 @@ static void sdhci_msm_v5_variant_writel_relaxed(u32 val,
 	writel_relaxed(val, host->ioaddr + offset);
 }
 
-static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host)
+static unsigned int msm_get_clock_mult_for_bus_mode(struct sdhci_host *host,
+						    unsigned int clock,
+						    unsigned int timing)
 {
-	struct mmc_ios ios = host->mmc->ios;
 	/*
 	 * The SDHC requires internal clock frequency to be double the
 	 * actual clock that will be set for DDR mode. The controller
 	 * uses the faster clock(100/400MHz) for some of its parts and
 	 * send the actual required clock (50/200MHz) to the card.
 	 */
-	if (ios.timing == MMC_TIMING_UHS_DDR50 ||
-	    ios.timing == MMC_TIMING_MMC_DDR52 ||
-	    ios.timing == MMC_TIMING_MMC_HS400 ||
+	if (timing == MMC_TIMING_UHS_DDR50 ||
+	    timing == MMC_TIMING_MMC_DDR52 ||
+	    (timing == MMC_TIMING_MMC_HS400 &&
+	    clock == MMC_HS200_MAX_DTR) ||
 	    host->flags & SDHCI_HS400_TUNING)
 		return 2;
 	return 1;
 }
 
 static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
-					    unsigned int clock)
+					    unsigned int clock,
+					    unsigned int timing)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
-	struct mmc_ios curr_ios = host->mmc->ios;
 	struct clk *core_clk = msm_host->bulk_clks[0].clk;
 	unsigned long achieved_rate;
 	unsigned int desired_rate;
 	unsigned int mult;
 	int rc;
 
-	mult = msm_get_clock_mult_for_bus_mode(host);
+	mult = msm_get_clock_mult_for_bus_mode(host, clock, timing);
 	desired_rate = clock * mult;
 	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
-		       mmc_hostname(host->mmc), desired_rate, curr_ios.timing);
+		       mmc_hostname(host->mmc), desired_rate, timing);
 		return;
 	}
 
@@ -397,7 +399,7 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 	msm_host->clk_rate = desired_rate;
 
 	pr_debug("%s: Setting clock at rate %lu at timing %d\n",
-		 mmc_hostname(host->mmc), achieved_rate, curr_ios.timing);
+		 mmc_hostname(host->mmc), achieved_rate, timing);
 }
 
 /* Platform specific tuning */
@@ -1239,7 +1241,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	 */
 	if (host->flags & SDHCI_HS400_TUNING) {
 		sdhci_msm_hc_select_mode(host);
-		msm_set_clock_rate_for_bus_mode(host, ios.clock);
+		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
 		host->flags &= ~SDHCI_HS400_TUNING;
 	}
 
@@ -1864,6 +1866,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_ios ios = host->mmc->ios;
 
 	if (!clock) {
 		host->mmc->actual_clock = msm_host->clk_rate = 0;
@@ -1872,7 +1875,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	sdhci_msm_hc_select_mode(host);
 
-	msm_set_clock_rate_for_bus_mode(host, clock);
+	msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
 out:
 	__sdhci_msm_set_clock(host, clock);
 }
-- 
2.34.1


