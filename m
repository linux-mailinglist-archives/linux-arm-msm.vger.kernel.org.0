Return-Path: <linux-arm-msm+bounces-85807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4ECCF410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1AF4A300DCC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315472FFDE2;
	Fri, 19 Dec 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E7jzZvwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEhpllWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B075A2FF172
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138449; cv=none; b=rgdAPaK3vonJ6b7OY0nqd01Kgpg3JrmT7UDh2bAoyptX/Mr4tatY81UpvbF1YVF4oPPFEN/60eEBXTc950LadsGw4MXezdX2GjLBQmdQ7JuXGzIxAX6JTvRv8DVObaZXf9ezgS0vC4kEG5QwReY+9G4rpfc1cqEQEf4VkbOuhHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138449; c=relaxed/simple;
	bh=4bgDkVYSDf+mCL/aiwD13RmIZiwZvfBqyTz1lPIq+Xg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vCO4Sgiw4iLkgZlODFUmL5tU+nIP1mnfXBD8lwyiTQeuErNwP3rxvsaMcT3e3XHoe3FxCpPnWakuWJfvAz8Rp04WmuWlhQJCuOFYGdol/5hLEyUuaNmyh2BRhG9t/UB2y0OAh8g4q/EfDWuXiJBJf91fYAeaGKmSo33k9BVDiXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7jzZvwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEhpllWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4chxF1772205
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e0za8BNKqLGjvOJYG5NfJu
	RtnG/FoQHOtsNF/PUnHec=; b=E7jzZvwi5nle/DGd/JD8fthmn0pQil5grjIICK
	ipBtNOt2w+QQb6ec5vQMTb71I23a7u4XVsZ56/RQiqBwZhbuWAYuT+qAk4ICF6tw
	FhSPXemO6FSFLO/tTp0LWC39sB5YcoM0C/D15gpBPAD1BzjpgF7eYnpGohj2o/0X
	AdMBEvlba7wSHto4LzYbSNKHWNLeTD8k3R8LD3nCiLxoxZ6lxHPJFFbmtVwojzAJ
	fL/GszpOCcHEp4texAm0xJlrHU+adLS+VntJEmoGC6VNuRZsUlkdANWUzIE+jVDQ
	H2gbjUVOhNuVXGM2WSee5VVNwlBnX2KddjRKdFGvZrC2l6hA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bj7mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 10:00:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edaf9e48ecso38529021cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138446; x=1766743246; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0za8BNKqLGjvOJYG5NfJuRtnG/FoQHOtsNF/PUnHec=;
        b=GEhpllWyi3oEm8zAtalejxtVL6ia1TCfvE/jmD7oC2hzR+4w8qglAG4nSXMlPWQgiP
         PlD3o77uYiwuBy1PuYeC222Q1IA/iiv85D3dtK7/F3Hwgp9ZpLMvg1Vd/A9qkozPaEcU
         a+o8SL0ufJNrVXRVHy3QeGjycvXKfQzquO/W6sqzWewTqSjJYqHgku02c3sG11LWYDKF
         IzM5ggWZ44pEQ50r79WusZ+vuPxRxCMxRYmWuassrUvD7fY4ABdAVg+Eu8+g1pADyAVs
         kVXBczIoP7LKCwo1vP/fm+mdJWb7dfMf9W4IBX/oI7P3PMBjCJ2kZDr8Z9xZHrwojeex
         dumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138446; x=1766743246;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0za8BNKqLGjvOJYG5NfJuRtnG/FoQHOtsNF/PUnHec=;
        b=XvuoC72g/1jCx9slMNqLu5yBnObcFaoAejKoeXhG2eeiSnmBhJXTI0RpvBCjyEFpKT
         KFOpr3k4/5e8UWh1991KgXU60lJeAo9YDRqPQb0pDDjdiUKwp5rEaKSRhqqJHKKsgX8t
         kRB3BjAUrxAkFVOzvaN4Ch5+9oVcODOCjQdsslRN/Zg5Dh5jD/mG07sM4AQLX9oJw1Me
         sN45QYagTTWfLXQcC4QVTYYnH7OU9nITqNHCxdlLzmmBiHYnuPabAgPZtnFjuRW8fCxb
         i6bUZcq5zYgqCWUk4E9p0VNLFZcb+yMsAzSqZ+RbrmvhPqq8OlklnAtF+ZN+KmKjxxsK
         PWvw==
