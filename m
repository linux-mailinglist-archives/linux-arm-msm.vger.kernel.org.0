Return-Path: <linux-arm-msm+bounces-35190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCED9A60B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA032283C5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42AC1E32C6;
	Mon, 21 Oct 2024 09:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRwhky6M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE1194AD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504449; cv=none; b=SnYf0/cbfEQdiLHYO1xXAKXy4jeWq0RPoQ6iZQLixyW0IeWsVXUTUCNbJLfmroRCTLdbfKEFBUfdfEyA53Fl4ahbfAvSW7DR3UEXvRRnYarQiibhf7tSTsrodOeRryla41xxoB2U384LiEiDxEVLa8sO4YiJEIKMZypqQpU4JK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504449; c=relaxed/simple;
	bh=cOPTgYLAMJX7AsbC/N+xPYx7hH88PbiGmG66j5FkYfQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=D0OWtDk0F/b3hCUZeaZO9PQWW563SDpTcX3e/c+GDDauIgpsghsynxSk56JBP0DIwqWIz6qaCYp5AEj1Z4GSg9CZzztSYOvPx/9zUG/FrFtyCungYtZdIJSeK1RkRICv+a7XPGlD3IXXSUOOUXvWlSEQq9zLNlFpEzlVCiKToCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRwhky6M; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43169902057so17932775e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729504445; x=1730109245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4qi7OYn87uV2q8GTh+ArF53BAcD9TZF/0fbdqswgZQc=;
        b=oRwhky6M5s5QpFVOWb5MBk82yFhATnkHed6QIraNC7n72tzJrU6ZSIBniOTjak753g
         5Ga+fgF1/b5Gpae3O/EfIQX7iphdI1TP9Zrm8n3/F0Czw63GfKzOs/Qn1nTdjbg6WVMr
         Gl4wYL3IIsN9SrVXyg+5e4f81cgFdnlStCDQaf3PKd6fMYy72L3Sh8gSUa3kp2nV8s/v
         2vaZ17Sr7dx4buIhPJd61aUa/aTXvl1oiTUwW4RblUyq4x6k9FEcXXm9mn80ivfs+17T
         jMMaxSYRyFiCBvp0wWORfmg9J5/CqGOHGgQHCj2bPG02GNAzxdW/gkhlD6yGqXRg+Ife
         VH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504445; x=1730109245;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4qi7OYn87uV2q8GTh+ArF53BAcD9TZF/0fbdqswgZQc=;
        b=iSio6snYtr2AImrlsttjnFJ/D2kRblidptWQXy4lR8To6uRNcntx7aUKhjorMZzZov
         2chI07KXZZaOOtZHksRLO3ECt0RXXV31jSEYEqZtpeUrxHVkpEoWGPLU9wR/CCMlOtgC
         9NYd8SzxwZTUWhn5Th0hmzJvPHnY8u6C3TRR8GD5Z9iVaPgQ/LN8NYKMzUS8S/OcW+KO
         Y9srJGfIK547a3vlWYaJVIPlMJe/d5kNWY5UhoA3n2Qd/0Bvx0NexxcW2JfSTbYTtXcO
         e+vdSv7netHS/exRsQfdoRznvyslUmMVFA8R5fZlk5zM4SyHrvsWRBFKfv80eu1JQcpx
         GF6w==
X-Forwarded-Encrypted: i=1; AJvYcCVKhTLBxIDVOTAFSydh+ra7PdbW2fGO9G4UnncQ3XngQHo7VMgxqk3UGeWlzq1MP8LZpfznzGUaW0ZMu1Cb@vger.kernel.org
X-Gm-Message-State: AOJu0YwWCpG2WplUZe0t7l/WrWalmI8Cc1++kVZkKzts4YZlVKrDWqh5
	HZ9pMxTGe7CZEfRhj8EvIR0SOr9h6KnBwXSL/j+qm4Wm4LpO9iKhf0yA6WYcD8k=
X-Google-Smtp-Source: AGHT+IE9JUG+K0WiGUxbiRQjV6Ys6ZBgKlpyp4KdsaqN6dI9kfVnMsINzdIld9EWOaNctSRAQ0i66A==
X-Received: by 2002:a05:600c:c8a:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-4316169737dmr79858395e9.31.1729504445445;
        Mon, 21 Oct 2024 02:54:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f570da9sm52614305e9.5.2024.10.21.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:54:04 -0700 (PDT)
Message-ID: <88d16fd7-eac5-447b-8926-00eb8bafe3ff@linaro.org>
Date: Mon, 21 Oct 2024 11:54:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
 <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
 <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
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
In-Reply-To: <CAA8EJprfpKqJBvrS_dLKy40LHOaL4XVSpmXMGP__z1jsOjZ7Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2024 11:06, Dmitry Baryshkov wrote:
> On Mon, 21 Oct 2024 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 18/10/2024 23:49, Dmitry Baryshkov wrote:
>>> Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
>>> bridges in the chain still might limit YCbCr 420 support on the
>>> corresponding connector.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/bridge/display-connector.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
>>> index ab8e00baf3f1..aab9ce7be94c 100644
>>> --- a/drivers/gpu/drm/bridge/display-connector.c
>>> +++ b/drivers/gpu/drm/bridge/display-connector.c
>>> @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
>>>        /* All the supported connector types support interlaced modes. */
>>>        conn->bridge.interlace_allowed = true;
>>>
>>> +     if (type == DRM_MODE_CONNECTOR_HDMIA ||
>>> +         type == DRM_MODE_CONNECTOR_DisplayPort)
>>> +             conn->bridge.ycbcr_420_allowed = true;
>>> +
>>>        /* Get the optional connector label. */
>>>        of_property_read_string(pdev->dev.of_node, "label", &label);
>>>
>>>
>>
>> I think we should make sure all HDMI bridges can filter out 420 before
>> landing this, no ?
> 
> No, it's the other way around: if one of the bridges in a chain
> doesn't set 420_allowed, then 420_allowed won't be set for the
> connector, disallowing YCbCr 420 modes.
> Before this patchset the bridge / platform drivers had to manually set
> the flag on the created connector (see dw-hdmi + meson-encoder-hdmi or
> msm/dp).
> 

Right, sorry for the noise...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

