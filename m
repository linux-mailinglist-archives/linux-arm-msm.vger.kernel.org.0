Return-Path: <linux-arm-msm+bounces-88527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C4D12089
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47B59305E84B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379B034D908;
	Mon, 12 Jan 2026 10:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="APEHtDhi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSPxGJpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E962773FE
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214921; cv=none; b=oF7Pmh86Lba9JlwSYGa0Q40/aPLte2HrNJbCRT7075JSgWCocw7FH1qACDFOW2oCgA1oJe1OAWrqyUI9V5OtjJQKiUmTeTgC8vUIWQ6Lg+ZSA3wN7VSoYifiCGfG0DeKcl17e+EUT6fUoG9YZnUfJHRE63DWyPCimHBa0PMhZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214921; c=relaxed/simple;
	bh=dd9jcM7VhtLSe01qVKxg4cqsefq6fIxIf68B+OdANWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZwfhBwEvQHreRkuJQGvzaQE5dNWdNK2ch0N7xTVcQZSMmeC8yFD6z2ZwewWWdgRT9/O6N9+WUQxNjduTZ1WaHmesux2dbQefd1tWic7cwxGHl6MvFAgWisNMYvAyScZYnr4FW1LxUf2CxLc1kOjle33nT2nKos8Dcf6GvojlC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=APEHtDhi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSPxGJpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEsAF1316225
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIBNmtegJx
	j/sp5FwSU/fdzZauMmtoR986IcxrENk0=; b=APEHtDhiRbaCRFcLNGq/lGmYY+I
	rDWnWzMHqXoiAkdcDji0mmzqSYEkodeUTGVXVaSFTP/lAyQxhJk59Kb7qy2sKbsX
	BFYyFQA4mMBQJSpIFAlP1XaFRXyq8sA0/zIhO2ThLMDRoYqncL/S02PcGLhz6PvD
	RL7Ij+QKxK/rT7c8E9EBGcCjnefW4mQp/O31Q12qqnD9+NzGEEiIuukmGIRbAwXv
	GVQCQ9TjH2yMoX0wo0v53HeKt7v07iBGHUJPbsz32bDLnZ3pifwMRuwuixqXmWWO
	vwz4ezXprCgxGwhUl8iYjD5RW/q+xiLkqQGSxizHyfNlOUXxvisypPsSORA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg2v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f4cb0fdd8so619753b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214918; x=1768819718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=dSPxGJpVVP65n1b3YkvLtJg2yX+Pep3Pq4e9uOB4sfQBR5qRVrNMdcwEFjWjt/MCYP
         vZ4KP7jVyUJz+D7D/tpuwpf9R65QHHWDnB+TjJ1dHmwpNjVuhSQvsGdd34TiVWIp3Yy6
         dJhIZXRAmUBIvJYdDP8q+TGintc87gZa+1UEN7xRdd6Ar3oBPLFvmBqltSKPrDn+E4pU
         RnP2Exi85AKt+rFjYn3If2KhE2qJLuo5j5ZXNPnYWSRnUGkxwUbF2du7DsBoZ/4Ke7O6
         RrJvQNgWQ0qDkJi4g7rN/mPFOlhXAweWXU8xRII9cNmvJ3Uv2xr4FI/ovvvjQjrk8d3+
         0VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214918; x=1768819718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=W2NWPkTFa6YNzjXudRUCaEekIU2dbiuOgrr1QrfHr+Qu8sbpWwfH0BJGmqukTVML6d
         UYL6wISWikAAwQ5sXSzM7V6bjXAWsfzX8v/4ibByMxop6eA0hA0HYYKABhbtdAZpFGPF
         /fDhhNFxG31vsjTp2H/XBvJYbefbQAd1Si0uWq9kSDLovXMrywAOhgymoF9Qm/j7/9I9
         xlGIHfSBLtpJrromH3htuuczpPAtEWmZ270nSLabS82h2YsoiAPNGFJlCKAoSPLUqQ4j
         PzYDr+Wd4wb6/D1oZXVNZ/SdgBOEnrFTj31Zw9WpnU2PnMmXaXEXifDJC8FV2dAKaZ53
         2NFg==
