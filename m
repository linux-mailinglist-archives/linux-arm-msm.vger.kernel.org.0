Return-Path: <linux-arm-msm+bounces-80017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F4C28C0E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 09:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B66F3188A529
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 08:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56F52652A4;
	Sun,  2 Nov 2025 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBmF2twv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPrUTWeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37472609FD
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762071537; cv=none; b=bWYtI1gMXT4PPZXxBOyNYBq1nouhWmG/OsOmYjZaNhvn1cVuf5aOYWMnPs8gNs0wv1uosHr9s48Fm2yTiwsYSpNHx/FxY3fsZDAbBJyKsHS5UAbfRU+ElnMoAz5MGwYw7eabh1iw67YpdZRoaFMhNrszlJ+s1o2ymNtFixb5e4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762071537; c=relaxed/simple;
	bh=dE/7+dw3Er8R4qn39k6VZBBhrlp2/woQE3ytOxG29vI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EZu7hH26a/nBgs8PA1ggqVYQTZLPHebIjh0+cUHFL2ChbpgTfxA3IXbTfyGv3b0HQ9GzOlJhF1ntLzV+KUXQqtu83/7QTNoPFSdLk3tESRsILAN3eS8O2laL1hpyMM2n9kRdfof0isdHUm5Iefzqh/Ewud0ZWzo1XRe5iAW4GqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBmF2twv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPrUTWeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A25TdJZ3494510
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 08:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdCcsI2CPS0397pCJbVMqV1traodFNLcOl/fqbA8tbo=; b=oBmF2twvlbiG9ZmD
	+aAV1z8/fdObLiClSTTRXkh8fWxLkNA1q41sjabm9EcdtDp20Jg2qyz0K+L+ku7r
	8rMEJXNTHaVEZGZeLS8UHytM0W4mdiXf1McJlUankn93EQTSy8G0V2fft9WRfaQU
	YMG0iPmSpL5plkhHF5wbU3EPyozvI+zx29kgQ0Wl2cxYe5WoYsv+mWAOsMODhfcX
	CfxJvIAL1RiANX7eGep0PILbBOEc22bpfE1fDUN6+ManKyAwpTCfUTYNcWslPM/+
	bLgdyGv2kQiX21zcIPzUJuZbEToZTsIjDfjrNrvMaNKV1v3c6nYY+QAuU8WAOSZh
	hUqG+A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bg9hr9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 08:18:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7a153ba0009so7862341b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762071535; x=1762676335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdCcsI2CPS0397pCJbVMqV1traodFNLcOl/fqbA8tbo=;
        b=hPrUTWeXEnn6URo6f7Ld1WxFKOx2qvJGbGtESPf4gRMwvkTC8YI6OOe4/ptNzjXJOU
         n6ViyY2eOKInuNZVMR4wkBPpll9tctSrCTjSK0ZInlqD7r+P1UO1K8dEpVFthvzxcfRA
         lf4JlFDWOtNeh0LU0gejXZF2bqljEY+EN9XDjYsGcq76e0ZTMGNnWk+3Vu7Lj8YIDQPS
         DXw1Sc5QKKYyBtSps/rIQ6sFxqj6qJL7t/PcLXxTGqvBATf0z/5DqhiPZRagal6IdUSu
         KZtSuOjQsQ9i/zASzifsPVIaSdgLp3+NJqc7D4+9w/OblwfeJeCQBMQFNoQOnMU61axi
         dptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762071535; x=1762676335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdCcsI2CPS0397pCJbVMqV1traodFNLcOl/fqbA8tbo=;
        b=JxlaicplGVweVaTtTyACbzgsHzuv5eaNoKmRChbRSbcSzSjilbkzDaa3FzI8qsoJHz
         R6FCu7HlPn2PGrywiBh7nJmjMjtp4xDJ+T7nUq34KFB14kk04NagMMHedZ2zzp0Bq7wu
         U/WasLWtdqiZ0R6FI52CmrtqMyQ8K2rRB0pt9n6KjlXWrmFUtk4uFYvaCXgP8VT7op/R
         nv62wzmJv6kgbMkJ9vZ3pJ2RutiUGFecIHhjEyZ7DyykVcLrrxI9qzWEhUD/9t7xdQCl
         WBeSkJ3I3gYo4QFW0Tv2vheh0qy8mMDWvIinkj4ZVaBp4cwBTxBwhwyxb9BDo67V31Ru
         aGVQ==
