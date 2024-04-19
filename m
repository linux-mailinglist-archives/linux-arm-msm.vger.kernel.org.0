Return-Path: <linux-arm-msm+bounces-17985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D748AB4E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 20:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84F41C22124
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 18:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AAE13B7A7;
	Fri, 19 Apr 2024 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvdGZAdz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC6913A41E;
	Fri, 19 Apr 2024 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713550549; cv=none; b=Zh675fE+lD/1sF1X3ggGwCYp3MCflvc1jlw2RZojvJecyCTXnxDwnkyQ663poEyybAz6xUoEm5CvRG6+9i1kr78Onm2Bclle/gsgQ+gOITtbKSJl5155OGk7pihsl7A3AKoxZy8RB6RZQ81HbgqoBmetMUUbvAFoljhUVC+dQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713550549; c=relaxed/simple;
	bh=+f7tJdF9+iWpktOq4DFJwgvD+TASFb4Clo9fG5dop3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fanpesOqVUH80uQkgbeOgTNYgagD7iF0YEWG+t26lyede8KZUJHRjFs3bgUd4x7ai/TMN3VG/2vH46lPlHhwGLOZCIoRSyR0gx5bRKug+Nm/xSqhA9O3ECtPNq8Skfodt7G2sywmtKH5lVoM4lfjjObkMGf2blQKo+gXXvqxGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvdGZAdz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8A8C072AA;
	Fri, 19 Apr 2024 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713550549;
	bh=+f7tJdF9+iWpktOq4DFJwgvD+TASFb4Clo9fG5dop3U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AvdGZAdzNknktRsgicuZQqRwws2Ox78SGNKf7OXiEbzg612bv9s7ztPLEFLlK4uAx
	 05d6MPvGnpma5KKmn/PPgErk1migB9lzUVN5TfjbU8W3KL/dkKc/X0kRYXxekhPJgk
	 UmPxldQNjkqPYb9tJSGzFqaejCuSE6QxIhO8Q5O5Mdaml/9sXX60eo2nw/mq7v56H8
	 v5bNqXL1N20a8GSU7jaUmtVhPdOeMLM4uDNZtm0AB+SAmpVXnHzUpk/r4GRDIuqOPc
	 HA485ujkoXx/S3h07z5OEX4Q082Ew01i625+Wo3aZ+Oum9HKBRMTOza9/LbJYt/Xk+
	 CZeG0u6S4yxQA==
Message-ID: <67c90fcd-df2f-40e4-9507-dcc9340f2319@kernel.org>
Date: Fri, 19 Apr 2024 20:15:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] soc: qcom: add pd-mapper implementation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-5-e35b6f847e99@linaro.org>
 <b26b5d54-d04d-41e1-abe1-600633882989@kernel.org>
 <CAA8EJpoyTXWY5uxJs2gt1Rths-HdgskuQFyw5dJSL66mxQOv7g@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAA8EJpoyTXWY5uxJs2gt1Rths-HdgskuQFyw5dJSL66mxQOv7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/04/2024 20:10, Dmitry Baryshkov wrote:
