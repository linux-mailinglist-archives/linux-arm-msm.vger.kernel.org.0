Return-Path: <linux-arm-msm+bounces-98526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPlYEvTEumkNbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:29:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D98B2BE397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:29:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 69BB130BA205
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F733E5EFB;
	Wed, 18 Mar 2026 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPJq7Ti/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F13E639E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773846465; cv=none; b=RpZAPoIwMs/TL7R0gTqxgrZJ7D/gGIdikYA9kP6zfSuIB2vFelkmIbSskvS2gd/jsKiwg0jdabt7Hoq0N1X1Cw7N4nTqncbqZGiHN8Aac7Dei4/qOY5AoA3U5hE3m6yTNfkbBWZsZWABjvnI/oSnJlRkMia+vnmZefhh36eCf8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773846465; c=relaxed/simple;
	bh=ZoSHeT77078Iqbf3FZtOdYfRFw1inc0RQItH6XSpU7Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PfXMTIaehXkNeV2oBL3J3HxMlshT3jMVM95hOg0Pwdr8iF2ZrYlXjszgQj0/cTy8+9SxSNWWBk6JfnYOy59RHAtoaluT7iVxza9x75P3RWrb2pFalDlfQrEBI2lQSOGnKilraoiFm5PB9b1y15ZAcSjKJ3hE2WUzbWNpgsrBlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPJq7Ti/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so78372185e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773846462; x=1774451262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFLt/AnnZVIYBmUJ6Ma21B1/LPas1wfia2xtndFkX+Y=;
        b=qPJq7Ti/y39NCs3h5WZh/crMMRF4z8fi1mIqGXfpWF/xOf6toaQP7QvbgQr58R+2V9
         auKX9ppcjfsGvKMcjPUied9NMyBvry/aPB0gr+YMhbS54/9hNYRhXMm+52GgzT/ZrR2o
         lGdnnf5VKFhf6vY0fw/UOQEet7sQjQBRh46FvFjeUX36hJkpil5pJ1TCnY/K7OEXaMVT
         jVUGX7tzBVopUrCMrsFpZ97FVHq7gJYR+mcMqF+wjySPSgLxODxg+r4HYLXgZ858Fckw
         KFYnyelL1yQP57t91voKufOKcAn+x+Z7ys8+XcRGW2aa4n3K1qvB5mO7JPyC+fNmtCh0
         1HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846462; x=1774451262;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFLt/AnnZVIYBmUJ6Ma21B1/LPas1wfia2xtndFkX+Y=;
        b=JPi4dpapgnYlVoEhWw1bWkW5i3a+WYs1XlmuEXXPhCaiz0IX/nrJ2YGJxah/JiKGjQ
         VJmaOKZ3nO5myrKzjNBorEgjLQdbOVqB/TJ/po6pzi9j6HEpT317WGB+fRpvQpWAOv/X
         i+FhLl4/6l/3cIn8DgxeExENCCXHlzNsP+XTWzrq+zgQKffRfHnRHXq/Mc8ihrRXeNNv
         1GIgHtmrQV/rjbmMV1or1ZY8DIaUvHiQdT6WF/kqHpu86RmB+k7cxkiODaOoeCizqBPa
         jjGS6sHpmW7omqXFY46bjNbpWiMrj1CnKOSQ874mN3qsfWO2reV5Uawig8G3f0yRyxY9
         Yh4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWL7BragS3d3V0UIFBfqGRlulWhplANB96HKzE/2dmcE4WemulcqjGA+yYA/hz/HC4C7f0SKveWQiOiGDXE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo0JdyDVZVHrU+XkOMONj7LTwIXlGpgp3muKV+XdRBBNB3QWr9
	4Gb5uq1yLl6evC+wNxZYMMniYdsKFaR7s0iARnsvx4FNAXklKbWtUMp4qG9k92MLcYc=
