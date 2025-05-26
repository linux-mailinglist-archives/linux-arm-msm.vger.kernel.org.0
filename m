Return-Path: <linux-arm-msm+bounces-59386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846BAC3AFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F497172A0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE21E1A20;
	Mon, 26 May 2025 07:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XI2kXR7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A22C1DED5B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246185; cv=none; b=pYLoQF/G8z1suYYIrKs+HsXRqKAW1gNtmRvKgY5AN38uJOmoxlMM7+b3z7FHOKuKaL8yUqWTw29HZ0uH5oQ86xd/bNd6qMTidDxu9aPkjd0T1o4Qjsj45/1GDGs0tj+RzPRrlt6BGhKmpGqIBya4wmoC6ORgDBNhJ47Y7fxwClA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246185; c=relaxed/simple;
	bh=rT96umT3UJo4od70CROtSfigxcGHz0gDRlhvpyiLUos=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K/3VSC76oOhoKXMePNA11YH5xMXDJSHtCh+MRBMyt39hHa76GMWiAF6GHbAS8zCU0NfQMgls+dewspK9mbbRUu6xjqcY9QnEjDqNS7koxzYIwkzvlFIXA7oiHIMvlP6mCfFFnUalzpwIPVXZUGBVNsnQW8lNQWUEG/rgQff+oLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XI2kXR7t; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-44a57d08bbfso14552325e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 00:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748246181; x=1748850981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dduT01owytSsr5asNudJ/teBGGdc9J5ofCYmeklonuM=;
        b=XI2kXR7thgJUBTuf8StZJGjQKxQsZu/gVl1IC8iYR+alXs439fT6HnqdR0p+xN4IQP
         IGjNXQS5VDOlaeSNBq3iTA3dXMCSDksRSiIfX42VgdckzCHi9iHz62MYor4fRek+G1uo
         e9HzTPssKPdp6ZpCVnIf4VG3AMS5+wnEyCV1BN7wododgg98LzwfCmFiKiHzFFnUMR0M
         FzN0caGJ/srTheX7VbXenBslSp/RbRA5SdXdnFZ8jRfAzBgcSEKcTkk67BhMP0reX3NK
         XE8JIEod4EyyGfChRgvqOOZhU6dDS9RF96YdPOf6xCw5YS1bXPZ3GHhBH5eS+AvIbXLl
         z59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748246181; x=1748850981;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dduT01owytSsr5asNudJ/teBGGdc9J5ofCYmeklonuM=;
        b=PwyuVixy6/ai4txU1DMfRLMDIg0wnOVH9GNAgHU/A542biulOQZrFU5BBodzjsGPwB
         AI6D2ZePjevu9rZLE3fX75TFIktVL9w9thVVi9dUp0zyzkIVGHOloPUk57GP5j/fEn9O
         WqG263G///ayZ4YC7EzdwgYkHUqPbYBATapqVhYS9DW6R8nXh5gpQCx5wafCUhq8jANS
         d8mS+/cI0EiM+dFkhSQWp98HkleR+jrKn6SnDnNxgs4q77lQWjdFzo/CPBOcjlCTjzPK
         RNEf8LxJTBTuUKRuuFA8BzV3nmuuCVU0q6bzQ/QAjGFoiQfbjCEioHTJ514bMjp+L8T7
         ccOw==
X-Forwarded-Encrypted: i=1; AJvYcCVhfkpm+Wx3BrVjrRIzZ6lD6CKOUOjzB/T2Rx3mk/hAE9bFQp/CU9hUi3n3sdEvrcwxYf1MFRD8FgUB9+JF@vger.kernel.org
X-Gm-Message-State: AOJu0YxNcCCY1Z2zuAzzCsDgMZMy6F6/oaBWmtvir3zOM1B8IPtkDg3U
	nUoGS7vU0Qg2YutdLExJvve1pbKwgZes2bfEzvMh2ml92b+LUdMJ4KMc01et3cY78rE=
X-Gm-Gg: ASbGncsd9hk5O79KRoEHlqt+mfBfR7zczwXRK0UmfGqKruw0oR/xoH+kn0ugzOg2Ax/
	58zpydETKZekwZpBYp9BhbfISvvPMgYirChAPqQNBJEkQ39lUArxKJ7TokZMzwcFSag81Rld8hi
	6+yKIm6681rQJ7KWzR0ep/XY+l6FIJkQHElJS9siOCtwFVZxw/EX1MtYhLodvAGeouXmTeHKhQF
	jBjjjIGzOr6d6ZRx2MgoXOD3so5ffHDdihD17FFcztKDyCaAEUaQuIdoEoogrGReunKPp5+09A/
	Kt3UAvJfvSD0Gy54J0Gl4Lgt5Ahs9mzKCTFDuxUgHW15B7OP1eSzwxibu5tW3nGpRryDnul3JCX
	SyZvnfVepmuXgXztwnMxETNdfzPiu
