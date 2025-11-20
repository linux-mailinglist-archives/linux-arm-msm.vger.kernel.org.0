Return-Path: <linux-arm-msm+bounces-82705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 288AFC753E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6F81135875B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 16:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E143624A7;
	Thu, 20 Nov 2025 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="UqyMqJ8n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEA5362126
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654317; cv=none; b=kZ/vcaKkZM6BIFGAixF/aEN7Dm09kyAzKIxQwhZZkbcj89snmHF5YBVqzLd7xnW54kpDDNaFCs0vyi+C6XELfaBd4f3CuiEs/0vtAaoDei45ZQqvUzh41NP/+B5Kv+ftnzL9c65XZr9vAJhF26d8BND67o8Jqi7IbIW5IEnwl0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654317; c=relaxed/simple;
	bh=uefBu6hnnHu7KoVRBXBGpdQGhdbjZYZrhr6zCkuXgCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ay4ftWhAi7lxOl9uQUwHPOKtTg4VhP/HASTO5GWgBhuj6ERxSV+BJb15JmaezY174olene1fHiAF0S9XAPmTW1bkRcAAk27OEp+3O0Owj3aAkKOzuEtitIflOTtS0/uyqE9BvlerfcOY7TWSz0S2QMveGVCnuDYsUgg8/Q5X52Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=UqyMqJ8n; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47774d3536dso8477875e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1763654314; x=1764259114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFLIOuElMJObR8yP1W5WYQVxR8UuBIpAgy2xBphJcsE=;
        b=UqyMqJ8nflkdM3dI8P976D+sZdRpMkdKGPe1A+m/6/WuzSpUUWDeXgyZ36yknq/IBm
         rosEt82HTsQORmUSc5Dmfv/YhTOb3EM5ZlhTV325tcVY3G02lnzRaDktdCGZUdRHgdoD
         k30RwFgkGyGSUzq7N8mt59YUsYZzDdRefXYVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654314; x=1764259114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFLIOuElMJObR8yP1W5WYQVxR8UuBIpAgy2xBphJcsE=;
        b=KB/W7kdp8RntNH+KUBv4HdDESI7z3t3Qtin3ygoTWqv/O1E9ifdsB3Y23EpSgPp01a
         BZ9eH3Z/4GBGuq2filj6xmJ14QL4r9EnBj8w7q+VYkZH7HAeRouyWSM5TjF6w9CZdeEa
         Sn81F/ia5NhZ3IR4qvAQzUD4Io9eUvRWGcLv1ttnVRVX7MwoXu7zePzQNL9P0CZmkwQa
         KaYru/z4TE6R6mJwBUL+yxnMYK881r+tybv7yOa/F6lXve5wYbd28hXQCjvOBylJrG1+
         V7TUKz81e/cr7g++w3iCQSzTlFa0PTsJcNa7cKz1eBc5r+/OVLnlvuF4CyKZkB06LPMQ
         AEeg==
X-Forwarded-Encrypted: i=1; AJvYcCVmEI9n0q7HKmzb9xiRd7x2RhRQVek6t/bgquAWaD9/v1pc62/I7ogJHxVaDRmYfEM8NMxK6nyY07l1lzBA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7BCcU2rOzYwpz41pvGBfkr7BTJfN9GY6vGU83wq4IzNvKiBGO
	gIYe3J0hL+qCFv8SRJJz7E0e9AmX65YyauvDhYi/wOvgT7CHn4lwwxVL+ZMjES/s9ao=
X-Gm-Gg: ASbGnct3/WJ2wbX3t035Jqr1tLfcHSzQp2IleenNk1Lsm0LtkFDQYgHXG7ajh4RpI5f
	85YeCmGnxNjrlfe/wCJx2byWtE8aObmygxirQjrAdQ69yu2aCtWRUIryEhKMBIEptrWJkRiT7eZ
	4ugJq74Clsa7zaWy6eLeYR7vRGbbQg2nRGL0Bl/AI/fWhJlj/+OuCkNF5HCQ8XJFIwN7QFFsbPR
	txldIOPIGj81DeeSJ1kl6bxPZm4Mce37e2iWOLKEyatJdOrfLapRHbUIUG8DsZa8LOg4hEziUvk
	mr23lknFbQeA38aueOWtcP+SGv8+CVjmZMfALzkeH/2CMqOwoBZigmDuuF2WaNHp7KQ7w7K1dRu
	ePpY6xRsL28A0UrmZhgC1XxHeY2JcoEViIxujXcLemk+oJ+/35Otxk+7hUFh6/kYNuTIJSNDQqs
	tgvRpbbwq8cJwgNWf+JGy84wggTiIem/l9J/0oiiYAPc5A
X-Google-Smtp-Source: AGHT+IH/asOyZmrSjJB1fGklN/UX7jTsW05xFyFBgFM0b+yCyMW2A2fV+RgZjiNoXrR2/gP6b9/Mfg==
X-Received: by 2002:a05:600c:b52:b0:475:d91d:28fb with SMTP id 5b1f17b1804b1-477b9ea35fbmr23972645e9.4.1763654313706;
        Thu, 20 Nov 2025 07:58:33 -0800 (PST)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b82e8ea6sm55552185e9.8.2025.11.20.07.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:58:33 -0800 (PST)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	farouk.bouabid@cherry.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	m.facchin@arduino.cc,
	Riccardo Mereu <r.mereu@arduino.cc>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/6] dt-bindings: arm: qcom: Add arduino imola, UnoQ codename
Date: Thu, 20 Nov 2025 16:58:23 +0100
Message-ID: <20251120155825.121483-5-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
References: <20251120155825.121483-1-r.mereu.kernel@arduino.cc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

Document Arduino imola, UnoQ codename.
Arduino UnoQ combines Qualcomm Dragonwing™ QRB2210 microprocessor
with STMicroelectronics STM32U585 microcontroller.

Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..1af19245b1d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -336,6 +336,7 @@ properties:
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
+              - arduino,imola
               - qcom,qrb2210-rb1
           - const: qcom,qrb2210
           - const: qcom,qcm2290
-- 
2.52.0


