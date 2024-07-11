Return-Path: <linux-arm-msm+bounces-25977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F243892E828
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 14:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0961F264B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 12:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B9A15279A;
	Thu, 11 Jul 2024 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qs1btg7f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E71615B125
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 12:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720700396; cv=none; b=ufxFWPulKnWtZdtJN6OpwdCSwp5ykfmKCiQyK+lxVKnsmdxtT1+AMw2tYEgflc4UdJEgak3bWElH98lCX5oE34/5x1yTGC0w67GH4z2aOGDqETvgebOxUAJWi0FvUTc3uYfAt8/VovCYHzcTcdJeiSvP6L/YmmxJ4DdRTdaAuJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720700396; c=relaxed/simple;
	bh=vam5BQTSEe4vGiw5E8f8xTv0ZY91ZCsGOuYhgXtFd6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNFqOwTqwrvZ77Y9F9Lwffh3lbt08agPAVcJnMiT5ewcmeRefNO8qnt4539D2I39l2xGjjKVguRoBkagc7SMNXl1HFzIGSQUxd5QDJOVZ5QG10xQ3UYMFRevoBS/93v81rJrzBjjNQsW8mw4XHs4QxRhyQcW4hFXZAi0XSE6KzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qs1btg7f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso6035815e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720700391; x=1721305191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R8VLmBAaRi79unaSRfBc2UCQY1MxGEsWkzfoNGJDc2k=;
        b=Qs1btg7fiMtFOM8ncn4oVH7HRsI2/+Q95sMMVMq+s+QVsWIEFHR7mH5S9a06rBTdal
         /0gkNqqfvl/Cbva9b1kR44vVYBfIjUA2F4lF1wq1i9YsWqExbYhFUTNiLyP76DLd3Qeg
         TYwmSnozsgqNQL2iJ7Co98SMzulQhbZJDD7TjUo2bY67nDJZq4hqGeOwMArJKUliBq/D
         DwcghQKwJCuiWgCaUye+3lJuOqZnH8kqQIqd7iKlsXOQcasfQvor7/rnrDe3VKVDO+An
         KDqYol+m0oaKZy+6CRgN6u28hIq+fkPlOKUZveJoDYGGG+EhusgaKDP0uNI/yQvr5Trv
         5TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720700391; x=1721305191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8VLmBAaRi79unaSRfBc2UCQY1MxGEsWkzfoNGJDc2k=;
        b=nfHOsWxpkUYgNNGkaajhiF+5jzCqbhkwQ7gW0EXz89djn17nHzF3ub6Lj7WubeY86c
         sm4su1Dlx6mdrKFPvcvnJxnBHlDValGdiMD/D52tWH4HG9br8sIyAq67y8w+hnJIfKeI
         S2TxJPPDRO2OPaebE3he8UySLM6wJncuNrgH9CESJtFFtslfepXIqIulFTjUosjeTYQB
         UwPX69DNiL/ufOm3UHk0zOZCve0oCyuKsi0dZVFzhPAMCxcyOFIjDuMck0wOqrmNiaY+
         84+XIlkeEgR9/u/HMH3kEqlZafPkqhTz+OVy5kvrT3W3t6FZEw82VbOYYoir5LROsUAb
         2A9A==
X-Forwarded-Encrypted: i=1; AJvYcCWiPDOdzyOmhOUyy1zboiZrRjBH4E5tu5lyYd8i4eOIEdMLhzpcgWaG/pA1fa865gLuPSrxFpUH8TI2Eub9UPZH0p9NCYSE2YzDsY9zaA==
X-Gm-Message-State: AOJu0YyErG0sJ50640TxKztef41dzPyFQbmHMqG4NJ6R65u65/QEdGNw
	XI19dLRHDU65b+aLXsa4iy9L1m1j3f6MXxojWca5TjvrNg9xsYP4FJKBSCjSwF0=
X-Google-Smtp-Source: AGHT+IFQZsFLLyzTtk6n5XtvpkhGvimfD/dOwR78iKn4PTCZzgaSyQb0dQfjCRBKdQCvxX1TJNZ1Mw==
X-Received: by 2002:a5d:58f1:0:b0:367:8900:c621 with SMTP id ffacd0b85a97d-367ceaca897mr6159414f8f.56.1720700391459;
        Thu, 11 Jul 2024 05:19:51 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde456f5sm7695360f8f.0.2024.07.11.05.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 05:19:50 -0700 (PDT)
Message-ID: <5a9939d7-dd05-4ce8-9231-5ae7af32b09f@linaro.org>
Date: Thu, 11 Jul 2024 13:19:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: hfi_cmds: struct
 hfi_session_release_buffer_pkt: Add __counted_by annotation
To: Kees Cook <kees@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240710230728.work.977-kees@kernel.org>
 <20240710230914.3156277-2-kees@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240710230914.3156277-2-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2024 00:09, Kees Cook wrote:
> The only direct user of struct hfi_session_release_buffer_pkt is
> pkt_session_unset_buffers() which sets "num_buffers" before using it
> as a loop counter for accessing "buffer_info". Add the __counted_by
> annotation to reflect the relationship.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>
> Cc: Vikash Garodia <quic_vgarodia@quicinc.com>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-hardening@vger.kernel.org
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.h b/drivers/media/platform/qcom/venus/hfi_cmds.h
> index 42825f07939d..1adf2d2ae5f2 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.h
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.h
> @@ -227,7 +227,7 @@ struct hfi_session_release_buffer_pkt {
>   	u32 extradata_size;
>   	u32 response_req;
>   	u32 num_buffers;
> -	u32 buffer_info[];
> +	u32 buffer_info[] __counted_by(num_buffers);
>   };
>   
>   struct hfi_session_release_resources_pkt {

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

