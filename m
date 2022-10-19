Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975A16043A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 13:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiJSLqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 07:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiJSLpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 07:45:53 -0400
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF9E11A975
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 04:25:24 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id u10so28593947wrq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 04:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPmtlEXvY4AkgFRvneE2QQ8N6ajHVR2lpNeYiAur9uk=;
        b=zLkK+IFctixgSbOjc4+8WkcNK5tRuenDWGHwXuMQ0E3iZ3qMeIQX3TpL7BHY8gOf7I
         y7GUyMip+0R1JUMCUlnj2FvaScGhmqg6FPRJ+CYqnRtEm51eQtV3vYO9d7txG09UjZI/
         hWbMcsIcOQqL/m+UxFr4QM8smWnWbmWs9jxV1wZLbbzRWi4ylO7f02jAzOljQF5c1StU
         MMD7Zu7N6JTGLmh9VYZ7pk/Rxf1eWkxrxCyeA2dWFfSGmLnAfc2QDM7cfe46hwHINHrc
         /wGmyb5JAD8WSUn4sIdvBbCAmLW39/GyT2+7yCAfKpxJWW0ZoFJhqakClNHFIq3XstVe
         ApMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NPmtlEXvY4AkgFRvneE2QQ8N6ajHVR2lpNeYiAur9uk=;
        b=VGhrQAS+czfG2r/fhPSAnqSAi3vOfxzrfBk1h/yo2qwWXwefcBYIAZzw4xAZB43PKe
         5i5qRksOrR3AjpBx0/8kpNgjiNpjX9AIwyqaJvFbTr24F1O7SJq6BEMM+I4n/TivXijx
         e5jgeO55sYPYz5W7OqZ4AwYTs2ZpOQGbkDEHBZQk7UmBxlT/Vzh3AgAdM37NGizlUeuZ
         dJyUIjn9V63t4yCdC5GQsxCMvbedu7EXjpkTKiAcAPSGe0+/TlIvvclPDNAmkn0MJImN
         LC1+93MJyTiHaXxgdor1srt5gASxpcexVNkZoYXLCRKfx4ADNgNyn1+WgPZkeNkD7nu1
         C7HA==
X-Gm-Message-State: ACrzQf1AOUQQikH8MnvnHyxENh3h0d7WBXASRBgkp/60wqWOmPlZdJSK
        C1YxmtfvptjQ6aeKa4/8M5iKImUsygWzdQ==
X-Google-Smtp-Source: AMsMyM4pDvrg02oo0sjqu/AuX0fh2bFmvCM1K9fI1tXVoCIgD0Ssn+2Q91XI6nrLBYRRQ3XT2eC/tw==
X-Received: by 2002:a05:6402:50d4:b0:45d:fe2:45 with SMTP id h20-20020a05640250d400b0045d0fe20045mr7061845edb.221.1666177797096;
        Wed, 19 Oct 2022 04:09:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id qn24-20020a170907211800b0073c10031dc9sm8792284ejb.80.2022.10.19.04.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 04:09:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 19 Oct 2022 13:09:56 +0200
Message-Id: <CNPUQGP720NA.3KXP115T46HC@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Fenglin Wu" <quic_fenglinw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>
Cc:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>
Subject: Re: [PATCH v3 0/2] Add LED driver for flash module in QCOM PMICs
X-Mailer: aerc 0.12.0
References: <20221018014024.948731-1-quic_fenglinw@quicinc.com>
 <CNPPXFMBHOPK.2XSBJT5M1TNVP@otso>
 <fbae8ec2-a645-6141-8308-3122c2ca9fab@quicinc.com>
In-Reply-To: <fbae8ec2-a645-6141-8308-3122c2ca9fab@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Fenglin,

