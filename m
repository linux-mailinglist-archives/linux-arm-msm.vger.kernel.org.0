Return-Path: <linux-arm-msm+bounces-51758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3856A67747
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9C193ADBC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 15:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F002A20E6E4;
	Tue, 18 Mar 2025 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OgaFYLO1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5418620E034
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 15:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310558; cv=none; b=HIG+Yw9E1KhP7HQIuKBLxLDan8oNo3FyUAXXJOmqN027XKvMMErw9f5YVewwn+p/1IjGJsL/PoJ+DFdV3i0GCMl1g1gpfn/VUuSRNI6kJuUu56ULKYo3HElQr33tFiN9XB+v5xHxJ7mC7kovQkRFgIR8+vn1l72We19yKE3camI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310558; c=relaxed/simple;
	bh=s/H9HZSs6M0weh76yvA9lZ2ytdsjlwGeag8D2WC3Q1M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NqxgrrGNXs70VJJzfCKKMoaKsvvoujYxnObzuN6QyfIDHnp28VBIRysntYk0OJezvPgqVGeMwWcvQga1mxjepqDdiCHXsbe1CTLcV/oSxGtJNulF4wulSK29Y96gfZfSaNd4syI2Dw3eW2VEdeeXApfmINesHAepmQXYsSucAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OgaFYLO1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391342fc148so3719364f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 08:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742310551; x=1742915351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9FvcL11IhRXEvcchOW8/VG/LDph+/nqjxi32WaTfiU=;
        b=OgaFYLO1IZWCM485+lNPKrMVNp8mllz14Tcjo9Mp7awYnvu8FRI1TVkVKl+CfQKh/g
         gMJ1qAvc0GDcN1SXkd1uBrUSfCjbwxhDJPvmbbhO0Q+2sG2XD73Kwp2Qpp5DJ1QjtgSY
         NRmh4J/eNQG771DFqzvwWceNWlXeF7c+aPOwGwuQWkj9eHvqY6zK337KMgaBU4/dGNhK
         KkVcE+2CVIs4vuLSSFtLdr+q4Y9939uUdwDjlH5apv4YYUgycFtK/rsZ6tFzYYpUCuDZ
         iPrS1sCs3NbmuRwOvLQnj6Funqb7X0sLFFmp5Tp+xApDHFPnJWrQcZD8hT7L3aDrQb6q
         ovbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310551; x=1742915351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l9FvcL11IhRXEvcchOW8/VG/LDph+/nqjxi32WaTfiU=;
        b=cLGDYub2ejy6x3/eVsnAH0x13yG1MeWsaZ0BByN0GAQH3LW1TrCHEAyCWzHLBN6WbR
         VtSiGJwecnMNfLeFevb+n72pTJWxBeQEOu6WuD+HGRBJ2f4qffMBc+dEgz6MukqukibU
         MYNdybBbw1vMHTojucihm3fmoxrKEsa8g3YJA+vykmVur10KwVoONT+SyEXULnYqQGTY
         6N6lLBFyOOySH5zAOqm/o24mv2x1FeOEGoCQ3mZkLnvijutdMwGpkUScsvPbC6S2ZQiY
         lvBf5N0QlR12AQsi2nBeLiqbMas8Cs6ml9vVJ8/mxuk3k6nEdlZwLNxx2I487cfM9Pvc
         dE0g==
X-Forwarded-Encrypted: i=1; AJvYcCXH0ePMcMHzFFwvRq+8dxikBn6jF+sAINEIBhmckZVUIFBBoGZ+HKIw77DiCfo9lEJP+h9xTYXa8Sg+o+PX@vger.kernel.org
X-Gm-Message-State: AOJu0YzJlfvdsL7+dB2pgn5boYcsW9PV1TO1o1Ieg35zf4YOoXoFRPBN
	KXDvmPEBVZpEsbkaD3kFS/U5pwpCAzdFcMB1BWgo9E8fgEknD7OAqDMWEWUKFNM=
