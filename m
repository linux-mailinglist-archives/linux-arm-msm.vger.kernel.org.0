Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16B476CA0ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 12:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbjC0KLF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 06:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbjC0KLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 06:11:04 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD61146BC
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:11:02 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so8217622pjt.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679911862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l8oYrL5W+/K5DxpmHckDPIBZn4lzHyYfyjDe679hpgM=;
        b=xvmjQvz4P6jtePcDP694gCbPdD0nO3H3FFHztNkdY2CpFoYBOOSjwqnV/mDNA6StY5
         PXstQCL7Fv67NV4SfB1DlWxE3ADwW27o66CBLzH5HnqSeEJhkdyccfAYgHKo3Lo7k9pB
         AX54IGm23XcT2B4zT0HjM6Nz8i2irupzgYfBYX7AeG28JWiEZQ6FHEpktRVR9WxFuIIM
         8VL+hfgGP1vqjtzVygO3LfcCjmrZUIh0ehT9LpDkUX2fGXArpZm+Waig5aUZwy1vtTZm
         l+Ss5LZMOgzJLC0eJCtJ1dkG7i9KC0/zotgINvDKvDQ/GXC6m9ebR+5bCd1Sc1ckcX7b
         hFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679911862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8oYrL5W+/K5DxpmHckDPIBZn4lzHyYfyjDe679hpgM=;
        b=opxuUjJi5jatn6b5963XsbnttjHjWQYjR29UD7vp+15t1NzD/vb1noZRMt7Gl9S4Vq
         CzX1uLyUcv7w3jaq6egpBkOcc9V5jRHLFn8vRP777rcV4UWmx6Lx95as9779xI12ErYK
         MPP2t9wP20xROV9DN6kpB6/QDEPnx6mE+Lr/6i/tFnPSF0itOD4bnV75F+2AKx6E5xpY
         AsOfMpvEWODI67bHj0nGGf9KpeDcv39bPdATC3Zprdv95mC46xiE3UdpgRPvgdO/HFP5
         YCWYaay31ovHPOIzlSlXT0agu6yiaSI8fwKckVydlW58l/WPlY1VNzQRGkVTzHKqZzst
         ezMA==
X-Gm-Message-State: AO0yUKWk4zAJ1RJqFOZda0IrWsTCJh2u5daJqv8WIxgY5k75lw9Snd1t
        RZda9oUNBLpXOaoSEssRRHTk
X-Google-Smtp-Source: AK7set97+krrpdWjDnF9Jbsy3E9BDASlZJZnso65m1y2AqUfpGy0f4aKkVVamPpKB2T9RF0OGP9YLg==
X-Received: by 2002:a05:6a20:49a4:b0:db:7859:f78a with SMTP id fs36-20020a056a2049a400b000db7859f78amr9229194pzb.5.1679911862085;
        Mon, 27 Mar 2023 03:11:02 -0700 (PDT)
Received: from thinkpad ([117.193.215.38])
        by smtp.gmail.com with ESMTPSA id r14-20020a62e40e000000b00627ee6dcb84sm15271694pfh.203.2023.03.27.03.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 03:11:01 -0700 (PDT)
Date:   Mon, 27 Mar 2023 15:40:55 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     andersson@kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] usb: dwc3: qcom: Allow runtime PM
Message-ID: <20230327101055.GA16424@thinkpad>
References: <20230325165217.31069-1-manivannan.sadhasivam@linaro.org>
 <cc7392c1-0ea1-29b3-fab6-19c843413724@linaro.org>
 <20230327091733.GA14584@thinkpad>
 <506a7e48-2576-0fa6-d5e9-0157539bcebf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <506a7e48-2576-0fa6-d5e9-0157539bcebf@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 27, 2023 at 11:24:58AM +0200, Konrad Dybcio wrote:
> 
> 
> On 27.03.2023 11:17, Manivannan Sadhasivam wrote:
> > On Mon, Mar 27, 2023 at 11:01:35AM +0200, Konrad Dybcio wrote:
> >>
> >>
> >> On 25.03.2023 17:52, Manivannan Sadhasivam wrote:
> >>> Hi,
> >>>
> >>> This series allows the dwc3-qcom driver to do runtime PM itself without
> >>> userspace intervention. Still, userspace is required to enable runtime PM
> >>> for dwc3 glue and xhci drivers as we cannot enable runtime PM for them.
> >>> But this series avoids one more additional step.
> >> What sort of 'userspace intervention' are we talking about?
> >> echo mem > /sys/power/state?
> >>
> > 
> > I forgot to add that bit:
> > 
> > echo auto > /sys/devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.1.auto/power/control
> > echo auto > /sys/devices/platform/soc@0/a8f8800.usb/a800000.usb/power/control
> > 
> > You need to set "auto" for the runtime control for both xhci and dwc drivers.
> > 
> > Then if you don't connect a usb device, all 3 drivers (dwc3-qcom, dwc3, and
> > xhci) will become runtime suspended after a delay of 5s (default delay).
> > 
> > This can be confirmed by:
> > 
> > cat /sys/devices/platform/soc@0/a8f8800.usb/power/runtime_status
> > 
> > After connecting a usb device, they will all become "active".
> Thanks! And if I'm following correctly, we can't enable runtime PM
> for the DWC3 glue and XHCI drivers, as that would cause havoc on
> other, non-qc platforms. Is that correct?
> 

Kind of. Actually dwc3 glue is our qcom driver, other one is just dwc3 driver.

The havoc would apply to xhci driver because, once it is suspended, one of its
parent drivers has to resume it. And that requires runtime PM support for all
the parent drivers which is currently not available.

But for dwc3 driver, I'm not sure about the consequence though. Maybe I should
send it as a separate patch later on and see what other platforms folks think
of it.

Thanks,
Mani

> Konrad
> > 
> > Thanks,
> > Mani
> > 
> >> Konrad
> >>>
> >>> While enabling runtime PM, I noticed that the xhci driver suspends before
> >>> catching the xhci interrupts during resume. This ended up deferring the
> >>> device enumeration for some time. So I included a patch adding autosuspend
> >>> delay of 200ms to the xhci driver. With this delay, usb enumeration happens
> >>> properly.
> >>>
> >>> This series has been tested on SC8280XP-CRD and RB5 devices.
> >>>
> >>> Thanks,
> >>> Mani
> >>>
> >>> Manivannan Sadhasivam (5):
> >>>   arm64: dts: qcom: sc8280xp: Add missing dwc3 quirks
> >>>   xhci: host: Use 200ms autosuspend delay for runtime suspend
> >>>   usb: dwc3: qcom: Fix null ptr access during runtime_suspend()
> >>>   usb: dwc3: qcom: Clear pending interrupt before enabling wake
> >>>     interrupt
> >>>   usb: dwc3: qcom: Allow runtime PM
> >>>
> >>>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 14 ++++++++++++++
> >>>  drivers/usb/dwc3/dwc3-qcom.c           | 13 +++++++++----
> >>>  drivers/usb/host/xhci-plat.c           |  2 ++
> >>>  3 files changed, 25 insertions(+), 4 deletions(-)
> >>>
> > 

-- 
மணிவண்ணன் சதாசிவம்
