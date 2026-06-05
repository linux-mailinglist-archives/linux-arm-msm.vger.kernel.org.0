Return-Path: <linux-arm-msm+bounces-111421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zHmdOZPKImr3dgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:09:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A96486A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:09:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=gxFsZSWD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111421-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111421-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D53593000585
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 13:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BAE3B14D5;
	Fri,  5 Jun 2026 13:09:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F4F30D403
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 13:09:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664966; cv=none; b=eco+VH7oNXXlN6Cy056W6PW3yx3aTANUs1lqwLOEwUCsiQbTFflmeoxAXMXIsfwzoT3JJaTlUuxAJUewWc2ksLLHGngHMekIPHD3Mcja+vO4fN1xL2jyBVCLnD+pkpbFkAkF9HblBG0vOMq/kwIdhVD1R0QVqy3W+5Uv7Y67rBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664966; c=relaxed/simple;
	bh=g+lhHV8N+B4fb9WldoM+q7EXyp846pVUNO0FPx79itw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wcb6yIxLQzLGeENa/sWFjDX7VR4oLVdGF0QCrpvOeARlMwa2OWJIqJ5/YMf2a3s3HLf9mmBkkOYEDzLCyXPS2Hh8HWIJLzZKIEjsd1/cWk4C2dfCPEhHxgDzmiZIVkRGu/MQd5G10ZL6JqnS+V3yHTp/3uM/c7YfYifwPEEAYGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gxFsZSWD; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso15868925e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 06:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780664959; x=1781269759; darn=vger.kernel.org;
        h=content-transfer-encoding:organization:autocrypt:in-reply-to
         :content-language:references:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RWwic0XMe+s8tgCpCjfW/lHyoR3ERWBmi/iK7F/Oi/w=;
        b=gxFsZSWDTHkV8+n82gJjEFSvLeI7sS/2a6WGHh6kr/z0y+7akpxJjYr5jRZ9JiUe5c
         IERmkCxhop/emogyk/nI+YNs82LIUAT1rsLbc7t2BH3qoQZ07mKZJ1irfSJNed74+lRD
         5qDvsmAYOFmYIhlde3zGfaOrJyG0BdG/ZwS+5KDlnwGvKZzoPYo/v64ywqaWwtAB3kxW
         y4L48Rm5Z6yAdyxTFlF4R5DXHajNdQdQkfeQLmPNJnExzGjPfRadofx05e1tZxa+UPho
         5CkNku9fqDilXsvCm3CCKR6Z8NYNdmB2yafJ9uVAM2kSsDIY11I0V4vLI+ATmXr0vZrg
         L1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664959; x=1781269759;
        h=content-transfer-encoding:organization:autocrypt:in-reply-to
         :content-language:references:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWwic0XMe+s8tgCpCjfW/lHyoR3ERWBmi/iK7F/Oi/w=;
        b=OnfbFwReVkZ7K5Wmc16LDywdfg2b2q/gZfxsKC8dTXqHzLWdy2VHNG4xyJkltUv1p0
         9d0rElSF3wG2Itp69h73W/1Rgs7ZgvjsAfjuIzEXI8ej9asbrRJNcoACzVXTmdO8D4+e
         jiAX0t+5liUMdBLt4QLctebVhvZ8mFpARfj6Xl0VzONzSjV7wlE/utDrs0kbIyuahV6h
         02PtWhDqxWXl5Qr2GyvpToeSxUkVRT0VjfSEQRol8ySGOMKk1qb4EPeBC7rtyCvVtj56
         CVSXMl8tt3N7tPJB9DeMF5B6ZLFmLTCNln7fU1sG7aRrhzRCYFx5fK9FLVt7GqP+KHBg
         Cxuw==
X-Gm-Message-State: AOJu0YzFfg6vAp+WfFQfLRTdnQq8o0AArM29VM+4w4TsSkucFeEMlamo
	nR6O9SeukBvcjNVRcVC0Io/ULkOYppIZxWXdx22jH1NOkvzO60DAkgbrExXG+Bvmt7s=
X-Gm-Gg: Acq92OEabhi0m/GtU5uU8GVOFkJkAnc/tAdW6wD9pimuijeG8R3KX4A+5g8EQRePxE2
	jkhZjMDhcT+SWpz113N1XyytlUobR7CjfmCxanBVNh86USblWpGfZ2ORpRGOwME9g4uUg+7kCOG
	yC4T98nLlhDflmTEg4hwnppV7NxNbV07TeRQAsHZfpFTj7Ki59ca/cEovL8bpx8q7zbyNtkXBdZ
	k5LC6MwHFbdrLvbafOqv/z2TD20jDhT8pWkQCaOmnRSNlm6qeUSJKVQwwcBmEpEAAduF3pgPtWw
	VR0rONQ0s2c0vxl0x9gbzy/NKZ2YCCnCQgnUNVLq6s0VJmE3PZosHgOzcvk0hO9oAUJBLcKq0GZ
	7lMFnfTMNRAeH8x4bi3vlllyL7FLLhHw5vc2KfY91ZazKKGFZi+eD8RRBcZ8hhKECKyaRRtuSYA
	bn+MHySgVQn9bhe8Ybv9X34wRngvWdB4iSSlTsErVTYHroh/2M/ZOgIqpLVxAaAfXIQyJyvgMWi
	aslnF0nSrdRqckQhw==
X-Received: by 2002:a05:600c:190b:b0:490:be9e:fd03 with SMTP id 5b1f17b1804b1-490c2589a02mr53379745e9.7.1780664959143;
        Fri, 05 Jun 2026 06:09:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:b06c:5480:fdc5:c668? ([2a01:e0a:106d:1080:b06c:5480:fdc5:c668])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f67c6sm25764494f8f.16.2026.06.05.06.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:09:18 -0700 (PDT)
Message-ID: <06489359-1b96-43ad-a065-bfb9bee51a10@linaro.org>
Date: Fri, 5 Jun 2026 15:09:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] drm/msm/a6xx: Fix stale rpmh votes after suspend
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
 Jie Zhang <quic_jiezh@quicinc.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
Content-Language: en-US, fr
In-Reply-To: <20260605-assorted-fixes-june-v1-1-2caa04f7287c@oss.qualcomm.com>
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:shivrawa@qti.qualcomm.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111421-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA3A96486A0

On 6/4/26 22:08, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> There are stale RPMH votes (BCM votes) observed after GMU suspend. This
> is because the rpmh stop sequences are skipped during gmu suspend. Fix
> this and also move GMU to reset state to avoid any further activity.
> 
> Fixes: f248d5d5159a ("drm/msm/a6xx: Fix PDC sleep sequence")
> Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2e5d7b53a0c3..a2f6918c4f7f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -642,7 +642,7 @@ static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
>   	int ret;
>   	u32 val;
>   
> -	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
> +	if (!test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
>   		return;
>   
>   	if (adreno_is_a840(adreno_gpu))
> @@ -1465,6 +1465,9 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
>   	/* Stop the interrupts and mask the hardware */
>   	a6xx_gmu_irq_disable(gmu);
>   
> +	/* Halt the gmu cm3 core */
> +	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
> +
>   	/* Tell RPMh to power off the GPU */
>   	a6xx_rpmh_stop(gmu);
>   
> 

Thanks !

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK


