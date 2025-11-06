Return-Path: <linux-arm-msm+bounces-80582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B91ADC3A988
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 12:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D668E3B9718
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9263F30F541;
	Thu,  6 Nov 2025 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fcoNpvoX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2h3ROyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CE030BF70
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762428477; cv=none; b=krzAFY3FuaJIyiYrUo7eNgQ7JVz8+qB16R48smgNGFzQMLCMhBjwqDk+uAu1Cad1ZlgyjFDAXZzfo0Z7R16VOF6hh9HRrFMAhVY1/bOfHq1GBdgdMk7HNGMvuTHwq/xaMscN1+JNZLQmifgmCbsfyVg6w4P5kuGx4SCtXR/AJR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762428477; c=relaxed/simple;
	bh=7LLGv4ACfqEHd1RIaLaIwR9JIxPjJ9XrkVkBziRPAiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGK/+3xfFxrjdvY7hDqsB4uN4+IXCdaUjjQ/Sx8VzNE+42+0TU29ryBo/S8rDwbJPFT+IFTLeMGC+NeI754PpMsiG1IV/KT5IriXH5ENbFEgus8FIW5P6s6hfcfI+7gnua/n410dUnZFGXShFlbgdWopNctFhYrYmYDzviIzYZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fcoNpvoX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2h3ROyT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6ASl9D3748959
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 11:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8aUsm/VUb9sXMHmoBNWkNpJEc3oOUcx8xCQhbxmubho=; b=fcoNpvoXa0IKWPBk
	UyozFq1E1mW9PF9iYSbQsp5cUU8zZlccQ86dboobd3LoAs2fuBQtsIFvx/yYt7LG
	yqtW1kAKcT6ub/aMk/suGPkAvgf+1Ma+ONcRAO3HhcLlQacsOmiTVYPNVdc+EE4t
	aAGU0v9gzphk9lFluyzX3CnNZF2uZSaC7X4eqkfX9fkleendjMSBe5qUmy2rh+rd
	I465ICBfWu6JPFucnkjdNFbh4H9FpVPG85f8Ghfs0eMudML9aiBbW3uxUUJ6u6Qh
	fTTwx8s62iBc3DMd6h892pu7YqGyiczjvysz0gKSWcNBCXmVlXCwVjYgXt4WXq42
	dW6IeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6g4g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:27:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290ab8f5af6so10449095ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762428474; x=1763033274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aUsm/VUb9sXMHmoBNWkNpJEc3oOUcx8xCQhbxmubho=;
        b=C2h3ROyTyhdXjn0iKIzj2R1iq3cph5h6wE5cPCyfxxwGcGGBXGueirDvSssSs/+hDV
         TC+CoZyTOSfSCr8BS7/G9XWi3qwjW9ugkXDPiWvOlo/59Pc1s5/vCrWJbxhdFt0h0iCM
         jOnGVjqEhqYdVGqA/89Sjsf871LoEt7sDeFpjWdGPF2gGqpILWDM06bmr2PKLW/umhVq
         cq0UZbXE2IueFAWH16FuOUIKdsQzG79FrKQ2ClQaHL02VOsvePUBsVshPk5NOEcBvxBk
         fHloLELYO/3PyzycJZc5fdD5UmLo2gDmXuPhU77tNUwsn0NNNNwjJys0dX9hRMj2t3vt
         frDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762428474; x=1763033274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aUsm/VUb9sXMHmoBNWkNpJEc3oOUcx8xCQhbxmubho=;
        b=g7BAZhm0G8JjlfsAbFqpnRPjfAnF2yfhe8KPWrAZM7GwdoTzB7faij4jbqcoata2Ha
         OPoQQQzkWO9N3V2ilv1CHo6k2h+rJvdJHB2X2QpkDLWFCV6WF1qOxG4slM2j5qsKSvT3
         KYAzQaVxSMv9UMkPkS9Cy4DHQMRrXhDGCXB15puLQkv5l8UrSaAUb0ii8xW2YXkeiJd0
         wNdmdLIJMQKlP5fkKtt4LxIvI6W00QQnel+9BRnT+HDf48BymaJ/hgWj078AbgFtpQ5b
         nZye4kOxuhv6WtvoicOe24kQAyQmlYqNikjoA3SDeQ9xl9YpUrw6dlXmn/nr2nSPomLw
         fKnw==
