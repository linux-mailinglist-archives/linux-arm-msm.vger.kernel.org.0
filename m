Return-Path: <linux-arm-msm+bounces-72931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A7B5120F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 11:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2015F16719B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 09:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACAD6313275;
	Wed, 10 Sep 2025 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neNxnRtX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FF3126B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757494988; cv=none; b=FpT9OTG7PdtiHvM01GdyWzLdCIwT4K3vEa37STQMSZRo5ltfuGOospoPZig24vW9Vy5wgTY7xbXuPKD89MiKY+6F7oXU2XiHxjc+/H9+3KkuXiCqrIX9xaMwSVHGHQPCryge/sdLNhPnOpt+VHXSNw8weXf5Y4pdRkzfaCs3Pi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757494988; c=relaxed/simple;
	bh=NXrL4UfXMaolOBQBaqURajfxc0T5HCU6PJBeG4E7Tcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYReNqTFnd0sXHo/OBCoUSv4of1qL9NayL9Kb2zyWqBaQ/VUL6ZZYY+OaZRccvH08pEem9GBZ2JCJVOmt4YV0tZIxY2t+XtcrmAaJnO/6aGFA9WKSMmqGZdgZu1GcWWAvUXNs17ekKfambYXHCemcB1MlKqIfH2tjj3tMjamJEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neNxnRtX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A7ckiZ017993
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yZxweSgSo8wMha1h5lg1sSuavNRyAYwcoiGnGqC+L6o=; b=neNxnRtXpWz0EzPT
	yW40z+TjcW2i//Kg4jKdsz3C52mCoOJvHlw5rhGIoYJgXTU6gi8+W3BUTF6X2XtU
	TxtePJ81teiNdjQqaYGdM5GqYeLalD2JPcBXmrcsq10+SCU0jMJc8vG7yHUwY701
	mMKHwHxGLHDOZ26CZZLxg1dtKK78grPptTSrr+NnBQAw8Yma+ufw54H5oNKtUE6t
	5A111WttJ8OOCm1O/j+tP91YCbaLwapcF+V7MHwza0a6shij302AYWWMXKZy5bc4
	/meor6xWwOOjEhrTbzGIn9b0dnQgi4gka5hw/FOO7gu1/L9OnDh4Xb4b/KkSpf4g
	n/1y9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9jbc7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 09:03:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24ced7cfa07so67670015ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 02:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757494983; x=1758099783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZxweSgSo8wMha1h5lg1sSuavNRyAYwcoiGnGqC+L6o=;
        b=D68wWwnkCrXDYkhXxAaFZ4fqMgB3a/irYiIfioQDOkdLzes+JzytX6FS2kNt5P+o5L
         iV3ZSr2yaLkdcMQj72IOhYyd+XVuD+0pe8Ne9fwSl4CUYSueUKN5LuAkacKW9pqP1sd2
         swM7FSXzuKBSKiIv+toU+XE2JauzUIXwamZypoPUOzxpajarPgSkaktofV+8Kdjl69Mr
         4J6djzfdjtXSPqKKD9eDk9Qi6GMc8HzVFGHYkxeKd/MBCuUXK3CzMi/A1bsiExTgQK0U
         ICw6SVjVgpOLh5Ock1g+UBb4DXo5jnf/OWNUHbRMIXUwAeA14fUTrhFM3L/HTgxwq+QO
         w09w==
X-Gm-Message-State: AOJu0Ywr08A+gMNmh1ibVIRHMx23AVENXzhXFyunvsBnYw3OXKEC/MAd
	3R09eWRsTDWnZF39ok4StGjrb1pFeuINihhCzmVx7WpcShHqw3wK8D/6zxopJR1h3y0J8arIfkG
	iv3PojvN48DI6kknz3CJGVeFk1+55CUGlViyvTKnLDsxze+7dcRuXb13VL3w6TtpytPUu
