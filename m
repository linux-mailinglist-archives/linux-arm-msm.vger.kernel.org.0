Return-Path: <linux-arm-msm+bounces-62373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA28AE7CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7C71C2597B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35CD2D8DAF;
	Wed, 25 Jun 2025 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="RXuIo225"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89552D8777
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843133; cv=none; b=Iyz0nvpjFhlmm0QRa2r1hCIvCfI/dttesLem+X1+LCUXm6ofUVTqydecXui27pJ8ZC6Ig6g7RqOuX4YSmu6m5WJSoknN2H/Rj2UsyREI/t5XYPBwM1FCRm/rZ8Id6CCjyk5FOqbdddAYJB6zPiZBxepgqF9rhthaY9c6gCsDws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843133; c=relaxed/simple;
	bh=ZOYKOxwr0N6pWmhEHgxblRjlL42AMNfZJaaOJ98e6PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfoRKIgWqN2mXgsenYWyX3S2DOy1KluJuKO9Yua8nlsLieth6Vp8NBJb3KyxH8aGPF5Ra9UU8Qha6/CYdR0PeP8tISvORlwmmV6F50TpUHIrxgWxNB+9KUednNF+e2iZJTVGv177SbZVk/wfFbiNpio5CkOSnsKRPEDpRl0VHpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RXuIo225; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so2673187a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843130; x=1751447930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kOHGqEvSGe1UBVUsrAHdsFwcmzz3ykk+SWQLbezNrg=;
        b=RXuIo225KwIFmCgBi66Wa06PZOidnfLXMLXo3mhQ7xTd162aQlshwO9oxxvX8ZCf9F
         eyKglI+PZdw4X1L1u/COsqFupibFyicvyB4NWqCHOgMZeTXi3xsWMKwLZamqD85CPFLZ
         twKReOKDN6EDifYZ0HjwbWKit1XMOlx6UkeQDoACJrUcV1z3wVHOOGNkVulR0f6pJtwn
         jQDfvMdVBDq25opwiLdHgjCQ5ofSXkKVV/FmKRqZb+UmrCT128dmmpu+fqBxHwpAoIYH
         bmLk0rTWAfR+WcywtJVvAPnFlcfZT7q49FH6TO+2CBgmSx4IcnyoRg1MtkJBhSvs5dWr
         3RKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843130; x=1751447930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kOHGqEvSGe1UBVUsrAHdsFwcmzz3ykk+SWQLbezNrg=;
        b=Tprkou4G+tGC8Q6OvqFAMGDhGNRLuPmq7xFFQvqko1Nhx8GAc8eeWKbnYjJhGZbNmf
         uCqV2UIkC9v0BbUXv1V6yLOAYky2xSdZAir7UkHWAO/M+8QePdiVWiCDrSGc0SAk60T4
         RIL3qR9SkqNmkOY31NXJ3QUMlOELnSe8bqumhXKZ9hmEtC7QYfIc8n61h5fuzcPfDyJa
         vo5kHK/LfN2GSEhXmHqKLcw+ty21GmgID49Dib5NkA0L0jBGB6Toh1+J/Zk0ktMJ8vp8
         jRvHhJbcg7b3PGU28Dc6SEqAKhENzG3AjBHU3Fa8cTz2buNu1h6L/mUi3ERd/8/1ItcW
         Bk4A==
X-Forwarded-Encrypted: i=1; AJvYcCU46dv3IxAyP71wUhyx0GsbCO3ITGN5oIsYGputHKrK/vArks+nmc6g/I1wsch5EiVLzS1kiaCK55BHlatg@vger.kernel.org
X-Gm-Message-State: AOJu0YzdPXzic3AI7B9x7/Twy6/IVnNTeNF/gWKwxr6ouKVxHoRf76Ip
	6YFg0SI4EX3DZ3TT0VsXNmR7MunF9ezKV/u9QrYS8/YwxIXOlRROqxQw9KNzzSOKaN4=
X-Gm-Gg: ASbGncsyBSK7ncNBMDC+PnuU8zWyj4Z/Fi/IpWfeKR4RfbFMphoMdWj3E2Tjzs3fIpR
	HnjZxCHdTZ6RUxRQzQBeA3TOB2MuI9ypmHkux76ZIgHoe25liMq4VSveLwcwan5TXpLIPZRqMWO
	TAstNFN0ljkxJNCft9iCUWis7/2rn3E+zKvfepuYdlZ6MKSYJ3LfDWHDSWnkhMZsm+v0TYGZkbN
	soS1CN/Cm0MyNCmjq9eykEVJj9L4rxn/OZbCoxG1jctRuRkKawcZFW8mUIeVqWUO1bofPJjRh8E
	iuT71Q8LTXPorknt8pJCM9+XT/oKsmjJTu/ut7J8CTetwH/V1/4YlCfgXlsakDC/kNDhPBE5CpP
	nqAjqzpw+mxNQWh6ByI4ambzWkCMyxwGn
X-Google-Smtp-Source: AGHT+IGxeI1ny65NArixLKEAHnqARo1P03fUWKEf2NZh57NeHRK7sKsw1QyXXl5uOkS98J55IFCCIw==
X-Received: by 2002:a17:906:6a01:b0:ad8:9257:573a with SMTP id a640c23a62f3a-ae0befe0a23mr205593866b.5.1750843130042;
        Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:38 +0200
Subject: [PATCH 2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmxr2230-v1-2-25aa94305f31@fairphone.com>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=811;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZOYKOxwr0N6pWmhEHgxblRjlL42AMNfZJaaOJ98e6PA=;
 b=VLU7REoYnzlQtwhzlNChJiU3xkdw82ByPkXhgYpCw5p9b0buePSV17RgciNvFX34r3/xDTZgT
 PLcVJbdn5wWDvArwbOmF5BN0me2ql1Q1HPLEdwF40cBKiqkEe8i9gHs
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the compatible string for the PMXR2230 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1e9ceb2187e988ce7c9514ff6dc2c..5759cdee7237e0fee705e13288a4255e4d0a83eb 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -97,6 +97,7 @@ properties:
           - qcom,pmx55
           - qcom,pmx65
           - qcom,pmx75
+          - qcom,pmxr2230
           - qcom,smb2351
           - qcom,smb2360
       - const: qcom,spmi-pmic

-- 
2.50.0


