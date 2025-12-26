Return-Path: <linux-arm-msm+bounces-86666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6E1CDEE99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A473B300C0F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615DA283FDB;
	Fri, 26 Dec 2025 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZS2uxvuP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kL6l1rRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEA028725C
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773856; cv=none; b=JbvY3FsXBcMfcqVyvhgqsXpgP9i4NKrPEJwCjTIhi3+fAPGqQBX492xQ7pgWj3c3GU8dSIO+atUq8JIYxhvLGRa1KBGs5vyAGf9Qz7FEdp4dWhg2aB9cQ45kHIJUHc48K8zzzFsVn3RT+US8JwS5BNpL1qCqfn93AKKBdHuMII8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773856; c=relaxed/simple;
	bh=a83xXodd7cBQBZtIVL4BfHsn2syK66CfRKrb3SuBQGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RpwA6mrCg57ZGS4xu3OncSh9zEqyv5W0q6iFhlW9y3E9isgimvAyyusvAJcrggc+RFpv51jiTFanrnooV9HUeNp2OlEHrcvxPOediQCsvZN/FNOTKK5RUxF/xFC02gS80vFdoS106oaOW4RVcR2dwLG54Xj5CsRSJ8NG50WNmaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZS2uxvuP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kL6l1rRG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bkqf1281045
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RhnGzHB7RJ4bB614S9CKPMqT7/ALI4I5qiLyceTZ9Q=; b=ZS2uxvuP4f2qblcT
	irCe/kbwueqooKiyfXxyE+NnHEHCjERNh4OxYdv+9ngOmwjSzB997qvTuaw34mRP
	qBSfxq0cSfA+EFppmxvkYN+BUz72D/hGESnkqrgoWeXyABT6kNyFGEdoNEwRDhZ0
	5ahk20k2T8NOD5gRfYQ5X9yvCqdne7Tly9JQ4oBJjNHpU6XOmq1PoPelnFTX391t
	dBA43Kk8/acR+Hsfj3bXWQsRfel5BXqS2E1bGizkoIBrjgl4fznHGdWYuSO7vHSZ
	FNrlaQPRgPPgSVZMfQB/HMBL5jdLFwJTZWzGU8a14TxsI0LHvP+vVgllIo53w/K4
	K8Ykjg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8p4946vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c66cb671fso10810482a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773852; x=1767378652; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8RhnGzHB7RJ4bB614S9CKPMqT7/ALI4I5qiLyceTZ9Q=;
        b=kL6l1rRGmgXCXPWUh9zKAkZr/Qr6yKEp/FLu7GQX9H1Awtb3RVUnTsrxX4dz6n/aRo
         ouL2rySOy7iaYtSkCNlq89lQgNxazmCjHSzjZkbhpaixD5kSnBHWMXt28fExSm/Sn59N
         3lw3fQHOZY0sD1UwW6FPb8YVjHvEYnpd2F+HjJNyH/lmORSR7qudn5/TXdLlr2UYoZ9U
         iClAhvrbEAywsVUJbafrccsZm7Y+COetKOrLJVibx2Llb4jz0SJkXM9xFlh/42wePFdg
         S5N3ZtYiTqwE5HTCDD2k8N8ibN167qFxOVlTYOgx518K4E0XU1HmsBULVq7byP7yfGbl
         Hi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773852; x=1767378652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8RhnGzHB7RJ4bB614S9CKPMqT7/ALI4I5qiLyceTZ9Q=;
        b=byJjAzYP6jst/cXJC4ySKDN6AOuOEvBgGFx6ff7f7tQfUBCNHc2hmcouCoXO9LSqKw
         AeCkhPITCThv//+OUrhbj/eGt1vV0CY6XaRnCsYRa9xmorEJRMkLz9Pw+114v6awyMRV
         5281m8dpX430wO0LHnsdDcPxQ1s1/lCMo7lmgvZg49MI9HNZuX42cLoKpV+rIb6F8Bux
         nH0DY806Dq1+VH4SVTF+Wn1cMAx8/Xf0/eS2mxZSRfvxhvFBneVRm6s9PTZa+m2nTXyq
         U53og5KUh9eR5C/kM81enOpRrda8rZW1ns246DfEEjBrOQvWlLAI8DmB361HUi5QfJMh
         /DNw==
