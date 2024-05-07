Return-Path: <linux-arm-msm+bounces-19301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E18818BDE47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 11:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E08E1C215DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68BCC14EC59;
	Tue,  7 May 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="LVFae5Rf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8E14EC48
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 09:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074291; cv=none; b=cJpWXWp9YGp6vxu1tfyScmOMsdzug04+iYzyPeeB+twFfdhwo0o7pVNLDs4+PXCtiePbzWnKNDnNQ+ljd3MiYJ/BeyLFWV1+8uB5ynwhtb51KFVsr6cIIEEVQV4N5zCAMvp8tVzk4hEvRdRW2Q6/A5H7cWZsD4P0RlbzM+85a7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074291; c=relaxed/simple;
	bh=KkTKkbItVaoNaebdlZbTplZomRRkcshA7Z5iO0bO4bU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CzBWQTgw/vk8+ETfeQwcJhp4Q/6dB62q44k7BagHbYmirTreDGVpcYejVLTiaeMOnLrG+K2GAgTp5SpZES0hf17J9cjAKnOgRziW5GMD8ujOZOBzwb3HQypc3HBqjo3lSGB5UQ6mQ/XLwYwVPpkNy0bap6o8db0wDpjZfdprVFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=LVFae5Rf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-34f52fc2191so845816f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 02:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715074279; x=1715679079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=LVFae5RfpGMv5LTob1g/mFGi55l8vFLcw3mWgEDtaWWU17oj33b4fkyrvO9Cl1X5+R
         C3niGl2aT5RQyN9KNsPG8nMfcCEgB89PF96X8INzqR5rwEQoH8FpdB8fFeeBbLldHjxn
         ruO97iGJcCCd8ldRASmuKhPYT9M/xTExu0XciUaO/L3kES+PSb1QSa8BwXc0krzdtakh
         snAd4uuMhVv87oA+b8yDCqJ+cXAR/IKx7pLrbZF4Fsm4nR7943ZOSxeN+OmMzHWhj+QK
         yYEqcjs/16TCqmbB7A56l7KwwQeqCQCJhetMakFRA9PqEctlWJpvDh6D8ML8fhGznUvt
         /LqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715074279; x=1715679079;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmr0hfgWJAF/7VHtSyTJsAvmgssCMuwvQVaPUW5EW3A=;
        b=RU8J9OJqKaN+j4dzUH+Rl/24gBGLkkJY/8c3v3Zcm2hk/ouM7vGRv3aWpUFjHzApLx
         U639yP6Jqq4sHNheVjwrlk2dMsVz+u+aRHIveMVNZBfJ+r2rZLYd2bQKgddNtMfc4P62
         fbamUxNIPH5LuUy3cUu3FCjZQd1GmOdYjI7u0Jv2XSe7ZI/H/SS6f22goKMZXU09AuqL
         36bAusI6SzDlYODgi2E2gHZQn3IkEXekJeQIjAJVt+OM/VsemaAk/eIHxcvbFINZyv8I
         P3uzHWxW46WowkaVexkB4Qjn1U8o3F8tid3vp/X64El2+0qjinBMLsIhDOGF+Zh1q1rA
         PJ4w==
X-Gm-Message-State: AOJu0YwcUS/eI5MlhCbcsjepnYbgIBvLjJ3mCxH7C/59ze45i2Mnj//H
	CYgEBgSLlcpfbfRGMFwSct8PmygOlpkm35uByARNuRWQxZRqYCt4BiW94m80e10=
X-Google-Smtp-Source: AGHT+IEvHZqrO35Cj7iFDpIZwkGv71Jk7pChDTuL9+k9WP9x5+qLDkeol9+hXhU87pe+EvybRgC4zA==
X-Received: by 2002:adf:a18f:0:b0:34c:b31e:18de with SMTP id u15-20020adfa18f000000b0034cb31e18demr8591141wru.35.1715074279066;
        Tue, 07 May 2024 02:31:19 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id f3-20020adfb603000000b0034dced2c5bdsm12517710wre.80.2024.05.07.02.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 02:31:18 -0700 (PDT)
Message-ID: <a5a6b080-268e-4643-b652-76b220672035@freebox.fr>
Date: Tue, 7 May 2024 11:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] dt-bindings: media: add qcom,msm8998-venus
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
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Content-Language: en-US
In-Reply-To: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
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