X-Gm-Gg: ASbGncvahzx2pA28LSbAM2IQZifSeImOOFugryfuLjSCRqSsTWGPhFU4bcmyc3BHi6v
	eQBbN/DAgmm0uS+252uRG9oiP/vBM/TZ5Mw5OKJlP0PGL5k7RSRtbPHtp9W3wpftmANFsFS58hK
	/QAIifbsVVbxwsiW9JSgnmAmWr9gnqWrIAH5copjR34j2I09P36NFc27zkwaoV6ZWv/aoe7amC6
	n+qKoll1u0NmkrF+1CuH9Cth579uyHQbayY0u3NH5kPwK0RHl5yzXqPKrt3P9Sb0Zp/Qk2cV8N4
	aDXNcPgYWDX85lwOo7O0ENB7E5IOo+QjJmYwhiacXS9kXEziFF2uSFoTp6+7v4gpLz22YYhJdtq
	Ar1+HX/UBJi1a5LVfNtgDmg==
X-Google-Smtp-Source: AGHT+IHbtr+9S+oor3PLqFFIkT9ev1XX2FkdR7McQ0/Nli+raQ51d4FH0a0etvq/qd5v5iYmXtWD2A==
X-Received: by 2002:a05:6000:4020:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-3971d13607fmr18401484f8f.5.1742310551515;
        Tue, 18 Mar 2025 08:09:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff? ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm18709729f8f.99.2025.03.18.08.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 08:09:11 -0700 (PDT)
Message-ID: <ab3639e0-61bb-46f0-9e54-f1bbd034b939@linaro.org>
Date: Tue, 18 Mar 2025 16:09:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 2/6] phy: qcom-qmp-ufs: Refactor phy_power_on and
 phy_calibrate callbacks
To: Nitin Rawat <quic_nitirawa@quicinc.com>, vkoul@kernel.org,
 kishon@kernel.org, manivannan.sadhasivam@linaro.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, Can Guo <quic_cang@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-3-quic_nitirawa@quicinc.com>
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
In-Reply-To: <20250318144944.19749-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/03/2025 15:49, Nitin Rawat wrote:
> Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
> puts enabling regulators & clks, calibrating UFS PHY, starting serdes
> and polling PCS ready status into phy_power_on.
> 
> In Current code regulators enable, clks enable, calibrating UFS PHY,
> start_serdes and polling PCS_ready_status are part of phy_power_on.
> 
> UFS PHY registers are retained after power collapse, meaning calibrating
> UFS PHY, start_serdes and polling PCS_ready_status can be done only when
> hba is powered_on, and not needed every time when phy_power_on is called
> during resume. Hence keep the code which enables PHY's regulators & clks
> in phy_power_on and move the rest steps into phy_calibrate function.
> 
> Refactor the code to retain PHY regulators & clks in phy_power_on and
> move out rest of the code to new phy_calibrate function.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++----------------
>   1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index bb836bc0f736..0089ee80f852 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -1796,7 +1796,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>   	return 0;
>   }
> 
> -static int qmp_ufs_init(struct phy *phy)
> +static int qmp_ufs_power_on(struct phy *phy)
>   {
>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> @@ -1898,21 +1898,6 @@ static int qmp_ufs_exit(struct phy *phy)
>   	return 0;
>   }
> 
> -static int qmp_ufs_power_on(struct phy *phy)
> -{
> -	int ret;
> -
> -	ret = qmp_ufs_init(phy);
> -	if (ret)
> -		return ret;
> -
> -	ret = qmp_ufs_phy_calibrate(phy);
> -	if (ret)
> -		qmp_ufs_exit(phy);
> -
> -	return ret;
> -}
> -
>   static int qmp_ufs_disable(struct phy *phy)
>   {
>   	int ret;
> @@ -1942,6 +1927,7 @@ static int qmp_ufs_set_mode(struct phy *phy, enum phy_mode mode, int submode)
>   static const struct phy_ops qcom_qmp_ufs_phy_ops = {
>   	.power_on	= qmp_ufs_power_on,
>   	.power_off	= qmp_ufs_disable,
> +	.calibrate	= qmp_ufs_phy_calibrate,

Ok so this will break the UFS until patch 5 is applied,
breaking bisectability.

Make sure UFS host driver calls calibrate first, and then
do the refactor in the PHY driver.

And either all would go in a single tree or either PHY
or SCSI maintainer would need to provide an immutable
branch for the final merge.

>   	.set_mode	= qmp_ufs_set_mode,
>   	.owner		= THIS_MODULE,
>   };
> --
> 2.48.1
> 
> 


