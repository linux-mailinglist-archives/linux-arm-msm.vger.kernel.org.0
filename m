Return-Path: <linux-arm-msm+bounces-30053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E338B964A1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 17:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EFCBB20E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 15:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925ED4084E;
	Thu, 29 Aug 2024 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mDz46tf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DD51A0732
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945573; cv=none; b=BFy5hszhobXliZe1QATYvgZD5HjEyNQmhDcBGLZQBX/dul8FqkhevGPb5GCtBk2qd9b41bI9vuSeMYp2KDvszBpGy0eW7STuCfuTXAjHyPHa1kWpFnRoBgPoYESLJB+rvLdY1UMRYYwHOuhbGhhOsT6jg9eY91rD3uZ2SN+E1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945573; c=relaxed/simple;
	bh=0G7mze1wqVFZhZ50FKq6hXqQeQruWH7KyxgzMCGv9Jg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aP5AMpZlv4kttypUXSt3OvM0Tjam0bY/CJ61LFmwtrLzHnTtcxulSgaAOOuOzYHADX7LNcwOWzbm+rllQZwf3/xPAgExLkzpuMfena48wmEME/mJmuAtn/iOqtDMXcB6G4W5Rgg3KWSZxI8dpWOQNF4DSFPRc9HpvKBATime49I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mDz46tf/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280c55e488so5453255e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724945570; x=1725550370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwIrcvcDSEkc0RK+FZLEdtiYNR69eb3bXf7QeoQAwQo=;
        b=mDz46tf/752Nd6C0tos8Nnon14OtQuj7p2yzaiDrbcM5HCBWsiatNOXOjrV6IB4Jqn
         cWMMMlhuDFBYuX9lOfEMfeb1JQ1lUFJ4GPjW7VvLvpTwvnPd6ZTGyUAo7AknsKDF5qVF
         aYQA4br7oFvSIyGIPmqMoF4nk9w7RYiafmL9rlRxLeKzLR/9gRTGXaYy4NIwbP7SO8RD
         bRoZNu3Qfeih5gBdQEkR09XM6woq9BBibL54KB/oPqTKSa7Qtpuaa2nAaPWVKHzldnvj
         kqMdNA6Ss+zMeR2H3jlCKq7h2aqldubl7435qvGj23aM9xeDI6jnYZGpY7A1CLJPHIWa
         Z7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945570; x=1725550370;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uwIrcvcDSEkc0RK+FZLEdtiYNR69eb3bXf7QeoQAwQo=;
        b=RO9efU0i2FtguE2+0q0aOxZuTCtJSO6jzBWGDNHYQvuBAfXw4Z57MYqu8ziDo5ByKi
         qnVCwt0vJwok4TZUHbZ15DawRz7dFflgjjdJvdskXjKkT1AhAnL5QqOB4LOsSUkv6e06
         orT8JZa6glpB6zu/9dmL/Ko07aki6lX7IzSrBVMpHsUE3gHrSb0XKijw7wcDv6DF5LKa
         AlaSu1H4te4VfKQmgKLXH7u/8ydjkmfvblxgDi7HH5J4bnNTgUGgPoXqD7t+NUMphkG1
         fW/IQoJqvSxmXujQZvjp4fRx+NxBdw/A/edpePwWngCh9CZzg/KnjiFm8q1YKu1i2EAi
         lf7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNKH/JW9UhXqZVJ5ykfwdMPpZ2NRylkLiIVyumYucWQUHaSEqvYXNAC3rJoHPkmy6BSwRqyRkSRsF5H9f8@vger.kernel.org
X-Gm-Message-State: AOJu0YwzxkRMWCXA2Fl/bbSYvSg1w1z0bZ/nt/8+6IPdu3utfxMgHQcU
	6yd5slSJshmdY0bIGpCnVO2XsucJ4ppDiJzU+t0LSC9Xjlp0nx/10wTl3eD44tg=
X-Google-Smtp-Source: AGHT+IH9+8PYMVuyhooHnEKm7HBNRG/ZhyKn3bATO2CBKzTwDuYlMBgk64q+sm8/yfyRVK6phMfsFQ==
X-Received: by 2002:a05:600c:2214:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-42bb7396721mr22388775e9.0.1724945569542;
        Thu, 29 Aug 2024 08:32:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915? ([2a01:e0a:982:cbb0:12f5:c9c:a0e1:6915])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee9ba8esm1699175f8f.50.2024.08.29.08.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:32:49 -0700 (PDT)
Message-ID: <c1e35d3d-fa00-4453-aaa3-9f23a07acb4f@linaro.org>
Date: Thu, 29 Aug 2024 17:32:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
To: Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 patches@lists.linux.dev, linux-clk@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>, Taniya Das <quic_tdas@quicinc.com>
References: <20240828171722.1251587-1-swboyd@chromium.org>
 <20240828171722.1251587-2-swboyd@chromium.org>
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
In-Reply-To: <20240828171722.1251587-2-swboyd@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/08/2024 19:17, Stephen Boyd wrote:
> Amit Pundir reports that audio and USB-C host mode stops working on
> sm8550 after commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration"). That's because the gcc_usb30_prim_master_clk_src clk is
> registered and clk_rcg2_shared_init() parks it on XO. Running USB at a
> slower speed than the link supports is effectively under-clocking the
> USB link and probably confusing the downstream USB devices.
> 
> We didn't need to change all the shared RCGs to park on XO at
> registration time in commit commit 01a0a6cc8cfd ("clk: qcom: Park shared
> RCGs upon registration"). Instead, we only needed to park the few
> display related clks on sc7180 to fix the issue.
> 
> Fix sm8550 (and likely other qcom SoCs) by skipping the parking part of
> clk_rcg2_shared_init(). Make that the default init clk_op for shared
> RCGs, but keep the part where we cache the config register as that's
> still necessary to figure out the true parent of the clk is. Introduce
> another set of clk_ops 'clk_rcg2_shared_init_park' that does what
> clk_rcg2_shared_init() was doing and use that for the display clks on
> sc7180. This fixes the sm8550 problem and limits the "park upon
> registration" logic to the display clks that need it.
> 
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/clk/qcom/clk-rcg.h       |  1 +
>   drivers/clk/qcom/clk-rcg2.c      | 36 +++++++++++++++++++++++++++++---
>   drivers/clk/qcom/dispcc-sc7180.c |  8 +++----
>   3 files changed, 38 insertions(+), 7 deletions(-)
> 
<snip>

I've been testing this serie on SM8650, and with 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
it fixes an issue we have that triggers:
[   18.740736] ------------[ cut here ]------------
[   18.745837] ufs_phy_gdsc status stuck at 'off'
[   18.745929] WARNING: CPU: 1 PID: 197 at drivers/clk/qcom/gdsc.c:178 gdsc_toggle_logic+0x15c/0x164
...
after waking up UFS from runtime suspend.

So I suspect we'll need to figure out which SM8650 GCC shared clocks would need
to use clk_rcg2_shared_init_park_ops ?

We also had random boot crash when initializing the display very late on multiple platforms,
and so far "clk: qcom: Park shared RCGs upon registration" fixed that, but I also suppose Ill
need to reflect the changes done to dispcc-sc7180.c to dispcc-sm8650.c and others.

Neil

