Return-Path: <linux-arm-msm+bounces-9782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28D8496FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 10:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60D421C2094A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 09:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EF1134BC;
	Mon,  5 Feb 2024 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="32YrcUlW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7312E6C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707126707; cv=none; b=HmQ7UBk3E6myQZZT3nNIKltw9ywJ0OQY/Hws1oVQYdSrdXsWNXFmNGfyDzg5Y488KRs7pD3tzigRdSocDWR7hIfG90k8sIt/4kXDtmEdHGCb0D8tCBnZqwFQtgNhpIYT4UOgImAyUUjrV+27pOvL7FIK3fwkdKPNDxFsyQP9Z68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707126707; c=relaxed/simple;
	bh=U0lCGqAiVZ0MUuOj/Ntn5VO2EyqHJ4nwABWlgulqCiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0JyVtWI8HnuKwjyy9Pao8dj0F2Wf4r2UY+WtLT78727Q5AHCnL9qyJ4ZhG0g5vy9pYoU0K7HGWL8suLVeaRtQfndz8TNDQT2v/06iOoeoI+UyXPM3LQeFSPwY83ZTvGgM/xIkXTTJ/YkrifLe0sbrChWvN7UH13stIhzZUhtbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=32YrcUlW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b29b5ea86so1329847f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 01:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1707126703; x=1707731503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcJNhUjayAUsM5eRFTlrFt+tY9e56nsFDm4dq82UCu4=;
        b=32YrcUlW7Ij3a4VLzs4zZjxYbgKhlWZ3WftLkFRfhM/a+kk1yoInYGfgD5vRc4eEMK
         6cN6HLR63yn5Gxboze65U3FVGaQjXO8RTaHM60fgw5ykR+sjyahqqaH6V6ZxTK2L1JEr
         Gge5QNCmV0dHDCgp/rZAr7l4l+XfSlWCcZryBsjoEyc9fv5sca99d3SrD1BPcFHiUTjN
         +/sQW6EAZMGKxo4VZqZO3hhyhNu0qKLMAgjepQuLcZzP8MorDQ4Jlyw0mQa9CLXlEUXq
         zPI9GS+hBMgSsxxmlC8txKIXrdLkvxe16Tni78ZWEjAfCxhLvT7FFm6BaU9mWdd6NsLo
         AE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707126703; x=1707731503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcJNhUjayAUsM5eRFTlrFt+tY9e56nsFDm4dq82UCu4=;
        b=jVx8PkuxXxHSooUQ5TTzV5fQWykXTg7cXBCs3A8iiVqlDJ6rd/hhueEh2WSkaGz6kg
         BKAEInjwpQStr8wHMAqTo2var/dBujag26DU3wCTjxMDfRuemrumpbSdUSHiY3b0Wn4x
         L5bYz0x4ZX9N9UNxpgD4GkqABvyricnlvrppfgzlBxJzw8m+CRM30oIDzmyJSeOw1Xnq
         xwbRikWPJUdqo3svRI+xR5fyODEKFMfRbWNwpj2Tvvec8y6EgCFBr8uJbUybmRiTovj/
         chPI56RhHSp6Zo/Iv/jVJ5ifJ8haCxpAAKbACDgbjFj1QwQ7W48ohy10eIIGovWeN7qM
         Wp7A==
X-Gm-Message-State: AOJu0YzKyBDbTRx43Os5mstovoc2ERiCjQmrc3Lv6hoonXNBMH0GWLdl
	Qv9us35zMPwVGtD4OqRyfEa6JFXa0/qqiAUwWRWvg9k3q30/X9NjXGqDYv6LZhw=
X-Google-Smtp-Source: AGHT+IGJNGXgGRhWnDTIl18B7S/gLRQzIqMumvtRsv75KcKlRhGNsSuINndQOQMWQ+KuXkotxfn2TA==
X-Received: by 2002:adf:f24c:0:b0:33b:1eba:e508 with SMTP id b12-20020adff24c000000b0033b1ebae508mr4972081wrp.71.1707126702772;
        Mon, 05 Feb 2024 01:51:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXc9+1NB88U+T/6dlXjXGsP33rUvOvn6ogYbLwqcOgZkYaZW/vifSBP0GN7opXWwfpPYIy0RDQSpRu2C9wzMjuQjDWlWpQQ0NZKGx4A0k+lns3zvhbXeTQ2n2uQp01gy3drOt3+CtDJmT8rEEQPhenuvBjv1nmPj+UgTpjF4ppWWlKvOqTvnQuCg8dtdQRfKHkRivBriLpo/ESwfwnLLKNC+6j1sIH2fjlWATZ2PDCy65cWMSI1vODG4+5fJLi+YzuAOC31LUCnvZMROxcs2lSvIY/HnqKymNaKw3ZomrMRluSd5SvCiJwAmUttuXcGsc8YBshM2A90A/Dtyc2OmHRJdoi2v8TvjLZ/MlHI91t/lcVyVcJhyIEnYmbCkCy3/9Y09K1NmzObwj3IfUj851G3HGwxFN1KYXuvhmhrjhomurljVq5ygz6iJVYlb/HRgi1/kwoft7Dfk40hQ/RE+LJg5XX+S76XuKRevTGPpfGa29MTH1SGf1Jo9VJ28VV9/bIBKIZK4p0lxZIeAuA457SspAsL
Received: from otso.luca.vpn.lucaweiss.eu ([2a02:a03f:6aef:6800:2f37:ce90:b91c:e85a])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d400c000000b0033b3c2e73e2sm2278283wrp.113.2024.02.05.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 01:51:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 05 Feb 2024 10:51:38 +0100
Subject: [PATCH 1/3] dt-bindings: mfd: qcom,spmi-pmic: Add pbs to SPMI
 device types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240205-pmi632-ppg-v1-1-e236c95a2099@fairphone.com>
References: <20240205-pmi632-ppg-v1-0-e236c95a2099@fairphone.com>
In-Reply-To: <20240205-pmi632-ppg-v1-0-e236c95a2099@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the PBS (Programmable Boot Sequencer) to the list of devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 8103fb61a16c..b7f01cbb8fff 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -160,6 +160,10 @@ patternProperties:
     type: object
     $ref: /schemas/nvmem/qcom,spmi-sdam.yaml#
 
+  "^pbs@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/soc/qcom/qcom,pbs.yaml#
+
   "phy@[0-9a-f]+$":
     type: object
     $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#

-- 
2.43.0


