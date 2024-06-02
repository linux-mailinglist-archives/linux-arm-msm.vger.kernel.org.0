Return-Path: <linux-arm-msm+bounces-21417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198A8D76B4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 17:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4762814AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 15:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7341A45948;
	Sun,  2 Jun 2024 15:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRIm5PUt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA36D4D131
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jun 2024 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717341980; cv=none; b=DHyxTxPIaeG/fKmAp4EacdDk8aMt2IjPlyN0VPiCIEtBLo1N385n3R1GlbwxSz23BT8mNS37u4LcH1fd5vodj3GnyCNeztrd5C8HLfV/3QLl0Dtqv58TlbVtT+PcAXomV9LfjV+rbRpWvULogZm6fEG2lqHhxfX79u1PCR3k5Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717341980; c=relaxed/simple;
	bh=wlOZ/2BygsEoJ3IYi4Ou7VSgO7hvq4lySa2LhNyPpSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muJ61gzhKXpzrg6FyXYIDPFw97/WW4ctFq018FeQn6pUoEcIJynCEOVMzFPSM9bk0WyRL1G7WBptXsXlw/5jFfMKXihmq7CihN+GBKOwGyPp1hLBskKAHe+UyeDJ1UxK2ctl8NpDv8Hel/UP9KRgJ8ft/TmMYzT5OPRwci0FtBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lRIm5PUt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42137366995so9722285e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jun 2024 08:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717341977; x=1717946777; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EDnSPteWZSNwlkMPmNdNqV0H+bMioQUp7YXJr2F8J1Q=;
        b=lRIm5PUtuCbM/2PPQsrfpWGCRvFS18gfAZQ/HKkQJ9fTyqZVTyK0cVzUGDfZ7Jf359
         kcMZuzcoypt97BBnoX1VliVueyTAc+a5VHESFa1Pp7wXCz4fISDdmkBCaf9Mf4vAV7TD
         vjcpKXUMxU/nhghzfPqM7O2ZPs8zGsg0jVhRJHl1c4pQ4hXwRIgT5+x1oPEvpbo7rWWs
         IGSJNr+dRwnFUOhrWF9mQM9IcqGPV3/qQGefsna9nhKMpu9yBxsw2wpfxwuZzBLJnrEN
         WVxJuqtyfbfDjZ9rjOOBJIZ/ijfIvUlLM1pzqawas5+02TEs5eJOFGS/D41ug/SitSXf
         BG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717341977; x=1717946777;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDnSPteWZSNwlkMPmNdNqV0H+bMioQUp7YXJr2F8J1Q=;
        b=voyy8XAriv3px/M2S32E7LHZ1vryQOOSYPzGMHeUWIQQttG5UhAaxZNzNlcpe1dt3D
         sqC6fAqayykQhNT0B5uMDf20Cqxzc5vM8tWF4R6Or4CrS9JCysYNND47p4io5tfUxTxF
         EiAsnMRd7/XeThUpWT57wLpdqABLzjCtMz/24uQ1d9x0fiayP3q9/i5ANGEbjIYhPrAB
         GODVkkT79hnYaL80eHCwDH6C/kaKTPZj8HQcX/4/2AC0EAIU41cbs3naGPn4IhsIkdIT
         pjWqrLdJVUFiZDfrgTd/78R5qB8cof0GSNKVRxhArLc/z/ZzDQkFJFzNfwA7oWFr5R2O
         z41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv1RXSGQf37OHusXiYQ4/fiKkgVehyO9I4MNPfygtl4JUKStcomnyPNaMfeVKdy3NbLgyCVQj8IEuRD70WDLex8FKgh5XiO2Riukq/mA==
X-Gm-Message-State: AOJu0YwpcD1IIM0S1Jw+F6LBH1nYaM0yi7BLUp2d7QSzrvb9xi9GOqjI
	VytRcpYVRlGk4sOMI7GfWqTegR1ZeIy9RDuIP7kBz19N04oenbCiDRzKExk4DK8=
X-Google-Smtp-Source: AGHT+IG2Z5KU1y7n0hU80sL96w1ZXcGYYaC/HskdBHN6Z+5bb1+Zk2u8D6PU2JCQYdil74FATnNYSA==
X-Received: by 2002:a05:600c:1550:b0:419:f911:680a with SMTP id 5b1f17b1804b1-4212e046b4emr66550395e9.1.1717341977046;
        Sun, 02 Jun 2024 08:26:17 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212709d336sm116556335e9.37.2024.06.02.08.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jun 2024 08:26:16 -0700 (PDT)
Message-ID: <9fdf4c46-a07e-4dfc-9992-4dd94d8dab5f@linaro.org>
Date: Sun, 2 Jun 2024 17:26:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 6/8] dt-bindings: clock: qcom: Add SM8650 camera clock
 controller
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-7-quic_jkona@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240602114439.1611-7-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2024 13:44, Jagadeesh Kona wrote:
> Add device tree bindings for the camera clock controller on
> Qualcomm SM8650 platform.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8450-camcc.yaml     |   3 +
>  include/dt-bindings/clock/qcom,sm8650-camcc.h | 195 ++++++++++++++++++
>  2 files changed, 198 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,sm8650-camcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> index 645080b848f0..f58edfc10f4c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
> @@ -8,6 +8,7 @@ title: Qualcomm Camera Clock & Reset Controller on SM8450
>  
>  maintainers:
>    - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> +  - Jagadeesh Kona <quic_jkona@quicinc.com>
>  
>  description: |
>    Qualcomm camera clock control module provides the clocks, resets and power
> @@ -17,6 +18,7 @@ description: |
>      include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>      include/dt-bindings/clock/qcom,sm8450-camcc.h
>      include/dt-bindings/clock/qcom,sm8550-camcc.h
> +    include/dt-bindings/clock/qcom,sm8650-camcc.h
>      include/dt-bindings/clock/qcom,x1e80100-camcc.h

Just squash the other patch here or drop it completely.

Best regards,
Krzysztof