X-Forwarded-Encrypted: i=1; AJvYcCX0csIW1FYhWAk5Kj7OOi7O93FxJ3dH3wNo6KDdLvS9yFbWo/YZPwyYLE1wRlcG3VlJv3J3uuCQzrjQPxAd@vger.kernel.org
X-Gm-Message-State: AOJu0YwNwGk5Kkm3kRrsHLP9ZPYMQ2e5AdvCNk6EPY82lbncal7gegol
	vCwD2WKZ1E00QWiyR7cYw+MuNhWBJV2Id4cixO+v2+M9+MQQKfF6kTKQgmMyaYiNLis1mmsFHBQ
	bAjKvTkKmkpf9m8Td28Wu+VbEQmTqhGYN3p9ypaSy7rBA1X4h6P5C8WexwcJ5IE4hZG0b
X-Gm-Gg: AY/fxX6GS/Wp1bBBBZSnu2RfKGeSr0sY5cYdUDUXpNJ1hggpNXtQWKNMzBXeN78gzGI
	ltEyPqpmZokvSdc9b+f6MxuBLlTs+ZlyrygqCnpLH2B5V5LxwBC+1H44aIoBXqLk8UPHDDuqn0B
	waPbf2ncXypv+isUGav26L1kHGCYLuozcKNgzRSUhorXcGgsf+bU+PhAlZwmymwaxKg42XrbquX
	XvnbsKMOopWos3Cfzzp8tHSJYr0qyhNlhme2e0ZdSwDu2kZ7gR5J9Mf/mBB5nuYRXws8OdJzgh4
	u/+hm79fXADf3D1LEQlmL49VzxjtQr/bQ0tczbPyztxkObZdFhE5oWzpmCpT8lpwbozq4K1mxmS
	ZJ1cnqWbIhVgUFzc=
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr29148141cf.78.1766138444629;
        Fri, 19 Dec 2025 02:00:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMEzgBPNYPypky0FKLG30q9xd8waDg8Jmm/LVsdeeXFNIa7i6lLOX1qI9z4JmxxL71b6vkmg==
X-Received: by 2002:a05:622a:59c5:b0:4ed:b25e:a721 with SMTP id d75a77b69052e-4f4abdc97efmr29147451cf.78.1766138444065;
        Fri, 19 Dec 2025 02:00:44 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm4106563f8f.22.2025.12.19.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:00:43 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1e80100: Enable APSS watchdog in
 EL2
Date: Fri, 19 Dec 2025 12:00:27 +0200
Message-Id: <20251219-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v2-0-fdfc6ba663e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADsiRWkC/52OwQ6CMBBEf4X07JK2QQRP/ofhUNpFasBCtyCG8
 O8W/AMvk7zM7MyujNBbJHZNVuZxtmTdK4I8JUy36vVAsCYyk1yehRQZKN/nGZhAMGrXwyKw4IJ
 zwE6CMgbUQARvEwB5plWuy7LhDYt1g8fGLsfUvfoxTfUTddj790RrKTj/OX6ZxZ77Y3YWwKHMM
 Pp1oWu83BxROk6qi3d9GoVV27Z9Aeen2jb5AAAA
