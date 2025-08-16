Return-Path: <linux-arm-msm+bounces-69432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D4B28D49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 13:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC6A3A9ADD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Aug 2025 11:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC19F29C35F;
	Sat, 16 Aug 2025 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="duG1dyx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8548BE46
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 11:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755342441; cv=none; b=VA+VJDGDZ+rXUiBfNIFy94c82DYoDLCdKg03lTQ1FnWzvmtulKlrvkuxyBcP+hlDqgbglXP3vkoO/JtmXeVPACZ3FsbqJXMfi1C94IFLl1qVBWJYqU8774S8UzQNCM3sAUPbepdXPBg9hv+hLF7yfR0H+pcKf04jmGJSFE7ki/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755342441; c=relaxed/simple;
	bh=KcxmTblB171DN1VQVB74Vbu6xWumGzwIasu9gVQzsSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DPonp55TAlRJ6FI/wxSmggDMc4GNI7w+SvxEvqOIBzAXRGfZdWgO7p1896B68c/7WmnJ0JrLvpxWW+ikbPNxj6BAPVE1b7v5Qe4/FrHRo1Z2QVRrDDEHroXhcjfAk/GUhArLVMDMFPE/LdCzAvcSu+JB5EC57IcnYPDgH2gSCgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=duG1dyx1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b004954so17927155e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Aug 2025 04:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755342437; x=1755947237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8I86yVIQyYfFhc/J2h2VClBRGhT4pZplj1eoh46kfZY=;
        b=duG1dyx1PIGVIn5VoPY1YvCnU90gMvyPwk+2YuSDntmdVrSyZIfdInOosKZseQTeWF
         mIGOik7YIUo9tGnpL2p8T1Ldb7r+KDWOSQ0+eRLwsvJEVWNE1y0Ib3QhfvWjDvYvr+Lb
         lPj6NH0PlQnIWUbabUhtCfcT375QxRJysqYg/ZFRjO4rKkY63dYizVNE2bPbW82jlQaG
         wclFdhdTvvlJXCfAornhbA2CDYj/6ZfuPtYMzKJex2+A3Ga6ccMi2cEqw6wWxkj6gX8u
         6MKUM6Ps6Lc1X0q3hRAq2dYt1Faoi70DTEZm7kwEyag51OzEg0Y9Ycv5lLkmClnzdyhC
         Wvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755342437; x=1755947237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8I86yVIQyYfFhc/J2h2VClBRGhT4pZplj1eoh46kfZY=;
        b=Gt917akQxDJzA3he9suGQ/uk3UWCsaCtqjtUR7SYP1ZurAYNrczLSwbuAeazaBYrpu
         wUjslqr9tJiM1htecbkUvsZEDYsVtibDy4DU/2Ad1Afuj/iaPCWzkh5P6u8Pn+slRwm1
         kNbLmCZdamEBggiWoOic03jbHWU8b3flLzi2oPD6ye5JyFr6oK5m4WjTkHTumwp9laDi
         hK/e6O8oeMVotPFGiGlLSG8uYB2jaBz26zA9n72kyUJnpHlAt76G10mEjsbQTW1GQpRJ
         CoCrl/DB90uHR8NXhCKMSWeIfLOKXeqEiy521R/RgGYu0LxhLo2tGbG+OQEpmaGPOP/Q
         ANDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwEekqewKQJ4w/QjAUy0o7p0j8DCX4wlB4MOXr+rqBqeU3oJgfmPF4xnOe/0ULhAzkuK4LdeW4PP7Pt3UJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ4H94ZfuJ3vQmZHCTPs2GiT7upczSkOWAXiRD096qBgBWr2wb
	/hlc1jjmuXyRFHcg4S/MJTPo34Nq/t2VMJoum1E7lZb/Pi6XOGoXCIzwCs6by+mvpv2XTCdKN5i
	isyZ1Lfk=
