Return-Path: <linux-arm-msm+bounces-93357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCphAWLalmlJpgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:39:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375215D6C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D173300B29D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 09:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2245E31AA96;
	Thu, 19 Feb 2026 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL0glHvV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5+TjTuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E28145FE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771493975; cv=none; b=EhOPVypmuSlREh8f75gwJ8jL0dm6Nd09GzdIFRpAGwZECPp/WPC9X6KwwW1vN1e4NZ2d2CCpJYt5A21JzKYCCTMopaOPK+4MTn7P507nVQ4mYwcGP73TlT2o/s3alqUoPWj0Kn+3P0mu7mqa1p5X3Wxp779u4FkVXzqSW2WuAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771493975; c=relaxed/simple;
	bh=kDMzpbJp7/rLqYwKGMaZIVc8pzd6JwXhACdjFivVaJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmIytZJyGg0ek2xjh+kOtbJQPe00OIhZRzvHX6d7+NJM/jM7WUtVs0pxK5ZAZk/zXQJWy0kabwebc50+xOQRWv81LlQ0h6r7mz7Amb+ZJd0exP7JaO1t7k4UWFrTwaVfcK2UpxccF1aSorXcJoPnS/Qoznz3lMdVdu/TIXuoIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL0glHvV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5+TjTuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J2anoG421595
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eJ7q7P1YKR2cir05Q7NmQQK/JszGCthoOd76hIYXMrc=; b=mL0glHvV0k0mRFIw
	r0v9z3tV6hXob4Q0TdXzmSjOxpg0/4T4q9YgbSd+Zl2EAtmzuUHL712h2KKEQVfA
	YZxuf+j2hogkvtJ8lnEdgLeCFSXy4C4tH4jfjz71Zt9hmtJ0+9nCjd+XB/5r2kTv
	cmNYu2NtdycRMpQLXtxHqA7bLLHXB08dplb6sqUwC5ukhaat15JYdMEI2tFSGzxw
	bZH1H0g9XH3advhmjvOzABlNjhbfdnW03pzN8tE8+GLMVe+i9x4qpU57JuNqbAi5
	d53SjF5RBmgcvh59+odb6gCRTjERXrH2rUiH9Ber/IJCjrUKAg3/zoPvqKeX3xSX
	oz55ZQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e3ya6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 09:39:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824bf5fe8cbso387440b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 01:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771493972; x=1772098772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJ7q7P1YKR2cir05Q7NmQQK/JszGCthoOd76hIYXMrc=;
        b=E5+TjTuESiuqvHMULuI05yCNM5N53u60NLdB3W82KIctcRd4IFWFUalg+jS+IJGpqq
         t4K0bTWstqkdFZRt9qlHyb3687SQ7ENbWEhPbPLXTJyQYwgbNsvQKikMGI5Uq+EhfuCv
         hSOSBvdVb4rbU5wHKCxcJqL/63TOBjxubqyPNBtaQOH/k4MG79QwfSwu0c9cn3kjJyUJ
         qTXY8TzUaBPjlbCCndzlk4vkA2U8UpousiWjaj3BiJFZJdVMnS2DdLO2JKnTcjZjT9F2
         WzMh0AtJLOE8cF9dyrS/cJShk/Q1lp7UvrZXMCUoY6RtZoKRXQyhMUOU4d+xY3SfkThB
         RkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771493972; x=1772098772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJ7q7P1YKR2cir05Q7NmQQK/JszGCthoOd76hIYXMrc=;
        b=DdEPQLrBe3CflMFCeEQ68TXz/lXT0ndd634FcDxQkCW4GoV3mDxqm5OE4RV/WHW7Bj
         gV5xWQYYPBEfMdHZwV8fc8Ytn1PZfkWnDXRpAUMVEMPkjVhYEATZTr5D8itsEPFX8Fhe
         jGzM/pkBZ41fRVfAX5huf2ugO0wsKWMpm2wWSEeA0t6EDt6GEWrHfgR2NGK6kA+ZfNHW
         2WzvlmAS9hE9e0bdBAGvGdNQOwIqx+UyFBL7ISy1ndQ0y0YaGAVjwv58YBkA6j5naXyy
         QiTlWuJrC9QenqWA5LpZjnwmMY/DoaSVbHVxkI1yiD5Ob4KiB4429S5x7C7foG41D8QZ
         R9BQ==
X-Gm-Message-State: AOJu0YyW8jaAIsz8Z2ZaFqY2cs2S7Es4wzL1zKBu05l2uq0GwKxLMNGC
	xhXjXKu5CNJxSzKo87n6Fn+hD4N5Yggs6u9gzU9dxydYfzds+qNBEZIk5Fw+oCjrTLXyI4nJoPC
	ACSNxX8U7tMx5at5CGYgLUs4UOK1xha5/5/fwwm0tQgenYVIb7vHnoyRAQK+GrZEJPuLo
