Return-Path: <linux-arm-msm+bounces-85553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9071FCC8B78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E589C3108B9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886C134A3B4;
	Wed, 17 Dec 2025 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2h6+79B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJMvuR9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C75B347FD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987028; cv=none; b=i2f8fl9OjYOQZRBrHr0fAAGiSUfkl5dWMMVAqj9t4Dt8iadCS0bec5BMr0aMqlyv5DmKZwOheWZcwpwW3blzkKNTBI2uKuy+1y1DbHqtZhJxmgzJwvCSFVpk2k6PcD0zlzRaJTrqIiQN0exhYpWhx8Cbzov1bgOhyG+JL+d+kCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987028; c=relaxed/simple;
	bh=l5WGbsKtHf21iM8+oa+/d0NWfC+n/Ku6l80th50BuO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bc+LWhfM0z3CH7KEQEb8nmNmFocwG/+cITpBcC2MQhrhBL8M1HAYCzddSOxuMOTSRxDIby2iIogBNoqYlGgTTmPEOupaAGleQTxusFT1zar3BWcrTQUfjU3X0rsbE4DP5jncWM9+v1DyF3LK+xK+S86a+FIHIGc08pB0zYW6J7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2h6+79B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJMvuR9e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL5gu2675094
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZtPShKRE9enhUtv32089Qv8Wp0CT+GiWyKxZmRT51Q=; b=X2h6+79B2XrYhkO0
	PAT5ZzCm1ZBmQrbOvonFn6UWQR/0UFlgUXN7NUQoDHY8AOABZL3G4Ve/G0ixJNUg
	/oChAcXCBloPp7cr6nYZdsvpKh9/LjNv4s8AolP+uE6aPfzz1o3Zj9Y3q+CbMB8n
	WYJMvfQjnkyk1+5SbgFFGozNytBQCj58pJdjZtFv9jAyuW3eDpCoSi6G0URuNmUC
	GvH85rhy9+8uUygfRWhbn32A9dxQiPeuQ/JJPdqC77tcMuqayQ+sbhExVZkE8cUm
	m6cVClB+02+uHwjdINzRtEgBwMwO9ZpgTCUmhbVYYKcyihV1dgOo+VSi8BPlttOu
	K4uJwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj297u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 15:56:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee416413a8so68272931cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 07:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765987016; x=1766591816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZtPShKRE9enhUtv32089Qv8Wp0CT+GiWyKxZmRT51Q=;
        b=dJMvuR9eNrFEI0sZhOgmPQR1QbYVfjvC4k4O81Kz/VWw1f9JYu+JQId15Y+U1sbdDc
         PCIbyee524GRA1GoSujE6FcyIRvWge3t3Gz5cNE6Jwj9XQR4uC9Q0WSAss87nYxTXnJO
         DVItNtvbauviuDxayBN5vGlKIVHZ9uxa6hiec7ru00j7hHnZWVnN0tHMZ1+tMOKMWt4r
         6U/GDw5FxbX/lRbL9pS6mOw6DtGZ5ay8cDFGiMncVu44KGrGUVi60+aMeh4ids7xDIg9
         doTdJ75yOLECv3aFNOivn98rZKNo0X48Fl2zYeb8sepWJ6QVz2pNJDFCdtc+lkroIIDE
         tdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987016; x=1766591816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gZtPShKRE9enhUtv32089Qv8Wp0CT+GiWyKxZmRT51Q=;
        b=wXBaPqv1pUprldSzURsKUR7rDMNmerQiyvrW1+LGeSVD88R3GIl/Cj1HfvgiyAP5Wc
         IxEEA61W/1DNcIHgS5+5erD8uwKqKouU6qEV+0zTRfExYOfMTRrUWzZPYvxArwDbygNr
         9ikonC5150GEMAgi3lf6ODLckd6mWPf5LQHlaHbb0apYB+J2FKYjoWuTDih5Ftqb4H0E
         A7ME90NX9wJaL7f8qxj3to8JRNz1k7b0W/jlQEIsf3f8SwZinienKfDdCyJ4VUNolv0A
         V4zWzTDj2X7vHcEY3ZcS9T9Y0Vmo28eXih+b2EnFrlVoCbjFv/nfk3JL3A5R19l+aYAw
         Na9A==
X-Forwarded-Encrypted: i=1; AJvYcCULZNpZJDMgMQH1zX84s8zFTqHa1uOopSTq/TjgFDRE9IXxGFcB/rcHIldXTa5XCAFXDMUmIari7Hzw2geY@vger.kernel.org
X-Gm-Message-State: AOJu0YwTXDArLZGAXjf47WYQyPg96QvRD8oZlXsB/P62QaOQT3HbfqRL
	TjXVm9QzJ4q8nvuS+ZS/YZkTYKYkFDXUPAILBHR0Md7/pKj9RmV6VWw/OKY3/fAiHt8utCDBE7a
	eg86rhL1kHBXHLHfmAMJ+BBqNAeWJFVF4CweiCsliN/wTvcN2e03MBhwU6F9PGNB8JRlf
X-Gm-Gg: AY/fxX5neOkRfazpJYtqZblZwuzyeQa0EE7gdqcxLiuUWw1YY1yDAZB3fJ0r8RVMPay
	ddi4UTZwpGBGOIRu9IHHxHJgjO33ZWtiV0bS1ERMDCz7JWaH7dw7eicCNB5tQqKNOSFyGlHQGo4
	aU3yZKTpf9kqUXhHemTr7VBGmkpbHIZGRX1+65/xi8iQn9BfsNV4fX+ukH4FHlquIgw/aCa+4rA
	FCZdNwH+8i3iIF2mOI7VlaiXjMqL9kMO1axatddktgVp0TEIxaYNvfGw9KxlMhQJO3KBHg8hqMp
	Nbku+jeyhqcAscbZjKZFd+AX/HTYf3SCLwPSUUCVG6oHWPYb6wOikzI+nwZ0CcaRh5pqnaswJD8
	EPxKp9mVzEfkscQpgeIc7P8zaX47LMeam
