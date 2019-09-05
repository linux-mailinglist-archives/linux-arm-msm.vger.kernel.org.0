Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCE2A9B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 09:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731864AbfIEHTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 03:19:02 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52253 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731858AbfIEHTC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 03:19:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id t17so1407771wmi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 00:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RISrkcVh8Fqvuvvt7yP9o+S9VLGHZzFUmgTqhMvQtG4=;
        b=w7Zmcb2XHj5Ual1LSZm+t0kJNSCVahdatsM8lQ8zM5/0XphUQGigOEZRdvZliz5F7j
         dTOzp1F2X1FK+JJ8JkIDl6QVq2bfU7DCzXQszMmKfo7XBWdMk4nmgxs4gMRkxLdF5r2j
         VbRnn9mzydneTR+bIb6Px14j6S4wj6+m1JsP8Vn655oOOERrxdJKjkeSzRLlSfrQlH/Y
         OlHS0j8ol1x3MVPU8IRwkf3nBWfWajGfxubTqgnUgkK25Lcr0aim/Sgtox3Z4X29O1ii
         RpppqP6TLKmH1q+INQmghSvW23w8gQQixjJ8ULuOFaTTQEWt7VCPeWNuquvj7ezWjCu7
         RyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RISrkcVh8Fqvuvvt7yP9o+S9VLGHZzFUmgTqhMvQtG4=;
        b=jDYDDh5aVQN6NOO98u72NxhSesCvyL4zCcVwuaAABGiM+F5fz56QsK6gOhjOXKzaI5
         Snx9z4eF6NSO67vqbfzKO0hWqna8IjBkygC32N+3TsxTdCo6xBIr6waE9uZdyXSgrc7X
         NJjFaVoW0s4Sey8VEogSy5FcubptjsL7wASe4nf4FP3Zdze8poCZYejVW2DazM1eZaRk
         myW3NjtUXAuQs1xz2Co1szZygIm3EKV1bryhpNW3UvvBRDbHnxlIHGiTPo4tqZTYE614
         tAuslHt8zMlo/g2gp3VCXjPXRgnX4DCwicBY4HakVHi7kzcy3OCPhFfpf2eVU2h/jouz
         GR7A==
X-Gm-Message-State: APjAAAXGwoVTrEuIooSGCWGWwYJsFQak1+qCU55UPrYB30XBM+cKaxxA
        s9uF5zSUulwScmqr20iG63kqpw==
X-Google-Smtp-Source: APXvYqwb3qPb+oOBBzHjG4sQtkXniSl2iyH54hj1GZDHlTP9lhKhJx6lcOSlYOQbGhBanmLEg10BaA==
X-Received: by 2002:a7b:cf25:: with SMTP id m5mr1591920wmg.25.1567667939170;
        Thu, 05 Sep 2019 00:18:59 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id b194sm1755057wmg.46.2019.09.05.00.18.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Sep 2019 00:18:58 -0700 (PDT)
Subject: Re: [PATCH v4 3/4] dt-bindings: Add Qualcomm USB SuperSpeed PHY
 bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Jack Pham <jackp@codeaurora.org>, robh@kernel.org,
        andy.gross@linaro.org, shawn.guo@linaro.org,
        gregkh@linuxfoundation.org, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, khasim.mohammed@linaro.org
References: <20190207111734.24171-1-jorge.ramirez-ortiz@linaro.org>
 <20190207111734.24171-4-jorge.ramirez-ortiz@linaro.org>
 <20190223165218.GB572@tuxbook-pro>
 <6dc0957d-5806-7643-4454-966015865d38@linaro.org>
 <5d694878.1c69fb81.5f13b.ec4f@mx.google.com>
 <20190830164520.GK26807@tuxbook-pro>
 <5d696ad2.1c69fb81.977ea.39e5@mx.google.com>
 <f3584f38-dabc-7e7a-d1cb-84c80ed26215@linaro.org>
 <20190903173924.GB9754@jackp-linux.qualcomm.com>
 <5d6edee5.1c69fb81.a3896.1d05@mx.google.com>
 <20190903233410.GQ26807@tuxbook-pro>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <c9481b7d-4805-25c6-f40f-9cbfc40afc93@linaro.org>
