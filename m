Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA23179E3E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 11:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239306AbjIMJia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 05:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239027AbjIMJi2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 05:38:28 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C9E1726
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 02:38:24 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401f68602a8so71559265e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694597902; x=1695202702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HghA1siuHL9d2wGLlLawICtcF9c56YFhd/CcEs0FY+k=;
        b=iiPKVJSOG3ZGrC6dcr1Ux7U5ou6IYyHd2gQ+DpL/FIVNgQXhElRBlj4laZFzRXPiYC
         A8smT592Q1tHVoXdghgI3BDDE4Kis70VFiprreaPM27JeJfyg+V2V0lOzcN+Gl76R0/J
         4waY9++NJSkROFpXrAy/gpidifh3WxHWp3vns1T7mqIRjIVcpuANFeAW/bKkyVzhGv4+
         +V74+ZI0AOIHMu0K2e6A0BGXo9UGjgnWCgbIncocXHItVKdXhNybM0ZVN8SFAF7D2uaN
         l5aNtaXOS5a5kvXPyXbS1HOSnAMjev5M6rmfuE/c4QkbrP92rG3qe4T7R7f8aVU9dv7G
         //LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694597902; x=1695202702;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HghA1siuHL9d2wGLlLawICtcF9c56YFhd/CcEs0FY+k=;
        b=P0GdODzZ212pfC5wwn7u5LNjdb43da8Z0qfk6LaE8NYr/S20JUAKHuGWeapEjwcpVq
         M/lfVspOMHWRXOq4dQWpK+dOScLoSJiHLPkCDztmXUuS2tF8N/0G6sxohr/3ditSVo6D
         bdoDuvI+pdR6P6d7Efohhbe9cwr6Eion6ym6SDIedsz8IcxTrJcFnfok9j72+ECk8nYJ
         4HqmgtHHYvJXuHCCvTmeVqK7UI6IMipRx+a365on1URaQ/B8nFQqf1mFHJOYun8qJd3A
         QkAJp0QhmWFky7TPe0SXuNSk9E10OfCjPFCZbOEOeh5tjiG3ao+Qzt1qhtYKWsQV8BzK
         0wpg==
X-Gm-Message-State: AOJu0YxIxUzIWqX/IDm9kWH1nPEIqiaueh0D15EIhkRpON7jLyvYIsYr
        hAaTxiMt3kM0PiXwCiK3EDgcfw==
X-Google-Smtp-Source: AGHT+IGzPFZa4ciCM9gg7jqd6a4bYXRlZBRHfHrRnIoKHfsBinXmu8RJMCcG+sl9GZOOhjAlfWeKow==
X-Received: by 2002:a7b:c8c4:0:b0:3fb:e2af:49f6 with SMTP id f4-20020a7bc8c4000000b003fbe2af49f6mr1461695wml.39.1694597902398;
        Wed, 13 Sep 2023 02:38:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:47c3:1e57:f54:3370? ([2a01:e0a:982:cbb0:47c3:1e57:f54:3370])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bca4d000000b003fe4548188bsm1501531wml.48.2023.09.13.02.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 02:38:21 -0700 (PDT)
Message-ID: <a36d7b75-b072-4202-8f09-9eab0dfd52ed@linaro.org>
Date:   Wed, 13 Sep 2023 11:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
Content-Language: en-US, fr
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, Won Chung <wonchung@google.com>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org>
 <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
 <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
 <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com>
 <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com>
 <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
 <ZQBGD8CY5OVKYX63@kuha.fi.intel.com>
 <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2023 19:39, Dmitry Baryshkov wrote:
