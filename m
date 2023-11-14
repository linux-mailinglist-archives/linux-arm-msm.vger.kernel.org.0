Return-Path: <linux-arm-msm+bounces-638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088847EB36B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 16:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A2891C208EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 15:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891444174E;
	Tue, 14 Nov 2023 15:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m/uARaIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F05405ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:22:19 +0000 (UTC)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC8D132
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 07:22:17 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77896da2118so366617185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 07:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699975336; x=1700580136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Po5bNUnAMf26y+0IzpEZVMd1oDRAIt/Fxhv7GPM+ed0=;
        b=m/uARaItGUraZJvby1YeOcdzC21VduEkrNRB7x9Sj2u0fYNdq3YkhBLvF+eoOzgOc7
         kZQwIz4eBIwWP5Z9dfBve27GkQ1ArnLdY450DYpKPgaySHEnu3pl3830+EwVEmQtpARM
         pB8CrPUZq9slMXrsYW/ye0Jdohy26UNe17jbaEjVJVzyi/d4RNzlr6lCM3a5bYlOrXCz
         sGjnEfzb6Ae27QXCc/VeINa/SRP7V2M5KI4Io5YWYScP3o4d89+ak8/AtGLA8INnt6Sz
         e+64A8hyaxGggQ/wsbA7rLSGyoUhGbLgc+U2mYerIURfn6D1cpM2uTiUS8wwt05OJPDd
         lKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975336; x=1700580136;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po5bNUnAMf26y+0IzpEZVMd1oDRAIt/Fxhv7GPM+ed0=;
        b=wSUFKBLTv91aEXqJkF/Pw/4KfGIvAtTN+ls8rEn71+28dctlt8bhw+pdk3EipwZQoJ
         +QsgtcTgYK+r7MLMDaVIZzilsOy0DU0WMPK5XPisg94ZA8tzoTFOGQfOR59nm51YwhS1
         9h63fFXBcTnqdvM4Pv0CLcUQ3MmubpykItNKstf5kSKYSLyEvR4ZXD70FXJCYW8D/Ov5
         zxL8hi6XjiOkBsUvIK2FJUengb2ws+NiECSyY2+trd5GhOvCW3j09zuBd/vNNKOsaJhT
         5NLybnUZ533RKJxpzmfeaF52jBmYExKEAzKlmVN4cZVcyu5xmDlC4+PgCWtSuYsmHvB1
         hp6A==
X-Gm-Message-State: AOJu0YxZM/VKghZ6UOc0fWUJ6buMitbJYOqSH/QtAdtrDbPC+hm6i0Tf
	8EUMh3O1VfWLa56v5m8fEQmdeEKUCjNemyDt8FM=
X-Google-Smtp-Source: AGHT+IH/2qe4eQuGFnTug/tm0t78mPkvvh3EXHnF8QXNsUqskc5rmp+p1woWPgM35aPDOJiUOOEHXg==
X-Received: by 2002:a05:620a:15a3:b0:774:1d85:54fc with SMTP id f3-20020a05620a15a300b007741d8554fcmr2252379qkk.74.1699975336423;
        Tue, 14 Nov 2023 07:22:16 -0800 (PST)
Received: from [172.25.83.73] ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id o18-20020a05620a2a1200b007743360b3fasm2730509qkp.34.2023.11.14.07.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:22:15 -0800 (PST)
Message-ID: <854dfbfb-721e-4827-bbcb-6c78ca570c15@linaro.org>
Date: Tue, 14 Nov 2023 16:22:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: mfd: qcom,spmi-pmic: Add
 pm8916 vm-bms and lbc
To: Nikita Travkin <nikita@trvn.ru>, Lee Jones <lee@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20231023-pm8916-dtsi-bms-lbc-v2-0-343e3dbf423e@trvn.ru>
 <20231023-pm8916-dtsi-bms-lbc-v2-1-343e3dbf423e@trvn.ru>
 <169824868224.758275.3309948002942732059.b4-ty@kernel.org>
 <67b0e974-779c-434c-b558-81840ec46cdd@linaro.org>
 <20231031075400.GR8909@google.com> <c72077299f457eabb1b885a5d2353f8c@trvn.ru>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c72077299f457eabb1b885a5d2353f8c@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/11/2023 06:24, Nikita Travkin wrote:
> Lee Jones писал(а) 31.10.2023 12:54:
>> On Fri, 27 Oct 2023, Krzysztof Kozlowski wrote:
>>
>>> On 25/10/2023 17:44, Lee Jones wrote:
>>>> On Mon, 23 Oct 2023 11:20:32 +0500, Nikita Travkin wrote:
>>>>> PM8916 (and probably some other similar pmics) have hardware blocks for
>>>>> battery monitoring and charging. Add patterns for respecive nodes so the
>>>>> devicetree for those blocks can be validated properly.
>>>>>
>>>>>
>>>>
>>>> Applied, thanks!
>>>>
>>>> [1/3] dt-bindings: mfd: qcom,spmi-pmic: Add pm8916 vm-bms and lbc
>>>>       commit: e9aec86e211ee493081e8934b8c821d660b417ee
>>>
>>> Hi Lee,
>>>
>>> It seems this patch depends on something not in your tree. This should
>>> have been clearly explained in cover letter or this patch changelog, but
>>> wasn't.
>>>
>>> Please drop the patch.
>>
>> Done.
> 
> Hi, v6.7-rc1 now includes the dependencies for this bindings change,
> could you pick it up again? Or maybe I should respin the series
> with it included back?
> 
> Sorry for making this inconvenient for you...

The best is usually if you resend it, with short update under ---
changelog (or cover letter) explaining why.

Best regards,
Krzysztof


