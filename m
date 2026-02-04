Return-Path: <linux-arm-msm+bounces-91821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL6UM3Z0g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:31:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF2EA466
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:31:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED5BF3042964
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEA242847F;
	Wed,  4 Feb 2026 16:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaI13mje";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+Lm+usY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC29428479
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770222571; cv=none; b=EzNIFHCP6+tyLm2NfnHWEfpZwinP2lTWDDkL41DjW+tpSHRa4Y7Rdai2copLWc/8/FK37g8B1FygK/B2RNxPyiS2GrSEKpmseApNG3JQTDGtQqVCRRonWiuz2BBHB4NMrVv02g1xU9Hjz8CWQc8rV0lzuBvj4cp4sHmrmv2122E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770222571; c=relaxed/simple;
	bh=L9DqGelcCFtxzG1Txqh7DNBFozIWof89KKJwfCaxV5o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mchp1BMaeWks41PEWWi/GFj86YSRZvQSwlmpQT7+qioNKlhNmEG+a8ETIulDpnJD1oDI2Q8YUMdcXNA3zpJxTQbCR+S5PiqMRzJf7HAqv3QYLumKd3uxCSF/CM3S9b0vpzeeMT9Q7ILxLPUa/rBL5XEM0L6igvnyijrCZPOcYBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaI13mje; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+Lm+usY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIZMv111382
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSKr5h6hAkT
	Nur0wrixEKU3taeueA9+e0fBqw6QqP7A=; b=TaI13mjerNyVFRTlupU1xSfWCaJ
	MGj5uJFLTFE7cRfGygZ47zlPdg4s61e9Zkx14yIjMCGdohQWhoPiMDwRNcZ5wBjT
	auTGor9UkVUCog9uzYvHya5rEdwCy5ZokJ1oCSsuBBdW64C3NQmyL6nOLy35D+pN
	GZeVy4leZWA8TM+WEvXqrr6loCLhvV9U3+wr2ae2mOPKAyb0KzY0IelvLcr4C3nk
	9Y2QtysJ/zrtGhtFQ1U/ecbqkv3nsZCwQjcOTPMRaEe6dj9H5IpBSgpSgc7wvCIw
	w5u9j4RLPnZJl9VygC2G9/JB27nBispj2a1Z+kFFcOgzd/58WmlZlqCNlDQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44xjgye1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:29:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81ed3e6b917so11855b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770222569; x=1770827369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSKr5h6hAkTNur0wrixEKU3taeueA9+e0fBqw6QqP7A=;
        b=B+Lm+usYzYP5k6g2QxYS3dKbK4iGGQgwScy+90bnFkJIeQkEei51FPF8Uq9h6jMPHi
         R29dkYr8EV/ufEqatCRagGQ11S7Vw5JbhEhjQ2nr+Kl9VH0Wnh0cjarMFitUTyq7EEj0
         Ntqb59pZFBhJKoJ0LfivUvFl/5xG8RgElkZGL2CSTku1fQzDq5FezJqmqlWu1C0TknYk
         C92txuZt0uCL9FBBZLpGb/LsjxbqeRHG0ojpkyB/A184UK581OEmFUG5yUryTaG49P3U
         rhF9/83OTdF1K4m6u+CM5SfcKDRgU/W8Umz3+60uvHMF7hZHBo+CdLJe9YO9OJT2F26j
         zJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222569; x=1770827369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FSKr5h6hAkTNur0wrixEKU3taeueA9+e0fBqw6QqP7A=;
        b=ZxWn0K/x215kOZ06XiVfogfvsC6PFLzTloMTsZG7BRlrQsCky8k//MynVXEq0IV+tM
         CY+yShuLHXrUVDHWY4Pxgn6h/8fMnBYZWd6isIYY/6jGiP0AdkDQbpzOmc3DHJwdHLac
         iEaQlb07wLj9G7quODrNDtlK5X3la4hMEFBMo2pKPPV5OiYYFe4e8ig/yhlUsRbSXyaD
         SEI87uMfyNj5O6mxCuKxVoBGZqTG2SrauKX3nsOm5CD/LdZCWpRwMqZhBh4TpzoWYKuR
         rsaydd4zac0muXEbpmoPOEBP+6f3wt7pDjg4bbGTV2bzBjOKTbNOvCmwX+S1l+EcHrdk
         /MZg==
X-Forwarded-Encrypted: i=1; AJvYcCWKkoH9xVTIB1km9K2yXkYjji0IYgpvtd6f0p30j6rzMvOWltEOpvkGXbFOqYRhvn5yncuxTKwIwrVvHkLp@vger.kernel.org
X-Gm-Message-State: AOJu0YydeiqzBwEc2GldQb0/ccefEr8yZ33sjMNpZgwOoZtoV0zzFIH2
	iLpNLamUj41X8+IDfcsiDFeao2zUCPbMY2tcRTSB36Y9pmuz6wnZMiBrtr/PIoDt8IG9H7DTlM0
	VcO0mrA1OujqXm0RP92uTDq3uJSUfKfTHQextesU1TUa0NVUrQ1CsdXzTOO62ZbUAtYvU
