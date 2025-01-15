Return-Path: <linux-arm-msm+bounces-45147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E823CA127DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 16:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880B5188B66A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 15:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C81A1632FB;
	Wed, 15 Jan 2025 15:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ciYqMMz4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C395155A4E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 15:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736956321; cv=none; b=PADeMGyUAWuwar4srUqe+S5s8K8moAGqKVE/Fv9mQvgsFLTJiNJHsGkv85rjU7mmxiGmy40jrikp4vtusBbyrKVgQKoG8BTwJ/tx3kzOE+U0uZLyFMta8Tz6EklDnDNk63TMlw2sj0TCla6550ZrMkMzLIKA8kfPJtck3F3PDJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736956321; c=relaxed/simple;
	bh=b1O9BPFJ71XFLlUheuDka+LRzs2aZ3Th0tVtRVVvWWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpApTHNWPC+IVC1I23RbwosFekVijIzxqlzPlyOzxI+ec0z+wqcZt9lnVRD3q7+tr/U2b6y9Fv4JbjqY4N1aIajulvJMPvSbgKSdqBwcmwE7tIYmneKQNVfcqSiRkxjGKvGLiP/SBYWOz790ALSTYMsnq8kyeJDZkBSucJUwlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ciYqMMz4; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so3761227f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 07:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736956317; x=1737561117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+9T2aeq3iFePOXUR9+HZacaUOvR2SWTMTmgZmEVRLMQ=;
        b=ciYqMMz4V04vmbPJZmFwfMtbpGSNM9t7sFokD4ePTEiuDLK3YhY5jD0rTjIUmPcCjF
         FKYu4EU6Oqh0whe9Z6qbpw1vsslNlgtVOpIegAev9U0I9YL+I4uhwJMVZmjrmnB4dLIM
         /KabHWO4Ho9ApX6ANGOMxO7djVBII6fkvPU0vNKs+yRbD6zTDezKDOzIQCiZG2zK8ck/
         /LfNQxN8wHVS9ftrnJhLbV/J/9AEIhTW0yTiILnGN5Eoib2QxsAJnac1w06plGIL/UUR
         Tb7laseZpZF6w0zmiaUJ/CDEDtypvlBsUcDxjeqrA20/qfyQN0RVM6o//0HVRKUWkkIW
         1HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736956317; x=1737561117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9T2aeq3iFePOXUR9+HZacaUOvR2SWTMTmgZmEVRLMQ=;
        b=mMY7FMwBgkIu5CHUR27VgYjMTA9lRQ5TNYVwmk0et6E2Nu+Alfy+j+kkCzqhemjZ7P
         Uj2pVnkhHfMf8c0UvZv5Czx51jmgqkZTOy2Za5JgaZB4+rIRTvix3raZ+zYxZr6p8tfU
         23DnwevRSJ8MwkF3mR3u1+U8g1ViS9rqAr3+q9GkP+byBIid93Z3yxYZZVahObp4xV4+
         bpHNsVQqQrlLbhRqYMYGFQTbGuciwORKF8w5k7cWmzUAC3dkXHYwdqd1ufiPlyw0jfQa
         CMRd0km3g3KfQMbZkg2256ARUc+ZTYVTuHauu0k8LR/p9V1XnNYmNZOo7mMKpJoyGgUw
         V6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsiFzhCnz/T2egpkjpKmMa8D5sMEJy6NwLexoT/DxnAc4uWCaDa5SzvvjqjjLN6vMM3qiTvluUEHNpSug1@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLU0qjQem+tMAUEUqU2NRF3FX29aR1psYhFkYgI5HpnxL5dR8
	4j5th0e3LCcuQEJ/+cu1FOttcADm/RIuWz9TYWHvUUk37t1z0+duHyQTKGf96iE=
X-Gm-Gg: ASbGnctrLJdj/Fl4Oj6wJpAxKJ9d70nKALq50PEsFbCGcCIimH/knmeAvjuZCjOeUyO
	ZrlP9MKS7bIBjmMpN/QBiAELjmHKRWwDPcM9lfKiUfg9A55lncI2vtNtrYjdxnd5DXi87nBb+oj
	+90OsJUkKXzU5F1Tp9eP8YrV8UCiC9++dqRG3PuAOkHwmumydhFXfAt2c0SLoB31bUujAADBj4/
	S6lYCgOuCHsz2KGMKJz23+H9QSDOB9sDX23zRIB3WeExVj8jNa+oYXQAYqfSVnHqoFoPg==
X-Google-Smtp-Source: AGHT+IGeRpOl/xcLw670njQbGIlse4M/Ta6BGmBUsUpeZiOkBp+9SFFfdRLO7qw8vg+sKUOnhUyOGg==
X-Received: by 2002:a5d:6da8:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38a872f7ef2mr26480703f8f.2.1736956317319;
        Wed, 15 Jan 2025 07:51:57 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0fasm18298220f8f.19.2025.01.15.07.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 07:51:56 -0800 (PST)
Message-ID: <bbd19ffd-038c-435c-a63b-260a0b933660@linaro.org>
Date: Wed, 15 Jan 2025 15:51:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/16] media: qcom: camss: csid: Only add TPG v4l2 ctrl
 if TPG hardware is available
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
 hverkuil@xs4all.nl
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250108143733.2761200-1-quic_depengs@quicinc.com>
 <20250108143733.2761200-12-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250108143733.2761200-12-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2025 14:37, Depeng Shao wrote:
> There is no CSID TPG on some SoCs, so the v4l2 ctrl in CSID driver
> shouldn't be registered. Checking the supported TPG modes to indicate
> if the TPG hardware exists or not and only registering v4l2 ctrl for
> CSID only when the TPG hardware is present.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   .../media/platform/qcom/camss/camss-csid.c    | 60 +++++++++++--------
>   1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
> index 6cf8e434dc05..e26a69a454a7 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,11 +760,13 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>   	int ret;
>   
>   	if (enable) {
> -		ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> -		if (ret < 0) {
> -			dev_err(csid->camss->dev,
> -				"could not sync v4l2 controls: %d\n", ret);
> -			return ret;
> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
> +			ret = v4l2_ctrl_handler_setup(&csid->ctrls);
> +			if (ret < 0) {
> +				dev_err(csid->camss->dev,
> +					"could not sync v4l2 controls: %d\n", ret);
> +				return ret;
> +			}
>   		}
>   
>   		if (!csid->testgen.enabled &&
> @@ -838,7 +840,8 @@ static void csid_try_format(struct csid_device *csid,
>   		break;
>   
>   	case MSM_CSID_PAD_SRC:
> -		if (csid->testgen_mode->cur.val == 0) {
> +		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
> +		    csid->testgen_mode->cur.val == 0) {
>   			/* Test generator is disabled, */
>   			/* keep pad formats in sync */
>   			u32 code = fmt->code;
> @@ -888,7 +891,8 @@ static int csid_enum_mbus_code(struct v4l2_subdev *sd,
>   
>   		code->code = csid->res->formats->formats[code->index].code;
>   	} else {
> -		if (csid->testgen_mode->cur.val == 0) {
> +		if (csid->testgen.nmodes == CSID_PAYLOAD_MODE_DISABLED ||
> +		    csid->testgen_mode->cur.val == 0) {
>   			struct v4l2_mbus_framefmt *sink_fmt;
>   
>   			sink_fmt = __csid_get_format(csid, sd_state,
> @@ -1267,7 +1271,8 @@ static int csid_link_setup(struct media_entity *entity,
>   
>   		/* If test generator is enabled */
>   		/* do not allow a link from CSIPHY to CSID */
> -		if (csid->testgen_mode->cur.val != 0)
> +		if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED &&
> +		    csid->testgen_mode->cur.val != 0)
>   			return -EBUSY;
>   
>   		sd = media_entity_to_v4l2_subdev(remote->entity);
> @@ -1360,24 +1365,27 @@ int msm_csid_register_entity(struct csid_device *csid,
>   		 MSM_CSID_NAME, csid->id);
>   	v4l2_set_subdevdata(sd, csid);
>   
> -	ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
> -		return ret;
> -	}
> +	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
> +		ret = v4l2_ctrl_handler_init(&csid->ctrls, 1);
> +		if (ret < 0) {
> +			dev_err(dev, "Failed to init ctrl handler: %d\n", ret);
> +			return ret;
> +		}
>   
> -	csid->testgen_mode = v4l2_ctrl_new_std_menu_items(&csid->ctrls,
> -				&csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
> -				csid->testgen.nmodes, 0, 0,
> -				csid->testgen.modes);
> +		csid->testgen_mode =
> +			v4l2_ctrl_new_std_menu_items(&csid->ctrls,
> +						     &csid_ctrl_ops, V4L2_CID_TEST_PATTERN,
> +						     csid->testgen.nmodes, 0, 0,
> +						     csid->testgen.modes);
>   
> -	if (csid->ctrls.error) {
> -		dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
> -		ret = csid->ctrls.error;
> -		goto free_ctrl;
> -	}
> +		if (csid->ctrls.error) {
> +			dev_err(dev, "Failed to init ctrl: %d\n", csid->ctrls.error);
> +			ret = csid->ctrls.error;
> +			goto free_ctrl;
> +		}
>   
> -	csid->subdev.ctrl_handler = &csid->ctrls;
> +		csid->subdev.ctrl_handler = &csid->ctrls;
> +	}
>   
>   	ret = csid_init_formats(sd, NULL);
>   	if (ret < 0) {
> @@ -1408,7 +1416,8 @@ int msm_csid_register_entity(struct csid_device *csid,
>   media_cleanup:
>   	media_entity_cleanup(&sd->entity);
>   free_ctrl:
> -	v4l2_ctrl_handler_free(&csid->ctrls);
> +	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
> +		v4l2_ctrl_handler_free(&csid->ctrls);
>   
>   	return ret;
>   }
> @@ -1421,7 +1430,8 @@ void msm_csid_unregister_entity(struct csid_device *csid)
>   {
>   	v4l2_device_unregister_subdev(&csid->subdev);
>   	media_entity_cleanup(&csid->subdev.entity);
> -	v4l2_ctrl_handler_free(&csid->ctrls);
> +	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED)
> +		v4l2_ctrl_handler_free(&csid->ctrls);
>   }
>   
>   inline bool csid_is_lite(struct csid_device *csid)

The TPG on the RB5 has a known bug that not all test patterns work. I 
verified that the coloured box TPG still works after this change.

Like so:

# colour bars test pattern 9
media-ctl --reset
yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev6
yavta --list /dev/v4l-subdev6
media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SGRBG10_1X10/3280x2464]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
media-ctl -d /dev/media0 -p
yavta -B capture-mplane --capture=5 -n 5 -I -f SGRBG10P -s 3280x2464 
--file=TPG-SGRBG10-3280x2464-000-#.bin /dev/video0

I think we had some confusion about the TPG regressing on v6/v7 of this 
patch but, I suspect the wrong test pattern was tested.

This works as expected for me.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165 rb5