X-Received: by 2002:ac8:470b:0:b0:4f3:51a8:e213 with SMTP id d75a77b69052e-4f351a8ecfemr36111031cf.17.1765987016225;
        Wed, 17 Dec 2025 07:56:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcZrELuHoqeva2ja65lAIW47o9MfozyKI24g9BmSZkSFDfInUoCpe0iMjn8G+mvcEGS4idHA==
X-Received: by 2002:ac8:470b:0:b0:4f3:51a8:e213 with SMTP id d75a77b69052e-4f351a8ecfemr36110791cf.17.1765987015799;
        Wed, 17 Dec 2025 07:56:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310adeeef6sm5439800f8f.32.2025.12.17.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:56:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 16:56:27 +0100
Subject: [PATCH v3 09/11] dt-bindings: bluetooth: qcom,wcn6855-bt:
 Deprecate old supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-dt-bindings-qcom-bluetooth-v3-9-ced8c85f5e21@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l5WGbsKtHf21iM8+oa+/d0NWfC+n/Ku6l80th50BuO8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQtK0gcToTlvYCmZ1COOLHc7T0K2XZjYfeuIHH
 osPXQ8463SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaULStAAKCRDBN2bmhouD
 110NEACLD3TRVem500KSc7R7OM0GZVnh7/cF7To5SjdfG3xTnJXcIkmjLQ2ActG+A/V4Gbbp/Gc
 o0I8kdXAyv2VhDCHCgGhJGbk5DvI1PfAVB4PWHUmU5E/LEho1Yz7KH9dcPBRj6wwvOaDNvrYNv+
 Z32KY7W0FHhWQbn3h6/nwz/4Kjlbcm1m1bhCZMUH2nelPMHfrAGXlQe8EmT4SPnyZKuK3Um2ipH
 72agpXvIdC8QTHWrOOx8LJ1hG3VQg1gbsOJvh3RSBpyLMhfdnNYaERa/LAB+eaVAbesY/NiZ5mJ
 taJZWZ/oJt/pdJNofhKuaeAfkh1iGJzwjpGQisnOfXKtM+pyK7nGHfwe265cbe4oVfC6rRgiIfG
 TvXRwqtsvKnD2y4sLGdQeOsN24ahwvKvt933NSujZP4r+a65XyCtEhmsU0WflNCVjI2yQg4GWn5
 rUmuE82jUwmMb5V+95esEfKZhi/kJINCim9J0WoDKqqNtEGGlAuj63m7RU1LFUfqxU1HI+7+A7e
 pnAo+3hLCN7VaKm/A6c8DJIDkDZ5uKEXcXuldcGPkMMj5MMLm22qWxwxxFECPk+bXwwUOKvXG56
 yOrJXcZjlZ9YYLBOmlSvCkW10RGHdpLR8nzCaQP7Cgj0elJiujo7MV+Dr94/0Ufb7QT1K0jL/J5
 btwIi0pB27KCfBg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEyNiBTYWx0ZWRfXzt0azgkFcJkb
 qM8INlNyi+IYzIJwbPPQgtjOOA+KMY/8IKLpAuGxQOQ4mz60qq0naegVf5BpSee9LYeSuGj1YJ7
 BbcTqy3qV5i4C+rrk6bTdtHdVV9iREsOzHzWrUKQ9rwxQlh2hbSVO0TkceyOngAYOXX++1YeN35
 +RzTx45ZpdqL4qmcggCtK9kJkff7n7T/4EQfA73m8mRFT1PecVQqwGXX/L4fz2FBCbpsCsHSi4l
 AkPfu03uv4//8SQclyhZL7jvdj6rGVONCMIO+2Zgc3Gcjz2/QUFFW/IcJtAu1EfRyR1iFQE7Ih7
 w1xKO/L7okzCnNh9A6XmQvUGBUiAGkhbEOmiCD2OAkoMpj35nUlTXyRA6eyud0xSk9Rey4vgkYK
 enI4E2eIuRlnlDWA07I/7h9E/t8jXQ==
X-Proofpoint-ORIG-GUID: bhkE4SCKDGUVKNdqKApq78XCQ-xJ-mNg
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942d2c9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Yne-JONsqnic5O4-CUAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bhkE4SCKDGUVKNdqKApq78XCQ-xJ-mNg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170126

Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
closer to reality for wcn6855") changed the binding to new description
with a Power Management Unit (PMU), thus certain power-controller
properties are considered deprecated and are part of that PMUs binding.

Deprecate them to mark clearly that new PMU-based approach is preferred.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index a4a887a4dde1..45630067d3c8 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -18,11 +18,13 @@ properties:
 
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
@@ -32,9 +34,11 @@ properties:
 
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
+    deprecated: true
 
   vddio-supply:
     description: VDD_IO supply regulator handle
+    deprecated: true
 
   vddrfa0p8-supply:
     description: VDD_RFA_0P8 supply regulator handle
@@ -44,6 +48,7 @@ properties:
 
   vddrfa1p7-supply:
     description: VDD_RFA_1P7 supply regulator handle
+    deprecated: true
 
   vddrfa1p8-supply:
     description: VDD_RFA_1P8 supply regulator handle

-- 
2.51.0