X-Gm-Gg: AZuq6aLRZSoqB3W13LpKL37amKcNyygbH7RI+cxpSD0ZAAnviJO85aUiQ9NrGVXxCE2
	A9bWxezLqS7vEooM3hqyy7bFHDAyvhH9Lxq+XOWYS4LdPmE3t/9O92Ub0UGPWqhVVvhMUi1X5th
	AhmdfiCf/UZTRWZFEz2f5lC1n7Z3eawjdERkTuR9pWTeokXTldb7IxtAFV8f+ksNjECgek2o1Cm
	ds1DNmwHNe99Vsq2gLfq1BiYoc0cxUmHiFuDu+bK5PeJPeUkr/ptAKw9rW0U5Uya6xWe7fEzw8T
	iOHdMh64MJ7ksUwbr7wJXQKFbrcS+b/9cRbqXEPyLbSB8PzaljaGnshF4KgdWiSN1Y7HEX4V2RH
	zL8TCEmKhyHGKaI0MmUD4aG6G7SK8kPliBs92jnxGl34=
X-Received: by 2002:a05:6a21:8982:b0:393:7f50:f3b1 with SMTP id adf61e73a8af0-3937f50f78cmr1511107637.39.1770222568844;
        Wed, 04 Feb 2026 08:29:28 -0800 (PST)
X-Received: by 2002:a05:6a21:8982:b0:393:7f50:f3b1 with SMTP id adf61e73a8af0-3937f50f78cmr1511080637.39.1770222568262;
        Wed, 04 Feb 2026 08:29:28 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c8515f36esm2546878a12.29.2026.02.04.08.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:29:27 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 4/4] spi: geni-qcom: Add target abort support
Date: Wed,  4 Feb 2026 21:58:54 +0530
Message-Id: <20260204162854.1206323-5-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtpbOW/+ c=1 sm=1 tr=0 ts=698373ea cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZHV-9eCtjRHb1jRugp0A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: g9Em13UJuSPbJdS1p4ijSDUDXwsOT63T
X-Proofpoint-ORIG-GUID: g9Em13UJuSPbJdS1p4ijSDUDXwsOT63T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNSBTYWx0ZWRfX1nqoVEIevuVB
 GvmZ1Zpdq78xFebmjM2PG4l4CDLb1HtLlZKI3j5Xac45TSxD2rC44pmardFnl/Bq4h37RrWxRDh
 PHk/EkdBFJRRovgClVOR88t5SnkydHrrivxLIPwvV5jsg4LafWZOx7s1d/9HioVdcmGPo1WvAZp
 0gCs+J0YB01Wpzr0rAcORCMX7e336p0J7FUUIwvhd0L82yjH6Hx0YIEXvQBv5AEztK0dKnwZnw1
 Ghqu8BV5aL+9MDbbal3EmnvJvFYjH8Gsk8DaeQC9If4XNxee+APw8iy2m3PPVTlFqnxxOfriqQv
 H+91ZCJ5R9F7lEwWZncFXbWi4iOUqRvFgXd25QuauVoOJSciCTuNHlPD8jDPufR0L3tARo9gCrt
 LStK90zy00yGUHRBkYz/glt8s+kjNp7QROQAXEzlCVENZpL31BE5jui1CDHM0ucptZMuA26yKjk
 GKvYnZ+bxyb1qAqQV9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91821-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47FF2EA466
X-Rspamd-Action: no action

SPI target mode currently lacks a mechanism to gracefully abort ongoing
transfers when the client or core needs to cancel active transactions.

Implement spi_geni_target_abort() to handle aborting SPI target
operations when the client and core want to cancel ongoing transfers.
This provides a mechanism for graceful termination of active SPI
transactions in target mode.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2
- Removed unused param from time out handlers.
---
 drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 5077dc041e3a..43ce47f2454c 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1003,6 +1003,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int spi_geni_target_abort(struct spi_controller *spi)
+{
+	if (!spi->cur_msg)
+		return 0;
+
+	handle_se_timeout(spi);
+	spi_finalize_current_transfer(spi);
+
+	return 0;
+}
+
 static int spi_geni_probe(struct platform_device *pdev)
 {
 	int ret, irq;
@@ -1076,6 +1087,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
+	if (spi->target)
+		spi->target_abort = spi_geni_target_abort;
+
 	ret = geni_icc_get(&mas->se, NULL);
 	if (ret)
 		return ret;
-- 
2.34.1


