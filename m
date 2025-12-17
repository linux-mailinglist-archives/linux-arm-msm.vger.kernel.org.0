Return-Path: <linux-arm-msm+bounces-85551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 789EBCC8AA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 022D23017676
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F3B34847A;
	Wed, 17 Dec 2025 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td4niL/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bz6UnZXJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D73168E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987021; cv=none; b=OB2OJIjDAaC54xAGXavCnHLAehJaWe68/3O19TDjpN5OpTecfpPYCuQq8/I75jYNyzJg1T0XXUYk2vRCMkvVcr1SP7/qDSb+3e593zwhFm7g8LZMHlO61Nd3/PfzJb7Zd3tl2Yz2iQ27pVm2qKdtZNa4g17RJBuZfbETkK1gYKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987021; c=relaxed/simple;
	bh=6vZrxZuGRWDo/M6oQXbZQQ3gJdpWZlph0xza3vLC58c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwjOtMUCopejqtkxA0n6WZoaZ6SwkfxYHWZs+porbZaKAhSjR5SO94HHp67QqtqVRkBUmn9TgR1PVCqqP6PG2aD10NSH7ykomB+ahFk/k/v27UQju3qGRo6CBHyrvc1kIMhayeQQ5Zz6H8EMqcIUEqFBxteqZMhniGC4+ySGUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td4niL/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bz6UnZXJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKxua3330302
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	awIiB2Ey6NFv8oEXBhn79OJVv3KdaerPnR/oXQd2tPU=; b=Td4niL/hyMAL39yH
	Ni/uVJW3QJJrcQz8gRpUXJybjqfAhMqI/cKQM2/rt+juOFGvRHGV6iI1TyYXXdsj
	YLYPhcfLiYOkelWeTo1CUyIe9A77xECtOYRsyT131QhWAZic5N20YofVV6Q8rr34
	uhPgZcQEWRtfJPKPXWwThQ06uT72ttOcQn5ozMEWmEnCSboiIL7JEsAcP4xysCOl
	TWc7ETvhYibM7Ax22Oy4HvQgfex3ZTWZ09Qg4FFNxxukZnGre8fc+LJysny1JAiU
	IvGv8m9nTJOvhtRUcWZhz+9ypLTmJUOv6hEixF+IEmcaDYjGTsTuAcKqsxYw+1Pa
	wzRYSw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3nkkj4b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f183e4cc7bso113107591cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765987013; x=1766591813; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awIiB2Ey6NFv8oEXBhn79OJVv3KdaerPnR/oXQd2tPU=;
        b=bz6UnZXJcM+vMM5euI8hcTojIf9seZlv/j7+QBuEoiQ4C41VNj1MzomOyzFX95WyrY
         r18bgzfdfVLB599LZQGciDtxO+kCb8XbEoqR1c3TgsQH01dxbqptZDJsmhADJ7/wxR2Q
         GzInNnB+EyqrVsfjJs7r++06C6QM1lChiv5GtbbkDIR0hflOWWMCr8rpqR22jB3StKrn
         thq9GHMkUKLQqF0nnMAlrabVMRZz9odmpqMmdyFwhfT2F0k15YV9csStrq0PcPPZS7oR
         0CMczJQWma/5Fv7BzTSc6zj1o7IQCn33X3C6FiHmveIUBF6GBNVnyqTtWvaW829m729C
         uGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987013; x=1766591813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=awIiB2Ey6NFv8oEXBhn79OJVv3KdaerPnR/oXQd2tPU=;
        b=mc2EOBby+WtD5eb0N2VQi3FgI6B80TtLedYYSBP5OcQgzTY1GACJFD0yvak2nBahUX
         1hxgF/YuoW0UKAqhU12FstRWZ9AIX3CnLCEPdAz/CyEFyCaERaI+SIm0X20MrhCfZAb0
         mW3/K5n4IR2OE8C7D+s24qeZzbFzu1/aVIAdrwdh2SdMemZJE9Bag+Ug99ClHwXavhh7
         FDKTBpuYlWnU/4VJGzl2dfCrzr/XYILHYIJvWrivoqVWM278osRmNVyHxZQI48/MgD/6
         c91foUiu136yt2g7FeZ8FFsVf4yFYtgH2k+mFcytc+2i3NT//nzwUQDxkJlFbeYiM1WX
         HPYw==
X-Forwarded-Encrypted: i=1; AJvYcCXSxvW+OufdEzjZnspGtEdeirmV1lOBHSUpYaRhOI6dj4s6EGqggM0fKcXZ9Y2LlCcodRaPTyT8oAIdnBXK@vger.kernel.org
X-Gm-Message-State: AOJu0YxUJa/SkZ0w9i5+Mq8JAaS4u/fVzEJf51sEzYx90gJrb+FVi5Ee
	/Eeh0DLI9yUL1uGKRtt2uO4aPW5fk3Omz36Vms5apEaWl+DABJ7GCWynBNS+VJOOgKP+GyIK7WX
	ANNb0+hL3bHlqk6xHRLkgBVe1XxPtv3o6BojCpUHEOLxwUeBNPrm0u0HzURJfYghdddSxdxrzYr
	Te
X-Gm-Gg: AY/fxX6JklV+tI3xlIISsKh0CEwpuNCzgsRgLCINxDyc4gftxU7vASw2/wFZOLGq4Ps
	f+ZFBplFZvgNP7XAVeJWsrUwt7b3vpKb7DpOMxPJ6KCaRfnTxoqAvBE9hplBUsOT8oYdYiSJcrm
	LI1V3QEBFq5dQmtDSChdmYBQfqUkcAvivAcwRJetRwCVTFMAHi9XAJHhwjz/JgQSDK9M8+WKHM+
	Oyv07UGNyEearjqZJzjBW8V7R3dY5X6Z7PlwgtOEIiAD6oievp8j35mNEe24TIOZgEnqJexgNIH
	XnMLBsk7x633Lyqp6Slvs7svdg9SAAEPZxSOC6wb9PuHVV3rBurY1JGVzdmOy3RcvEcmkxjG+MA
	ScKueBr9tyaabE1CNaKIO7q9ChSN+J3iO
