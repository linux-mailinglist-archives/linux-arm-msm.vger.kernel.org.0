Return-Path: <linux-arm-msm+bounces-86770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6C6CE5EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B3F13026292
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 04:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA632242D97;
	Mon, 29 Dec 2025 04:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k5KHykFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jy9qA1Ou"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB95D2472AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984124; cv=none; b=BC/hmia+10FSE4+Z9TXCnvQrJj9CiLpTGODqFRcH24IvXFTqknagp9TZLv0xTWQBmu0Sb+zEqAnJADVYy2jkit9r4UZQzFG/oKhom+PiAK5fGln8YN3yxbkbtqrxZnZh8wmibCbkHWsKXzi8jnRAKnZ7heeg5EcXim69HJmUdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984124; c=relaxed/simple;
	bh=aNFoPhCzK98jZhwkTUn8Ng4tLog3h9ErdlG5j8XEi8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nXfPqXHC9GoAJeRLowe6+kMAja6lMzgLA8YMjbHZoIcA+/vad2g4ceY0ef4W5K1iVVU98VkjjWro7IMqC8SIBIw7dwrSXb5L2rcvNnRa5ifDmaQZN4LoxyjvTjC4TR87Ft7Ay9DEA5m+KXSrn5Taj/KQU4KnJVwFyf45/oxy8dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k5KHykFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jy9qA1Ou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMuDVm012590
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=coMCstee7sz
	aR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=; b=k5KHykFUK61a/mwQBkgUWMfnVeA
	JS9qPQRTE+n5y2BV/McDfNiW5851R9AiKOc1332hJzqfsx63TREV4AF+ws3j+t3k
	JjlL3RKaCuxZVCtZBneJ8Qhe/+fKhVbNOfq2TKvHoR6Fc5YUpehabzJyGQs+t6/D
	h6r+2/F/f6qFBVUx6kvCn6aQnmweqyTUs5iux693ABL0qOW0mav808/9A2IxErte
	wRXVV6ji5ZS4t6Wo07mlqMPJEII2dXS+S6d+E/TPTbAmCR295zfdcu0oEZ4m0kis
	XLfL69yEdKceo5mtEwsIf7zO5IeR2Qg9JNxxQVUoFcqovnNCPHxB8HZM7mw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5kbaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:55:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c7957d978aso10124600b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984120; x=1767588920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coMCstee7szaR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=;
        b=jy9qA1Ou8s9Owsd2MH08fbYARXfPDz4nlYKkBNHBFPByNx1QWalOhheeF1B1zbrtz8
         vF65g/SC7I0gCtr2An8GFPQvJKMpSeREETzK16s30wUVpuZdPhGsid6NxfYobn7M041a
         QTbFGjB0TCcdM1KSH+JntmiMpKu4JT3uh7ZTit4+Gyg8/Nsap2lflKySJWi6KYdsAuLL
         nzDjowA8ZQeHY51gEiUl4uQ/rdkIm8CPo1Dx33jU+MabAOhvpsZIAVRJ+N+VicmA92cC
         OJjD5LPTnrE3KjTUBXafOYvAFZ0kpJoTxQJrgH5qhh7v9/UdybuVUEADpYQnys/Aeb3Y
         oHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984120; x=1767588920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coMCstee7szaR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=;
        b=pFcaDkPa32ADr9365MQK5pz1HWO5h82D+l6ghq5NDWZLBfxxlneSS0YOxQlP+TDzVM
         b+poKJq5MEKdbumvpR8FLApPI1/jF1IX7noqsCa3ImNz/mNmY89BtsjfFHFWj+xcqNcT
         SC1vzid/z9rYmb3J0lC3G0hHT+4abU1reZy8kpOMB5wsny8c6g+DODdK0GGcYGhpqKLQ
         zFBqNZW4gGsM2bRgtGjuN8f03d9qgik98GW5FlecsRrnMX/04TKC243fwyc8pSVNeQXp
         AjGYlFgk39WR+Jxg8u+inwuzLqMXlWLrcU6FIxs4GVbu1FaowmWb68+gkAlrw6B4pbXy
         oEVw==
X-Forwarded-Encrypted: i=1; AJvYcCVB/Sq+qUvGG+06eHqNUwEGD4KRIO3VS9moTRIFQ+0Oo2N/GeyDYLzYBHlfP3wV65+dNmNVsXeAIeytSmPQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LnoL6p1raBsdqtY4/0CVk/KUu39GXgKyTW7GkQqqwqh5pcZS
	JrpxWN5ICQs3U36fZOm3l5u5LStK7wurwEivNqU4sgP2QZohxgAqTd/wnsQVAcSc0VKBYxD7FEY
	n/jJ0VjziAFmsuhsELjfC5nJuIIQPyhkow7MYezxgj/712wVeix5lYLr/ZrL5dLRUZWmQ
