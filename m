Return-Path: <linux-arm-msm+bounces-60880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5AAD4494
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 23:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3707D3A6323
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 21:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A14A2749E7;
	Tue, 10 Jun 2025 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xq2SfB7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02C42749C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 21:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749590113; cv=none; b=OtX2sDjgMQ3KMrdC70NLHcyT/wYmqEnW4oZx+eIsDyI8RrH6hdl4tRlPpksgQfxfGYePQFYrmWKmwYphWBtkyWrnPCp04A0UjdGen0SDAtK7BJHwn6MFMVItuava05bQIHARMhv9/womU3uexAiQZVN/N2Nb6kO4Zs8ce6fm2js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749590113; c=relaxed/simple;
	bh=Z38cuJp33LWArvdj5hyZqOMy6cQfIIBF5uVgw+/DXwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cb+2RLDCEKcA7j9qwtnXwDogLLlSc1wrLr5VsSq8ZdYZuXYzg7PQNxdp6BlvQcT0L+xLo4PLQT5E2En75ekJn5+hvG/4ZTjcv6dOpsVS1s4fuyDo1LcFBJoL7tRymFHZg92EJFsfp459yfbXtLlPzPocC9Pyv190+/0GYUJU1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xq2SfB7C; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55329e42551so728601e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749590110; x=1750194910; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp9DTTw1nAnCu7+mJSX+wELA9PUPZoEDRChqKms+7Zw=;
        b=Xq2SfB7C438tDciEkqt/yJ6bIvaGTzbR3hB4EFmmI0Gx2qAozCUjmoJ4kakAVW+kGn
         tcHluRuyU4K+mFX9JEnje+hDLfRkErv51nJGtMDRkODwUeLVd7i1x6dCp7Ml5S+SKoVM
         UJGXMlH8XkCUPELs4yVT/WkY7MN9cJV2VJOMRUCK8MJ3XO46gUjrv1lMCtpBRcqGJzTc
         7Ajsb12XsUGmv97Lp7kwIE9kQi6AsnO+nSOAitG1nJPsWFnVLnRj/N/fRbUrw9rUcPPF
         b3to4Z48Cd5OHqYq+Jjtj23ffoKErEN3HuZLmNwMUfQT+YYeL5NZOKJJaQYnowH3wAmT
         SPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590110; x=1750194910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xp9DTTw1nAnCu7+mJSX+wELA9PUPZoEDRChqKms+7Zw=;
        b=ORu3MS/ygAvFTW3RzLx2rU5Q591VpuJzBbxT1vkrvEP3cDfcCfNVypBg6I4M3CWffB
         EtJahqtY09FFr3qP6pNYYdi+FG/vh2ewYAFEe0NKAhAgoFgZiN9cBse2kbRduqEAA15O
         yCboXYeb3WsdNUuHnZRr7tvqu9lIc/a6iuB93m58U6ikePfSamUc7ofWsi/yvUM/ZkBM
         xcPLaJVyWnuLXD23kPsAHBnyi9eUX78FEsKAjvdkzXPYHzUjSychoG6F6VDw0Bo35u5C
         R/Eq8DH88LHZd69FuIt/h2b39BYbyv/22hXw3VzKT/eDsw9V0f42lcc1MjICrMK9edK6
         P+zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFZRcjUaS1g4GhKU9jDEw1nxp9zZI2whdrMM28wG/V000mz+9tHAFBMAahJshhiR+k12TK7wkIO/GC9nJP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9+6UP0csZMNfya6zGLBH6RxKwwfzzeQwQRbGhfgGa7u648Wi5
	xxOHSW5fP4lwaDQedPjuTCTVU8OGp2dh1n2XtofzTipNEMkJYrMTeYlTPjaM+Q90GIh9hWnlcxv
	muvxh