X-Gm-Gg: ASbGnctYvuGYtpyrdKo0MF1AzgI2v21H9lmagTuC0pflPfu3p8ilzB74q+Za+tcb5mg
	h3ZJzKlRx+jL9YhJHIvECvKcUJ7Ydl+RV6EA4cZdoilC/qJok/fqK/SmdBd+Ztkhe4x79jJbps2
	XM6D5EAPwSDiXGNOB0msh+hBbxh2trLEcr6SHYFVyzWU3Bwkcs4en216o2fdvJeta93GrYqGfr2
	UinAaLrCq34X1UkkswM3H+jwxLBaIIBRA5NCLKta/m5HWPSnWd8Ds7Qs10uQhOQvCQFWqWLFZ+c
	6S/SQjirxFpZuVe+XUU1dx8L16+evDJOlywdb/NUqsvZKco+w8Ho4ZrphoBo0kBpwsZqSfElvT1
	IWEqvxh5olV+Cjsij5gPr6YK/dy/PdDi9uLrqTvmXlB6CelV3jnSw0fENm5Vmpj+E
X-Google-Smtp-Source: AGHT+IGdchvXBqZGo4Ml5Nl2HdqMdL+AQYswdvxJ0QVQNV+dSeNVe2USeW/HxwgsJqjVC02JrCNJPA==
X-Received: by 2002:a05:6000:400b:b0:3b7:9b58:5b53 with SMTP id ffacd0b85a97d-3bc6a280040mr1747639f8f.45.1755342437185;
        Sat, 16 Aug 2025 04:07:17 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6863f84asm5283862f8f.65.2025.08.16.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Aug 2025 04:07:16 -0700 (PDT)
Message-ID: <4fe5d966-f788-4fd7-9e74-6d63ecc8dcb3@linaro.org>
Date: Sat, 16 Aug 2025 12:07:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/24] media: iris: Allow stop on firmware only if
 start was issued.
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
 <20250813-iris-video-encoder-v2-8-c725ff673078@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813-iris-video-encoder-v2-8-c725ff673078@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 10:37, Dikshita Agarwal wrote:
> For HFI Gen1, the instances substate is changed to LOAD_RESOURCES only
> when a START command is issues to the firmware. If STOP is called
> without a prior START, the firmware may reject the command and throw
> some erros.
> Handle this by adding a substate check before issuing STOP command to
> the firmware.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Tested-by: Vikash Garodia <quic_vgarodia@quicinc.com> # X1E80100
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 5fc30d54af4dc34616cfd08813940aa0b7044a20..5f1748ab80f88393215fc2d82c5c6b4af1266090 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -184,11 +184,12 @@ static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
>   	u32 flush_type = 0;
>   	int ret = 0;
>   
> -	if ((V4L2_TYPE_IS_OUTPUT(plane) &&
> -	     inst->state == IRIS_INST_INPUT_STREAMING) ||
> +	if (((V4L2_TYPE_IS_OUTPUT(plane) &&
> +	      inst->state == IRIS_INST_INPUT_STREAMING) ||

this is becoming a highly complex clause

         if (((V4L2_TYPE_IS_OUTPUT(plane) &&
               inst->state == IRIS_INST_INPUT_STREAMING) ||
             (V4L2_TYPE_IS_CAPTURE(plane) &&
              inst->state == IRIS_INST_OUTPUT_STREAMING) ||
             inst->state == IRIS_INST_ERROR) &&
                 inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {

can we not reduce down the number of conjunctions and dis-junctions here ?

Its getting hard to follow.

For example pivot on if (inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES)

or make it into a switch for inst->state... no that wouldn't work

Either way the complexity of this clause is indicating to me we need to 
do some decomposition.

Please consider if you can rationalise the logic here and make the code 
more readable.
>   	    (V4L2_TYPE_IS_CAPTURE(plane) &&
>   	     inst->state == IRIS_INST_OUTPUT_STREAMING) ||
> -	    inst->state == IRIS_INST_ERROR) {
> +	    inst->state == IRIS_INST_ERROR) &&
> +		inst->sub_state & IRIS_INST_SUB_LOAD_RESOURCES) {
>   		reinit_completion(&inst->completion);
>   		iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
>   		ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> 

---
bod

