Return-Path: <linux-arm-msm+bounces-88244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BE65BD08577
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49F143026F22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA33E334C06;
	Fri,  9 Jan 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+mLi01e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEC2322A13
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952363; cv=none; b=dGjunn0TcPFbWb+9NToMnyZn1tJxIVXsv0FZzgPe2yeADLK6PwUitr5MZedrkInkdIPUwoc753GtQw5IntRpeaFamg15H7IquvJUhdThnZGr0sTjaiG10v9USGk/RSnvE2U5l39u0UtLMvgxkV54yKkGBvj5D4Sb7rojhDgMM68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952363; c=relaxed/simple;
	bh=hUYScQaRX0QfzkUatVOP/WusQlNS1mD4mV/UULK5pUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5DMXne5gAxPftC4iCORJgf9gMGWYsno69yknkbDct6X8KslMgEBjUbPwGyIfLfpB6LWCZbCam0/oKe8KwJHctobJgUvoAgfT2CoCX07dSj29lSRbq+4qmWqCFUQbX3g0EEmHPx6JZbf+xd31zRVEmv50fGGgh+m5Q3ykdYW27M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+mLi01e; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a12ebe4b74so41276625ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767952361; x=1768557161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=R+mLi01eS73O2duaFXiblzgGMCaOoCFWX70+VbubG3kwwhVPkwL3CSU4eRsRuCKIpZ
         9CUQ5isqKUH1WW8iH0lmX1F33Ur9jCaxzypA6e4BdE1CZ0IVRlTcMdKew0PoIEPoijo6
         mFMLfeCeFpGceEvO77RKMuL25tJCo9tH43Am1jbGbMPPupsC97jauaEgldCH8HTYVMr5
         4gWBOq8QlII60n1CTnEy3gogPyGa4jCX307x5fqZRvclHWFz6dmxArqvLFUWtZZ3xIdg
         wiHF+u6+CagGwWg82w+nuSJwiTU2c7jr1+H8eANk9ByzY7A87/Sx3mDzkzzTfQc8kFiw
         62qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952361; x=1768557161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+G6pf8+5EFoESwai3MJ4dA07jKvv0MdZ3B0YqUEleVY=;
        b=KhnFKgO1eAiKwiqWaliNBdOAjRGIDkwUC/+xWo9h5pBqu3dZA1T69KWL8eBM9FxtPL
         pDMyieGmOpjPmVzho4grM9jvX8NJX8Yz8IluaVnoKZlVvyyDS49ZaxJIG9HCPpFFdXvX
         jTFZhfNy0HOSyfXOH707kxOnjEpowbC9crNiWPCisDArDqM0UNQqQduk6NLY8gul7uuZ
         2vRY5Su3kCxYHuWSWwq+EJJM9ZqqCGEelXw/HoSE5V/7TTnfPFaq07/CTClkRAaL+mEA
         Bpn4tVsqPqO7lCvS6pIu1PtSZ7ofGzgQb2ld2Zn2rz1cQ0dbJKMYzS5fi71TzHfyUusn
         IfTA==
X-Forwarded-Encrypted: i=1; AJvYcCUPH2fwSMwh9SN6ZEkfqHlwOb9lUxj1AaeojfB/k7niibXZtth6IBuT6AYPlyMYLDi4xqROSH56wEbSi80V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ptjIxHp23EfnOpm7CoKSvxc8seIidhWKz9mjvcv6a7qzZxiX
	RQc4qWxBE3VKywRX53ce392Kbp9m2mrfG/UUTe9e15fsfghOW0TVHgQF
X-Gm-Gg: AY/fxX5YQgteMnSpkmiCWzPNv9lVNdHn1tgqTQwU2I2xe+ik9+QkaQahDisF0eBCXQx
	iGvfBQduSrvKHpJXsTmVccck6xGI0GmnAY9n+hVQLfoH86YK8CKAmyEKwrppAsWvcIBBTOhI1T6
	RY4mByDXpGDjGw+EajZmye+EXD81eEOeiiLbPQeQ8vi+Kx9qZGqLaZqgdQq7yiYDAlkJ7b2YgOW
	m4IEuXxfKjs1b/V7d4d8Mh1V6Sg2Zb/gX7iXd9bDTE4rEVRKdzfgbPf1v/xExNpCO3oyR+IgHqb
	xiUEYmSYurq7fC1qXbruEFh4TJDh5SFKnddpEkUiVXtA7e91Ngn1xUOFcBgZVZy0pU7q09D17p2
	dE9k8l4fHkBpyKnhMaKI9AA7Y37QZM6pxmAZFo2f38NXjwJraEdnZ+tyNF945zn4NkeBfbWimtA
	AOreMZMHYRIi5Do6ofUsfcxQHh5n8BGJH2+ob+
X-Google-Smtp-Source: AGHT+IFPzX59ZVV8+IHg7wcFMfDCowcF2eFCoUcZwnZlwJJUxtou1inee9Yv72aNCcq4bhDITjTmlQ==
X-Received: by 2002:a17:903:298b:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a3ee486f81mr86815545ad.32.1767952361493;
        Fri, 09 Jan 2026 01:52:41 -0800 (PST)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d79sm103081795ad.56.2026.01.09.01.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:52:41 -0800 (PST)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudarshan Shetty <tessolveupstream@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 1/4] dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
Date: Fri,  9 Jan 2026 15:22:17 +0530
Message-Id: <20260109095221.2847067-2-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109095221.2847067-1-tessolveupstream@gmail.com>
References: <20260109095221.2847067-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding support for the Qualcomm Technologies, Inc. Talos EVK
SMARC platform based on the QCS615 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 4eb0a7a9ee4a..c081746636d1 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -876,6 +876,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs615-ride
+              - qcom,talos-evk
           - const: qcom,qcs615
           - const: qcom,sm6150
 
-- 
2.34.1


