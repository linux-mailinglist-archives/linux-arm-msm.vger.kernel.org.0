Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A343592F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 05:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhDIDTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 23:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbhDIDTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 23:19:46 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8B79C061760;
        Thu,  8 Apr 2021 20:19:33 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 18so4832990edx.3;
        Thu, 08 Apr 2021 20:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=imT+PhNFQPkgZJ6XFq69pmBRhnDsKNZq5XiDQndTV+E=;
        b=DECpiy3i0/XFLfIY5Am0Hj9hHoG3DAZvnIDCAzgS1PJ1GqgMmB4FTWZ6VLt4yavQdk
         oNW+79W45GRHhoRhEgPniFlLtQwtDaNtH9/+lDkrC5VhzQJGZPFmz4d808RXOb+f2ZhJ
         3GZJ7lJBWJ9jSwX3/EVRI56le0VTBY/OCE3S1sTdov2F7fB6nams44iLz8FcseZjJ0+A
         v/BkdgSy8nKAV3obXCZbXYQYHwVuU5NfTC68U0g6Oh9k80dt0zxhwiCi0WSGveypUqnQ
         6hm8doaBBk7atfMsOnM6QN+mjw74jfgnfbmEw7sXP/s5KDruUz29lWluy90YIaB/RNLV
         oc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=imT+PhNFQPkgZJ6XFq69pmBRhnDsKNZq5XiDQndTV+E=;
        b=r8niGl2T/1XS+LG933fBlZu5Nc3Zh/6eMVrU6UAy4hUIAWOLog7Mx063Mv9aZb0dBi
         CDr2/4HawopMiUT+raVTGOLWGZpn+5/0MgJZ3vvXp6s6Jo3+2PiRNXA/wWkW3duM39+6
         6GpY27XeF3ISqTW8hjoMKASYXTvszkZ0ihoCJ7n/C1BkrvC30VLprt3ApAjffTORWbB/
         4D/kqpg+4yNSq9ZTHzpCTR4HsiMzN3nFuBb74W0U8+9vJZn/00lMGZlMe55oGwq0bLK0
         6Av+EjrBz2fqIUTerJ43oXJfQglqYkgVPu6Qs6SMK/M+up5YFvPp+ZADN1GqFfE6QP88
         wEEw==
X-Gm-Message-State: AOAM530ZeeKkCTJLMjtEXnWGWS4MMHEZPKs49qW6msZSmQHeSXvH36f8
        wWFZ4hsSvpaQtHyIfa7fjZ0esuj4O67V5Q==
X-Google-Smtp-Source: ABdhPJyaUhrr5lnZNOIgbs3xY3qx5NP4+YmmWZsqaHGOn++wYr2XUviQPGw6TYu7aQceaV3Yp797aw==
X-Received: by 2002:a05:6402:397:: with SMTP id o23mr1413243edv.337.1617938372647;
        Thu, 08 Apr 2021 20:19:32 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id jt18sm552773ejc.96.2021.04.08.20.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:19:31 -0700 (PDT)
Date:   Fri, 9 Apr 2021 05:19:30 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YG/HwrzRcm7bwgFe@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik>
 <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Konrad,
> Hi,

> to clear up some confusion:


> On Qualcomm boards GPIOs that are used for "secure" (duh) peripherals,
> like a fingerprint scanner, are not allowed to be controlled from Linux (the "non-secure world").
> Trying to do so causes an immediate reboot due to "attempting to violate the security".
Thanks for an explanation.

> The GPIOs seem to all be iterated over on boot, except for the ones specified in "gpio-reserved-ranges".
> As a result, if such "secure" GPIOs are not declared in the DT, the board essentially dies on TLMM (pinctrl) probe
> (which happens veeeery early - so that all other peripherals can set the pins as they see fit)
> and that's very unpleasant to debug. Without this patch, Petr's device will simply not boot.
Exactly.

> So, why did it work before!?


> Well, either the GPIOs weren't iterated over, or the TLMM (pinctrl) driver wasn't in place back then.
I suppose GPIOs not being iterated over is the case for first fix (i.e. fixing
3edfb7bd76bd "gpiolib: Show correct direction from the beginning").

> As for the initrd crash.. perhaps you have an Android initrd which dies as soon as it doesn't detect SELINUX and a couple of other options.. You might want to try postmarketOS's one, or any other Linux distro's armv7/aarch64 initrd. To replace it, simply use abootimg like so:
No, that's postmarketOS initrd which dies

before a99163e9e708d5d773b7de6da952fcddc341f977:
[   17.421112] ALSA device list:
[   17.426233]   No soundcard?[   17.436163] Freeing unused kernel memory: 5760K
[   17.436462] Run /init as init process
[   17.439499]   with arguments:
[   17.443330]     /init
[   17.446277]     PMOS_NO_OUTPUT_REDIRECT
[   17.448535]   with environment:
[   17.452172]     HOME=/
[   17.455303]     TERM=linux
### postmarketOS initramfs ###
Configuring kernel firmware image search path
/init: line 56: can't create /proc/sys/kernel/hotplug: nonexistent directory
Trying to mount subpartitions for 10 seconds...

after a99163e9e708d5d773b7de6da952fcddc341f977:
[   17.383267] calling  regulator_init_complete+0x0/0x4c @ 1
[   17.390129] initcall regulator_init_complete+0x0/0x4c returned 0 after 6 usecs
[   17.395682] calling  of_platform_sync_state_init+0x0/0x18 @ 1
[   17.402800] initcall of_platform_sync_state_init+0x0/0x18 returned 0 after 3 usecs
[   17.408616] calling  alsa_sound_last_init+0x0/0x88 @ 1
[   17.416077] ALSA device list:
[   17.421198]   No soundcardû[   17.431360] Freeing unused kernel memory: 5824K
[   17.431633] Run /init as init process
[   17.434700]   with arguments:
[   17.438535]     /init
[   17.441477]     PMOS_NO_OUTPUT_REDIRECT
[   17.443737]   with environment:
[   17.447381]     HOME=/
[   17.450496]     TERM=linux
D -     15494 - pm_driver_init, Delta

> abootimg -u boot.img -r ramdisk.img



> If it says something something "too small", add


> -c "bootsize=30000000"


> to make the boot.img exactly 30 million bytes (or change it as you see fit).
abootimg is really ok, this is not the issue.

> Konrad

Kind regards,
Petr
