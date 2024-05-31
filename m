Return-Path: <linux-arm-msm+bounces-21304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ABC8D64B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F15681C25889
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9538F4D8C1;
	Fri, 31 May 2024 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bjs7yUUg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02EB59147
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 14:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717166507; cv=none; b=TpuXL3Dg2J1Gk8E7qJhJXBKqiK/uN9mbHCiTKYu/RZiJrsCJ2CZ8ey3U1QwOI5M3AFJmkcQm6lKWMW3I46RmIrdpRqf3FUtsO6ErtP4HOaU5XVuamCYHvrhXvYf7hJ7O5/Sm4fnC0dmL/BIb9l5HTvwioFi9sC5pMSLNpzIFvUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717166507; c=relaxed/simple;
	bh=/mY2U2OQsyWm+ScN8RmLbRsvXmTLMxCWlVpD1Esh4zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkfecRC7JiZA5DRgJ5Zg7+DvxDmJx8kvReV/iWdR3jIfJm1j/3HooYt6tDPv3g6OeWlO1tTC993w4Z9PL/Z7ZovRh4iIKaJ9/RnyJqCKRTjsUFVfxkkXRpQtpm8EvVxRr1zQ9BZkjCc9LyXT0LOEJBkyDvLxDLDNPghr4Si0ht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bjs7yUUg; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6302bdb54aso262874966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717166504; x=1717771304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wM4iMNgM6AN4uQFmuNwfdWbCYilqAUY0VN7+CIBjuO0=;
        b=bjs7yUUg2cNV8jsxc7Qxe4fMcQxrdeqPVa+ZHC2ZtQ8J1jN/psR7MBTLUgkLBl7sm6
         8YWTKEEV9UJgGahddH6V/oWn5LCi7F/Rqc12gY3s7u2IIRuPGB3SbzXvSXUiTqh/YNzd
         JwzhwoSNMFqnPuBkVdx8QInW2hExFP7/FgCt2d15VAg8y8oJPYPdCSdYr/m0DYHy7O7y
         +DrctkmNUGCmp+YOoIWhEdnmcPqAy4JGidCylyZomVbYYvS1iuAQsIyg7A58ZDeSs6Ou
         36HCq+5Rwb6a3AXEYtyBglMUAXSoHpmoJDyB0CHo67JtifZ4AP62VpLANyPauY+NseLU
         bS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717166504; x=1717771304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wM4iMNgM6AN4uQFmuNwfdWbCYilqAUY0VN7+CIBjuO0=;
        b=e7ogbGzMVX0WocYuBJ9zbgLAel3hA9cfsJvw9H+V1rqHzK1bK1EWo0nr1n6JJzGZFF
         +YDu5n5xXTDdzs5RTvfVgBlN3dQznQEzx150mlcAQ5Po0+PdsGMKixA2pT0QnkNBzX9j
         YPzT4/98yZgPjsmt8zoOjrN20q4Yzlmk5K2MQ6N4AOwh+eNBAA2DX5l8A6sGC5WzXmVw
         X7hVj9fic2BHAcefmnmDA85Iz8gK5nA4pJPsUYKz8ecPCokveTiHJ9HzocqAl5e7bQs9
         jVBLXs0mithWPg1jm5HlVB5sn6tjm07fRB+pz9SKCiHpNb2PiO5aHQ4ivubtcHaOGRfo
         XKuA==
X-Forwarded-Encrypted: i=1; AJvYcCXW8MDfqPATkqCHpqD9JFqogg11n9lvWJ0Gn81tHY4TDQQHZ2osxOxqGlb9Mu1FNrT/wYFizvlM5IWiUr4Cybys59KJz9CDL7DnrChKLg==
X-Gm-Message-State: AOJu0Yyyfuf6q43OgCJXiw+snyXJozS0NDOq+gL6brOq+p5BXnN6bRY5
	63GpOkE/vA1Dyi943l3oXB1WE97gsmZodQ7YdC9v2aRs6/DiWehz3E8UA61tBaaYetFqqm++U0i
	yzIY=
X-Google-Smtp-Source: AGHT+IG89UCXBY9sMYsCIDn4XD4Lh45WwFRxc617lceNaz6OdCqNW+vNsmTaVK8w0tzLxEwEnUHwrQ==
X-Received: by 2002:a17:906:171a:b0:a66:7666:fc64 with SMTP id a640c23a62f3a-a681fe4ca10mr152684466b.4.1717166503984;
        Fri, 31 May 2024 07:41:43 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85c42sm92470666b.163.2024.05.31.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:41:43 -0700 (PDT)
Message-ID: <33db558f-2863-4246-a06a-d94ae2efc0a1@linaro.org>
Date: Fri, 31 May 2024 16:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Doug Anderson <dianders@chromium.org>,
 Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
 <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org>
 <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
 <d61ede0b-f689-46af-9bc8-e715784b86c0@quicinc.com>
 <CAD=FV=Xwf4eW+zwPecDg5855nVEY2NQMqpvHu59_e2xma6=wxQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAD=FV=Xwf4eW+zwPecDg5855nVEY2NQMqpvHu59_e2xma6=wxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.05.2024 4:31 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 31, 2024 at 7:27 AM Krishna Kurapati PSSNV
> <quic_kriskura@quicinc.com> wrote:
>>
>>> My only guess is that somehow SC8280XP is faster and that changes the
>>> timing of how it handles interrupts. I guess you could try capping
>>> your cpufreq in sysfs and see if that makes a difference in
>>> reproducing. ;-) ...or maybe somehow SC8280XP has a newer version of
>>> the IP where they've fixed this?
>>>
>>> It would be interesting if someone with a SDM845 dragonboard could try
>>> replicating since that seems highly likely to reproduce, at least.
>>>
>>
>> Hi Konrad, Doug,
>>
>>   Usually on downstream we set this quirk only for all Gen-1 targets
>> (not particularly for this testcase) but to avoid these kind of
>> controller going dead issues. I can filter out the gen-1 targets (other
>> than sc7280/sc7180) and send a separate series to add this quirk in all
>> of them.
> 
> Sounds like a plan to me!

Yep!

In case there are more gen1 platforms than what we have upstream, it would
be of great utility if you could list them all, so that we can have a reference
for future additions, Krishna.

Konrad

