Return-Path: <linux-arm-msm+bounces-90788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0InADWHMeGmNtQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:32:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41695BD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CA623041BCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 14:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7459354AF7;
	Tue, 27 Jan 2026 14:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BrMXogmN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71F359F8F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523971; cv=none; b=d9PmmGo3roH59HWOnNYEc4G5a8gd0dTeZ/9kvQoYq1ONlXIEt/my09t0crLKTI0HMsVMzX9zNd6LPgtshjtj87qNKqJ6UwWtjLEhFcw7mHMY7eeYy1khz/GwVExuXv4MgE+iP8HXZu6WZ5xW6zySIaJg6ElonFhnUOkxelQhoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523971; c=relaxed/simple;
	bh=5585Y68mzHOEd0CBGfXnmmbGaV7ZhO1rIRfH3uZySm8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=F9+BVygwEnkPU9OgyWqtjV/QfD6j+e6q9wDcLY16RydBsXQEJ9hTWgIoWMwtoxYECP5+6r+eyKWNf8HPoYiY2ufNscPoMhfKnqeSyTHETA7s+v3zkg4hNTAxL9GUFEQtr21odQ9BRJ8iH5+tPwFolXnJU+Mj62I4JfWgQ6gJeAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BrMXogmN; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso50627805e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 06:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769523968; x=1770128768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjwjvW1TfSwNKp13nluNXuupXNtMKRFXmr36DD91OKs=;
        b=BrMXogmNzgc2i+sKFHo3U40vUiXED29PdOfm+VLhAamK+581/JIB6sKJ9gGUe7gWuz
         ndbaqA65yj0FTGKuGdagqimIB2aep9NOL+y4SfoLccMSMbi6vT/fjh0MkbRrYQUv9wUw
         6j+4CxfHlCHPGZbL6bCYb8WwfdyG15OgTIm+9CRWqhMXqZ2i44itnaMS0QUOz3Uu217F
         UAI/HyneKbRGuvevbcolNgv0ZaG3zo+cxjJluWJGLuy7ibZsvq7tEhKetdF3PEjZ7Z3X
         DsYLs832YPGcKbUXbRnwqE9RBAAURYu4uho5xqINjG4NyP0jNmFb/+Tn2UuXZsMshHdn
         4f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523968; x=1770128768;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjwjvW1TfSwNKp13nluNXuupXNtMKRFXmr36DD91OKs=;
        b=n5TEtPNp29cJDoDZHbbFQEa4vFTn925Z2AtDvZ2hAM/eFKp+eMTFcKe+L36uKMDtKY
         Suf24qENufo8WprOZbwNf/b1Rnbk59Ft10sRCxhv781Xmnuo3efErC31ICxg2WyFMtie
         hwV9Zd23AphXMpRWrqk8asDCfC/5f6XQ0IENWJTxdzFrG+GWfbRJ5R1E9XSTOsneDBic
         B64HMfDd9AnbHZJAhSazatzLfveT3Zj4SaSYkbXokE92IVFG0x0QLHnLkwRV7OTUm1r6
         dxkgfnzYbt5+k2FZNG5+cxwWrqlcjFJHBVe6+MR1+bhxlPfacNFsAjLkP/gD43cUFxwx
         qE6g==
X-Forwarded-Encrypted: i=1; AJvYcCXP53O7PkvvMhp45q9K+0kzBjgHHuO7ZLODVGF5yOgZK59TVtSKi2p5Jropfjr6DUYhd1BZEI8S68Z7ozBv@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWPn2Si4f0dcOKAgzC93U+VIlsYRTakT73pL8IzIwFPXs0wrF
	SRwjc4lWNJ4PFZV9/0RJFOewSSTmXimzL0yFWBw1/4bLUa0JC4IJTpyt7qiqWImXx/0=
