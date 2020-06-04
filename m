Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E401EE849
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 18:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729709AbgFDQIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 12:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729705AbgFDQIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 12:08:48 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D6AC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 09:08:48 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id s1so6534240qkf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CvC1fr9DHUx1eySPx6Z5ziIOx+iRh9HidbAiYXl9oUc=;
        b=a1QKMWejX4JXFneJkps82Y7XMEYg/+9HaO+iVTyst3zuIW5K7Zi/jDz4vb31Kw4bDW
         ZyL9+zL3rQFnefPvBZayEPCwBoZg1SC5RvZ3mILl+p7O2stJBWzcPpfXOc8Ep33xSNwz
         2Q8HCUij8VEPGRtDR7j7xkDwM0QL7dw2WJ9qoP5Jz+LYVys2D7TxF9gtgdTuby0VvL+F
         nn1ApHIzP6u3v9bbdS38K9Sv7EQTmwXPYguNllWpzoqcX0MC3C/xUGsNCWC7FjZ6gaxt
         hee/SsuivwYYcJJ2PcNOQ5iF0UfPV+xN1u9+HMFjDYTFwNJ4fT0YUEkPVMqynWToHUJF
         0o9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CvC1fr9DHUx1eySPx6Z5ziIOx+iRh9HidbAiYXl9oUc=;
        b=aKkh3GhwvcnPsVogDA+2tzW6olcz6FxmEMrXGb2PtvFfX44X8/Abbp073did7byNCV
         +0cFVHloN0Nv+sCdVk0uMW3LvkYm+evyIooHvC/lbDKk2v67iVrhAYUmtTQcAJ4CtX9h
         AZ02yqhPrsNwz7T28a4bUm1x1ZwPw65/NoP2RsR2pi8X1QRJXnKK7/orOiAWScJkxdbL
         C7PNnx1bSq6tfi6ypZPXQFvCuSftPojpNuiuD5jsB+FLrcqaVBpn5bcmc5OPJmDzemfp
         B4aH7lqcFn7EGA8S0I5514El6AW+5hU23Jj/jrmbAHV7/EVQ0nF0MfdhD76mH4my3MQ5
         Pb2w==
X-Gm-Message-State: AOAM532kbehs7v+RH78upEYDD5Dfet7arrE3mknfG13DEBRZ8tOl+Q5G
        q41Ax4a5MF0ckayA4CYVp7Rvxw==
X-Google-Smtp-Source: ABdhPJxNi7acIYvvdOAj4Iemrb5EcFB3U4dSwhOTCOTWDkvx1IWZ7y8LSlmXC2IGY+9DLow8U7/YpQ==
X-Received: by 2002:a37:9d52:: with SMTP id g79mr5391209qke.331.1591286927657;
        Thu, 04 Jun 2020 09:08:47 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 185sm4614162qke.92.2020.06.04.09.08.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 09:08:46 -0700 (PDT)
Subject: Re: [PATCH 0/6] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865
 dts
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200604135221.GH16719@Mani-XPS-13-9360>
 <200d1f60-781b-51c7-1a38-c955f59919de@marek.ca>
 <20200604155825.GI16719@Mani-XPS-13-9360>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <ae48475d-c51f-f355-e809-365a6ddb82e2@marek.ca>
Date:   Thu, 4 Jun 2020 12:09:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200604155825.GI16719@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/4/20 11:58 AM, Manivannan Sadhasivam wrote:
> On Thu, Jun 04, 2020 at 10:06:19AM -0400, Jonathan Marek wrote:
>> On 6/4/20 9:52 AM, Manivannan Sadhasivam wrote:
>>> Hi,
>>>
>>> On Sat, May 23, 2020 at 10:38:06PM -0400, Jonathan Marek wrote:
>>>> Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
>>>>
>>>
>>> I've tested this series on an SM8250 based board and able to get Type C (USB0)
>>> working. There are also couple of Type A ports (USB1) on that board behind a
>>> USB hub. It is probing fine but I don't see any activity while connecting a
>>> USB device. Will continue to debug and once I get them working, I'll add my
>>> Tested-by tag.
>>>
>>
>> HDK865 also has a couple Type A ports, I am using them with devices already
>> plugged in during boot and I haven't hit a problem like that, but I think
>> I've seen the same issue when hotplugging. IIRC the behavior was a bit
>> weird, like plugging a device in the Type A port (USB1) nothing would
>> happen, but unplugging/replugging the type C port (USB0) would cause the
>> Type A port device to start working..
>>
>> Have you tried with the devices already plugged in before booting?
>>
> 
> Tried it but no luck :/ Also plugging and removing Type C doesn't make any
> difference.
> 

This one might be obvious, but do you have 5V power coming out of the 
type A ports?

> Thanks,
> Mani
> 
>>> Thanks,
>>> Mani
>>>
>>>> Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
>>>> few changes. Notably, the HDK865 dts has regulator config changed a bit based
>>>> on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
>>>>
>>>> Jonathan Marek (6):
>>>>     arm64: dts: qcom: sm8150: add apps_smmu node
>>>>     arm64: dts: qcom: sm8250: add apps_smmu node
>>>>     arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
>>>>     arm64: dts: qcom: sm8250: Add USB and PHY device nodes
>>>>     arm64: dts: qcom: add sm8150 hdk dts
>>>>     arm64: dts: qcom: add sm8250 hdk dts
>>>>
>>>>    arch/arm64/boot/dts/qcom/Makefile       |   2 +
>>>>    arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
>>>>    arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
>>>>    5 files changed, 1384 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
>>>>
>>>> -- 
>>>> 2.26.1
>>>>
