Return-Path: <linux-arm-msm+bounces-69434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB4B28D54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 13:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72E155E45E3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 11:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248522BDC0F;
	Sat, 16 Aug 2025 11:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lmN973A/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E567B2853EB
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 11:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755343031; cv=none; b=faEKr59UhW8BhrYnwDw/v+4DOKtUSw8nMQIpPGxpSSn6J9paiNOdk6GAxlYs+kVLm0UmhLFs5ZlqOAUxmLkBKISbd56hh3eMQgWJY7qEj4Ou4I2EW85CNGgtfY+mEzsoWl43Kk9uwoC9gyB7Y46/7BiAWFq64pjiG4kPEIQTdPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755343031; c=relaxed/simple;
	bh=VEELB1p+LXB/ILfsC7AIF5f4jw4hnJ8+SOGfsOkZT9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nNGoGSuFJwh+kAVZfNGZpHqsUGBYVZZWaPRuQROvb0ksZ4+OjB9PzhzezHAGrt3uZjKb0jHjgAbDOpPxRoBktdtK5jeqyZPxdlHrEO6IcO5OFMs//RY+a+oBSX371YCVztFxVlaHYQphYkB28s8auORvICers5VloVDuFaGNxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lmN973A/; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso2518648f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755343026; x=1755947826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fT/TDaFPBPvhUlbHfzVWtQvFoSuaPS1/pw0MY9/3Tjs=;
        b=lmN973A/e/Gz7XIdhIyJcO+KYCj++Hymm4YlP7rKfdJAJ5LiUJ3X/e2Eg87MVKQHJT
         +CX78oiPTdUkB3nSh8GnAm/MQpZLf4wZZidni+Nhua7ZWLxwhOVwQXcqhwHigpkcZCs1
         CLPhKBy0CUnKhayxCL5DZN2d4wu+gMApF09n8HfudMzWj42AkryhHpdbCtD+7w20gZn/
         TksYbeu6iwxVn53aUON9NpaYUjf8UBxHce21JsxNcfMpZNGaKcAjmb66CukzGKUCrtYz
         dI9VGkodikQQbYf0nQfreiZlev7lr8isNIlRrSys7re6GY673AJsAHltkzB1BEyKgN1G
         +4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755343026; x=1755947826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT/TDaFPBPvhUlbHfzVWtQvFoSuaPS1/pw0MY9/3Tjs=;
        b=KwEDtHFfue1p1pAZ3+sJk7VniMdxxCK9i7IKJ/GOgZQia55uqCBQV2kIcotJaF39cM
         B91u/LkmF8sR8Wcw/84ZvqI1pxOPKeMWquvLJbzmMFxiPt+42cEAvIqhl+fzzmLsNFku
         yL43LYoJtXaHVBUdjJg8Q8Qmwn5QlZuq1CtiiRbhjHaD1klxVfA9iBhEAf+wh1Gnt5Ez
         Rpb6Th07eGaKpqno7++Ns7P1zbDWdmOLRLf0yibMXqPSdxoFzhFX93k458NG29kgLJ8p
         WWuHJvi7gOo/g622Ad/C5xbZVOrYnMeiAa+cb29GpQQ8Po6iqfT6r6FdGd/gwGqAFeC5
         cTzw==
X-Forwarded-Encrypted: i=1; AJvYcCV0EprAHIxFlNaJjLWUGq4fQBm8g64HbeEnBepuYplFB258U/d1IGLjd5bY4YYEUGmCbmnl/7j6iLQ/vvP6@vger.kernel.org
X-Gm-Message-State: AOJu0YyKUfKWe02B0pGRUTA1QEfE6Sk2VA0VGjHA/cVltCcraNmui0pg
	bGn325oJDszS8YqXSK5rlvo1u4jjnnEA7Yi1IssE5AtGbLe+wxhUK6fDDClpGVoG4GQ=
X-Gm-Gg: ASbGncv9HLSs0AeKu/qcGq529gPeCmoGlTO0w6mHBeZal8llRheuAcT8mf3soRPnIGP
	h4kSc3c60Ib3sDD96GLxd0ivpbZl68zEZrCgXNKN12E81nmM2aF0YuRoZbv/th5UEqPSl5N10Se
	BV7jMylCb8jowuxBeJ249JKjWMrU3SeDQGx82mPksN6hiXGYkWlGlFnYatxe5AasPUHfPDmGS03
	O4nE1Md/hIwMfI9k2lSnfqCbNnPWMxp/Po700Uf083CYT4+dMwVxpprAjrkGMxvdv50De2hnidm
	qIyr8IAam4XtDx+eg/7z9g9AFNTk1U/1ZqRAlnTcZmYHQ1OWSjmls9pVhaBCpPw3gg8AozI7C4F
	T2kExW3EEl13AlwixiN3J5cRKxSklz3eTql9ilP1M3Q70ADbpbUxt8eNqPRXZCW7r
