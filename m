Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AFB35F150A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 23:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbiI3Vj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 17:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiI3Vjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 17:39:54 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9FF347BB5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 14:39:52 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id b2so141983plc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 14:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XaVy0vDmvRE5cf4zca/jmgQZ6l20rr6TUTryHrZELA0=;
        b=BtIGpPG2U3NhkZAwsCGDvDWoAMAWunPuYOoNHujmYjLBvTlzLSZVqT6d2xM0PdrerB
         OrJZnyX9ZHBFV18yOPxoX9d8anZtGhBdf60ypGwezk6GKUKr7juwDxX9x+ITIUufJlZR
         BsJ5mckmNUoCtoce8JZKkEsrwZllbGR4U8okOqz+FVsvVbSf+VjtFJnnL1yQ4LrEmki0
         HH5xlUto00jfp0VYh457kohvdpK6iXU/krQqkMasQrL0QrkmpRQCCvscV7BwKRvkmjCj
         Y1ZW5k5xlM7MhlWkdges17LaQxayFf0joGJ7AGykn628DKJDDjAZyaLtiYxqxyr/nZFG
         vTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XaVy0vDmvRE5cf4zca/jmgQZ6l20rr6TUTryHrZELA0=;
        b=IuoeDV97wH3+fC5stinfkChyVY/DsRr8mtOtCrj7lXPmAEdRKYmeEJzcJIMErfg+Vp
         6ruWd8MdvTm9lEs9Y3dl2b8FmZ7U7IIHPqsLbuziqSmdY0W091sV/1DkEmUCcH4YS/bB
         ws2pBnzd/dGZH5pqdA8Qjb4tYOt7MtJk5mfujv82elclbfw+FnYOXYpiPBEWAbfgTKYT
         m/VZ50rQa5nUQaedOvg/3wAHyh6kDbms/qg/YJQV13So9Rw1YYm3o3OeeAOPaP+3RlDe
         LskgGMjSlWqQQrZ8eOd60oU/4djRUPQvmLJmUd93Y1ySNzQzRKs93B5N5xERhd9h5GrW
         eyrA==
X-Gm-Message-State: ACrzQf2ToP8dPCEVAHNAvagR6eRsRPhvDvEv2Gz/DXMocn9AvEbcMVDw
        9cuwV6tDzLCfiDhDQgGRDxvFPSQipmwvj/A7L8qPY2Yy+oQz+MS7
X-Google-Smtp-Source: AMsMyM4ogyKiWf3m3Db/UvEsiatxrNDk1WPjZdP9kCq4d0E/A1wnNxmjlfHzWEhaZmEa+xfFwi6FEzzZP3wpSJ/gU+c=
X-Received: by 2002:a17:90b:180e:b0:202:a0c3:6da with SMTP id
 lw14-20020a17090b180e00b00202a0c306damr292663pjb.94.1664573992244; Fri, 30
 Sep 2022 14:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
In-Reply-To: <CAB1t1CzwhBL3qu6GQZPwXBQG2YwFn9B+Aqi=81xgfA_2BCm=4A@mail.gmail.com>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Fri, 30 Sep 2022 23:39:41 +0200
Message-ID: <CAB1t1CxNcKBQ8wFGQmSupA1ix0C9hOUYPN6Sa-ACFcG_b9mY3w@mail.gmail.com>
Subject: Re: msm8992-lg-bullhead-rev-101 resets in initramfs
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

I'm sorry, forget to add links.
Petr

[1] https://gitlab.com/-/snippets/2420133
[2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs/init_functions.sh#L514-523
[3] https://gitlab.com/postmarketOS/pmaports/-/blob/master/main/postmarketos-mkinitfs-hook-debug-shell/20-debug-shell.sh
[4] https://gitlab.com/-/snippets/2420128

On Fri, 30 Sept 2022 at 23:30, Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi all,
>
> [ sorry for sending mail twice, now as plain text. I should move away
> from gmail.com to something which allows to use mutt... ]
>
> Some releases after 5.17 bullhead rev 1.01 started to reset.
> I'm not sure which kernel version it started, because it might be
> caused by kernel config or dts changes.
>
> On current qcom/for-next (e89c75d437ca292d3ef377de341892f571d5d87a) it
> resets immediately when loading sdhci controller (before reaching
> initramfs).
> I tried to disable sdhc1 and whole  rpm_requests in
> arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi, which helped to
> reach initramfs (from postmarketOS) and then it got reset in initramfs
> during touching network [1] either in setup_usb_network() or later.
> NOTE I'm using debug-shell hook [3], which probably calls
> setup_usb_network().
>
> I also tried to add tlmm { gpio-reserved-ranges = <85 4>; };
> (inspiration from angler), but that obviously didn't help.
>
> Maybe I have something harmful in config [4].
>
> Any idea what could be wrong, what to try?
>
> Kind regards,
> Petr