Date:   Thu, 5 Sep 2019 09:18:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903233410.GQ26807@tuxbook-pro>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/4/19 01:34, Bjorn Andersson wrote:
> On Tue 03 Sep 14:45 PDT 2019, Stephen Boyd wrote:
> 
>> Quoting Jack Pham (2019-09-03 10:39:24)
>>> On Mon, Sep 02, 2019 at 08:23:04AM +0200, Jorge Ramirez wrote:
>>>> On 8/30/19 20:28, Stephen Boyd wrote:
>>>>> Quoting Bjorn Andersson (2019-08-30 09:45:20)
>>>>>> On Fri 30 Aug 09:01 PDT 2019, Stephen Boyd wrote:
>>>>>>
>>>>>>>>>
>>>>>>>>> The USB-C connector is attached both to the HS and SS PHYs, so I think
>>>>>>>>> you should represent this external to this node and use of_graph to
>>>>>>>>> query it.
>>>>>>>>
>>>>>>>> but AFAICS we wont be able to retrieve the vbux-supply from an external
>>>>>>>> node (that interface does not exist).
>>>>>>>>
>>>>>>>> rob, do you have a suggestion?
>>>>>>>
>>>>>>> Shouldn't the vbus supply be in the phy? Or is this a situation where
>>>>>>> the phy itself doesn't have the vbus supply going to it because the PMIC
>>>>>>> gets in the way and handles the vbus for the connector by having the SoC
>>>>>>> communicate with the PMIC about when to turn the vbus on and off, etc?
>>>>>>>
>>>>>>
>>>>>> That's correct, the VBUS comes out of the PMIC and goes directly to the
>>>>>> connector.
>>>>>>
>>>>>> The additional complicating factor here is that the connector is wired
>>>>>> to a USB2 phy as well, so we need to wire up detection and vbus control
>>>>>> to both of them - but I think this will be fine, if we can only figure
>>>>>> out a sane way of getting hold of the vbus-supply.
>>>>>>
>>>>>
>>>>> Does it really matter to describe this situation though? Maybe it's
>>>>> simpler to throw the vbus supply into the phy and control it from the
>>>>> phy driver, even if it never really goes there. Or put it into the
>>>>> toplevel usb controller?
>>>>>
>>>> that would work for me - the connector definition seemed a better way to
>>>> explain the connectivity but since we cant retrieve the supply from the
>>>> external node is not of much functional use.
>>>>
>>>> but please let me know how to proceed. shall I add the supply back to
>>>> the phy?
>>
>> So does the vbus actually go to the phy? I thought it never went there
>> and the power for the phy was different (and possibly lower in voltage).
>>
> 
> No, the PHYs use different - lower voltage - supplies to operate. VBUS
> is coming from a 5V supply straight to the connector and plug-detect
> logic (which is passive in this design).
> 
>>>
>>> Putting it in the toplevel usb node makes sense to me, since that's
>>> usually the driver that knows when it's switching into host mode and
>>> needs to turn on VBUS. The dwc3-qcom driver & bindings currently don't 
>>> do this but there's precedent in a couple of the other dwc3 "glues"--see
>>> Documentation/devicetree/bindings/usb/{amlogic\,dwc3,omap-usb}.txt
>>>
>>> One exception is if the PMIC is also USB-PD capable and can do power
>>> role swap, in which case the VBUS control needs to be done by the TCPM,
>>> so that'd be a case where having vbus-supply in the connector node might
>>> make more sense.
>>>
>>
>> The other way is to implement the code to get the vbus supply out of a
>> connector. Then any driver can do the work if it knows it needs to and
>> we don't have to care that the vbus isn't going somewhere. I suppose
>> that would need an of_regulator_get() sort of API that can get the
>> regulator out of there? Or to make the connector into a struct device
>> that can get the regulator out per some generic connector driver and
>> then pass it through to the USB controller when it asks for it. Maybe
>> try to prototype that out?
>>
> 
> The examples given in the DT bindings describes the connector as a child
> of a PMIC, with of_graph somehow tying it to the various inputs. But in
> these examples vbus is handled by implicitly inside the MFD, where
> extcon is informed about the plug event they toggle vbus as well.
> 
> In our case we have a extcon-usb-gpio to detect mode, which per Jorge's
> proposal will trickle down to the PHY and become a regulator calls on
> either some external regulator or more typically one of the chargers in
> the system.
> 
> 
> So if we come up with a struct device for the connector and some API for
> toggling the vbus we're going to have to fairly abstract entities
> representing pretty much the same thing - and in a design with a mux we
> would have a different setup.

I am a bit unclear - not sure if we have gone full circle on this
subject. what is then the direction to get this merged?

I did have look last week and the level of effort to support regulators
on external nodes is not neglectable meaning that I might not have the
time to deliver that feature (perhaps someone else wishes to take over?)

> 
> Regards,
> Bjorn
> 

