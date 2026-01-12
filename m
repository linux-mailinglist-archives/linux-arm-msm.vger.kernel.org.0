Return-Path: <linux-arm-msm+bounces-88522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B839D12026
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 11:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1749B305329E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C822334B1AE;
	Mon, 12 Jan 2026 10:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcJUd6e2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX7uCDZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4641834BA34
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214888; cv=none; b=H0DhR03FBPr3L/7YdfDFB/MREb+UBOPyCGbQlD3k2to1XX8GMlhYDoyc2mFGTUJh2fucswXzsk0yFaa6DVSoIue3o8uQ78tZvHQbt+TmwbyUh9t20rJMKSUuZaitIiLCo22rps65Knjm1UXN02VOyo+e0UFJeQLORdJK0RBy5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214888; c=relaxed/simple;
	bh=Lwi6am73hjEwuGPfyvhOjnNLgF31XvyybDUt3Q5oDo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dWEpKTrI1L8fr8AHTkm1Y6koHINohKPQNAfBPC/8tbR7oEyc+uTeZIAC4t4Q0FxeI144wCkQ++wiijP+KN1WPHcd2os/DXsEqqS6NleEqedFN2TqwVubmphCb+k8z3hSnEHvFibvNr78XMk8lH4/yBLCOjJOGaEqtXflSmspLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcJUd6e2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX7uCDZV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C83jHx3310523
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FfRF4LeyJZ3
	FwFeIROUGTd7gbQBf7UNdgeI1+r4l9oI=; b=HcJUd6e2kEUVmn5Wub5jhStXnrE
	GfDtyoCfiAKW81mC+V/o3IobW7PGnZwlHgHOeF6jy8NC6D0fuYns2vuo3SWB6iwa
	6LRnC98xkWQYnonh0rtETAVwQBpe/sUgETUMW0F8sqK1gp4ybX3YXuynitZv1vYl
	AfGuFWGs1ea35bcjr/wpm7/uTbItkjUIyurXD4TlEVkjz/OC6+AEsuwHQf90BXn8
	2O8EZm1zIHI6TpLZahwmCCsGrQyV23KPE9EN2gb6bpMt67u6GGTQQbMfugcA91n1
	HKv8wBCBqaxRnaRs/mnEhoCZmHF2P2pNVRGjFKxNsaNJMk4VIdiyp5Sp2Xw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntum1w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 10:48:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-81f4cb0fdd8so619672b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 02:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768214886; x=1768819686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfRF4LeyJZ3FwFeIROUGTd7gbQBf7UNdgeI1+r4l9oI=;
        b=iX7uCDZVTVaZHN+GBRQPm2dXGUgSd+EpptqIi7gebLLE8widNISPKxKX6L3lXjhQss
         WAn17AA5U4/0B/JlP7Qmjs2PL8No8ba59ALTW/1dZD/X2Arfyob1/3WxkLBeDn/FnE8g
         mGVFFnaBZ5C/6jUuvAXTfVUcj31jj/AmCqo6tceDr1QFd5CqLIec3y+8kpqvvP1ppX5y
         iMeo0DSIFKAHMAe6NYkhzUqqDSKOR/mh8XUM+AOJdI0MUpG/CuHwhrENOE4hK8ANCfrf
         dSoDMsvcDV1SWtBSUw3oFP1OuLWl62tBN5EWc+JDHcK+l7NmjROg7+UH+uqvlx1j0/5s
         WvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214886; x=1768819686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FfRF4LeyJZ3FwFeIROUGTd7gbQBf7UNdgeI1+r4l9oI=;
        b=cLyFdoeX6sB3jpQZAJpNCQ2nqMsHiY3bwrz7sKvA7VbaZ0G9y2Nn3kx43P5jtZyvCi
         gb+Y3R9vrqUcaMAjvFV5BgBUPlAQcDvzoMco8nRrDdjEQxVh/wwy85ZXqFaIxYpFh6hs
         5HuRblGJAgF9h4mSywWKfYZeHHJAV4+tbWiLfhNtutd6G1aCqti7DaPE+iH0o6/kz0l2
         d0tGJfK/ghfgn+eAPSs90EKaY1JDoKyb454SSgyXoRMhk+XmdOgjC8Yyml63UzahIyWs
         zcTvxTQx0ms8Krg7kWc3KeR1Mi/KOpbs8sZVpToGunN6Xte65GAMzicLlu43C4Ka4ugq
         2EFg==
X-Forwarded-Encrypted: i=1; AJvYcCVwc9zXi4aDaqVqY9Hovd+r3rTiCSrXvkyZpALLIm25U+WhQgnEIbdmIN6h8UHLleQCROdi4Ymf3zOHKxoN@vger.kernel.org
X-Gm-Message-State: AOJu0YzOFBid5n/1jUlyyCOfAS0eu/26p/AhGg8GuNE0h8Aphg+cYIuD
	oBwmzrYcfkH4gmOULdNyIuypDeZfUM8aynfg59qk92K6b5VvIvDDI1745+CxLhHHNla1cbiCdMk
	/3FNFdHs/IMw9OnjMp1gTLYO9GsAwpDz4y7NhIZpbtKfN0be+5I0DS02l0IaV0YKD30Df
