Return-Path: <linux-arm-msm+bounces-47018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB5A2A531
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 10:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D10157A3B5D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 09:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D1622653A;
	Thu,  6 Feb 2025 09:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSvB18QO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF396226539
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Feb 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835612; cv=none; b=Vqy47O7gdJXngCtJRvlhqJL4zPjq0mjBtsRwCxzZFq5Iz55oSYQyZi80qBXT+eiQsd9p1pfGVEzSydgUEOGSGPrWFwf0pt82aV+8spjzWiVFTM9Ii53HwzjzAGRPiW+Gga9uZrUcS35BUu17iZbDfmvJa4OK7Z1OVJTQ49HLGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835612; c=relaxed/simple;
	bh=WUBT/dBT3hdEKftrm9ytaz0AxYAgi67qXEPM3/1/Jfg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sPLyo2x3KE+qozILBXeeMWRDWDPQoHzV6aNDIufJ+/JvGz5PdfQIS8v1TNXf4tM/MpGW1HFIPqyRHCroXVoCjA8LWgTI0W09ncHteFEp/mlJz0k6na4Dwuo8Ec2RNjni0lwkJJki3FruwLjetyeJH6/ZUjaz61caUhIRk/Byk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSvB18QO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dba1cc632so384427f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2025 01:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738835609; x=1739440409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/Bse1dCSk7wlBTxWxrw+fvF90V1hOkdi4rEK3c8vEo=;
        b=XSvB18QOuJFkJq9EC+rSNnHmv65O1/n5hZxQA+oOr6lzH1eCr7b2J9j7Y5CrPipyYk
         7NqH4eJerTmIL1KqgFrlbGuwKaUOcs2L3gD8yBRgp/A29aGSX0Xj4obcInAA3PUcI8rg
         xXxQB25VpkRtUP6QfV7K2h5THK/dF/bcefndRAlZWk3twtt2Siwo5PM6Tg01R/tj77m4
         dXb10QhYSwtWdPhoZMSt0FYJa1FQl7eL0lXIR/NheMlZu4mBX/iubtGZdJ1OGJjnm4dw
         /eSaEOIt8cQKCTEQHcPNBjyb3BSirYM9UPm8+sPpc7xt2fUfCpIZpB8c0qFtdtM3aD08
         gm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738835609; x=1739440409;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y/Bse1dCSk7wlBTxWxrw+fvF90V1hOkdi4rEK3c8vEo=;
        b=qd6iOv/BicKf18XHC3tWdZkOFEpZCH71My/k7xzlYm3C7LCLXq+1e5dq5aBo0lm3TU
         yngxb44ZAMgdP3/N1dKiECBe8RVrSe21Ml5q635R65Dcf+Txlq01/fjPT/56x1wndUnT
         YtbxF5c0XaSET8xqLn8y+q3+U1PhNg4Ui+13ClJsOV37GZQyO3TMt0RTVcruV5mTPHiP
         SxkW73SXFTTbLf8GOjDzeFwvaHVFGA40JYortNHmg+Aktn6nlUBqvT61yUxvRDcHcUEH
         kCsgUttyOvoE/SPjV21v04vTiZIjxjiulIvbqiSirzMqJvuEd17CYWN7/LmnlmG0MGCV
         5HzA==
X-Gm-Message-State: AOJu0YwPWEO3dVe7q/JqSwdjh2AIj17EWw5iyVtwEZ04nuzkotOE6jtA
	eQdMby73TRnLDVsVC9sw0innKNutma6aAG079M2pw+VvKpx0AYf9iT9CEkVQfF8=
X-Gm-Gg: ASbGncsj/qDoK7dzM5BXY8Nvk6m5rCexy6gUXkpyqKuwdM+7KkuhybCBwscl2HZKvNH
	NJRc/K8axXQjSp7ZjQISPKwAVpLqvQLAe7pVMRmzZhubMPOAiegdzy/J6e2tc0G0dpS7pOBKPLP
	eiNiuVtuq3DXnXOv8DW98FH3Cu+xk9ppbHlRkL8+RC6oy9P41M5AVmL0XtUw5wyVuwr3AEbovd7
	UQpHeUZ+uy1oMumDfi0kCvtda9QA8a2HiXI/jXjD9MepgyDtoo7/cDqlD7TZGT+raX4zmrO8GVe
	VpUd1uD3gI0DqI36NytQcaqKBj4ETQMHeGlxMSTsjlGBVOIGPRBXOzQQGyYfTNHMaiuW
X-Google-Smtp-Source: AGHT+IFZ/YD1C+lwl5UFVIadECKSzvAxjxJXg73+g+VHFrSip3JyQPnIew9WOECpn6y9hKaGtkaC7Q==
X-Received: by 2002:a5d:5f4c:0:b0:385:fae2:f443 with SMTP id ffacd0b85a97d-38db48d5d49mr3733434f8f.34.1738835608907;
        Thu, 06 Feb 2025 01:53:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc31b9394sm337288f8f.11.2025.02.06.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 01:53:28 -0800 (PST)
Message-ID: <63578f71-e5f5-482a-98a7-779053b1caf7@linaro.org>
Date: Thu, 6 Feb 2025 10:53:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/8] Support Multi-frequency scale for UFS
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
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
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
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/02/2025 09:11, Ziqi Chen wrote:
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
> v2 -> v3:
> 1. Change 'vops' to 'vop' in all commit message
> 2. keep the indentation consistent for clk_scale_notify() definition.
> 3. In "scsi: ufs: core: Add a vop to map clock frequency to gear speed", "scsi: ufs: qcom: Implement the freq_to_gear_speed() vop"
>     and "scsi: ufs: core: Enable multi-level gear scaling", remove the parameter 'gear' and use it as return result in function freq_to_gear_speed()
> 4. In "scsi: ufs: qcom: Implement the freq_to_gear_speed(), removed the variable 'ret' in function ufs_qcom_freq_to_gear_speed()
> 5. In "scsi: ufs: core: Enable multi-level gear scaling", use assignment instead memcpy() in function ufshcd_scale_gear()
> 6. Improve the grammar of attributes' descriptions in “ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes”
> 7. Typo fixed for some commit messages.
> 
> Can Guo (6):
>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>    scsi: ufs: core: Add a vop to map clock frequency to gear speed
>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
>    scsi: ufs: core: Enable multi-level gear scaling
>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>      gear speed
> 
> Ziqi Chen (2):
>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>    ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
> 
>   Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++
>   drivers/ufs/core/ufshcd-priv.h             | 15 ++++-
>   drivers/ufs/core/ufshcd.c                  | 76 +++++++++++++++++-----
>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>   drivers/ufs/host/ufs-qcom.c                | 62 ++++++++++++++----
>   include/ufs/ufshcd.h                       |  9 ++-
>   6 files changed, 160 insertions(+), 36 deletions(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK

I added some traces and played with devfreq max_freq while copying data
from the UFS disk, no issues observed.

Neil		

