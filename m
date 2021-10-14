Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C63442E336
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 23:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhJNVZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 17:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhJNVZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 17:25:31 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B81C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 14:23:26 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id a16so4564009qvm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ttE8p2peUXMyS7hqkOZ70JD3WtjCQNQamWkaLVYOG3E=;
        b=D/06ByOoawWkRohQqL2l2CFOCUbYnl2RoitbNmrlvZCl/Nd9AmPlQoHpVUtA0s7bqB
         cgG091e25RX9jR/YIhWJipESt7lbayvAWIeU7JMRB/QTAroFiN9ENWwNVkUaiBfmYgOL
         RPweHHT9pg0g8DT4MAf2SsND1veIzjNNtOkmQEqtM5I5UD6b8kk62/4Yr4vvJhxFXjB4
         X/dO/ueLAeFXA4oPvRcXdJyHBaQ+jsT84+IJ/RyFEiEypmNmfyv+T+oGDq+xG7v+pCs/
         D1iDGAh2LO5GqEsRkHvsUovBkqfvd7FIQQIKzRHkdBnUs8plEEQUIjtIpN7DgXerWomp
         Z+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ttE8p2peUXMyS7hqkOZ70JD3WtjCQNQamWkaLVYOG3E=;
        b=TFlt2raXOFee/9OS6QlZWzRMkeUqQSlG24BtZP22TszekTIHbN2XaEUV8kb5dZOZP4
         pl4YWpvgNdQso1EXMxAQ/hekETsMBVgihpTUaJEQ5v5/oczQ7CTgP8XSFAYCn67KXSst
         lgPztpXk0esiDUCb7E1tAfUxncs5LZ8bfYsmuAhCayLJIY2m0IAH0h7hzfVq+rzEG5TH
         dbzESPVLVOnpgrVhy6I4nUdMVkrIljlGRn4MEW0rkjTjDpTWglHgw2PtpRD9TBDoudez
         b+eCFBnrQFgcepByow8KSbtQgJFnxh8ndXP5/kPQFJhP/xwKxsOzu7oeW9fPDHpkXst1
         hoGQ==
X-Gm-Message-State: AOAM53105Ke8+nxY+ICN6bpOLR3w+vDr4YneINvgqTKQaK299WwEi0Gp
        jhbqKT7CrNNs+ze+zgKNvyu3RNEzC66WNymslXPwVQ==
X-Google-Smtp-Source: ABdhPJz6jJ/pBDq8lM3AFgJVV/e6MlJ8NZaYW+wua17gNkDBg6z/i6ERgMbgkdBVQ2CNOy//tcOfEWYodDSnpJ41DlQ=
X-Received: by 2002:ad4:4ab1:: with SMTP id i17mr7673146qvx.19.1634246605704;
 Thu, 14 Oct 2021 14:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org> <3af41112-7ccd-5da8-c189-3ed8d22273c0@linaro.org>
In-Reply-To: <3af41112-7ccd-5da8-c189-3ed8d22273c0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 15 Oct 2021 00:23:01 +0300
Message-ID: <CAA8EJprjoEX4BDHOHevQQ=TMwM21xZSHuqYm8yNJ=L6GiovQYA@mail.gmail.com>
Subject: Re: Revert "arm64: dts: qcom: sm8250: remove bus clock from the mdss
 node for sm8250 target"
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Oct 2021 at 19:54, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Dmitry,
>
> On 10/14/21 4:54 PM, Dmitry Baryshkov wrote:
> > From: Amit Pundir <amit.pundir@linaro.org>
> >
> > This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.
> >
> > This upstream commit broke AOSP (post Android 12 merge) build
> > on RB5. The device either silently crashes into USB crash mode
> > after android boot animation or we see a blank blue screen
> > with following dpu errors in dmesg:
> >
> > [  T444] hw recovery is not complete for ctl:3
> > [  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu error]enc31 intf1 ctl 3 reset failure: -22
> > [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> > [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> > [    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 frame done timeout
> > [  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
> > [  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
> >
> > Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
>
> your sob tag is missing.

True. I hope this is fine:

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> > ---
> >   arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 8c15d9fed08f..d12e4cbfc852 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2590,9 +2590,10 @@
> >                       power-domains = <&dispcc MDSS_GDSC>;
> >
> >                       clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +                              <&gcc GCC_DISP_HF_AXI_CLK>,
> >                                <&gcc GCC_DISP_SF_AXI_CLK>,
> >                                <&dispcc DISP_CC_MDSS_MDP_CLK>;
> > -                     clock-names = "iface", "nrt_bus", "core";
> > +                     clock-names = "iface", "bus", "nrt_bus", "core";
> >
> >                       assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
> >                       assigned-clock-rates = <460000000>;
> >
>
> --
> Best wishes,
> Vladimir



-- 
With best wishes
Dmitry