X-Gm-Gg: AZuq6aILIrlPi9agkH9yozNbtZFibvgKBEdV2hPjyL8Jh/M8HU09jLLSaR/E9+XwzC8
	/es+8pTqjBfI4i41ialtGkdA6GfsJDdEvlVx/AdviqWdpBxejp9gL75PBsulilfH5Dw/4/TFeGV
	Wz1lU66P3vBIBmViFBiOGutB9gfKN+9P0Qy8ZJNBp1ZXhAgR1ZNNmt6e5C5KvhnUq2TlYndw+y8
	WJV0fFHtMQjChMqn0kgLddPFuk488aR4Z6UfEGXkHrAbTByZdBN2/cLuly4ss1AQ62EI9D0jmO/
	J5PZe4QpIlTpNTx421b9gSIC0MqeuKwYC3i8CUYn6+LteeJWO+loag3Lp0s+ktQQicvWd3ZqOiI
	4T4i29ZvFJXTBPRQ5p6RJjtunJDTvv9M4zd9SEi2SS78NRjCIdOhaPMR/8Aw=
X-Received: by 2002:a05:6a00:14cd:b0:81f:4294:6080 with SMTP id d2e1a72fcca58-825274bb7eamr5025423b3a.20.1771493971755;
        Thu, 19 Feb 2026 01:39:31 -0800 (PST)
X-Received: by 2002:a05:6a00:14cd:b0:81f:4294:6080 with SMTP id d2e1a72fcca58-825274bb7eamr5025404b3a.20.1771493971216;
        Thu, 19 Feb 2026 01:39:31 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2ac83sm17710250b3a.12.2026.02.19.01.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:39:30 -0800 (PST)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 15:09:14 +0530
Subject: [PATCH v6 2/4] soc: qcom: ice: Add OPP-based clock scaling support
 for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-enable-ufs-ice-clock-scaling-v6-2-0c5245117d45@oss.qualcomm.com>
References: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
In-Reply-To: <20260219-enable-ufs-ice-clock-scaling-v6-0-0c5245117d45@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996da54 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=mjMY47ajJ_YgJ0Xw87EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA4NyBTYWx0ZWRfX2GJGRshAgP7B
 1MwqaGuGb8lhlAI/PaUmenhm8mQMIV+2a1m6Rtr8WZOas8wIxXntsENohoiMOMMi9xkYbQy9Y2q
 HeeyQPlU4qTtched15OvQjgsDo49iUWA2fq7sgak3rbCwg2EDEBRoa8fQcdevnPV7oJ7oQjI50/
 aco40cUYw4loxjdm2e8/f4JsRt6ov+zQCYNqxXuvWZ3BT0COFQ8ZdqEKnPX53rSecGw/4zi5iF/
 kdAB+/MG94xaE3WSt1b3XwxGm76/5HDqjf1ZJZDfgvUcuUpf7pSVLqwC3vD9RCrlR+xzPKsjHMI
 ZCvxG8bCUmzhdEZ7rOa1TPXcSUhulUTp1pLKOqhDn+TezQbo6X4tV6ZGcsBoYEQ9qesoVJ4IeGk
 /829LtIFrP3NQpsahTHzO4EB+AGKZs3PkFNZpgdGBHMoaXfK9D25uqFk7Y3zLXYofezJhZTlver
 MW5Da4+G05ZBpC4JRcQ==
X-Proofpoint-GUID: pMyPmlZwIM4ddU8HP4RAypv8vBRnIi-p
X-Proofpoint-ORIG-GUID: pMyPmlZwIM4ddU8HP4RAypv8vBRnIi-p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93357-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7375215D6C0
X-Rspamd-Action: no action

Register optional operation-points-v2 table for ICE device
during device probe.

Introduce clock scaling API qcom_ice_scale_clk which scale ICE
core clock based on the target frequency provided and if a valid
OPP-table is registered. Use flags (if provided) to decide on
the rounding of the clock freq against OPP-table. Disable clock
scaling if OPP-table is not registered.

When an ICE-device specific OPP table is available, use the PM OPP
framework to manage frequency scaling and maintain proper power-domain
constraints.

Also, ensure to drop the votes in suspend to prevent power/thermal
retention. Subsequently restore the frequency in resume from
core_clk_freq which stores the last ICE core clock operating frequency.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++--
 include/soc/qcom/ice.h |  5 +++
 2 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cadd21d6f96eb1799963a13db4b2b72..1372dc4a4a4d0df982ea3a174df8779a37ce07c6 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -111,6 +112,8 @@ struct qcom_ice {
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
+	unsigned long core_clk_freq;
+	bool has_opp;
 };
 
 static bool qcom_ice_check_supported(struct qcom_ice *ice)
