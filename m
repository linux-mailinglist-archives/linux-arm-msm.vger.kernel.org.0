Return-Path: <linux-arm-msm+bounces-18407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EAC8B0527
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 10:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D341C23927
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 08:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A503D158A29;
	Wed, 24 Apr 2024 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWQkydc6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC83158A16
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713949025; cv=none; b=cddg62OPUR7z4LAIajYeulDbcDLmTC3X3Monq0gQCH6fYOJssQRKNHhn6iHIlbm5Sx42C3yOTxbBD2xrMCEOnziXzKGAf3tiFNj8X6SAylCTS+tYuqN/VJ+c09ABUAgM5r4PpKim9yliOEv4GI/BqyvDb5fAyI/Rl+EGyjsniWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713949025; c=relaxed/simple;
	bh=2O72LDU1OqLroHzeVRXvbfTsfJ2fryQ4/oEHiZA7yqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oC5GpZrxK0UJk3locDQnCABoHl2jNxRbGMJipMl2bCPrBXs2/6hHQ8FnPAebIP9gObCZDtpR2S/HvVY4NYZ9iT83v0wGTe8Y63ESW0X5FlAAnbHPByPC40oDOJR+NzIOWJPW3SPfskuZxlhQBO3bFG+cc83q8YbeiZ/Ny5sAd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWQkydc6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34a4772d5easo5377748f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 01:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713949021; x=1714553821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkIP6wFEIDdLYh2L9xznda/rD06h99rIWQ52OqgoXs8=;
        b=XWQkydc6ifkoesYyyw2U5cHA0sdZiz0VjUkM/xH8y520/Dt5tITDvpVYNOHnqCNKsO
         YeUs/mIzlikaaIXUw9xfTNIU8bcYE1ypsSNTvaLB5BY5zCqUoO9a4XOm7CFx22D8EpyF
         H04vx0AO7iea0+w0oib9MLmG7cXIo/+lcn43nZyWdidxFNC4J9W9bcmUJJ9xmi+4d+Tp
         8KRpj+ORL+IDXg/M/WCKmqI8dEnPs+4dKqiFFDWyb5NzReVNlBdvomZbOocJsscVhv81
         0MiLGDZc9SNK6HXrEwvHfjXb2FSSO08J02IuRPoM5JJlZL7bSUjCcc483jPC3LsJDS5R
         f6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713949021; x=1714553821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkIP6wFEIDdLYh2L9xznda/rD06h99rIWQ52OqgoXs8=;
        b=Aw4GqtC8ziikzDSiHhERfUdgUwFSrRtrK70ypem+l3GP+uRJozIuCBeYYRJclQT0C8
         vip3BmJl07oBtEP9/VDFO6DzNs9ahCHZ/JA8gd9LB9gXbG1izBP3OizGuK2aHte5bys4
         asJHkV/lip8jraJYBfDoeitnyqlTyGLycc6F1I6h1x4Fdc7zFXyRU3UCBMIv/Aod/cA2
         /97Gov8vg5JnhjZjdsoLC642F1av/ec6wCvwVWDAitWWqulWQGbRusUPh1CC3jgHODLI
         SFU2JgYEBRlySqt7OJSNM8LOMCRsknTeNuWMqvxmRL2vl61FElTA0hZKuZ+VKS41iO3W
         YbMw==
X-Forwarded-Encrypted: i=1; AJvYcCX3mzvwgnjePnQAN+5zUsGOi/a9jFJVjMZKHxTASPY6+QyAUdDbiWapGm2w2p63QN33QjlxMWvtIBGyaOaZyCCWgMRlqAsJwHxCe1p/BA==
X-Gm-Message-State: AOJu0YxxiIP7dqk45hEKjMc6PSUk/cXItuETOp3LthZDjxRgcrL2+6pg
	P5lgOeKA/NfIoLAqRDk2k/Cyxb4VrH5dKn2ixiidPpslMFOAuVo9zmtF+qQrorA=
X-Google-Smtp-Source: AGHT+IEyU1gmwXgqSJtlqDiujsmNdbhvlCic00FHBLWvq1Gj2coaTNmeFtYG0ICD0QzXKkhlq8J0Rg==
X-Received: by 2002:a5d:5449:0:b0:34a:a836:b940 with SMTP id w9-20020a5d5449000000b0034aa836b940mr1011074wrv.18.1713949021138;
        Wed, 24 Apr 2024 01:57:01 -0700 (PDT)
Received: from [192.168.0.19] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id v2-20020adfe282000000b00346ceb9e060sm16488957wri.103.2024.04.24.01.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 01:57:00 -0700 (PDT)
Message-ID: <40e817d3-3a7a-4da5-9237-12915357e011@linaro.org>
Date: Wed, 24 Apr 2024 09:56:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: fix use after free in vdec_close
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1713943070-24085-1-git-send-email-quic_dikshita@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1713943070-24085-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2024 08:17, Dikshita Agarwal wrote:
> There appears to be a possible use after free with vdec_close().
> The firmware will add buffer release work to the work queue through
> HFI callbacks as a normal part of decoding. Randomly closing the
> decoder device from userspace during normal decoding can incur
> a read after free for inst.
> 
> Fix it by cancelling the work in vdec_close.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9..56f8a25 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1747,6 +1747,7 @@ static int vdec_close(struct file *file)
>   
>   	vdec_pm_get(inst);
>   
> +	cancel_work_sync(&inst->delayed_process_work);
>   	v4l2_m2m_ctx_release(inst->m2m_ctx);
>   	v4l2_m2m_release(inst->m2m_dev);
>   	vdec_ctrl_deinit(inst);

Needs a Fixes tag

---
bod

