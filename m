Return-Path: <linux-arm-msm+bounces-62372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E1AE7CAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10B0A4A5D64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82C12D878B;
	Wed, 25 Jun 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="O1I/1ghD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1712D6617
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843132; cv=none; b=N+Vu9fS5WluMXjWedOXo0cDU6XH9DGS8gPWuP1/Zu5s7e/5iGdO/upOlpgMNsrpSMobknAY+ewjVE4A2UxSxRPfVOCfXZo3a350QYheiYyySDQP/dLiXiGtv9KlW577G6oOsHSE080tTdn8GBNtRkHPTshci2L++GZJowny12aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843132; c=relaxed/simple;
	bh=szlnn2M+4cgp/Vz2v6MmXU8JqhkzFEwBi7m9DJTOn/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pe1fvTIui0ub1+KIGXHerfWPKigGu0QwbK/TUber4lpHTQSlwKKckL67clHUkKS/JEzEMOLU8mx5m8t3OMRjL0A7qXTPAvWBJoAPXk/9gSRSqqMWabn6VqIyArpYzaR4bagVYZz6eC/N6WenaS/QuHDCfZo4/DWIrT/XiAHMj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=O1I/1ghD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so1525532a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843129; x=1751447929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOpNNHlpH5P/vO/w8RICxSBAiEOYxdXjmF7zf7NwIHw=;
        b=O1I/1ghD1Vg9YuCPBgrisWzdXpCp5icaPQUmeBTSaB4M/p06IU07ONxNQkqjDJvY17
         s3UUuQuUM1yVnjNt4sSMWiqCJWecDCiyujNk7apLatCV+UyEvmDuqq+2FayvMFL8MdFO
         7fEXtPAaq5QfuAd/94XxmKJA6njNQrDr1kKMdZDFmq2S0ga5oa72pTHno0q+i/XkghcH
         3RAdw59aM6D6ORs024cHtRrjm6yT0M3wXcExI3wfHtZtMqDo7lA7n0VQiGZT10AMQlP4
         YMsFtQnMwXK35mwRJ1dwfsraKs+ly/hwN5Z8p8KwIryPuhlA/sqmrPeY7Klp6PMh9ZlG
         8fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843129; x=1751447929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOpNNHlpH5P/vO/w8RICxSBAiEOYxdXjmF7zf7NwIHw=;
        b=II+A9nYIbP0IxjA+s4T3KaCr2M/Py/wovqMX8Mm9v8qnUNMRhgNyrWVfcfA95IkY5h
         StVcqLwDZEqSiKzTFhz1JQ7RBo0VTl7WifKnGbA6yMbdYUOThrPyUXiJUTRhB6DOe2jd
         O1KidLSp2R1BDdXxIDs1jocdPYjC3/TGvFhiuuuyWFbKaF8m0NpMq6ovrREL+hktMzZg
         HPyMmmkuZGW1Bpny/Qk2wzImJ0RDG44vdmx/M0TZriKp8AJ+nO52r/XJlkRxN1EwAvBU
         d4W4PzbEU3F+ZhJIQCgHA8B2QkAV92emKT/CDpBUdjw7eHKujOSmi5gMaI4jxOXG8iWu
         /DsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX06BcT9aspDJ3jdB0ryXv+jWA+QN/dvYl5gh1pl6cA5lidpf60SMv/ilXgPe+UCKJaNOCZWj7weEv+M+D6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcr7JvdSMAoCPacdm/qbVSjnAvkkZtkTOAU3E/g+RWr7a8RfO
	zoVAIr1uwgkwlQeDSgxDfhYUlwAiPeaIDv1NmikTmgsKtv5LoNbuiwRtT9EpV7KyIzQ=
X-Gm-Gg: ASbGncuWr+uj/8RxkORD28HzC97f5nMx4AMbG4dOV54YpFohscwxMRCqrg39tmtdOw9
	d2NlRWDK45VBB2mKzd3IVp0Ykj/Szk+tfwYcU/BMwC9dnU4QgF9KU95X44kqzE56dQmnWaBBmBw
	AvIFcmcYzUi6IN4CpsKdgET0naUwgrKaCN5erZveiYewG+c96uzpr4epoNZPTRLysgL2OUH16vJ
	vnIs9gA/W1NAGdBmIw3O9ZA8mNvB6vPAwkMrPXeu8Lq3ex32PMtuoC+h0zw8K0F1bLrgH4q1+nt
	avyb71X7bRYa33VxIEvHRvwoTvC+LTLfako2myrS8XCuoCN5NfuwunB3kA1yyDKWbgzozlGSwp3
	jj9CHYQ+IMdpTL0lCKtYr++Dw14t0w9Qo
X-Google-Smtp-Source: AGHT+IEOlgJqlxUy9xEgR1EbV15vfXFfr7HB8R+KVivWIV+33DBCHB0Ad4TkImLeHdAU0HFbV+mjQA==
X-Received: by 2002:a17:907:d860:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae0c4e3ed50mr133473566b.28.1750843128605;
        Wed, 25 Jun 2025 02:18:48 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209b81sm1029043866b.171.2025.06.25.02.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:37 +0200
Subject: [PATCH 1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmxr2230-v1-1-25aa94305f31@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843126; l=860;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=szlnn2M+4cgp/Vz2v6MmXU8JqhkzFEwBi7m9DJTOn/E=;
 b=kXQSAv2Fqt7HSSldKm2UCk1LLN5WSSvo98wA8Yz4WCUHsWtZJIlbSf5APb7ETgs3Rhn0mt2t5
 Wy3QohD/DpmDWASWF+nbSL18ULi3osoE4xp22xH9sbb8MMeYKpTv7sH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document compatible for PMXR2230 Torch and Flash LED controller.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
index bcf0ad4ea57ea6dbba9ce71280bc3cb9f74db83f..8edb706d72996f8d7f0f5c2d5a5910790660275a 100644
--- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
+++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,pm8350c-flash-led
           - qcom,pm8550-flash-led
           - qcom,pmi8998-flash-led
+          - qcom,pmxr2230-flash-led
       - const: qcom,spmi-flash-led
 
   reg:

-- 
2.50.0


