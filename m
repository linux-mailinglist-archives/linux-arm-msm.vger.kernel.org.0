Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86DF9437913
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 16:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhJVOgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 10:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232949AbhJVOgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 10:36:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1B4C061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 07:33:44 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id y12so1918781eda.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Oct 2021 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aleksander-es.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/WVZM6fPojKl+UIwJ5m3rOvROAHJd6WnuD794RcLRAU=;
        b=QhX0x4AQqFOupQwCHW3UexCDrqUA0VSDwwb+DyDt5iEh0Uxgerdd1eRn6mZny/kFKQ
         QZS0UaCDDCTuxDk8rwSG9Iq5C7zB/Kz5t8ljHq7U1vrMZFZN/pY0c9WtwVHv2tsCqGeu
         a7Oo5P8fapdw2t5BXWdpaspQ7QDZ7cs4MgJC/Ys+wNurJZHLY3sSxY1DJMjCBKWW2iJ9
         bf9Gv3OGCGAsdbTDr0oNRFiv+eCIAObB6GCif8CNqoojbkt6GPJnCCnk4ITFXKczD6Mp
         3UcTBizS5SvhiWnuPurBiD6BiiqTHdpIq6cNmgagudJsUIrGlZW4t5oI7EgCNN1pTyP4
         /vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/WVZM6fPojKl+UIwJ5m3rOvROAHJd6WnuD794RcLRAU=;
        b=1asD/z7yZFRRKHwo+Z6obgMtKLpyBr4W9O5N1mp34HX8vSkW4F24Mm4SUcQlCWFqG8
         1CqPCJs6cBb7QTY50UjP3Ni+4yQKg4A0QF4FjokPf54gZsSxjv+NI4nptEe66HvX9O5n
         gWKqktL2zZO1wa/fPBu514XDKIiGXIOefIuPdPNrQaj5w1dDYhqckm0r+S5023Oq6Yq/
         HJPB6k1HHmjhDS7P9KUUZstUScY+tsIAn1AE3hFL0S7AOXfuJZCXN17RXzKKuiuothyZ
         eTDu3C3zklPQDV+5yO8v1OSfaqyzOMkSiHGQrBN34y4ygjnQm8yEFd10HoSO8Xzc8NRM
         gEaA==
X-Gm-Message-State: AOAM533m1Hfibo6NIFosUl0jJmAO6bONZbHdr4Wl/EaTnwzigUAIxFqt
        xdIwTXQN2Gmcw0/5YXUzDy6wrCfs4T6ZweSOXTUc1Q==
X-Google-Smtp-Source: ABdhPJzkdKTAQvd+r7gefjEewFVdtJOFgSLha9pjtBTflvt4XF0MAGLHbGPHdRdInJQSnHosie2JpuQOzrTYOB6r9Ao=
X-Received: by 2002:a17:907:168c:: with SMTP id hc12mr15692065ejc.570.1634913223181;
 Fri, 22 Oct 2021 07:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAAP7ucLJYfftfCuKxnW8Q7-duyEuGgHA5gk+h2JyyAzNq75QSA@mail.gmail.com>
 <da0ed6cf2c0a07295a09758259521b03a7bcdc19.camel@bootlin.com>
 <CAAP7ucLu9JJjo+gN6fsSZVGKHX6VGoYkgBmsA0s9qsA-hdH6=A@mail.gmail.com>
 <2c34a05884cd68eb08e061e9d4d1aa572d78f03c.camel@bootlin.com>
 <CAAP7ucLVBn3Vk25jqL18Qxtsd=PmCpTiNY5j_pgai4BBbTOGWA@mail.gmail.com>
 <CAMZdPi8QXrjN6VYU1VrGeOBhvVSnxopioM7POEOcS5ywsSFDHQ@mail.gmail.com>
 <CAAP7ucKL+5oUmidVp1W-oOyfuuYR3F-11GuNdxLX9iYijaL6_A@mail.gmail.com>
 <CAAP7uc+5=GMGgz3MKfSWaAtes1WwCCx+6iYhb058ZUr0=A52cg@mail.gmail.com>
 <CAMZdPi9cbDVWVxvimg-uc_TRvskrxbjEQ4AxdLjA57Ewm2tSPA@mail.gmail.com>
 <bd875c3b9d19f8827362b129999d84cd04ad90ae.camel@bootlin.com> <CAMZdPi_J7ePh22v7J3WgqO9X3Y1KffTm__TfL9jGHj61H2x9QA@mail.gmail.com>
