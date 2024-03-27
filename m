Return-Path: <linux-arm-msm+bounces-15474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690E88F10D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 22:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8D0B1C2E6ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 21:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358EC152E19;
	Wed, 27 Mar 2024 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVUzGQGS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283714388B
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711575326; cv=none; b=UZt+vy++1lsg9pZzgHBrPCsgAPqesYcw0O0xLMSVPkDCQG5IezjSQw5TB8tKFQ3UILgeNP9a5qL0+lRZS88qW1n4Rwdmh49DvY7pfE9PMgfvqnHp/56sqJ4+II+APA5KjY8xbmn8XksfUTsRTDPBY5WorbRw01S6Brsu91kilSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711575326; c=relaxed/simple;
	bh=+mFEMlvAqVMkCsEGCFmkDGui+zyKSuicrJikHtT9McQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K1Vj9fveXfyI9UHHPhsSSCgFmPH0+9lo6KaJvWi0a3TlyW8TB/rMpv2ZmusWiPi64J6pB/BvDm9SI3UomF2JMvaKp4+ccSqMzAEfk2u38qvM/rm6aoyr06s80q537nO4FWTRRXEbFAE050XUrw3T8pONtrTGcpvaRuZW30QcM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVUzGQGS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a45f257b81fso32503766b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 14:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711575323; x=1712180123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mtRkYOvtkD8CRGf6enyfBa9Ua3p73vaQy/pW4ebjWWs=;
        b=IVUzGQGSM52HsXFGwOQXam+2Fv3anv5GPj3hbMprtcZfiTCmaVruj2uuQur1ZCi2/f
         gDCjXh8qNfhcRZkgLiXeC9fOfay0yUqqsA+9M8uNykZHV3ScocdqFStZq1rPXnfSdeBM
         YqkthJGkd9QJxedfrG16r4KII1nkVaLLTmzRXTx/6LgEsgSHMYjhLkh/APtk42ABBFZc
         U34erhzaD4d2BrVJizPvmFnndYf7shx/wGT6+NpoCt4GyuERTQuPC/WUUbpAmfh2JVAt
         q9MhPBy6PIbqv+ZJr3vrY88MGPPweTAFWWdTnrFxz16W/2dM0PG7Bt2wTH5g98nYjdKz
         Nrzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711575323; x=1712180123;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtRkYOvtkD8CRGf6enyfBa9Ua3p73vaQy/pW4ebjWWs=;
        b=eNoJKHW5iPpOsd0MGK7o+E80aIQTgz9xvtwa83JXKiST77Dgs+LPv2fvlePCASeGbr
         Ak1ERpi18O554TMzbX8vvjbTHK84yeBEo5uI2PM1fQFi4XPbF5mrtw5bUTuTL03mdjJP
         nODHGJk5d/iuMTS1QIegD94qAHJkJfgt5dNF16mgtlAW2Okx05z9mF2fugMWCIe5GWXu
         kjRcM5wYGZA5xysvecfRFgIUdJ4CEMBuEFn7NvBOqqU2SY18pUE1HTRcm5vQTg28WHUn
         kNaYd1U8MVB1lPkm/bGeJxokWFgnmLWF2+cBOyT7Q42dXqmOwk2lSGd6lLYyE1JgQUmJ
         ZWeg==
X-Gm-Message-State: AOJu0Yy6NNtp/FYzyxPt+bfzXoIxogzVv5DB+VfoKHalapJ+W0RMvvli
	K9iD+UvNHxF0WyvGjVrtqrvwj64OV/+kH8r7Ic29ZGrKWtvwcsyrcEA1+OUMVWw=
X-Google-Smtp-Source: AGHT+IHjmcsZl4Eh1IsMl4jaEEvLoILve2+XwzUApDWJWuqO3sIDGvCZtVo1PdiLOZNXpU3Bf+cP5g==
X-Received: by 2002:a17:906:454e:b0:a47:22aa:f8e8 with SMTP id s14-20020a170906454e00b00a4722aaf8e8mr558097ejq.12.1711575322823;
        Wed, 27 Mar 2024 14:35:22 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id g14-20020a1709063b0e00b00a473774b027sm5858579ejf.207.2024.03.27.14.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 14:35:22 -0700 (PDT)
Message-ID: <39b26447-80c2-4d71-b859-32b4a40cb31d@linaro.org>
Date: Wed, 27 Mar 2024 22:35:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-sm8150: De-register
 gcc_cpuss_ahb_clk_src
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240213-gcc-ao-support-v2-1-fd2127e8d8f4@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240213-gcc-ao-support-v2-1-fd2127e8d8f4@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2024 7:47 AM, Satya Priya Kakitapalli wrote:
> De-register the gcc_cpuss_ahb_clk_src and its branch clocks
> as there is no rate setting happening on them.
> 
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
> Remove gcc_cpuss_ahb_clk_src and its branch clocks.
> ---
> Changes in v2:
> - As per Konrad's comments, de-register the gcc_cpuss_ahb_clk_src
>   instead of adding AO support as no rate-setting is happening on it.
> - Link to v1: https://lore.kernel.org/r/20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com
> ---

Could you please confirm that this clock is governed by something external
like RPMh and needs no input whatshowever from HLOS?

Konrad

