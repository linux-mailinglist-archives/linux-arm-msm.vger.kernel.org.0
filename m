Return-Path: <linux-arm-msm+bounces-47417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA5A2EB87
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 12:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B9973A7F9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD261E3DDB;
	Mon, 10 Feb 2025 11:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJUZ7mfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8D51E376E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187639; cv=none; b=X1FHB/EEUCydwzthLBVWQqVv0z0X2MvzNavMCh7vUo11NBrm+5ErvgfkZetwGPnv+SSfo3XTSL9lEbD826vaRdS55XUoinF/nTXDZz84wL8APCQOk4W4lEjtH5olkkKZAlQNoEtRDV5HIkYtIAQgMbK2g5yosjY6BIfuVtUyhLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187639; c=relaxed/simple;
	bh=ZIHWLW6w7uP7Z6GuZXCdY4UWuKMnu8j1U7F9IS11cO0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Uxl3aZYUph97zY4NprFfCud8zy8U7ro0pz/pDss34sU+N+tf8TrxOmVCqmWe5gDXuN5blvLloa/gBqq/jmqOcuN5bDOsjMlt3RvxGBYiP98N79cay9NDmzPkQBx2+yhFrjMDyaJ3HvqNr+jgTIhOsn1K0JuQq5zVSqDOwnAZE/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJUZ7mfc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dcb97e8a3so2357779f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739187636; x=1739792436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HV6fC7P2psWkYW9IdD0whUoU0+FUvgP6/dBKRxj6aZQ=;
        b=mJUZ7mfco13MnGixnS7SesIJeZohcN7P8b4lmxYHu7bPd0PujFhkRZ2zgRJ0tUhrsn
         u6tHPkjNLPnxDGaazRMpSCNAAWpozCe0Kr/pKMAvXin6UcxhF6m5XLYHxEFr9tzfhj40
         hHeNyCji4PrHoryk1ZBc5dTfHs18OGm206svkIyaemG7jqC1o6e/UeNPy7v3mpW7tBHf
         lbrtinveMQBIELyraKS8LfTzD2ky71hXgNO/JGxoD2x83e2KuiyYgB0JYv0gLaJlFyTd
         IzFT4RmL5udaTCLE+NlYc0WZRkqj+INRbpjAZp4+iVBu9b/x0kHpQfzGE+n3nSQPKlKI
         MllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739187636; x=1739792436;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HV6fC7P2psWkYW9IdD0whUoU0+FUvgP6/dBKRxj6aZQ=;
        b=na5HCleYt1NGf+YqpJMIxZq613c0NE8znGlYzFlxIfHMbNEusVrXjZKjDNUGUfZ5Je
         Coh4Wo4kYi3poH1H8SBKMxiU6D6NSlg07TZB2H+4jKRWkzOldTqRDphWMGRwBG4nnoui
         gLdShM9tWsu0pf2MVvUFMfMW986C1W3SFxm5Lz+O2fE80NIFtZphB0ZY4L4t47ccg7xJ
         vfcvrMvdaSzTHcYeL1W0/2GoTihQEfG3nlCCVagyJ8sQy6D/e6dfggR5qTO2sj8zJKVc
         JqOllshS46PKnDJf5Nu7FFi0p886dj2TN9lWu9w04g8HR4WraZ1WtBQ/KhP7/+VeIBkj
         pEwg==
X-Forwarded-Encrypted: i=1; AJvYcCUh2SVyhfon1RgUEHZgK7xiY1plr8ygw5FIOmPDyehMWH0YQJb8pkqUe5MPcHcgPtxiF3sBStA2bKWlSc2B@vger.kernel.org
X-Gm-Message-State: AOJu0YzvsVdU/NtkW7Kjq1eo2ZZI46QEZVztl7ggfY7hmVtAgIHnSV34
	PK8edplevoNlepxer0M/gml/Qol4A3Hat/0DlxunFXAbwxsLopGhf5ULy+rr1zY=
X-Gm-Gg: ASbGncuIz26IFgTqsTRAXqNVarc/BtSh/4U2bimDbiJhYbh6ku8fCjLXNjBHl5jmbHC
	o/GC8JX+ZNAu1vd6owLhBDFyFLwkuzMtd1c9kEizKrOVjugGs+iTHLHUI+JxjQXO/6CyH6Pg7ew
	89EVznQpUNXnVyKXk8sFqlRh8Vrg68ZbQNhAlD+tOXFiadcQPJo3+V+dze/OO5diUt/4VnzVWsU
	5mPKMunxTrRscmAG+p/OdtzFvXc2V8S0UxjaS0tG7R9W+Pd1X+r0irWMKW7z+2KjauUfpgxLKoe
	K9Iht5Y+tD8hQ+LcuskJ4DdRHt39bud4dvRpty9C81Ga2LfzBNmIF3yAQVlSunebPctS
X-Google-Smtp-Source: AGHT+IHjH2rCgSpGqTzKE69itr5XbbPr9vAVUQsQkDIKn8VnRnl31poDjGjlDFHnxiiumvVcyA6bQA==
X-Received: by 2002:a05:6000:1865:b0:38d:b7b0:70ab with SMTP id ffacd0b85a97d-38dc8d9b474mr9250519f8f.11.1739187635994;
        Mon, 10 Feb 2025 03:40:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm11688869f8f.95.2025.02.10.03.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 03:40:35 -0800 (PST)
Message-ID: <80745a39-91fa-4ae7-b55b-383e08be6517@linaro.org>
Date: Mon, 10 Feb 2025 12:40:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] Revert "dmaengine: qcom: bam_dma: Avoid writing
 unavailable register"
To: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Amit Vadhavana <av2082000@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Kees Cook <kees@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>, Robin Murphy
 <robin.murphy@arm.com>, David Heidelberg <david@ixit.cz>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dmaengine@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250208223112.142567-1-caleb.connolly@linaro.org>
 <mjyavvk5jymhfdn4czffihi55nvlxea5ldgchsmkyd6lomrlbr@7224az7nsnsa>
 <Z6nSyNz91IIzrVuv@vaman>
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
In-Reply-To: <Z6nSyNz91IIzrVuv@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2025 11:19, Vinod Koul wrote:
> On 08-02-25, 20:03, Bjorn Andersson wrote:
>> On Sat, Feb 08, 2025 at 10:30:54PM +0000, Caleb Connolly wrote:
>>> This commit causes a hard crash on sdm845 and likely other platforms.
>>> Revert it until a proper fix is found.
>>>
>>> This reverts commit 57a7138d0627309d469719f1845d2778c251f358.
>>>
>>
>> I posted below patch yesterday, which reverts the change for
>> bdev->num_ees != 0 (i.e. SDM845), while still retaining the introduced
>> NDP vs Lite logic.
> 
> Bjorn,
> 
> Given the issues reported by Stephan, do you this we should revert
> and then patch it up..?
> 

With Bjorn's change, DB845c is fixed, but ifc6410 is still broken:

https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/pipelines/131282

So please revert to it can be resubmitted correctly

Neil

