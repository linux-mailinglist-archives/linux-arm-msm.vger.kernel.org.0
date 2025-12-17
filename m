Return-Path: <linux-arm-msm+bounces-85533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 81065CC83D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E3143085BCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5383A4ED7;
	Wed, 17 Dec 2025 14:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m5MZO0zN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aiBEhhCA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9B33A4EBB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982093; cv=none; b=dWkHZeeDnVU55/T90AZ71YW6DjPaJPrVAbn1CVZHEwYE7iQX4unO6kKtnJz2UcFxN3TN58AuuvaF1Ds3nuzH1ME3xQ3XRp3VJ84cWYyv3zlc4IFBb32rPiXXlcKm2B7LmymZlD3QZIM3W34Jvf520CQU647g0qfwug739j+6Flw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982093; c=relaxed/simple;
	bh=cL7P33opRlxB/ZxwhF3Ae5/6HQ05AN//2JfQpo1rxjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b1p3VVYvlehLnCuBl8C/WPjZHLD2vynSACgDmrvBYyvo3EN5RUUOfSCy2jgMnMSX+R77rgTmMs4xdu/sxrrYQ8+ZJ/oV3PZXFFlwvrtAiKX7JJY4YN/HSM5hUh5IzJz2EncndRnfewA6roiuD8eNWR8ZOM4Yc8SmJYldUJdTvCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m5MZO0zN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aiBEhhCA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL4Ys331028
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcxfjHNUUxoNrhYvvMfARevUh/fq1nrXear68fw0qdA=; b=m5MZO0zNR5b5g6j7
	ok7gKiKcBDMB8DA1rxNtJyOEoEoZWY+OD15rc5NyvnnR3fFBG0WgqaDj2elnxe3n
	xM2rrfo/wpH5Ad2V1XlcXJbc7zmrGlzotrfgKoraTRAY8Es2ttKroFpvS+lk0p80
	FqhlOBMlSIlLdpuCq6tfQQGQeM42X0ZqoPcqXQg2/Nv2VMs5KGCTjT7aE9rPAhLN
	GFy8qle7Rf0TmHgfd71qRofJpAgvLap2Te3wmAfBDxxkMPaUkbanUhBkXkOAik4Z
	0S2a4teu0Ldw7yjxnqcK3bx4YvqV+iyWChSqw9ATiyhNDBpMgF/IJd/66a3qHRmx
	VkRDzg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e0tgt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c904a1168so6736375a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765982086; x=1766586886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcxfjHNUUxoNrhYvvMfARevUh/fq1nrXear68fw0qdA=;
        b=aiBEhhCAoMlRUqcbxro40NrL4sbxZTbTCeG7uaHNw4pSq79P3xeOYdh+NjXX9Ay2aa
         Avq0LtIYL0+370kPcTtehoLCk3YmsiKk5t3ZUGLo5UIpz0NfRJk96w+yQFeGBlaT05XA
         qQooIkaSLd/1lqgHhUG5Ikt6YpS3pSadH74OwG6ZhvvtFeOQMYn+r64OIW8T9HCbl5vQ
         5dsXZHwTiVKoa12Dk2oE2E7zIjBNhFLWNnBOf6cLIW5sWJqb4826ya1td7ND1jHQ9m1e
         TFZuRIDXQqoR4lEWtEzwecoQjUsvV4ZO1UyGBrZYChYe/wPD9ZCYpvb7w9UlHi+45yFD
         S5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765982086; x=1766586886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gcxfjHNUUxoNrhYvvMfARevUh/fq1nrXear68fw0qdA=;
        b=c57UGy7Z+CarUmuD6fLs1KFw4w/sHQX10NKBgLdGjlxQl/978xfNA4BtriATzOgI+v
         fHtrgq2RFUS42lEOK1Ffp05Tybh6I67RNmZimrJDv+Wb+s6wpBorvZAy4CIMLj9j7o83
         kyMM+lCkjq2dIAsj25S8ezM6JtkesliW0ZL69ru6XRY3xkhOIJ2zGmOxcPeNME3eUJoi
         lBs6uuGIkjzlfRGcIXmtqgf2XW+re+lxToLmYqmQ+XsuV4C+mNJFZKyQslK72S+cvAb+
         Thqg0Xyaiq4kUx329Nxo2bmS3lB6/k1kQ7EbgffbfL8qCjQ8oZN/G/EkZYZlEqqLESGs
         oMDw==
