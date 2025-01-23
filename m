Return-Path: <linux-arm-msm+bounces-46009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5DA1AB01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 21:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4213A8D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 20:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722E51BDAB5;
	Thu, 23 Jan 2025 20:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AeOzzXiM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5721BD504
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663162; cv=none; b=hve3Rh26LkBnRiHb+bPfI/dJQQv6tKfI9BV3OLJzVnpYwLqknuFDSmbOR/t1WqA1CFlOH9p+JH64Quxk1jnMEa36pUULb27IKlduzNNU7yHDNogVzgkSgqj5iNRe5y34EvmWXcHCpIswlbeWiyXDaLlNiM5YDl+HxFP/km44Mig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663162; c=relaxed/simple;
	bh=tD3t0EVHQXX3xHkHgVtxQbFbDuBtCGUSth1cuCd+JYA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=J5U0sz1GFup8g7Az9JVTf1Dz7Z94ms2hQDPE0kve293UsqD9kXijT9BkD4Daleum0tQwSlkKRpBkjEkiE30eL1MxxUr9RqcOV2/Tah6hnAj5v45v3dqq20LK8TP5dltOyq5hJMbzWpvUWRWLJ94JS6tToSmoi1k5r5WIrS0KLVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AeOzzXiM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso1925390a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737663158; x=1738267958; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=;
        b=AeOzzXiML1PO07LtpQ3b+niz04BPa/Q9a9eRqXvyubtGgpNkLkkRGQN/btDi4GvfOe
         d20b7HXbrIxkzXRYomB2J/lQAANtLeanXBsw6sr9/9/+U8QPeKT0Hafd0MdBzfsylH+Y
         6hwYgZ+l+FDCFreMdMwPZiM4+HJ5YQbXKrKswg6AR980nH+PBAJJCrQXEqjuGBzWnYlo
         u1KHC7qLvOY6aGvr/eNNoDYl3NqlE+qpnNLH/jzCkBpUeyWpTjAknpeHlOnfHM/xXnLl
         uTd6ftX4jd/6vvoCgegiKTgiRkmgAT99Y2rixMk31dSDIoAIFNI1NdwaXTf40DakZ8cb
         TbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663158; x=1738267958;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=;
        b=GR27HXvUDtDlG/xaXyKWw1NH5os/sWCQklvrkdihysnZ2SSIN7r6F4fA4hSnibFH04
         LtdaUQ7FL0nfF+KcUYDPN846v3BQyq/VpNYf08mifGiurjHD4NZm6F0ljdq58M18NtXM
         3c69FS9OALeASyZRISE+Spbd8+AGrSMS7qMN5eb/4XDXZdFlwiYtRgpIhtAdy/e9vDxk
         axfQU5+ABn6vN3sbIn09GlCPWPwXiA/TUVY92BfUU4EF5ZY/u1JKFj5kdLW7pDnZkuvn
         3oMsDTUV0d5PN3Ps0PNIZeEKdxPD4c3fNAl6ZGudb6AZfuKamrq8/2WdtUtpmX7uXG5j
         RBuQ==
X-Gm-Message-State: AOJu0Yyhpnv3fcweePz3crdsaNqgLrDbOZTfVmsGxkAdenXRlWbgVx8a
	jQ2mDPrikULgntNYf+dpGud8Pu0ZnEnpQdD6eLcQD74Yi/ZJ+GxW2Zr1dxoP7z8=
X-Gm-Gg: ASbGnctbqTD/ulCHRLng0QoCyGWl8lhcVsOBWsXbEQnC7I/CpGQN+DnFrEc9NMX7Ssj
	rSnFZ8Vs0R26xUcqScjcg20ICA35YzNDm1B0yiqxhum6PkvO6/Oop92Jl6j/nV7pRw0zNVKYcRz
	y6bSUmSITsZCOfkoXWK9Z30BVeg3zPsXymF40/HT1Iymg6ufb3vjyI26YJ3pEz2/JcLXzgGdktg
	NK3LAkPRVbHbHRGWg3TkWvhuomXrasRqS5rNlvonI39QIbZShIf9GOPxgV/PuivNGfa6us4GD+W
	KlLbwd9Q+iQh/TQ=
X-Google-Smtp-Source: AGHT+IGjYLbdTkDtVsKIemv83lRYfSaqRItS6634hiKj+p4fMBDbSMDFpjyvf11Hf9VpoP3IInSiyA==
X-Received: by 2002:a17:90a:c2c7:b0:2ef:2d9f:8e55 with SMTP id 98e67ed59e1d1-2f782ca1fffmr43193938a91.17.1737663158301;
        Thu, 23 Jan 2025 12:12:38 -0800 (PST)
Received: from [192.168.5.187] ([4.16.227.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa54a83sm122332a91.11.2025.01.23.12.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:12:37 -0800 (PST)
Message-ID: <d4881156-a003-41fe-824e-4c29e279fbb7@linaro.org>
Date: Thu, 23 Jan 2025 21:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/8] Support Multi-frequency scale for UFS
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
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
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/01/2025 11:02, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.
> 
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0

Thanks, could you be more precise on how you tested this feature ? how did you exercise the gear changes and check that is cales correctly ?

Thanks,
Neil

> 
> v1 -> v2:
> 1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for UFS on SM8650"
> 2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes"
> 3. Modify commit message for  "scsi: ufs: core: Pass target_freq to clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change"
> 4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change", use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl()
> 5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", print out freq and gear info as debugging message
> 6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the lable "do_pmc" to "config_pwr_mode"
> 7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize the local variables "wb_en" as "false"
> 
> Can Guo (6):
>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>    scsi: ufs: core: Add a vops to map clock frequency to gear speed
>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
>    scsi: ufs: core: Enable multi-level gear scaling
>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>      gear speed
> 
> Ziqi Chen (2):
>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>    ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes
> 
>   Documentation/ABI/testing/sysfs-driver-ufs | 31 ++++++++++
>   drivers/ufs/core/ufshcd-priv.h             | 17 +++++-
>   drivers/ufs/core/ufshcd.c                  | 71 ++++++++++++++++------
>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>   drivers/ufs/host/ufs-qcom.c                | 66 +++++++++++++++-----
>   include/ufs/ufshcd.h                       |  8 ++-
>   6 files changed, 159 insertions(+), 35 deletions(-)
> 