X-Forwarded-Encrypted: i=1; AJvYcCVgy0gFGFJI1RwR2KVJc7bsns7RO08WHY9YzqoX6rwaUvSVy725OfhtrWQkBAc9oZJjGU2LRjM0qAEmfFzi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqf2DtHxZ9LD5/AsVBLg90+lpFJDSR1B/tpD2a0J9EASfb7vIC
	WPyv+2lX6TKA43MmG+RS7PoMrMuoRWdEjI0lQUHq9+JSgLuxdAd0ZJxcR9PaVdI3J9nMbZAouXc
	plRbzT43WKRwF+ihZ/E2p28RC/+iyp7MMW3I9LRsH3Mum8rvfaumYogYyyy3l1QIoK1t9
X-Gm-Gg: AY/fxX7I2s5kyWqkXKz8Fs8+Sz3Ho6kqiP50NrJHkzifx8eNhpGs/8iRk0+y2YYAsFz
	ws4+YRqNiZlfuh4zLFPxgajcpK19IKtlpqBJUaspdwaxl7+8qJ09SoUXOpFxa9cDt3i7KWq2d6D
	Z2mzUbqtWcwgLURaYGdD+WX6d5qo5ftaQt3838ZEuRALtcyHwIQP0LN50WHPOQpxEvonP9CdBuR
	duWY2vy2etQzxHpP5UIKu8NZkrO5cLNHPa+8pey7B8Sd5oauNvKgYq7NOwU/qwHujLm1A/gybPx
	EGs/Wxv0JCwXs2bEwaOSosy4j+1aBgf3BDTYuouIFjwPx0V4Q5++t0SK3Rn0EE+IqWzB6bdQ1X9
	hJJ7zZUz2LYKbl3Xc/ZsiGTIpvHhtbTa3vap1TdttIS4=
X-Received: by 2002:a05:6a00:ab05:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-81b7e2543afmr15060514b3a.31.1768214917813;
        Mon, 12 Jan 2026 02:48:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEujJSJH1anLHyWKus4uNWOXCEe7xRR9ncKzSbzmm4aGIbe5t1Y+jRjez+8QTuXbWJxFmHvmw==
X-Received: by 2002:a05:6a00:ab05:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-81b7e2543afmr15060501b3a.31.1768214917253;
        Mon, 12 Jan 2026 02:48:37 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:36 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
Subject: [PATCH v3 10/12] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Mon, 12 Jan 2026 16:17:20 +0530
Message-Id: <20260112104722.591521-11-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zj8FUB1BYvwHkKt3eejH59waGHiQpG14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX2rhhhuj1h09q
 cjNgkmYUbiC/KCMllT1RnLu7YjnbizJBOLgfFuYwuFc5MIZcMy6zs6URnsNuJM86fAkeF8erest
 xAyZyVCHJ3+adWYP0W3ZN4IrM263zC7NzK4i+Fo3K3eEzVg+qDlumO+44U2r4BdoIV5ZfxwloYQ
 fsTQDpt9e7sBRANFui7QnnQvev1mprDmQgj51NR2PvPNaU+zH+Pp9C5pegSSW688eT7Ku5EXfY/
 cyY1IZBm5zAI0Xb0xlrTo6UeCOFpW2vUKxPkI2jKu4D44VDv4ZGiEb53w6yvkvlMU60uBTxr2VE
 emsrX2IA2iEXnWGuObCJjjpTjgqmjFcx2IHUTVJsqIMj52Xi5gpLHNJxO9nnWKDdUzuzU7aP2NW
 /38pk8CjX0rVyqXaoUFI85yuLevWZ+CvdW8Q5iuwc5+ugps9g+0RvDHBbTI+RItqFEtcW2GkZYx
 /+hJZ9W1KF5ipNpIKUg==
X-Proofpoint-ORIG-GUID: zj8FUB1BYvwHkKt3eejH59waGHiQpG14
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964d186 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4b13022e508..b0a18e3d57d9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1179,28 +1176,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
-	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
 	return ret;
 }
 
-- 
2.34.1


