Return-Path: <linux-arm-msm+bounces-61993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37DAE35A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 08:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8AC018913C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 06:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A29A1E1DFE;
	Mon, 23 Jun 2025 06:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QIkBIE5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44531E0DE8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659745; cv=none; b=DsrjLItKKXBCg6THznEPULuTlaI5P2QW6rmVOuNXi6ioaXF0D/P87lWlQMjoamZdpbzOdUGogL5Cev9BcL7SKvjCMFeV94YgrnHXp//RL/0rjOQGcId1E2jfzPFD0oTiRykwwIFH7y5BJYIwzbuHt+MgtqYfvHbwjLAZujDQDi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659745; c=relaxed/simple;
	bh=Hv+uNbgjOo7eV3KR018ipqdg3Kk/pVRRN2UVv0jVAOs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZrCaJXfPW/eKBTUxn/0geFWPUAftrXb9Ki5draJzKvBW0nANrhENlrCwPH6kEAIkxVsgyd80lOI2U+DhJcZrX0w4Lqphh/Qu6kM7RmEha/9dBGeYEts0bwl0uGQW4mS+0e5/jxqwcTlJspXkLpd9bH97+7+HaLKhOXMBc8uracM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QIkBIE5I; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4531e146a24so21656825e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 23:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750659742; x=1751264542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyQvdfJ846qR1SUglJS5KsTw/IlW4Yo1/aMNlY4Q96I=;
        b=QIkBIE5IxSgE3bLhDqNu7KWEtyG+iZurwAZdnWMmOEQ/MBcORZNLKsea7sH4fAPm5g
         gGztFrUnWpPZvHdVglwCsPmVFcDBtpQyzCwYVytgiv7DDMIGxlqBTjrlFgR5xU2jKHfe
         02yiNYdN/rbwVEhyMhDlbhiortu/dboYnJJw7i7DnqDHM3xuze9dLPM9r08Z0CFZxp9j
         KzJkCo6o2BkKutnKyj66s4q+KRyW2XXi8iozOYg1ZarYkH7Iw7p3a361Y12vhLPbctyX
         mlusgC9QWZF8RbdQRJSWE7TbQoR1jzfZcf6vVoGBo11mffSl2NiMT/eGG8hRrAt0bJ+N
         gZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659742; x=1751264542;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lyQvdfJ846qR1SUglJS5KsTw/IlW4Yo1/aMNlY4Q96I=;
        b=BW8tQLDojJba/NmNEoZGEulU0eUKZg3Zcfc/v0hYb+Wat+rM/5VlzpRTXT8u7VrPVx
         XYMSxDcChafIXHVcB8cLjg/XqZxZZGNqlczY0+syhv4PkQC6ZqPfTwfnICJbGT3nIbU2
         IMkTYypd1bFz/sr86FiweULUWgcQKa8a/TayU4qWNyB34BFX5Kkwgp0Vx6AFM5RSzGbu
         IM/fIQJVa+Uhh3+7i0LY4LRjBtg/J1EOaQENEiJ9SGp/RkpnlYVWVVSRmVmRtxYZCUc2
         shxj1yHgdKjGCHqr4qDeKf9qhG8hPbSip6SeDKHmY4Jmcb+zOLE8OKkz6AOVlTlVyV+6
         /91A==
X-Gm-Message-State: AOJu0YyTr+rxaSOQn/fPPIfYJUhDEZMMzfCkwlO3S6ydTKXSHBeDhnJ/
	3a/9G1wNCOTdeXpfp5lTS2C0MvKQAgYOuJ7MPKdVjFxw03+bWkmsBYjPpkcwHEuAoc8=
