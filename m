Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3D34286B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 16:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437219AbfFLOJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 10:09:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37712 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439584AbfFLOJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 10:09:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id v14so17077809wrr.4;
        Wed, 12 Jun 2019 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VqRsR02MRpXUpBmTyt+gotwvmYKpyFWAczeS3z19SOU=;
        b=Gg57xIIqwVV4RnV2ANTDzL2+YfITQx2vE4Y9d2hlrEOCXQQkntLVXiwLfxeX82EjvE
         hGf4OL47pLdCtUVZu4T/HepeaoAHnEd3GsxFUr93ViEck/tLEkcTkWIHJjA5FIQkxfuu
         xajdYxQ6gyD73stoT2KvRXpKNTr1qFc2FFKiJByENrmX/FOCNOBElSPXkhm7ieUmPrDi
         4ZRW9pnQ41cTgKywTQk/f0DkcTDjA8bzWUcxzNI6LAAdhhboXQbJ6ntqrSyVD2zrPP8V
         5zMlWY9PlvjRHtpqWWfNAwZp2vgM/VjC/SIa546QnDS3lczI1mJMis8h3x0yd2P78rQ4
         TT/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VqRsR02MRpXUpBmTyt+gotwvmYKpyFWAczeS3z19SOU=;
        b=YSOZfNhrjb/XEa+PLxqaea4KItbdMyHyDQYXERrB1W7jihy1+H5BXgbkmGqwlD++xj
         22fVwgwmNhuFbHm4grW2miagRAKmKtXE6quPHH+fF9+ui0TYCeyJ4DSlnKDVoSpQgInU
         CEjTa8nCIz+jrK1umicphshJGTDHwC1pRRZeibXoi15COtVE9I9tgEZYPlqezct2p2Lc
         gSNtinGR6ZVkrOA3bNfD+GX4mmc623Ok0KDf9mvntWk9sCHLMuW/eIknCeinGDR7ZcTs
         Q+u9+ZnWmScNCQIbtpNTJRDgwO74qEe7seifY0HjaPG5WSxUeGMYDbvYRT0uHX0wVnWB
         Hq0Q==
X-Gm-Message-State: APjAAAVcy3DndOwAAsXFRkouQoC2lhV+PxmwWYJbCSbMzZbIzk6Ikwm1
        joLnEGTDEtXtvyqJacUk/L0=
X-Google-Smtp-Source: APXvYqy2ksphkWG/pB6E0eHOxvp/qg8l/FsiJC9HmfAEpnA/dm5nE0SXyG7ZXAFSOdjcbz8QGPsUCg==
X-Received: by 2002:a5d:4b4f:: with SMTP id w15mr11954799wrs.199.1560348553929;
        Wed, 12 Jun 2019 07:09:13 -0700 (PDT)
Received: from gmail.com (net-31-27-155-100.cust.vodafonedsl.it. [31.27.155.100])
        by smtp.gmail.com with ESMTPSA id t140sm2772023wmt.0.2019.06.12.07.09.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 07:09:13 -0700 (PDT)
Date:   Wed, 12 Jun 2019 16:09:11 +0200
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Paolo Pisati <p.pisati@gmail.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: msm8996: qcom-qmp: apq8096-db820c fails to boot, reset back to
 fastboot and locks up
Message-ID: <20190612140911.GA16863@harukaze>
References: <20190610134401.GA12964@harukaze>
 <20190611171225.GA21992@centauri.ideon.se>
 <20190612131735.GB11167@centauri>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612131735.GB11167@centauri>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 12, 2019 at 03:17:35PM +0200, Niklas Cassel wrote:
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > index cd91b4179b10..22352e3b0ec5 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> > @@ -1490,7 +1490,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
> >  
> >         ret = qcom_qmp_phy_com_init(qphy);
> >         if (ret)
> > -               return ret;
> > +               goto err_lane_rst;
> >  
> >         if (cfg->has_lane_rst) {
> >                 ret = reset_control_deassert(qphy->lane_rst);

Hi Niklas,
unfortunately, it didn't help - i added a printk, to highlight when it failed:

--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1489,8 +1489,10 @@ static int qcom_qmp_phy_enable(struct phy *phy)
        }
 
        ret = qcom_qmp_phy_com_init(qphy);
-       if (ret)
-               return ret;
+       if (ret) {
+               dev_err(qmp->dev, "qphy initialization failed\n");
+               goto err_lane_rst;
+       }
 
        if (cfg->has_lane_rst) {
                ret = reset_control_deassert(qphy->lane_rst);

After several reboots i was able to trigger the phy init failure again:

...
[    2.223999] qcom-qmp-phy 34000.phy: Registered Qcom-QMP phy
[    2.224956] qcom-qmp-phy 7410000.phy: Registered Qcom-QMP phy
[    2.228798] ufs_qcom_phy_qmp_14nm 627000.phy: invalid resource
[    2.237271] qcom-qmp-phy 34000.phy: phy common block init timed-out
[    2.240315] qcom-qmp-phy 34000.phy: qphy initialization failed
...

these are the last lines printed, before rebooting in fastboot and
locking up there (as before[*]).

So, as far as i understand there are two distinct problems:

1) sometimes, qcom-qmp-phy fails to initialize

2) and when that happens, the failure is fatal and it led to a reboot & lockup
in fastboot

1: https://pastebin.ubuntu.com/p/rtjVrD3yzk/
-- 
bye,
p.