X-Gm-Gg: AZuq6aJmZfTN9aRdOuotQ5rlF2fL7f/xg2fCm3YvXOmLTNGDHR8iTCH5vxY2cPj9aeV
	3naD4UMxgSYMTgMVUdYpS3yI/6kEfF7NURdBTIjxA9cU/nqzxz3JuQtSV4m1TtvNbjZgrrbVR+F
	fNpmLPqaXsh+5EdC7rhk2FZqIW/W8CZny7cN2qA4cIMc10d3soWCEINKJr9K++HIoogGNAacCaj
	JpxkSAePVBuLsqbWwU+k2Wm18YX1nJjBnEesxINz8K//dnFZTMuzRvmq/s3FNPO+41CTfHV5+UD
	igPfiZvBdhM/0WBhqOgKlSeCPLGcBQ948an56TJxJZTv+XtANPfFSp7WVtRxKnBmDFw68JHADUh
	r5vUzV9PS2mvGlsYFdEoc6O81G6gBHcwN7m+F03pIiK/jU41xft0+LWb33mtXBlRW2IsEOF77UB
	H/Po12oirpcdStPSiMOvO9YhJ1wMXj5dG3hCaIG0RJixb5Ydnz7c8EIiaGHt6jMQE=
X-Received: by 2002:a05:600c:4e90:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-48069ea1029mr22857745e9.18.1769523967879;
        Tue, 27 Jan 2026 06:26:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d? ([2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804f5ad4c1sm124946785e9.12.2026.01.27.06.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:26:06 -0800 (PST)
Message-ID: <3157e5a7-19f3-404c-8842-3f1942de03d7@linaro.org>
Date: Tue, 27 Jan 2026 15:26:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
 <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
 <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
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
In-Reply-To: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0A41695BD7
X-Rspamd-Action: no action

On 1/27/26 15:02, Geert Uytterhoeven wrote:
> Hi Neil,
> 
> On Tue, 27 Jan 2026 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> On 1/27/26 11:20, Geert Uytterhoeven wrote:
>>> On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>>>> which connects over PCIe and requires specific power supplies to
>>>
>>> Here: "requires"...
>>
>> Sorry I don't understand
> 
> Please read below the continuations ("...") below...

Well electronically the IC requires those voltages

> 
>>
>>>
>>>> start up.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>>>> @@ -0,0 +1,55 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
>>>> +
>>>> +maintainers:
>>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>>> +
>>>> +description:
>>>> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
>>>> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
>>>> +  four downstream USB 3.0 rev1.0 ports.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: pci1912,0014
>>>
>>> Just wondering: how does having a new driver
>>> drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
>>> compatible play well with normal PCI discovery and probing of
>>> drivers/usb/host/xhci-pci-renesas.c?
>>
>> In Linux, power control is implemented as a platform device driver,
>> so it doesn't collide with the pci driver.
>>
>> The pci driver won't probe until the device shows up on the bus anyway,
>> so he power control will attach as platform for this purpose.
> 
> OK.
> 
>>>> +  avdd33-supply:
>>>> +    description: +3.3 V power supply for analog circuit
>>>> +
>>>> +  vdd10-supply:
>>>> +    description: +1.05 V power supply
>>>> +
>>>> +  vdd33-supply:
>>>> +    description: +3.3 V power supply
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>
>>> ... but no power supplies are listed here? ...
>>
>> None are stricly required, they can be supplied directly without
>> a passive regulator. Not sure they should be required
> 
> So the goal of this binding is to document the required power supplies
> which are not required? I am confused (but that could just be me ;-)...

but you're right, I'll mark them required...

> 
>>>> +examples:
>>>> +  - |
>>>> +    pcie@0 {
>>>> +        reg = <0x0 0x1000>;
>>>> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
>>>> +        #address-cells = <3>;
>>>> +        #size-cells = <2>;
>>>> +        device_type = "pci";
>>>> +
>>>> +        usb@0 {
>>>
>>> The actual DTS uses "usb-controller".
>>>
>>>> +            compatible = "pci1912,0014";
>>>> +            reg = <0x0 0x0 0x0 0x0 0x0>;
>>>
>>> ... also not in the example?

... and add them to example.

>>>
>>>> +        };
>>>> +    };
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

Thanks,
Neil

