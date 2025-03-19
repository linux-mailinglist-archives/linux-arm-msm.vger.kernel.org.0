Return-Path: <linux-arm-msm+bounces-51949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD5A68C0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45A2F4604EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45325254AED;
	Wed, 19 Mar 2025 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTxYJ1/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D40C254860;
	Wed, 19 Mar 2025 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742384524; cv=none; b=JkCkjJRoZLPRVcwK4ozklDBcN05Rd25SdS8Wspn3cDJzweGPm377FavlwX99l/sdnguWJj6Hhw7WF/xwNDQhFeWkAuPe20OkQJlT/MRkUa6QKmMu8U/hJ9PUGKZXBpu/So6c5B4PQXjTFTG5WroaKrtebMLbY6+EZKHUUn7HC0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742384524; c=relaxed/simple;
	bh=2K804DlnfHJBC1iz5uN9VvwcF1NWwpdu3Ut4OczOKjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6q8Zkrzwac8Pq1oH0NxEMM2YVIo2IcZsAX2/bfFgv0CISPrFN8+1JPObTbkhoOK0lGESJuq65KP+rc8Kdbppc9jXAZtOSSG8kTA9jZyZnYbzkFvAtNeTVRbP0j+LFyA8RhXeoyHskKuW5hrZfKUStipTGIkgld77xxidq3TB6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTxYJ1/q; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so31084805e9.0;
        Wed, 19 Mar 2025 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742384521; x=1742989321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+TU65vbu1/jXurIViozymomrJ8y6tyjAhqqoeO6eX0=;
        b=JTxYJ1/qGLpdeW1tY/X5cAahR3C3C64sisWZsvxybGY1dnQgq1xJSWop0xJz2m+xkp
         BdQI22A8fxsuZitQWs/HpLgAqRuvJntGA7fMfwKCTkD8CnL8WnkH5OqS/c23hscbXhQa
         r6RgAAWXsL+noptxEnuWIr7j2XAp8W4aoKBwr0UsqKeAFC64+XTZpvaoUWz9FuNETsy5
         mB+uR6fZxv1lhV+YI0k8ZWEXbWD+xSjsMlczl7+AAW3P009m50UvAuG4cqdxNhlwagzu
         LF9QzQak2FnMHudoBsqh6T9HPqmSd8XSO+dDYjF9jTXAchIwqZ7zww/0G+25kMaMbxOf
         BgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384521; x=1742989321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+TU65vbu1/jXurIViozymomrJ8y6tyjAhqqoeO6eX0=;
        b=jD3l/TVDGLiawlLQMXosilAF+bqf1gIP5uMV9NbJShotq0CXuA99UjIUBSw2+jlHt5
         GJwi6biYD/wG7NxOvNI74aCSYsWIT7m13x/bVvVKHMXqexyQpJPoK1yenSIwJuHf4dP/
         7w9EDpaVGtVkpjLaO7JfdOMJkh75fhnlw/1dMDYU17d9I642rfELCAJjZ5ltjl82kCKp
         IiAMnE0+hWbyzlvdO1421LVeQ64O8B9UaZZk81ABMlzPYlfJlU89RD4Ct4jYq4V+ZGGN
         QqE4l9y+Ng2Glp+8R7ryrFh8CoRKkqTvHnce+Yzp4aUPlzZlNL2JjHMQDEq7dNUKK0s5
         nN2g==
X-Forwarded-Encrypted: i=1; AJvYcCUP/f8hdngsmuDG74oUKvBVUlJzveN79glc2TlaBTuCe/8WAY7/Nn4Nv1WiccZu3VBa6ehyuhg6J07tDdFUbg==@vger.kernel.org, AJvYcCVbzRFdsa9ckxadnKtttvpqOJeXsVpsY1dqeedsVh9UDoUqrto2k1JAFas3+XsgSbVvYBI15iQvL0T0+9kX@vger.kernel.org, AJvYcCXFblPVLHKCzv3KP9Mm0fYrr0hiDcrwzX7dv6WENV1nkntXpvsxGu+hKzdmubi07+1F0q2XI8kl6hdD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Qn8pQOW3/PytNgSWVVU6eHYunM/KCN3lzj07ezRTCwQvjZqo
	125K3wX3kdU8OOyJS4+jRu2n8fhkR+CUa7QN3YJBeYrZlmBmXanl
