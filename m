Return-Path: <linux-arm-msm+bounces-87075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F91ECEB919
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 531D63028D94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55E1260565;
	Wed, 31 Dec 2025 08:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpIdT89B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLb3kEmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C863A1E9A
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170751; cv=none; b=C9XYH6zjnccKOCk2TaxMRlaxOLJJURLhqM7wf8N9eU9NXcjSmR3+mj8qodnqW72MbOfauxP9yvEkwbbPI+oJKUv9+4rNtKyVm+y36zBuAmGBxVnJkwg4Cp5uMe76fPsMbYRK07ybaT0VjwxjUG4nA8rkKeQ1Vcrvk3kzm0MrdZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170751; c=relaxed/simple;
	bh=x1EHBjIzwz6+b7ETWdXdN3+q/S85pvgXoKani4TE1ck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tUKb2rGFfnGoGq6qjTso97OWo7+sQj2eIUS79LKLlqLjp+lKaqZK/RY84aRJ6Kv1DeNX/oc+Q/mZc+m5cIGbvfehZxzg2toSpyLXIt7douVDWS7GYeydy5ZcPnR1DsIneZrQeJKMPmLksSvEZyMtyC2yQutjJM4mPhkcNCyf0/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpIdT89B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLb3kEmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV62sGW2051717
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MFEYTE/GxjSOVuQS3as0uL
	2boHMn9lXpwSOtewC/1TY=; b=QpIdT89BFLA0K8hTfPo8L4t4l8PBcJ1pbZrnvF
	0WhGtCb+Sxv/NsqkXyvz9MyRs1CjDqfyO2Ilqvdkq2wvbCDDzkKm0kj5PFnTdsvD
	P0Qlt+5cf/qLJa+d6kuDKSw5+1sar4R+vvqENUfBOki2I9EYgDlgWiH0Lc50RTHM
	iL7gQUAEoYlluKgRIQFU+8M8Q5arJR+yspWplzBBqoHwVAfg1I78Yi/BO1VFgIDj
	rloFAQbql5FCL2o00DY5jnjdi+fI9hBvvQPtbEcyvCXyUHgA+7HaAD4xkz544ysx
	3t9jmqtMhzdmraN6RENsHDsfl7cDJqSAwG8xeu4SbeWzb9mA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx748957-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:45:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab459c051so26196070a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170748; x=1767775548; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFEYTE/GxjSOVuQS3as0uL2boHMn9lXpwSOtewC/1TY=;
        b=LLb3kEmI5vrM7bWUSzZ7+2064c5bYrINzHoef53WzI0Y8NCmcb5AfGfOntZZeu8wIr
         daRdPDEUi43451sMo/m0ATCrA6oaiZHwx4x4IzmaJDLTtyDrdrHuuF39hC1rlnWR6XkA
         km3+RmSyPRjjr980UHP4ZEUWgbq8rJSXdPeiTwSnjntEJV4+2X60w/MDJU/oNG38MXFv
         irgy9vn5vIAEj+8S798oH7S/ThNtKqTXBHDODb8pcrgQb0yhERqsT8UE5fIv5xuH3bgw
         4R4TZelbMdrV/aigrvNaXQgV1pxaErXimKkE78z0lJLI+8kkCkufBOHhar0JCGsmANne
         tzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170748; x=1767775548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFEYTE/GxjSOVuQS3as0uL2boHMn9lXpwSOtewC/1TY=;
        b=gyB3DmMFuCHKV9ec272PlogP38c8YIYbFmk+4+BVetApVvYDzGqtrJeCm//nNlUKkT
         6wpPZUitftkJkmGuACTlgVjfcjsatwMbAvsMQo8DjwQRLlxgbdiuDqLDQSF80PuMPEDC
         hnUr0zSgnC2pDZEaLZKjL99LdbW4+UAQS2wXCfxSc1KazzhbuJjv7+06C1YXQsWMSjGj
         VT/KEm0UG+MwswlEElhP4IaF2ct4Q2QX4FeUdEur7JFcCVvf7imFZzaklOVqv+FHiZpz
         WdvBrFVY2jnWrp3yhSVSDGYkQA4Y9RWZiKYJxo1oFXL9H2BYuOFGYnyx4dyKqZa6UmqH
         AhLA==