X-Gm-Gg: ATEYQzy2tykN9VlzBLj9GLihyKnm7Bf4bFSygjwaPLJp33lHbAA5lqWoObbmLVChEG4
	JDGovs6/sJKdJjBKeLydxgHFzgkRd9NdzJfmSHjwbCW2vB8tNcYOjSeuR8RFuAY+uSzm/CDs4A5
	wmH6APc4frsCfn4RhHdi1qYjMWxB9y1q4e0rAX4NeAM3Qdeac4f0aQ6MvYzZ5BGeBZqJewa2uk5
	XQ7Pp3xjp+efcRQG9g09s5w+/kipmu7EacSlscTOTvkygFrGj7ecoYYJK/LYxE+dRB7EJM+LCak
	vrDydCnMb/S/h+mdLhrfr67kPnZ8i2MHM1Y5XwY8w2Y+JnQKaNXIoXmcNU0+qfDs5VM/ifz8Alw
	iC1cDxMszGnYsT+zcxSGbIHYAGBrQ19GtpDitI5pUSehbqOzzbcJF4dIFGPdXev7M2MKqXeAIBi
	DDCsCD5qQT/BAxDgDI3rRXWIvpl5GkWzsm6/9X5TqJLNvHYOnNr53kmKjpmNmK7PZV0LYWN0kOH
	peoYI8=
X-Received: by 2002:a05:600c:698c:b0:485:3ca4:4ef4 with SMTP id 5b1f17b1804b1-486f4437560mr59882285e9.9.1773846461614;
        Wed, 18 Mar 2026 08:07:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0? ([2a01:e0a:106d:1080:ac75:790f:ef3c:2eb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4618e42sm23287495e9.6.2026.03.18.08.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 08:07:40 -0700 (PDT)
Message-ID: <16b10f17-ecd3-4cdd-ac3f-f64127d60ace@linaro.org>
Date: Wed, 18 Mar 2026 16:07:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-2-90c09203888d@linaro.org>
 <3f11de22-b729-4d06-b6c8-18e649e1979c@linaro.org>
 <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
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
In-Reply-To: <80ddc2b4-d6f8-4e8d-a45e-69c05d100aa2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98526-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:replyto,linaro.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6D98B2BE397
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 14:17, Bryan O'Donoghue wrote:
> On 18/03/2026 10:15, Neil Armstrong wrote:
>>> +    /*
>>> +     * phy_configure_opts_mipi_dphy.lanes starts from zero to
>>> +     * the maximum number of enabled lanes.
>>> +     *
>>> +     * TODO: add support for bitmask of enabled lanes and polarities
>>> +     * of those lanes to the phy_configure_opts_mipi_dphy struct.
>>> +     * For now take the polarities as zero and the position as fixed
>>> +     * this is fine as no current upstream implementation maps otherwise.
>>> +     */
>>
>> This is wrong since you loose the lanes mapping defined in DT, which is still in CAMSS
>> but is a PHY property. The lanes layout is not a property of the CSI controller,
>> CSI controller only need to know the lanes count, and not the layout.
> 
> Lane layout is a PHY concern but, the PHY API gives us phy_configure_opts_mipi_dphy which should be extended to provide layout and polarity. This would then be of benefit to more than just qcom/camss.

Why ? the only concern between a controller and a PHY is the lane count to calculate the bandwidth, the actual pin layout is certainly not a controller concern.

> 
> Right now none of the CAMSS users for this driver depend on any other mapping and I propose a separate series to fix phy_configure_opts_mipi_dphy rather than introduce data-lanes to DPHY.

None of the upstream users of camss.

The problem is even larger, as you replied in [1], the csiphy is still exposed as a media element from the CAMSS driver, this means this driver is not complete,
it should be a media driver entirely with eventually an internal PHY aux driver, but this would be entirely implementation specific.

Either the PHY is standalone and the PHY consumer only calls phy_open/init/configure/power_on/power_off/exit, otherwise it's not a fully standaline PHY but a composite device like here.

I propose that you write a proper media driver for the qcom csiphy, which eventually spins a PHY driver as an aux device.

Neil

> 
> ---
> bod


