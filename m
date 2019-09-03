Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB1AA6CDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 17:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfICPZy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 11:25:54 -0400
Received: from forward501o.mail.yandex.net ([37.140.190.203]:44410 "EHLO
        forward501o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728679AbfICPZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 11:25:54 -0400
X-Greylist: delayed 481 seconds by postgrey-1.27 at vger.kernel.org; Tue, 03 Sep 2019 11:25:52 EDT
Received: from mxback21o.mail.yandex.net (mxback21o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::72])
        by forward501o.mail.yandex.net (Yandex) with ESMTP id E67701E802DE;
        Tue,  3 Sep 2019 18:17:49 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback21o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id sP12zh0Lk0-Hmxe1Ksp;
        Tue, 03 Sep 2019 18:17:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1567523869;
        bh=xd4oAwVzKayMlSWnqNDk876qieyfNhXMXztAwmcI5rw=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=TXhRP4xCfsWC/CRn1QpUIpsQLX9nYEHR+PkqJVfI+pXWBS2vIGDG1N5hwI22wxqf+
         t8qgkX6Ce64FP1OaxV2PfhxACtYfleYMwg/hEUhSfQXO27mXn24uWlI3E5FcxJMN8E
         uGzVAHHE+AgCTisAXQZHmXXSMhHnGiyDmG86Kr8U=
Authentication-Results: mxback21o.mail.yandex.net; dkim=pass header.i=@ya.ru
Received: by sas2-b4ed770db137.qloud-c.yandex.net with HTTP;
        Tue, 03 Sep 2019 18:17:48 +0300
From:   "russianneuromancer@ya.ru" <russianneuromancer@ya.ru>
Envelope-From: russianneuromancer@yandex.ru
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        SCSI <linux-scsi@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stanley Chu <stanley.chu@mediatek.com>
In-Reply-To: <20190902081204.GO4804@dell>
References: <9f3ed253-5f6b-1893-531d-085f881956dd@free.fr>
         <20190828192031.GN6167@minitux>
         <9257741567170980@myt1-1e65ebab2412.qloud-c.yandex.net> <20190902081204.GO4804@dell>
Subject: Re: ufshcd_abort: Device abort task at tag 7
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Tue, 03 Sep 2019 23:17:48 +0800
Message-Id: <25410681567523868@sas2-b4ed770db137.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello!

> Booting with ACPI helps us to use generic Linux distribution
> installers, but it is expected for users to switch to DT once the OS
> is installed.

Thank you for clarification!

Should I close my bugreport when Bjorn's "Qualcomm UFS device reset support" series will hit upstream, or I should wait for additional fix that applicable for ACPI boot as well?  

I don't know if this boot delay is Ok for generic installer image, and it's not up to me to decide this, which is why I ask.

02.09.2019, 16:12, "Lee Jones" <lee.jones@linaro.org>:
> On Fri, 30 Aug 2019, russianneuromancer@ya.ru wrote:
>
>>  Hello!
>>
>>  > I don't remember the exact splats seen, but I would suggest that this is
>>  > retested after applying the following series:
>>  >
>>  > https://lore.kernel.org/linux-arm-msm/20190828191756.24312-1-bjorn.andersson@linaro.org/T/#u
>>
>>  Turns out this patches is already applied to kernel running on this device, but one line in dts was missing:
>>
>>  https://github.com/aarch64-laptops/linux/pull/2
>>
>>  With this line issue is no longer reproducible with DT boot. Thank you!
>>
>>  As I understand it's planned to eventually boot this devices via ACPI.
>>
>>  @Lee Jones, is my understanding correct?
>
> No, not exactly. We can boot these devices using ACPI, but with
> limited functionality (when compared with booting using DT). There
> are too many black-boxes when booting with ACPI - something that can
> only be resolved with Qualcomm's help.
>
> Booting with ACPI helps us to use generic Linux distribution
> installers, but it is expected for users to switch to DT once the OS
> is installed.
>
> --
> Lee Jones [李琼斯]
> Linaro Services Technical Lead
> Linaro.org │ Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
