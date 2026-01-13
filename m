Return-Path: <linux-arm-msm+bounces-88690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E76D17361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1339C300B9E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862D9378D98;
	Tue, 13 Jan 2026 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHCZ1DHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E444310652
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291835; cv=none; b=TMv7QSjRJ1NhuOlWZxVTx8DhDMRiTNLcoZ/kxIs++UITZnNqzuplysMsRCb10FC3gfimT6ntBt+48OrCt45SzMMPCJSNCQeiaOHeddPR4QKAk8eH5lHxExgiGNlSDA4hVLe8SeYWC7Lal2kpqSUCz/kaebXaaDSKWF1MWDGESCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291835; c=relaxed/simple;
	bh=Puv/aTxOf2PvKd145gSJc2hsw+Fm3KIkMPC+K6TZ4G4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=p1MY03xUd0/hbKCZS5jwe7LmjG2v0h4wSBewulqEFacPo56Wvt/ehGlR+DSdYmOKklp99bcVmFUlLWEFyg28EHijwa1NmM24NZ35l2MZ7bFVWCLJ74F8zgNEVqhHQWB/tX1JtpF7IJHxflv2E/htALQIqdRwAec36VrB8q5c4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHCZ1DHY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso43110275e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 00:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768291832; x=1768896632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyrISbBW8+PtR6598NJT1L7vvAgAoA5tCosKy9SNs8I=;
        b=HHCZ1DHYL+F1Y+0hwDzLbSTG1prngTtLwV0/N1MLLFW52AkkSx5r10JHCsCM/DaJIl
         qS+/FRV4YS/HHnUvim2VWaf2gEzwNSBCiXRmHeqY2zxm4Hx1brQn1lW9MOatzSsJ06RS
         MpEF3zvH98T1zkZqKhyEyT774JMxUB1EULmb2F/F/0XDiyhUychCO65o9K1jh7E6e2sL
         SiHtneAJuQ4dX/CRj82xxioBA5HU8tRZRp42LVe0df+zEw3EH/+th8bxNf6aI6wLeuhw
         6VmGvaEdQtECHwV7nw7NZh24tlYODy+D0kyyTFks+ZtwYLorpIsoeWuUNZJ3oP/yab3I
         y6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768291832; x=1768896632;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyrISbBW8+PtR6598NJT1L7vvAgAoA5tCosKy9SNs8I=;
        b=CoarK2kPylaaC46R1J52wls47X1IfOaa+OYrmXhTb0LKc9TMChXdU+rc5Uvk5ZV8P5
         Zba7P75V2ws1ohzLnoV422RPfOQINT+pCQB3mCOJlqLjQ/Mh6Baj4QV2sf0xyDJScNOM
         FGvM+4FEyOuMnzq6aw7cqSZOW+o9sxxY4XfNIEMO41ihtYksiN+A5rM5w9WF/son8eQF
         1ElgRMkHDPsaqkBi0I+cyjiTbSiz6hGHSYqDyDv4ZwNcdg9V1t9X1mLbelj7u+BDAQ9g
         vTaPMNrwmIH8Pnj7iHlWv3s0CBT6Jv+WeIJeO/N9+X25xyxLrrDvBFM+fVSVJ0u0tzgl
         QmYQ==
X-Gm-Message-State: AOJu0YxkORLQBjxPJcrjKZhZBGzA4cTe7Le84Pi88yerBC5oO2DT8lq9
	NxMb4c4wQD8TGD/NNf7s5vHSC+vIWNkvETbMjlAIlei5nOwKXYWzwx7QY7C+0Uqnw+k=
X-Gm-Gg: AY/fxX6dGGy3L+nPpKry7YEodgRUGGuHT9NfQpZ8ozya6nG372UrvbI6JZ+Q9+6btbN
	uj51mREBHb2ffcUVM82aczh3LaqzBJmwN+A6LER2UzJXgD5XS/4qddWAUlkHEBT9VNYaX9Qr+cX
	HFAWm3l51chshlJZNnqqZyVYpqyndz9fjeBLV1hk9RsfrAZIk2kOQHNSCDeeAqQVF5LZRORf1B6
	CUaP3CG0t9xuT4/97Ue0WQVWNDZXtuvEyjEQBm2O6oaea+5RXB6ywQWFsGQ1004jMSu3bJvHMVg
	HLgtpdd432jiGTcPk3xRVYdvJspp3Xz2wGOyOBB81ME2aoQVfUrkUf89wM2mZcy8ty4qkjc7Hr/
	HU4lNoNsA7j0VJly/e3tEzo3GxprhpjElMdOqJhDT2VTDp7osEkthv4A+CqwjpdY5BVM1vKyiVf
	WPYEPH16GQ5TqpJkU1s6wmG7GcmGAi4Xm6DjZ1qY0h7TUPyPdqlA==
X-Google-Smtp-Source: AGHT+IERmM5mpJUL5+COkgMNwZDlO8gj1cFeRcvQbW8L339YKMkWPW9Lp8tje21QCwG1r2XjJ4Vdug==
X-Received: by 2002:a05:600c:3556:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-47d84b3b3d7mr237933285e9.25.1768291832386;
        Tue, 13 Jan 2026 00:10:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080::fa42:7768? ([2a01:e0a:3d9:2080::fa42:7768])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed9feb7d6sm9589145e9.6.2026.01.13.00.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:10:31 -0800 (PST)
Message-ID: <11158d95-4a96-4343-a099-a2a26f6ad589@linaro.org>
Date: Tue, 13 Jan 2026 09:10:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: qcom: edp: Fix NULL pointer dereference for phy v6
 (x1e80100)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Val Packett <val@packett.cool>, Vinod Koul <vkoul@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260109045214.5983-1-val@packett.cool>
 <bc08f938-a315-4797-931b-5c11d402670b@oss.qualcomm.com>
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
In-Reply-To: <bc08f938-a315-4797-931b-5c11d402670b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/9/26 11:49, Konrad Dybcio wrote:
> On 1/9/26 5:50 AM, Val Packett wrote:
>> For Glymur SoC support, the com_clk_fwd_cfg callback was added, and a
>> stub implementation was added for the v4 of the hardware. However it
>> was omitted for the v6, causing a NULL pointer dereference oops on
>> Hamoa/Purwa (X1E/X1P) SoC devices. Fix by adding the appropriate stub.
>>
>> Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-edp.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
>> index 13feab99feec..a17492db21d8 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
>> @@ -613,6 +613,11 @@ static int qcom_edp_phy_com_resetsm_cntrl_v6(const struct qcom_edp *edp)
>>   				     val, val & BIT(0), 500, 10000);
>>   }
>>   
>> +static int qcom_edp_com_clk_fwd_cfg_v6(const struct qcom_edp *edp)
>> +{
>> +	return 0;
>> +}
>> +
>>   static int qcom_edp_com_bias_en_clkbuflr_v6(const struct qcom_edp *edp)
>>   {
>>   	/* Turn on BIAS current for PHY/PLL */
>> @@ -758,6 +763,7 @@ static const struct phy_ver_ops qcom_edp_phy_ops_v6 = {
>>   	.com_power_on		= qcom_edp_phy_power_on_v6,
>>   	.com_resetsm_cntrl	= qcom_edp_phy_com_resetsm_cntrl_v6,
>>   	.com_bias_en_clkbuflr	= qcom_edp_com_bias_en_clkbuflr_v6,
>> +	.com_clk_fwd_cfg	= qcom_edp_com_clk_fwd_cfg_v6,
> 
> Let's just point it to the existing qcom_edp_com_clk_fwd_cfg_v4

Yes

Neil

> 
> Konrad


