Return-Path: <linux-arm-msm+bounces-85027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67919CB57CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 11:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A65D1300BDA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 10:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578092FFDE0;
	Thu, 11 Dec 2025 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ye5GemAu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FoKPvWrz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548DC2FFDF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765448259; cv=none; b=OyS5iUKimfOH5LFbJa4aIb4uY8j0AuQmx58rn544ILtApO1GYNTBOTwq1OnwO3eo/P9CN3nCyv+ZUuigAnerobFDbtInUDZd3SgiaBW5RglHutMmpR2zKlDARUTvhzH8FTc8zhB/4k7i3RUZuLlBemVdDizB5DegGzRctKaB5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765448259; c=relaxed/simple;
	bh=5O6EH5DVR59pp+DlTUQCdF0vmA2VG+e9rZqfOU5g5AY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I1rkFoyHlwq/jzJ00NAJ/oHkrrC0ED6O1Mx6una7EZa/rvf3n3x/3aBvhd+HjDVvpgX6M7YZyeqjEVQfYJesz+147paeVjO33LJKWnBmScws4tWRYNN7be1hnxZRvpWuQ24WwqB+oSRThDpJE6GcwxiDeVoBF0mEtYWhJuzrssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ye5GemAu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FoKPvWrz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB9ZOXP1469760
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQM+beAzq0/PR9/1IAhbmxN4dIeCVyZh+8gDQ306rQ4=; b=Ye5GemAuJ9/jk06j
	FzzLn7WgNib1AB4Ivw3JYeosNsHgoHuT/yfM6XHI+FWoQfFp/vFuR8EEkCQIspnN
	jNEbrlpyJSUWEM7Hg+FA3aBH+IZLnltOkJpjrwri1tA5ABwXjNcX5eUgGvU2TJ7w
	dgHeuaqI/IUsHG3zG7lE2HIowTCtezu5RAUUV+/N2QvYDFQ9AYBthAWAp0wlilHn
	UGSlm1q0b9FT4fdY3QaMI8JNugIHjo0+l4Il6ySoNKaC0YUUOU8UWsSDwOCw5HB6
	9R22mWJpngeWAtGiKrcRc1wp+7uEjcR+ecMf52JGOmid+MqQS2vXlcHSomscPvjN
	IaXUmw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhpb64y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 10:17:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09693109so16281641cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 02:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765448255; x=1766053055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQM+beAzq0/PR9/1IAhbmxN4dIeCVyZh+8gDQ306rQ4=;
        b=FoKPvWrzsTmJGBvBSo33VS2EBMqojkIG5abV7+b6WgdjycM3mOklTit5agwKL1dQpK
         roncO3t/5TYGYVi/xCDOeuklBzspInE6EVonLPnJyZiEP2Rihi/tYWto7RdEKVje9D9v
         iCpFA5xdXx+QVzESsOx6YbjVTVQHB/3iVdPBfoDFtNomqOcHQIyDlYh/8nvBF/vsqdR4
         bEscW2nkRahAzdKJDXNARuucIHSGus2ZEIudMJ0IZiJgv/DLcC3WDZAt1NqclHSGVCaB
         HHKJIUt2/tjrFTYLK8HiLntTsTs5v4Zi/rGAD/OOEKvaun3a7718Z1T1vmY75Q9tjcQS
         Azrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765448255; x=1766053055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQM+beAzq0/PR9/1IAhbmxN4dIeCVyZh+8gDQ306rQ4=;
        b=BiOh4zOwiIKnXR7WSuawK3Bsc2/wujqt6Yezl7Q97T6HVQN+L5kqNVH2+z1+etxnRn
         I9Cx3Bpswk6ve3WU25CUMIRTm3XWct05tHPxMgNz5JwhYmTYgAzZZeP8jcjepfiEUdrQ
         DZiaKCGF25PrqBr6h8TCOhh3hvJT6L/6zFCggZN/Yb9QOYWvjAAC4el0xIJcr0ZQU6aJ
         jO+QSTF3tGGJ4bkYdQ1b7qqz+o3RGP6TqZ/nSHYLSedzXWp0t5mkB1eNGiYZ6rCu3PIO
         2HRaOOB+ZPAfVHzb+N3Nn0i9jCFVXc6iFHoJlM9ord1MASlgVdTzfbd4oi5a0Fdvvy4u
         bZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3bsmuMAlUX238/i9PqdWTStA9DBHNYNXClVP989+vqZkVEib8sdP480nve7LPjiJNNZ5JQyfG0TP7nOqV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAabkLWlx8cpXTDtoFlUjBj3XXbXhrFYEXmO7KH0208n8nc1ue
	DHIh2oMhqN4mfsQZPqGIuUN22RjUFDIsfpNf53Cd6cPqcwpQZaqXvrb9B6UtDMC5GB1au3DjJjG
	46aA+A1fAIusflHn6nfEq4q2K0Y4tdIQ9+lNMXdrw6VoDcxgXIp+d1kHxIG1XoOltgCq5
X-Gm-Gg: AY/fxX4rVcEHEcvyzKFA5y7q0KJI7YJVvQ5h5wUnJQs6Z0U2RkEF8O80pAkSVMSizYN
	je5CyoZqCvYXuvJD1Bai5LnND9/llGCJDNS+phw3jMZd7nEZYVxvJAdcihUWw7ZcELjFQ42neuz
	mdeoOy9Vj2wab1Sic3RfoGdZOPW81RicvYEzcTEsVeZ/Hqms5cPg6Rb1y75kn+I1dkIyE/0CplM
	OFJQSmcBvKbGtOYMla81ofTWF8NthP4yR6RF/FAX/1HHJAZDvbXXuU8vc0eO9ct3Tmq/s1PeF3b
	Q11sf1Yb8cWl/xmGlw91dwzErkePYsx1DLVzweXyUJpS/IOXlkvTaNCJg1s+RzIOJDpt3zwbRq1
	9rm/+bmV4YQPf5lk=