X-Received: by 2002:a05:622a:40ce:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f1d049ff57mr203494091cf.17.1765987013062;
        Wed, 17 Dec 2025 07:56:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7w3HA1nu7Xs4FrgEnK5tPbQH2BvNQ0RJ3LInMMAS472Pm6cPw3BTox7C1TqUnlEc6w1Hiqw==
X-Received: by 2002:a05:622a:40ce:b0:4ee:1b37:c9da with SMTP id d75a77b69052e-4f1d049ff57mr203493701cf.17.1765987012555;
        Wed, 17 Dec 2025 07:56:52 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeef6sm5439800f8f.32.2025.12.17.07.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:56:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:56:25 +0100
Subject: [PATCH v3 07/11] dt-bindings: bluetooth: qcom,wcn6750-bt:
 Deprecate old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-qcom-bluetooth-v3-7-ced8c85f5e21@oss.qualcomm.com>
References: <20251217-dt-bindings-qcom-bluetooth-v3-0-ced8c85f5e21@oss.qualcomm.com>
In-Reply-To: <20251217-dt-bindings-qcom-bluetooth-v3-0-ced8c85f5e21@oss.qualcomm.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6vZrxZuGRWDo/M6oQXbZQQ3gJdpWZlph0xza3vLC58c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtKzadpK0HKmTe54PLJdi/BemFeEiUXA9qHj5
 VcHIHUNf6OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULSswAKCRDBN2bmhouD
 10L+EACFwKxuUBlTCkyn01UJmflJxFekCN2319KFK434xpdD+vfQXAMnOagw40Xd7axvJErNVC+
 B++wPSLzjNHHX3BtFvneufAuwzQH1sGkdo+biiyI+YLPYy5Jb0Bn0r8mdNlZWCObqldORL3y6Ca
 lJFxNY0P5vHI5m7ajxdH+eTcGIlymswjv1QId4LgE4VwehWhj+/8r6eRE2H3oOYD/3HGW/yQGzk
 QnoefTUgN+FfT4hh9GYR8ieGRK3ATSxKEPTIe9tI47M+Q31h/Wcr8W+geyXt0jSfGDmsw/Z1CcT
 ZhPj19IO6SeEIj48QctrgIaWus5126mO+O3oPEXIBKy1Qk8S8MBaE8mGirg3h1I8V0zO67C62cg
 a6axFVr8iGT8oyRYDkLkf6sKLWpuMrCbaqbsxtHPWTv0bymO9p9vc0yYhf7p7eeqfZxzHNs/ULu
 IYRyIX834MTI9mKzJp+g3j2g5Oqll7lLICNIdi54e2IZ1kSTKr932a9CRCFwSVawBmOM2yqPN2p
 xVaYDZXyloZuKB9rFVrM+KXkj2FRQhG2d7IRvjCMZ172HoYJfgZpFfNKmRk3NnZ246NKZbiT57i
 DQlEJJgF/enX3ZFVmS6h8phPd3hPgrrynbC78Q7+ryppYhZQZT4ZK6atv8Z59cogAza3ea+dSaw
 tQL05SnYIZl/bWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: -tCyKuLg0hSUqvXC-_nygxzNBFn81Oz9
X-Proofpoint-ORIG-GUID: -tCyKuLg0hSUqvXC-_nygxzNBFn81Oz9
X-Authority-Analysis: v=2.4 cv=f/RFxeyM c=1 sm=1 tr=0 ts=6942d2c6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Hly1SnzPtDZhKKQCjPAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNiBTYWx0ZWRfX4FXI75rzTJKW
 MLTQbGiUQHJI1Jn3FKqNE5U5ASRFZSMLhtkfk0viNYA5E18o1LEjsYccc5CGS1RIo09PufmaI73
 Q++5OamDwqRIjjX4c4vIjuwdmGpIjNpuHBr0fEa0KdfKCbhxVUsIModrciQeUHDUmWqR6bBocsk
 hLaWfXYw1GyMVFP9sOHymsKN8qdM4tniWBYUk5VwiwUcZ3sAUR28RhIQVLjDMJLiwZwUjR2UNhX
 3B5xNorVkYg2w8/mcD4oxMxuMhwDewRyUGlnfAvoIV6KkUfsVDdMPhJTgDCuXWBqA5O2LjZp//x
 X+wnnz94P2BnvRdqfPOcL0S3T6sUkcZockyPbjctx1I9detfGxtyb0dtePafWkpOIeof+Qs0L2v
 zWwuLcOhZJiBjt8Rby5phkqIDhTURw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170126

Commit cca4fe34979a ("dt-bindings: bluetooth: Utilize PMU abstraction
for WCN6750") changed the binding to new description with a Power
Management Unit (PMU), thus certain power-controller properties are
considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
index f11d12c205fa..8606a45ac9b9 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml
@@ -17,26 +17,31 @@ properties:
 
   enable-gpios:
     maxItems: 1
+    deprecated: true
 
   swctrl-gpios:
     maxItems: 1
     description: gpio specifier is used to find status
                  of clock supply to SoC
+    deprecated: true
 
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
   vddasd-supply:
     description: VDD_ASD supply regulator handle
+    deprecated: true
 
   vddbtcmx-supply:
     description: VDD_BT_CMX supply regulator handle
 
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
+    deprecated: true
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle

-- 
2.51.0