X-Google-Smtp-Source: AGHT+IFkak01a077iphXnRb0NfWZcjdMklN/paS5nToQVdKhrjqMnUJXsqyTeh2DifT49uUBCms5dg==
X-Received: by 2002:a05:6000:2484:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3bb6646e689mr4134412f8f.2.1755343026219;
        Sat, 16 Aug 2025 04:17:06 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bc85csm91967965e9.5.2025.08.16.04.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 04:17:05 -0700 (PDT)
Message-ID: <af97c3e4-3541-418c-a0f1-ea86d2968a3c@linaro.org>
Date: Sat, 16 Aug 2025 12:17:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/24] media: iris: Fix missing LAST flag handling
 during drain
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 Vedang Nagar <quic_vnagar@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Renjiang Han <quic_renjiang@quicinc.com>,
 Wangao Wang <quic_wangaow@quicinc.com>
References: <20250813-iris-video-encoder-v2-0-c725ff673078@quicinc.com>
 <20250813-iris-video-encoder-v2-10-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-10-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:38, Dikshita Agarwal wrote:
> Improve drain handling by ensuring the LAST flag is attached to final
> capture buffer when drain response is received from the firmware.
> 
> Previously, the driver failed to attach the V4L2_BUF_FLAG_LAST flag when
> a drain response was received from the firmware, relying on userspace to
> mark the next queued buffer as LAST. This update fixes the issue by
> checking the pending drain status, attaching the LAST flag to the
> capture buffer received from the firmware (with EOS attached), and
> returning it to the V4L2 layer correctly.
> 
> Fixes: d09100763bed ("media: iris: add support for drain sequence")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c | 4 +---
>   drivers/media/platform/qcom/iris/iris_state.c             | 2 +-
>   drivers/media/platform/qcom/iris/iris_state.h             | 1 +
>   3 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> index 8d1ce8a19a45ebb2b29457e0fef7d72c1c0d9785..2a96458833835422d30c9386d15cc1e4fb226e3d 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
> @@ -416,8 +416,6 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   			inst->flush_responses_pending++;
>   
>   		iris_inst_sub_state_change_drain_last(inst);
> -
> -		return;
>   	}
>   
>   	if (iris_split_mode_enabled(inst) && pkt->stream_id == 0) {
> @@ -462,7 +460,7 @@ static void iris_hfi_gen1_session_ftb_done(struct iris_inst *inst, void *packet)
>   		timestamp_us = (timestamp_us << 32) | timestamp_lo;
>   	} else {
>   		if (pkt->stream_id == 1 && !inst->last_buffer_dequeued) {
> -			if (iris_drc_pending(inst)) {
> +			if (iris_drc_pending(inst) || iris_drain_pending(inst)) {
>   				flags |= V4L2_BUF_FLAG_LAST;
>   				inst->last_buffer_dequeued = true;
>   			}
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index a21238d2818f9606871953bd0bee25382cca0474..d1dc1a863da0b0b1af60974e9ed2ef68ea225cdd 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -252,7 +252,7 @@ bool iris_drc_pending(struct iris_inst *inst)
>   		inst->sub_state & IRIS_INST_SUB_DRC_LAST;
>   }
>   
> -static inline bool iris_drain_pending(struct iris_inst *inst)
> +bool iris_drain_pending(struct iris_inst *inst)
>   {
>   	return inst->sub_state & IRIS_INST_SUB_DRAIN &&
>   		inst->sub_state & IRIS_INST_SUB_DRAIN_LAST;
> diff --git a/drivers/media/platform/qcom/iris/iris_state.h b/drivers/media/platform/qcom/iris/iris_state.h
> index e718386dbe0402417f408d8fc696a33e5c7f23b3..b09fa54cf17eeee0c9ae254588964ad959c82c80 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.h
> +++ b/drivers/media/platform/qcom/iris/iris_state.h
> @@ -141,5 +141,6 @@ int iris_inst_sub_state_change_drc_last(struct iris_inst *inst);
>   int iris_inst_sub_state_change_pause(struct iris_inst *inst, u32 plane);
>   bool iris_allow_cmd(struct iris_inst *inst, u32 cmd);
>   bool iris_drc_pending(struct iris_inst *inst);
> +bool iris_drain_pending(struct iris_inst *inst);
>   
>   #endif
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