X-Forwarded-Encrypted: i=1; AJvYcCV5HF77j/pKZviUf1DeOWT3kcKdYWt653Sqhoo/FSeh88YdBi8yvKpZ1nmELPXV7UE2utSxZBSlefJE+NV6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw02g/22ftYMXZkCDGEfj2Ia0dYul9nImnzyFR1nqmI2BdRsvp6
	mPliq+InmYfTnXyMITmOb+yTSAgO3nBIYvnlUaUeW706Ne7YctPNH3kWGDvitOkwfHMiWnaciU5
	21x/XVI00U2y2kO0HKUlbbZJyjUBuneJHZYLptOiPVD+qEwkd47WFB5RVZ+bHGah2IpFXtfg/by
	MI
X-Gm-Gg: AY/fxX69OiWfAo9eEn6QmHmnvcF9uN/j85Xx3GyPJMiGoB0mAWzjF9O53SW2n4RZqLM
	6GgCiQey5pWTtxINu2mFW2nYuvnzz6vOgCbLBoxY+8mqdRxIBZuePi9yzm56pRCnb1g16PDbe35
	KpgyLGHZCyL8NtI/EX4alf4pcD0e6ymyyLLSeG3rW+wFxynRFDwcOiinMjeP4Yf67uSRHSry2kd
	BqbkH77UuBD/XveoM3tdfqO7a5KDRsnj3v2w6ppX1tU75s0n4p1k7aFtPITyDxQJGjFAZkLZoj2
	qiYNpgOFzcdzkdK7gr6Ph4xCHDIVH9D8d0zGPly4C61/EhVzo+QWglF2iMDr1WAFkDWtoQOqgNu
	7ji/wK8kHRIJD4mlzOxM/WBRHgJoct8Ry8cG2TjJjHTwomg==
X-Received: by 2002:a17:90b:270a:b0:341:abdc:8ea2 with SMTP id 98e67ed59e1d1-34abd791365mr18920762a91.37.1765982085756;
        Wed, 17 Dec 2025 06:34:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHygA2R83m/yCLclat0SEZEzQGoaqqJ3KkOJOg33OyVvOD6XJ+2pHa5BnFQY9CM4YPoXi5zRg==
X-Received: by 2002:a17:90b:270a:b0:341:abdc:8ea2 with SMTP id 98e67ed59e1d1-34abd791365mr18920742a91.37.1765982085245;
        Wed, 17 Dec 2025 06:34:45 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cfce5eb5csm2615529a91.0.2025.12.17.06.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:34:44 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 20:04:20 +0530
Subject: [PATCH v11 2/3] firmware: qcom_scm: Support multiple waitq
 contexts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-multi_waitq_scm-v11-2-f21e50e792b8@oss.qualcomm.com>
References: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
In-Reply-To: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765982076; l=6294;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=7v/rX34Bq7zFiwLV1H6k91m5mrXvGfR0yHtINoULT/U=;
 b=NbOYO+awk7kMu1EDBlBfCNVZMNAK2AiR3rh+WlMDtcDSA84Ypib5paZiNdnDCSXR0rWHGHKVH
 EnW57ZVtb5+C/LFRZoIr3NSFhjZMVFEZPs3cBOlL2Y7TWjwQkk2kfoE
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMiBTYWx0ZWRfX80D0Z9RwtF+s
 d431pz2Fjwdre+UAgyeJ18t3Mu2oUIajdNCnd671QHpisTh+b1TtYFV5xscea8nhoxUjXcmsSss
 A9+MGszGwjz3py3ZvS3Lr3FTmEuAVEyLTE243AYY18e8TfDYzjxlr7ine8r53fCuwoX2/qurjwH
 amnV6QG5jVv/9tlGJUPAYnfMWvS6I/zfxMBN+AqeoC7XL38zJ8MSgAik5RYeKb8Wo635zk2/qOA
 Bu1M+A/nD7aWIV11PZFbgnuH3rkgAPgDFe6xShuPr/S1gfcdnK4anljgVMczHZCrJlKHf6n4GR7
 Togm+LHzAvVsWmV8ZwP07y63SB5FAti8bXGUhzO5oPYcnavYyC7FP/7MR+vSHihZoBHCAKbbsi5
 k6r9Bvs0sw0RgwMxIQZnwwQhC8SldA==
X-Proofpoint-GUID: H8YKUfIuTnk1RR7lOTKAJOy8dXw7sXZc
X-Proofpoint-ORIG-GUID: H8YKUfIuTnk1RR7lOTKAJOy8dXw7sXZc
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942bf86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=5olPtX_GuO7v3P1VzgMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170112

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

Currently, only a single waitqueue context exists in the driver.
Multi-waitqueue mechanism is added in firmware to support the case,
when multiple VMs make SMC calls or single VM making multiple calls on
same CPU. Enhance the driver to support multiple waitqueue when
support is present in the firmware.