In-Reply-To: <CAMZdPi_J7ePh22v7J3WgqO9X3Y1KffTm__TfL9jGHj61H2x9QA@mail.gmail.com>
From:   Aleksander Morgado <aleksander@aleksander.es>
Date:   Fri, 22 Oct 2021 16:33:32 +0200
Message-ID: <CAAP7ucL3T6nfLSj8p1Urqo2yPwBGfkK1JnOtpbcrkYWVnkCKdw@mail.gmail.com>
Subject: Re: Sierra Wireless EM9191 integration issues in mhi+wwan
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Thomas Perrot <thomas.perrot@bootlin.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey,

> What is done in the downstream driver?
>

For reference, the same kind of instabilities can also be observed
when using Sierra Wireless' MBPL driver (R20).

The failed boots look like:
[    7.048072] [D][mhi_pci_probe] enter
[    7.051852] mhictrl 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.059720] mhictrl 0000:01:00.0: enabling device (0000 -> 0002)
[   12.582341] [D][mhi_pci_probe] failed!
[   12.586130] mhictrl: probe of 0000:01:00.0 failed with error -5
[   12.593561] [D][mhi_netdev_init] enter
[   12.598049] [D][mhitty_init] Enter
[   12.601493] [D][mhitty_init] mhi_driver_register 0x0
[   12.606975] [D][mhi_uci_init] enter

The successful boots look like:
[    7.009119] [D][mhi_pci_probe] enter
[    7.012995] mhictrl 0000:01:00.0: BAR 0: assigned [mem
0x600000000-0x600000fff 64bit]
[    7.020877] mhictrl 0000:01:00.0: enabling device (0000 -> 0002)
[    7.027542] [D][mhi_async_power_up] current EE PASS THRU
[    7.027572] [D][mhi_pci_probe] Return successful
[    7.037764] [D][mhi_pm_st_worker] current EE AMSS
[    7.037773] [D][mhi_intvec_threaded_handlr] device ee:AMSS dev_state:READY
[    7.049532] [D][mhi_netdev_init] enter
[    7.054771] [D][mhitty_init] Enter
[    7.058247] [D][mhitty_init] mhi_driver_register 0x0
[    7.063982] [D][mhi_uci_init] enter
[   15.432947] [D][mhi_process_ctrl_ev_ring] MHI state change event to state:M0
[   15.440028] [D][mhi_pm_m0_transition] Entered With State:READY PM_STATE:POR
[   15.447060] [D][mhi_process_ctrl_ev_ring] MHI EE received event:AMSS
[   15.453447] [D][mhi_pm_mission_mode_transition] current EE AMSS
[   15.468941] [D][mhi_process_ctrl_ev_ring] MHI state change event to state:M3
[   15.481902] [D][mhi_pm_m3_transition] Entered mhi_state:M3 pm_state:M3
[   15.488438] [D][mhi_pm_resume] Entered with pm_state:M3 dev_state:M3
[   15.507320] [D][mhi_process_ctrl_ev_ring] MHI state change event to state:M0
[   15.514363] [D][mhi_pm_m0_transition] Entered With State:M3 PM_STATE:M3->M0
[   15.521437] [D][mhi_create_time_sync_dev] device add 0306_00.01.00_TIME_SYNC
[   15.521553] [D][mhi_create_devices] chan 5 device add 0306_00.01.00_DIAG
[   15.528676] [D][mhi_tty_probe] enter
[   15.539024] [D][mhi_tty_probe] probe chan DIAG successful!
[   15.544673] [D][mhi_create_devices] chan 13 device add 0306_00.01.00_MBIM
[   15.544735] [D][mhi_uci_probe] enter
[   15.555217] [D][mhi_uci_probe] channel:MBIM successfully probed
[   15.561312] [D][mhi_create_devices] chan 15 device add 0306_00.01.00_QMI0
[   15.561377] [D][mhi_uci_probe] enter
[   15.571824] [D][mhi_uci_probe] channel:QMI0 successfully probed
[   15.577897] [D][mhi_create_devices] chan 33 device add 0306_00.01.00_DUN
[   15.577960] [D][mhi_tty_probe] enter
[   15.588328] [D][mhi_tty_probe] probe chan DUN successful!
[   15.593893] [D][mhi_create_devices] chan 101 device add 0306_00.01.00_IP_HW0
[   15.593953] [D][mhi_netdev_probe] enter
[   15.826612] [D][mhi_netdev_probe] success
[   15.832353] [D][mhi_pm_mission_mode_transition] current EE AMSS
[   15.969077] [D][mhi_process_ctrl_ev_ring] MHI state change event to state:M3
[   15.982047] [D][mhi_pm_m3_transition] Entered mhi_state:M3 pm_state:M3
[   15.988602] [D][mhi_pm_resume] Entered with pm_state:M3 dev_state:M3
[   16.071030] [D][mhi_process_ctrl_ev_ring] MHI state change event to state:M0
[   16.078074] [D][mhi_pm_m0_transition] Entered With State:M3 PM_STATE:M3->M0

-- 
Aleksander
https://aleksander.es