X-Gm-Gg: ASbGncuaPmLhHysBOp/sABwDxyLK+V8lTaCjYXZq4PD8JRVsX77xcc0taYdKSPm9tQ0
	DgV/aLR7xUG3jLt9NWKeCJUolKqnACRfx35vcVrdgY9UVoTIM//7muMMYPDEnSoQkEW45V733jh
	VuTVjKP6fmlogOBUIQTeOdkDRqoKlbXB00+uMx3z4rZ9kyHC23WBQ3ndX0M9dqLcE6BYI9DqHrR
	U+0kNKnkdbxnmJAe5cG/sfLl1XA9EbLxmOnrKHVk45i0F6VBQNmB269A5mfvR26w/890DeGYruv
	cwhzWwF8YpDXMF4CSXxoZnlukq2pSLUCYVC7rSDIcR7iHwo/pVX9LkOY5wM3n6cIOhRdkkfnsIp
	uFKEMSAPH4dHqIirpOHTuDKYdMoP0ZzUuXOt9Jts1
X-Google-Smtp-Source: AGHT+IGZItlbSfmzgJrv1aE8F6o4CS4khJJN0XB1HO2JSTvC5zGxXbluAy7/VezJqQ/3zhgAVPeIQg==
X-Received: by 2002:a05:6512:1329:b0:545:2774:4cb0 with SMTP id 2adb3069b0e04-5539c04fd49mr116148e87.0.1749590109708;
        Tue, 10 Jun 2025 14:15:09 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676cfe42sm1709240e87.30.2025.06.10.14.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:15:09 -0700 (PDT)
Message-ID: <7e82074f-0476-4081-b30e-2d1ace9bb3f9@linaro.org>
Date: Wed, 11 Jun 2025 00:15:08 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] media: qcom: camss: a number of cleanups and fixes
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <b268a017-b42c-4b4c-859c-a7e8ea6cf8fa@linaro.org>
 <bc139945-2fe7-46da-8929-2098d77e155a@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bc139945-2fe7-46da-8929-2098d77e155a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bryan.

On 6/10/25 21:53, Bryan O'Donoghue wrote:
> On 10/06/2025 18:26, Vladimir Zapolskiy wrote:
>> On 5/13/25 17:23, Vladimir Zapolskiy wrote:
>>> The patchset prepares the ground for a CSIPHY rework in CAMSS ISP driver.
>>>
>>> For simplicity of continuing my reviews of CAMSS paches add myself as
>>> a reviewer, as well it will simplify the work of syncing and avoiding
>>> patch conflicts between work oin CAMSS done by others and myself.
>>>
>>> Vladimir Zapolskiy (9):
>>>     media: qcom: camss: cleanup media device allocated resource on
>>> error path
>>>     media: qcom: camss: remove duplicated csiphy_formats_sc7280 data
>>>     media: qcom: camss: remove .link_entities
>>>     media: qcom: camss: register camss media device before subdevices
>>>     media: qcom: camss: unconditionally set async notifier of subdevices
>>>     media: qcom: camss: simplify camss_subdev_notifier_complete() function
>>>     media: qcom: camss: change internals of endpoint parsing to fwnode
>>> handling
>>>     media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote()
>>> function
>>>     MAINTAINERS: add myself as a CAMSS patch reviewer
>>>
>>>    MAINTAINERS                                   |   1 +
>>>    .../media/platform/qcom/camss/camss-csiphy.c  |   5 -
>>>    .../media/platform/qcom/camss/camss-csiphy.h  |   1 -
>>>    drivers/media/platform/qcom/camss/camss.c     | 182 +++++++-----------
>>>    drivers/media/platform/qcom/camss/camss.h     |   1 -
>>>    5 files changed, 71 insertions(+), 119 deletions(-)
>>>
>>
>> The changeset is left unreviewed for 4 weeks...
>>
>> May I ask linux-media maintainers to take care of the patchset?..
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> I haven't forgotten about your series, thanks for the ping.
> 

Thank you in advance, it would be nice to get your review/testing
and get the changeset landed into the linux-next.

--
Best wishes,
Vladimir

