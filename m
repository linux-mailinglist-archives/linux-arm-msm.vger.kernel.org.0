Return-Path: <linux-arm-msm+bounces-86773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F6ECE5F00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02384303FE00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 04:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1FD1D9346;
	Mon, 29 Dec 2025 04:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhPQuK3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4iBG3CX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53267256C83
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984143; cv=none; b=NrDgEPkCE++onkSc7IquzcuTTX2nb5WCScpYo85h9k5OCFO5to2PMjJfk1k6PF2mlf7ns49rtP6MIlzLcWeLetAmDFTJunDPVm38KEo2rvpFRciYCOpJdbvyeBywKTGUgk2BP1eQdC14Rg+P+yuOf4mf6b0ciZy0YNCA5LqDvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984143; c=relaxed/simple;
	bh=zfRE6HDH/oF9kt+zrOv76BV+vG94brTWdHbAGi6F1EA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FBqA5bVvM8mRsIHNoxzLyO543OKm5BNqd81coZEgEwDcOAYXu7nG7f4aYV77FUHuSm6bYigYmOqMEbWPYkmjNfbarlth2P46JZzUW0E5CWDQHD9CeZNs9i7NLtyw8N66+JNhQoy+CEfLOdjruVQn+oOux4Ull6vl7ezyVvLTVzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhPQuK3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4iBG3CX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMEEGX3821190
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9JJcvoCC/Az
	K5BxMcEfo4IlZ7RecYF5sBRU9NuOJgNs=; b=GhPQuK3aTQFsr2DpsqQhLEK/daO
	bu2RzLTXw3ad/z9ztV9xYW8LaJ2zFfaVUWyCtWAL+hi47OWFYSFJeNK5CUoKyz6j
	G0ybgksHwwjAtrmF7eQ5HroaabF8fO352itH8NUki/hNFgUmZgfA2YyDQ1E/vO5x
	xWMZr6Y43C/XiH655LHjPk1/ghboOW1qQ+ElvhsoiooS5YymEtJjTSu7Q0segx1I
	M0vYCOoEPn5ELEJT5i3NHzkjoQVZavrlBZB5rnm4xRbUf9TUeg/zpviic6IxPbON
	PcPGP2sz4YZgRU2cnjp+xBCR4McAIF9YirUHfTwaHTDlv/WjgvQr+PyG+lA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6dr3fsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7dd05696910so13590855b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984141; x=1767588941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JJcvoCC/AzK5BxMcEfo4IlZ7RecYF5sBRU9NuOJgNs=;
        b=Q4iBG3CXLcLcjjqX/a32mfUqKcLL7PCVTvE5dFUayNT89yug+hVFpYfsPxqR82V9NV
         E5zOUkitdNELpxEn0sEvlY9q4nvPThex8VXWEhcoRUAkefV4u2amWjSJalQekM6Gouq7
         FJBhWlnJNpAtGKFahpW84s119W4XMwYsUR6+DiJF3I4b4R6es85yicF/juTdL3XKjMje
         RaGdIR386dhkTjfvusTIFrsVTLwyrsUh9Cp8+RpbfU0GJJL/YhBRXNrEKO7dyHURujhr
         XeN7vZSGIl9uLupoFqI30JI1oJMPhMVEzMnnyJ7k5uwMcVN6z90pyITVSkY4HKrQEhZC
         ettg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984141; x=1767588941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9JJcvoCC/AzK5BxMcEfo4IlZ7RecYF5sBRU9NuOJgNs=;
        b=HQq1qz+tYqWEfLLfhSUd5Ekmk/WR8xgQkGDI5B9YUYcUCwkBCMBGgXUKdCmj4YvXTQ
         if+uNThWdeYmu8K9DGgtahyoLq8xFYN11zwogOaBpi0mKA/hFfI0M+wGh2gkc7RLkPt4
         rW1sIHZRs9CNMk2s4wznsJolvuVhr9cj38tk2r0wjqJtNuDBfJoL80HgVxZ+7ooi9eXS
         uU5qd4MzJo5e50VjyK81Dws7dEPvanSHz2sJQaAE3nBUApqVjdnxxhPxbqeiULxLJ8EK
         IFYlbhSnPgwTtKhwAhP3F7zwuHsf6M8FvK0f4asd1tWFXR1L0wUXRVunj8Tdan1sI29p
         Xqsg==
X-Forwarded-Encrypted: i=1; AJvYcCVdc+FmH/jeOaYA8vOmwUOh4OtsRXrC2GvdytaekZlhYlYlVnTSwhLR4YtDyWEMdb31lhhkHlQG8fSAgOry@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHDXFC3OxPbo+cUssrZkFLQfzF1gx/2h8HCD3ypFYtkJh2JAB
	nZcGjK/miB2wXRzYklRZzFhC0mwbYFgrNGRj6Z+mlDiiT2F3EMie8uwONzscGPQync8ml49edJU
	/NtHL3xibujsHn8gmFBipgLvFh5rtbYi8ktL6IEDq+9YygO+qxAZ9e7qIqDL7Vb8YhUOq