@@ -310,12 +313,17 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
+	/* Restore the ICE core clk freq */
+	if (ice->has_opp && ice->core_clk_freq)
+		dev_pm_opp_set_rate(ice->dev, ice->core_clk_freq);
+
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
 		dev_err(dev, "failed to enable core clock (%d)\n",
 			err);
 		return err;
 	}
+
 	qcom_ice_hwkm_init(ice);
 	return qcom_ice_wait_bist_status(ice);
 }
@@ -324,6 +332,11 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
 	clk_disable_unprepare(ice->core_clk);
+
+	/* Drop the clock votes while suspend */
+	if (ice->has_opp)
+		dev_pm_opp_set_rate(ice->dev, 0);
+
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -549,10 +562,59 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 }
 EXPORT_SYMBOL_GPL(qcom_ice_import_key);
 
+/**
+ * qcom_ice_scale_clk() - Scale ICE clock for DVFS-aware operations
+ * @ice: ICE driver data
+ * @target_freq: requested frequency in Hz
+ * @flags: Rounding policy (ICE_CLOCK_ROUND_*)
+ *
+ * Selects an OPP frequency based on @target_freq and the rounding mode in
+ * @flags, then programs it using dev_pm_opp_set_rate(), including any
+ * voltage or power-domain transitions handled by the OPP framework.
+ * Updates ice->core_clk_freq on success.
+ *
+ * Return: 0 on success; -EOPNOTSUPP if no OPP table; -EINVAL in-case of
+ *         incorrect flags; or error from dev_pm_opp_set_rate()/OPP lookup.
+ */
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       unsigned int flags)
+{
+	unsigned long ice_freq = target_freq;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	if (!ice->has_opp)
+		return -EOPNOTSUPP;
+
+	switch (flags) {
+	case ICE_CLOCK_ROUND_CEIL:
+		opp = dev_pm_opp_find_freq_ceil(ice->dev, &ice_freq);
+		break;
+	case ICE_CLOCK_ROUND_FLOOR:
+		opp = dev_pm_opp_find_freq_floor(ice->dev, &ice_freq);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	dev_pm_opp_put(opp);
+
+	ret = dev_pm_opp_set_rate(ice->dev, ice_freq);
+	if (!ret)
+		ice->core_clk_freq = ice_freq;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_ice_scale_clk);
+
 static struct qcom_ice *qcom_ice_create(struct device *dev,
-					void __iomem *base)
+					void __iomem *base,
+					bool is_legacy_binding)
 {
 	struct qcom_ice *engine;
+	int err;
 
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -584,6 +646,26 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	/*
+	 * Register the OPP table only when ICE is described as a standalone
+	 * device node. Older platforms place ICE inside the storage controller
+	 * node, so they don't need an OPP table here, as they are handled in
+	 * storage controller.
+	 */
+	if (!is_legacy_binding) {
+		/* OPP table is optional */
+		err = devm_pm_opp_of_add_table(dev);
+		if (err && err != -ENODEV) {
+			dev_err(dev, "Invalid OPP table in Device tree\n");
+			return ERR_PTR(err);
+		}
+		engine->has_opp = (err == 0);
+
+		if (!engine->has_opp)
+			dev_info(dev, "ICE OPP table is not registered\n");
+	}
+
+	engine->core_clk_freq = clk_get_rate(engine->core_clk);
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 
@@ -628,7 +710,7 @@ static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 			return ERR_CAST(base);
 
 		/* create ICE instance using consumer dev */
-		return qcom_ice_create(&pdev->dev, base);
+		return qcom_ice_create(&pdev->dev, base, true);
 	}
 
 	/*
@@ -725,7 +807,7 @@ static int qcom_ice_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 	}
 
-	engine = qcom_ice_create(&pdev->dev, base);
+	engine = qcom_ice_create(&pdev->dev, base, false);
 	if (IS_ERR(engine))
 		return PTR_ERR(engine);
 
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index 4bee553f0a59d86ec6ce20f7c7b4bce28a706415..962454b85ccd994aeeb373729d4b39a2e0b40069 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -9,6 +9,9 @@
 #include <linux/blk-crypto.h>
 #include <linux/types.h>
 
+#define ICE_CLOCK_ROUND_CEIL	BIT(1)
+#define ICE_CLOCK_ROUND_FLOOR	BIT(2)
+
 struct qcom_ice;
 
 int qcom_ice_enable(struct qcom_ice *ice);
@@ -30,5 +33,7 @@ int qcom_ice_import_key(struct qcom_ice *ice,
 			const u8 *raw_key, size_t raw_key_size,
 			u8 lt_key[BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE]);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
+int qcom_ice_scale_clk(struct qcom_ice *ice, unsigned long target_freq,
+		       unsigned int flags);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.34.1