X-Forwarded-Encrypted: i=1; AJvYcCXLRzulv0nSvTjwSyQJ96CVvOFJ9cKc892EPxcmnCeI3Et59dFnco8iqq8sFFhcOQvjW7gk74vJ4ATxqf7d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0wtQ91SSifDu/iEqHLJZG11h/EEnRi2EcVk+7mzxe1F4yUve
	aiOYeKkz9YLBw2NEl3fcMIuJLlk7VbR+S606POFTg6ylXxV6X79kATWpiJGXeE5uWhWlGIQ4OE/
	kmclXAcFfdclVE4Y+qcesjoOj24fcoN8Zm7ACiMCtivR3iqwohd/uql4A7RdZlpz02ePn
X-Gm-Gg: AY/fxX4ptLIaPwXRd5bmMKZbBfvDpyd2Hse7BEO+We9sI1+6INNdtWJvsMzBP+6ACnN
	gxuUcy6czy+lQlqkUsN9oyGQhan5qj38jhloU9bNXnfQAO07IwOYcwEagRxCOXwQSwpMwa1uTK5
	tQcx0jsxYCPLzY0qHk70I6dR33dFBHRY1qFeExS11Y8/tAe67AxCVpWqS8vsfmTZL+QkYWRyhzV
	k4DyBAqvQPGywEWa/oWA1JwJqtBY5yUyH/toi8M+4oYBO/vQHbzIjeeSqH6WHmttFSqBfk/cyOj
	HG45GwI9oD/k83WJSauwaI3hNL9iInlAuLaO+kdNlulqdPh0btritDLBVj9lOHJNNO4snodcqwJ
	SyQW/9LIQJfSGdw9qXv7pK502BDnzCFqEcA==
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id 98e67ed59e1d1-34e91f6c085mr19801647a91.0.1766773850782;
        Fri, 26 Dec 2025 10:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuwjIqyDWuI+r2WlpfAbbgG2oxlpEzL73qXhhMKw/l97gOTuAUXO09Ln29/6XAmvuB+4ilaA==
X-Received: by 2002:a17:90b:580e:b0:340:c179:365a with SMTP id 98e67ed59e1d1-34e91f6c085mr19801617a91.0.1766773850138;
        Fri, 26 Dec 2025 10:30:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:49 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:40 +0530
Subject: [PATCH v5 7/8] arm64: dts: qcom: talos: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251226-qcs615-spin-2-v5-7-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1502;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=isrCbYef/6HFfpXGHUTvGk7T72MJmXAEG9GHusZsKeY=;
 b=LAosJ33LUhMphFS/+u4ua5QWG/JDH0yjTyYB4Gu6cM8FE/UtAWqcsub05PaeFqq2Jr45a0p+r
 WEStuAZ7EHeCIkBFaLtoV2akoBfgfX9BsdSbUHrJONUd5WK0vovJIaJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: ZEgCCVqihXh3FahYyD18HZpaVNxH4Dyd
X-Authority-Analysis: v=2.4 cv=esbSD4pX c=1 sm=1 tr=0 ts=694ed45c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX+RQn3cFyuGW3
 qrMaoHYsSQJ2phR+/UK1hmKb7zem4YsPlYaBr68RkYRf5AMrRH1/cJSpwbaafdltcZYKOS8HkXD
 45+TIgJAYBYRpMf1ny0fWk00ro0d7438mXfeKx7kCBMpHOba7PjJGMs1QVkDnpk5RNETkJeMseB
 wllSIs0c40nIglC/fB/eBlgeR/lEkHzMmCYxs5VIR5aM9xvamidp8EgzfU4rracBIb2KvgBfrah
 7uRqjXSrAwkIj+QE2yI9STDW9M106IAX8ItMQMJaLR551qIMMiN6JK0rfB+cEt3Y6hz95enU+6e
 io8DwasVRFDCqEYkjTnqRMVueU4Rd6r+iVTIRRFznYb1FKzpu8Cr+Czc7x+Aezd+3S+U1kUSm46
 fUUJ/65Iaj67daJrlOBvE7BQV5r1RK8A2FFO8dNB8JoE4VZK5KDylw1IV3giyraGapjNDdVEPsW
 k2U/hq98rw2kig+Utcw==
X-Proofpoint-GUID: ZEgCCVqihXh3FahYyD18HZpaVNxH4Dyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260173

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index effaff88df83d5e6a0aab45a2732a00cae11e83e..7c2866122f9a13b8572fd9e6fa9d336176765000 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0