When VMs make a SMC call, firmware allocates a waitqueue context,
assuming the SMC call to be a blocking call. The SMC calls that cannot
acquire resources, while execution in firmware, are returned to sleep
in the calling VM. When the resource becomes available in the
firmware, the VM gets notified to wake the sleeping thread and resume
SMC call. The current qcom_scm driver supports single waitqueue as the
old firmwares support only single waitqueue with waitqueue id zero.
Multi-waitqueue mechanism is added in firmware starting SM8650 to
support the case when multiple VMs make SMC calls or single VM making
multiple calls on same CPU. To enable this support in qcom_scm driver,
add support for handling multiple waitqueues. For instance, SM8650
firmware can allocate two such waitq contexts, so the driver needs to
implement two waitqueue contexts. For a generalized approach, the
number of supported waitqueues can be queried from the firmware using
a SMC call.

Introduce qcom_scm_query_waitq_count to get the number of waitqueue
contexts supported by the firmware and allocate “N” unique waitqueue
contexts with a dynamic sized array where each unique wq_ctx is
associated with a struct completion variable for easy lookup. Older
targets which support only a single waitqueue, may return an error for
qcom_scm_query_waitq_count, set the wq_cnt to one for such failures.

Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 72 ++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f45dbe5f49ed65f4fffd0748c2e3c704dbb9ee0a..e16dbf18f731be9b0098dd683f478c8c8fdeaf20 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -48,7 +48,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq_comps;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -58,6 +58,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -137,6 +138,8 @@ static const u8 qcom_scm_cpu_warm_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
 #define QCOM_DLOAD_MINIDUMP	2
 #define QCOM_DLOAD_BOTHDUMP	3
 
+#define QCOM_SCM_DEFAULT_WAITQ_COUNT 1
+
 static const char * const qcom_scm_convention_names[] = {
 	[SMC_CONVENTION_UNKNOWN] = "unknown",
 	[SMC_CONVENTION_ARM_32] = "smc arm 32",
@@ -2234,6 +2237,23 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 hwirq)
 	return 0;
 }
 
+static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+	int ret;
+
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret)
+		return ret;
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 {
 	struct qcom_scm_desc desc = {
@@ -2265,42 +2285,40 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 	return irq_create_fwspec_mapping(&fwspec);
 }
 
-static int qcom_scm_assert_valid_wq_ctx(u32 wq_ctx)
+static struct completion *qcom_scm_get_completion(u32 wq_ctx)
 {
-	/* FW currently only supports a single wq_ctx (zero).
-	 * TODO: Update this logic to include dynamic allocation and lookup of
-	 * completion structs when FW supports more wq_ctx values.
-	 */
-	if (wq_ctx != 0) {
-		dev_err(__scm->dev, "Firmware unexpectedly passed non-zero wq_ctx\n");
-		return -EINVAL;
-	}
+	struct completion *wq;
 
-	return 0;
+	if (WARN_ON_ONCE(wq_ctx >= __scm->wq_cnt))
+		return ERR_PTR(-EINVAL);
+
+	wq = &__scm->waitq_comps[wq_ctx];
+
+	return wq;
 }
 
 int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	wait_for_completion(&__scm->waitq_comp);
+	wait_for_completion(wq);
 
 	return 0;
 }
 
 static int qcom_scm_waitq_wakeup(unsigned int wq_ctx)
 {
-	int ret;
+	struct completion *wq;
 
-	ret = qcom_scm_assert_valid_wq_ctx(wq_ctx);
-	if (ret)
-		return ret;
+	wq = qcom_scm_get_completion(wq_ctx);
+	if (IS_ERR(wq))
+		return PTR_ERR(wq);
 
-	complete(&__scm->waitq_comp);
+	complete(wq);
 
 	return 0;
 }
@@ -2376,6 +2394,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2386,7 +2405,6 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);
@@ -2438,6 +2456,16 @@ static int qcom_scm_probe(struct platform_device *pdev)
 		return dev_err_probe(scm->dev, PTR_ERR(scm->mempool),
 				     "Failed to create the SCM memory pool\n");
 
+	ret = qcom_scm_query_waitq_count(scm);
+	scm->wq_cnt = ret < 0 ? QCOM_SCM_DEFAULT_WAITQ_COUNT : ret;
+	scm->waitq_comps = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq_comps),
+					GFP_KERNEL);
+	if (!scm->waitq_comps)
+		return -ENOMEM;
+
+	for (i = 0; i < scm->wq_cnt; i++)
+		init_completion(&scm->waitq_comps[i]);
+
 	irq = qcom_scm_get_waitq_irq(scm);
 	if (irq < 0)
 		irq = platform_get_irq_optional(pdev, 0);

-- 
2.34.1


