Return-Path: <linux-arm-msm+bounces-58885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF51FABF490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2891316D848
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6445A2638A3;
	Wed, 21 May 2025 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="grJL9NXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF74236A8B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831390; cv=none; b=EDujITDnY2CSUXtXwcxYv6yl5kWa8AkdlMfifeDGz14bEb0p8LKiedhQfFN0QE23YbMp7sPtwCtmflYOrqw0tbtKegBE0FXCjYbnaYyFeJnuA6YGhZamUHyMOqsaf5zdf2fyho62LVGgSfL2hlWZNQz4tGSMpc0S+hsTW6XUj1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831390; c=relaxed/simple;
	bh=4Nfdjo7U/R1hnWKVkBbsT6n6NMMwY5GJ+8aptBW0JEw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YYHbMclEWS0A7q85pIBmvSIRiG0vdZ9YrI6w1St5pUnlBxQ67kMSVRXqc80Fmzlip8svFCaSYpcClyO5H4GCVKkA6Js5LDJej0yO2MVpF1NHeUrdLndmbHoggzJy3QAvvyGF4nsm3SfZSCT7InuqvwW6bk5L7BkB6ZiDj7PgXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=grJL9NXA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so83788785e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747831385; x=1748436185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WI5PoJxy96uWl5f75YFdyVxVfp6nrVQ06CpDL3zHu6Q=;
        b=grJL9NXAsVLSEUZogZoo5fwrdPpH8Toe0JIRFicjkr7F5goSO/YId2GP+ax+P9E2Ax
         KzZ9A2PMcM3e5csc3USuNPNjkJ/WbgVCF2i+ZBOhr6FrGVaBI7SOUwJpZJLsG54Y0weC
         SxE/jto7D7Pjgh5wJVsId+RjRKDP0ffn6N2tvi+3ggv2DUamGQJXm+DnCMSXqjs5LVAc
         Gpctt5UJoAm0SDlOGYNx3DOH9WY/nH0bBhVD00i/Td3sU4VotqOW3X5/UpCjFk18PI0S
         Vq1CF2cRhwGfOjX4gtgS/N3H31bMhoGc3NuIKhIKbdc+h3geVuTZsf7CKVyna5ulxBpI
         TfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831385; x=1748436185;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WI5PoJxy96uWl5f75YFdyVxVfp6nrVQ06CpDL3zHu6Q=;
        b=JLc9+rOzsgiJttFtSL8czrH8yezvJPg1Th5HXsPlVbTRPNvM+C4VjhiI3t8YpIgqrE
         BIzB9Dk/g2X9HlFU/33nI6VIfRjWZJRey/ULqfhPznARyf86qrL0mUMrHPbR+X/YgE/2
         KKj35ZBkbir30W4UgT+khbmR0HJn9j0AGi0MipLmS5cUVPXCFRhPFugnzgmN2T1zT8TZ
         eMYMGHHo+MwAcCmcyXCrL/6+w1bE6GUk/WZ7HN9l2JcsjshRUOV9U9XXImOODjEllqLw
         kBn+8QSxOVj2MQQrL/z8PuXvb2vWRaU88VrEcsJolE89jLtqBJ1knyVZRYXkHbyeM45I
         7ASw==
X-Forwarded-Encrypted: i=1; AJvYcCX6CF5pCQCKX+ra5CnBmokJ85pQosifQeX90NzqYpnz+alvm/qZJBrwyLDYeisdi4/xeLl3VA6U42zD0yZ3@vger.kernel.org
X-Gm-Message-State: AOJu0YyuiWvtlVuRLUu7KMdQ4c0eeL+/iUf/K0uKDFs48EIo4EN09mUC
	MtXOQMBvfxuOI+OT1rdJpcSWSQvy5dmgJS6BwHOzTc2hOheHNc/Fw8ceX90JpNG/Rqk=
