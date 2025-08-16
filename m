Return-Path: <linux-arm-msm+bounces-69430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C477B28CFB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 12:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D75831C23DF5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 10:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6664296142;
	Sat, 16 Aug 2025 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZ5U0gRD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF582918E9
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755341061; cv=none; b=LmH3xv/gf61DIW5m2X8bxaRHrXEsYFbjBy4FKhZITsZXLxqajSh0g7fbrFaWNFdbGlcghEcLFztT0mCFr6dC3vT7//agMH1s73NpfKMUm+xPQrBA2RjnMFlSBipB1Fp4aPObCIQl6OYCqWE7lS/+IMfQy9fODaGLDq938R5dHNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755341061; c=relaxed/simple;
	bh=giznPJefi0bbTBjqBQghdivjTXIbW2Tpm3pqNYK8uew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UN4+n82XKIqr6raMUE/42dz3+lD6hz9OYooHNq3rVrcVWetuffvWfpNvioDTF8LdaL775S1xBIaHDBR3gxMkQhtICGpiboyn/LYXdQt3QvIXG8tlYdtF+v84j6Oss4h7/E0+Idxb+++TXM9epjoRZ9+7puL6QA1F6f0PXgUrIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZ5U0gRD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so2551121f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755341058; x=1755945858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+87OkgEg+mw0Fep350vzSqyIISt8PfhGghcXUeltSrE=;
        b=yZ5U0gRDkM7kCXTL/9zVrdkctEbAXMdBrIUeNeqjQpxROUQo165qBqfAqMPzaN2CdU
         veUFHhisNRhDT3+kSrWDTN2mkPYYZqZwj0GnURS+cFUXzMBPeg7qy1VgD86CwnBo9pq4
         FW1s+X36OdQp8wTj/4mTCkq9UMnVbkJdzwh+BEqaAJZ5yZEHpZ5d+mkxZfOuimMaFAUl
         HSwjmtUjiEuYZOrVpeMdG+zYO7fb5M4gbKlwg90ToPt7WU2yaca2PkqAyGGkilmpNbVo
         DDbshKvbANytRkpIZACRkcKw7OD7Hl8r2F+7snbiAbBkYq56oeouFKNsjGZh5+qlmWFp
         RmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755341058; x=1755945858;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+87OkgEg+mw0Fep350vzSqyIISt8PfhGghcXUeltSrE=;
        b=rBiVmhVrwfqNJmBBJdM8V9yeW6GJBOZnnzptY5fpTRuevDA7cwQ34tCWxUQG3Y/4Uf
         qrvhsAFwDWP1ua9KfdJed72xbGxRM+EdihtWvAYO/hb1e4IdLv29diSkXoYOmgDdeZfz
         zngDOqVamFwwkNFP9j2ZYYqaG0OktblEZmBCHcCBTrSXPGtPk0jHOk/MhgY54Aoo2Ugj
         pqM7h0FAnAqerWUkqJNp3PgmXBjDaKo7V8nTw5COzhqq1KN/VMGaWiSrntwWIX6XsJp+
         pqxrslcslRwB6dgDUfSmNHIURS2RyYeVhhJ4JCx8Z2jwLpOuiCOIaQENoUr0fTco7naB
         L+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWrbjgo2Q5adQlCbn3klHhUL6SG2Gtlk4kZJpJAyWsYNwr/ET0iqy7ZriwBZumERTioragF62edVk1JQiDg@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIBfZ0RHXoApsjIZe03Bm9uYQ1JJJwGlzMlSBLAJyDGqEk2V4
	XP3YexrdMs7klBJb4YThvExLxJmK34pTwBHhzSXqSOj3R9UBgA/0X+7tutQXizyT2/A=
X-Gm-Gg: ASbGncu+NrzW+mG/53mNlLa4fCLfP3bSs7vUcevGbDZVsC+NbGlB48WN7NcctCjwTzr
	vRNObbxUCAmJ1w85yyak+MJk1Zu3aRgaNrF+qKohK1XWy4IxJXcVZp875Opr44XoHwRNJnFp4LT
	WIPukN+riuo+QdN6lzIwVNVqzXEP8EyTONRAVkz0nZhmHIJ+18vVyQfKQz9qa5UO2oOzTDbog4v
	uf/HUyVE5UGqTmRTsK2sdnqOvdNvy4KSny+2T+/5QVqt6yiGDh3RGDyrcwb+iIdJmw4vJ8Jq6VN
	RIcqrLsk3eGRbLkRkW0MppzSsM1Ryxf9TG5yzaWLKGwNN1/3yl80yu1qAHyEmf9oGS7DIEDKYeT
	sWsgjQjAVJBSEJhPyt4oOIbwtAT7gVsi0JbkyfaG3Eyg07jQCyqNxMpCEusjIq6SG
X-Google-Smtp-Source: AGHT+IGatrxnRyuYHYANVLY/7vM/kOG3lSGdbl/URxjLIRGA2WFL+5tKlpJurr0CG4KYGcBT0PnDvw==
X-Received: by 2002:adf:e651:0:b0:3bd:148e:212 with SMTP id ffacd0b85a97d-3bd148e0419mr701845f8f.14.1755341058318;
        Sat, 16 Aug 2025 03:44:18 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb68079d3fsm5491248f8f.55.2025.08.16.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 03:44:17 -0700 (PDT)
Message-ID: <de539f3c-e048-4e75-8f4f-7d953b2b1942@linaro.org>
Date: Sat, 16 Aug 2025 11:44:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/24] media: iris: Always destroy internal buffers on
 firmware release response
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
 <20250813-iris-video-encoder-v2-6-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-6-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> Currently, internal buffers are destroyed only if 'PENDING_RELEASE' flag
> is set when a release response is received from the firmware, which is
> incorrect. Internal buffers should always be destroyed when the firmware
> explicitly releases it, regardless of whether the 'PENDING_RELEASE' flag
> was set by the driver. This is specially important during force-stop
> scenarios, where the firmware may release buffers without driver marking
> them for release.
> Fix this by removing the incorrect check and ensuring all buffers are
> properly cleaned up.
> 
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index a8c30fc5c0d0668cc9980f2fcfcf21072cf9ef0a..dda775d463e916f70da0b879702d96df18ea8bf7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -424,7 +424,6 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>   	struct iris_buffers *buffers = &inst->buffers[buf_type];
>   	struct iris_buffer *buf, *iter;
>   	bool found = false;
> -	int ret = 0;
>   
>   	list_for_each_entry(iter, &buffers->list, list) {
>   		if (iter->device_addr == buffer->base_address) {
> @@ -437,10 +436,8 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
>   		return -EINVAL;
>   
>   	buf->attr &= ~BUF_ATTR_QUEUED;
> -	if (buf->attr & BUF_ATTR_PENDING_RELEASE)
> -		ret = iris_destroy_internal_buffer(inst, buf);
>   
> -	return ret;
> +	return iris_destroy_internal_buffer(inst, buf);
>   }
>   
>   static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

