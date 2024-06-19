Return-Path: <linux-arm-msm+bounces-23285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508B90F760
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 22:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E0431F237BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB541422A2;
	Wed, 19 Jun 2024 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4CO2fHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255A156F25
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718827635; cv=none; b=QnL0u1MzvVRZulwFljwyMHyJYmVsJ3/8FzPgk6akCbdgVoIUCEDlykyAyen27qOMolXOSKSplFBmAFVG2nDStRY0Jvg9lxCduas19I9deO3tcd0a+DwwWS6FDB6k7YrmvV2BEFucPrCM/sK9Pg59mN+wKXHQhpv+OWl5lwepITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718827635; c=relaxed/simple;
	bh=/cGu5fDl/w12kc3ON5hDJfk7z/YiFPwjDsYd3Ws1/kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPicxudSWR/DZKrKbe81HKqJWDShAVCx8dcCBTr1vzU/kRbHvBhDmWS4OZ3xMhuLU4uJyo/MnmjN3BWV7QXfMfK4PhIuZX3VazfVQ8ngIj2rfemViMGE+1hvt5eD/FVga9NznTxp3Vgyt35ll6Xl9Vq06S3LN2xuaT8ru4R9TBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4CO2fHx; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso31890766b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718827632; x=1719432432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXltk2pj8KgRtNfCGdnICNOGzFk5REHMQ6uROpqHKxw=;
        b=U4CO2fHxu7QH2aNZf36iTOyKdqoFDkeR+KKR/dSZr/rN6+G/+IIEB4PdrSQk6Yg+xY
         ZYg16uMCNUVyaWWJDuUnlhiXEs7QfF/MPKVYS30frzSofvR70vpPRl7JHaKn/H3SuTqm
         NNZQn87kt5zUCcPUi9IOoPtwuOQrQy9Ky5jkWZVv09Fw0P9aCPW5cNkTyDl01ht9AwhT
         I3LQU5r8fWjS2YVunKTaWzcn3j0h/Z7WUrEyIFC5QnCAyJVD23tTWvy5DHG2FHZO0GrN
         +3jHfCDjed8T5ewJBvTBMbD4ZdFMQUUNGITqHDCBOSCdSMBb9xQysgKmJ2jPXD7ZugyC
         lK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718827632; x=1719432432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXltk2pj8KgRtNfCGdnICNOGzFk5REHMQ6uROpqHKxw=;
        b=m+OAS2ELSYFlKm6LgxN2M5RFYiS3sZTLW1ZxroTuqCgKuejQoG2BmAZZSH7RS6ZnHk
         A87gqXZm7/TKksv3I+N6IQQatYBkPJD2CC33uqtJ3N4LA9n4HtXt9hXKKDzg1eTSl9tt
         6m+lghtT6DGNl05tpCSTBWam4jim+3yHJ1qyhBNhExTLC9sTYunmDpdbfdjAp5wy9JIR
         O4zbGCNzrwF0DcyurSG65T3E/QsEtR0MvHVO6qo1+6l9z1el0glvMf5ouJXZBmUxlvuO
         MlClMtSoz33BFjudjyRnRfqsRFSzwflgJAMPYUuWl3cx1iWfR8xUXlAwlP7Olo703Thf
         caGg==
X-Forwarded-Encrypted: i=1; AJvYcCURO+LrZ9enoOt8rAt2Z+WeE8UvA6xUUVglKb96Y1TT+wSQ/g5NZIRfpBztHaefbvr81xl21s+OqS4+Ux/remNTKeaZnKoq/q7e6wpLew==
X-Gm-Message-State: AOJu0YyE4u+NhkRMu6OpYaEffU4MZ+eWpkUgPrzBXb1ld/QBhrbqJmxx
	jJqwzy5RuI9UWLUe+oCkYejgDuYJ7OGK2eXQTA1G2v6hGZVLbdpZPRdGCU9io3o=