X-Gm-Gg: ASbGncuvhsjmpVGFB5GpPTuqpW2/i/vt+iKMcOCh0+mCl3RYKHFryzdqmN2ceD04x5v
	n6RTxUjogmSp7HMoIKJDc3BYm0gEhl/jJ2/mdEd9R1stM0hZD8VfxStweBhO62DW8yJT5h1y+vZ
	WPppnougA9dZTC7rNBot15oHXAZ+KlZKM+U9DK/NGLBL8wWGIx0LVzbxhwF8pIBYaJMT368vjmz
	2CnOU6Q6/5XvHnNH0b3V0fa51mkl5mk5pVFdAwpUXMrKw2x53O00T1/pN/9w5irEoe3HSSlpmXI
	v7mc37BwFXprJrCaL3+ekVOOyb/IuAA3UedH10Njv6nr5jOpnzVXl2D069mSlx/NASlSawSxduA
	gXJUpxODStyEis1n/nnQ2XCw=
X-Google-Smtp-Source: AGHT+IFywsl9y7ebNfImSsuSeRCQjDn2pZoC89iOcbWE3Jn5XpbRxM2xF4kr9OnVwSO3zLjsCDSNow==
X-Received: by 2002:a05:600c:35d2:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43d437930eemr18264585e9.10.1742384520414;
        Wed, 19 Mar 2025 04:42:00 -0700 (PDT)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df33aasm20407235f8f.2.2025.03.19.04.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:42:00 -0700 (PDT)
Message-ID: <295bd48c-940a-4944-ab3b-ab7cd46e4fef@gmail.com>
Date: Wed, 19 Mar 2025 13:41:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: qcom: phy-qcom-snps-eusb2: Make repeater
 optional
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250318-xps13-fingerprint-v1-0-fbb02d5a34a7@oss.qualcomm.com>
 <20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com>
 <6yykvszzbhonc3dkwhva55arsdvp4hv4p2fo2vv6ftwr46httm@wnofgs4jaqaa>
 <Z9qd1GJ1418CbaOt@linaro.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <Z9qd1GJ1418CbaOt@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 12:35, Stephan Gerhold wrote:
> On Wed, Mar 19, 2025 at 12:20:07PM +0200, Dmitry Baryshkov wrote:
>> On Tue, Mar 18, 2025 at 10:22:56PM -0500, Bjorn Andersson via B4 Relay wrote:
>>> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>>
>>> In a multiport configuration based on the SNPS eUSB2 PHY it's not
>>> necessary that all ports are connected to something.
>>>
>>> While this is allowed by the Devicetree binding, the implementation
>>> current fails probing for such PHYs, which also prevents the multiport
>>> controller from probing.
>>>
>>> The lack of repeater does not alter the fact that the PHY is there and
>>> attempts at describing only the used PHYs in Devicetree results in
>>> failures to initialize the USB controller.
>>>
>>> Make the repeater optional, to allow the these PHYs to be described in
>>> the DeviceTree and for the associated multiport controller to operate
>>> the other ports.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 10 +++++++---
>>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
>>> index 1484691a41d59a7eaf257ef44300827c668bf7e0..8897d2072ccfcaa5b4a510c17761dcdeed5bad0f 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
>>> @@ -401,9 +401,13 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
>>>  				     "failed to get regulator supplies\n");
>>>  
>>>  	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
>>> -	if (IS_ERR(phy->repeater))
>>> -		return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>> -				     "failed to get repeater\n");
>>> +	if (IS_ERR(phy->repeater)) {
>>> +		if (PTR_ERR(phy->repeater) == -ENODEV)
>>> +			phy->repeater = NULL;
>>> +		else
>>> +			return dev_err_probe(dev, PTR_ERR(phy->repeater),
>>> +					     "failed to get repeater\n");
>> Can you use devm_of_phy_optional_get() or devm_phy_optional_get()
>> instead?
>>
> There is such a patch from Ivaylo already [1].
>
> @Ivaylo: Are you planning to re-spin that patch set?

Yes. I've spent the past week digging deeper into how my hardware works,
as well as improving the patchset.

>  Might be even worth
> putting that patch first / sending it separately, since Neil pointed out
> there that the bindings already have the repeater as non-required.

That's going to be... quite a bit of work. I have around 6-7 patches for this
driver alone, including moving the whole driver to ../, so moving this patch
to the front will be annoying.

Best regards,
Ivaylo

>
> Thanks,
> Stephan
>
> [1]: https://lore.kernel.org/linux-arm-msm/20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com/