X-Forwarded-Encrypted: i=1; AJvYcCXW9vwbmlY7VpwQrcVP2f5Istbv+t3JjNaNbyzZiQObvIDuwcYtTxXe1xuLJA93Npg/pVTne/Xk5Ho8muuy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc0Z0SWKiwqraQ0DjoPwiMD4aq+m7u091lZ13bfveofIvctwlN
	jglq9zizvJJfF5DA438joR0q+g9OBmpKj4LGOycrLJRDON9DfwB3kTBDUi8iTrsAwlaabceE0oH
	I55bvhqkKVZurVxkVyR+xO/dRjlyf8KrJY2u8mDiy1QBmy0VQImiwFtl5rZ6ktTb8X0t5
X-Gm-Gg: AY/fxX6a49aN2zVZP/v1i3IuMk/ca8RiSHuiSenAW9MMixmzK/XkUv6AhyWJuGl122R
	Nkqag9S0tyKsBvtiWQ0VV8s3+132dnf1aRvMIWoYD7FOMhJ07txYiUrWTrOrdn+ooShHSZ0bImi
	7JGsqL5h6jPe5FSkW6AO6twDdIXSLVfUn9UKBGl45CTnzff9NxjJnXrAQzmKNEXJ/owfY1H5rv2
	/ScTEIntrXc95y1lZ6X1ySV1qFLSjZbK2wRIevi9XTNcltjBz1C+iC7i/bcII6nkNyQm8GeHmbB
	cScHlE2r77GItvAy9VU3qxtGBy5gqg7CXUwKX+UXiGnPn7PqghSOI+VaQr7XRRjGS/OfKcU13Oi
	x2Vclm6OhIhcBHqK9DIdp0w0KuvIalwI4BA==
X-Received: by 2002:a05:6a21:3291:b0:35e:bfe5:ee75 with SMTP id adf61e73a8af0-376a9ae285bmr39028277637.58.1767170747870;
        Wed, 31 Dec 2025 00:45:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfi7hggK7K0LhHxYNFjHNyK3XdM3xPE2W+C3PkYHaylR1lJfzZ8FdD1ailUb0AqWEEj51F6A==
X-Received: by 2002:a05:6a21:3291:b0:35e:bfe5:ee75 with SMTP id adf61e73a8af0-376a9ae285bmr39028246637.58.1767170747391;
        Wed, 31 Dec 2025 00:45:47 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:45:47 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v6 0/8] Support for Adreno 612 GPU - Respin
Date: Wed, 31 Dec 2025 14:15:21 +0530
Message-Id: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKHiVGkC/3XOzW6DMAwH8FdBOS/ICU6AnvYe0w75XCOtUBIab
 ap496V0Uis2LrH+lv1zriS5GFwih+pKosshhXEoQb5UxBzV8OFosCUTDlwwYIJOJslS0jkMlFN
 nUWiwTvd9R8rOOTofvlbv7f2eo5suhZ3vTaJVctSMp1OYD1WWNetpNJzcho8hzWP8Xv+S2Tr9e
 7bdnM2MAgWtFKLvoAfxOqZUTxf1eZPr8qxg5g+EwR+EF0Rx2xr02ksnd5DmCeF8izQF6T1aNF3
 rBbM7CD4QDrhFsCBeKAAjtJSN30HEE8LlFhEFaQTaTqIEY/Q/yLIsP5dGA53yAQAA
