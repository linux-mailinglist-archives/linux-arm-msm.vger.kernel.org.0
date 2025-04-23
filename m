Return-Path: <linux-arm-msm+bounces-55242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3BA99C56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 01:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9B6C7A2A11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DAD24468B;
	Wed, 23 Apr 2025 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udoV3995"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC1242D90
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 23:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745452420; cv=none; b=KqJk2tARBTtK0AB+jJITYntvBTCfxtTMnGPfepz00Fcouk2rh0cF/NRW5Zkw/E9IE8UgeH/jdIZYmdP6xg4VXQ6EJVpPI5Cr+sHl3wwkwhDkLl5V7QtK3vkkyeVg91jsjQUcUB4lHLxcy09slkPdmkWIfLZ9eNXm0F5TbYlmub8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745452420; c=relaxed/simple;
	bh=OPdi1VqB1omOpnUAwaklrwqievoOBra4zBTdgs/6ev4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YQyhdRNCcHGamU1DLk1ze8yj7GIH3YqJjManWxrghyGgmXTTkYpXMJ0ljILUWJTE9G3yiN0qTAIexlJA0bc3C2VgEeGxrOJDw3vYGW7xKU6n5D2B1mbVGS/YkVaXRHPvlEQZCZV8wYgB+ARWIZjsAPYMXtRIM6pvcVR2jCSutuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udoV3995; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf680d351so9723645e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 16:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745452417; x=1746057217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXE7IkMB87zw4RjQxYE2EK7ftI5E4rkj0M0t7A4qXHM=;
        b=udoV3995UEptANGzDngAV2MTlatBkoci3OgbAnEjwVahFdRc7C318yKgjpMcFgov6Y
         jVxy1/B9FKCrMtkNgbHeMx9z33QDonbHJYiAe7nnQe7k/mCVk7Rvspzho13Ms6HoBt0L
         PxZPmS9eOimzEq666kAq2XIE/OTI7KinJs5FAyOrScmqqHfHPUCeQEjwG0AZ+MoKmTEc
         5rSXj48sNjs+++B7Pd6KZkPK9f8fgmSay/9VFgVvHHaF52Y9QA7cr1SN5gSYJwyjIqU2
         /AZG/tSsO8bUyB5zVAr7XavGbYrunQXHgrzgBeQ1jZMLzjtahj06ehEtTv5TQTc1abKI
         PMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745452417; x=1746057217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXE7IkMB87zw4RjQxYE2EK7ftI5E4rkj0M0t7A4qXHM=;
        b=Aufp+4aewd6MhmthzMjdHFnt7mrpaXlxyjvh5eEIolAJ15WKiGYwJmNLWREZ9fDugF
         AVLjWHOZZ61msncXuAOX6QFJUFZw81wbEQjxytn6rWwBB515QYiylJ1R0lOjR+qTYt3P
         AZGAqdLAqXGixuDflp6q+BDS41qSCCbBtBECBl/hz50yzLc1kY0Ky3zjLfaz7RiNNY+g
         Du5dE0dwytt5Z+sGlzUNm4Yovhbm1WO7F0XpKMvnao+NxOxp5psWJqXBaNVcwFnhezAj
         lP7j5GkahK5E2sqUqFI4crnkjUq2jZNqtV/J5GDtOApQj0+LdN1u7sqSoPTSFrkYiZv7
         K3IA==
X-Gm-Message-State: AOJu0YwAPLO66iy988GKreNU256HR2pB9kVj1RPeNWB1CIqmUqJxsmFW
	qk7TsMVkfMBYgyIPM18ntxsfCbOm/882U2IopyQ0kC3bJ2MMZFfte7TNda2xhmk=
