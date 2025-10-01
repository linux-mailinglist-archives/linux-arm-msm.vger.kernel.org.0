Return-Path: <linux-arm-msm+bounces-75630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B3BAF59E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 09:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EC031C5475
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 07:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369162343B6;
	Wed,  1 Oct 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hPleTClS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428411D90DD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 07:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302376; cv=none; b=sIdctdNuAOKEi3BCswHHe4WwRutZg8/9pr8sogXoWX+98SX3m4Of52dZICr1ISlOZgJwNKYb3BlDAmPsqSsIsHq7BTs4YCmKeKBNteXxOnX6I/UtpCe7TVNdh2kfi9SCKUz2OaAVt2+zHwCET0+Pr+bo1UipmQFQz9ElMl5Fv/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302376; c=relaxed/simple;
	bh=X4wJ4IikKM42rl0fBRkgwxXI1MPMbMYj2bbJClfN7Wc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sH5TCXdlsyeZ3lmJuatQEPZhtgnAnURANhwU3BC/H9a2uC9vHwI+YGT4/w+eOFwU19aJycNMtlfc9EVfV6vywcu7BSWkSs7IqJJ0royVqyc9QHj+oZO62HrqLfgRlq1+30L21isiPZYkSTtHBoW5Yp4N1acmYmMRPE9wEVUmumE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hPleTClS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46b303f7469so46809015e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 00:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302372; x=1759907172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvARg4BtLyjXBG/oyTU38XVRM3fscS0RfPUj5chkaa0=;
        b=hPleTClS/WhLEigemD3Mg/Djpie9cuK+Zbac2FTeaZSoJEfEy2sQg/XdPhoRZ72hnO
         Qp+N08FL8L3dMDioBEVyz3wWIB+cNWwhK8nXkU/eNc4oM6h2nLWClosMM3+q8fz8Te7H
         tsqAh8UxTpFImXJFAT35a1PdMUTIifrW2SIB7N23HiEhj56N0YuT9mJMD5vyH2RX+OeU
         iFJdXFMHwdjjW1uJ0utUZOdEBifLW7oW7owfgJCh/+hsPt1A/Vavd5GdQuJMnWn9x+ty
         NplBwgv3legu38ngrkEFw0AqflN+4blShDGy3sbjnpQSAXkTT7ZEx0RWrBAV/id03UvM
         gmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302372; x=1759907172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AvARg4BtLyjXBG/oyTU38XVRM3fscS0RfPUj5chkaa0=;
        b=DYxdejmjlTmnmH037flBEz8amlZE2h44xYQCcBgwphu/F4QU4j7pe7Cy0yqVoVSUFv
         ydMN/lzSZgf9wiEgHv3lpD3Ei2ijq1SkZcXST4EO0URJwfyOsEWI3jdxCu+5gvY73d05
         dQzX763LM4ssmhq5tFvPPB63AGcmgsoVUiGxVx2qyUq+gYkH8Di0PcEBXtaV+XO92UBp
         ipkeSqSnpJq3YvjMnApFN8Inq2DcALFY6hA0NrLJI4GafLAHMdgGx/rIJ6A7wFEjOWNp
         hBtYWSMJkFQTdN6uf37np9XXO7LYnJcc1DuP7pQ2X5mRWKceWWIC2zYoJ0nz9zjgwW4x
         KBjw==
X-Forwarded-Encrypted: i=1; AJvYcCWqUw4dbGNseJuDSOHvi1f4gj0YK5mpkfAenEotXHz8DDqurA9jah5lY6cW/qiV1NXcM3P21/+/2HbzJbf0@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVvWtuKbNnz1KpFAJzMD+XY8LmRp31gJkvsAqxHzNLU269OAh
	HTqITbrGq7w/bDDjnRI5EXIjDlgcEliCvoIkJcCUoRT5v4cGucohKrwFfT9wIHMNkYE=
X-Gm-Gg: ASbGnctms9Xefa8vtEt7RgpFumLt0gmSCl+HEzPZMxxGQGPdhduhxsopfKxFCAE6nrq
	qsupDnufD3+U7AnDc0p17qk7h7P/khu8XBQPQWuxA54R/6SOUCZgXSI4cKs1VjVtKa/Bc/Pf5/z
	evSozYOuXSeXLSfNMjCPiednte+PdWeRdN2a4Q0QlvF3jway/V3MD3JmUdWD2N28fEx/Yu1kyfs
	n/PSUwHTlrxoha3RHvKIwp81OZo7iqtqqvcLRGQhwEmDzD45SbamuzrcNjnp4gZxkWbEebhft1r
	nJ54WyvUfF/Zz1+zyOnfsNxJp8J/117loXLZUWFhR4gO3jsscDdZY7S5BrvXSo9zyvBd0wVVJ6T
	LZ1Zb6VOmYQqhG3IKZeD/pG+Z3MONCl0OxNtpUg7oibYkTC3im0PYJ1LiEA6geQzDRnBCYFlYo9
	w+VagrsRjcz1waarsnnEI61yQ=
