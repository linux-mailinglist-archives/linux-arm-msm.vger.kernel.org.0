Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD55728348
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 17:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235638AbjFHPLA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 11:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbjFHPK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 11:10:59 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28192D61
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 08:10:54 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-33e75ca0a8bso2273045ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686237053; x=1688829053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKYIY8lnLeesFrrYGM6yGBBcxp2DdDvQNqXJ/GPrn+0=;
        b=Dp/hF5bQjxr3uWLVBP9Lw5kIqZz+HfTy8DAcYPl/L5rag4pGgL4CEJQCEjPXcDtJR0
         NUPxlf7aOC9EETQ3FErDAV9lcSUYE27M+NBuvGBrJl/g81rpWcITExNAdN6wQW07+z2i
         jmnsbNZf+zEDxGmhbO4ut8LjHk1Vcm+0LV/nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686237053; x=1688829053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKYIY8lnLeesFrrYGM6yGBBcxp2DdDvQNqXJ/GPrn+0=;
        b=lr49yY/qlbEITKg8Ie7Z5WZ4HPLPQxA+NB5KMaKngI76qFaIQV4ekqW8jiG86O4x60
         JYd5s3Qd/p5Cw75f818pMFeFfwJMNhiZ4c+PdY7VhLHIu2C7iywkzxRQWPcrKgafwzmo
         JP8J/J8Pes9f/FXw6Vc78tXmP5Wwa/EkrsC2bxARdNVIGzDtPdmT+z5Jbz4M7d+Qnnco
         w6vKKCF8kWf/+JTqv4ruSqFNBQ0B9LmAMCTZ8h3a+XsiQ76EQ583mSv5gTJHkILQYjfA
         h8HBUAuT4lyGlJJXdXRlvBuWYTCAwtKhWxmatAyB7chnQfvY4+3tcfcGoSEfq+Fq1hJG
         y5Lw==
X-Gm-Message-State: AC+VfDySR4xE0dJitGYaOwDYo9yIC0KhoU6IR61W95NcLHdOuSba0tEv
        RA012vlXRws0Pdmf+d05YPtcjQkTeyAHsJA++g8=
X-Google-Smtp-Source: ACHHUZ4D9HcR+aPZN8NAH2UZuAoijBQehb8uQOGNhEhbtsP5/HzI1RO9hwnpjz137Pp038Josy3FcQ==
X-Received: by 2002:a92:d68c:0:b0:335:6e5d:afb4 with SMTP id p12-20020a92d68c000000b003356e5dafb4mr8267138iln.24.1686237053300;
        Thu, 08 Jun 2023 08:10:53 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id z3-20020a056638000300b004163438fd4esm323206jao.92.2023.06.08.08.10.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 08:10:52 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so101275ab.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 08:10:51 -0700 (PDT)
X-Received: by 2002:a92:c549:0:b0:33d:929c:af67 with SMTP id
 a9-20020a92c549000000b0033d929caf67mr120694ilj.17.1686237051541; Thu, 08 Jun
 2023 08:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <202306081419.Dzz0T4iW-lkp@intel.com>
In-Reply-To: <202306081419.Dzz0T4iW-lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jun 2023 08:10:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMryHK+8j9FCKtSxykB8Tc-tU_B7MXMQPxpkdP2h8mJA@mail.gmail.com>
Message-ID: <CAD=FV=UMryHK+8j9FCKtSxykB8Tc-tU_B7MXMQPxpkdP2h8mJA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To:     kernel test robot <lkp@intel.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, hsinyi@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 8, 2023 at 12:15=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Douglas,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on hid/for-next dtor-input/next dtor-input/for-lin=
us drm-misc/drm-misc-next linus/master v6.4-rc5 next-20230607]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/d=
t-bindings-HID-i2c-hid-Add-panel-property-to-i2c-hid-backed-touchscreens/20=
230608-055515
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git fo=
r-next
> patch link:    https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309c45=
5cd7e26b931c69993d4fba33bbe15%40changeid
> patch subject: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follo=
wer
> config: i386-randconfig-i003-20230607 (https://download.01.org/0day-ci/ar=
chive/20230608/202306081419.Dzz0T4iW-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git =
8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=3D1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add robh https://git.kernel.org/pub/scm/linux/kernel/g=
it/robh/linux.git
>         git fetch robh for-next
>         git checkout robh/for-next
>         b4 shazam https://lore.kernel.org/r/20230607144931.v2.8.Ib1a98309=
c455cd7e26b931c69993d4fba33bbe15@changeid
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Di386 olddefconfig
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang ~/bin/make.cr=
oss W=3D1 O=3Dbuild_dir ARCH=3Di386 SHELL=3D/bin/bash
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306081419.Dzz0T4iW-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: drm_panel_add_follower
>    >>> referenced by i2c-hid-core.c:1159 (drivers/hid/i2c-hid/i2c-hid-cor=
e.c:1159)
>    >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_pro=
be) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: drm_panel_remove_follower
>    >>> referenced by i2c-hid-core.c:1218 (drivers/hid/i2c-hid/i2c-hid-cor=
e.c:1218)
>    >>>               drivers/hid/i2c-hid/i2c-hid-core.o:(i2c_hid_core_rem=
ove) in archive vmlinux.a

Thanks for the report! Ugh, I guess I forgot that even though
DRM_PANEL is bool, it gets bundled up into all of DRM which can be a
module. Assuming that this series looks mostly the same in the next
version, I'll plan to add this:

depends on DRM || !DRM # if DRM=3Dm, this can't be 'y'

...to each of the i2c-hid subclasses.

-Doug