X-Gm-Message-State: AOJu0YwiAGTB0Mi+pSrcSVygvoCNaxbZ4SskzruAfB8oN8xeKrF5WwoQ
	F0kv0Qz686TogFzK8Ux5Uifd4wl7z5qFQd46THF3+/B4LmLqma7hBquqp0H/TCWxSF9wvsbh/s/
	R9dSHPxmTW/TKlXmQTAMgN4r5xV8A5N3s61B006zeI0bvjYhQALd3QLGbholwuQ0Usc84
X-Gm-Gg: ASbGncts+hQXe6Fx6YvRJoHxiWypJ0BUgUPmSN9/4XE1tF3AR4UKX8NEU8qpqC8DuCr
	2KTk9rLdMbJ0mbXk+7x6U83DnPIhIHQjLoFhhHr09WdbU5giUq7dz3p7cqisHv1+o74ZDpjwgGR
	MxwY1mUzLNMrSgq8XvYBtkjyLLzBv2sOnytESVP/H8FPVCpfa6ml3k1RUXy39Kj7dB/zfUaalEV
	p9qVz1wJryCuZFfyxIFiKE5hPXFIe9qx158GC71izx2Vp819V1vURf5OtkuO8sIiPSXd54DN8d8
	33WfBGGUQDb5okn3RJdRJ8efg8bk9YFrdJvgb//+vka1UZ9A/I/EbPyEoaTO0IfMF1iA4/Uqfsa
	/T2uh6Z7P1QA+vMTlrZqjhK3LGbwB11KmfMc=
X-Received: by 2002:a05:6a20:958e:b0:33e:4b14:7e9 with SMTP id adf61e73a8af0-348cab83a05mr11777110637.22.1762071534636;
        Sun, 02 Nov 2025 01:18:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELZ+PaUc/BA+TJRLHidV5aGCH2A1SkPA2iFvR9zUfPGK9v5h6JWkrjj3eeVi2slihFde4ogw==
X-Received: by 2002:a05:6a20:958e:b0:33e:4b14:7e9 with SMTP id adf61e73a8af0-348cab83a05mr11777089637.22.1762071534102;
        Sun, 02 Nov 2025 01:18:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm7440630b3a.8.2025.11.02.01.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:18:53 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 13:48:46 +0530
Subject: [PATCH v8 2/3] firmware: qcom_scm: Support multiple waitq contexts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251102-multi_waitq_scm-v8-2-d71ee7b93b62@oss.qualcomm.com>
References: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
In-Reply-To: <20251102-multi_waitq_scm-v8-0-d71ee7b93b62@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762071526; l=5590;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=hsHXSLDENegTI86WeVmDzO+QWVl4rGkbkjSgNsgxsCE=;
 b=1J0CW0LKjtQp8BD072tZiEuBec79rmQnAl0tskOlerpKEyCI3T5NhzDCOQ4DKMLcV/NM4K6e+
 lovDRX7L+xFC3smTG1XYTb10dO93cfYMziRFonQ0VEC8Wd0+vT7KYvO
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: u4FBu2cYsnbLTX87BUJZfVegL66RXnmu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDA3NiBTYWx0ZWRfX6ImggaI54xql
 8ts1xVTk5jULHJLceP4ESGz3Hr3w/eLjnQ52pKj4mxfMIzDkx6nkCIf2ABRy/kNQKq9bQGAjDhD
 2s6IgMlW5DG1K/9D9YwJQVXvZbsRksiukCyQY6fzZZcKQzHvwhstmT88nV2kAjZdlT1uQSdbWW8
 vzWPk043u1bOUSg+OdXwhx7BQUSc77TTJa/DtgzdrdDZhsx9u87FYS7Y1i+K1YDLeRO2rVuiUmX
 psVOhyErpbgM3EkXZjc0e2cyRnV4XM+SjxaXwXsglazfV3854tjV/u8t/sGkZygf+p0HvtJVQZO
 xiy2xLoSOswdqSeineLE+KT4NEwrpc8Xb+NIFX6SrmkRHTtEiop4IMOKqEljFbZ2NPKYFJwOgwz
 9zJ5Tzyq4kvnJt5xcU1BdHRJghI/kQ==
