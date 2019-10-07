Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C42CCEAD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 19:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbfJGRoR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 13:44:17 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43087 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfJGRoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 13:44:17 -0400
Received: by mail-wr1-f66.google.com with SMTP id j18so15539917wrq.10;
        Mon, 07 Oct 2019 10:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wW1V6y+LNxCMJgLglkcDUpnlWBml+CeBEdMclmrUkYs=;
        b=rvVxfGORMifDJp8Ave2inD37kzbiqQLr7LScpWwaxDoY2oe8K8T14vLH/jcwdQREB2
         I+SVlPfVMBDU0Y0skqn2jYbmoY74PZsq5VIy8ByI3pXLxYIMo+H8UTqfzEQItcmS3EZS
         KgyxkdToCbm6BMZoZkXyVU7XaN08QWcW0R30pAzr3hu0coUvIMUUyw9nbDfjFu5Kiy61
         Cyr+wQI/f/0st5y46xGei1GiRHdbnxqcf7KvCZJGkk6+cBdn8wMMLf07m8Cd1a20WE28
         92eyLz/2aJ6CHQOAT1ZbLsWcgZ6Hkbxcv0ogqQy6tZKR1WCcqzvZqB5jwnoaAssal4M5
         Ks1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wW1V6y+LNxCMJgLglkcDUpnlWBml+CeBEdMclmrUkYs=;
        b=i5wVwD9YqjVNSfMWiFcjlk6tB+pNNIt9Q4LRM6W1u6qAiaM4L+aOPyBx1T/xaA6kXA
         XZMPPfRDsjcpVInvfpBe7zCSXdXPnGt8B3xVdQf7PUua7AZSIBv2NAJiRmgYFSHMM6+B
         mxtFHFBIAxJxRwR5NUSWe8pgJJd3nB4cSSnIn911215P/OAflMtKVFZbVZC9dtAshA+P
         4WIn6oeYkooFxiSaazlaBnRUwXr2TN8fB5xsGP3umyvqeRnmCfEMcHxZZd8xMOu3xTsL
         IBOnAR/Tmqn5YLF1w9n0zLk7eyuRYFrXg2E6gi4tgn8q4O97t90zclhmuyC73kQnw/bJ
         ga9A==
X-Gm-Message-State: APjAAAXiU+cgVqskbs3lMqndOY+PdXrDIzu+h9hAcBGEqNkeCqTXiZwy
        TFUF1iEx3LMSr099ZRph+3myDFPNbKYOh1yZHLw=
X-Google-Smtp-Source: APXvYqyBQEIoI2mpyfHmG2vJ8+RyfCMHGGYI93kPz9FtXQWOgikwjvB+30AaYJryXUffl4E+0n6tQgYqZhm5iF1/r34=
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr24060562wru.317.1570470253994;
 Mon, 07 Oct 2019 10:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-2-vkoul@kernel.org>
In-Reply-To: <20190724044906.12007-2-vkoul@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 7 Oct 2019 10:44:02 -0700
Message-ID: <CANcMJZBWsfwWmHbGCG+KG4n1kpmytw_8O4uA8HEVv8ysBxiQgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 23, 2019 at 9:51 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> We get a warning about missing unit name for soc node, so add it.
>
> arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 601cfb078bd5..e81f4a6d08ce 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -620,7 +620,7 @@
>                 method = "smc";
>         };
>
> -       soc: soc {
> +       soc: soc@0 {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges = <0 0 0 0 0x10 0>;

So Amit Pundir noted that this patch is causing 5.4-rc to no longer
boot on db845 w/ AOSP, due to it changing the userland sysfs paths
from "/devices/platform/soc/1a00000.mdss" to
"/devices/platform/soc@0/1a00000.mdss"

Is there a better solution here that might not break userspace?

thanks
-john