X-Forwarded-Encrypted: i=1; AJvYcCU4F4ooxmtOuKE1eMUzwPq8wmKd14dfXEXTzuCjIOfSxtH8/uob2CDObif9+PmZ5HIoDSjlcDhjNlKUayJK@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwSDOcuZ7+0vanIvqzTbgzaK4kN8CafsdxByewAsKI2ny+SqF
	byHSWCr6vnB2f1UZX5wsHzqM0tbG4/FB01zIorkdm6FLFaHwkotNoOVTU+VouuXq9wlTBWYEB49
	+HjWlCbsMxNplu042ZQU6kX+Q9vYxe4CMyxGEdGe2cw0ZLq1SMinSJPxg88Uie++SpHJy
X-Gm-Gg: ASbGncvjKYzQ5NQiR8TRw/DcBc/PMQnnEswgEJZNqtLw5/6YP31ZTKmaRcNYC+YUgj9
	NyT+8tnmhGc/ZRiI6chzN5W25M03oEMDPjob55O5OMdQDgfVqcIcTJkQjHPMQZMVdOAMMvtlyEG
	mHmz4POXFfYKOPzfTw8fnbWi7hSh1sX/gTM0B9PL4y28UbnuzCmGNsAcECMhyBEJSMplEnBVKr7
	WPZZf5UUZLxzRHzvE/FKRVjKJ9ZzdwVI+MYLz39W76M8A+rPhf2BugWans4fH7tINPH9Q8GDP0c
	LJSjysmiJOzeYnQ0NOR2/TgIHmEKObK8Yt2BTQIUXfBqRdrJ2H0L/fojGkhDIhzXwI+ftq44NyS
	EJqmOc+zzgn9kCo4NbwWoEBwcQx4CGA==
X-Received: by 2002:a17:902:db07:b0:296:549c:a2b with SMTP id d9443c01a7336-296549c0da1mr42674055ad.3.1762428473626;
        Thu, 06 Nov 2025 03:27:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCA5jCEdTz3cV7uXAWOjzdf/UkOL6j/TuQNR0GQ3YZBn9Mlr0FhHUBcRkQJEKigOzIcKBuCA==
X-Received: by 2002:a17:902:db07:b0:296:549c:a2b with SMTP id d9443c01a7336-296549c0da1mr42673605ad.3.1762428473080;
        Thu, 06 Nov 2025 03:27:53 -0800 (PST)
