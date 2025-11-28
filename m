Return-Path: <linux-arm-msm+bounces-83794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9F1C92640
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 16:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2163AEDD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 15:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F71527464F;
	Fri, 28 Nov 2025 15:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7+SIvSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dt1c7Lf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754213C8E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342111; cv=none; b=evkAiNjwQahfcu4KBdajR4IzEcROURoOP49zkNg41ikRK6yilRcegqoIkCLmIoVQteES+SRQ3cq3V0dm+SBEckXSq5eTame1SZ6NoZDxulEUGSxxPk+H5v05jo2g9T6GjHrbFEvB1JYzQT8GRUgB3YK76/QX6PYnBGjpUH0BITc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342111; c=relaxed/simple;
	bh=xEfRUtmqH7shVoSYTWEh+/jIlgLDvmWXykH2vAbwbU4=;
	h=From:To:Cc:Subject:Date:Message-Id; b=dKE0QStHNl5jlK1PWlUBMJnptJqPZuGY3OytkAUwRMqXLyNJHfyg7LPi/bz8DkJNLT2Mj0bhMmYjWo5Zf1dw0qMipUM6teHDW03qCp5wMqrrju1V+D4o5ub9760Gw78RRO5//yh651XiOsMT5O9twqjWNMjYePAWxe+6TBElCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7+SIvSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dt1c7Lf3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ASEjKix738392
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=y7p6yQCcke6d
	kbfGd76T3swz046SLZ5QbkD0+DxbteA=; b=R7+SIvSgiQNW28881A/JuOXei/An
	Q1tLuuIJ2WW/+W5eGC/EBcLtQ4BG60dsjVYMkxi/ERTf3le7MnaHtuA1ZNQl+/0U
	1GjbX7WABw/MtgMEphMi9DkiEZm1PTFxZs5b6omg7+J2qK/tID5ZyewY/3yePkeT
	5VqFEAPWPxIFJR4qWm09k9uTuU5BATq/t562dWbDVZtFgGZD137j3H6Tl6bPZXmm
	KXAsyABt8F7/QuDZ8yAqtbSDzudiIZe/OTtQ5t/uZQvlIq5E6eEkjaiQ7cmzqgBF
	unlDsNbJy+PXjqMVx7mfj85pDgIePyulWCeAsZwmH1TpDUe5k1LXAmCTTw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqdsfg1eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 15:01:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2954d676f9dso14749445ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 07:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764342107; x=1764946907; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7p6yQCcke6dkbfGd76T3swz046SLZ5QbkD0+DxbteA=;
        b=Dt1c7Lf3OeZp9He83jhd+cFVgY2eB0E/jPUeyW6wiErcGeCrsS4U0H2Sv3i+oquR1l
         FsmtIjdhpM1nj81CDKMMczLP8MNYZ2Eqb/z6WsSyl6+yAwE3UU6lkrh7fnaXDZmupfsl
         u29Y870Ri1baQ1mYf3wntpURVpv22KZQfVGqLp/zN1ipuMFTpkb60j8t8KNVNExjYf6R
         8mIb07J1DwULsfIZfZmpPAAf49oHR8gpUul4FWyb4hFQ+Asno7O9AtEEQbedoEJaYWRA
         yk5BXCqQgmVzDHP8jL3tUXzvXq5lrCRqmUTzriQeYGBfcfgMYWMEcLu/b/jBPWxbguKA
         2zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342107; x=1764946907;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7p6yQCcke6dkbfGd76T3swz046SLZ5QbkD0+DxbteA=;
        b=n1maV94x0hxfSXcSaZ5yMn6ll7R3pHkXhqQtNQ1p1IdsR6aep/eI6xkeB1lXxZs8FC
         mdhVhLFKe0YCzEv9Y4kibFucShZNJUHsAfjSzJHklaBg7t2+/sB9NbCF9Uf/0WoRKcux
         XAqAMmlZvOaa2kK75o49lvYcCjIbA951EgEb/2QD7/RAHZbr05glnri+gh1OEvt04K6/
         oAU//dz80vvJ8tFWB58Ax9BOpI6Ms0ffpWwBgNkL22pBvQrmeaezWsHr0HKxdyYtb3BJ
         qdV8w+1+e6IVwPJ+Oh+Ok0i27ZKSmrDEslIaW9xabAeYhZFcIbdbJtkj+y3NmVt0m00q
         9Kxg==