X-Gm-Gg: ASbGnctHu6IXp0XkGj9yv1/Ump5mfNN+gW/mOYwxTtcNhbgA/pE7Wcskb3AD/gMiIvN
	zmz6IPsfE0wsSQed4+xf+Sr5kmLj9drmHM6vLVfCslctO0IPUqUqq/63QwstcMokB5ryIFqwXNg
	vIKd2U5GqKIXUZ/UxiQoREGgfMNR/OIGeCinEh8P9j1I3Yh8HT5PRaTL/DjpeFyBJohvKPpdhWn
	TqqXxIglFv9V676mAoURodNY41sPROZC/SM0KaNQBmjTCwoe9qtQ5qZVm8X+fwhUxpF55jcTmPF
	d5AfCnt6r+u+czP1qDLe42rw3vq7N4h/aze0HDbqzAki7eE7WzAQ2wDauYDHKgAcOG9tML0JQUF
	NNDSO4eagbUq/CGk4MfBsBb4xULpocchPaA==
X-Received: by 2002:a17:902:d4cc:b0:24e:af92:70c2 with SMTP id d9443c01a7336-2516f240f23mr204775205ad.24.1757494982968;
        Wed, 10 Sep 2025 02:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWPVJMLaOuBnAfptMTDd4jlttb0xOSEMI0piuj7JHW/j2NHik0J+8glBtYR4d4y8/aud4fcA==
X-Received: by 2002:a17:902:d4cc:b0:24e:af92:70c2 with SMTP id d9443c01a7336-2516f240f23mr204774825ad.24.1757494982510;
        Wed, 10 Sep 2025 02:03:02 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27c029ccsm21089155ad.41.2025.09.10.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:03:02 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 17:02:09 +0800
Subject: [PATCH v11 1/4] dt-bindings: arm: qcom: Document HAMOA-IOT-EVK
 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-hamoa_initial-v11-1-38ed7f2015f7@oss.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
In-Reply-To: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757494974; l=1177;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=NXrL4UfXMaolOBQBaqURajfxc0T5HCU6PJBeG4E7Tcg=;
 b=O6Ehrkgfh2Hold1rk4GnSagTZ2k3PHgg73ucm37LLER+haNzMWi3fZM7SpE6JenShR0DIsS9/
 CJSy/ExP/7KDHbosVo5j58X+iUgdPP15s2rAlT4WECPbuCJT+tXxQyg
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX2lus2tCAkVJr
 XopqH/kzrljv50xiFaW3qgXYU9EFH7WnHe6vofEjhz2sDAuggjTlwfdySQUlKuHA/YjDxeXqkSR
 4gkWnewfhnPsd/ANm1MfybJOibPzZdx+MxELhipFbBp9KwQP7QvTySGSKGZv/gtPu8vNDuFslGx
 ZSXgLnFUYgGFYR5iA2DfJH0EO1kG4bfQ+9pDGdnKLQUFsYJMFaKE8dvCsL7RGXOB8VRocZlBioE
 hYRp1zIBJjrZWd5365T/xYA9DiAe6xydYRJnYhEJuj6DZtzBmng/c/v7FdQ+/lWeGQm4udCpZGX
 mRb/BRS8RG6u8TapJakr1IlZbO8dOi5S+gjiCo3byOea8TeS9zioxgNaM8vLDrNzA3RryQ1W9+p
 KZRbOJWv
X-Proofpoint-ORIG-GUID: FU57fqG1IfBo-Y6azrGlTCvgjhP1j7_G
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c13ec8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Bh1HEMNN3wmc11-eFpoA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FU57fqG1IfBo-Y6azrGlTCvgjhP1j7_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

Document the device tree binding for the HAMOA-IOT-EVK board, which uses
the Qualcomm X1E80100 SoC.

The EVK consists of a carrier board and a modular System-on-Module (SoM).
The SoM integrates the SoC, PMICs, and essential GPIOs, while the EVK
carrier board provides additional peripherals such as UART and USB
interfaces.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7d47d0c04376..d03084cb0e52 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - qcom,x1e80100-qcp
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - qcom,hamoa-iot-evk
+          - const: qcom,hamoa-iot-som
+          - const: qcom,x1e80100
+
       - items:
           - enum:
               - asus,zenbook-a14-ux3407qa

-- 
2.34.1


