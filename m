Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6F45F14E3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 23:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiI3VbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 17:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbiI3Va4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 17:30:56 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3B4115BE6
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 14:30:55 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u92so5319024pjh.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=jW4RHlk7nZndQ1e8mtCt0bzYc8nmCjHrZvms+zp4HE4=;
        b=Xxj0Xqt6SDRwYKtOzs0oZge72SLV0ZION0kfu4e3Pk8dIVNL3NsaS4zZFdJwljXvmW
         dpTFHw6jbUDuWPpkDoJJJXOi+XnRxjDZruB9A2lTLQ8vCP/sE49eSvtHDIn0B8ioVDfW
         AtUEyUqXVENWRciUi2YoLDyuVn076U7jcdzCLxu4wi1TaXNmMFz11+qDFRCfK1vHlKOO
         GjOy+Zou3iC8OLcl5DPfYxnKqQQEFkyd0EL3JzsGoxqTK+FFV6KnNdARR+HKNALaR78K
         6imvgwhgcwCc52SbQMoETJxhOTSGJkQLK1T7Q9LEqFMql5V6659+FI7O/bbY6z/gDuh4
         hg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=jW4RHlk7nZndQ1e8mtCt0bzYc8nmCjHrZvms+zp4HE4=;
        b=vC9aZe+hTfHJr9K7yJSNrME3Yo1umYpmWsxsu7Vm5gwdDmJ/VvYuQVjAPxgsPPXYEX
         K9YZXBxUn/Qsz6O4EoXowobSMjSt1AYVxzBjLOIKJfSSFZkMY4WXXRMZrwewGwHThcd5
         biKSIsOsXVU2oWNslW38RKYfJpu6gsMUuMgnjJwsrlPRtaOGqYUdD4UYRJliPXFtdvjh
         rWeoIGpDsvaXK4UWouw7B9nrmTHeajiXRw65GXQanzlPySEYfJX8i4IEB3eInFATqm3f
         qD5yTNYqKgE2SeFmcPiMpB9zSf+Vz+2iiaDep9faSidmO4U7+bZXBfPJVONrR3Y+8ifH
         G9Ig==
X-Gm-Message-State: ACrzQf2nA1zVYaaQJqai+9p2Yxm6C8SsPinCxV8QW60Pu8atBg3AoRA/
        AQrcuAlNqdhCs8kc6DZi8Pvpm7Cv9CsrhGX/PcCgIrYRjzdAb8Et
X-Google-Smtp-Source: AMsMyM6LY+NeexYJpUmzCmieEL5TBzdJL7CuOB97GbU/YXXAO8D22o848MqRcHj3XcPvDbXrbXh8wsXIppzYH4huVF8=
X-Received: by 2002:a17:90b:3a81:b0:203:1247:4920 with SMTP id
 om1-20020a17090b3a8100b0020312474920mr261250pjb.102.1664573455210; Fri, 30
 Sep 2022 14:30:55 -0700 (PDT)
MIME-Version: 1.0
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Fri, 30 Sep 2022 23:30:44 +0200
Message-ID: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
Subject: msm8992-lg-bullhead-rev-101 resets in initramfs
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Ilya <ilya.manyugin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi all,

[ sorry for sending mail twice, now as plain text. I should move away
from gmail.com to something which allows to use mutt... ]

Some releases after 5.17 bullhead rev 1.01 started to reset.
I'm not sure which kernel version it started, because it might be
caused by kernel config or dts changes.

On current qcom/for-next (e89c75d437ca292d3ef377de341892f571d5d87a) it
resets immediately when loading sdhci controller (before reaching
initramfs).
I tried to disable sdhc1 and whole  rpm_requests in
arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi, which helped to
reach initramfs (from postmarketOS) and then it got reset in initramfs
during touching network [1] either in setup_usb_network() or later.
NOTE I'm using debug-shell hook [3], which probably calls
setup_usb_network().

I also tried to add tlmm { gpio-reserved-ranges = <85 4>; };
(inspiration from angler), but that obviously didn't help.

Maybe I have something harmful in config [4].

Any idea what could be wrong, what to try?

Kind regards,
Petr
