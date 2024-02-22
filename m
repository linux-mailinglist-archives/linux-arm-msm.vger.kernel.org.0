Return-Path: <linux-arm-msm+bounces-12133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A277085F0D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 06:16:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E06FB24161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 05:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50252134A1;
	Thu, 22 Feb 2024 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZQLXTAfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C3D516
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 05:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708578992; cv=none; b=GuZwjcGzBqZf1wa6wSn/rQGayVjOXiSaXPRgCNwwrdnkUTKQx17XAYenaRp4oHnMIJ6WVVtiLyP+3NIqOAzcquVqJiqAvGefB72KbXh8hQmp7xt8dNgJtHUEVALfbdQBTKwdzW+QwjnrRtvCA8EHuxNz4X48OOaaGoaQGRyzOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708578992; c=relaxed/simple;
	bh=EYqco1GKfph2qvviCl2qwp3U+UCjcwLr0vJ5cMoQcXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Onc0+1A4eL9MhGTHgNOrfm3/CGmBc9FezhuNklm/vbG12mVcwrJSWRLzSl6/5UjKX2yPntJfChKC0JjBphVkGIiTHhwVhfWxWHGglohS+XUT+k4bFODjnxPHdbFZrynL8l2ThZQ8jSTk7a8Hhwg2kCWlx6HIA4VhY202gAj9Sss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZQLXTAfk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e4841ce028so1628094b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 21:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708578990; x=1709183790; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duIZxpvn6RingjjUFfVcxJVtZ2NkUSkNaC91pQVkegY=;
        b=ZQLXTAfk0RvwuVmUULKeLpNK72O3zrBu5wE1qw3+2yR0JULUCbtWv8gI7vM34cq7BB
         cxvlDNdpDt6w25riE3cK4aDqefh9ZoXIyIeU53K6P5ZKdsCBarecrUKVTeDMdaw2ff5U
         tJe+UitS43xJ7zxgUQb8mQw4qtwPfr30WQCa3nXG2l4319NT6yG1FQ6EiJHXK9w8VKBj
         WAfg5BMAdkMj6RH6NYBUIfTbHXTHchQkgOrjdUVHB8psQbEMG4lAfKJO6hQ13iidhH5G
         oBwKYoVQFI8W1mAnM6j4t2Wo6/5g0uYPXnBnWBuXLby53HGl2R+es0dMmf4tvLRKSq9k
         trTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708578990; x=1709183790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duIZxpvn6RingjjUFfVcxJVtZ2NkUSkNaC91pQVkegY=;
        b=Q7hGtybcVWBsyvXd7fiVUJfel/OV/nsAFEFMXbnZ1jytSumTYkTIKKEQRnFfMgwAGr
         YP/ehMSpRY6uwtGTNf82MeUHMWRv/4cLJGxW9otsf92IHAeQBx8zGT+npXmevKXu/086
         XAAVyd2J4oGLkmibzpflY79/505MqZ1mjmTpBrp0Ib4TRz/wvhsZ6y3O3TN+s17v2vO7
         3mzeREw/RNfBNdbLA8EMRu2g6m3SbUfNG5TZniNoEneAJyBI/QKTG/bSy/vt9aP9WNkw
         EcgrCzTR5V+qBr4dzRJhMlfe/KGBFOtMAcpqZCk5V8lbAZJ9zEVbt5EnEPpnDwmAa/YA
         velw==
X-Forwarded-Encrypted: i=1; AJvYcCVH8GBEXt9YQlQWYgI8uwKzNvXHHaUO/CPhm6oVg0+RCRy+Y7eN05jqOYxmRE9uxS90z1jEjFsjSpwfY6Rxl/yJpb1FzSlm2GM7vCk6sw==
X-Gm-Message-State: AOJu0Yx6ML6we6HywJJN6sVbHmYXQiEXnYivE0+GYiWbU8fun4RQ3wJi
	oai7evGazErH9SgU/EcdKOrzI7xTLkJqjccjRM1R4Qk4mSXL9kPIWjk7cll4tg==
X-Google-Smtp-Source: AGHT+IF1BbQ0EnZKJMj1ATUyc9q4gcsnLCvpFzHDOMbytY3INdyz3p1P9lC6mFjFGyQVSpe1j4yvSg==
X-Received: by 2002:a05:6a21:1693:b0:19e:b6e0:8d26 with SMTP id np19-20020a056a21169300b0019eb6e08d26mr19510388pzb.15.1708578990015;
        Wed, 21 Feb 2024 21:16:30 -0800 (PST)
Received: from thinkpad ([117.193.212.166])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902bd0b00b001dc35e04b02sm1933206pls.32.2024.02.21.21.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:16:29 -0800 (PST)
Date: Thu, 22 Feb 2024 10:46:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_parass@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: Change the trace string for the
 userspace tools mapping
Message-ID: <20240222051621.GD3374@thinkpad>
References: <20240218-ftrace_string-v1-1-27da85c1f844@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240218-ftrace_string-v1-1-27da85c1f844@quicinc.com>

On Sun, Feb 18, 2024 at 02:13:39PM +0530, Krishna chaitanya chundru wrote:
> User space tools can't map strings if we use directly, as the string
> address is internal to kernel.
> 
> So add trace point strings for the user space tools to map strings
> properly.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/main.c  | 4 ++--
>  drivers/bus/mhi/host/trace.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 2d38f6005da6..15d657af9b5b 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1340,7 +1340,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>  	enum mhi_cmd_type cmd = MHI_CMD_NOP;
>  	int ret;
>  
> -	trace_mhi_channel_command_start(mhi_cntrl, mhi_chan, to_state, "Updating");
> +	trace_mhi_channel_command_start(mhi_cntrl, mhi_chan, to_state, TPS("Updating"));
>  	switch (to_state) {
>  	case MHI_CH_STATE_TYPE_RESET:
>  		write_lock_irq(&mhi_chan->lock);
> @@ -1407,7 +1407,7 @@ static int mhi_update_channel_state(struct mhi_controller *mhi_cntrl,
>  		write_unlock_irq(&mhi_chan->lock);
>  	}
>  
> -	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, "Updated");
> +	trace_mhi_channel_command_end(mhi_cntrl, mhi_chan, to_state, TPS("Updated"));
>  exit_channel_update:
>  	mhi_cntrl->runtime_put(mhi_cntrl);
>  	mhi_device_put(mhi_cntrl->mhi_dev);
> diff --git a/drivers/bus/mhi/host/trace.h b/drivers/bus/mhi/host/trace.h
> index d12a98d44272..368515dcb22d 100644
> --- a/drivers/bus/mhi/host/trace.h
> +++ b/drivers/bus/mhi/host/trace.h
> @@ -84,6 +84,8 @@ DEV_ST_TRANSITION_LIST
>  #define dev_st_trans(a, b)		{ DEV_ST_TRANSITION_##a, b },
>  #define dev_st_trans_end(a, b)		{ DEV_ST_TRANSITION_##a, b }
>  
> +#define TPS(x)	tracepoint_string(x)
> +
>  TRACE_EVENT(mhi_gen_tre,
>  
>  	TP_PROTO(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> 
> ---
> base-commit: ceeb64f41fe6a1eb9fc56d583983a81f8f3dd058
> change-id: 20240218-ftrace_string-7677762aa63c
> 
> Best regards,
> -- 
> Krishna chaitanya chundru <quic_krichai@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

