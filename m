Return-Path: <linux-arm-msm+bounces-75869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 02936BB648D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 11:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CAFFD344ADE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 09:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2A1274B55;
	Fri,  3 Oct 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPajp2fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E0727B33E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759482121; cv=none; b=hVZfjUeN1DKqj3YFT2KniSDLYdzLPtomi4o5jPmUiqYvQfYfa11LA4cc3QjNM9Gs+A65eNMCLxVTQNzlIgCfKdMil24ssxbTGYDcGeB3kdjw1lPEx73zTt59iTrZ8VgjuZ9pkEsmcaTbA9RSIDCHuD0OEtfsm/E3eFKkCWqE/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759482121; c=relaxed/simple;
	bh=2ld2W7PXE3Fjnk8Fmg4gzRneXSYKkf8M/z6fC8H7ieM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZnMjQAYX+Ho+mhUQBfFmf0WJiqaNt2pxW+HP2R0DImW8N2cMnHjHad2CbDYyJCGWVvpL72rPCdNIoSQ70A8PaEUfJgsknrOiOA8Y8vhtvYXsBcmE45VQdUQSaeR5G6uEASxC1EQLoeAYncHbB9OGOjmeAV568Z+3VBnpS3y1D+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPajp2fj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e29d65728so11693205e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759482118; x=1760086918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8htaH5UmD3BZCsFSEXxOl4TBkWtC5hWepzt68CD6TCQ=;
        b=oPajp2fj4+QyliATVaBcLOcSavorcZVkucJQh1SVNoyPXBdDQTBBg0ozJUtPhGWGrY
         ZgB1CC2i/7OqHK/8EdfggGHuLOdRl4K9iFLmZu/wG3j/TcGwTT237TYZXfEv74eb35Q7
         59xoMxkCEHemEkyBdsRjEnkajrH1Te3vV5DjEJdNB0AMWnTdjs3b9tQYgxc+Jl5MnoWR
         gmxoNTApOCtEOBtS+2hMjBZK+ezxwZ5LnVwMbNMBf5Gw7BEZ9Hut2lSFWql2Y0ttk8nE
         uaNwCeBwHYwK3zt/myzJxQ9mZHV0zh19Syoc4c+NvufhzuXFXyobW4ECoIqMSlyyqNPs
         Y+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759482118; x=1760086918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8htaH5UmD3BZCsFSEXxOl4TBkWtC5hWepzt68CD6TCQ=;
        b=Xi7nCv3KOtVDll6VaAArhEydGrAWOWZtThaavFgyLEuA/f5MBIIiSTzyFSpvpsPpQ/
         VCqJZQ2ANcnSu7Dg8wQOydMFcE7kJAX5RN9bO2QNNUEAiJs3BuRr4vgdH/seyZggkb8J
         q1tgXZkslXLLeluqA9u8PKXiQo9xR53seuj9WD40aVpmsrvXQRBpxJYfYEV8AFiobs98
         gIbn87MzZFOzHh7FExscYwxlmIR6wcWg3zNt7ns07IOfE884E9E9xwwDZf/6mTP9rha6
         FVI9uikEsFxu+wxtWTDO+ZcK4rrI+k0WIufpN7noZ9PaTQn9MullxuigVI5rH2uSZU0i
         oSRA==
X-Forwarded-Encrypted: i=1; AJvYcCU7h3P+lDYojFzdvtI2NTN9NEHeg3d5IdBDyVLEV96SLlzfLQZKy8t+yjA3MXAuKAxtyYhpbnKDzkQaFHQi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3yf2Uje1YiU1LHi6LIPQ7BkUxVO1KGGVqOYgtpyMgJ4JKQaKl
	9i+o++qvE1S9wA0UmxW2S3KCSOoN9+inJ8gIDrMOa9PJ4ux7dOJEeRRGwBaUrMXzWhk=
X-Gm-Gg: ASbGncu5E9hPAUDRbsqDmUL+R0glBGR/wH9WGJ4FTu30SFIKMo/HsMA4udyhrJEstEq
	cjeiRSSGvJ4WZswwYpwS2JqsLLXnEd3jH7WRfsdtjOMjHCI9+SHAkMi30nmhjelH+cAhsGPpZ78
	F0/sbkDWz7T6wXX5uTINhZSJ4hZTXLm9qbx1yVuaQvPR0AZt17jlW8s2gCg1J1C8ME2rVOss/lW
	J/ALYmk4Hr+rTQlibwVvMKgptGy1bswUJAdUMu+mU06UCzUsA/I+Yb3hiXBvzN1/sKPHGyroqJL
	EkSPAmTvKcoVuCGh0esaBCL1NN5QNb0VuIRa/UWWBrRidRXK98gWZc78d+bIOC7tVqPifSW/g9G
	cwyzLpEH0vKP1lVhdkcba6B1Sfu4bFwGLgQSq8pcWdJ0aZ+tpuxct4i6Tefw2n8Oa45zbYzcxd9
	cCtCNnfrYvAspETjsyYnkUEfHL6UM=
X-Google-Smtp-Source: AGHT+IFXXFYBejNEk62TTVbsZCkjTfoWLoHDUC8jbliGeXsvvT//1ANw01aVm2hkqA2pgnjHgXrrcw==
X-Received: by 2002:a05:600c:1f8f:b0:46e:4922:6855 with SMTP id 5b1f17b1804b1-46e71111c0cmr13814655e9.3.1759482117724;
        Fri, 03 Oct 2025 02:01:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1516:b5be:def8:9a0b? ([2a01:e0a:3d9:2080:1516:b5be:def8:9a0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e72362344sm21796015e9.15.2025.10.03.02.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 02:01:57 -0700 (PDT)
Message-ID: <e42176e9-cac0-4142-b463-9eaf86906c46@linaro.org>
Date: Fri, 3 Oct 2025 11:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
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
In-Reply-To: <35jqgias5o4ruhkc72oacepcq4skfzpe4gyivg2pz7bnpy5luj@d5saa7y7rcus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/25 03:17, Dmitry Baryshkov wrote:
> On Thu, Oct 02, 2025 at 04:57:35PM -0700, Jessica Zhang wrote:
>> My current email will stop working soon. Update my email address to
>> jesszhan0024@gmail.com
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 

So dim complains you didn't review with the right address...

dim: ERROR: 261785a47e0b ("MAINTAINERS: Update Jessica Zhang's email address"): Mandatory Maintainer Acked-by missing., aborting

I guess it expects Dmitry Baryshkov <lumag@kernel.org>

Neil

