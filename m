Return-Path: <linux-arm-msm+bounces-39477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E96519DBA8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE174282269
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A31D1BD9C1;
	Thu, 28 Nov 2024 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkUF91ZK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDDE1BBBE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732807998; cv=none; b=nzRY9omFjUd38WpgkP9WjLisCzbfByDJWvRcK+sh+PpIzb9x2+Mwi8KAJT80kLAqVGoA6ozehgGPZ8/D4pyqbNo0Jeacx7DAuKoL1o61qwY+4xNH8EweB92drv7IPIQqEkj6JZoajNuCBCg5TkilF/KZz6eEZFRiyIWKWK69B5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732807998; c=relaxed/simple;
	bh=dx3goeI8+PmUxdVOKxTaj371TsZOSoYSr4uocxe6Z8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRDllWNAsmV/Q/JzNayvkKf58AeDsR5ZgItqSWxqBbdm4B72X2ZJLTJnWpZuaE5xAMno2svh8j9zApSm3Pew15ebDdAy3xSRhu4HB2riqRjuIcA5in1eungGH0ffdw2ERPKdLDIGCg30FXvRhIEBCnrqUTpBY2P0FrIeChqCncA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkUF91ZK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a10588f3so6041245e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 07:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807993; x=1733412793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b10DWlFGhowRIZrTbsC3lQ8oGfF6ijd4eqGNQhzz/3w=;
        b=LkUF91ZKeuFzUv5JTlDdnEcfthD2KjEJ1gExOnRfYGGBY9pcHNgz2ovMtF/XqwhDw6
         57yUVpE7HYdml7SHWtRW/ALP5h4EXZM5o6b7CQVx++GxrAZbVnnommoNrkVf7lvcqZrU
         gfZgVdvIdxIA9L+75Dnkgl9yU+9JXP+ttb3UPitb1tPx5CR0ogUzH4k5+yh6LmAWSXkR
         xpo1QuMZQ5AJ8SrH3YH05gmKQXrGJ+mN5oH6eDUR60lmV1S+8cGoIpTYXbNDELQCn4yi
         cfRb+ys6OgkJz3oeF8afeCwUHpBK1iJ3mSCvFag9GfWdM0m46MZGKlZ/w+ojaUcTbGk2
         cjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807993; x=1733412793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b10DWlFGhowRIZrTbsC3lQ8oGfF6ijd4eqGNQhzz/3w=;
        b=hEx17g3flUT7q0xdjORd9XzG7Tmgk4V4lp3V1eiOPGdTPOufoHaG9ZRbTPJF62y7w/
         HCs1dqR6KkUEjfCTMEL2o7wlP6PltYsivLeA0alZW4zxlIxuDD6HwJPwi/7/KceUO1Ug
         D0vHII4H9MtTLwd36awj6KlkaRHmBSdwmaS8JovBVqPsou62gBBu3fKrarNGCGRB6H7A
         qPN2LtFEK+mq1KsM48Hz5b3Je0wBgeTIT1xkJcAaKarUSNBYx4tISSAFYJw+tq2gTMi2
         zP0jjh5zWo6b4KTixZn8lJZJib66ZdUQLz7/MZ5d2+ytoCYP5kNTAxGwC0JSdHLDBcEt
         FVbw==
X-Forwarded-Encrypted: i=1; AJvYcCV4SwoBcDvVQS7p+Xok2aVtsqUktSVad8aaL1du5nU+lTL+3GEbxTtHnKAwwHpQmc3ocGmbisIfWTREpgew@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/SLi1InbbnrWUMlAB2WwcdI+1NDr4J2Cz1RfoBe+3kyxGLn+
	VOs24wjRQkMRuL+7Oe02TOeE9LX2nQ6h/yQ6ZMJ/3Vddz4zX8ggbp4fv902yGeQ=
X-Gm-Gg: ASbGnctBcMqCQ5zcx8juhA0thX2Vm4QpPpApIUrK3tqSP8bLstNJ4Euqq9tOsCAm+jO
	L9dCB8rGTKl08oN68pejwCRK/8IcHO68FfmNhvTHvYOp8ZOTuqvrOn9wyev8KUm60pSNCr5+8W3
	sZWKDgs54aIlzecAViiCEpBZd+FJFhKzslYQCNvD5S01zjQX9N+urei70CgBImrhE2gkyQMHBkX
	CF3YCRjPoFeCBIPZCcKz7al3AWoiPDBEban5knsOuzP0KlsCYQmjBV73EZZv+M=
X-Google-Smtp-Source: AGHT+IHhe6rWMKeZvorX4t+eGWKL0ZIgBhqqLgt6DS02uIjaCP6eA7/zHMLPK/b/0LdU32MW3mQTLw==
X-Received: by 2002:a05:6000:4818:b0:382:5af:e990 with SMTP id ffacd0b85a97d-385c6ee221amr6272363f8f.49.1732807993306;
        Thu, 28 Nov 2024 07:33:13 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a4bbsm1923305f8f.48.2024.11.28.07.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 07:33:12 -0800 (PST)
Message-ID: <0d74695a-b28b-4cc6-884d-6756f58f8be4@linaro.org>
Date: Thu, 28 Nov 2024 15:33:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] media: venus: hfi_parser: add check to avoid out
 of bound access
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241128-venus_oob_2-v2-0-483ae0a464b8@quicinc.com>
 <20241128-venus_oob_2-v2-1-483ae0a464b8@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241128-venus_oob_2-v2-1-483ae0a464b8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2024 05:05, Vikash Garodia wrote:
> There is a possibility that init_codecs is invoked multiple times during
> manipulated payload from video firmware. In such case, if codecs_count
> can get incremented to value more than MAX_CODEC_NUM, there can be OOB
> access. Reset the count so that it always starts from beginning.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_parser.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 3df241dc3a118bcdeb2c28a6ffdb907b644d5653..1cc17f3dc8948160ea6c3015d2c03e475b8aa29e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -17,6 +17,7 @@ typedef void (*func)(struct hfi_plat_caps *cap, const void *data,
>   static void init_codecs(struct venus_core *core)
>   {
>   	struct hfi_plat_caps *caps = core->caps, *cap;
> +	core->codecs_count = 0;
>   	unsigned long bit;
>   
>   	if (hweight_long(core->dec_codecs) + hweight_long(core->enc_codecs) > MAX_CODEC_NUM)
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

