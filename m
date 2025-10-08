Return-Path: <linux-arm-msm+bounces-76505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1DBC6F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 01:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8B3E634C9D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 23:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34422BDC27;
	Wed,  8 Oct 2025 23:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dH3ze0ad"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A3204F8B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 23:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967509; cv=none; b=YNZ9Co583rbrjGAKO3kzJFbhfiNBK3kRXbi56cinpr5cv77XZBYeqSxU0heiAQH3FhlDlUMAvFzAt56dOvtQgYleZWrl/4Hf8JYfV3y6p6fkPhyuXEeWHgQzJVEz8/afiXBh/OZe7BzqRi2O3mtC7StYgEJD/JAbz0CLBHGQ3E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967509; c=relaxed/simple;
	bh=eyjN7PiUVQUVZHNcoHK6b0+s0guSoDJB+6zY1UADKOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gv8SChHrJbbtGAIHhZhINepy+TDUHNjl1DSv5etc0vljmM/tySj4vNR41j33ZQyHjfVeW3wc0pQ5bhlpH/hHb/Rj6hMgvxBukI5xfQ6YZ0pMbtflaJoHnK46AIXXSWQ7zzB9CQ0IwxRu2KoYpndocbvOKkTOW+lTvGsZM9+p7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dH3ze0ad; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so404722f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 16:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759967505; x=1760572305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pKSwPjmNvk+y67g/q6SFVO3OhPPMiHpVY0phs0CEZOs=;
        b=dH3ze0adArlrTR6w9PUwDuCPZyXwY5zcM6wPySGKKyg4YFZqc2JR79ARW7tv6FD1jK
         6SbuecQRd3hZ2cgrfi+/U9TLZILljC/1eKNTr0O0nC/dcPABnjQ+lVv6cuJbzkyuWfCy
         2ss9/FQxqliooA9EIslac5xwf4HeEkkH6ctWouezXyPbhNP3rrty3Z389+MqLeCMhPkO
         9SRLox9YNZN2RfJrVc4bEDVh9Dn4d2JB3bF9fXLALf2meczzMGTf920AB8mlBSxzZjBY
         qxu7dFoAPflv/1+9kWJ2qwY/ULgMqUM/YQWtS1o9alnynPlYotX+dMWdg96p2DlEpTgu
         4aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967505; x=1760572305;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKSwPjmNvk+y67g/q6SFVO3OhPPMiHpVY0phs0CEZOs=;
        b=aFNpELLHScJdXzAV7YmZOemHqYPWHe88sJSP4CP+PgONo70qWymun6dOeEhIaN1E9y
         ozOy8HXeETYyGQeyAsZNKhXYjHcytrqj8azm1x9p+LZBABOZt+bvtnWqQMQ6pGJa0tuw
         wEUZqD/dmyQSpodrdgNx5Rje9F24PQYhNnKT7ZKknj6RtYSVk21da0UKH75AGfyBuSff
         yEPNpJb0Cl/ZDaIKf1DBULxXfQtkDhfvJ/ndX0wFIani0KECQfa2/l8gcyO47XIeHfY9
         AoWfXIwZGqPEOssIrmM8SgKk9fl/TgoWcWrs9uauye0wVktQ5R5+8MMTppvxInCssDfk
         fQUA==
X-Forwarded-Encrypted: i=1; AJvYcCWLlzj6yhWCX2wI7M2XBRhiZSKHdm/jh8i3iuWBpfCXxFn27WbZFN2SRGTXcMoApJ6CjWipJMG/NIWNXpA9@vger.kernel.org
X-Gm-Message-State: AOJu0YzhFNfzxCOVZoaM7Tz5+tqCS68PxE6VTkTFcBUZHLc4Jf1AuqBe
	3jlAvFl3TUSJRLNZJi6F1MlYOPyKwiSeA6+UOnVrPBUjO4BN/aTg3xz+wNEfJfxfkZOlWvG0KgI
	0E0CCkSs=
X-Gm-Gg: ASbGncudYVN2QaFd3DMUR+rTNQJyiVHDhrEVLbVePYGwVA9sYFhbR+ivAFjsEuI0oLw
	VycXFh+o0/tyvzc0uWcccZNyM/okPf8fa5FeXnB+EtrUb9dTFkjpbTIyc0sq0JoXIPPRZT9jsNp
	mvH8cGnlGNBTO2XqApYB2ezwvxs0MN44ULWcPRzRnM7YQF9/cqiQ3Os4zu5izO7XJMWEipTZswj
	zURlLiJbfh1hoTnsvFUUiZZm8fRcZAm1BSwV6lrGjAhE4WiRDjFbWWR7ewLDHund+iXEI0mbSFO
	2tsXvBjBC4V0Op7lEhO6upH0NvSReVp+7liyTLRHQdaOtyPKJHsQTruaevC6wdThoR3fmAzVcUi
	qG1fwGQ0PU91ngH5AO49BZRnuUXG3d7PBFH+Sj7z6QdytEQEecVzKP4GhTQ8GtygoE8eO+5ca4D
	8Lu4smGl3cXVjzPp8zJLu5fn/A3Ik=
X-Google-Smtp-Source: AGHT+IHyu5YiS0JlSCHTn7WKDrBIAa0OAoCOsSDI+Md+k8BW0hRPcZN7G0WCMGa148Ed0TDIOeopFQ==
X-Received: by 2002:a5d:5d13:0:b0:425:7313:b561 with SMTP id ffacd0b85a97d-4266e8e5115mr3246547f8f.63.1759967505501;
        Wed, 08 Oct 2025 16:51:45 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f4ab0sm32096453f8f.52.2025.10.08.16.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:51:44 -0700 (PDT)
Message-ID: <8612f9af-1f3b-4ad8-9f83-7fe453cffc1b@linaro.org>
Date: Thu, 9 Oct 2025 00:51:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/25] media: qcom: iris: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-16-laurent.pinchart@ideasonboard.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008175052.19925-16-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 18:50, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL. The check may have
> been intended to catch invalid format types, but that's not needed as
> the V4L2 core picks the appropriate VIDIOC_S_FMT ioctl handler based on
> the format type, so the type can't be incorrect. Drop the unneeded
> return value check.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vdec.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index d670b51c5839..1e9ffdbb6e18 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -191,8 +191,6 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   	u32 codec_align;
>   
>   	q = v4l2_m2m_get_vq(inst->m2m_ctx, f->type);
> -	if (!q)
> -		return -EINVAL;
>   
>   	if (vb2_is_busy(q))
>   		return -EBUSY;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

