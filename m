Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51C83A9A06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 14:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhFPMS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 08:18:28 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:33021 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbhFPMS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 08:18:28 -0400
Received: from [192.168.1.101] (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 030713F409;
        Wed, 16 Jun 2021 14:16:18 +0200 (CEST)
Subject: Re: [PATCH V1] mmc: sdhci: Update the software timeout value for sdhc
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
References: <1623835535-30871-1-git-send-email-sbhanu@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <1a14317a-075d-a9ac-f620-19d64c52e292@somainline.org>
Date:   Wed, 16 Jun 2021 14:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623835535-30871-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


I am not sure which SoC is this change supposed to address, but it does not fix the longstanding issue of a similar kind on msm8996:


[   25.448575] mmc0: Timeout waiting for hardware interrupt.
[   25.464270] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[   25.479768] mmc0: sdhci: Sys addr:  0x00000008 | Version:  0x00004902
[   25.495361] mmc0: sdhci: Blk size:  0x00004200 | Blk cnt:  0x00000006
[   25.510963] mmc0: sdhci: Argument:  0x01cd9f80 | Trn mode: 0x0000003b
[   25.526517] mmc0: sdhci: Present:   0x03f80206 | Host ctl: 0x0000001f
[   25.542178] mmc0: sdhci: Power:     0x0000000d | Blk gap:  0x00000000
[   25.557767] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
[   25.573427] mmc0: sdhci: Timeout:   0x0000000a | Int stat: 0x00000000
[   25.588983] mmc0: sdhci: Int enab:  0x03ff900b | Sig enab: 0x03ff100b
[   25.604645] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[   25.620273] mmc0: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x00008007
[   25.635752] mmc0: sdhci: Cmd:       0x0000123a | Max curr: 0x00000000
[   25.651351] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x5b590000
[   25.666879] mmc0: sdhci: Resp[2]:   0x73677f80 | Resp[3]:  0x00000900
[   25.682496] mmc0: sdhci: Host ctl2: 0x0000000c
[   25.697991] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x0000000101cd2200
[   25.713751] mmc0: sdhci_msm: ----------- VENDOR REGISTER DUMP -----------
[   25.729510] mmc0: sdhci_msm: DLL sts: 0x00000000 | DLL cfg:  0x6008642c | DLL cfg2: 0x0020a000
[   25.745564] mmc0: sdhci_msm: DLL cfg3: 0x00000008 | DLL usr ctl:  0x00000008 | DDR cfg: 0x80040873
[   25.761759] mmc0: sdhci_msm: Vndr func: 0x00018a9c | Vndr func2 : 0xfa8018a8 Vndr func3: 0x00024040
[   25.778080] mmc0: sdhci: ============================================
[   25.894360] mmc0: Reset 0x4 never completed.
[   25.910719] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
[   25.927143] mmc0: sdhci: Sys addr:  0x00000008 | Version:  0x00004902
[   25.943717] mmc0: sdhci: Blk size:  0x00004200 | Blk cnt:  0x00000006
[   25.960225] mmc0: sdhci: Argument:  0x01cd9f80 | Trn mode: 0x0000003b
[   25.976845] mmc0: sdhci: Present:   0x03f80206 | Host ctl: 0x0000001f
[   25.993490] mmc0: sdhci: Power:     0x0000000d | Blk gap:  0x00000000
[   26.010019] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
[   26.026693] mmc0: sdhci: Timeout:   0x0000000a | Int stat: 0x00000000
[   26.043262] mmc0: sdhci: Int enab:  0x03ff900b | Sig enab: 0x03ff100b
[   26.059955] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
[   26.076546] mmc0: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x00008007
[   26.093229] mmc0: sdhci: Cmd:       0x0000123a | Max curr: 0x00000000
[   26.109783] mmc0: sdhci: Resp[0]:   0x00000000 | Resp[1]:  0x00000000
[   26.126074] mmc0: sdhci: Resp[2]:   0x00000000 | Resp[3]:  0x00000000
[   26.142271] mmc0: sdhci: Host ctl2: 0x0000000c
[   26.158161] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x0000000101cd2200
[   26.174287] mmc0: sdhci_msm: ----------- VENDOR REGISTER DUMP -----------
[   26.190295] mmc0: sdhci_msm: DLL sts: 0x00000000 | DLL cfg:  0x6008642c | DLL cfg2: 0x0020a000
[   26.206518] mmc0: sdhci_msm: DLL cfg3: 0x00000008 | DLL usr ctl:  0x00000008 | DDR cfg: 0x80040873
[   26.222916] mmc0: sdhci_msm: Vndr func: 0x00018a9c | Vndr func2 : 0xfa8018a8 Vndr func3: 0x00024040
[   26.239484] mmc0: sdhci: ============================================


Konrad

