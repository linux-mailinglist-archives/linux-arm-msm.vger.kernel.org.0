Return-Path: <linux-arm-msm+bounces-88521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC65D1201A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ECFDF3060599
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA99346E62;
	Mon, 12 Jan 2026 10:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+DhQx4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8U+nqqT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB503469F8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214882; cv=none; b=TwaKe1FTZ3Kddlkk9uNB94XBUgri9+6Z30UjjnexhLqEy9x7wL/Gz0GsEu/ohs/FtFeEDj73Ghe8ogqOxAmKBefcT6f1XWqOvoSJZ3Yq3VaSvUCYxMprHQb4MBOuhkh+rXd5BcaQ2NzHmMH4wxk/Kpr/M8nmCq/G1jYIjLaEhnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214882; c=relaxed/simple;
	bh=68XYG3tdqPOqD6BAG89rFRpLL4RPlGdjOEPrTt97jYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K24kstNFm2/61gluQvjXmn8G5HVH95fiA1R3mJsZ9osbavWt0V2vStEdHKgeWn+a8i/kUOZ9hSFdkww1aP4yc6OY2vw/4a+jm/BBVn8eTgwA5CUgjO3B5uOJn4TrZzbHIgvxOC45UufDklaQEA9whZ9c6jnqpBF/Tp5tKDE+nE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+DhQx4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8U+nqqT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C7Omjs555754
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tiqRW3gaC++
	bZCm4/OwS1b+DcRa9wG6BSji9LqUF26A=; b=D+DhQx4Tpdqc5iDtaKwciPT20P9
	3+waspf+fYZTa8ZnRH167/s1bN0eopVcCmbA4FriIC0NwOvWfsO0XnSApYHfFZBb
	aan0Nc0HVPX6ibUbqDSpYcLlZRCVstFr7CJqJRztIExG5YGBDs5mikBz6YieCKF1
	2InMgBaeeayql32QqeA9X3+u/LUOSyO2PPGopP5id+RZsnAVvu/i0eoWLo62zW+E
	FagV1pi3Z9KARB9a4uNYHz5Aqn2VLNwzQ/fPNAnIpD/0RcrSrZLzXXeGx32G+0Dc
	xvAhaui+QDK9L5HI0emjdMjrk3CWQdXd7yrjJT1ysNCk/jcouS5YOKm98Xw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmvhw0p51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:47:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f46844106so956221b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214879; x=1768819679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiqRW3gaC++bZCm4/OwS1b+DcRa9wG6BSji9LqUF26A=;
        b=D8U+nqqT7w38d9BQ3pL8fTdeBhJUvild3Y2H4Tzei/VzIlpTuT6JaVChEGuYkZn6O5
         2hmB9hFlm0UT+bfMySPYR2NcWa4zYo2c/wcpcSA8mhBPZxcVKb9UYCIJ5jOozH8OGVm6
         gOkzzrkJc+bEB1TaWdHMAWuCRpL1ZZ5az+PfzJlOY4sQTkyrlis7B8SW50dKdbyG20Xz
         WTBG17195FoQFB09oKu6piI9GwBmt/f86Co/ZzJeU6d6PK6rconGuWsjKnISdmQxr5a3
         JyR9zx7ANOJwQXn43GjyhGgz4JShCOLwEFAKNg6SsyvHBwqxADZUe1nqy+zrGlODh5+p
         7Ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214879; x=1768819679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tiqRW3gaC++bZCm4/OwS1b+DcRa9wG6BSji9LqUF26A=;
        b=E+Y8lkLB089sEwi2sm04mGwuG4OR/PYyPINOS9DYU5is1CuSg4Z1NFccNULCelkizN
         va2LzjfIECUx1WDNXXE/xCYLPm9OneeTf+oXIHLFW5WFpnJCfrqSK2mW3Zrhibh6P5Wf
         Qm7kOBTW76QrKHAVmtapdKSrRpaAIa0xdCZNci+trAokK8u21j447yS8krRT0WyxplB4
         ql4XxkYOk8dl/kO2zZmKiB91XiPdKMrU4pmyMLVZSRScaMeCN5f0fjioDVzc8abTPUp8
         iCpCssYhmbfYr9Co2Z21/vq/dG7AFOWX9TB+kBUpfROpPkL9B7bKi61mopn9oSMaXW2T
         zjpg==
X-Forwarded-Encrypted: i=1; AJvYcCXgzrTcpv21kfItFeRQR8ovaK0PdRY4vogZs9c3Z7/2kXnptT5jrzSPMLFkRgKaofEPZ10K6z9eGIab34vy@vger.kernel.org
X-Gm-Message-State: AOJu0YyhTgX04dqklYEA011NsiUn52IvXVbCS8pLRPbEI9YZP95vJsgL
	tT/CZH0XeyssBJ1zrY6WBawQp5JuLqaUGiM/Yrj7++a1iUMY9FSAn8enIqACOsNXxMj1ztvjS33
	T7imbGNgTDbTStjsfvRTaqC7pZvETMQ60cYl4msS/S4/kaogsUve8tllbCEKe1N1dH6yj