X-Forwarded-Encrypted: i=1; AJvYcCX5bA3E+Jhaw1DJcMKNe5YI9kmL3QIeLNtaeoYbWF4fFqTfXUPuzuhWn8UlXjwUPkC4vKcvwLUOZGL3n8/v@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtJltAowdZPjOcrURk+1Y081YGFP2KrquhNVn99ypUEbt9yGE
	pgwyhIDF7qt3Bh40La/UEtoB/3uGg0FVQp0SrZQ+76hz4wMgvmf3BTl7bWjEGW2dF7HVKmGHBnJ
	boHc4rDQ1GTIP8sQ8hPxpGQWe0d6yRkHptAXbyp9/FzHz67jwYSoYvCc7rIUBLT96EGj/
X-Gm-Gg: ASbGncto6rW+zijuvZJ+P53xhELAxwC5hs0TnEDqmaXiJesxQ8PiiSo97VFLXj3ScER
	IGCTLjlrHBBrxLqBmkjWa0QhHnwCmB1bmNrNxcNkHYzkLHIDp1nXIGuWzpDDC+zxMCCCbLJdzVb
	qoh0s9HI+iXO+M1X9WZK4e5+g4PxRKeudezZroU5KYF2BJnqa0SJoCtH6HrfWOQwm9dH56QyGqL
	yYzrz6tT3rolUgDMRS6XW8DHjOfteVaQ/x4Bj1+5WQ8quMTPT5u62MSjYqaLHNtmevU8b4DuAKb
	k1aAeZVpLtu6QmNyqHv5jwqSM00DacNsdgL5O1OMd5WGYSKmdeV4betkh/kJS/f6jyEdJNCwK8Q
	t6Yvt8luNCdKrHgDnHygarrzzbPmGq7s92Ok49HkhskI=
X-Received: by 2002:a17:902:ef50:b0:298:34b:492c with SMTP id d9443c01a7336-29bab2de50amr165713475ad.54.1764342106360;
        Fri, 28 Nov 2025 07:01:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpI/BufIbwOVwPHLz/kJYkcxerhQ6rcnfU87Bqc+reHKOFkzwqLvCM71gMvDDQnwywkhuxDQ==
X-Received: by 2002:a17:902:ef50:b0:298:34b:492c with SMTP id d9443c01a7336-29bab2de50amr165712795ad.54.1764342105618;
        Fri, 28 Nov 2025 07:01:45 -0800 (PST)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb7cf89sm48930635ad.99.2025.11.28.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:01:45 -0800 (PST)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable QoS configuration on QCS8300
Date: Fri, 28 Nov 2025 20:31:03 +0530
Message-Id: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDExMCBTYWx0ZWRfX8If9EsbhPosj
 4hPdfjdOGFpg0tlR8QkSLCQgsrnKUD9PbErym80/KQh/TuDk2CJLFFkUpW/isu0rKltQJY18Xup
 4qTqW+Z0r+UiKtouytdnDqfXCOQUiz/dFQh5wpOCF9/T1ezYdclBWHZrILRtJDyA2SU2rT/oFBq
 dDWSicl1UzDoNBJa8w/gnwMHHsdiE8X6ej79cI5KE5a1nyVpq01YDzsCTc2AfmpOw0YpkGA8tPA
 0C0JvDQIyJIUYPOIfm4dC0YSFsdat975wnY2MHdiNe6+nREoRuw1zGMZBbHRzKBIyamtht0EVBH
 be3/Z0FxLLfHbaENTFQlzMZ58maiJszYOA2qAT/DewCOAFRdA259iakN3WAgeNNXtOQiKFL77Ij
 4lFd6fzJjI0CybwomqNsIMNS03thHg==
X-Proofpoint-GUID: mXDGPaGxOqzwb9U9oPrmbmmSNCWDnfKl
X-Authority-Analysis: v=2.4 cv=Qc5rf8bv c=1 sm=1 tr=0 ts=6929b95b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=fIl7fISSXmXrEScvsbQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: mXDGPaGxOqzwb9U9oPrmbmmSNCWDnfKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280110
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series enables QoS configuration for QNOC type device which
can be found on QCS8300 platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip). 
The system may function normally without this feature. However,
enabling QoS helps optimize latency and bandwidth across subsystems
like CPU, GPU, and multimedia engines, which becomes important in
high-throughput scenarios. This is a feature aimed at performance
enhancement to improve system performance under concurrent workloads.

Odelu Kukatla (3):
  dt-bindings: interconnect: add clocks property to enable QoS on
    qcs8300
  interconnect: qcom: qcs8300: enable QoS configuration
  arm64: dts: qcom: qcs8300: Add clocks for QoS configuration

 .../interconnect/qcom,qcs8300-rpmh.yaml       |  53 ++-
 arch/arm64/boot/dts/qcom/monaco.dtsi          |   6 +
 drivers/interconnect/qcom/qcs8300.c           | 375 ++++++++++++++++++
 3 files changed, 428 insertions(+), 6 deletions(-)

-- 
2.17.1