> On 12/09/2023 14:05, Heikki Krogerus wrote:
>> On Tue, Sep 12, 2023 at 12:15:10AM +0300, Dmitry Baryshkov wrote:
>>> On 06/09/2023 16:38, Heikki Krogerus wrote:
>>>> On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
>>>>> On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
>>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>>
>>>>>> On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
>>>>>>> Hi Heikki,
>>>>>>>
>>>>>>> On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
>>>>>>> <heikki.krogerus@linux.intel.com> wrote:
>>>>>>>>
>>>>>>>> Hi Dmitry,
>>>>>>>>
>>>>>>>> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
>>>>>>>>> The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
>>>>>>>>> dev_fwnode() checks never succeed, making the respective commit NOP.
>>>>>>>>
>>>>>>>> That's not true. The dev->fwnode is assigned when the device is
>>>>>>>> created on ACPI platforms automatically. If the drm_connector fwnode
>>>>>>>> member is assigned before the device is registered, then that fwnode
>>>>>>>> is assigned also to the device - see drm_connector_acpi_find_companion().
>>>>>>>>
>>>>>>>> But please note that even if drm_connector does not have anything in
>>>>>>>> its fwnode member, the device may still be assigned fwnode, just based
>>>>>>>> on some other logic (maybe in drivers/acpi/acpi_video.c?).
>>>>>>>>
>>>>>>>>> And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
>>>>>>>>> breaks drivers already using components (as it was pointed at [1]),
>>>>>>>>> resulting in a deadlock. Lockdep trace is provided below.
>>>>>>>>>
>>>>>>>>> Granted these two issues, it seems impractical to fix this commit in any
>>>>>>>>> sane way. Revert it instead.
>>>>>>>>
>>>>>>>> I think there is already user space stuff that relies on these links,
>>>>>>>> so I'm not sure you can just remove them like that. If the component
>>>>>>>> framework is not the correct tool here, then I think you need to
>>>>>>>> suggest some other way of creating them.
>>>>>>>
>>>>>>> The issue (that was pointed out during review) is that having a
>>>>>>> component code in the framework code can lead to lockups. With the
>>>>>>> patch #2 in place (which is the only logical way to set kdev->fwnode
>>>>>>> for non-ACPI systems) probing of drivers which use components and set
>>>>>>> drm_connector::fwnode breaks immediately.
>>>>>>>
>>>>>>> Can we move the component part to the respective drivers? With the
>>>>>>> patch 2 in place, connector->fwnode will be copied to the created
>>>>>>> kdev's fwnode pointer.
>>>>>>>
>>>>>>> Another option might be to make this drm_sysfs component registration optional.
>>>>>>
>>>>>> You don't need to use the component framework at all if there is
>>>>>> a better way of determining the connection between the DP and its
>>>>>> Type-C connector (I'm assuming that that's what this series is about).
>>>>>> You just need the symlinks, not the component.
>>>>>
>>>>> The problem is that right now this component registration has become
>>>>> mandatory. And if I set the kdev->fwnode manually (like in the patch
>>>>> 2), the kernel hangs inside the component code.
>>>>> That's why I proposed to move the components to the place where they
>>>>> are really necessary, e.g. i915 and amd drivers.
>>>>
>>>> So why can't we replace the component with the method you are
>>>> proposing in this series of finding out the Type-C port also with
>>>> i915, AMD, or whatever driver and platform (that's the only thing that
>>>> component is used for)?
>>>
>>> The drm/msm driver uses drm_bridge for the pipeline (including the last DP
>>> entry) and the drm_bridge_connector to create the connector. I think that
>>> enabling i915 and AMD drivers to use drm_bridge fells out of scope for this
>>> series.
>>>
>>>
>>>> Determining the connection between a DP and its Type-C connector is
>>>> starting to get really important, so ideally we have a common solution
>>>> for that.
>>>
>>> Yes. This is what we have been discussing with Simon for quite some time on
>>> #dri-devel.
>>>
>>> Unfortunately I think the solution that got merged was pretty much hastened
>>> in instead of being well-thought. For example, it is also not always
>>> possible to provide the drm_connector / typec_connector links (as you can
>>> see from the patch7. Sometimes we can only express that this is a Type-C DP
>>> connector, but we can not easily point it to the particular USB-C port.
>>>
>>> So, I'm not sure, how can we proceed here. Currently merged patch breaks
>>> drm/msm if we even try to use it by setting kdef->fwnode to
>>> drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c` is
>>> an ACPI-only thing, which is not expected to work in a non-ACPI cases.
>>
>> You really have to always supply not only the Type-C ports and partners,
>> but also the alt modes. You need them, firstly to keep things sane
>> inside kernel, but more importantly, so they are always exposed to the
>> user space, AND, always the same way. We have ABIs for all this stuff,
>> including the DP alt mode. Use them. No shortcuts.
>>
>> So here's what you need to do. UCSI does not seem to bring you
>> anything useful, so just disable it for now. You don't need it. Your
>> port driver is clearly drivers/soc/qcom/pmic_glink_altmode.c, so
>> that's where you need to register all these components - the ports,
>> partners and alt modes. You have all the needed information there.
> 
> To make things even more complicate, UCSI is necessary for the USB part of the story. It handles vbus and direction.

On new platforms (starting from SM8450) UCSI is mandatory to have pmic_glink_altmode events triggering.

Neil

> 
>> Only after you've done that we can start to look at how should the
>> connection between the DPs and their USB Type-C connectors be handled.
> 
> But sure enough, I can add typec port registration to the altmode driver. This will solve the 'port not existing' part of the story.
> 
> I'd like to hear your opinion on:
> 
> - components. Using them breaks drm/msm. How can we proceed?
> 
> - PATH property usage. This way we make USB-C DisplayPort behave like the MST ports.
> 