X-Proofpoint-GUID: u4FBu2cYsnbLTX87BUJZfVegL66RXnmu
X-Authority-Analysis: v=2.4 cv=TaKbdBQh c=1 sm=1 tr=0 ts=690713ef cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QwukUx79tW4PgYOutgUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020076

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

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 75 ++++++++++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 28979f95e51fbee94b84c1570a4d88a76f72db4e..0b6efa7c2bdc25a3ba152c25d5451d1154779ddd 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -47,7 +47,7 @@ struct qcom_scm {
 	struct clk *iface_clk;
 	struct clk *bus_clk;
 	struct icc_path *path;
-	struct completion waitq_comp;
+	struct completion *waitq;
 	struct reset_controller_dev reset;
 
 	/* control access to the interconnect path */
@@ -57,6 +57,7 @@ struct qcom_scm {
 	u64 dload_mode_addr;
 
 	struct qcom_tzmem_pool *mempool;
+	unsigned int wq_cnt;
 };
 
 struct qcom_scm_current_perm_info {
@@ -2247,6 +2248,25 @@ static int qcom_scm_fill_irq_fwspec_params(struct irq_fwspec *fwspec, u32 virq)
 	return 0;
 }
 
+static int qcom_scm_query_waitq_count(struct qcom_scm *scm)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_WAITQ,
+		.cmd = QCOM_SCM_WAITQ_GET_INFO,
+		.owner = ARM_SMCCC_OWNER_SIP
+	};
+	struct qcom_scm_res res;
+
+	ret = qcom_scm_call_atomic(scm->dev, &desc, &res);
+	if (ret) {
+		dev_info(scm->dev, "Multi-waitqueue support unavailable\n");
+		return ret;
+	}
+
+	return res.result[0] & GENMASK(7, 0);
+}
+
 static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 {
 	int ret;
@@ -2280,42 +2300,40 @@ static int qcom_scm_get_waitq_irq(struct qcom_scm *scm)
 	return ret;
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
+	wq = &__scm->waitq[wq_ctx];
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
@@ -2391,6 +2409,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	struct qcom_tzmem_pool_config pool_config;
 	struct qcom_scm *scm;
 	int irq, ret;
+	int i;
 
 	scm = devm_kzalloc(&pdev->dev, sizeof(*scm), GFP_KERNEL);
 	if (!scm)
@@ -2401,7 +2420,19 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	init_completion(&scm->waitq_comp);
+	ret = qcom_scm_query_waitq_count(scm);
+	if (ret <= 0)
+		scm->wq_cnt = 1;
+	else
+		scm->wq_cnt = ret;
+
+	scm->waitq = devm_kcalloc(&pdev->dev, scm->wq_cnt, sizeof(*scm->waitq), GFP_KERNEL);
+	if (!scm->waitq)
+		return -ENOMEM;
+
+	for (i = 0; i < scm->wq_cnt; i++)
+		init_completion(&scm->waitq[i]);
+
 	mutex_init(&scm->scm_bw_lock);
 
 	scm->path = devm_of_icc_get(&pdev->dev, NULL);

-- 
2.34.1


