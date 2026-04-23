Return-Path: <linux-arm-msm+bounces-104275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKFsH2Hp6Wm2nAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:41:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0A44FE30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2AF730C6A23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23A23E51DE;
	Thu, 23 Apr 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yYLk4Vd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1903E51DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776936775; cv=none; b=IY4bcv2Qt5c8/Mjwy1nXvW2Ev0aBCmTsfXJD5dx+wQgIk6gvxZB+oiNA0T0qF8fV8jNOF9T/NDyi9qdYO5ua0wqKBv5NRso82jsh0OW87BIyKWZLWNuLr82pKTJPH3jNqlvlqnbOaF+SWHyq7A16pRGAo4M7Q9nFnUc1v6uW1qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776936775; c=relaxed/simple;
	bh=SaeFcfd6Co0NuxG8YdGnpnaaZ7L9Qd2bRSmshLJPLds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ey9vFQ9xxi5MDc95VkilGUmacaHkAXgdu33rfo+8r3bVy11QS4Yq4oBKuY/zRu1a/CfIqvlItnbR5Uj7Z4q+jTUbwRuksIrnr7NwUQw8LKhcIy/FLnoRVIgPKLR8hoCcdasiLbeREceC372W9y3MQcy6mKrHWvhHazkFcgk1lO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yYLk4Vd0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d43e09de5so3646855f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776936773; x=1777541573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7CgxVK2bfFuo3rfUGsXONlP7ZR5uQTEJerKL5UdOCjw=;
        b=yYLk4Vd0xHevfGTPGtOhq+JdHSa3kGtEtEgeSJuQTSAFEAOZ+koIgtRDpZgIcrO7oo
         tS8HbRGmNjxlv1Ahdt7ctgaQDim/lVKknN5WrArlVuTASJYuPIse1v0wfjhk5UsVSjo4
         VPmm7RhQSygFKcmJiNfzXEc52d/u3TNVxi6OKQnfNhL9flhAQA080Ixeou967esKK8Tx
         uoKL2FFg2a4wdvR2KFdR3MNPDNgzAwK2+rYR1Wi1aC2zMidCpjPXq4/CRFuPnWyKxUGt
         eChjWDLTTC4cONm9xgj3N2jls/B9+MM05KHKJoeoEAyls0pgkTYXkZ4IEKtWhKxw4SW6
         HGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776936773; x=1777541573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CgxVK2bfFuo3rfUGsXONlP7ZR5uQTEJerKL5UdOCjw=;
        b=qXF3nnJGVufTM7Cbj8eVkOZe+aXxvXIzw+AaIZ3HHzD4fD3SgLL8d8Nzr2UUyFNDfe
         0edDCBsIRQVG8W4PsUh7Db0MoKDnEuKhW0ZBTuFUpr8yRcOF0waIUaU3fYRbfUJD/9yX
         c0Vbe23Vu4lOxaLUqYrDZY13QnQ4Yt8ztuPkFackndyfqu+4gQMZ+1bwaC74hIXbsweW
         putVU7mF/m/hGd7UIGnhA2pMmdVPt2NGxuKeLPOBgmf/VuHs6JaN3DxU3MScAkXLkqV1
         3pu6lW+LdZpYSgOOe5x1OIC9iDUIyUMCxMq8xt4uk9AAD6opn2WMz2HOwUCNN5lTNhma
         M/aw==
X-Forwarded-Encrypted: i=1; AFNElJ/IpW1Rsf+tjgaSXckODQ1x5pV0ddq1S32VLXBSBX/kLHj1gU/am6VCJxM4DoHKy/v+bT+3QByUOumI4VxG@vger.kernel.org
X-Gm-Message-State: AOJu0YxLs7gUoK42FMHGvHdPMZQeMxirQRfyVA4ZYrsZDRlaeCTGW+tv
	bMan/RlEOheVH1sUhk57oxD4i19wNpKe1Sj6+fa6ILhAm94Ytka30jVuUNVbEArCfsA=
X-Gm-Gg: AeBDiesqXpo3m9NDM3vV6Zv5D3VJBj8hSh/Hk7wAGHPYr1HXY4ITxU+T/ZCU/yWUL9s
	2ZFq5o8lAskcfxenlfUZEgaJxjyZTqtEuoISz+jQ0vupC8ioQkezwyrZ2/2tb8kTtiIqFoNI2v8
	Bzg09ZCOFqc10QbZGY1hnHtkvSbAcLY3VPLU0kdA/X36zlSov9MT4g/r1+fCcd5txbFizvFQFA3
	yT1wW+8qraRHL3FRHhRnHdWviPk9lqIJRnbqKNIxV3nwlK8jIFkR2KB9fRtNh6BLZ6pT3F9WEFo
	ttxdyVwhbye189fFWRkdyZ/GGnoHD2WcSAnIVNZBJ/ui9FcfuOHxRxRIf/NWbSlQ8ihiT5hw2/x
	HfrizsaeXSEmfasq4Ol1ZyltwGV17t5UoerolQ7J4FygsEEJImMq+uhCow7c5tKQvKqX+00GGzC
	p8pf26D8dBGhzY+Or5XKnpRKHapNTV6WT8ETkTpw7WvNsi
X-Received: by 2002:a05:6000:2212:b0:43c:f583:126a with SMTP id ffacd0b85a97d-43fe3dcaee5mr41076351f8f.14.1776936772566;
        Thu, 23 Apr 2026 02:32:52 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.41.87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm47227899f8f.32.2026.04.23.02.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:32:52 -0700 (PDT)
Message-ID: <789892a6-bf11-4b02-8f2f-7b413d62302c@linaro.org>
Date: Thu, 23 Apr 2026 10:32:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: iris: Add missing break in
 iris_hfi_gen2_session_set_codec()
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <6ETWD2EgGRSbe2pnjrqP-kk6Q9m45YyjLJedcwHlgaRAeizj0BNDCqbZYvGau-mIZ-mHR95mG8vuOjI1HNtvMw==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422-iris-code-improvement-v1-6-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104275-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: F3F0A44FE30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 12:16, Dikshita Agarwal wrote:
> Without the break the AV1 case falls through, risking unintended behaviour
> if new cases are added after it.
> 
> Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index dc7acde1913e65eb39734702cb164bb26b8ea6c2..494c8d9fe14b4d347fcc3bb3cfe494365de360d3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -696,6 +696,7 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>   		break;
>   	case V4L2_PIX_FMT_AV1:
>   		codec = HFI_CODEC_DECODE_AV1;
> +		break;
>   	}
> 
>   	iris_hfi_gen2_packet_session_property(inst,
> 
> --
> 2.34.1
> 

I don't think this is really a bug.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