X-Gm-Gg: AY/fxX5DmqpgxsGJ4xeyKlAezrj9/xKwMM1HmYaW3p39/KetDVk4RE7lE5kl3qmnRhi
	sJ8HANQv3SQeTPML2YKM1wAsC2v/Ssx0h1tG9/xcvUv0r/mFTlUX7ghwKWuZnqRKwOg4WZbsaBS
	KPrfk3KKNCKHKctZb2+Fu81/8NnFcUnfK38a14d7QHEHE0s51pqO1WjmNTPFzt7e12cKex8eWF+
	YckUnvfnNw71NU72LeKImSgyOqbhVomwZXdaPrIPxMFcYl8z1cx8z46y6J7+xMp89rcbdJxlmXD
	QLQpfZKwRlhry+JMq8o74N3UQOSwJlYo8UPu4viF+RokxzoeI271KjzzF8SIdWUlDyYtzNIs8lX
	4E0UqK+nh1Rn8ggBqQXiTUhoOJ30VeSG6JSokeYZOCqY=
X-Received: by 2002:a05:6a00:3489:b0:7ac:69cd:ea0d with SMTP id d2e1a72fcca58-7ff646f8f29mr26299348b3a.19.1766984119686;
        Sun, 28 Dec 2025 20:55:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5f5EGWiwwJRCGKcwapy5WhXi+l6UAKiInOU5E6ROuImITANZYDQPq1hAmlOq4vUoQpZ7Jsg==
X-Received: by 2002:a05:6a00:3489:b0:7ac:69cd:ea0d with SMTP id d2e1a72fcca58-7ff646f8f29mr26299317b3a.19.1766984119115;
        Sun, 28 Dec 2025 20:55:19 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:55:18 -0800 (PST)
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
Subject: [PATCH v2 03/12] soc: qcom: geni-se: Introduce helper API for resource initialization
Date: Mon, 29 Dec 2025 10:24:37 +0530
Message-Id: <20251229045446.3227667-4-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-GUID: ZbQik14Cf4EXMTRuBQZqwM3pIeRz79TL
X-Proofpoint-ORIG-GUID: ZbQik14Cf4EXMTRuBQZqwM3pIeRz79TL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfXwPpVsKnZtVcm
 G7pyJn8BtMRjsqjyjDa3DPn2XmF+jYXMmYqz0VlrPK5jdlwcW6LSs89DDJb32qGyylzLPKpMFBd
 XVVjMRBwbYsWs4d63HqxH6OJWf5UTwb/aS40u0Qrln6LvcEbPwA/k3qNYQm8YxeEgl9ioxMwLCn
 ERizjlBkcSxjWPcT2PNdtcpajwdul85j2d9zVeB7gX1xwJTswCKqLAOuH+RNkGtMPPTr/6dMmdi
 hgyi3hu+5+FOZ/yo52BPVKIRfywka/qwh+zeT7m8GJ7yrwUZwWmlVK429nBY3YMw9cpPjbSMU+v
 pM2BDpwJo7aFISzDZwHZHt543RWiIH1qTpK++wIknJmI4oR4hNSDf9hUiKYOxc+WUfDLKceU57A
 Uwm5j906FrR9BU1n34JptIUAtu9Yr1ekIbOXchELzVuWRHvecVM2SMVtt0mEVR5gcd9a7T2yApG
 ntl+/t6IQMAHKqiNfwA==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=695209b8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OYYzyx7XpuDNtx8IVW4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
code for initializing shared resources such as clocks and interconnect
paths.

Introduce a new helper API, geni_se_resources_init(), to centralize this
initialization logic, improving modularity and simplifying the probe
function.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2:
From kernel test robot
- Updated proper return value for devm_pm_opp_set_clkname()
---
 drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  6 ++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b0542f836453..75e722cd1a94 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
 /**
@@ -1012,6 +1013,52 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_init() - Initialize resources for a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function initializes various resources required by the GENI Serial Engine
+ * (SE) device, including clock resources (core and SE clocks), interconnect
+ * paths for communication.
+ * It retrieves optional and mandatory clock resources, adds an OF-based
+ * operating performance point (OPP) table, and sets up interconnect paths
+ * with default bandwidths. The function also sets a flag (`has_opp`) to
+ * indicate whether OPP support is available for the device.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int geni_se_resources_init(struct geni_se *se)
+{
+	int ret;
+
+	se->core_clk = devm_clk_get_optional(se->dev, "core");
+	if (IS_ERR(se->core_clk))
+		return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
+				     "Failed to get optional core clk\n");
+
+	se->clk = devm_clk_get(se->dev, "se");
+	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
+		return dev_err_probe(se->dev, PTR_ERR(se->clk),
+				     "Failed to get SE clk\n");
+
+	ret = devm_pm_opp_set_clkname(se->dev, "se");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(se->dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
+
+	se->has_opp = (ret == 0);
+
+	ret = geni_icc_get(se, "qup-memory");
+	if (ret)
+		return ret;
+
+	return geni_icc_set_bw_ab(se, GENI_DEFAULT_BW, GENI_DEFAULT_BW, GENI_DEFAULT_BW);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_init);
+
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
  * @dev: Pointer to the device structure.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 980aabea2157..c182dd0f0bde 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -60,18 +60,22 @@ struct geni_icc_path {
  * @dev:		Pointer to the Serial Engine device
  * @wrapper:		Pointer to the parent QUP Wrapper core
  * @clk:		Handle to the core serial engine clock
+ * @core_clk:		Auxiliary clock, which may be required by a protocol
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
 	void __iomem *base;
 	struct device *dev;
 	struct geni_wrapper *wrapper;
 	struct clk *clk;
+	struct clk *core_clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	bool has_opp;
 };
 
 /* Common SE registers */
@@ -535,6 +539,8 @@ int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
 
+int geni_se_resources_init(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