X-Google-Smtp-Source: AGHT+IGie9E2mDHqhXLLVf8m3fc94zPihdmNh7y738oAz9CJSBp+23Ok6ePY58BDaNgOF19enHZEbg==
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr70098395e9.17.1748246181376;
        Mon, 26 May 2025 00:56:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38142aasm224596595e9.27.2025.05.26.00.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:56:21 -0700 (PDT)
Message-ID: <80df7074-c5b8-4d3b-8265-51bb71e6e1c3@linaro.org>
Date: Mon, 26 May 2025 09:56:20 +0200
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
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <11329f37-e410-4912-84cc-d5bcc01e6715@linaro.org>
 <20250522100605.914443-1-mitltlatltl@gmail.com>
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
In-Reply-To: <20250522100605.914443-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/05/2025 12:05, Pengyu Luo wrote:
> On Wed, May 21, 2025 at 8:49 PM <neil.armstrong@linaro.org> wrote:
>>
>> Hi,
>>
>> On 20/05/2025 18:42, Pengyu Luo wrote:
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
>>
>> Are you sure the QMP PHY and the dwc3 probes ? if one is missing, UCSI PPM init will timeout because it doesn't find the connectors muxes & otg devices.
>>
> 
> I am pretty sure.
> ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying
> 
>>>
>>> [1]: The panel is a dual-DSI, dual-DSC display that requires setting
>>>        'slice_per_pkt = 2' in the DPU configuration. The panel driver
>>>        will be submitted separately later.
>>> [2]: Touchscreen/stylus driver available at:
>>>        https://github.com/OnePlusOSS/android_kernel_modules_and_devicetree_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/vendor/oplus/kernel/touchpanel/oplus_touchscreen_v2/Novatek/NT36532_noflash/nvt_drivers_nt36532_noflash.c
>>>        The downstream driver has been ported and tested locally, but
>>>        requires cleanup, it may be submitted separately later.
>>>
>>> To test this device tree, follow these minimal steps:
>>>
>>> 1. Build the kernel. Ensure that all `compatible` strings used in
>>> this device tree (or any included dtsi files) have corresponding
>>> drivers enabled in the kernel configuration.
>>>
>>> 2. Creating boot image
>>>
>>> Merge the kernel and device tree blob:
>>>
>>> cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/sm8650-oneplus-\
>>> caihong.dtb > kernel-dtb
>>>
>>> Then create a boot.img:
>>>
>>> mkbootimg \
>>> --base 0x00000000 \
>>> --kernel_offset 0x00008000 \
>>> --ramdisk_offset 0x01000000 \
>>> --second_offset 0x00f00000 \
>>> --tags_offset 0x00000100 \
>>> --pagesize 4096 \
>>> --header_version 4 \
>>> --kernel kernel-dtb \
>>> --ramdisk some_ramdisk \
>>> --cmdline "some comeline" \
>>> -o mainline-boot.img
>>
>> Isn't image version 2 working ?
>>
> 
> Yes, '--header_version 2' works, I followed the version of stock boot
> image. If there is a rule to follow?
> 
>>>
>>> 3. Flashing the boot image
>>>
>>> fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
>>> fastboot erase dtbo
>>> fastboot flash boot mainline-boot.img
>>>
>>> See also https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=39c5963
>>>
>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>> ---
>>>    .../boot/dts/qcom/sm8650-oneplus-caihong.dts  | 960 ++++++++++++++++++
>>>    1 file changed, 960 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
>>> new file mode 100644
>>> index 0000000000..93aed47e10
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650-oneplus-caihong.dts
>>> @@ -0,0 +1,960 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Based on Qualcomm Reference Device DeviceTree
>>> + *
>>> + * Copyright (c) 2023, Linaro Limited
>>> + * Copyright (c) 2025, Pengyu Luo <mitltlatltl@gmail.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>> +#include "sm8650.dtsi"
>>> +#include "pm8550.dtsi"
>>> +#include "pm8550b.dtsi"
>>> +#define PMK8550VE_SID 8
>>> +#include "pm8550ve.dtsi"
>>> +#include "pm8550vs.dtsi"
>>> +#include "pmk8550.dtsi"
>>> +
>>> +/delete-node/ &adspslpi_mem;
>>> +/delete-node/ &hwfence_shbuf;
>>> +
>>> +/* No Modem */
>>> +/delete-node/ &mpss_mem;
>>> +/delete-node/ &q6_mpss_dtb_mem;
>>> +/delete-node/ &mpss_dsm_mem;
>>> +/delete-node/ &mpss_dsm_mem_2;
>>> +/delete-node/ &qlink_logging_mem;
>>> +/delete-node/ &remoteproc_mpss;
>>> +
>>> +/* Unused now, and reusable, taking 144 MiB back */
>>> +/delete-node/ &trust_ui_vm_mem;
>>> +/delete-node/ &oem_vm_mem;
>>> +/delete-node/ &qdss_mem;
>>
>> Are you sure QTEE won't use this ?
>>
> 
> I am not sure, but these two VM nodes are never referred by any device
> in the downstream DT. QDSS and coresight things are unnecessary on the
> retail devices.
> 
>>> +
>>> +/ {
>>> +     model = "Oneplus Pad Pro";
>>> +     compatible = "oneplus,caihong", "qcom,sm8650";
>>> +     chassis-type = "tablet";
>>> +
>>> +     aliases {
>>> +             serial0 = &uart14;
>>> +     };
>>> +
>>> +     bl_avdd_5p9: bl-avdd-regulator {
>>> +             compatible = "regulator-fixed";
>>> +             regulator-name = "bl_avdd_5p9";
>>> +             regulator-min-microvolt = <5900000>;
>>> +             regulator-max-microvolt = <5900000>;
>>> +             gpio = <&tlmm 90 GPIO_ACTIVE_HIGH>;
>>> +             enable-active-high;
>>> +     };
>>> +
>>> +     bl_avee_5p9: bl-avee-regulator {
>>> +             compatible = "regulator-fixed";
>>> +             regulator-name = "bl_avee_5p9";
>>> +             regulator-min-microvolt = <5900000>;
>>> +             regulator-max-microvolt = <5900000>;
>>> +             gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>>> +             enable-active-high;
>>> +     };
>>> +
>>> +     gpio-keys {
>>> +             compatible = "gpio-keys";
>>> +
>>> +             pinctrl-0 = <&volume_up_n>;
>>> +             pinctrl-names = "default";
>>> +
>>> +             key-volume-up {
>>> +                     label = "Volume Up";
>>> +                     linux,code = <KEY_VOLUMEDOWN>;
>>> +                     gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
>>> +                     debounce-interval = <15>;
>>> +                     linux,can-disable;
>>> +                     wakeup-source;
>>> +             };
>>> +     };
>>> +
>>> +     pmic-glink {
>>> +             compatible = "qcom,sm8650-pmic-glink",
>>> +                          "qcom,sm8550-pmic-glink",
>>> +                          "qcom,pmic-glink";
>>> +             #address-cells = <1>;
>>> +             #size-cells = <0>;
>>> +             orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
>>> +
>>> +             connector@0 {
>>> +                     compatible = "usb-c-connector";
>>> +                     reg = <0>;
>>> +
>>> +                     power-role = "dual";
>>> +                     data-role = "dual";
>>> +
>>> +                     ports {
>>> +                             #address-cells = <1>;
>>> +                             #size-cells = <0>;
>>> +
>>> +                             port@0 {
>>> +                                     reg = <0>;
>>> +
>>> +                                     pmic_glink_hs_in: endpoint {
>>> +                                             remote-endpoint = <&usb_1_dwc3_hs>;
>>> +                                     };
>>> +                             };
>>> +
>>> +                             port@1 {
>>> +                                     reg = <1>;
>>> +
>>> +                                     pmic_glink_ss_in: endpoint {
>>> +                                             remote-endpoint = <&usb_dp_qmpphy_out>;
>>> +                                     };
>>> +                             };
>>
>> No Altmode display ? no SBU mux nor redrivers ?
>>
> 
> There should be a wcd939x_i2c@e, it will be added after I figure out
> sound things. Actually, I added it locally, it does not work. Since
> its name is wcd939x, it made me feel it is for usb dac handling only.
> I never checked it carefully. But you mentioned this, I just checked
> downstream bindings, it says
> 
> QTI WCD9395 Device
> 
> This device is used for switching orientation of USB-C analog
> and for display. It uses I2C communication to set the registers
> to configure the switches inside the WCD9395 chip to change
> orientation and also to set SBU1/SBU2 connections of USB-C.

The WCD9395 has 2 independent functions on the same die, one
as a codec and the other one as an SBU mux for Altmode and audio
headset. They are representd as 2 devices since they have 2
separate communication ports (one is i2c, and the other is via soundwire)

Neil

> 
> Thanks. I will check it again.
> 
> Best wishes,
> Pengyu
> 


