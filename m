Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA51C54E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 14:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731602AbfFYMEh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 08:04:37 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42231 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbfFYMEh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 08:04:37 -0400
Received: by mail-lj1-f194.google.com with SMTP id t28so15967559lje.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FgLLHR355y81+FuoQSsOM/HBX8V3lyxm9WVK5FPDEWQ=;
        b=yqAB78Q1S6zQ+2UV/1HtwLqfqGH7CsH2gycUdrerRjeErHsvqef06vS7Dlv7xTbUvz
         ZYyYmKklPqj2+gtpHkeZIL7H2vB8JiwUFmlZfRWBh9g9ghThd42y5Ni4Gj+VyV20+JrH
         BCYPvJrUHloRSjldvvjE/WJVuswwb3UKeOifFkcuTJcNbGae4gUjmaluj6ME4rwaYm1v
         0vMVOAqB7Ne4SgV0ON5cFnQWhm9i17V4LCwPy7mpbwgzlyFTWFE6UfEeCCgzx5GLMqif
         cZqSozGMZeZHvdvf7eylb8yiKn4npF/UJmVE4FjxSVzhfL0E0fH5niLDk9FT5mipbUqq
         RAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FgLLHR355y81+FuoQSsOM/HBX8V3lyxm9WVK5FPDEWQ=;
        b=MSSHiSrK52yQamQ/LtgTwfa82BPPY3xAPllFei3OLfiuxpoeAMDRZDz86z+VqDF4nF
         d2H5heaGotTudKsAXRxfTo4KK0tqVzBD8MadB1w61WCO2dTYdQNPukR7tV4N8JG4o1LZ
         8trUi4EjUg4N6cz9+X9eLtsktxnkzXGXmAyqCZcAtWFLNe34h/i2DkcnpQivby0w7QpR
         e9O/KfFocghiY9xtQdRDPOPEAr+ceD/w+iKIMLmLP23bPyJOYLPhc5wienNQJ6RDTmhg
         zxfFKnOysPAbL412zBYetwjeSLrf7pycx55Q1cC/93B3S9GFEmck5oNwGGfhTptzHdCk
         3Uqg==
X-Gm-Message-State: APjAAAV7h3s5XvLct7pVAafwUbkKt2h+Ceyogw38YPkeW/76QZHobtBM
        8ndVmwdCy299ld3eYALdmxfLvA==
X-Google-Smtp-Source: APXvYqwuPPTpgpeoKB4JPY8n/JN0xIaGttIU7LfrQ0VRUCjtOqiQWknf+3GZfVtT2L6q1eDLbT0jlg==
X-Received: by 2002:a2e:968f:: with SMTP id q15mr20167684lji.30.1561464274970;
        Tue, 25 Jun 2019 05:04:34 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id a29sm1934702lfi.23.2019.06.25.05.04.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 05:04:33 -0700 (PDT)
Date:   Tue, 25 Jun 2019 04:32:22 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Andy Gross <agross@kernel.org>
Cc:     arm@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Qualcomm Device Tree updates for 5.3
Message-ID: <20190625113222.z4lp4b5wjnqhdxay@localhost>
References: <1561006911-28519-1-git-send-email-agross@kernel.org>
 <1561006911-28519-4-git-send-email-agross@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561006911-28519-4-git-send-email-agross@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 12:01:51AM -0500, Andy Gross wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.3
> 
> for you to fetch changes up to 489bacb29818865d2db63d4800f4ddff56929031:
> 
>   ARM: dts: qcom: msm8974-hammerhead: add support for display (2019-06-16 11:27:45 -0700)
> 
> ----------------------------------------------------------------
> Qualcomm Device Tree Changes for v5.3
> 
> * Add display support to MSM8974
> * Add display, backlight, and touchscreen support to MSM8974 Hammerhead
> * Update coresight bindings for MSM8974 and APQ8064
> 
> ----------------------------------------------------------------
> Brian Masney (3):
>       ARM: dts: qcom: msm8974-hammerhead: add support for backlight
>       ARM: dts: msm8974: add display support
>       ARM: dts: qcom: msm8974-hammerhead: add support for display
> 
> Jonathan Marek (1):
>       ARM: dts: qcom: msm8974-hammerhead: add touchscreen support
> 
> Leo Yan (2):
>       ARM: dts: qcom-apq8064: Update coresight DT bindings
>       ARM: dts: qcom-msm8974: Update coresight DT bindings

Merged, thanks!


-Olof