X-Received: by 2002:a05:622a:4c12:b0:4ed:67ea:1e5d with SMTP id d75a77b69052e-4f1b1aca8d2mr79837011cf.53.1765448255406;
        Thu, 11 Dec 2025 02:17:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhD02uI6mM+u3czMWURWU+Rf8X0X6cahpz7x7+b6jAm0cqjI776Kjkc4GRHr8s2czxtBq7lA==
X-Received: by 2002:a05:622a:4c12:b0:4ed:67ea:1e5d with SMTP id d75a77b69052e-4f1b1aca8d2mr79836771cf.53.1765448254970;
        Thu, 11 Dec 2025 02:17:34 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5191efsm225381766b.40.2025.12.11.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 02:17:34 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 12:17:23 +0200
Subject: [PATCH v6 2/4] phy: qcom: edp: Fix the DP_PHY_AUX_CFG registers
 count
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-phy-qcom-edp-add-glymur-support-v6-2-5be5b32762b5@oss.qualcomm.com>
References: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
In-Reply-To: <20251211-phy-qcom-edp-add-glymur-support-v6-0-5be5b32762b5@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=z/5gvRTWmoFviOJ7wu81OY1UNYIgxJ8SEI5ecSWoHm0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpOpo2dof+aL3rnK2jdg73vC/yentnjZqhl8hiI
 FDLBJ65lVaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaTqaNgAKCRAbX0TJAJUV
 VlguD/9LaKBZT1psoiQmykvCq3WkPzD4uhm/rHiBdU2h9d4OVfCJTW63LDiDppII9DyyXkfIkZp
 ODAbhKK4yzE+qTFZ7kQj/qymVUomu4rmzaTUzPZeD4hsNPtdG2/JBXA+Fr6pFnJepMgPUEIgb8e
 s51Qo47DKUm8h4lX69LeG4ul6grBGFEmQ6NPAz1BkZoSV+KX/bOtN84Sw8dL9NfJEpklxy5C9U8
 k8Ph4ReAdbhOmHnkRulkLC+TJ/N9JI31IsrENWIBvzzv9N1usdYWsKV9VMJPOXBeAsgMZxV5p1L
 GGndflrYjW933j6v8sAvO1Ubm3Psssc8rR5vyWMfc3u8fX9h/ad9HY/Sta5z/VbxB26Z5KZr82y
 b+0Jm/KOX7OqZenUYbgvbJtV/Fo6eNnQyjvs4dsSMIyTVjviNsTtxkyZpKEdMa/IcAeGL2pwN3z
 4k6HwpP6bWdMBAvssohB6BxczNMqNl0gXg6z7t3lcUOEYboNjARUsFnjimREhuMnDvOms2M/1ja
 4OAGQ7jDTZAPefr8DAlSEaGiQCA/SfMT6ZvGCY/sVLMeHNg5hOwQbqq0Uz/Mjw2Xmn6PesQIO9w
 Qeb7xzLxoiNlPq2kYyMBOE7pE/Th+ilqYNfASJJtlG3rWHI0X9RLq4si0zLdTPc8w1t6kJ0odTr
 cpgHdkqvHAqWnEg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA3OCBTYWx0ZWRfXxX9od7KumQ8U
 mJu8YqO11LS4Tc//0K4kNCJVvW3kVeg67ACXiEcj3JGajUUTJHJHU9kR0BuyKERaSFs+fzuqAV2
 V0a8VHc74ONOJAALeCBYJ7ubZ3fkOWYV1OK3+yvFuAVM6V65ktwRmDyzRwmZs7rlq8G/SyrBEol
 m7bL6NMO8GgkzcYi+MGYKkMo9tSpxCTqucIKPw12A9j1C6/WTtjreAVpYuLEKcco2jCzB2bJssX
 LW5qrTP4FbU58X6/lAMVJhxcYprdHZcm4jcqaM8eb/+OkxnWwqIuS64fcVs9ddChHOCqmMYQdlW
 lfl7CTkk3rLHuzKhgZ6IqykySYEM0ZlS/N5zuDkT2Vxa8jl30XZaEKVCaBnu1jrCnwNoTKr/wEn
 I+Pp2M1dIhxdDj/e8ddsMO8Yx6rjUw==
X-Proofpoint-ORIG-GUID: PLrDNwTkRxRV6VusrKYCFriR3hL7UtF3
X-Proofpoint-GUID: PLrDNwTkRxRV6VusrKYCFriR3hL7UtF3
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=693a9a40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EnfBGAjIh6IkBJmaZGcA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110078

From: Abel Vesa <abel.vesa@linaro.org>

On all platforms supported by this driver, there are 13 DP_PHY_AUX_CFGx
registers. This hasn't been an issue so far on currently supported
platforms, because the init sequence never spanned beyond DP_PHY_AUX_CFG9.

However, on the new upcoming Glymur platform, these are updated along
with the rest of the init sequence.

So update the size of the array holding the config to 13.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 06a08c9ea0f7..f98fe83de42e 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -32,7 +32,7 @@
 #define DP_PHY_PD_CTL                           0x001c
 #define DP_PHY_MODE                             0x0020
 
-#define DP_AUX_CFG_SIZE                         10
+#define DP_AUX_CFG_SIZE                         13
 #define DP_PHY_AUX_CFG(n)                       (0x24 + (0x04 * (n)))
 
 #define DP_PHY_AUX_INTERRUPT_MASK		0x0058

-- 
2.48.1