X-Gm-Gg: AY/fxX4Fd+UvgHM3E9eYPBpxpcy8JXgUcfFJwwcT6A9ufAqmo3QF1QObaktMzjckyF3
	RyMXQFF3TqgpsxJ2hYD1CspM+Qfz1JrfJwZG/RWQb+Loyu0mGWzNR15VqFLF7iiaQwWtDy6M3a/
	hjUvOZOTN3L4h8NA0TQW/r9Az73UaFfgiQ0at9TW7hb2nqTTnfzp0wGLeDb8HzD/aRfLFQLX7lb
	a0kUxEsEKUAqhJprSAbEjC57xcncBNA28XK99+3qBAc1jzETy2GjpKB77IebjBJ40Sj+JqBOJ9j
	wWKXu4lKWAfqjkAQe9G06VdO2dzt/Vv2uFoEoIew074dFUf/gyVqL6KL0B5C5YKza/H7Ri+4mZa
	tOzb581nL4eN09YKz7H62cBJQmku27N8fcc75Px1+DE0=
X-Received: by 2002:a05:6a00:a247:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-81f4e1c2365mr3003762b3a.23.1768214879269;
        Mon, 12 Jan 2026 02:47:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZWAF21brn4EKDzeFUSrcgyjyM55X9jg6ATGNFL66fTuuXf8Zunil1Grf+5WcgDdXS4uVwGw==
X-Received: by 2002:a05:6a00:a247:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-81f4e1c2365mr3003728b3a.23.1768214878674;
        Mon, 12 Jan 2026 02:47:58 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:58 -0800 (PST)
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
Subject: [PATCH v3 04/12] soc: qcom: geni-se: Add resources activation/deactivation helpers
Date: Mon, 12 Jan 2026 16:17:14 +0530
Message-Id: <20260112104722.591521-5-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX6xgU9W7TSttI
 My52zdgeMTvWBEqi7pUVUYNYriYHm9tAaJFNYRk73km6IVk0m1hPKnxZlH+dhsATU44BckvUJsw
 QwbrxNlw6w/f3kNQihlRTHMCcviH7wQqHjGvbCbV2awpnfYarBAlfHaIUnl2xJ6QQH10AY3DY3/
 Kw9jQWIipTHdxv04lPTj3jLsS3mHC44Fa4no9/5um9V/LFiXhtjvetM39e0i6PTQqGdsQE3yGlC
 nXhX9BGYMJ9yz/IA8JGCIUTAdzanYqyRWsx5GYVfynfwN0O1K1hFv/HO7EM2NEXocEn8j47qL2q
 cfvp8pqnnq9q9HSAuAOr7hw4jCgw2XcFI5XoziDZyA3oxyX1ZOdYti5f/nKydmjk/AeU0oJR8P4
 8Xox5dMNsEDGn50kgKVOEiIgUZsoCGRUaztnBVFSUfNw1BEQncm4uKLW7o47cDUSon6NPZCbU/h
 vKaEZA1bGpBAjS59IPg==
X-Authority-Analysis: v=2.4 cv=JP02csKb c=1 sm=1 tr=0 ts=6964d160 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KBRiQYpxJDLEvAb9SdYA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Z10ti747wJGPYtZ97vor5LZp9zQ9eQUb
X-Proofpoint-ORIG-GUID: Z10ti747wJGPYtZ97vor5LZp9zQ9eQUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120085

The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
activation/deactivation sequences independently, leading to code
duplication.

Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
power on/off resources.The activate function enables ICC, clocks, and TLMM
whereas the deactivate function disables resources in reverse order
including OPP rate reset, clocks, ICC and TLMM.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2 -> v3
- Added export symbol for new APIs.

v1 -> v2
Bjorn
- Updated commit message based code changes.
- Removed geni_se_resource_state() API.
- Utilized code snippet from geni_se_resources_off()
---
 drivers/soc/qcom/qcom-geni-se.c  | 79 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++
 2 files changed, 83 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 75e722cd1a94..3341bc98df09 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1013,6 +1013,85 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_deactivate() - Deactivate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Deactivates device resources for power saving: OPP rate to 0, pin control
+ * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_deactivate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	if (se->has_opp)
+		dev_pm_opp_set_rate(se->dev, 0);
+
+	ret = pinctrl_pm_select_sleep_state(se->dev);
+	if (ret)
+		return ret;
+
+	geni_se_clks_off(se);
+
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+
+	return geni_icc_disable(se);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_deactivate);
+
+/**
+ * geni_se_resources_activate() - Activate GENI SE device resources
+ * @se: Pointer to the geni_se structure
+ *
+ * Activates device resources for operation: enables interconnect, prepares clocks,
+ * and sets pin control to default state. Includes error cleanup. Skips ACPI devices.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int geni_se_resources_activate(struct geni_se *se)
+{
+	int ret;
+
+	if (has_acpi_companion(se->dev))
+		return 0;
+
+	ret = geni_icc_enable(se);
+	if (ret)
+		return ret;
+
+	if (se->core_clk) {
+		ret = clk_prepare_enable(se->core_clk);
+		if (ret)
+			goto out_icc_disable;
+	}
+
+	ret = geni_se_clks_on(se);
+	if (ret)
+		goto out_clk_disable;
+
+	ret = pinctrl_pm_select_default_state(se->dev);
+	if (ret) {
+		geni_se_clks_off(se);
+		goto out_clk_disable;
+	}
+
+	return ret;
+
+out_clk_disable:
+	if (se->core_clk)
+		clk_disable_unprepare(se->core_clk);
+out_icc_disable:
+	geni_icc_disable(se);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_activate);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index c182dd0f0bde..36a68149345c 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -541,6 +541,10 @@ int geni_icc_disable(struct geni_se *se);
 
 int geni_se_resources_init(struct geni_se *se);
 
+int geni_se_resources_activate(struct geni_se *se);
+
+int geni_se_resources_deactivate(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