X-Google-Smtp-Source: AGHT+IHBO9Z+Uh3slszHAPZuX3C+R/wZHwWLiDZirHkPHFUmv4L7FdIGetheWaVB+ku2T1GmiYZmxA==
X-Received: by 2002:a05:600c:83ca:b0:46e:42cb:d93f with SMTP id 5b1f17b1804b1-46e61279f57mr18248825e9.15.1759302372335;
        Wed, 01 Oct 2025 00:06:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f45f:c590:9006:d394? ([2a01:e0a:3d9:2080:f45f:c590:9006:d394])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c3cad50sm28924565e9.3.2025.10.01.00.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 00:06:11 -0700 (PDT)
Message-ID: <9d020a8e-22d8-4f1f-803c-d00bb912f699@linaro.org>
Date: Wed, 1 Oct 2025 09:06:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/3] phy: qcom: qmp-combo: get the USB3 & DisplayPort
 lanes mapping from DT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250930-topic-x1e80100-hdmi-v4-0-86a14e8a34ac@linaro.org>
 <20250930-topic-x1e80100-hdmi-v4-2-86a14e8a34ac@linaro.org>
 <uozgwot7yuwmaiwmqoo6ickblpqe52tnj44tnxcorygqxwou52@hksvktgq5zp7>
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
In-Reply-To: <uozgwot7yuwmaiwmqoo6ickblpqe52tnj44tnxcorygqxwou52@hksvktgq5zp7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/25 20:56, Dmitry Baryshkov wrote:
> On Tue, Sep 30, 2025 at 09:39:48AM +0200, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> Get the lanes mapping from DT and stop registering the USB-C
>> muxes in favor of a static mode and orientation detemined
>> by the lanes mapping.
>>
>> This allows supporting boards with direct connection of USB3 and
>> DisplayPort lanes to the QMP Combo PHY lanes, not using the
>> USB-C Altmode feature.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 145 ++++++++++++++++++++++++++++--
>>   1 file changed, 137 insertions(+), 8 deletions(-)
>>
>> @@ -4167,9 +4269,41 @@ static int qmp_combo_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_node_put;
>>   
>> -	ret = qmp_combo_typec_register(qmp);
>> -	if (ret)
>> -		goto err_node_put;
>> +	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
>> +
>> +	if (of_find_property(dev->of_node, "mode-switch", NULL) ||
>> +	    of_find_property(dev->of_node, "orientation-switch", NULL)) {
>> +		ret = qmp_combo_typec_register(qmp);
>> +		if (ret)
>> +			goto err_node_put;
>> +	} else {
>> +		enum typec_orientation dp_orientation = TYPEC_ORIENTATION_NONE;
>> +		enum typec_orientation usb3_orientation = TYPEC_ORIENTATION_NONE;
>> +
>> +		ret = qmp_combo_get_dt_dp_orientation(dev, &dp_orientation);
>> +		if (ret)
>> +			goto err_node_put;
>> +
>> +		ret = qmp_combo_get_dt_usb3_orientation(dev, &usb3_orientation);
>> +		if (ret)
>> +			goto err_node_put;
>> +
>> +		if (dp_orientation == TYPEC_ORIENTATION_NONE &&
>> +		    usb3_orientation != TYPEC_ORIENTATION_NONE) {
>> +			qmp->qmpphy_mode = QMPPHY_MODE_USB3_ONLY;
>> +			qmp->orientation = usb3_orientation;
>> +		} else if (usb3_orientation == TYPEC_ORIENTATION_NONE &&
>> +			 dp_orientation != TYPEC_ORIENTATION_NONE) {
>> +			qmp->qmpphy_mode = QMPPHY_MODE_DP_ONLY;
>> +			qmp->orientation = dp_orientation;
>> +		} else if (dp_orientation != TYPEC_ORIENTATION_NONE &&
>> +			 dp_orientation == usb3_orientation) {
>> +			qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
>> +			qmp->orientation = dp_orientation;
>> +		} else {
>> +			dev_warn(dev, "unable to determine orientation & mode from data-lanes");
>> +		}
>> +	}
>>   
>>   	ret = drm_aux_bridge_register(dev);
>>   	if (ret)
>> @@ -4189,11 +4323,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_node_put;
>>   
>> -	/*
>> -	 * The hw default is USB3_ONLY, but USB3+DP mode lets us more easily
>> -	 * check both sub-blocks' init tables for blunders at probe time.
>> -	 */
>> -	qmp->qmpphy_mode = QMPPHY_MODE_USB3DP;
> 
> SHouldn't this still be a default in the 'normal' USB-C case?

It is, I just moved it before the added logic, but the comment doesn't really
apply anymore

Neil

> 
>>   
>>   	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
>>   	if (IS_ERR(qmp->usb_phy)) {
>>
>> -- 
>> 2.34.1
>>
> 


