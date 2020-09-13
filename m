Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD15268121
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Sep 2020 22:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgIMUQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Sep 2020 16:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgIMUQU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Sep 2020 16:16:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D849C06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 13:16:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a9so4391368pjg.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2020 13:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=GYBP2JGLGUtUqH27ROonim0LtfWgpWeL3ItWWerhmjU=;
        b=pu7wiTAm08HRyago4fRRrd4D2Cc94CvxLelosy9RBi4+LLeaS+q2eieDd+SUC6P8tw
         bPa1ThB4ifU/6Qcy2EUhufFyPHHhaMHqeH5vQhnVkMB1bXkhOjxp44r32wPHrsmfT6SO
         T4b2NnWJzxgxDFIsJiTquJB6UbMj9E4tUiVyhsmBBW7w91g7S2wUQQzCUkv1XVP9hRN7
         aNT39f8KUfxXytqTicpvsjksjnnVXLuDTbS4fl3fCeR5EURxEeHy9DmaWWH80Lvngbks
         eKkvl+V7MLDGMxWUgGOpGJ9H3GIySriN8BJa8OW3B6r87g75q//RKN2SlWlbVhNX+WHE
         JCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GYBP2JGLGUtUqH27ROonim0LtfWgpWeL3ItWWerhmjU=;
        b=cSTXssJFb1eULb0DsVm6Ai1axoefSOYYocoDCNQRiN0cYF4MjPJNA2pkQuteDTLe3s
         +WRfeRZ9uepqC4xAhovTwNIWkI2dy0gcaUkUTDhoUNiJ3dk8JX7YUuF2FZDbE/0USJLR
         +bBFvq92o0235J7Ntb/y4+MpWc9TVcnbK0FZ4qDlWDxDfN7rXoSF49RR0Mns1miBkg/i
         mykVZRUVPEPeNkO1Vq/9XF8VkUTXEIhgdPF3vw2Wdv/ZnnaeLkqVMIfFw5RfrcH2X6pg
         EnESmK7jMxsVv8OKn7a+G/FNlbTvsxrCO3xQSFpSfAfsFemvarxYaEL5ilQxIjCmA4og
         zAEw==
X-Gm-Message-State: AOAM531Xnnlc7i1YaYRF1NFz2rzg6wCsnDEmXiP1CjBwHLoOjql/lQmW
        4fV/f7Oq5FgNpndFm5se+CY=
X-Google-Smtp-Source: ABdhPJy/rXknAFZ1m9Q03M8SCXA20TLxJKE5LdA2+d0TzMoEWovqOXJZRvcl9ZeSy/NROZOmCNPIAg==
X-Received: by 2002:a17:90a:ee16:: with SMTP id e22mr10157492pjy.81.1600028172021;
        Sun, 13 Sep 2020 13:16:12 -0700 (PDT)
Received: from bDebian ([2601:647:5800:2ac5:9eef:d5ff:fefc:64ae])
        by smtp.gmail.com with ESMTPSA id r206sm8298764pfr.91.2020.09.13.13.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 13:16:11 -0700 (PDT)
Date:   Sun, 13 Sep 2020 13:16:08 -0700
From:   Brian Norris <computersforpeace@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [RFC] qcom_scm: IPQ4019 firmware does not support atomic API?
Message-ID: <20200913201608.GA3162100@bDebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ TL;DR: I have an IPQ4019 firmware that needs to effectively revert
commit 13e77747800e ("firmware: qcom: scm: Use atomic SCM for cold
boot"). Am I insane, or is this something that upstream can support
(pending a patch, of course)? ]

Hi Qualcomm maintainers,

I'm bringing up mainline support for an IPQ4019-based system (the
original Google WiFi, if anyone cares), and I'm trying to avoid having
to update its bootloader too -- frankly, I'm not even sure I can effect
any meaningful change on its "secure world" firmware.

Currently, I'm finding that SMP doesn't work, because
qcom_scm_set_cold_boot_addr() returns -4 (QCOM_SCM_EOPNOTSUPP?). If I
switch back to the non-atomic SMC variant (and hack up scm_legacy_call()
a lot, to avoid the DMA API), things work beautifully. Similarly, the
vendor/BSP kernel only uses the non-atomic API for this function. This
suggests to me that my firmware does not support the atomic variant at
all (I see no other such calls being made, besides SMP initialization).

IOW, my current patch looks to effectively revert 13e77747800e
("firmware: qcom: scm: Use atomic SCM for cold boot"), and bring back
ARM32-specific portions of commit 16e59467a446 ("firmware: qcom: scm:
Convert to streaming DMA APIS"). The latter is necessary because the DMA
API is not available to early SMP init, when there is no "device"
available.

I would just post a patch, but:
(a) this looks to be totally opposite of the direction that ARM support
    is "supposed" to be moving and
(b) I've tried that before, for a similar problem domain [1], and was
    met with deafening silence. Considering this patch would be much
    more invasive, I thought I'd just pose a question first instead.

So, back to the TL;DR, am I insane? Well, I may be insane regardless,
but is it reasonable to bring back non-atomic support for this case? I
can try to limit the damage to ARM32 at least (that's the only user of
qcom_scm_set_cold_boot_addr()), but it still isn't the prettiest, given
the "unified" nature of the current qcom_scm driver.

Note that I can't find evidence that other IPQ4019 users have the same
problem (presumably someone (e.g., in the OpenWRT community) would be
complaining about lack of SMP otherwise?), so I have to assume there are
endless firmware variants out there, as with everything in the ARM
world.

Thanks,
Brian

[1] [RFC PATCH] firmware: qcom_scm: disable SDI at boot
    https://lore.kernel.org/linux-arm-msm/20200721080054.2803881-1-computersforpeace@gmail.com/
