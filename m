Return-Path: <linux-arm-msm+bounces-94821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN14OAJbpWlc+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:40:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C691D5AB4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:40:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88181300EAA6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673D83B7A8;
	Mon,  2 Mar 2026 09:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dP9t/+Np"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A36E2741B5
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444397; cv=none; b=D3VpfL7SNRGxgZB6Kme3Xycj/H4E52pIB9epB4phMIPrLAPUBxx2luQO2VWNtvZxszLOtBrJFdHMU3Qe7BQDCWeiwMH/ju7cX74Q59nfVBMIpGXkNE/MSBaDlPfG3YLU4WttKdzj/8+kq140K3AiFygyRKEom6TU2BT9vab81Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444397; c=relaxed/simple;
	bh=6DQKMEcDr4pi7ZFzxJFbqClGPI9BsShAWGUTOqGwbfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUHnpSDOHRUAbcJIMxkNmmk9YpAmltKeHL49FZmqrAkU6MpKgTyGtrWNjr0OI+FIOD35EZB0djvbe4D11GIFyb8DMowzNpYeunUfCsrLJ0zOvRWuHOFs0qDGvm77BWA0U1sHI+VrNIiLoz9/Q8Eq/3H1zX5UQOEp0ZiT7ZhBMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dP9t/+Np; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43992e3f9b8so4388149f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772444394; x=1773049194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqpFEgvwHpU2hX5PSjnXyoj4uXycVqlvmrKK7iplIdY=;
        b=dP9t/+NpMxD1Jc1ok3bf00ErFDDV5XZFwqpYzlDIkYtKeZP8Yr9eRYn4zgvzr2WuWV
         sZycEVj8aRZ4KZ3FcLGmb6dJ8XqtmE5o7OF9oROF8sKo6eqz4RrC1HXiEdwjqQF3XUaJ
         PjY4tp2+EyQYtDD+Z3/BMhwIBIFa71S5Z1EM3FKAHYP775sCt6hcscM7WUelIzygwe62
         u2K21CWD0A8NC7kGObA20yJBAF4GtxaHfu03ItdEPK+i+LPgFy10f+zVIcBasz5DWohd
         P6xaIrsk9UxU2ZTVxXdJFLVj5X89aoiV+3FJyT9LN82wMOHahCVGzgsLyPhqBMu5q8ZH
         XSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444394; x=1773049194;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqpFEgvwHpU2hX5PSjnXyoj4uXycVqlvmrKK7iplIdY=;
        b=jHw7SHfsvdNL7vf4rynjAsgCRtAHP6uVypqHimgMgCCJpFm9t03qjEsx8BaBMej/Rg
         +E8nnzWUjgFvOFcJSR+uNggeFhgGfQral07HVg27Il2aWLIvbvhslnZcqcPDrMULeZTA
         s3FrtL3sIB5fjZKfmuVD8zWGkFMLW8XdmOVhWKf00qZMUpZxlJddX+/uIwHhcH/obluA
         bPuj4qtXEryCUehHZ0OjQRTOB2XRY8tJCM7Bcc3a5HT0GEisftoa8XYRiqPT0q8Gq0U+
         Ni/fm5+s0GDj3F3U9zIbUxLh5dFTiR1rdL8NUSwIVmEBfC0LLDAmsEEd8CRnEkBoapRn
         bFNw==
X-Gm-Message-State: AOJu0YzDh267MKNBg4nka1uB/tA0EwW6+4oTKSnLGw7q+On+riYIuYmk
	lrGOr+Rhk4jNBcS/ZW94DiyEOm4D+jAXRoPuSRLfI4Zrp3YAzXvdcX8E9kbF3cKhoLE=
X-Gm-Gg: ATEYQzzyFf7XGl4EAuHVLnuGwv9MfXT7FhviJOtXElQwRhtuyRHk+tSS6NozKYkXMmI
	8EVOs3PITBdygmaujHx7wTTDcfkK+VflTmJ8PtLDhOyXWOY3wyo9GpQ9n7uyBQu/pihJsozSM0q
	obDRHqwqNLX3xpbi6GTTY6W8B4YJv3HE6RmQtfhILwNM8OevngvDcjV1RJ8hJZ/fPAEdHY/0vIN
	Jcv0nQjJhpuZAndOYuGQOXGFY/vX+1utgi3T9RYnKyWd49xPES4Jfe8ffG3oLGeWsM6CO4BTpsU
	yP28yIoYYm/5pW0eSfHsl6e9yIroDuR4C1IThH76NJ4faQIR/EpDdz2+5yg0Bhb+06w5foV7q6U
	xCCRAcGu6elFNB+RWiVeysE9aqwBrLNS/5SnczOW0wHBVAZzbrdmQAhL1Z864qxDDgnQLeAI5Vi
	ChefnvRIp3GIxSyi5822OCK3U+jpex+yv2fB5mYBTzSfMV9aSa7tzmBPgPZ1E6/P3J7hszNpTna
	3mE
X-Received: by 2002:a05:600c:8711:b0:47e:e20e:bbb2 with SMTP id 5b1f17b1804b1-483c9b970a5mr186563345e9.7.1772444394296;
        Mon, 02 Mar 2026 01:39:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:c342:61e:309c:3478? ([2a01:e0a:106d:1080:c342:61e:309c:3478])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm272442605e9.4.2026.03.02.01.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:39:53 -0800 (PST)
Message-ID: <4d39b428-75ae-43a7-b423-d93d8396004c@linaro.org>
Date: Mon, 2 Mar 2026 10:39:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFT v2] drm/msm/dpu: enable virtual planes by default
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260226-dpu-enable-virt-planes-v2-1-87971236fe86@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94821-lists,linux-arm-msm=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,quicinc.com,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 72C691D5AB4
X-Rspamd-Action: no action

On 2/26/26 14:49, Dmitry Baryshkov wrote:
> Turn on the switch and use virtual planes by default, enhancing
> utilisation of the display pipelines. It is still possible to use legacy
> implementation by using `msm.dpu_use_virtual_planes=false` kernel boot
> parameter.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> This is being sent as an RFT for now. Please give it a test with your
> compositor of choice. X11. Weston. Sway. Wlroot. CrOS. I plan to turn
> the switch for 7.1
> ---
> Changes in v2:
> - Rebased on msm-next
> - Updated the cover letter, targeting the switch to 7.1
> - Link to v1: https://lore.kernel.org/r/20250514-dpu-enable-virt-planes-v1-1-bf5ba0088007@oss.qualcomm.com
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0623f1dbed97..7c5b3495bddf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -52,7 +52,7 @@
>   #define DPU_DEBUGFS_DIR "msm_dpu"
>   #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>   
> -bool dpu_use_virtual_planes;
> +bool dpu_use_virtual_planes = true;
>   module_param(dpu_use_virtual_planes, bool, 0);
>   
>   static int dpu_kms_hw_init(struct msm_kms *kms);
> 
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20250514-dpu-enable-virt-planes-7b7ce0a6ce2a
> 
> Best regards,

LGTM

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

