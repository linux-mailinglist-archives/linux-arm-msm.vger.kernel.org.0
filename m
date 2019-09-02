Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05539A5100
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2019 10:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729797AbfIBIMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Sep 2019 04:12:09 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:38347 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729782AbfIBIMI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Sep 2019 04:12:08 -0400
Received: by mail-wr1-f52.google.com with SMTP id l11so4173054wrx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2019 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+mMBfGfyBXwVzvFVVfcxlJch8FPILgIOjN0mMOx57to=;
        b=H7zUbmDNXTLW3eCoCc7zvbS6pobtO0IYx8M00dTL91TOrBJAxIZGE809izxBaeL+mm
         N6GD4bG5Wb9PmZoabAqTdoG0UkXlNDb3FPiRjZ6RW6PEPMZi5vdjl3kEnv4WOzu3KIon
         1WhdOB4PnnWUDZzRiYUAY9X6L6OpOt7NCiI/00yuT3vq3kY7alMlGTEe3wggc8kQ7flz
         DNWnyI5pZBGtGt50e8Ce2bVMNrRRvpNW4UC7XgY2VLbzYT5XPj2aR4F8JMEFDcadVuzW
         5KL9Ch1ayCFK1x5GNp2TYuL21Ke1PgNHgiH6r7SNq107rj7B5mwxIPTAhZ36bTgrZ8ch
         bldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+mMBfGfyBXwVzvFVVfcxlJch8FPILgIOjN0mMOx57to=;
        b=MHcxil8XvFsFiLnouT3tVQbkVYGTaERNrn3voLpN2MPhli8JV7RJV+XribZUABit/Q
         +td6AO+8pZHQgkFDSCACjnVBs1VSx9nF3ZRz5njldlbUVixb54m8yRQPq/tK9EcOxBtL
         siGse6xuKrvMNFuJHiHskHSTPk8MwQx3+qnUlUyyFDeO9PeNb/AQQREyMuSXecGePheN
         mveUnuAdyTxnmN1tBhHNvLNUUmNoqDqFRxRbD/QKWVvR7VfGhOqPdKKIaekU8hkBjndk
         BJfHZk9RW1iof8+wK55W2KXy1VzuE1Ql6WvDT34MX0LrULqgaUNzTe52xdbCAv94X/vX
         AMHg==
X-Gm-Message-State: APjAAAUFx9QA+cuhkycxjGGm68VjJH7wNUjh1i3Y5k6zBFH7+Iek1oW8
        bTd5FkeYR3eQOpOfs8BjeOS8mA==
X-Google-Smtp-Source: APXvYqywQPyDv6ILjrXdAZAqwfPFaMqdQX4RwwrHVYMZBXzIEVOOyD8h5ALQ0yiiYgcwLnlRdAAGoA==
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr35018846wrw.64.1567411926634;
        Mon, 02 Sep 2019 01:12:06 -0700 (PDT)
Received: from dell ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id n12sm19000149wmc.24.2019.09.02.01.12.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 01:12:06 -0700 (PDT)
Date:   Mon, 2 Sep 2019 09:12:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "russianneuromancer@ya.ru" <russianneuromancer@ya.ru>
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
Subject: Re: ufshcd_abort: Device abort task at tag 7
Message-ID: <20190902081204.GO4804@dell>
References: <9f3ed253-5f6b-1893-531d-085f881956dd@free.fr>
 <20190828192031.GN6167@minitux>
 <9257741567170980@myt1-1e65ebab2412.qloud-c.yandex.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9257741567170980@myt1-1e65ebab2412.qloud-c.yandex.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Aug 2019, russianneuromancer@ya.ru wrote:

> Hello!
> 
> 
> > I don't remember the exact splats seen, but I would suggest that this is
> > retested after applying the following series:
> >
> > https://lore.kernel.org/linux-arm-msm/20190828191756.24312-1-bjorn.andersson@linaro.org/T/#u
> 
> Turns out this patches is already applied to kernel running on this device, but one line in dts was missing: 
> 
> https://github.com/aarch64-laptops/linux/pull/2
> 
> With this line issue is no longer reproducible with DT boot. Thank you!
> 
> As I understand it's planned to eventually boot this devices via ACPI. 
> 
> @Lee Jones, is my understanding correct?

No, not exactly.  We can boot these devices using ACPI, but with
limited functionality (when compared with booting using DT).  There
are too many black-boxes when booting with ACPI - something that can
only be resolved with Qualcomm's help.

Booting with ACPI helps us to use generic Linux distribution
installers, but it is expected for users to switch to DT once the OS
is installed.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
