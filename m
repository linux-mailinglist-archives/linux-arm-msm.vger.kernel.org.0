Return-Path: <linux-arm-msm+bounces-33849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0423399854B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96B1A282BFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5311A704B;
	Thu, 10 Oct 2024 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+BlO3/K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4201BFDEE
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 11:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728560813; cv=none; b=ArdpPmfmxnEGgdcDbqSSCfxA/RO5f5NtEPuC6UY+Asy4GmNk7We8rMxx0w9TJLAPoorABiIa3PRaDUzJgSbzyj4Oo9aRKbM2ryTZ0HZ0yGn7tHJ1J3r1lkO5GofBcpOg2MrzBxliwWBTgFMUbotiSrg8UbgkliVwt5qcn3ta2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728560813; c=relaxed/simple;
	bh=8RulCbDWGVtRgGZnMLOgBnNo1CGaUuL572tGJIdYd6Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ek5mr43dqZ0xuZ6JbUw3VlzMR5/kYS0U70vmHLz4Gi2O2BQPIydGY0AA/4rA/+MitsyzfzbxR9zeAoPH52crYmnWKk54buqGey7qUx+JdsQlVUuneMfalpizQ4zMr2H9Up1I4ePaR6GBcx7L0g8LJNpWuFTpA7FkXyyekb4ojo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+BlO3/K; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-430576ff251so7162255e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728560810; x=1729165610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51heMfImEr3nRBBulIoSOl7yW3U4cglSvjX85ti6WiA=;
        b=e+BlO3/KoakbpuWO/lDuKBLZSycig3H7p42KS2L0sLTHABSjx/XxcydAcIlPPLGdNF
         Qz7qc6MszUGqC/NzulADTtYNwwPOtRhfy5h1FnSMDpf2wbMzo6mWnJP7JalxQgOOrDz+
         g5o1EW7mNZkgtAryNaDyIeUwcVKrX1ZbdKktL0XLpQPI5ciquqo6XLyqfRuUwyueMgXe
         L6dIB2V3xaFOXicMuRvqJH/+vMq241fUcWYlq7g63M4gucHF9gTt4bU0+/QNWPRr+9ND
         cA8n5wcgQheKuHt2+LpQK51ogtO8qaKb5qxbFq9r0DiRhx3Qdam4xhH45bgLTbfhqfwq
         pSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728560810; x=1729165610;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=51heMfImEr3nRBBulIoSOl7yW3U4cglSvjX85ti6WiA=;
        b=sRItkK3OAf8Y/+K0SvuOWljnEBrTt9s147lwtlfoOHMcK+09p9fuKl99oEw7JWy8oF
         Ym4zoQf3iNAxHW2xzADGbGPK5r+P2+vrrw8JktWnTiwhQBpsORYSDlxhVMRqEnL5rImd
         lB7PZur40JmPv8v5oyhJuH9cOS9OXQaIn02sAYjreOTMqZLVsREOCUBlkyAilSHJ6g4d
         f06OSesISjqPVbQg6vGltHqMTOkukM4J67br4oYTaRKgl3rcet3RrSKn4tHfQCQolo+W
         ybio727kodlUYGKQwEXSdqCGw5D4YY7iDsRUCk4iazZ8uM7XmIzc/5THLwXq3GKXf5Z5
         jHvg==
X-Forwarded-Encrypted: i=1; AJvYcCW0Hccpwb25aFQk3yuxNSnD01JbFg0cfQ5qfohqQ0tM/JVWes6EaVgzkZ4LVxpKKUj79DZR2kVYT3qEfkfe@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/p4tH9EYfbX0VvSx2M/DMOQ9yOHKmkOh7qzxAmq3/W6+DZgE
	Qt2HsqxW/k2jmeLYCr/x3M64GMlpX/KuKNT4E0ub2Oxy/fzsxPvv3jCBeftBrqg=
X-Google-Smtp-Source: AGHT+IFa75cF+jj4ZG6STuUH/lBb3jUgnt96M7yzoYZ5b+EpsWNGz0c2CtxoTU0fMOvpLbUv8bZc3A==
X-Received: by 2002:a05:600c:474d:b0:42c:cd7c:a196 with SMTP id 5b1f17b1804b1-431157b4638mr34318945e9.17.1728560810088;
        Thu, 10 Oct 2024 04:46:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:64e2:34a0:1d01:60a2? ([2a01:e0a:982:cbb0:64e2:34a0:1d01:60a2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b79f9a9sm1340063f8f.74.2024.10.10.04.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 04:46:49 -0700 (PDT)
Message-ID: <c84dd670-d417-4df7-b95f-c0fbc1703c2d@linaro.org>
Date: Thu, 10 Oct 2024 13:46:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] soc: qcom: mark pd-mapper as broken
To: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
References: <20241010074246.15725-1-johan+linaro@kernel.org>
 <CAA8EJpoiu2hwKWGMTeA=Kr+ZaPL=JJFq1qQOJhUnYz6-uTmHWw@mail.gmail.com>
 <ZweoZwz73GaVlnLB@hovoldconsulting.com>
 <CAA8EJprg0ip=ejFOzBe3iisKHX14w0BnAQUDPqzuPRX6d8fvRA@mail.gmail.com>
 <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
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
In-Reply-To: <Zwe-DYZKQpLJgUtp@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2024 13:44, Johan Hovold wrote:
> On Thu, Oct 10, 2024 at 01:55:11PM +0300, Dmitry Baryshkov wrote:
>> On Thu, 10 Oct 2024 at 13:11, Johan Hovold <johan@kernel.org> wrote:
>>> On Thu, Oct 10, 2024 at 12:55:48PM +0300, Dmitry Baryshkov wrote:
> 
>>>> Please don't break what is working. pd_mapper is working on all
>>>> previous platforms. I suggest reverting commit bd6db1f1486e ("soc:
>>>> qcom: pd_mapper: Add X1E80100") instead.
>>>
>>> As I tried to explain in the commit message, there is currently nothing
>>> indicating that these issues are specific to x1e80100 (even if you may
>>> not hit them in your setup depending on things like probe order).
>>
>> I have the understanding that the issues are related to the ADSP
>> switching the firmware on the fly, which is only used on X1E8.
> 
> Is this speculation on your part or something that has recently been
> confirmed to be the case? AFAIK, there is nothing SoC specific about the
> ECANCELED issue, and we also still do not know what is causing the audio
> regression.
> 
> The thing is, we have a working and well-tested solution in the
> user-space service so there is no rush to switch to the in-kernel one
> (and risk distros removing the user-space service) before this has been
> fixed.

The in-kernel pd-mapper works fine on SM8550 and SM8650, please just revert
the X1E8 patch as suggested by Dmitry.

Neil

> 
> Johan
> 