X-Gm-Gg: ASbGncuG4tpZAyKnbl4jjKFYK3vyqWQhAHIIqJSZiBAUZ0kFfPDCYQknlhZ3fun1UWV
	FO1aYZ7J7rMyTgqdlK6SERsuecDywyNfRH2Wou0TYttlzT/lIMK1JFnfDqAXGlxP0ZoUTPUCxJL
	AvzHJyctAjqA9fd5D/rPud4M+mpUgkdgsPG1+JL1LJP+IzQDmfD+7lMZTaNFFs5MyCwXpH9HyJc
	Ed2mPaaofT8qi9nUeLV2RdIrG/9yamzT8hzR2dqtmkQR0IlVzrPY/91n+dE7K/5uH3w4PhX4/gY
	XkvCPPR9/edmji3Q4Ap0rRxp4vGcfs0VRA5q49ex2YLbRs1bjpmIXFaqJ4PW9OcXf3jp9NgGwIm
	vbKh3eCER8dOEgaQrhn4EvrBDvgsN/Ttg0QOGxDA=
X-Google-Smtp-Source: AGHT+IFTuXg86DMd1xpRihwnfgo5N1mfVAlsKSlVqBLFNgG7lzWkNnjG9NMqs3v7GpKHw3IwjarK1Q==
X-Received: by 2002:a05:600c:4686:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-453659f7a7emr94107005e9.31.1750659742030;
        Sun, 22 Jun 2025 23:22:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c5f2sm8789930f8f.55.2025.06.22.23.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 23:22:21 -0700 (PDT)
Message-ID: <bbbf2633-69cd-44c8-a94a-a36445121126@linaro.org>
Date: Mon, 23 Jun 2025 08:22:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2] scsi: ufs: qcom : Fix NULL pointer dereference in
 ufs_qcom_setup_clocks
To: Nitin Rawat <quic_nitirawa@quicinc.com>, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 bvanassche@acm.org, andersson@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, quic_cang@quicinc.com, vkoul@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Aishwarya <aishwarya.tcv@arm.com>,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250622175148.15978-1-quic_nitirawa@quicinc.com>
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
In-Reply-To: <20250622175148.15978-1-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/06/2025 19:51, Nitin Rawat wrote:
> Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
> uninitialized 'host' variable. The variable 'phy' is now assigned
> after confirming 'host' is not NULL.
> 
> Call Stack:
> 
> Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> 
> ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
> ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142)
> ufshcd_init (drivers/ufs/core/ufshcd.c:9468)
> ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
> ufs_qcom_probe+0x28/0x68 ufs_qcom
> platform_probe (drivers/base/platform.c:1404)
> really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
> __driver_probe_device (drivers/base/dd.c:799)
> driver_probe_device (drivers/base/dd.c:829)
> __driver_attach (drivers/base/dd.c:1216)
> bus_for_each_dev (drivers/base/bus.c:370)
> driver_attach (drivers/base/dd.c:1234)
> bus_add_driver (drivers/base/bus.c:678)
> driver_register (drivers/base/driver.c:249)
> __platform_driver_register (drivers/base/platform.c:868)
> ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
> do_one_initcall (init/main.c:1274)
> do_init_module (kernel/module/main.c:3041)
> load_module (kernel/module/main.c:3511)
> init_module_from_file (kernel/module/main.c:3704)
> __arm64_sys_finit_module (kernel/module/main.c:3715.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Fixes: 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off calls")
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # sc8180x-primus
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Aishwarya <aishwarya.tcv@arm.com>
> Closes: https://lore.kernel.org/lkml/20250620214408.11028-1-aishwarya.tcv@arm.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/linux-scsi/CA+G9fYuFQ2dBvYm1iB6rbwT=4b1c8e4NJ3yxqFPGZGUKH3GmMA@mail.gmail.com/T/#t
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>   drivers/ufs/host/ufs-qcom.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index ba4b2880279c..318dca7fe3d7 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1124,7 +1124,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>   				 enum ufs_notify_change_status status)
>   {
>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> -	struct phy *phy = host->generic_phy;
> +	struct phy *phy;
>   	int err;
> 
>   	/*
> @@ -1135,6 +1135,8 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>   	if (!host)
>   		return 0;
> 
> +	phy = host->generic_phy;
> +
>   	switch (status) {
>   	case PRE_CHANGE:
>   		if (on) {
> --
> 2.48.1
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