On Wed Oct 19, 2022 at 12:17 PM CEST, Fenglin Wu wrote:
>
>
> On 2022/10/19 15:23, Luca Weiss wrote:
> > Hi Fenglin,
> >=20
> > On Tue Oct 18, 2022 at 3:40 AM CEST, Fenglin Wu wrote:
> >> Initial driver and binding document changes for supporting flash LED
> >> module in Qualcomm Technologies, Inc. PMICs.
> >>
> >=20
> > Thanks for these patches, it's really nice to see drivers like this
> > being sent upstream!
> >=20
> > I've just tried these patches on pm6150l which also is compatible with
> > this driver (and used on sm7225-fairphone-fp4).
> >=20
> > The two different flash LEDs on the device I could adjust as expected
> > using sysfs:
> >=20
> > $ echo 255 > /sys/class/leds/yellow:flash-0/brightness
> > $ echo 255 > /sys/class/leds/white:flash-0/brightness
> >=20
> > Also lower brightness values resulted in lower brightness on the LED, s=
o
> > all is good here!
> >=20
> > But for flash usage, I couldn't figure out how to use it, doing the
> > following resulted in no change on the LED.
> >=20
> > $ cat /sys/class/leds/white:flash-0/max_flash_brightness
> > 1000000
> > $ echo 1000000 > /sys/class/leds/white:flash-0/flash_brightness
> >=20
> > Here's my LED definition:
> >=20
> >    led-0 {
> >      function =3D LED_FUNCTION_FLASH;
> >      color =3D <LED_COLOR_ID_YELLOW>;
> >      led-sources =3D <1>;
> >      led-max-microamp =3D <180000>;
> >      flash-max-microamp =3D <1000000>;
> >      flash-max-timeout-us =3D <1280000>;
> >    };
> >=20
> >  From values are from msm-4.19 kernel:
> >=20
> >    qcom,flash_0 {
> >      qcom,current-ma =3D <1000>; // =3D> flash-max-microamp
> >      qcom,duration-ms =3D <1280>; // =3D> flash-max-timeout-us
> >      qcom,id =3D <0>; // =3D> led-sources?
> >    };
> >=20
> >    qcom,torch_0 {
> >      qcom,current-ma =3D <180>; // =3D> led-max-microamp
> >      qcom,id =3D <0>; // =3D> led-sources?
> >    };
> >=20
> > Could you please let me know how flash is supposed to work or if I
> > maybe have messed up some setting here?
> >=20
> > Regards
> > Luca
>
> Hi Luca,
>
> Thanks for testing the driver at your end.
> The "brightness" node is for enabling/disable/adjusting brightness when=
=20
> the LED is working in torch mode, the nodes for enabling/adjusting the=20
> LED behavior in flash mode are "flash_brightness" "flash_timeout"=20
> "flash_strobe".
> You can strobe the flash by "echo 1 > flash_strobe" directly and the=20
> default brightness/timeout value will be used, or you can update the=20
> settings with "echo xxx > flash_brightness; echo xxx > flash_timeout"=20
> then strobe the LED with "echo 1 > flash_strobe". Please remember you=20
> always need to "echo 0 > flash_strobe" 1st if you want to enable it again=
.
> Thanks

Indeed with flash_strobe it works as expected!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4 + p=
m6150l

Thanks again,
Luca

>
> Fenglin
> >=20
> >> Changes in V3:
> >>    1. Updated the driver to use regmap_field for register access.
> >>    2. Adressed the review comments in binding document change.
> >>
> >> Changes in V2:
> >>    1. Addressed review comments in binding change, thanks Krzysztof!
> >>    2. Updated driver to address the compilation issue reported by
> >>       kernel test robot.
> >>
> >>
> >> Fenglin Wu (2):
> >>    leds: flash: add driver to support flash LED module in QCOM PMICs
> >>    dt-bindings: add bindings for QCOM flash LED
> >>
> >>   .../bindings/leds/qcom,spmi-flash-led.yaml    | 116 +++
> >>   drivers/leds/flash/Kconfig                    |  15 +
> >>   drivers/leds/flash/Makefile                   |   1 +
> >>   drivers/leds/flash/leds-qcom-flash.c          | 700 ++++++++++++++++=
++
> >>   4 files changed, 832 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/leds/qcom,spmi-=
flash-led.yaml
> >>   create mode 100644 drivers/leds/flash/leds-qcom-flash.c
> >>
> >> --=20
> >> 2.25.1
> >=20

