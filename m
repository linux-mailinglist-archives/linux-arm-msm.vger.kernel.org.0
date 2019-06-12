Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F6F42750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 15:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437581AbfFLNRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 09:17:41 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33720 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437430AbfFLNRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 09:17:41 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so12083402lfe.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2019 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=olVtNqgfDAV8QzwsEHcbF4HS6DldAiMSK2i/PaExH8Y=;
        b=Y3n3CJL6MQLaNLnpDPpIi04zq3C2rje6Y6b45S5VnDSla+tLtHIRJAXsv0oZ2AtQ/Q
         BEm+F2oMOOrT6C/ZsnEa52CZe1QHqSvUizwJIHmVv1NEsjAtMa6AB95v4X+xezzzEPzP
         BjXdBQZ1P6DBtIhwqEhxusym6OlTFnQg9bAtkw0D/sNAdcqbN5fh9aCPPr5i+aT4Yl1G
         EEhFFQ3f55iASjxeRSjdkDZ341YuSJTOjlMjlsznsjpZEb1DBvCsej3Zmv3WawKyuc8f
         Bwo/W9fyuhNRkj5JpOEKVK9O/+HfaR1QxxvK6bM9YpxHIEvFe+U7tchgjGDxltoJkvK2
         R/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=olVtNqgfDAV8QzwsEHcbF4HS6DldAiMSK2i/PaExH8Y=;
        b=EtQObrFunqU1qPdQpvw6zwhUblhFOUVax5l3kVK78q8ZW9gAd+1bq03jZGqsJJcD49
         Uyha3sSA2flAPBKQ+7upC57i9e910aKpJ1D9J8hgU0mrskKGvcI2BgamXIHk1d3vuMDv
         wSfQDZbVACNymoeJiavsoIOmQAS7PB06fMYNWtB4jJ7UnEsw0yGBXn0Ls6qicnjRQTY0
         67nSEJBudlX29KY9ORDLy2mE6loSR/Fu3hRDmqFY52f8XW+SNz2l+iKAJIyBbo6cy/o9
         l674JL2AGI3HqVhemc12DTsy/AfauvRCPFGWhEWvy5Ko4wV26kScZyZqQdukpQz1CS+v
         UzAQ==
X-Gm-Message-State: APjAAAWnLVveuBjmslgDfV8uQ7NS7tkx1j2+V1ht/Ut7Y43sOUZrrcAi
        ozNnId9dZUVO4enwPU0uoQ4GSQ==
X-Google-Smtp-Source: APXvYqxn76M1u/k97De2+SCUlsorPXtSvmvLe4G/mDiAvfpJOXHzoXPkLZogtSe128QGdpirrwg2Og==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr40519535lfl.1.1560345458799;
        Wed, 12 Jun 2019 06:17:38 -0700 (PDT)
Received: from centauri (m83-185-80-163.cust.tele2.se. [83.185.80.163])
        by smtp.gmail.com with ESMTPSA id l25sm159693lja.76.2019.06.12.06.17.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 06:17:37 -0700 (PDT)
Date:   Wed, 12 Jun 2019 15:17:35 +0200
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Paolo Pisati <p.pisati@gmail.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: msm8996: qcom-qmp: apq8096-db820c fails to boot, reset back to
 fastboot and locks up
Message-ID: <20190612131735.GB11167@centauri>
References: <20190610134401.GA12964@harukaze>
 <20190611171225.GA21992@centauri.ideon.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611171225.GA21992@centauri.ideon.se>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 11, 2019 at 07:12:25PM +0200, Niklas Cassel wrote:
> On Mon, Jun 10, 2019 at 03:44:01PM +0200, Paolo Pisati wrote:
> > From time to time, my apq8096-db820c fails to boot to userspace, reset back to
> > fastboot and locks up: to easily reproduce the issue, i'm boot looping using a
> > cron job with a 1 min reboot entry on the board while leaving a "while 1; do
> > fastboot boot boot.img; done" on the host pc.
> > 
> > The issue is present in mainline up to 5.2-rc4, using defconfig and:
> > 
> > CONFIG_SCSI_UFS_QCOM=y
> > CONFIG_PHY_QCOM_QMP=y
> > CONFIG_PHY_QCOM_UFS=y
> > 
> > but was present in previous releases too (e.g. 4.14., 4.19, etc qcom-lt or
> > mainline), where it's even easier to reproduce (e.g. takes way less reboots to
> > trigger it).
> 
> Hello Paolo,
> 
> I have a guess of what is going on.
> db820c has 3 PCIe controllers,
> that shares a singe QMP block (that has clocks, regulators, and resets).
> The QMP block has 3 PCIe PHYs, that have their own clocks and resets.
> 
> > 
> > These are the last lines printed out:
> > ...
> > [    7.407209] qcom-qmp-phy 34000.phy: Registered Qcom-QMP phy
> > [    7.448058] qcom-qmp-phy 7410000.phy: Registered Qcom-QMP phy
> > [    7.461859] ufs_qcom_phy_qmp_14nm 627000.phy: invalid resource
> > [    7.535434] qcom-qmp-phy 34000.phy: phy common block init timed-out
> 
> ^^ here the phy_init() called from pcie-qcom.c
> which ends up to a call to qcom_qmp_phy_enable()
> 
> which has this code:
> 
>         ret = qcom_qmp_phy_com_init(qphy);
>         if (ret)
>                 return ret;
> 
> qcom_qmp_phy_com_init() has this code:
> 
>         if (qmp->init_count++) {
>                 mutex_unlock(&qmp->phy_mutex);
>                 return 0;
>         }
> 
> qcom_qmp_phy_com_init() later fails,
> since the common block init time out, so the qmp driver
> disables clocks, asserts reset, and disables regulators
> 
> 
> > [    7.538596] phy phy-34000.phy.0: phy init failed --> -110
> > [    7.550891] qcom-pcie: probe of 600000.pcie failed with error -110
> 
> ^^ here the first PCIe controller instance fails to probe
> 
> > [    7.619008] qcom-pcie 608000.pcie: 608000.pcie supply vddpe-3v3 not found,
> > using dummy regulator
> 
> ^^ here the second PCIe controller is probed.
> 
> it will call phy_init()
> 
> which will again call qcom_qmp_phy_enable() which will call
> qcom_qmp_phy_com_init()
> 
> where this code:
> 
>         if (qmp->init_count++) {
>                 mutex_unlock(&qmp->phy_mutex);
>                 return 0;
>         }
> 
> now will return 0,
> 
> so clocks will never be enabled, resets never deasserted, regulators
> never enabled.
> 
> since qcom_qmp_phy_com_init() returns success in this case,
> qcom_qmp_phy_enable() will try to continue with the init,
> and writes to disabled hardware is usually not a good idea.
> 
> I think the proper fix for this is:
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index cd91b4179b10..22352e3b0ec5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -1490,7 +1490,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>  
>         ret = qcom_qmp_phy_com_init(qphy);
>         if (ret)
> -               return ret;
> +               goto err_lane_rst;
>  
>         if (cfg->has_lane_rst) {
>                 ret = reset_control_deassert(qphy->lane_rst);
> 
> 
> 
> Kind regards,
> Niklas
> 
> > 
> > Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> > S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
> > S - IMAGE_VARIANT_STRING=M8996LAB
> > S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
> > S - Boot Interface: UFS
> > S - Secure Boot: Off
> > ...
> > 
> > Full boot here: https://pastebin.ubuntu.com/p/rtjVrD3yzk/
> > 
> > Any idea what is going on? Am i doing something wrong?
> > -- 
> > bye,
> > p.

Adding Vivek.
