Return-Path: <linux-arm-msm+bounces-7568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DCF831E9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 18:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CBC91F21F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jan 2024 17:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AF82D605;
	Thu, 18 Jan 2024 17:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNx2ZLxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A22D600
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705599903; cv=none; b=IJjYr6tvgN63y65isANN08rCveK/T5UAXM+2eLIbXVA2upB+j2pyiDXXqBdzY1HVOegUXPFi8TlKTDk5fGO7Gz/j8ln+q022O/F+kMv2L4hdtetgJUj8K1WHmqBegIUOxgk3aXoamQaPhpjfAHnmcTdH0AaMfExozWWTwohw7lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705599903; c=relaxed/simple;
	bh=9FmE4PJJMHUJcOAmiwnAx4z1xIV4aO2a5RhnwfLZmL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlFmpW6IWvBmlbwxjqvc+0NI0bTeGNN7UCLt/F2aFQXQWCfqsqAcRWXzGT0i3DkgvNYzslIjYgqcD13oQS7v1MwnzfgYUSdiESuhqOzuRKlXBKlzCS9D5/zL/R6iNci/2GqU7kA4I0kc4uzn0JRqvr5fJPJs1UGA8Idt4jDerEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNx2ZLxA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e4e3323a6so1096015e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jan 2024 09:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705599900; x=1706204700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSfW+YUfmRkyvf/SzyhIkwxnaiEK9UQEjvnNWE6tnVg=;
        b=kNx2ZLxAub2oFRza92YPo+U9X68g16/g9XEDK9mbUgQY+9iiZLP5NL1q+qKFHkKmn6
         QWeiSNzKagj0dFKV1kOfTVD45uZDcjykB8GVlI29nheM8deoxAt296A9QAVzBixWuA4X
         ZVxBqXnOSrtNr0A551Mn0IL0E5ukn4nxJVFQiC8eb/fotwXrgc1VIPkMi6W8uyYtzDFt
         N2XM20v+/mcJ/+3P75DOEQTJTmfNo1Evw/jGthT9yTOKD9y5RsxaVOShj9BM2ui5eCUN
         U2nKoR2nB2Xw9EFZyyHIK25hTkDbfThOwc5v44RfNj2hbeRReXJ1rjW/9iKplMc4MSg+
         kNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705599900; x=1706204700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NSfW+YUfmRkyvf/SzyhIkwxnaiEK9UQEjvnNWE6tnVg=;
        b=MgfS7zE84+itt5L9F/VudSuqv+Ebop4bzmkeT8SJzLg4fNnlu3BEfQD+YVvIM0dB/S
         Wak2onqTnkpq++YKojajQIzW2hdDsof+3vkrxF6HIrfslAGnVqmpU3VwcBYOq/qbVGh8
         cZDZp87GfeKLHVqQDED6fckrMg7weXe0aa0BwdqM98i7o7Z/dbbAaUMx7eScH12DiB2N
         e5paDhHPdOoDosw07DjaIVSatLZJGQ0keOnYy3uHuyrUYIdmV0Rt8rVlpG1wjb7nEFpH
         5WFBVWn758OPk30fYOOYnvc5XgbCj/kQ1Y4ROQBNRxI71+2xl0euDqg4ecvLQep8r2qS
         mLkQ==
X-Gm-Message-State: AOJu0YxG9EFonmU4jHfpxLqeEqlyxyR1KkUns9xXLKAfs5fu2dC19sIM
	kEbbKxPIGG1HuUNCwRdXYBk1T5PXAI3SgSZRhD5FlKHdRJ3vUP7oOwrdgadsxDQ=
X-Google-Smtp-Source: AGHT+IFMZMNJ9hclYGahC7K3qfbzmRSnW3OqnqmNUQR6BgamVW7SW02oVYX9Erny3j7GZr3boHA+kQ==
X-Received: by 2002:a19:644a:0:b0:50e:e1c3:f97b with SMTP id b10-20020a19644a000000b0050ee1c3f97bmr1859018lfj.3.1705599900074;
        Thu, 18 Jan 2024 09:45:00 -0800 (PST)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k17-20020a192d11000000b0050e9323408csm716228lfj.57.2024.01.18.09.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 09:44:59 -0800 (PST)
Message-ID: <04a364e8-534c-40a4-a031-b9f9d2304c39@linaro.org>
Date: Thu, 18 Jan 2024 18:44:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: venus: add new rate control type MBR for
 encoder
Content-Language: en-US
To: Sachin Kumar Garg <quic_sachinku@quicinc.com>, hverkuil-cisco@xs4all.nl,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240118105934.137919-1-quic_sachinku@quicinc.com>
 <20240118105934.137919-3-quic_sachinku@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240118105934.137919-3-quic_sachinku@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/18/24 11:59, Sachin Kumar Garg wrote:
> There is no limit on the maximum level of the bit rate with
> the existing VBR rate control.
> V4L2_MPEG_VIDEO_BITRATE_MODE_MBR rate control will limit the
> frame maximum bit rate range to the +/- 10% of the configured
> bit-rate value. Encoder will choose appropriate quantization
> parameter and do the smart bit allocation to set the frame
> maximum bitrate level.
> 
> Signed-off-by: Sachin Kumar Garg <quic_sachinku@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_cmds.c  | 38 +++++++++++++------
>   .../media/platform/qcom/venus/hfi_helper.h    |  1 +
>   drivers/media/platform/qcom/venus/venc.c      |  2 +
>   .../media/platform/qcom/venus/venc_ctrls.c    |  5 ++-
>   4 files changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
> index 3418d2dd9371..95fc27e0dc7d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_cmds.c
> +++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
> @@ -645,17 +645,33 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
>   	case HFI_PROPERTY_PARAM_VENC_RATE_CONTROL: {
>   		u32 *in = pdata;
>   
> -		switch (*in) {
> -		case HFI_RATE_CONTROL_OFF:
> -		case HFI_RATE_CONTROL_CBR_CFR:
> -		case HFI_RATE_CONTROL_CBR_VFR:
> -		case HFI_RATE_CONTROL_VBR_CFR:
> -		case HFI_RATE_CONTROL_VBR_VFR:
> -		case HFI_RATE_CONTROL_CQ:
> -			break;
> -		default:
> -			ret = -EINVAL;
> -			break;
> +		if (hfi_ver == HFI_VERSION_4XX) {

So, only sdm845/sc7180 and friends support it, but the newer
SoCs (like 8250 don't)?

[...]

> --- a/drivers/media/platform/qcom/venus/venc_ctrls.c
> +++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
> @@ -387,10 +387,11 @@ int venc_ctrl_init(struct venus_inst *inst)
>   
>   	v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
>   		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> -		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +		V4L2_MPEG_VIDEO_BITRATE_MODE_MBR,

Is this okay, since you're claiming only v4 supports it?

Konrad