X-Change-ID: 20251015-qcs615-spin-2-ed45b0deb998
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Zhang <quic_jiezh@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=4625;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=x1EHBjIzwz6+b7ETWdXdN3+q/S85pvgXoKani4TE1ck=;
 b=YVYbe8IVZuknEabOiYxRhWuiMUzDjteF5Dp30vZj9Dk56WBSrYoi3CkatOGpGNBU49+OiVnAJ
 jZbTklFvNw7C+1JLHtPCUW7UsjOQESsJrkuxMiG/vC+mdrF2IL/vEMB
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: XuudzMAUpQSGpgZWyOV4KjWU08lCZON-
X-Proofpoint-GUID: XuudzMAUpQSGpgZWyOV4KjWU08lCZON-
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6954e2bc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=nlYtN0jpdUqXxw8MpYQA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX45H9UrX62+IP
 oYYN345o6+ipNEA0pi0cE/P6hL91DClwouIrg+IPAgCQwOQu4ZnN2SsSHfkKKZCo2lVCSRPXC9N
 XcwFGZ496b3R7FGEvFTWG1Ms3n8nkETmFpivZNtwSHZj71/o+WsvjJuxw9YEzU3BQ6Njl1chgum
 DUinfmYtMIj7FakrO8vbNCK9nyVvzMHChZ3UfWEjiBX8y5plaZyCuc899UK7TWfSlM2QTrk6WGJ
 e2GHfufhlPRyo1xGwiL2/OFb8K3cKXHvQEwEID4qEMEezOtwjlfbyR13Ocgiy6YSsXvksc2MK07
 d+OOduK9kpQr/8HTV5V6PUyfmyksqiRTs8i49MVVzc7dqIR781zB1Qn0hz9YBj7DahYuNW0Txlp
 vvJSzR9QrJuNtJcJd4Yrv5wy7F7wu4nAnO8WDWzjZ1SLcoH5UUdZo8teOQ2+Dhuppko6Fk24AMO
 wMruvhTqT1yCGuw4NsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310075

This is a respin of an old series [1] that aimed to add support for
Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
have consolidated the previously separate series for DT and driver
support, along with some significant rework.

Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
down version of A615 GPU. A612 has a new IP called Reduced Graphics
Management Unit or RGMU, a small state machine which helps to toggle
GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
full-fledged GMU, the RGMU does not support features such as clock
control, resource voting via RPMh, HFI etc. Therefore, we require linux
clock driver support similar to gmu-wrapper implementations to control
gpu core clock and GX GDSC.

In this series, the description of RGMU hardware in devicetree is more
complete than in previous version. However, the RGMU core is not
initialized from the driver as there is currently no need for it. We do
perform a dummy load of RGMU firmware (now available in linux-firmware)
to ensure that enabling RGMU core in the future won't break backward
compatibility for users.

Due to significant changes compared to the old series, all R-b tags have
been dropped. Please review with fresh eyes.

Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.

[1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
    Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v6:
- Move the rgmu register range update from patch#8 to patch#6.
- Capture trailers
- Link to v5: https://lore.kernel.org/r/20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com

Changes in v5:
- Rebase on v6.19-rc2
- Make the reg list in A612 GPU's binding doc stricter (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com

Changes in v4:
- Rebased on top of next-20251204 tag
- Added a new patch to simplify gpu dt schema (Krzysztof)
- Added a new patch for GPU cooling support (Gaurav)
- Updated the gpu/gmu register range in DT to be more accurate
- Remove 290Mhz corner for GPU as that is not present in downstream
- Link to v3: https://lore.kernel.org/r/20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com

Changes in v3:
- Rebased on top of next-20251121 tag
- Drop a612 driver support patch as it got picked up
- Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
- Remove reg-names property for rgmu node (Krzysztof)
- Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
- Describe cx_mem and cx_dgc register ranges (Krzysztof)
- A new patch to retrieve gmu core reg resource by id
- Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com

Changes in v2:
- Rebased on next-20251105
- Fix hwcg configuration (Dan)
- Reuse a few gmu-wrapper routines (Konrad)
- Split out rgmu dt schema (Krzysztof/Dmitry)
- Fixes for GPU dt binding doc (Krzysztof)
- Removed VDD_CX from rgmu dt node. Will post a separate series to
address the gpucc changes (Konrad)
- Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
- Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com

---
Akhil P Oommen (3):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU

Gaurav Kohli (1):
      arm64: dts: qcom: talos: Add GPU cooling

Jie Zhang (3):
      dt-bindings: display/msm/rgmu: Document A612 RGMU
      arm64: dts: qcom: talos: Add gpu and rgmu nodes
      arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU

Qingqing Zhou (1):
      arm64: dts: qcom: talos: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |  89 +++++++++---
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 +++++++++++++++++
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 149 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
 6 files changed, 357 insertions(+), 30 deletions(-)
---
base-commit: 2408853dde584f01950a0f976b743739cce30eca
change-id: 20251015-qcs615-spin-2-ed45b0deb998

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