> On Fri, 19 Apr 2024 at 20:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 19/04/2024 16:00, Dmitry Baryshkov wrote:
>>> Existing userspace protection domain mapper implementation has several
>>> issue. It doesn't play well with CONFIG_EXTRA_FIRMWARE, it doesn't
>>> reread JSON files if firmware location is changed (or if firmware was
>>> not available at the time pd-mapper was started but the corresponding
>>> directory is mounted later), etc.
>>>
>>> Provide in-kernel service implementing protection domain mapping
>>> required to work with several services, which are provided by the DSP
>>> firmware.
>>>
>>
>> ...
>>
>>> +
>>> +static const struct of_device_id qcom_pdm_domains[] = {
>>> +     { .compatible = "qcom,apq8096", .data = msm8996_domains, },
>>> +     { .compatible = "qcom,msm8996", .data = msm8996_domains, },
>>> +     { .compatible = "qcom,msm8998", .data = msm8998_domains, },
>>> +     { .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>>> +     { .compatible = "qcom,qcs404", .data = qcs404_domains, },
>>> +     { .compatible = "qcom,sc7180", .data = sc7180_domains, },
>>> +     { .compatible = "qcom,sc7280", .data = sc7280_domains, },
>>> +     { .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
>>> +     { .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
>>> +     { .compatible = "qcom,sda660", .data = sdm660_domains, },
>>> +     { .compatible = "qcom,sdm660", .data = sdm660_domains, },
>>> +     { .compatible = "qcom,sdm670", .data = sdm670_domains, },
>>> +     { .compatible = "qcom,sdm845", .data = sdm845_domains, },
>>> +     { .compatible = "qcom,sm6115", .data = sm6115_domains, },
>>> +     { .compatible = "qcom,sm6350", .data = sm6350_domains, },
>>> +     { .compatible = "qcom,sm8150", .data = sm8150_domains, },
>>> +     { .compatible = "qcom,sm8250", .data = sm8250_domains, },
>>> +     { .compatible = "qcom,sm8350", .data = sm8350_domains, },
>>> +     { .compatible = "qcom,sm8450", .data = sm8350_domains, },
>>> +     { .compatible = "qcom,sm8550", .data = sm8550_domains, },
>>> +     { .compatible = "qcom,sm8650", .data = sm8550_domains, },
>>> +     {},
>>> +};
>>
>> If this is supposed to be a module, then why no MODULE_DEVICE_TABLE?
> 
> Ok, I should add this to the commit message.
> 
> For now:
> 
> This module is loaded automatically by the remoteproc drivers when

Hm? How remoteproc loads this module?

> necessary. It uses a root node to match a protection domains map for a
> particular device.
> 
>>
>>> +
>>> +static int qcom_pdm_start(void)
>>> +{
>>> +     const struct of_device_id *match;
>>> +     const struct qcom_pdm_domain_data * const *domains;
>>> +     struct device_node *root;
>>> +     int ret, i;
>>> +
>>> +     pr_debug("PDM: starting service\n");
>>
>> Drop simple entry/exit debug messages.
> 
> ack
> 
>>
>>> +
>>> +     root = of_find_node_by_path("/");
>>> +     if (!root)
>>> +             return -ENODEV;
>>> +
>>> +     match = of_match_node(qcom_pdm_domains, root);
>>> +     of_node_put(root);
>>> +     if (!match) {
>>> +             pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
>>> +             return 0;
>>> +     }
>>> +
>>> +     domains = match->data;
>>
>> All this is odd a bit. Why is this not a driver? You are open coding
>> here of_device_get_match_data().
> 
> Except that it matches the root node instead of matching a device.

Yep, but if this was proper device then things get simpler, don't they?


...

>>> +
>>> +     if (!ret)
>>> +             ++qcom_pdm_count;
>>> +
>>> +     mutex_unlock(&qcom_pdm_mutex);
>>
>> Looks like you implement refcnt manually...
> 
> Yes... There is refcount_dec_and_mutex_lock(), but I found no
> corresponding refcount_add_and_mutex_lock(). Maybe I'm
> misunderstanding that framework.
> I need to have a mutex after incrementing the lock from 0, so that the
> driver can init QMI handlers.
> 
>> Also, what happens if this module gets unloaded? How do you handle
>> module dependencies? I don't see any device links. Bartosz won't be
>> happy... We really need to stop adding more of
>> old-style-buggy-never-unload-logic. At least for new code.
> 
> Module dependencies are handled by the symbol dependencies.

You mean build dependencies, not runtime load.

> Remoteproc module depends on this symbol. Once q6v5 remoteproc modules
> are unloaded this module can be unloaded too.

I am pretty sure you can unload this and get crashes.



Best regards,
Krzysztof