X-Gm-Gg: ASbGnct3323eWgxsxF5lo6EZ8IX1ykRsUZoQGAEUfk2iv/+xe0PqhzPNtpTXkizoyk6
	8jnkpsz0QBrIPklGkRac0Qui9dW9N8VE8sEE3qmdTWTokjk7Z+Kc6dqWSPoBNY5bKS1Y9AsbyS4
	gURrPEjZ1RUtqaB9hxE8XP/KyvpicwKqT7VUAlaDofULeBxCm5Qd3Xia0HTfziuIoFJzn1LSVzx
	PeX/U5qi1JR0NwFA/AsVmq+N8v23yH7VkH6/nKB/HcQqz0Gny9tSCGfPDUoP29aEmR8JcoTgfK9
	4ToDGQvzaXxGGeBot3BNL3jUGNjDS6udj8MNqJC4ijV+Y8A+C3eueIBG+uL4JK0KG6TcIZS4ehc
	r4lnV6Q==
X-Google-Smtp-Source: AGHT+IFZDvkOPT2nkrYDosMJxSvyqWdpibfsvEOGz7vuA49ORE7PmTPuXfJTr5Qi39rOLVdxnZn+fg==
X-Received: by 2002:a05:6000:1788:b0:39c:1401:679e with SMTP id ffacd0b85a97d-3a06d64709cmr180773f8f.5.1745452417192;
        Wed, 23 Apr 2025 16:53:37 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a7ff8sm267265f8f.13.2025.04.23.16.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 16:53:36 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 24 Apr 2025 00:53:30 +0100
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-1-ace76b31d024@linaro.org>
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=834;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=OPdi1VqB1omOpnUAwaklrwqievoOBra4zBTdgs/6ev4=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBoCX173ZgOXlhAGRh4ro3T6EOTZVgjUZpv8xf7N
 zdUR2NT/ouJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaAl9ewAKCRAicTuzoY3I
 OjBeEACa/V0OBm+oxMpcnLIstaReDh+Ly6y4dFvy2jdGMKjUzSDGmTXQH/NSwt72Dmf7iQTM2Qo
 EnDMX66nWjxoLYyMF3IDguN0GjGY7XsRWt10pxp0YK6vXMiU1h9dFOoBeH9/dUjlaH60EYupUfS
 cCATfa1hOsKWTCkTkfxtQzJ7AW1vIbTukbxVmLuWblJleLVR0sifOZ6Iv9/FMOx+p9e9BzLwFSf
 /6PcDjgIbTgIZnQvqyhvG1v/bk2AQSCyiGI0+EB7N3hHF/03F31cjNSsGEKhaXERlozNYsF0NGR
 c3/HaQtjmkjJ3BXgYYHliGB4s6AlRIwGTdyMymodH95BCdJwOPdTFU4rxH32Cro5dkJpRWjkFFt
 J0ZafBaHn2X5wV20DvGRKqG+AhSUuwY7kPZOX+tMg/1bgX0I0SpTxkwvSDcsXMq5OaFIPOkSjRl
 gqChTOm9SL7nAZi62DyjG9+pukn/ryhGV71lK+FzX2jM4YxdIdRD4haeRhu1tL4HizrWqLZ5IwF
 Ns/G/pjNuBLmfR8miiAQJJwFGHHLa07NI2E3d14gg1+J96fLKBpJ7qLOXCjHLi8Gz2jxCZERPZe
 E/U5LqRevrtKbIo0vjvJGay5ifbQR7HUd6584LbOJUZyjJl5bJDbU+VzZJWIXwWVw+btKufzMa7
 14/PfvWVn+V3JDg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Document the X1E80100-based Dell Inspiron 14 Plus 7441 laptop, codename:
Thena.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 08c329b1e91928fb7eccbb0bc8f25aa76fc9a0e4..65210582ef027953918077bd1621a61d3c782f39 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1133,6 +1133,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15
+              - dell,inspiron-14-plus-7441
               - dell,xps13-9345
               - hp,omnibook-x14
               - lenovo,yoga-slim7x

-- 
2.49.0


