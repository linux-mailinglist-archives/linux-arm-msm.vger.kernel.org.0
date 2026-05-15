Return-Path: <linux-arm-msm+bounces-107762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGzgNNXvBmofpAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:05:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0D54CFD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F418331CDA1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E36441027;
	Fri, 15 May 2026 09:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l7KnHs6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD7744CAEA
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837884; cv=none; b=tHYfbDPfV6WwD2A4PN1YLunALTWh1qXg8q7AuD3Yu3jw290ViCriNgpZe85MfDR8/z4FIGsX9RTSRbEgcJldn8GnMsigpTYZBRhAeqFksFDUHW2D7hojFM5Qw3fQChuVLHOD8jgwRJYcSf0SVonOTYpRebMawgFFeRzMpGXVy/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837884; c=relaxed/simple;
	bh=3+DIrEKOTRjSn6Jf6u2F/51kxz9IyDHPxLTMZ31egG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lf8drlK556pK5KU9RncMno566i1JfdswWziTyveeAwJyuBXCzIW0DQmUM/Vio2O647eN9Ivd451i+vAWXrLncr/MEY1IwBZg9aZFcMgki+E4/Iw0Rj6dKV0CNODyejU8gJ6er3AUPlvtGmwRFDttDX4SMRRSh01t/h6lSlZfaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l7KnHs6Q; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so2706964f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837881; x=1779442681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JM0+spwssTd7/SW0gHqM1ACIOAIt6XsH3GP9t91zyrs=;
        b=l7KnHs6Qy/WxNWuBa5bQu+OslUFq53oJnEXGUPyIvuGXiXy50poBlU6pybzxfmzKdL
         WAOzuzmSfuoe09/URs5ZysrTKKEwHfaKUYEGplEYAtqHDTJeLer3536nmRTmpKje0uxR
         LYMD2JDgFNibw9XgF4q5wCKBq21yiV9vwHIQJTPxwIdE3f0un6Pm0ZA9Fbj7No+hkiks
         6VK6js3XnrsN/EWtm3AkfT6WAgUEguAz7hrpPOFzx9BJY6BsrrS/pWIKDMD/GOuzkxwF
         Yf9ppQ80AsBTDB59rA+Ex62bROKN7PfScqcuBWGad8tOsHL7roGluMaZZmEV4t4i8ZBs
         Lrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837881; x=1779442681;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM0+spwssTd7/SW0gHqM1ACIOAIt6XsH3GP9t91zyrs=;
        b=DsfZabllYudpTAZndG7or+eCOk0FxH2c+qflsyxLwAoKNJcU0o3sxK1o7wrxtAjX22
         dEOgPmiZ97EAD+1+xYfAAl2E9jrMcVwh0zO5QfdzvQgNn1qZkBd+Wy20oDShQso59NSt
         uMHqey2Ywej2BQipywpy6Kp60TDb0z8orjuq6EJW+9wZMsy3US8zSLD2gvLsg99VfQXV
         WjOJcLV9i3fcMg7dxAAknBNDNFTNsuOU6G1MY0bTxjTPdRPLf6f/zzERK+7ccjEJoY7P
         10g1ML2EHSUu+YpntZl7JWp21mbvRR+pkQHIvM66mvN0awcikpfW43Zz6KXwYvPvajGQ
         Shrw==
X-Forwarded-Encrypted: i=1; AFNElJ+eS2hZa0ZaITQu9NLviRqPL/IFKPoz4QPSbV/u5avJjiir3U74tBe19QXcd+og69DVHvESYOocslaTT06d@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+O8/MOwjYrAbjrgDogxpZ9F0usgb2AsYyD8jLFOhCTRgXZPE
	9Fp80FzwXKpySBrfuZFH1l1r8l7Msz+cyp1dD3pLPWabFw0jLkQnetjHLjjK4o1susU=
X-Gm-Gg: Acq92OGZx8XxuwA9Cpyg2ehwOAEnaAhH8A0u6uyj1R3DKedbynOlsm2QJCksa/dMw5J
	2dnAulgHIrgDCt7lOHeCGdn8YRbgv6SqiJKbS0DDiFy57a/N1FYGwAJlV9xmdk8POEXOiqHvwb9
	WPnTyA0GbPwHK+6PnOpUn/O400tP5wdNJOZbxYNZGBcHHsBc55I9ONZuw9c1SeYFnuhEje7Azl7
	lNVEcF8+5iXJtJCGaKxluFxjYpZT8vPXxUkndgcFb2337ck3LXpdlMu4a9J0Mdgy+ZgkCg2KrOG
	Na4nSuBSEh7ccJ7VErfKVUrYDPDIiVM/GrAl0LVebJSgcjxc8SIK1Q/JDkYd93TqK+vfbJWX/wl
	YHOSAHN+mGyhpTl1O+8bhKcTVcvwsN8wC3zc4w0e7G5j++oOl9djPH/Io/OymKRxCh86eW6iHZT
	FLpqD3bb117X1P0RW6bXxocv9UWEteIsftwCA9
X-Received: by 2002:a05:6000:40df:b0:456:f186:7af8 with SMTP id ffacd0b85a97d-45e5c35e4c5mr4179602f8f.4.1778837881492;
        Fri, 15 May 2026 02:38:01 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.168.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13540897f8f.14.2026.05.15.02.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:38:00 -0700 (PDT)
Message-ID: <af3c7e4d-f18b-4247-82e9-2dc74f569a5d@linaro.org>
Date: Fri, 15 May 2026 10:37:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <0boIejkDZLA5Kw9uSWxeZX3GforfnPgAo7E27fY_Nnp4VjgHo8d9b70ojS2zrG-xk4dDT__EyunCPPEgJh1Niw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 47A0D54CFD4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107762-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 11/05/2026 10:20, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..cd3509da4b75 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -18,6 +18,7 @@ struct iris_inst;
> 
>   #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
>   #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
> +#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
>   #define CODED_FRAMES_PROGRESSIVE		0x0
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index eea69f937147..f4d9951ed04c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
> 
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}
> +
>   	return &fmt[i];
>   }
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>> --
> 2.34.1
> 


