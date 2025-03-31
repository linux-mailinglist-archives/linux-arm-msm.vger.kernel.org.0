Return-Path: <linux-arm-msm+bounces-52852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BDA75EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 08:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 709EB3A47A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 06:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21AD14A4CC;
	Mon, 31 Mar 2025 06:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c4njhH0I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0231876
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 06:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743403582; cv=none; b=K9hVszOvFAKcp1T4eQvAWcUSXW7XZdA6Kpfgf7zzLJup1p/o/YH4IsbF7iGeeUhl0iEVxmw6IH0wTl0rnmT9JenkFRq8/rJbFVZpBUPdpQ74clAmI6dgg2Ajjx/Nb07fAJ3kcjQKtNCznYVYXUqbFafN55G0cD+Dg8y0I2scD9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743403582; c=relaxed/simple;
	bh=jlSvjAFn3alQ4Yt+kDwAuBIfr3O8/1uPwl29MTTzlVA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=Dbs/NSjsib0g3LYZhm1xCWyvXUCjIJypxPUAjFmZIh/HeXgaKmctRI1ToDIjPP29EXBdpIRfLfgwLy6IZ2edHT8GvSs2QQdqdBln4BQIzcNJv4V+Z7+gHjn3MvxQOOczMYpQdNwhoQM+wwFWq0u2s8VwHyWCgcnhaa4i9qBRgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c4njhH0I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso42600815e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 23:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743403579; x=1744008379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AA4sDqP4J8juhu+e1eHgJ4HsEPfRns6pCAnRWR1sqHg=;
        b=c4njhH0IefARTcXjurUd2qOH2+9usm5m+9t4MJq7+BnHv0326GpENb0jN7/BvKmmOh
         sFrp7slesm5vPOdsjxnfDzykXTom1jPET4hSpr8MVAdjROWwEN29FMkxByEWbWoNa9MX
         wtHkGXBDP80sJqmwvJiEeiiqzcrl7DUCSd3FR7RJ+bJZJcyp1wudHulxpQr12xpgKuHN
         D5borkN+abmfMm+rxC9s4Rl2Jft9YCrwHBGYWp869MgEnsA9wf2kosHcBOX2iXYmqwaz
         c5Kv9N3ZA58MiWrwF1oLtHwI/BZi0r5UADwQyJkMnxWO5JNHsoKjAi9r1yJzGLdBlGau
         nLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743403579; x=1744008379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AA4sDqP4J8juhu+e1eHgJ4HsEPfRns6pCAnRWR1sqHg=;
        b=uO/IQPKv2uoXl9c3J2DLT5PkB1PWkUKP7thffkDxoT76BGdyDpzv7QxlC80YsXxwS9
         MteY37LYMYtCsE3QWqirjP+TnsE7jbnGZzqA/Cmo8KP7V0Nip06eWhD97EX9GK4CRFKD
         j6rHhzQMpMCPmr9cnYcJjPR3GnBg+8SXCSoJ1amK5m7bfLf7JairlxYdR9WzEdBr5mLp
         d8moLT9RKFhuD+GRBKtXGeAOKr53EE21tJQimdsX6W2dGvZ/V8D1PeG5R2cmRocLkRAr
         CrLeb0FCW+UAFwaCKpIKYSKXa+6uOP/OkwC2pRvrZ6nhOMRoBnLtAtPviX3mNaGvTbOH
         CktA==
X-Forwarded-Encrypted: i=1; AJvYcCXmOkBC7OvgczKqt61kZwis0+OSVvOViIQ9B0s19mhvJ2qUYX2pMoFBgQ6BQRIiLh8FQhXVqGn3QK/i33r3@vger.kernel.org
X-Gm-Message-State: AOJu0YzGyJON5C5ouCtZTfabL2rOrcBgZCZJymu0tz5S68Dn6K86FmXc
	MVvr+RcvJZFWj2ubAZfVA4Wdmj0J2NvB1flbZkc8EYLWfIo5dTPbFZNVx4CaV2U=
X-Gm-Gg: ASbGncuaYcCtrtqS99sXI27TGUscqHmBJ9LAC8lgcOc8dR/AtF/dFVfS3OOiQH99la/
	7UqPpjo8lB/Y7Ko2Idl6DBnWtXAchyiFydq8cT33OzbKX2AQ5LQxdpyHDx/O5BK6inpUBd2vc4r
	sasmagF67KPiXTf509MsYsD6pn2leXXwzJBASNgOe6zw5/VHOt7J3eygtm5uWl3OCJ/l8UsxdH8
	NVE3sUENcLXnkrw63kVuE4x63u7Gp++2H6yRAOQ/+rHAQnB7C/pTetKQsDfFSxwUuyfpte0BPsW
	DJJIUFbIefY1W7B9dzuyG0EFG2bm+Q/jIIRRcWTVErHUGIxRQO5lVzRpIvXOPkowD3430dSIa6h
	/VmeNzEl5rwoJg4l/
X-Google-Smtp-Source: AGHT+IGx1f4vC8GTeK58NiotvPS6asWIcIisQro1qkimwNxZktvh2jq9DwcElB67LzcJE4nqjvtuyg==
X-Received: by 2002:a05:600c:5108:b0:43c:f629:66f3 with SMTP id 5b1f17b1804b1-43db624be12mr58276565e9.18.1743403579170;
        Sun, 30 Mar 2025 23:46:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:143:2e3d:45f1:fd2? ([2a01:e0a:3d9:2080:143:2e3d:45f1:fd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314b6dbsm157837065e9.36.2025.03.30.23.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 23:46:18 -0700 (PDT)
Message-ID: <82674b8f-4fc3-4fd2-bc7d-f573d2d11b58@linaro.org>
Date: Mon, 31 Mar 2025 08:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
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
In-Reply-To: <20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/03/2025 02:26, Bryan O'Donoghue wrote:
> I'd like to help out getting patches reviewed and merged for both of these
> drivers.
> 
> +M for venus
> +R for iris
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (2):
>        media: MAINTAINERS: Switch from venus Reviewer to Maintainer
>        media: MAINTAINERS: Add myself to iris Reviewers
> 
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
> 
> Best regards,

I have no power here, but get my:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

