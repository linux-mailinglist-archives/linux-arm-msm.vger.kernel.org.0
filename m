Return-Path: <linux-arm-msm+bounces-6601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08581826CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92082810B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605CE14AB4;
	Mon,  8 Jan 2024 11:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TlAG+kqG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C1214A93
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-336dcebcdb9so1916206f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704713533; x=1705318333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uimCBHCQHsez7psI7ZTry0K7+PAJVXBNStv3yV/6sIw=;
        b=TlAG+kqGMKxASiEedLCpKJ02aM2sXwQp3F2ErYpQnkOf0PW42n640W5d2SkbF0pZK9
         08soJip2AvGy2rUFADyffVWfGbdY/j9cEbjktRJ4N2H2amm2jaiwC58jJc0jk4tBkwew
         C47ms8jhVjLcwvlaEAz0oLb90PRHCj4ldXse4rCfVhTqyrs85UDskyIShZ2wBSaKiiZT
         jjO8j8pzujxznpthYT4ZPorOiaA1lwJeZwk440l3NhbfgAFF0JgmuO1+vX0pjjUctyIr
         BZLfsb1V6+ymbpz/AdgV0xnEQSqY00asX3h3eV1VWzVi5OjMCKYOp0XsdK78PlMZh3iM
         7opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704713533; x=1705318333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uimCBHCQHsez7psI7ZTry0K7+PAJVXBNStv3yV/6sIw=;
        b=lt4o3wjOmXQF70nAvZ1vWT4fv8UVQ3QIXQmW1Qg3ybFfNNiE0r+I474Ua/hojfQinv
         PVIj0fVn58ErxW6j1l48pT26ydoml1UnvkOq8y+JmLEW+Izl4K1ud9DLeK6TGvn6erhN
         XBNyhAa3cscf1KJTVdrzBaUBffJyUM7nHPZcLxFDuqn1xYI43IRcgV7W8RVMcbj6r7Cc
         dM7abTpoi6E2D8VJ/8pfBfn3e71d3Fp1t4K89IACHSyeZknCPT8eh835PUxj83CsWuat
         ieGjZIWIk8idT3dt4HLrELI03OrEFaZuHqqADWVyTCNtuJdWI/rKH10khob8jRlmgXN+
         58uw==
X-Gm-Message-State: AOJu0Yxy9qunjW6U9HjH9elbYgcUxi70GdY/2r4u1bFfhJIq1oDpq9BJ
	voRvi4SR9PT/+NKDuYnGF8VnC1qwF4/VVA==
X-Google-Smtp-Source: AGHT+IHUA9bAvQQCRf/GXd+0/1CSx6SkPaAgPnUyOv4ZPWFSjLIIANgegL8HSa/VK7ux5/+yF7ifcg==
X-Received: by 2002:a05:6000:4ec:b0:336:4b84:1e79 with SMTP id cr12-20020a05600004ec00b003364b841e79mr1063757wrb.194.1704713533299;
        Mon, 08 Jan 2024 03:32:13 -0800 (PST)
Received: from [192.168.100.86] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id u3-20020a5d4343000000b003376d4248a9sm1349637wrr.71.2024.01.08.03.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 03:32:12 -0800 (PST)
Message-ID: <2ba3cef1-cdd3-4f38-b378-b91474c0ff5f@linaro.org>
Date: Mon, 8 Jan 2024 11:32:11 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: venus: flush all buffers in output plane streamoff
Content-Language: en-US
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1704695615-1036-1-git-send-email-quic_dikshita@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <1704695615-1036-1-git-send-email-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 06:33, Dikshita Agarwal wrote:
> For scenarios, when source change is followed by VIDIOC_STREAMOFF
> on output plane, driver should discard any queued OUTPUT
> buffers, which are not decoded or dequeued.
> Flush with HFI_FLUSH_INPUT does not have any actual impact.
> So, fix it, by invoking HFI_FLUSH_ALL, which will flush all
> queued buffers.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/vdec.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 29130a9..0d2ab95 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1255,7 +1255,7 @@ static int vdec_stop_output(struct venus_inst *inst)
>   		break;
>   	case VENUS_DEC_STATE_INIT:
>   	case VENUS_DEC_STATE_CAPTURE_SETUP:
> -		ret = hfi_session_flush(inst, HFI_FLUSH_INPUT, true);
> +		ret = hfi_session_flush(inst, HFI_FLUSH_ALL, true);
>   		break;
>   	default:
>   		break;

Missing

Fixes: 85872f861d4c ("media: venus: Mark last capture buffer")

Once fixed

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