X-Google-Smtp-Source: AGHT+IGpVLdKvW9x1TLtFMIVprraYeiwC+PZrOrqrJwwmY5vpjguuk33olStWp+zoX41leRasvQbKg==
X-Received: by 2002:a17:907:c30d:b0:a6f:3612:160 with SMTP id a640c23a62f3a-a6fa410b16cmr254820066b.14.1718827631493;
        Wed, 19 Jun 2024 13:07:11 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4dba:9578:7545:6874? ([2a00:f41:9028:9df3:4dba:9578:7545:6874])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f99a09fe8sm144535566b.9.2024.06.19.13.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 13:07:10 -0700 (PDT)
Message-ID: <f40a24da-d201-4d57-b472-6c98c0e2deaa@linaro.org>
Date: Wed, 19 Jun 2024 22:07:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 8/9] soc: qcom: Add support for Core Power Reduction
 v3, v4 and Hardened
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Niklas Cassel <nks@flawful.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Robert Marko <robimarko@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
References: <20230217-topic-cpr3h-v14-0-9fd23241493d@linaro.org>
 <20230217-topic-cpr3h-v14-8-9fd23241493d@linaro.org>
 <CAPDyKFrNprXpdQBEzezyOJg6NJ8LLarZQV_mnQn5QyCrNmsRUw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAPDyKFrNprXpdQBEzezyOJg6NJ8LLarZQV_mnQn5QyCrNmsRUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/6/23 12:23, Ulf Hansson wrote:
> On Mon, 28 Aug 2023 at 13:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>
>> This commit introduces a new driver, based on the one for cpr v1,
>> to enable support for the newer Qualcomm Core Power Reduction
>> hardware, known downstream as CPR3, CPR4 and CPRh, and support
>> for MSM8998 and SDM630 CPU power reduction.
>>
>> In these new versions of the hardware, support for various new
>> features was introduced, including voltage reduction for the GPU,
>> security hardening and a new way of controlling CPU DVFS,
>> consisting in internal communication between microcontrollers,
>> specifically the CPR-Hardened and the Operating State Manager.
>>
>> The CPR v3, v4 and CPRh are present in a broad range of SoCs,
>> from the mid-range to the high end ones including, but not limited
>> to, MSM8953/8996/8998, SDM630/636/660/845.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> [Konrad: rebase, apply review comments]
>> Tested-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +
>> +static void cpr_pd_detach_dev(struct generic_pm_domain *domain,
>> +                             struct device *dev)
>> +{
>> +       struct cpr_thread *thread = container_of(domain, struct cpr_thread, pd);
>> +       struct cpr_drv *drv = thread->drv;
>> +
>> +       mutex_lock(&drv->lock);
>> +
>> +       dev_dbg(drv->dev, "detach callback for: %s\n", dev_name(dev));
>> +       thread->attached_cpu_dev = NULL;
>> +
>> +       mutex_unlock(&drv->lock);
> 
> Don't you need to do some additional cleanup here? Like calling
> dev_pm_opp_of_remove_table() for example?
> 

Ouch, right..

[...]

>> +
>> +       /* CPR-Hardened performance states are managed in firmware */
>> +       if (desc->cpr_type == CTRL_TYPE_CPRH)
>> +               thread->pd.set_performance_state = cprh_dummy_set_performance_state;
> 
> The dummy function above always returns 0, without actually doing
> anything. I am trying to understand the purpose of this.
> 
> Would you mind elaborating on this a bit?

It looks like this was put in place to overcome the

.. && genpd->set_performance_state)

check in of_genpd_add_provider_onecell() that gatekeeps calling
functions that parse OPP tables from DT

[...]

> Note that, this was mostly a drive-by-review, looking at the genpd
> provider specific parts. In general this looks good to me, other than
> the minor comments I had above.

No worries, every time I open this file, I end up fixing more and
more things..

Konrad