Received: from [192.168.1.102] ([120.56.196.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c94ac5sm25577495ad.92.2025.11.06.03.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 03:27:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 16:57:16 +0530
Subject: [PATCH v2 1/2] dt-bindings: PCI: qcom: Enforce check for PHY,
 PERST# properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-pci-binding-v2-1-bebe9345fc4b@oss.qualcomm.com>
References: <20251106-pci-binding-v2-0-bebe9345fc4b@oss.qualcomm.com>
In-Reply-To: <20251106-pci-binding-v2-0-bebe9345fc4b@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3092;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=7LLGv4ACfqEHd1RIaLaIwR9JIxPjJ9XrkVkBziRPAiw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBpDIYqq7LFr1Vc2M7RDLBTvXoYsyuErl7Z6b1kU
 BASgS5qFpmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaQyGKgAKCRBVnxHm/pHO
 9bCFB/9D+YaClyHFdrJsQqxIppQSuCGWpb/c2E1F3XOI20O8shdlF8okVQ6JUYrCM17d7tiDRs0
 PKeHD98769zOVw7Vq81n6o2ljz+n3mVtWxc4oIuj9m46kSCfNEq7RkMvdbl8l82Y1RyHMSEZtXW
 +Tnnl4wWY6VgU3znrT12Gl89xRJZZOLHBeS3L4wqy6+sATqRb/ZqKVCZ32aZkolIYE5VxlUY8mR
 1pVbJrk11cvr+1XMURdGODUsimD2qN2WslJhbeRXdd9DBily/am6VAgKzQUi40YFW2zo/lpKIbv
 J2yEJ7PCboY7bjKRyAT/rRe8qjAkf48kT1jFe9hsd9f6oyrC
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690c863a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=NqeMpCPRvvPHbudmJ2rC7w==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=B1m8U8BhSxSnC6eZ5kcA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MCBTYWx0ZWRfX8hLLbbUHryDw
 0pzCSnIimqKsgHAcP5Oq6BKFWlfzJ/tX9CKlmKv7aMOLk3kbsmbItTkrfcLWltBkAfYwhHFUoLi
 FXPSsL+pUwalHHGKL4xtB4JXm/XaoNINkLt9JNBxKrmt7iCN6COfKZzpsvrYaT1ENlbzTG0iid0
 c987KSvpaJyzjYVvaVD0QUPewLNEA6MVp2gxJVvmtIomSEpG5arXKxxz1UJoe/OesdnrtiPyhTF
 exbc7VjCtF3MoRH/bl3i9UWLNgXwvCQjTMz0hHqyb/lssLitlWQ8kg5f4BDuWbyYuUR3W2bLNdR
 YS6kfI720mJq2v/ZXyq7g7BCAwJ7imWr7ViEQRtCD/4oAtsv6bV4rRXm7oR5ogjpHzW5SdcKRlU
 pRh49NuNYdrkvDhe2Ag8VYn5zbADQw==
X-Proofpoint-ORIG-GUID: fsFHXsdMkx9ud5JBglOIlFL_vnG2O9E-
X-Proofpoint-GUID: fsFHXsdMkx9ud5JBglOIlFL_vnG2O9E-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060090

Currently, the binding supports specifying the required PHY, PERST#
properties in two ways:

1. Controller node (deprecated)
	- phys
	- perst-gpios

2. Root Port node
	- phys
	- reset-gpios

But there is no check to make sure that the both variants are not mixed.
For instance, if the Controller node specifies 'phys', 'reset-gpios',
or if the Root Port node specifies 'phys', 'perst-gpios', then the driver
will fail as reported. Hence, enforce the check in the binding to catch
these issues.

It is also possible that DTs could have 'phys' property in Controller node
and 'reset-gpios' properties in the Root Port node. It will also be a
problem, but it is not possible to catch these cross-node issues in the
binding.

Reported-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/linux-pci/8f2e0631-6c59-4298-b36e-060708970ced@oss.qualcomm.com
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-common.yaml        | 16 ++++++++++++++++
 .../devicetree/bindings/pci/qcom,pcie-sc8180x.yaml       |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
index ab2509ec1c4b40ac91a93033d1bab1b12c39362f..d56c0dc2ae4d3944294ca50cab708915c9f60ea8 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
@@ -111,6 +111,14 @@ patternProperties:
       phys:
         maxItems: 1
 
+    oneOf:
+      - required:
+          - phys
+          - reset-gpios
+      - properties:
+          phys: false
+          reset-gpios: false
+
     unevaluatedProperties: false
 
 required:
@@ -129,6 +137,14 @@ anyOf:
   - required:
       - msi-map
 
+oneOf:
+  - required:
+      - phys
+      - perst-gpios
+  - properties:
+      phys: false
+      perst-gpios: false
+
 allOf:
   - $ref: /schemas/pci/pci-host-bridge.yaml#
 
diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
index 34a4d7b2c8459aeb615736f54c1971014adb205f..17abc7f7b7e9d71777380ddbfe90288e6187a827 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sc8180x.yaml
@@ -77,6 +77,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interconnect/qcom,sc8180x.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -164,5 +165,7 @@ examples:
 
             resets = <&gcc GCC_PCIE_0_BCR>;
             reset-names = "pci";
+
+            perst-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
         };
     };

-- 
2.48.1


