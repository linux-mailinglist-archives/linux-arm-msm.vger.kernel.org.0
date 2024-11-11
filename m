Return-Path: <linux-arm-msm+bounces-37498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB89C49B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06C63288B02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 23:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00711BCA0D;
	Mon, 11 Nov 2024 23:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QeZU9kVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA31F17623C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 23:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731367770; cv=none; b=HBsgqLtacRo+6+jw5x0bBF9YCt+5IPPazZOkhcPMpAGzVi6XD9aptAWqHnKLcnhcgs+zSApbuOwGHxDBmXBs3UZ5gDKn+b7frXr04h21FqL+B/L0TtDu8f1XSTMGCk3j3BMhxK8GXJE/aoe15HRBWV9Gg8DgrffWmveybE7+Y+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731367770; c=relaxed/simple;
	bh=/tjIkWw4PvRqTQw5KuMuQOxcVJbv+JLJn8MTtCoNpt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWUmsDUcOXRVJIz5VKahNV3j7NoM575OyUk9TdhdMQyHr7ATxCSuNbFwCgsOEFiCD8FIJ8ls6XXmjpDFm5xUpFm4F504yuoW15D7ypRg85VgPxMvM6qroZC4YKjveI64pihjdQzthDNuLy6sxqkqfl8qjkXINSvFm0wxM0CtY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QeZU9kVb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4314b316495so41489345e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 15:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731367765; x=1731972565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oa1VJpZ4p6YGJ+WYpQ67ZD6EqkVJFeQvNAjNpkcu23s=;
        b=QeZU9kVb2Nvfw15Z30RlGRxeJSRH52LnDR6y2I01KBFMyeK/fyeVnQLGu4JC5ZBSY4
         IGJxhQHmQwFqo0CKQJst9P1KgUnEpm/66b6ztFv+lz89J/xay85eclZhKGX2tElHgdqq
         7QAMk0G4/NaYe+d4eME3hN6yGTZbQ5nli4boGd1FHI2S2loxGT5weRDPBF6wNGfkKGnZ
         wwio0Ro3fl3nVejk1OczKPyAcOeyH4FeNsn9IdpKeucWIpSx5RlhMdRPVcbqs7YMrdZ1
         1AWdLpsV440VueAcki4x8NxscTn+WOBLlR6lYM5xG+onM+tiEdvC/8KGp1tS9nuNKmFY
         gEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731367765; x=1731972565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oa1VJpZ4p6YGJ+WYpQ67ZD6EqkVJFeQvNAjNpkcu23s=;
        b=rv3zhl60aimd/w2nm8d0a/eM7ukSuJx/udklimX1i+bOGxDT0wUDLZUWz2aNpXxyF+
         kV2gTKin0PS7xzfsggIHOWM6AWeOiInj2/I4ylj9FygT5yqMvAmHbPcX6Sz5OnmGDAHc
         +LF7ZF2VWMPnBHEC/Z3pUOv/jE5G8EHz7/T2AhbqC8VHscOloe0+hmPSIGUVhR1XoQF/
         VSosfNvAFZzBAesV1SQxxf5DtXVV9WNFb4TG/BXXzGI/nZhBPYOWw/96tlOMvrrbrIh3
         FWQxOnwy0VXzW4QrWj26DdEuCMPw4nk5MH4SI3DAU0bpXCPSA/8nZuN0oMKYD7lwU5Eu
         VxLw==
X-Forwarded-Encrypted: i=1; AJvYcCXz0RAmSANEp0FKe9d+aAeyz5hU6YiYuV3gjwx5TUU2tcQQ+J9Iaq7yIbMK4Xgvavfn2I3MDf96+AicRhGO@vger.kernel.org
X-Gm-Message-State: AOJu0YyTsSeo/XMvXtSSaqFuG6aUleC7VP0DmrlAlyXDKhjfKsEtHaBl
	svW/IajlsxPsd0EyKYJPA0wn8oCOfIvECgPwmBo+mAp+i3QSn4JLa3ANWkY36i4=
X-Google-Smtp-Source: AGHT+IFvD/ox9/nCVwmu4XWxmvWBYTITqDtdQxRKR2SUvFdgbcI8+lXS6e9fQXV+MStohPyjoA/YGg==
X-Received: by 2002:a05:600c:4f4e:b0:431:57d2:d7b4 with SMTP id 5b1f17b1804b1-432b751726emr127710445e9.26.1731367764943;
        Mon, 11 Nov 2024 15:29:24 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa74abb9sm232417385e9.42.2024.11.11.15.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 15:29:23 -0800 (PST)
Message-ID: <3ffdab33-4680-43ec-95d6-fe889619dbcc@linaro.org>
Date: Mon, 11 Nov 2024 23:29:21 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] media: qcom: camss: Restructure
 camss_link_entities
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, krzk+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241111173845.1773553-1-quic_vikramsa@quicinc.com>
 <20241111173845.1773553-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241111173845.1773553-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2024 17:38, Vikram Sharma wrote:
> Refactor the camss_link_entities function by breaking it down into
> three distinct functions. Each function will handle the linking of
> a specific entity separately, enhancing readability.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 159 ++++++++++++++--------
>   1 file changed, 105 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index fabe034081ed..1052c01b45f3 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1840,14 +1840,66 @@ static int camss_init_subdevices(struct camss *camss)
>   }
>   
>   /*
> - * camss_link_entities - Register subdev nodes and create links
> + * camss_link_entities_csid - Register subdev nodes and create links
>    * @camss: CAMSS device
>    *
>    * Return 0 on success or a negative error code on failure
>    */
> -static int camss_link_entities(struct camss *camss)
> +static int camss_link_entities_csid(struct camss *camss)
>   {
> -	int i, j, k;
> +	int i, j;
> +	int ret, line_num;
> +	u16 src_pad;
> +	u16 sink_pad;
> +	struct media_entity *src_entity;
> +	struct media_entity *sink_entity;

Vikram.

Thanks for the patch.

Please reverse Christmas tree this declaration

struct media_entity *sink_entity;
struct media_entity *src_entity;
int ret, line_num;
u16 sink_pad;
u16 src_pad;
int i, j;

> +
> +	for (i = 0; i < camss->res->csid_num; i++) {
> +		if (camss->ispif)
> +			line_num = camss->ispif->line_num;
> +		else
> +			line_num = camss->vfe[i].res->line_num;
> +
> +		src_entity = &camss->csid[i].subdev.entity;
> +		for (j = 0; j < line_num; j++) {
> +			if (camss->ispif) {
> +				sink_entity = &camss->ispif->line[j].subdev.entity;
> +				src_pad = MSM_CSID_PAD_SRC;
> +				sink_pad = MSM_ISPIF_PAD_SINK;
> +			} else {
> +				sink_entity = &camss->vfe[i].line[j].subdev.entity;
> +				src_pad = MSM_CSID_PAD_FIRST_SRC + j;
> +				sink_pad = MSM_VFE_PAD_SINK;
> +			}
> +
> +			ret = media_create_pad_link(src_entity,
> +						    src_pad,
> +						    sink_entity,
> +						    sink_pad,
> +						    0);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to link %s->%s entities: %d\n",
> +					src_entity->name,
> +					sink_entity->name,
> +					ret);
> +				return ret;

We repeat this pattern over and over again.

I realise that's how it has evolved in this code but since we are going 
in with the knife we may as well fix this too.

Please functionally decompose the "Failed to link" message down into a 
function.

Once both of those are done:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

