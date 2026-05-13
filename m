Return-Path: <linux-arm-msm+bounces-107269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG+ZOgVpBGpDIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:05:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26899532BDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 084A330F8DB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA5D3FF8B4;
	Wed, 13 May 2026 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLCjoli8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A83EE1C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673564; cv=none; b=T9KJr82XGCQvYusXxrM7cX3ahKmYZELvKxqeoyF4/h7nEosshUwWShbUJ+Ch5ZYA7l7j/cSDBOqub35ZFeg0Nezpe1sqpzqequ4hks1zqN+0ZLRnAHIICl4KEndKgLtd6CnjyJUX+P5qd02uug6U981IBxQXbeZxcUYQhaksbq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673564; c=relaxed/simple;
	bh=HsY5MIeA4hOcwSXUwi/tyCOWbILSHzAPQAce3C7wNKc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F3+YzOMOENoVHqk1qs2YThoEGWIzXUDIJXR0WDBvmzVAAASe6qz3oeV0BTc8VIqjjGjguK13gvUjzOvhuNJK5Rok/hkzZX6eR76WthH+q98t2GpZbzgH9CMexvAZd0RhsUjvnnvsUbHr/jAi8nl6bsSI/uyFJOHGj4NRcZGrzho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLCjoli8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so64646425e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778673561; x=1779278361; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ru5o97ykp5715LdAIbuApmVualUVsm7HDP8jRRU8bOk=;
        b=aLCjoli8HJr0h4+2yTM+do2Ec4GTf4yNDfrJY7F80rR1V8zFsoyzN6dBwrZ1TOE+dg
         KQr/0Zo95sWxj2GdWPD++PCQNtkZIbEwP804/mXsVAmqYODhuqFu8xP+7yHgka/jbcTk
         /WifHGxUoMftBddMfTGiVb0eAJQ1NeOoBYo0ppRwa1PZbmS8hGIElgG1v1K95XFb8OHg
         CGzqlu4vJQ51v3EQ/ghRSOJmkSuRURBvb5goJhRnB/7itxqQPPVkfaPPURoELXhbYFcY
         tpeuyowxLasND3cuulJmc6XToTQ/E6No2Ymm+qjQBEDsmqmLV5Dl3PDwbDH4+Fv9okim
         6GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673561; x=1779278361;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ru5o97ykp5715LdAIbuApmVualUVsm7HDP8jRRU8bOk=;
        b=ZP1h06sts0Pg3F7AeRWNbq3iHbUEgbZoHgert+trRaLjcUMVm5vTZferX1M3dRGUwy
         1YSYIUVMBmecXZlCNTzkyVTgPX5uve9rzR2QkdXxb14dKV9vwH3tgU/iv2iKmRhqDHuN
         XDM6vZsFBsTdWPnlQSY/j8CBoOt2E//ZQUe8rEFJehmW4AgSA/8n+RnTq/cRn1hpKgHh
         6aC+EFswrkboy2OLmRm8HAVuLojvYuFn87K7iLxvT8Ory8wzzEFIgUaJeId3AEJRN7AX
         gDRIa+hwS2MVw28QvTxujNwn9EO5tNFRhqq0o+JSAlZ9J7peJxJmNVFSf7FyUGGLc1ZT
         TKeA==
X-Forwarded-Encrypted: i=1; AFNElJ8a/qrTA13HTeapDZcIizjd8hgAII2UjcRpVLHx7ZgwKRoXR8Hq4uC4FUvSrXnumH7IEUpgaBDUlCqs88wl@vger.kernel.org
X-Gm-Message-State: AOJu0YxBW9+oUGnWS5ovn+H32DYKWvjDNM4G39MOWAnzY3tnXVZMjYTA
	XaHgKH3pLryzwZN/MdLXnmSFJM0UGk13Eo4SA9bMxLalbhsx0VAcOlnH/5IDBB710x4=
X-Gm-Gg: Acq92OF9CROC3qeizmOyDlHXGLWdOX/2Qtp6JT21NKZqe4vGfrCOlJH8RE6sE79VNMv
	nepeXI9gY1N+YPySq6T5vSDo9Sf5VC7E0Re0+QFkY3w+y12Vz/9ABYNR3rgvkNz02HkGBp+n1A8
	eFohyg5RqDJbdBdi+B7OVMvh8WCBBnHgj7S48+dQlOFDVDf2RLlBWKKUUk/J+pAEm9WF35iKUMe
	Xk4Wf4NLelL49U7USW6G8pfgMayMbPlwxJfJLYsOgm9oPIQcxaUCkzLhYbC/GL7ch0XRoWRnd2v
	Qe8UEqdJUMDTNhm5nUQ+vOtpWaVwpvL0s7eNW+Dps8xf7XARzOXMCabBBuNRSv84AQ/oqkoltPE
	B38U9GCQ4v33Ck/bfeqt3eLaexflYtViCTvWXuhid7TEkcdDWRV9AvcmgVR4nuRbNMDtVRMESih
	r6+P7F9UsEUB2vfzQmSpBoUUspSKiAS71QwF1M9kIQpfT5AhNz+KdGqS4Z7ZVB1FnlpKAPyhOV+
	hCH
X-Received: by 2002:a05:600c:1910:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-48fc9a09cb7mr45810035e9.10.1778673560723;
        Wed, 13 May 2026 04:59:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6ee4:8e37:145:d60b? ([2a01:e0a:106d:1080:6ee4:8e37:145:d60b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce38328esm38190415e9.13.2026.05.13.04.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 04:59:20 -0700 (PDT)
Message-ID: <7e6f629f-209a-481c-aa1e-9a5e8415e0a1@linaro.org>
Date: Wed, 13 May 2026 13:59:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into
 10bit format
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-6-7fc049b93042@linaro.org>
 <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <yg7jatjy4ghl6m7mbldpdrqiv6vp7inyskaepsb7y2hsb3fadv@6m74ofi4jz36>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 26899532BDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107269-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/13/26 12:45, Dmitry Baryshkov wrote:
> On Mon, May 11, 2026 at 11:20:31AM +0200, Neil Armstrong wrote:
>> Add the necessary bits into the gen2 platforms tables and handlers
>> to allow decoding streams into 10bit pixel formats.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../media/platform/qcom/iris/iris_hfi_gen2_response.c    | 16 +++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_instance.h         |  2 ++
>>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    |  8 +++++---
>>   drivers/media/platform/qcom/iris/iris_vdec.c             |  8 ++++++++
>>   4 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 0541e02d7507..b6d815c01f1d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -542,6 +542,15 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>   	pixmp_ip->width = width;
>>   	pixmp_ip->height = height;
>>   
>> +	if (subsc_params.bit_depth == BIT_DEPTH_8 &&
>> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_NV12 &&
>> +	    pixmp_op->pixelformat != V4L2_PIX_FMT_QC08C)
>> +		pixmp_op->pixelformat = V4L2_PIX_FMT_NV12;
>> +	else if (subsc_params.bit_depth == BIT_DEPTH_10 &&
>> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_P010 &&
>> +		 pixmp_op->pixelformat != V4L2_PIX_FMT_QC10C)
>> +		pixmp_op->pixelformat = V4L2_PIX_FMT_P010;
> 
> Do we support decoding of 10-bit videos to NV12 buffers?

AFAIK no, I found no sign of that in the downstream driver but I may be wrong.

Neil

> 
>> +
>>   	switch (pixmp_op->pixelformat) {
>>   	case V4L2_PIX_FMT_P010:
>>   		pixmp_op->width = ALIGN(width, 128);
> 


