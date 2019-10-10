Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA860D2C95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 16:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfJJOch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 10:32:37 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:41563 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfJJOch (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 10:32:37 -0400
Received: by mail-wr1-f52.google.com with SMTP id q9so8181760wrm.8;
        Thu, 10 Oct 2019 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=8IUUKLVZ3UnTZSHFIwWQZB+NT//+CYlcNW0zQRL7WAI=;
        b=cUgfxbGZfP88dsSzkRQDoSLx3TSMvXgwA2vV3QlpHbQ53h/c9GsbQOOZvgAqFmVqJK
         CkPinDlNZ9zn6l9/PGo8tUgkBj3fGLTlNgCVSBvpIG9l6d/y2cvdjvunSA99bp41MaFr
         okVvEtwLvSAIP4d/+0rDv/A15KT75PkjFLp/fvB7xFhYFv6+NI69zunKPcAwXKHs6vWv
         chSqlL7n3Ht9YVQQ9i+pxghCsEgVtKo6MjfUUdRY0A3O/k3QvJvQFfCahsYIfor3BUIC
         IH0OHYJVlh9M8wT57yQ5ZMe3Uk04Kej5R4tROOojMzLsHkNI6gii9CWmfWzQHybSD9Zp
         RTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=8IUUKLVZ3UnTZSHFIwWQZB+NT//+CYlcNW0zQRL7WAI=;
        b=FlFgq1qg/7Ad79X+M3OV1u7osQ+tN+dxUGIrxgBNA/JZLSVrMpTMDcS/wv8JzZzwp0
         GTjLNLCbkFgckypPzWKtFgJK76di4mrXYrskQeX7aSDQYLw84eBYHU9JtSC7N3bQ9Ms7
         K+ayjyotpWzSlE7RYo3N5dyHRDN8OMNxbgtk188QruYbJu71Fj3HVo1eDQD/e//m+Rnu
         3CD6lHKKOBu2wfDYRL+Y9lPEi71U+/RYHIpY47Zwvt/Sc+y+izntv/0Wbe2Q6JC74ayj
         pTV8YQ3gNI21nV1rz5zs2vMNsSxWdYLAVF9Sk0+ojOtf0Ran5xDz9uNXWrBAfHkQKb2Y
         kudg==
X-Gm-Message-State: APjAAAVIstpIIVKG85t4nDLSYx113jrDWnM908mH142kYiKvenIXS2Lk
        WN6x1X8fSkyKsxxkcDbJXNJIDTxy
X-Google-Smtp-Source: APXvYqwfr/+1hvFNj+HMpk1Z40bXBfVlVzk+6ayABXHr0qu4/ZfTdELmgE6IePqtUZHE2QtzVRYxrw==
X-Received: by 2002:a5d:518f:: with SMTP id k15mr8440968wrv.328.1570717954137;
        Thu, 10 Oct 2019 07:32:34 -0700 (PDT)
Received: from gmail.com (net-93-144-2-18.cust.dsl.teletu.it. [93.144.2.18])
        by smtp.gmail.com with ESMTPSA id t17sm11986502wrp.72.2019.10.10.07.32.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 07:32:33 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:32:32 +0200
From:   Paolo Pisati <p.pisati@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: msm8996: sdhci-msm: apq8096-db820c sdhci fails to init - "Timeout
 waiting for hardware interrupt."
Message-ID: <20191010143232.GA13560@harukaze>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sdhci consistenlty fails to initialize (and thus work) on my apq8096-db820c.

The issue is present since v5.0[*] mainline up to latest v5.4-rc2, using defconfig and:

CONFIG_SCSI_UFS_QCOM=y
CONFIG_PHY_QCOM_QMP=y
CONFIG_PHY_QCOM_UFS=y
CONFIG_ATL1C=y

but can be 100% reproduced with a clean defconfig too.

During boot, when it's time to mount the sdcard, mmc0 spits out a lot of:

...
[   13.683059] mmc0: Timeout waiting for hardware interrupt.
[   13.683095] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[   13.687441] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00004902
[   13.693861] mmc0: sdhci: Blk size:  0x00004200 | Blk cnt:  0x00000000
[   13.700285] mmc0: sdhci: Argument:  0x00012444 | Trn mode: 0x00000033
[   13.706707] mmc0: sdhci: Present:   0x01680206 | Host ctl: 0x0000001f
[   13.713131] mmc0: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
[   13.719555] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
[   13.725979] mmc0: sdhci: Timeout:   0x0000000a | Int stat: 0x00000000
[   13.732403] mmc0: sdhci: Int enab:  0x03ff900b | Sig enab: 0x03ff100b
[   13.738824] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[   13.745249] mmc0: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x00008007
[   13.751673] mmc0: sdhci: Cmd:       0x0000123a | Max curr: 0x00000000
[   13.758097] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x5b590000
[   13.764519] mmc0: sdhci: Resp[2]:   0x76b27f80 | Resp[3]:  0x0a404012
[   13.770944] mmc0: sdhci: Host ctl2: 0x00000000
[   13.777365] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x00000001588be200
[   13.781708] mmc0: sdhci: ============================================
[   13.888927] mmc0: Reset 0x4 never completed.
...
[   14.004327] mmc0: Controller never released inhibit bit(s).

in between several sdhci register dumps.

Has anyone seen that before? Is sdhci-msm support broken upstream or am i missing
something config-wise? 

Full boot logs here: https://pastebin.ubuntu.com/p/BtRrgnjV7J/

*: nothing earlier then v5.0 boots on this board, so i couldn't test it.
-- 
bye,
p.