X-Gm-Gg: ASbGncseJcQ23afDdQWwdMjyijwIE7gZIOUuwqvQY3trh6VEwpV+iOmNBjpJLxIINxR
	BfZ2yq8md75LrMIiWrG8gq2uTGeGXOY6OEsQ7Y3TbA8K2asI3CZF+uv6Rxqy+MxXZePIh/jZFbL
	J/loJYF60Bbfv1+hZt9jMNh4HwoXL5MTghQz3mu7gv3kOnO5be41X6lu2wn+C1XunRhaIM57ZRC
	Wvxl+w4tVLP3kDZRg4CMP7oeO6quoKHUfj7kNr0qxJZxwoKmQc9FtYjgm3Hz14CWLU1t24aI5ch
	V6KF/0PpNdpTPFb+GuTa+Dx4fJ97ep2F081H1MUBWNmHi4te4no3rkIm0kcIqt5xQEjqIrYAjNc
	2lB5E5ol9ey1NCvyJ4WsoaDLWCdNK
X-Google-Smtp-Source: AGHT+IFQ18d8pZSDqB/VT7oEO/bp9Dn+8qAFnGv54kCnHZJEQfRsbBOpN6ws67q8Y7sy8IUfkW9k9Q==
X-Received: by 2002:a05:600c:a016:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442fd622c81mr209724965e9.8.1747831385316;
        Wed, 21 May 2025 05:43:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:80b6:c1af:bc94:958d? ([2a01:e0a:3d9:2080:80b6:c1af:bc94:958d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm65925785e9.36.2025.05.21.05.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 05:43:04 -0700 (PDT)
Message-ID: <d455a8d0-0a43-4bb5-8592-f22f1835a3c6@linaro.org>
Date: Wed, 21 May 2025 14:43:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: Add support for Oneplus Pad
 Pro (caihong)
To: Pengyu Luo <mitltlatltl@gmail.com>, konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <e4d65994-89dd-4068-a8db-050e698f9bb3@oss.qualcomm.com>
 <20250521083746.666228-1-mitltlatltl@gmail.com>
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
In-Reply-To: <20250521083746.666228-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/05/2025 10:37, Pengyu Luo wrote:
> On Wed, May 21, 2025 at 5:54 AM Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 5/20/25 6:42 PM, Pengyu Luo wrote:
>>> The OnePlus Pad Pro is an Android tablet based on the Qualcomm SM8650
>>> platform. Its device codename is "caihong". This patch adds an initial
>>> devicetree for basic functionality.
>>>
>>> Currently working components include:
>>> - Backlight
>>> - Bluetooth
>>> - Battery charging (up to 5v 0.5a) & reporting via pmic-glink (There
>>> are many unknown notifications)
>>> - Display panel ([1])
>>> - Keyboard (via BT)
>>> - Power key & volume keys
>>> - Touchscreen & stylus ([2])
>>> - USB Type-c port
>>> - UFS storage
>>> - Wi-Fi
>>>
>>> The following components are currently non-functional:
>>> - Audio
>>> - Cameras
>>> - Charging pump (dual sc8547)
>>> - Keyboard (via pogo pin)
>>> - Stylus wireless charger (cps8601)
>>> - UCSI over GLINK (PPM init fails)
>>>
>>> [1]: The panel is a dual-DSI, dual-DSC display that requires setting
>>>       'slice_per_pkt = 2' in the DPU configuration. The panel driver
>>>       will be submitted separately later.
>>> [2]: Touchscreen/stylus driver available at:
>>>       https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
>>>       The downstream driver has been ported and tested locally, but
>>>       requires cleanup, it may be submitted separately later.
>>
>> I have a Lenovo Tab P11 with a nt36523w (-23, not -32) for which I have once
>> poked at the driver for.. I see the driver you posted mentions -23 as well,
>> please keep me in the loop if you're going to upstream it
>>
> 
> I see. Actually, they share the most part of nt36xxx, but with
> different memory maps. See
> https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/elish-r-oss/drivers/input/touchscreen/nt36xxx/nt36xxx_mem_map.h
> 
>> [...]
>>
>>> +             /*
>>> +              * This memory region is required to initialize the backlight
>>> +              * and display for bootloader. Normally, this region is not
>>> +              * needed. However, due to limitations in the current mainline
>>> +              * KTZ8866 driver, dual backlight ICs cannot be properly
>>> +              * initialized.
>>> +              *
>>> +              * A workaround involving secondary registration was proposed,
>>> +              * but rejected by reviewers. This reserved region is kept as
>>> +              * a temporary solution until a proper initialization method
>>> +              * that satisfies upstream requirements is found.
>>> +              */
>>> +             splash_region {
>>> +                     reg = <0 0xd5100000 0 0x2b00000>;
>>> +                     no-map;
>>> +             };
>>
>> I assume this means "if the bootloader sees /reserved-memory/splash_region,
>> it keeps the display online" - let's not do that, as underscores are not
>> allowed in node names (kernel coding style, not dt syntax)
>>
> 
> Right, without it, BL won't initialize backlight and display. We need
> it to initialize backlight here since mainline ktz8866 won't program
> partial registers properly. If there is no other workaround, I will
> remove it to keep kernel coding style.

Can't you add a simple-framebuffer for v1 and drop all the DSI stuff until
you figured out the backlight and upstreamed the panel driver ?

Neil

> 
>>> +     };
>>> +
>>> +     /* No Modem */
>>> +     smp2p-modem {
>>> +             status = "disabled";
>>> +     };
>>
>> There shouldn't be any harm in keeping this node enabled
>>
> 
> Ack
> 
>> [...]
>>
>>> +
>>> +     vph_pwr: vph-pwr-regulator {
>>> +             compatible = "regulator-fixed";
>>> +
>>> +             regulator-name = "vph_pwr";
>>> +             regulator-min-microvolt = <3700000>;
>>> +             regulator-max-microvolt = <3700000>;
>>> +
>>> +             regulator-always-on;
>>> +             regulator-boot-on;
>>> +     };
>>> +
>>> +     wcn7850-pmu {
>>> +             compatible = "qcom,wcn7850-pmu";
>>> +
>>> +             pinctrl-names = "default";
>>> +             pinctrl-0 = <&wlan_en>, <&bt_default>;
>>
>> property-n
>> property-names
>>
>> please
>>
> 
> Ack
> 
>> [...]
>>
>>> +&i2c_hub_0 {
>>> +     clock-frequency = <400000>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     /* sc8547-charger-secondary@6F */
>>> +};
>>> +
>>> +&i2c_hub_2 {
>>> +     clock-frequency = <400000>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     /* sc8547-charger-primary@6F */
>>> +};
>>> +
>>> +&i2c_hub_3 {
>>> +     status = "okay";
>>> +
>>> +     /* pencil-wireless-charger-cps8601@41 */
>>> +};
>>> +
>>> +&i2c_hub_4 {
>>> +     clock-frequency = <400000>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     /* awinic,aw88261_smartpa @34,35,37 */
>>
>> We have drivers for these!
>>
>> sound/soc/codecs/aw88261.c
>>
> 
> I noticed that. But I have not looked into the sound yet. I may add
> the nodes after test. BTW the mainline one is quite simple compared
> to the downstream, doubting if it is really working
> https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/tree/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/audio/codecs/aw882xx
> 
>>> +};
>>> +
>>> +&i2c_hub_7 {
>>> +     clock-frequency = <400000>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     /* awinic,aw88261_smartpa @34,35,37 */
>>> +};
>>> +
>>> +&i2c2 {
>>> +     status = "okay";
>>> +
>>> +     /* secondary kinetic,ktz8866@11 */
>>
>> You can describe it, the driver sets some nonzero default brightness
>>
> 
> But the backlight framework won't index them, which causes sysfs
> collision when the second instance is registering.
> 
> Best wishes,
> Pengyu
> 


