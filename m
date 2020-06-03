Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2800E1ED52D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 19:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgFCRmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 13:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgFCRmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 13:42:46 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 162B6C08C5C7
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2020 10:36:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y17so1046277plb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2020 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ylVKXMXoSHWxEfuprMtTy+ptfQH8F9MdYoQU37bFUNc=;
        b=X829y22aorlO5+Du+MvNj8VULQUMImlRc6xjM+s9r8nWu/Mvpz3brR7ktjNpVrS/qS
         c3IxPLMp50QFAk4JbZGm0JkHoLEj69/UAZ4NFoAl+ElHknCqhTWatOLZLvQ8AbtbDX3z
         8sGKtZdcUt7n3AkgwohwgKQql80SaxCE3GTvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ylVKXMXoSHWxEfuprMtTy+ptfQH8F9MdYoQU37bFUNc=;
        b=Yg11+Sbs4jzzyKZ80qCRpp8gJPtyW9NaXnOfKijMF+nCHUbML+lgRl+sCwmyYRV/iv
         /7Yn2bXBMdB7oUi5q96c5x25KgKqhKjiXx8lZ3bgrUMPldD76xzntYXIMGSqWmlS7Bx+
         ezFraALmUy94o2bnJVMGIfbW4JmJt7QoH+TLbZwq8yHJDWg2GczSJCNF6jPLEIzkoT1U
         dQDEdNxQr563kP70pUhxQXi0LhL8b3+a0jhKZcB6l7AvMxVRCxfLgXUJxjvj7IWOmyW4
         VakVs92M4LFSLIwml0DXHdODH/8nwjeRDBvH6iJpT3LJvfuiWhYKZIRHy2VQiLJNHXTy
         KFKQ==
X-Gm-Message-State: AOAM533IXr0BB1UcIsdsG9/cYZSSb1Lyvp6kyJJMRbrvQBbEq8e7R3xo
        YTm7NQxI6Jd3cg9L19y/qLSWAUWCacM=
X-Google-Smtp-Source: ABdhPJzPNTYLHirFN1uXJ/hKbGPbDvfxX70mtZPZJ+nOvN+YGavJ90efgc+PB2Z8D+2TUOVWgjt5DA==
X-Received: by 2002:a17:902:465:: with SMTP id 92mr844330ple.227.1591205780260;
        Wed, 03 Jun 2020 10:36:20 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w5sm2376042pfn.22.2020.06.03.10.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 10:36:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3 driver
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Wed, 03 Jun 2020 10:36:18 -0700
Message-ID: <159120577830.69627.13288547914742515702@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:43)
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 1dfd024..d33ae86 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -76,8 +85,13 @@ struct dwc3_qcom {
>         enum usb_dr_mode        mode;
>         bool                    is_suspended;
>         bool                    pm_suspended;
> +       struct icc_path         *usb_ddr_icc_path;
> +       struct icc_path         *apps_usb_icc_path;
>  };
> =20
> +static int dwc3_qcom_interconnect_enable(struct dwc3_qcom *qcom);
> +static int dwc3_qcom_interconnect_disable(struct dwc3_qcom *qcom);

Please get rid of these. We shouldn't need forward declarations.

> +
>  static inline void dwc3_qcom_setbits(void __iomem *base, u32 offset, u32=
 val)
>  {
>         u32 reg;
> @@ -285,6 +307,101 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom)
>         return 0;
>  }
> =20
> +
> +/**
> + * dwc3_qcom_interconnect_init() - Get interconnect path handles
> + * @qcom:                      Pointer to the concerned usb core.
> + *
> + */
> +static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
> +{
> +       struct device *dev =3D qcom->dev;
> +       int ret;
> +
> +       if (!device_is_bound(&qcom->dwc3->dev))
> +               return -EPROBE_DEFER;

How is this supposed to work? I see that this was added in an earlier
revision of this patch series but there isn't any mention of why
device_is_bound() is used here. It would be great if there was a comment
detailing why this is necessary. It sounds like maximum_speed is
important?

Furthermore, dwc3_qcom_interconnect_init() is called by
dwc3_qcom_probe() which is the function that registers the device for
qcom->dwc3->dev. If that device doesn't probe between the time it is
registered by dwc3_qcom_probe() and this function is called then we'll
fail dwc3_qcom_probe() with -EPROBE_DEFER. And that will remove the
qcom->dwc3->dev device from the platform bus because we call
of_platform_depopulate() on the error path of dwc3_qcom_probe().

So isn't this whole thing racy and can potentially lead us to a driver
probe loop where the wrapper (dwc3_qcom) and the core (dwc3) are probing
and we're trying to time it just right so that driver for dwc3 binds
before we setup interconnects? I don't know if dwc3 can communicate to
the wrapper but that would be more of a direct way to do this. Or maybe
the wrapper should try to read the DT property for maximum speed and
fallback to a worst case high bandwidth value if it can't figure it out
itself without help from dwc3 core.
