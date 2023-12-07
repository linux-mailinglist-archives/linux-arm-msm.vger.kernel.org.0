Return-Path: <linux-arm-msm+bounces-3770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0AF809140
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 20:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3421B1F21046
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 19:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3304F5FE;
	Thu,  7 Dec 2023 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6FtnZ0D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0131725
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 11:26:20 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bf26f8988so1405203e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 11:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701977178; x=1702581978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOzcubbEVdDz75w1DZaKyechBEFmqFyKaigVY3nKiTY=;
        b=I6FtnZ0DB1W63MhHpCebuHpkJ7Ml6H5p5StGsWng+eDHgX+hmhKnwz6prcCPWIr9i1
         qMuCixrZ9/zfahgd4/1aSWL80fb7LLdVEZ0Gj5jZLWG6yq4sxqvPP6vocziMsbmKnUPN
         7pEzBwqekaQ8oT8hLt3M6PjjldkritZ2QdRaVCkXaiynydFC8k2IwOQXBXCUoCOc10sD
         eC3vYKYKctsPlToWlwI5zSz4U5bt9OnnEJMAJDHn62qu0I3BNvKyaLVTTCdswMMVvnp6
         coT0JUk4q6eIdsk8/iHoj8IWxl+NlOjOzWDZkB1WJMgqsZxFUTDBb9YGAappfYY/ugKx
         ENnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701977178; x=1702581978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aOzcubbEVdDz75w1DZaKyechBEFmqFyKaigVY3nKiTY=;
        b=iWoKf4nP3hTCSOkkmm9JJWYnf7EtzxrOhARDb6XRaF3ebRHg4Qsbaq1EGM/KVRR7Kb
         YHpQdzqjW4s5bfve4csAZHXG0TGX98Uiin9/J/VpLq3iMbu/NUEB31ABDabUQtzZiKSH
         0iUwgU4nz2PcjpjWZ/So2RcuTS3LGsRzkGN7uzIiH24yXZ83wXCzpYNQ8P36Ox9xUnwe
         HOJu2EVNJGnp1mbPcNxNrAz0K9ahZUlv84EKX+eJiiEkQGzIx/fEICQzDYI9H3LxAKng
         q3TnSukGwu56miGwpzcUG6ZARG2PpH+ZEz4mgfyE80MyepH04FJOJwqVFWqHrDG7J9gF
         KsGg==
X-Gm-Message-State: AOJu0YzvyraN006WJd6u3Vjk3u8QY0hvvOsTPjjQDp1m6Kz6Ma0GFa1K
	2rRs2yEuiFiLAHRfGHl70uy2Yw==
X-Google-Smtp-Source: AGHT+IF/nD3esvE8SFz2Rih4t9vnlpWDFruNy5/u5hg3+t5tefJU7CmIg4sky/bghnuX2LbWm+n2jA==
X-Received: by 2002:a2e:b604:0:b0:2ca:6b1:f750 with SMTP id r4-20020a2eb604000000b002ca06b1f750mr2304235ljn.33.1701977178466;
        Thu, 07 Dec 2023 11:26:18 -0800 (PST)
Received: from [172.30.205.181] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a11-20020a05651c010b00b002ca0a5dc73csm24380ljb.9.2023.12.07.11.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 11:26:18 -0800 (PST)
Message-ID: <644f49ae-26f0-4a4b-9a3a-53076be31d87@linaro.org>
Date: Thu, 7 Dec 2023 20:26:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: defconfig: Enable SDM660 Clock Controllers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org,
 Petr Vorel <petr.vorel@gmail.com>, Martin Botka
 <martin.botka@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Aboothahir U <aboothahirpkd@gmail.com>
References: <20231115205318.2536441-1-pvorel@suse.cz>
 <2bferiemkljxua63v6ogifpzhlbj6m2gycxrbitgmc3ybj2a4p@7kfnzcrjj6jr>
 <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpoEzTeOSVy5qVCs6eSBTxWKRfDq0UzrEjz1Kx1sG9xkCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/7/23 19:54, Dmitry Baryshkov wrote:
> On Thu, 7 Dec 2023 at 18:27, Bjorn Andersson <andersson@kernel.org> wrote:
>>
>> On Wed, Nov 15, 2023 at 09:53:18PM +0100, Petr Vorel wrote:
>>> From: Petr Vorel <petr.vorel@gmail.com>
>>>
>>> Enable support for the multimedia clock controller on SDM660 devices
>>> and graphics clock controller on SDM630/636/660 devices.
>>>
>>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>>> ---
>>> Changes v1->v2:
>>> * added commit message (not just the subject)
>>>
>>> NOTE motivation for this is that some not yet mainlined DTS already use
>>> both:
>>>
>>> https://github.com/sdm660-mainline/linux/blob/sdm660-next-stable/arch/arm64/boot/dts/qcom/sdm636-asus-x00td.dts
>>>
>>> Kind regards,
>>> Petr
>>>
>>>   arch/arm64/configs/defconfig | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index acba803835b9..10a098aa8b1b 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -1235,6 +1235,8 @@ CONFIG_SC_GCC_8180X=y
>>>   CONFIG_SC_GCC_8280XP=y
>>>   CONFIG_SC_GPUCC_8280XP=m
>>>   CONFIG_SC_LPASSCC_8280XP=m
>>> +CONFIG_SDM_MMCC_660=m
>>> +CONFIG_SDM_GPUCC_660=y
>>
>> I'd expect the GPU clock controller to be a module, can you please
>> clarify why it needs to be builtin?
> 
> To allow the display to be enabled early enough?
That sounds like a terrible bug in drm/msm.. Display should
be wholly separate from Adreno.

Konrad

