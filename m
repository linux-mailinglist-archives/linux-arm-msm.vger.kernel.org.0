Return-Path: <linux-arm-msm+bounces-28968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7A9568D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 13:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16753283090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2526157A72;
	Mon, 19 Aug 2024 11:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUcoi2HE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2CB14C58C
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065219; cv=none; b=kiWDhJW+bt3JtaU38OmfVLN+dJ0+fFhQmbkbeMm0ikrTmlMAPC0FYFuyMwtKqlODukeeh2gLfMIT6xfHFriolgQBGhgd9r2SJnDX6c06VAGRx2i/RSOrEsWbAeNnUoWxLh983MzaWU49Lqv5L2U2iOEeGGkxbWWPfboXfGgj6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065219; c=relaxed/simple;
	bh=08pIRNeMitonXBgo/7cpKL1I19N3O6PDImc8jWhulbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7kLTYpgZRLYzVh4Toh7Dkr2rDAb/PuOeYqR/ZoE2nzp/rkhOX0JLaHEhh/2UHJB1caW4NHin5fwrMI4QO4VO/3RQ2eVBAwapm1nMCgV0FwXKbwC6yzINgNiELlZ8tMGpnQcJQr66EqTCN6jbHr7hfuQ4xCuJd6j7icyVKQVsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUcoi2HE; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7aa4bf4d1eso566841766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724065216; x=1724670016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1lXa8K7TtsrCVZWRZcEXmvWs4ZDDX/ZdvKFtCElTbnI=;
        b=ZUcoi2HE0W33tW/hpCmIBC290Rgfm1/l2wbDLgbqeKMx8vXxCGbmDVkhaMq/Qo11BL
         sDliAHe+UkdlPN992JBKzmryKqRTTO72uJN8NwzzVC3D0LuK/5gIGHd2SOylqpcdZb+/
         r+vxKYVVQdkflPm4w0E+Tv/RN7ozFr67H7FpTY7lz+BbwPFhE7+UQ8yGLpwHp+7JUu1/
         oeE/yIqYY1hg2saVFgQBeSvCZirw4+XY/AyMg+/QS4voFS3yG/XMqt/jQc+vTx7Dn6Dh
         eqlpUgKftX81tIrLIjgpzZm4bMNTe67QLsNQFkVZBgIPWzxnCZptvsPILGWomfEHmdx4
         vVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065216; x=1724670016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lXa8K7TtsrCVZWRZcEXmvWs4ZDDX/ZdvKFtCElTbnI=;
        b=Zqd4pHgvHAtAJR/JtqVrOGmUMg5o4fWqeKkTiwvFHcZRFJ5jbALM8wRHs8A+r3xsBX
         4o7tcuSuZIOJlFqaMLEZowuYIwfb/Hpv5p/XdfNFPE729n/MrhkJ1L7We2cgHTfCNK9p
         CUjdJdfUSj9T5QKRRN+XVjC0XXvmvIsicZhE/f4v9bX0J9n/6xOqOqF2w6fXBdYhsrI1
         q7YonKR5QPb21uh/IJcQweGUsR2gYr0jOuh/HeAXkmCDsYW87gP/GC1MQNcCMdbBxgpe
         U/muYgLdN0pRfJ2m+TFaHMzvHAfEKoexgPG3AXI2CIIgOCZ2ya0qThfn3n6hLavyMPT9
         TQCg==
X-Forwarded-Encrypted: i=1; AJvYcCV2CPNk+cdq17V17xXuhH7wzWiUXFfawMuugeE8B9KBUo/9mxpCrkxEDOML177boXXpEIJK3K7jqYjtQTymzKv0zK0nS+XFEDVCeMxQcQ==
X-Gm-Message-State: AOJu0Yyaz7/p7u4aKTj5iby3OcSKGBC703TnaH+hG16RZWELGntRsgne
	YF0MdG2lPKvCMIdbB6Fs/cNqS2/EryHTDeavPdolEDw/v1j0ViN7mBEYE0xjV1k=
X-Google-Smtp-Source: AGHT+IEzJ/xPUzRYiH9pYjaAeS0i2qOCO9pUydux+q2CLHGqlZnNQh/yZIQ6jZsMA2jAUinANtk5Yg==
X-Received: by 2002:a17:907:94d2:b0:a77:c330:ad9d with SMTP id a640c23a62f3a-a8392a41115mr774140566b.61.1724065216137;
        Mon, 19 Aug 2024 04:00:16 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::676e? ([2a02:8109:aa0d:be00::676e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfaffsm621879866b.76.2024.08.19.04.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:00:15 -0700 (PDT)
Message-ID: <c575a775-1596-41d3-a4c4-b356406d7819@linaro.org>
Date: Mon, 19 Aug 2024 13:00:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Trigger a panic using BUG_ON in device
 release
To: Abhishek Singh <quic_abhishes@quicinc.com>,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_ktadakam@quicinc.com,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org
References: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240730070945.4174823-1-quic_abhishes@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Abishek,

On 30/07/2024 09:09, Abhishek Singh wrote:
> The user process on ARM closes the device node while closing the
> session, triggers a remote call to terminate the PD running on the
> DSP. If the DSP is in an unstable state and cannot process the remote
> request from the HLOS, glink fails to deliver the kill request to the
> DSP, resulting in a timeout error. Currently, this error is ignored,
> and the session is closed, causing all the SMMU mappings associated
> with that specific PD to be removed. However, since the PD is still
> operational on the DSP, any attempt to access these SMMU mappings
> results in an SMMU fault, leading to a panic.  As the SMMU mappings
> have already been removed, there is no available information on the
> DSP to determine the root cause of its unresponsiveness to remote
> calls. As the DSP is unresponsive to all process remote calls, use
> BUG_ON to prevent the removal of SMMU mappings and to properly
> identify the root cause of the DSP’s unresponsiveness to the remote
> calls.

Could you elaborate a little about what contexts this can happen? What 
SoC/board are you hitting this on? Is it running pre-production firmware?

Since fastrpc is not at all required for basic functionality of the 
device, maybe it would be better to print an error here and then prevent 
trying to open new connections to the DSP?

Kind regards,
> 
> Signed-off-by: Abhishek Singh <quic_abhishes@quicinc.com>
> ---
>   drivers/misc/fastrpc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..bac9c749564c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -97,6 +97,7 @@
>   #define FASTRPC_RMID_INIT_CREATE_STATIC	8
>   #define FASTRPC_RMID_INIT_MEM_MAP      10
>   #define FASTRPC_RMID_INIT_MEM_UNMAP    11
> +#define PROCESS_KILL_SC 0x01010000
>   
>   /* Protection Domain(PD) ids */
>   #define ROOT_PD		(0)
> @@ -1128,6 +1129,9 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>   	fastrpc_context_get(ctx);
>   
>   	ret = rpmsg_send(cctx->rpdev->ept, (void *)msg, sizeof(*msg));
> +	/* trigger panic if glink communication is broken and the message is for PD kill */
> +	BUG_ON((ret == -ETIMEDOUT) && (handle == FASTRPC_INIT_HANDLE) &&
> +			(ctx->sc == PROCESS_KILL_SC));
>   
>   	if (ret)
>   		fastrpc_context_put(ctx);

-- 
// Caleb (they/them)

