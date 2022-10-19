Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643DD603A91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 09:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiJSHYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 03:24:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiJSHYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 03:24:01 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F26377EBC
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 00:23:59 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id fy4so37786300ejc.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 00:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVhcn8rDoBy3TMzgN0ZgHDkOdg3DMt8Ju30w4znO6Cg=;
        b=GEoHJVcjlqsa39YBrvVkMdZsbeZmEcK29+Xi+NHAu0VRkB8HXfkDu6sYCOedxM1Cg8
         K+D4mVRNdjkI4cmC9fMuLC9jz7BuQp4r3HzvaFpGZvUG52Nhsn5pu/zTp2TlXCj3PGkr
         PhONIphXAzqWvQmnWYibFQCNRlVlX+ureMej4/iQSHOiaCbUa7RMzpKodfXbJIcOj5z/
         DNpVPUfGitAmzg/3F8HpdK6N7QL5wHlSHJDzk5PhtYOFSgvtHODLUoNWnAKU0/uPr6VA
         Oj0XvobYIVL74iyErWpIARDntvivNWBDcxPOiv5qIhM/Cn8dE0deNTUUCWW3I0gB4Og3
         zsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVhcn8rDoBy3TMzgN0ZgHDkOdg3DMt8Ju30w4znO6Cg=;
        b=WRIkMtvkd8tywAfoaoLOYZpEr2/g5XYv5sa+JzH/F80toyIJC/BA7xhej/Q+M1XpLV
         8R9QzLODluVUTwpCzAgVI3Yqc/Nm2zvKx7NXY7u3aEf/o66AnV4HOc3Pj3TFJ70+m2dD
         xDZCv6SHkc26QDnf5yr8K24YXBHx73cVUFtg5PXfnTkY09judkPPudBltyZV63ViS+GS
         0oJ8xUmvyoJmnVgjU6cn8LWIss4e1lAXyeDFhMmcKOI/aMTI67j+utHz8sbGe3qibMH8
         ivaIB2sgeGQX370MiHKZDCykRRZadNQrI2Zohq38W0N6iOLJT7XA0b7h40c8NgvxPYvs
         8vtg==
X-Gm-Message-State: ACrzQf1fm/cHACD9VVeVK3B4poQLHLZeCEjQk2drhAtNHoRpFaESBtU+
        Yfg8RmuCjS4UbvN2wpSqDYYxnA==
X-Google-Smtp-Source: AMsMyM6XDx7A2wmleEUs2BHGkxa/FawvwkGc+Tlx+zHXc79X509FxBRWbUUrI7eRBBh/HDgKSVZ6Eg==
X-Received: by 2002:a17:907:2e0b:b0:78d:387d:1579 with SMTP id ig11-20020a1709072e0b00b0078d387d1579mr5449057ejc.761.1666164237834;
        Wed, 19 Oct 2022 00:23:57 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906314e00b0073d84a321c8sm8639969eje.166.2022.10.19.00.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 00:23:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 19 Oct 2022 09:23:56 +0200
Message-Id: <CNPPXFMBHOPK.2XSBJT5M1TNVP@otso>
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Fenglin Wu" <quic_fenglinw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>
Cc:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>
Subject: Re: [PATCH v3 0/2] Add LED driver for flash module in QCOM PMICs
X-Mailer: aerc 0.12.0
References: <20221018014024.948731-1-quic_fenglinw@quicinc.com>
In-Reply-To: <20221018014024.948731-1-quic_fenglinw@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Fenglin,

On Tue Oct 18, 2022 at 3:40 AM CEST, Fenglin Wu wrote:
> Initial driver and binding document changes for supporting flash LED
> module in Qualcomm Technologies, Inc. PMICs.
>

Thanks for these patches, it's really nice to see drivers like this
being sent upstream!

I've just tried these patches on pm6150l which also is compatible with
this driver (and used on sm7225-fairphone-fp4).

The two different flash LEDs on the device I could adjust as expected
using sysfs:

$ echo 255 > /sys/class/leds/yellow:flash-0/brightness
$ echo 255 > /sys/class/leds/white:flash-0/brightness

Also lower brightness values resulted in lower brightness on the LED, so
all is good here!

But for flash usage, I couldn't figure out how to use it, doing the
following resulted in no change on the LED.

$ cat /sys/class/leds/white:flash-0/max_flash_brightness
1000000
$ echo 1000000 > /sys/class/leds/white:flash-0/flash_brightness

Here's my LED definition:

  led-0 {
    function =3D LED_FUNCTION_FLASH;
    color =3D <LED_COLOR_ID_YELLOW>;
    led-sources =3D <1>;
    led-max-microamp =3D <180000>;
    flash-max-microamp =3D <1000000>;
    flash-max-timeout-us =3D <1280000>;
  };

From values are from msm-4.19 kernel:

  qcom,flash_0 {
    qcom,current-ma =3D <1000>; // =3D> flash-max-microamp
    qcom,duration-ms =3D <1280>; // =3D> flash-max-timeout-us
    qcom,id =3D <0>; // =3D> led-sources?
  };

  qcom,torch_0 {
    qcom,current-ma =3D <180>; // =3D> led-max-microamp
    qcom,id =3D <0>; // =3D> led-sources?
  };

Could you please let me know how flash is supposed to work or if I
maybe have messed up some setting here?

Regards
Luca

> Changes in V3:
>   1. Updated the driver to use regmap_field for register access.
>   2. Adressed the review comments in binding document change.
>
> Changes in V2:
>   1. Addressed review comments in binding change, thanks Krzysztof!
>   2. Updated driver to address the compilation issue reported by
>      kernel test robot.
>
>
> Fenglin Wu (2):
>   leds: flash: add driver to support flash LED module in QCOM PMICs
>   dt-bindings: add bindings for QCOM flash LED
>
>  .../bindings/leds/qcom,spmi-flash-led.yaml    | 116 +++
>  drivers/leds/flash/Kconfig                    |  15 +
>  drivers/leds/flash/Makefile                   |   1 +
>  drivers/leds/flash/leds-qcom-flash.c          | 700 ++++++++++++++++++
>  4 files changed, 832 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/qcom,spmi-flas=
h-led.yaml
>  create mode 100644 drivers/leds/flash/leds-qcom-flash.c
>
> --=20
> 2.25.1

