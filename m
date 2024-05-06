Return-Path: <linux-arm-msm+bounces-19249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 861348BCF6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 15:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259591F21DAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 13:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38ED7FBC4;
	Mon,  6 May 2024 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="tHmY2rea"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27937FBD0
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003313; cv=none; b=iEJk/c5TzOo2C184TbDHls877mhGnIY2U4k7hui56HjK6MyfO0BVtkJ4I1GNr8m55hOBjyIZUAPgWpDOBA4A5oTfLXXfHdnlFNYxQVjM3PYxVKoUw833J7OoC5GAMC8L8ZwM0C1CJX0Cpk6YpqzCpiZ0meaV/79UHlcKrzHpabI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003313; c=relaxed/simple;
	bh=KkTKkbItVaoNaebdlZbTplZomRRkcshA7Z5iO0bO4bU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kW81Op/iPuY20kzPNsT3sTAuMVwE7bx6PVR1t3eZBeTDJ7DzXJToZBAM35rgmfpH9MHB7ZjqMwJiAGas3lOAz2kRXfyO/kZD+5kAFj8PZeZkkAmFqIg/e4uK8Efb8VPle2RyNZ8vxrUyWnq9Z+9IeJb6umFg4xtCaFSnZ7etNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=tHmY2rea; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e38a7ebdb6so8271921fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2024 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715003309; x=1715608109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=tHmY2rea40SZGtV3urQvOGojFdJ84Xu2RZLL7uYIwm+t7JvRW474Qx0Su5oetg4It0
         18KAGe4Y8tlBcRjiV5XgdXxyJndv/j3uTLWqHk4Dmz5cH1JgWvC8YFWTLja1AKPhe88K
         ZXClSkDJ7oxWjP8VGljiBnSfLw1AYluOJsVbLo4VAHJ9Gl1tjeabS16FXom1IN2EK3Bf
         JGG725cs41wGhilnK8WrrVfuuh6lDOCTo38lg3Lp5xwJ5wrKKU65VDm8ViGc0JpK8lnT
         DWrIW+jrBXX4T11g8zdTxkOqSdLFPaLEZZh19T8s7WIPMFFlcr287OnSd4hbPwWC4bhq
         H7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715003309; x=1715608109;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=wkDNfR/it+u8PgoLOpBLjpZB+vcAqY2uhQuoDbUQ4nlRAILCuFQJHdD5iyotJUXjf4
         yE7BGxt8wb1+66RGVTDmAbf5p0NDaeell+KViNv+TUlc1hbdWDQLFysSykbSqPf5sQ41
         9JxHf3EIcMwgNUGQE4w+WkITUDS0PH2hesiGjKB/6R4DzzgGmopqvYnAFCB/4l5STznx
         OhbHUKCrpbZHd8afV10nl5q57wwd435Z+bYShtptaAjFkBqRan+7YK44b0zM+0EvC6RS
         2XF+HBfYDeEmx+ORa/znVrGU2fY4ZLFN6W2UaBERoUsR01/JXJJuE3150+k9hNmoQs0x
         n9FA==
X-Gm-Message-State: AOJu0Yzu29AKowxyPXUaKmGucldCUACgOS3v35BAPWjxcI7OcUVwypkI
	o92ew6USKT8F5gVv45Dd++0NxJQrmrscVeqJxzVbr5iS9F0WgDVfI86FQod1EFw=
X-Google-Smtp-Source: AGHT+IEHDHR77wZC2Yk5IorPluWW0YYOwrto2AB7fQsL46fWUFMec9hqmWFCuw9eYy7Pr6Rv+wJhcg==
X-Received: by 2002:a2e:a550:0:b0:2e0:12f1:f827 with SMTP id e16-20020a2ea550000000b002e012f1f827mr8328144ljn.43.1715003308828;
        Mon, 06 May 2024 06:48:28 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm16131973wmb.42.2024.05.06.06.48.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 06:48:28 -0700 (PDT)
Message-ID: <b3047c0c-16de-4426-a781-fa9239c42856@freebox.fr>
Date: Mon, 6 May 2024 15:45:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/3] dt-bindings: media: add qcom,msm8998-venus
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Language: en-US
In-Reply-To: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

msm8998 has the same video encode/decode accelerator as msm8996.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
index 3a4d817e544e2..56c16458e3bb4 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-venus.yaml
@@ -18,7 +18,9 @@ allOf:
 
 properties:
   compatible:
-    const: qcom,msm8996-venus
+    enum:
+      - qcom,msm8996-venus
+      - qcom,msm8998-venus
 
   power-domains:
     maxItems: 1
-- 
2.34.1


