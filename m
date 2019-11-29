Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9441210D8A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 17:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfK2Qsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 11:48:51 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33443 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfK2Qsu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 11:48:50 -0500
Received: by mail-ed1-f68.google.com with SMTP id a24so26228950edt.0;
        Fri, 29 Nov 2019 08:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UufnYlf2GsYCPyzbkkHk/dTVOPXtueY9E5VYzdhLqUs=;
        b=pY9tvyazS85bTfSIan9LQaMzwCiangviUqIczyltzkqih6hrGj2G5d8O0oWBBg2DVo
         YKL90Vfw4gTHQYAwP3UzR3vqm8iE1gjZADNDnRVnfzBsdv7S2hS7H4QX3kkiPzhGnmzY
         4wVayL16J93zLdJ15b7j5ISMap+5xu91iJFnxOgsNWTBlyKkzkb0JON4vI+PZXXNupXi
         PhYlFRfJpxg07Skq3LYOGnO4bnMpne6RmIJFZKxdNwJ0Ycwf0YsGBmfrefQDDtfIGyM3
         taNJpZYsFQkWfAI3yksn8Bv0Z/bQeLW6vRY8dZnZlZyeMd3MJHGO6Idu2N0NWjYEbmSU
         9u4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UufnYlf2GsYCPyzbkkHk/dTVOPXtueY9E5VYzdhLqUs=;
        b=BgRrdsTE+YYd25k8RU1bZuTcqyoEY2cXqsJjNfWhFuKVmCZAn7PXhn7rdnsca8aM57
         d1ylgStbPm0NKBQ4me2pbPJqp9Pi1TDCTtOi4+XMwzhg0wZzzsB9sfVnoPo/hudBp8Cn
         KFYHHXXWw4HSo27aWUD/p1hJ6tS+pnx2xSw3bZtQOxeCP8IATbx32gcWLAks1K79Weu6
         Xr3yCz8i0LMYLsAvz4xu1aSpllDaKyH5A681pnHiLNfgSxmuptsZelEIV2T7gaD+unnW
         NO0MSwhKd64xrSgucAYkpwoeGHWo0rHFRuox3TYqiq/Pr6PjItvlLm9xeDNdaNZJHwDH
         sbzg==
X-Gm-Message-State: APjAAAWhvl/a04HDuFN9vnTNWXtHbOouAl7B7lLanNNiVokSDihQC5Pp
        F53FRU1Zzb1uSyC30G6hXWjrRk+5blRrWbvXzeQfarY2
X-Google-Smtp-Source: APXvYqxMCZ12ZTAFseqpRkfanwT5QgN0HgMTMYKPNJBhwzpA+ToKqjaShI3w7o9le0g6Sk6wWYbkA/1kj05qoecE0lo=
X-Received: by 2002:a50:9fcb:: with SMTP id c69mr46409317edf.163.1575046127828;
 Fri, 29 Nov 2019 08:48:47 -0800 (PST)
MIME-Version: 1.0
References: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org> <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 29 Nov 2019 08:48:34 -0800
Message-ID: <CAF6AEGt8zuKWz-e_yRS_hbn6HV6DAXDvK4zwjJ-naQtEoe7uuA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 1/2] dt-bindings: display: add sc7180 panel variant
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 28, 2019 at 10:56 PM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Add a compatible string to support sc7180 panel version.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>  .../bindings/display/visionox,rm69299.txt          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/display/visionox,rm69299.txt
>
> diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> new file mode 100755
> index 0000000..4622191
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
> @@ -0,0 +1,68 @@
> +Visionox model RM69299 DSI display driver
> +
> +The Visionox RM69299 is a generic display driver, currently only configured
> +for use in the 1080p display on the Qualcomm SC7180 MTP board.
> +
> +Required properties:
> +- compatible: should be "visionox,rm69299-1080p-display"
> +- vdda-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- vdd3p3-supply: phandle of the regulator that provides the supply voltage
> +  Power IC supply
> +- reset-gpios: phandle of gpio for reset line
> +  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
> +  (active low)
> +- mode-gpios: phandle of the gpio for choosing the mode of the display
> +  for single DSI
> +- ports: This device has one video port driven by one DSI. Their connections
> +  are modeled using the OF graph bindings specified in
> +  Documentation/devicetree/bindings/graph.txt.
> +  - port@0: DSI input port driven by master DSI
> +
> +Example:
> +
> +       dsi@ae94000 {
> +               panel@0 {
> +                       compatible = "visionox,rm69299-1080p-display";
> +                       reg = <0>;
> +
> +                       vdda-supply = <&src_pp1800_l8c>;
> +                       vdd3p3-supply = <&src_pp2800_l18a>;
> +
> +                       pinctrl-names = "default", "suspend";
> +                       pinctrl-0 = <&disp_pins_default>;
> +                       pinctrl-1 = <&disp_pins_default>;
> +
> +                       reset-gpios = <&pm6150l_gpios 3 0>;
> +
> +                       display-timings {
> +                               timing0: timing-0 {
> +                                       /* originally
> +                                        * 268316160 Mhz,
> +                                        * but value below fits
> +                                        * better w/ downstream
> +                                        */
> +                                       clock-frequency = <158695680>;
> +                                       hactive = <1080>;
> +                                       vactive = <2248>;
> +                                       hfront-porch = <26>;
> +                                       hback-porch = <36>;
> +                                       hsync-len = <2>;
> +                                       vfront-porch = <56>;
> +                                       vback-porch = <4>;
> +                                       vsync-len = <4>;
> +                               };

why do we specify timings in dt?  Would the panel use different
timings on a different board?

BR,
-R

> +                       };
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               port@0 {
> +                                       reg = <0>;
> +                                       panel0_in: endpoint {
> +                                               remote-endpoint = <&dsi0_out>;
> +                                       };
> +                               };
> +                       };
> +               };
> +       };
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
