Return-Path: <linux-arm-msm+bounces-51757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2B4A67735
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49A447ABF29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C349220D4FE;
	Tue, 18 Mar 2025 15:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhB138d/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BB746426
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310320; cv=none; b=ADB6bzbk8kqDXsR14ui15olCTvXBXO61MeCQy2X9J8ejxVI44NlkwJpfmcSsLlBsB78J6fIIsZa3MTbFXEjGH4eUpczHyLKkxUtN7+bIUajwKqSsgDDo9FbE2hIewW2PKW26EM/7/DYhlGi3oeNz+a86suIAj/lJVYHt7JFmHqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310320; c=relaxed/simple;
	bh=X1fIwXQ6nnTOxW8T62IeQHo4HyPTrgZeN4zniCvGBGE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NL+F+tcxots/385FRud/juwFwBOQeKyXz7dNERy9kGjE8SQmuQ/rhRZGR3OOE9MH+XzqelPD4qGPSQTckE+6cnSFALikCVXqdTPvqZhHIAGrJx/8X/kJ37OA+fS6GNF7VzPyzHP0wLJGcAoxMLBDoAY8p8H0B3Qh4UobUirSGpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bhB138d/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso36594835e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742310316; x=1742915116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7z3efMccsfKBdFpHk+eX1kiGNX1+yreBt4Fj6qD5jo=;
        b=bhB138d/cj2BDeutQskCH79Y4tq8Tk0ILsimQ06e0/AswlX5r55xNZ1tYQj8FHEjOY
         dZRowEBgTe6fvzPjChCPkcy7ccE/2DN6AerU80+kVa31BjYsyflbyxKKKZLPP2y4N5ib
         61pQlEJMt12wxiS3v0I20sd8R7Vy5pcaph2xY/srLDsbcQt4bLlYBkh0had4u01B812e
         iQIQyFn4zVWIxKfkXWiHnf+fMLkTdDBFu4GN9hBusUwrLF0f8aa6Q8D86oZmCE070UK/
         /2esqp3fx6zBfvTyOa/cfsR6rcCfILS0a6tCosTSX7TvltqtyUDjZ5obBJL8l6C8QZID
         WzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310316; x=1742915116;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s7z3efMccsfKBdFpHk+eX1kiGNX1+yreBt4Fj6qD5jo=;
        b=qAAcybp+VXI/lDEXJnSKQLQJcljPaP/EYhHP4n8l5MZ4xBD1QgzPWZ37OLoqf1q+bK
         du1UgmoILf/9eIdCM5xVz5lpAFgOm7iCwEYw5sV0fj9vSVt3rdcD3KXxbq4CGoM82bvq
         gB39i6GmdRUJII1Af1xriC7c1KGia9vRbpe9Pi0scNNept6uJlq0UHf0ddl05fz2+W+E
         xCdGBfs30xi75jhHAWXqdrV44LssiE2V0jvnsFdg12djXvXmqgSX5tNG1+q4W55UoA/R
         kD6ZwmlTL05ktkku3aRKQrmegqLqjXk5yIVya+N8JxMM2PFVINWamsVwbF5LkjWXxuKD
         sXPg==
X-Forwarded-Encrypted: i=1; AJvYcCUPjs6ZNsgAZX55W791bx7WQdW0LQPmBDlMAdMmc5Y9PILOY3OlJHFZfIdycMe7u8xXK1eNJG11iUS0S5JG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzp8rOgtYMETbOt+jsRZnOKsXJVyZUn/n68t0vZBbN1G0SUdc
	/rd7S1vTmusTX6dyGkuq3u+Yn5EzOulJeetivMKPP7yhwnm6ZQNF/5yuw0QI29s=
X-Gm-Gg: ASbGncug3QMImkEXa2QrnO+rfDuuSqYGwLW4TabYrulWISMkHX5F8KZci0lpODYJmol
	ypkP9WI33RwqVDv+DoJRcVuJUhNISEr3Gwsjf4iuDTBfdIy48WDMUfL3aWQdTnOgiecOHDttHK/
	9zwWjcCdc1EiHNVyqdFsNdWloa/LJaRS6QLCVIsLhc8FLjGykGrPpv1bLj9DoBmqz/XGodf29Wf
	6H+QUvbea4b3fKMnCJm8v0Fgq5RvlB5K/B6buzqzVqVsXXSflmW7EYR+t3rQOtBb0VdcgljeB09
	TAG7XRfj8t1TdiUrHyVsqJj5eODgF9wX7vgJug9xubAPe7aFVKMCqyicLhLMbXEsmsnCWN1nGmq
	h6j7QdKB9d2Zji3EzOzcXaQ==
X-Google-Smtp-Source: AGHT+IFvHjliDhhrMFfSHKDFTbiDpIfzsiyAIrlmrzEJuRyFcEuNWlnzrwIPGgDXN2d4wUB2n4VJZA==
X-Received: by 2002:a05:600c:4587:b0:43c:eb63:415d with SMTP id 5b1f17b1804b1-43d3b9a4273mr24879565e9.14.1742310311971;
        Tue, 18 Mar 2025 08:05:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae040f9sm18471835e9.0.2025.03.18.08.05.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:05:11 -0700 (PDT)
Message-ID: <89e743e5-7ff6-43fe-bd52-97f0ca6ab07e@linaro.org>
Date: Tue, 18 Mar 2025 16:05:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 1/6] phy: qcom-qmp-ufs: Rename qmp_ufs_enable and
 qmp_ufs_power_on
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, manivannan.sadhasivam@linaro.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-2-quic_nitirawa@quicinc.com>
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
In-Reply-To: <20250318144944.19749-2-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 15:49, Nitin Rawat wrote:
> Rename qmp_ufs_enable to qmp_ufs_power_on and qmp_ufs_power_on to
> qmp_ufs_phy_calibrate to better reflect functionality. Also
> update function calls and structure assignments accordingly.
> 
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 45b3b792696e..bb836bc0f736 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1837,7 +1837,7 @@ static int qmp_ufs_init(struct phy *phy)
>   	return 0;
>   }
> 
> -static int qmp_ufs_power_on(struct phy *phy)
> +static int qmp_ufs_phy_calibrate(struct phy *phy)
>   {
>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -1898,7 +1898,7 @@ static int qmp_ufs_exit(struct phy *phy)
>   	return 0;
>   }
> 
> -static int qmp_ufs_enable(struct phy *phy)
> +static int qmp_ufs_power_on(struct phy *phy)
>   {
>   	int ret;
> 
> @@ -1906,7 +1906,7 @@ static int qmp_ufs_enable(struct phy *phy)
>   	if (ret)
>   		return ret;
> 
> -	ret = qmp_ufs_power_on(phy);
> +	ret = qmp_ufs_phy_calibrate(phy);
>   	if (ret)
>   		qmp_ufs_exit(phy);
> 
> @@ -1940,7 +1940,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>   }
> 
>   static const struct phy_ops qcom_qmp_ufs_phy_ops = {
> -	.power_on	= qmp_ufs_enable,
> +	.power_on	= qmp_ufs_power_on,
>   	.power_off	= qmp_ufs_disable,
>   	.set_mode	= qmp_ufs_set_mode,
>   	.owner		= THIS_MODULE,
> --
> 2.48.1
> 
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

