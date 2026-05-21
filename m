Return-Path: <linux-arm-msm+bounces-108976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O30BtvIDmoHCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:56:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B07BC5A19EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 10:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B69FD3003992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4363624BC;
	Thu, 21 May 2026 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oM7NLm5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C80032E134
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353814; cv=none; b=D6pXN8R9wegR3aqb3+mEbrPzGfWf/8TBfv32Bic1EavKOFn7gdLEPRJj0HA4RO4XWsv7UqejgVXC1465c8hUMVmON1+R5vHS27x2enChrbOFVYJjP7W2GtmZhY8VfpOn21o9sBf+dfiF8QouQD9lfw837+Mr8plb4ca/n0PUmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353814; c=relaxed/simple;
	bh=5veVuqeHdob1ZiqShR0RtT2Mrg013lkVtRMMXYaeVrg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LJ/YDDdY1pUUINuRyAYi/vj3uBmGpwLuKYNEnDkuCmUqlu9FFhyeGD3SWdQfF81HhmxYayw3lqJ4bpPk99hnndqZwX9FWtn7NcKsS9hu1YX1/PdaEVECl2zLz4hMQcBTgXy2XLUWImpXTVZYEcxKy3ISeskqszTKMal/gxJOlwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oM7NLm5m; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44e1860558fso3731370f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779353811; x=1779958611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEEIubQVEPO4oJhBglsubkRO3SKDNKBEndyAAjuKyEk=;
        b=oM7NLm5mFPYuZGz5hXovD/ZS0Ym1vbyiPUzIGh6LClZUGlF1rT2ajnsm213GV+KZGl
         Oq0Ax3EekFRDoQP0/B9V5EaiTWTl33RsoNRZW7GjNDw4Xn1lDNWl1HPeadF09hlpNhi6
         o7PeSen14UfZtFQYJdbqpxffxFjY70vfPgljMLug+2QCllWueAk7gzjH2OWnQ810MOyF
         0/JVxXt/SxXelXOkycHGXY7vgZwmeorxdMC7vQwa0HnvwPb6S6AnpGzxhECL3oq6LHP/
         NLrnhoteA8sxcZLsxdZpUeyzXob0VcmjKPB/a8mOSfUvbYYFFhzSmKZzguc3WLf4C/P1
         NHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353811; x=1779958611;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEEIubQVEPO4oJhBglsubkRO3SKDNKBEndyAAjuKyEk=;
        b=QAYGl+KcsKBPe2O2yDOEZis1UVVbPFc/fthYXsrwLA+w4VCLehjKRFU2iv6Kqy0b7W
         UGp+/kuWJhopwrlQHVlluQMcWt9qttaiV+Y4DCVJ3kNZIhro6bo//HM/ErusUFqc4Ohe
         m/T6udU0CkTJeq/jP/KXAmklL3brtALCW7fcXa7luNn3HaS/pgyfCBJXtW1IPp6mrPlN
         tgh40T77Efv410SauDs5oSSJdFCs/kLMIWseS1CDjByDXGJ/T3IXwtc2/zLMz4n4tmyT
         9XDUsV70pmg43Lnd8N5bfMbr0IKMkDNTTDpmCCDdSJzXA3P7AtwGl6SKi+hm2pLxa9H6
         nQIw==
X-Forwarded-Encrypted: i=1; AFNElJ9d8Wkrl4Sf2YMGNXvYXhhEn4Of9tfLEsM+BxRwNKrLsJQAtyVa9eGWrzvYPJZAPg/CEn/R4p3vNLjeK6p5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywba4pEDRziDnpJv4HsMsHa9ddy5JOAiT62anhutLWKbhhqMlyy
	tgLwS6/swqpD4n/78Xlgm1EeoB3DWcd1CFTgr74tYrjEeOG29is/uGhiVo8HZGpMwYQ=
X-Gm-Gg: Acq92OHSDGiPAdatnJS0BoK5H42Duhz+MQXs/DlyVseriEsXJ5DGXUK7WbvP+gIXvAN
	RadEKJq9go+QAkmU9+myI8neSZa2Txe9Az8RI9qWrvJVq3oXdYPXa9lG69wuogWFmVImuBwp5Aj
	tjTvkM13mREY9MyV9fimkIv998oiR/sGQo1uHmdrI8JXgLYXFEw62DPdWCbbXgyOja2HPG8MOcD
	h4DZYiduVUzXK3VsXYnBOIAhaMZn9jNCTfiGoE6dW8kSyl3Jh5UcCOuGh6DExDHcRaypw3MJuuR
	aQevYatPMUUXPiiup6+pNqyE/l5bdicQ44ydNOxpptiAX/XDSvOAtrjNG/zxgdfnO8QSYqYGRyx
	LfjF06MVdxjAc2dMR+VImUHwf1SCsuyC2kLLyEQSxrA0UV75WOPT/uaxJldFfB3/zmqw5seH3pq
	tLF91HM1pO0rfksAcAw3mCFbcyBh/IgCBphfbW6NN61UqMrahbuzf+gBmnxfQvTAOy2d62k562h
	ujMj+8=
