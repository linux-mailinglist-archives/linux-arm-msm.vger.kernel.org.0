Return-Path: <linux-arm-msm+bounces-1576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC87F50F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4A111C20A47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9335E0A1;
	Wed, 22 Nov 2023 19:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4W5S2qL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2761B3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:55:11 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-507973f3b65so105428e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700682910; x=1701287710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+ZO+2LtLsspGYjkGSBImBhjSvdf0joesNI/MsWxhYU=;
        b=H4W5S2qLDfK0C88THmVO/HBWw0WcV6beKzujRt3orwlwO73MGoWlalDbHZqjUWENDK
         o0mWZL1I/fi/5jEXvp45GWs9t0FDeJz354gBynJvnPFJ7uKYjnJ6CWvJlpSfRt+7Nrcr
         8YJznNSErfFUc9BJ1t8sn+eYzlZgqrhdqRZoBWc4TKWsSBlp6OFsLNPME8Y//ZTTYddB
         qhcD46HjdNyAvyMknes+kf1W1m7ea16xcwiH48pLHF7KaCTPPYQxf4x4e3EGkFmffLLF
         HMMLeJX+S/Ehv2NF2OufO1kiQkZfv34wlW80Ex2qnJ6PeiLkkRIZ2JgydFj/VoOFkaWU
         E/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700682910; x=1701287710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+ZO+2LtLsspGYjkGSBImBhjSvdf0joesNI/MsWxhYU=;
        b=IGFSF2iEN6/g1/zVHBtYyvb5zzz9a4RI7Cu2orzcBEuv8WbWySWmRcVgevzQF8yQQf
         SLsHblHgOTU8quxmRLgyfdnVq6GVBLjWTs9+35tSJaNxpHKrNQjZcT6VRkknY3E3mV7I
         iQTAgs9HwSNUBVzsQ+eGmQZOhvTWcuv0hRLc6BSa1XI/uNaCSJFWHAgfazlnxu2Z6xy8
         1XsO0QiAZ3mZYG3fp9k5eBWcKLEctDk7O6grHmNwccOR9sc/EVAHtPEK71ZQxxUHYovK
         XG4ogOmxAeNn9vQlLUAwi734olrvX6rg8NWBJ1194HZgEwjVWLfqYw11znUAPYmV0TR1
         BGew==
X-Gm-Message-State: AOJu0YwUg4dhBEuBoLylWNS6x/T6bMVh//42bqRuT7mx7TLfWufoX0ag
	vBz3hpZise7pCG8CZu7IofWsiA==
X-Google-Smtp-Source: AGHT+IEXsR07e3N354iRLZEGIb1Fw8Z0kdwblvjUdqyVTu5ptB1A29nLdcvCVUq3Tng0p0sdTDMH9A==
X-Received: by 2002:ac2:46c6:0:b0:50a:10a6:1448 with SMTP id p6-20020ac246c6000000b0050a10a61448mr2351439lfo.59.1700682909861;
        Wed, 22 Nov 2023 11:55:09 -0800 (PST)
Received: from [172.30.204.74] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i20-20020a056512341400b0050aaadffb49sm1327329lfr.140.2023.11.22.11.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 11:55:09 -0800 (PST)
Message-ID: <6e66875a-5cb1-42bc-86e0-b69cf73981c0@linaro.org>
Date: Wed, 22 Nov 2023 20:55:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] media: qcom: camss: Add support for named
 power-domains
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com,
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231118-b4-camss-named-power-domains-v5-0-55eb0f35a30a@linaro.org>
 <20231118-b4-camss-named-power-domains-v5-5-55eb0f35a30a@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231118-b4-camss-named-power-domains-v5-5-55eb0f35a30a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: *



On 11/18/23 13:11, Bryan O'Donoghue wrote:
> Right now we use fixed indexes to assign power-domains, with a
> requirement for the TOP GDSC to come last in the list.
> 
> Adding support for named power-domains means the declaration in the dtsi
> can come in any order.
> 
> After this change we continue to support the old indexing - if a SoC
> resource declaration or the in-use dtb doesn't declare power-domain names
> we fall back to the default legacy indexing.
> 
>  From this point on though new SoC additions should contain named
> power-domains, eventually we will drop support for legacy indexing.
> 
> Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
So, this commit should be a NOP within this series?

res->pd_name isn't defined anywhere afaics

Konrad

