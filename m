Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA72E1D57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2019 15:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406174AbfJWNvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Oct 2019 09:51:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37950 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391880AbfJWNvN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Oct 2019 09:51:13 -0400
Received: by mail-wr1-f67.google.com with SMTP id v9so10928480wrq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2019 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:openpgp:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=2OzqeB6lct/4fO2u5biFD/hH4qN2HDn6dJHGOqFVmZI=;
        b=HxDBxkpt/TeXHVriMyGDqLhs0MthlNjNAeNVQezlsLSQGK5tb6zxiwSXKeqdzWC7M2
         SDbjsOENSXQOZ6vlfQ6Sd7bWNWdXml01yl4gGJkjjgS9rSzuaNUQEgYmERynar2gG9MB
         nCMyKy33R80dzElC4mKKGnIHMQoj94S59WbUtrnog2S1J09cumyqSoYNFnyw/KSIQgKF
         dzuESK/bbrY6UCLc9qFhJqAcyiBqrdWaioVM+iGIrGk7WZpNO7KXNa3LeB5BkBWPhyie
         yPZs/GpUej/2Y+Eg1NvBgrxbubRoDOYCS8IKitb+M1QGkwm1f1+gs568w4pasyj3XqEe
         Zwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2OzqeB6lct/4fO2u5biFD/hH4qN2HDn6dJHGOqFVmZI=;
        b=d3oVIcTFnYjJjyWa0GKEVR3y1Ze61kXZlfxciFCz7kIJKsLIAihIQ11P1Y6svsFHEb
         7GrS/8OQWanaMAfWJ38M1y76iJGkzc6iwsIEAFCXe3Bxsl6r+uT/Qo8oIXXVjnN+rqHb
         UKZEb4gfjwKYb5gy60G2o5CX0ScENHDxzTkeZRnffVJ/or7FIlxtS8raj1o015345t8j
         Wg0Vv4c94lUDkb7pl/4l9CftPTeVMte68TRX49Fh3NACL1UD1JrTY4TF9LSTrPbJHcuK
         Sc0t03k+XAkUcnwu3/dFRCk89Zp+OlroUhPxu9p0QasP2GL5Je0YWqGYXcuhF/GKYi+r
         X5wQ==
X-Gm-Message-State: APjAAAVwL2osbnY8VVxonDXXwTCAFfxL5KGZRHrnSLH7KFBr/0HVo8XK
        i6FQi6/k+loe0ZpcWRM5K4tnbQ==
X-Google-Smtp-Source: APXvYqz38URZiwF3jYVFDirDMkOyKsDUee5Q74pCUjTu27Axp8SUi5Xd93x6B2Mphtf8iU4RtObptw==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr8459368wrw.280.1571838670680;
        Wed, 23 Oct 2019 06:51:10 -0700 (PDT)
Received: from [192.168.27.135] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id u68sm26145822wmu.12.2019.10.23.06.51.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 06:51:10 -0700 (PDT)
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974: add interconnect nodes
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20191013080804.10231-1-masneyb@onstation.org>
 <20191013080804.10231-6-masneyb@onstation.org>
 <d154b0c6-fc39-bebc-d1b5-cc179fb6055d@linaro.org>
 <20191023124753.GA14218@onstation.org>
 <c26159f5-e6fe-07f1-51b3-50b72b258846@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <94f957c6-c26b-b1f5-4d0f-6c9aff0a03cd@linaro.org>
Date:   Wed, 23 Oct 2019 16:51:09 +0300
MIME-Version: 1.0
In-Reply-To: <c26159f5-e6fe-07f1-51b3-50b72b258846@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23.10.19 г. 16:39 ч., Georgi Djakov wrote:
> On 23.10.19 г. 15:47 ч., Brian Masney wrote:
>> On Wed, Oct 23, 2019 at 02:50:19PM +0300, Georgi Djakov wrote:
>>> On 13.10.19 г. 11:08 ч., Brian Masney wrote:
>>>> Add interconnect nodes that's needed to support bus scaling.
>>>>
>>>> Signed-off-by: Brian Masney <masneyb@onstation.org>
>>>> ---
>>>>  arch/arm/boot/dts/qcom-msm8974.dtsi | 60 +++++++++++++++++++++++++++++
>>>>  1 file changed, 60 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>>> @@ -1152,6 +1207,11 @@
>>>>  				              "core",
>>>>  				              "vsync";
>>>>  
>>>> +				interconnects = <&mmssnoc MNOC_MAS_GRAPHICS_3D &bimc BIMC_SLV_EBI_CH0>,
>>>> +				                <&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
>>>
>>> Who will be the requesting bandwidth to DDR and ocmem? Is it the display or GPU
>>> or both? The above seem like GPU-related interconnects, so maybe these
>>> properties should be in the GPU DT node.
>>
>> The display is what currently requests the interconnect path,
>> specifically mdp5_setup_interconnect() in
>> drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c. The Freedreno GPU bindings
>> currently don't have interconnect support. Maybe this is something that
>> I should add to that driver as well?
> 
> The "mdp0-mem" and "mdp1-mem" paths mentioned in the mdp5_kms.c are the two
> interconnects between the display and DDR memory. There is actually a patch [1]
> to add to GPU bindings, but it seems that we missed to pick it up.

It was actually merged in v5.2.

BR,
Georgi

>>>> +				interconnect-names = "mdp0-mem",
>>>> +				                     "mdp1-mem";
>>>
>>> As the second path is not to DDR, but to ocmem, it might be better to call it
>>> something like "gpu-ocmem".
>>
>> I used what mdp5_kms.c expected.
> 
> This is for the display and here [2] are some patches for the GPU. Not sure how
> the NoCs are configured on 8974 by default, but if you notice any blue/black
> screens, you may need to request bandwidth for display too.
> 
> Thanks,
> Georgi
> 
> [1]
> https://lore.kernel.org/r/1555703787-10897-1-git-send-email-jcrouse@codeaurora.org
> [2] https://lore.kernel.org/r/20181220173026.3857-1-jcrouse@codeaurora.org
> 