X-Gm-Gg: AY/fxX6iBApwIJP/OLPh6xb9reExCZe24EWxIrVMw2v7zWlt8OmHoVdmhIXkJc4TOZD
	d3rKkHka25+XntyEVER7vnV4lTpF0NDnPNlZQOTOfzSkMq9Kagu3ph3K5X1ULg1yWsSws5JWH+j
	mxKwjoTPeyYwRRu1Y3QsgWm5BJrRUlPPGauBJiS6RQrlx1QAxhvRSfIIu6ELK9gSvB3sl+WubPf
	IxJjdpIVcnrYDyKIgcuLwTMrXro+Mb/qbc4lXa/nzU1PH/+eOwDcRO/d1oQlV8AII2P65BB+Qdz
	2UUO1Kpu9S/9c5gNnh/TvUXEE/Vxn3PGKYXX3yaSG5h6WZS3dcnSLkPyLXdep/RJIrjAvsQ+N4i
	EwcBEzF563VM8p1GBZQ39JcegeijCfJMnhpwraomm2cE=
X-Received: by 2002:a05:6a00:ac0b:b0:7ff:f0c2:816e with SMTP id d2e1a72fcca58-81b7de5c2ccmr14022582b3a.28.1768214885731;
        Mon, 12 Jan 2026 02:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHocyz6/ZWprgoCOzZAnw6wT0PTlCZZY7sl6z95J5UwJxKH+JBol/vDeHwTissvdOTmIsyrFA==
X-Received: by 2002:a05:6a00:ac0b:b0:7ff:f0c2:816e with SMTP id d2e1a72fcca58-81b7de5c2ccmr14022559b3a.28.1768214885135;
        Mon, 12 Jan 2026 02:48:05 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe9b8dsm17288681b3a.22.2026.01.12.02.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:48:04 -0800 (PST)
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
Subject: [PATCH v3 05/12] soc: qcom: geni-se: Introduce helper API for attaching power domains
Date: Mon, 12 Jan 2026 16:17:15 +0530
Message-Id: <20260112104722.591521-6-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NSBTYWx0ZWRfX/cUyK18T/LRP
 DvdseTXadZjaK642nDyqEvhjoA/e+aB3KxGYxzWS47HNUJGoy0SJdOTys6agQwUsKRMw/NdU0r3
 5bqkEUmAIaKpqKC223E09yXkCHbKKmxZyOWxOBabIjAxSFpHsjVcjjx37CrnfnvFm65mgtkxGFJ
 vBhv/Jq7dlSnAi20KrUDdnEVI0s93T2N2HI0rKAkR+05xDukqoWqCNRc+CqxlkLCk08ofkYOvlV
 RK7+WCJ6rv3KM9SmtckqMi1BGUVe+eBUu1weNfuOY2KSbFpyM1KGAq/H0ikASawo1/Vd5HWE4Wn
 9M89CpWbztNsYtJNLgihqzzENtvFB7oW724Mf8YGFabEvTzS7tw2RxPujJzCshQbBDePtLIS7wV
 FhhynIr55ff8J+vOjOndnoTZHdS2ZkkUzVFDylvvvpguJ970xGIiITDTWrqNKYQTqyNjlNSzPQA
 5kLJdR9hlMQqiJ4Ny3w==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=6964d166 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WUWHbvwt6nHlCWk_UTEA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: fKc0opvPoI4Kj2ILFQRczimkqpSrUCAB
X-Proofpoint-GUID: fKc0opvPoI4Kj2ILFQRczimkqpSrUCAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120085

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
the attachment of power domains. This often leads to duplicated code
logic across different driver probe functions.

Introduce a new helper API, geni_se_domain_attach(), to centralize
the logic for attaching "power" and "perf" domains to the GENI SE
device.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c  | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 3341bc98df09..b8e5066d4881 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
@@ -1092,6 +1093,34 @@ int geni_se_resources_activate(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_activate);
 
+/**
+ * geni_se_domain_attach() - Attach power domains to a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function attaches the necessary power domains ("power" and "perf")
+ * to the GENI Serial Engine device. It initializes `se->pd_list` with the
+ * attached domains.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_domain_attach(struct geni_se *se)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	};
+	int ret;
+
+	ret = dev_pm_domain_attach_list(se->dev,
+					&pd_data, &se->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_domain_attach);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 36a68149345c..5f75159c5531 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -64,6 +64,7 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @pd_list:		Power domain list for managing power domains
  * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
@@ -75,6 +76,7 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
 };
 
@@ -546,5 +548,7 @@ int geni_se_resources_activate(struct geni_se *se);
 int geni_se_resources_deactivate(struct geni_se *se);
 
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
+
+int geni_se_domain_attach(struct geni_se *se);
 #endif
 #endif
-- 
2.34.1


