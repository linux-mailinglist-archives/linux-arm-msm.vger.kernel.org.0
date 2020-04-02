Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECCE19CD2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 00:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389108AbgDBW42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 18:56:28 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:38317 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729549AbgDBW42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 18:56:28 -0400
Received: by mail-vk1-f193.google.com with SMTP id n128so1504463vke.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ok4wGTvzCTXydODevfiQEyG5yYpGPlaZ9o6pHHlLTpk=;
        b=AWWeCU4hDYBU+OF5Y1ceaY6RIGtjixFYMB6CHk1om2doQr/qKmzNCgXSJraZDzZfSR
         Q3KjibosDCnp2LuIKlLoDoqs0C+fmtZlLp/2UoNaSRGfDjVSvofs9p+Yl6XJbvxIbkoT
         blGSyQI2wo3Vm9+IiP6WpSEAODiHqUPilerQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ok4wGTvzCTXydODevfiQEyG5yYpGPlaZ9o6pHHlLTpk=;
        b=eSoWREI9swTqGaD6qeG8MLYLSTXCJc3TfT7q4GWemfh0symckjZkXZOlqL492fIWDh
         bD8+TqC83kGJvJI4RYs/lcpeCgxzKFc0Sw7ArjYn0aP00/r34RXJST86MxmsL14KfUAF
         vRIuEGtZTp9MwnoXfSTFHQ77C7rUW0FVR08rPz6NLkmHOecoS+3a8hAKrzUX0isnwDmO
         VEEsEZOAxCHbCQXkYHc0yiHl+i0xZ4OLCQ/9nleWJgCJqJGRZY8S2jp0iHSxbH9hA/KI
         s0Yw7lzLIfa2DQ6X7wz3iDPhVdzZWadFQ0BekqLCJSlDCLpdRj1KLTijgce6wAd5HGV4
         NhYA==
X-Gm-Message-State: AGi0Pub9tqaG1tJ5DFn0d7CpzDOoOcC88vZirZOCNcsaQ9LQN8xu+qMf
        1vn+4dmnIgERG9d/8PWzjyEn7Gj+o2Q=
X-Google-Smtp-Source: APiQypJGOmAMUAdIfQbPA7tuuoFA4hc3nYrp3T6RbYhrqJsfuXgvU5E+I4vRMCYnHsm7bVTdLN+U2w==
X-Received: by 2002:a1f:93d4:: with SMTP id v203mr4145584vkd.78.1585868187125;
        Thu, 02 Apr 2020 15:56:27 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id v4sm1763955vkg.17.2020.04.02.15.56.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 15:56:26 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id s10so3716716vsi.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 15:56:25 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr4469905vse.106.1585868185329;
 Thu, 02 Apr 2020 15:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANcMJZCr646jav3h14K0xV=ANMxXg=U20wvSB546qrLX3TECBg@mail.gmail.com>
 <20200402223723.7150-1-john.stultz@linaro.org>
In-Reply-To: <20200402223723.7150-1-john.stultz@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 15:56:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
Message-ID: <CAD=FV=VGT75c4_ErQAJgNtcCd2Jzv0A2KpfEkS637GqOhamj9Q@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy" compat string
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 2, 2020 at 3:37 PM John Stultz <john.stultz@linaro.org> wrote:
>
> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> as a generic compat string. However the change also removed
> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> in the binding and already in use.
>
> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> which allows the driver to continue to work with existing dts
> entries such as found on the db845c.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Manu Gautam <mgautam@codeaurora.org>
> Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
>  1 file changed, 3 insertions(+)

Do you have an out-of-tree dts file?  If not, I'd prefer that the fix
was for this patch to land instead:

https://lore.kernel.org/r/1583747589-17267-9-git-send-email-sanm@codeaurora.org

While we can land your patch if someone needs it for supporting an
out-of-tree dts, it gives people supporting future SoCs the idea that
they need to add themselves to this table too.  That's now discouraged
unless there's a specific quirk that needs to be handled just for this
SoC.

-Doug
