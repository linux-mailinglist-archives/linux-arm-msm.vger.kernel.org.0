Return-Path: <linux-arm-msm+bounces-26337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B393265D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 14:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A08CC1C22A0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876A4199225;
	Tue, 16 Jul 2024 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OcNOrxf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE441A87
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 12:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721132120; cv=none; b=FD/kktPQVn3KPr3VEAMY10T1CQKFM6fIdeixbphKeosqcv9C6GXUQNMpeLcvdLuaU/iD0rFWFNX79cUAzWhoX/TRRON0ptCASYD1P5BPuP3JtDSWvC27iPIPUKNaXbaMsD7fWFvYwHL1ZdMRmvtnta1+utxRWHpcWhLhCXPD8Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721132120; c=relaxed/simple;
	bh=/mJSEHVWWL/+/TzG4vXCLTvtSyApfM55zicTRypWeIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qeTJCWIzKlWobd543Vv+AigZU+BEXf76DjC90x+cM3ZN2Her7Ej3DpcXGp1N9gbpTVxBW+JT1aGrCnitVoO2KG4wB6JzjHRhZ4Hq0LhnKgsbVt8IleX1NA4YhgrQUXE56LVhjR7I3nVkDBhlzEy7TGmv8qwSQajq6O8DlxnIkqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OcNOrxf3; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-595856e2332so7076469a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721132116; x=1721736916; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iQwj37Z64kkWkq1QNNNRBOD95NNDPJjcOzXptOwbtXo=;
        b=OcNOrxf3FUK8MfZDS0v5z5fks207JeddgsHbPSNuDyPWiH2bxC1aHMnj44pkhQ4dli
         CzE6dicMDQ6q+TrkT1t5f9tdbGxAPp/WZrIm0zAZiEmt3b+vfcKdVDSl/9XB0/SVsf5Q
         WcbAwmQnlGEm3jgDPT97829aYEIo4KeAUJjeAtLrQscdk3pH61ezuBvyy24WkUbjoueX
         GHEpAw/cu3ip6ZZabTv2L3FQm7WjkF6zhoIVj8P96zLaA3ij5jrk5g9huRMYS954JCkh
         nAzCjSMjw0/rJYnm9ZX975JIqjd0LwAqvxvO96mNNmOd/uIUBa5Z/dkAoTLZFJPGLpEX
         HDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721132116; x=1721736916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQwj37Z64kkWkq1QNNNRBOD95NNDPJjcOzXptOwbtXo=;
        b=PAnrUkYtOBpUEXYw5LFo5iTTWTaJd7VdEUlikq20H/dyhxHH6l/anz9f5KDHhKYUP/
         62JfbpzHzHgvwWYBYkSs8WpyerRtNoZ9CB1LRDJvZUBtTycHcaWg9kBqp7CVd6viHlLW
         ZxhuaNJxcmPMbKuGX3y5YZ7adJPkuq/LRQItiFB3nQpKkVvht8JZvRFkK2sbJ81d/XP9
         D15QLvO/pLr2M/qYz13cT3bseERHAoUJ9rn0aYFKQhSh/IubYDCIX2mgCwHUYRTjOSyC
         sZSmalk8uBmyiua6XKSTE737r2wmSBcqn/zdYMgZMCRMgqHpZEjfb17HdQkh6LME7Tng
         ehOw==
X-Forwarded-Encrypted: i=1; AJvYcCUKMc0UJNgvEwdvj7owqRpkOnpcH3RGRuX52tl8eas4sjNel3H1tZG37vdAwL9qLEgODa9kohoLem7CnQYnhO/hg5gFHQAz8vWFKhK8QQ==
X-Gm-Message-State: AOJu0YwO+qMxSfBRZ5oVTgkB/tpBpAag9D3WASY3FLl7iUYcs3LU5fwk
	UBJpXAvpCVzvtdNw2Jwhd/J/x65+OIum02VOBoXBGO4UMQNdTSjCoVvEsu214V8=
X-Google-Smtp-Source: AGHT+IHfEm9rSiHqbH+SusBNneyOosPqVrpvY7RwUkyFYFz6O61G1Ifzfw53sglOfpelrIaM3lCSvg==
X-Received: by 2002:a05:6402:3486:b0:58e:4088:ed2 with SMTP id 4fb4d7f45d1cf-59eeee44bc9mr1445338a12.16.1721132115994;
        Tue, 16 Jul 2024 05:15:15 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59e663e4a6esm1594433a12.80.2024.07.16.05.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 05:15:15 -0700 (PDT)
Message-ID: <d454e01f-3d6b-4a02-87cf-3d289bc6957c@linaro.org>
Date: Tue, 16 Jul 2024 14:15:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] pmdomain: qcom: rpmpd: Add IPQ9574 power domains
To: Varadarajan Narayanan <quic_varada@quicinc.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, ilia.lin@kernel.org,
 rafael@kernel.org, viresh.kumar@linaro.org, ulf.hansson@linaro.org,
 quic_sibis@quicinc.com, quic_rjendra@quicinc.com, danila@jiaxyga.com,
 neil.armstrong@linaro.org, otto.pflueger@abscue.de, abel.vesa@linaro.org,
 luca@z3ntu.xyz, geert+renesas@glider.be, stephan.gerhold@kernkonzept.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240710061102.1323550-1-quic_varada@quicinc.com>
 <20240710061102.1323550-6-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240710061102.1323550-6-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 8:10 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add the APC power domain definitions used in IPQ9574.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Could you please confirm [1]?

Konrad

[1] https://lore.kernel.org/linux-arm-msm/57dadb35-5dde-4127-87aa-962613730336@linaro.org/