X-Received: by 2002:a05:6000:1ac7:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-45ea3ae5fdfmr3028725f8f.3.1779353811259;
        Thu, 21 May 2026 01:56:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e038:7e8a:7467:8c6c? ([2a01:e0a:106d:1080:e038:7e8a:7467:8c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d0bf6sm1247143f8f.7.2026.05.21.01.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:56:50 -0700 (PDT)
Message-ID: <0a0a34aa-6d02-430a-bd42-e487f363a46f@linaro.org>
Date: Thu, 21 May 2026 10:56:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/6] media: qcom: iris: add support for decoding 10bit
 formats
To: Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <5Yg7em0Xca9girDZT52cxZaTg93xJtZD7C2ExswhAkholGSsMsWXMWxtbtsWmkGeJWjp56SmJlLhj55vO4e0nw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
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
In-Reply-To: <11e79f8b-9401-4e56-87b2-8d8148e05232@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108976-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: B07BC5A19EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/15/26 11:35, Bryan O'Donoghue wrote:
> 
> Can you rebase off of:
> 
> https://gitlab.freedesktop.org/linux-media/media-committers/-/tree/next
> 
> and ideally make sure everything applies against
> 
> https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/tree/next+fixes

Ack, I rebased and it applies cleanly.

Will post v4 after testing with fixes asked by Vikash

Neil

> 
> bod-media-committers-next-plaform-qcom(next-smoketest*)$ b4 shazam 20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org
> Grabbing thread from lore.kernel.org/all/20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 25 messages in the thread
> Analyzing 12 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>    ✓ [PATCH v3 1/6] media: qcom: iris: add helpers for 8bit and 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 2/6] media: qcom: iris: add QC10C & P010 buffer size calculations
>    ✓ [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit decoding
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride calculations for 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ✓ [PATCH v3 6/6] media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
>      + Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>    ---
>    ✓ Signed: openpgp/neil.armstrong@linaro.org
>    ---
>    NOTE: install dkimpy for DKIM signature verification
> ---
> Total patches: 6
> ---
>   Base: base-commit 76671814f2843482d97feca12e95c06f0b05bc8a not known, ignoring
> Applying: media: qcom: iris: add helpers for 8bit and 10bit formats
> Applying: media: qcom: iris: add QC10C & P010 buffer size calculations
> Applying: media: qcom: iris: gen2: add support for 10bit decoding
> Applying: media: qcom: iris: vdec: update size and stride calculations for 10bit formats
> Applying: media: qcom: iris: vdec: update find_format to handle 8bit and 10bit formats
> Applying: media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
> Patch failed at 0006 media: qcom: iris: vdec: allow GEN2 decoding into 10bit format
> error: drivers/media/platform/qcom/iris/iris_platform_gen2.c: does not exist in index
> 
> that file got zapped in:
> 
> commit 53a5e095636acbab817a7fb98a67ce76cac59fdf
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Date:   Sun Mar 29 02:33:10 2026 +0200
> 
>      media: qcom: iris: split platform data from firmware data
> 
>      Finalize the logical separation of the software and hardware interface
>      descriptions by moving hardware properties to the files specific to the
>      particular VPU version.
> 
>      Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>      Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 2fde45f817276..48e415cbc4390 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -4,14 +4,16 @@ qcom-iris-objs += iris_buffer.o \
>                iris_ctrls.o \
>                iris_firmware.o \
>                iris_hfi_common.o \
> +             iris_hfi_gen1.o \
>                iris_hfi_gen1_command.o \
>                iris_hfi_gen1_response.o \
> +             iris_hfi_gen2.o \
>                iris_hfi_gen2_command.o \
>                iris_hfi_gen2_packet.o \
>                iris_hfi_gen2_response.o \
>                iris_hfi_queue.o \
> -             iris_platform_gen1.o \
> -             iris_platform_gen2.o \
> +             iris_platform_vpu2.o \
> +             iris_platform_vpu3x.o \
>                iris_power.o \
>                iris_probe.o \
>                iris_resources.o \
> 
> ---
> bod