X-Change-ID: 20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-e04ca6c99f0f
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4bgDkVYSDf+mCL/aiwD13RmIZiwZvfBqyTz1lPIq+Xg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRSJAX6hsZI2L1ofc208nUHKeXl5VpbhfhgUJY
 i9MjPbWCceJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUiQAAKCRAbX0TJAJUV
 Vq/8EACNtRFG6CtntzAOTPkTHfIFxalfc4DJ2U14MwrF2lw/k8d/PJ8JfWzcm7wbBUiIMs0iX37
 TZkYA3sruMgqqEN2ykIyiD3JFfXFHfdjg7+xz92+BdkCjIFCk5bxOpRNIP/HcvnNXWx90Bb1Zls
 cdii/vbrSasuSQ552xwN0E6qS+1S9oPzWI4G+sfbEI/xabOUx5A+EkA1G/xVdbJll54Oc33bOJF
 3wdpR7m4i6G/m9OHHqI2guMsjuwW/fJucyd1taxy8Wy4zzqR6GtMwMNxg3AtEU7qR9MbiI6+qg5
 pZBlN9cgWHEwl/00SOSPPBcrrbGxqy1s8zSBpMHnOSR+dADs5LCGbQqvFJALH/7vXe6U3fPWt0J
 z2LX0RgP36svaLq2VWJnrB3Sf0KZKtvnsrEeEvRW1Z39c8t6juJgoNsjUDVsB18U0HGWq8kBAur
 FDWxsxU+5J8BCatDrhhz2eiSIAt0n8WPQ4pwd601pp7CU6LDdK5cBCs9+RMYVTGIoREdboFJqpj
 nUgX5PmGozhWN/+NudVBAKijS4gP0XbodX3pWm0G4VFfBNn/6cWD7c6TjrpdCQop4kPPEUkImMg
 flH7bEUqLeNqu29DL35j/2yBXmjUQqQOS2XYC/gSaonQ/g6jH/Fp5VsbRQn/LQv67Ld+Vng8HDk
 MivpkejVLgQsX2Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 95Nds2dPuRj4YBqrTupoCKUgGiSNFt4C
X-Proofpoint-ORIG-GUID: 95Nds2dPuRj4YBqrTupoCKUgGiSNFt4C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX9lg2pPMXlfTt
 sc2a04SqKMgeBoN1MrM/Woh2yGGsHSgOJXErapTHCOuxBAYM/J8YIwDQHWTMzzP78jhxNH4VQv0
 45mv03/a4XFLS7jsZ5cmEQg6fniLA5Ios7MEVliq7MBycu5apclde8/R1YTQ9Sng7q5MU7VyAvh
 TpfoGHIogVo5GknRilo9iCPzQFAQurUtFK2GwosGsAO+9xrB80c3qPXxNuxVHJJNopCObzqmvxi
 cWHfXOmkW0MQEylNy6OcWBaf+3d30V3MNp3yR1B/kClyVIAj3tXfOJfNdqvAbJQfwOOZglM88ao
 1o/xBhxooZto9ieRgHfOOf0W1AEWDxFH6uaEM/kXzoPP1+23eQlV7uPiyqmNW/P6PfnctVRARQy
 xGbQhCjzsijAEExwd59kOhSdYDRG44WAh+JvMRjf/bY4ttwergu12wYdWQOkFeslz+bNd0ERVk5
 Kp/cPBdlq0H6yICa4rw==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=6945224e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=Lz2AerfunYj4_YM9ZqwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190082

On X1E80100 platforms, in EL2, the APSS watchdog is accessible.
The APSS WDT HW is compatible with the one from SC8280XP, SM8250 and the
like. So describe it in the SoC dtsi, mark it as reserved and enable it
the EL2 overlay. Also document its compatible.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Moved the node in the SoC dtsi and marked it as reserved.
  This allowed dropping the interrupt-parent property.
  As suggested by Stephan.
- Added separate patch to enable the node in EL2 overlay.
- Picked up Rob's R-b patch for bindings patch..
- Link to v1: https://patch.msgid.link/20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-v1-0-94ee80b8cbe7@oss.qualcomm.com

---
Abel Vesa (3):
      dt-bindings: watchdog: Document X1E80100 compatible
      arm64: dts: qcom: hamoa: Add the APSS watchdog
      arm64: dts: qcom: x1-el2: Enable the APSS watchdog

 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                      | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1-el2.dtso                     | 4 ++++
 3 files changed, 13 insertions(+)
---
base-commit: d9771d0dbe18dd643760431870a6abf9b0866bb0
change-id: 20251214-arm64-dts-qcom-x1e80100-el2-add-apss-wdt-e04ca6c99f0f

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