X-Gm-Gg: AY/fxX5Gbm5stCRCSPG++/CQqnDqcb4GNHJUbPEE9mC5w+K/1meZvnDYDMyym9lrpkN
	KjueKoL4b/eOgi6IwJMpMlG0/ooEZZ9VZNJnD0aOQ3VsOfMURrfNUhD8FIn1li/6AQLfr48J/Fw
	943JDejGeDAR1/jh1oOO84G7aeiWUgYB64CBjqEPWWu7FxaoEP8MR2gNIYB2a8lNA0j/JplGki2
	FPIm+NvpsrxcQ3/TYXqlgIQbUgbCgTmBF7Y/afokmCgp+8h5WOFY/ctdNRYF1X6PTRe+HXcFzu7
	s8SKCDOLwNxfkziPbMoO4c/pLSz8tAN1uBWtDsgvoVpOXWgCNjW4yJUA0tzunDYxiflxwPINo+s
	XjqIXFMqt+YV1+U/hbAlILuYIIkQXr2AiKOI+e2xFSTs=
X-Received: by 2002:a05:6a00:4219:b0:7f1:4c9c:782a with SMTP id d2e1a72fcca58-7ff648ee056mr25255701b3a.26.1766984140854;
        Sun, 28 Dec 2025 20:55:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXCTnJjfarrI9o6MPsZS7rS2u30bcKXIYNYtBf38hhzg8nPONoGbVH/4VzgJrLZa5tNpi19A==
X-Received: by 2002:a05:6a00:4219:b0:7f1:4c9c:782a with SMTP id d2e1a72fcca58-7ff648ee056mr25255678b3a.26.1766984140294;
        Sun, 28 Dec 2025 20:55:40 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:39 -0800 (PST)
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
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 06/12] soc: qcom: geni-se: Introduce helper APIs for performance control
Date: Mon, 29 Dec 2025 10:24:40 +0530
Message-Id: <20251229045446.3227667-7-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX4ArFFublDMgS
 wSH4FIgQwo/sXlWx6FW2gPGhy51JxvSenMFdY4zWh1n3qD1i0d9mMVMH/yD0Ty1rGptFwF9IqYC
 gWdkWKfzLbv8/m7mMTrApdDOAWSnJTFpRgQfN4731CM/mHPmW2sLWed5LZoNQ+eHPJ66PWLL3d+
 cN7bYEG569Bz//+sspRizCxk5RSxxG4KFnSdY5LpBxSnLHNycrN/e5XzznQrcHVmt+1Tl9Gz0y1
 RI1CIfGS7O1GGw2/Q0Q0F1coFN3MuEA8cmjY82q184Syx8CWtfREpLaNx1fHBKs+EB3RSmEWvLy
 e9YfN7W3piACBQSbj4BvazIHpNP0qM7PDE03Tr/IcZyD65GVgt99l/ETEGfPEarr06rHHFny1Ah
 4+DFxab3vFCVzwfc5dVsvHst6GwUzs2/7xHMUbyS5Q9WldNCI0R1rt2euFLddjUjJ93lAf0oSQc
 FrgVZY1350mQKQjBMkQ==
X-Authority-Analysis: v=2.4 cv=VdP6/Vp9 c=1 sm=1 tr=0 ts=695209cd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NwCh5GMA9Nt760FYQHkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: v6ne-QDzMCn3Vu5gPNFcXcP6xja_ST5n
X-Proofpoint-ORIG-GUID: v6ne-QDzMCn3Vu5gPNFcXcP6xja_ST5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
manage performance levels and operating points directly. This resulting
in code duplication across drivers. such as configuring a specific level
or find and apply an OPP based on a clock frequency.

Introduce two new helper APIs, geni_se_set_perf_level() and
geni_se_set_perf_opp(), addresses this issue by providing a streamlined
method for the GENI Serial Engine (SE) drivers to find and set the OPP
based on the desired performance level, thereby eliminating redundancy.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 50 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 +++
 2 files changed, 54 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index decf7cf5172e..fd63cc6a7faf 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -282,6 +282,12 @@ struct se_fw_hdr {
 #define geni_setbits32(_addr, _v) writel(readl(_addr) |  (_v), _addr)
 #define geni_clrbits32(_addr, _v) writel(readl(_addr) & ~(_v), _addr)
 
+enum domain_idx {
+	DOMAIN_IDX_POWER,
+	DOMAIN_IDX_PERF,
+	DOMAIN_IDX_MAX
+};
+
 /**
  * geni_se_get_qup_hw_version() - Read the QUP wrapper Hardware version
  * @se:	Pointer to the corresponding serial engine.
@@ -1091,6 +1097,50 @@ int geni_se_resources_activate(struct geni_se *se)
 	return ret;
 }
 
+/**
+ * geni_se_set_perf_level() - Set performance level for GENI SE.
+ * @se: Pointer to the struct geni_se instance.
+ * @level: The desired performance level.
+ *
+ * Sets the performance level by directly calling dev_pm_opp_set_level
+ * on the performance device associated with the SE.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
+{
+	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
+
+/**
+ * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
+ * @se: Pointer to the struct geni_se instance.
+ * @clk_freq: The requested clock frequency.
+ *
+ * Finds the nearest operating performance point (OPP) for the given
+ * clock frequency and applies it to the SE's performance device.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
+{
+	struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor(perf_dev, &clk_freq);
+	if (IS_ERR(opp)) {
+		dev_err(se->dev, "failed to find opp for freq %lu\n", clk_freq);
+		return PTR_ERR(opp);
+	}
+
+	ret = dev_pm_opp_set_opp(perf_dev, opp);
+	dev_pm_opp_put(opp);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
+
 /**
  * geni_se_domain_attach() - Attach power domains to a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 5f75159c5531..c5e6ab85df09 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -550,5 +550,9 @@ int geni_se_resources_deactivate(struct geni_se *se);
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 
 int geni_se_domain_attach(struct geni_se *se);
+
+int geni_se_set_perf_level(struct geni_se *se, unsigned long level);
+
+int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq);
 #endif
 #endif
-- 
2.34.1


