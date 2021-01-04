Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F77E2E9D97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 19:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbhADS7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 13:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726600AbhADS7o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 13:59:44 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BE4C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 10:59:04 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id r9so26960758otk.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uT5KCgk/jZMHf7cRAZ3Gk/Wa2EphxQ+0xFsMXQbfN0o=;
        b=bqRK3JFFGg93mU6uZPWaW5akXaVmSZlkgDvU5fw1iBZ9MPoMudZLGU9073yYQ2I/WZ
         cb16w/QoLwHW5ornVsNvPjULH3bA32uPjZoZjugiNiukbEVLt+GLEmHTE9+UE+tLhtvM
         AXMdawT4Yu4j3xMoZZQ85b6NjKCVhdBHlIAIQ9AhAm1LLKhJU7wxahlvbnL+qQMWpCC/
         vDtbv36sm8UOZdgRztkXZmrxHRpqzojCcabpjbC/ifkhOQaclbEpTO++2yRuXHFf+hWT
         p/U/K/nanu5TYDYAmuVlgx0gf+gLYTjDPYlWcwlEmgpEW0Gt80Y/rHv/ONIIdl8vIi9p
         Seiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uT5KCgk/jZMHf7cRAZ3Gk/Wa2EphxQ+0xFsMXQbfN0o=;
        b=mmSBP1i9IJHI2RH1jIt9D3DqWwiOldHKR7wzTe5fyAR//3NZIwpuZqvx6NFLFitl20
         qKoX4d9orDzlA8kFbGFp62VGwQeOelqbxEI7qUdI5ifLoI8HjHKmJ0hczddwo4rvv5AZ
         2fNxMQa0T/UHl1tqskkoPlgGZY37mcMm3VVd0ZdC4YxbpYymCp55TNk6zq544vyK6Q1y
         QA9j8jrFNSgOCVxAqHKKV1cSC1bQrDLZFp1mVOy7EX5Q8cc0P38e82XqiwPP6uvlotYd
         R+qxmW3rJfi2vwMT6MlDOTTpch9pdy/jY7q7SFlmoIkeUXPpsRVLr02HzeUlAan6rktN
         Zymw==
X-Gm-Message-State: AOAM531Ny7wpOusHrzCGqvaBHK6oEJD6cZfMDuz6k09bERerTsIK5ssL
        QAacvaNC4+6ECI+KodOYy97UqQ==
X-Google-Smtp-Source: ABdhPJykDxuUHbhj9dk8p15JZDFShC0eDuWkVlmDxShYrt0cNWAckEn0sv1uwbialwYTBVLZAunxzA==
X-Received: by 2002:a05:6830:1e16:: with SMTP id s22mr51369315otr.110.1609786743465;
        Mon, 04 Jan 2021 10:59:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g12sm13323496oos.8.2021.01.04.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 10:59:02 -0800 (PST)
Date:   Mon, 4 Jan 2021 12:59:00 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Can Guo <cang@codeaurora.org>
Cc:     Ziqi Chen <ziqichen@codeaurora.org>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, hongwus@codeaurora.org,
        rnayak@codeaurora.org, vinholikatti@gmail.com,
        jejb@linux.vnet.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com, kwmad.kim@samsung.com,
        stanley.chu@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Satya Tangirala <satyat@google.com>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-mediatek@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Message-ID: <X/NldGPnKeY0c2uO@builder.lan>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <X+ob+FylvPfl3NR/@builder.lan>
 <4c3035c418d0a0c4344be84fb1919314@codeaurora.org>
 <182321abfc98e0cfca071d1ec1255f6d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <182321abfc98e0cfca071d1ec1255f6d@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Dec 19:48 CST 2020, Can Guo wrote:

> On 2020-12-29 09:18, Can Guo wrote:
> > On 2020-12-29 01:55, Bjorn Andersson wrote:
> > > On Tue 22 Dec 07:49 CST 2020, Ziqi Chen wrote:
> > > 
> > > > As per specs, e.g, JESD220E chapter 7.2, while powering
> > > > off/on the ufs device, RST_N signal and REF_CLK signal
> > > > should be between VSS(Ground) and VCCQ/VCCQ2.
> > > > 
> > > > To flexibly control device reset line, refactor the function
> > > > ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> > > > vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> > > > new parameter "bool asserted" is used to separate device reset
> > > > line pulling down from pulling up.
> > > > 
> > > > Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> > > > Cc: Stanley Chu <stanley.chu@mediatek.com>
> > > > Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> > > > ---
> > > >  drivers/scsi/ufs/ufs-mediatek.c | 32
> > > > ++++++++++++++++----------------
> > > >  drivers/scsi/ufs/ufs-qcom.c     | 24 +++++++++++++++---------
> > > >  drivers/scsi/ufs/ufshcd.c       | 36
> > > > +++++++++++++++++++++++++-----------
> > > >  drivers/scsi/ufs/ufshcd.h       |  8 ++++----
> > > >  4 files changed, 60 insertions(+), 40 deletions(-)
> > > > 
> > > > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
> > > > b/drivers/scsi/ufs/ufs-mediatek.c
> > > > index 80618af..072f4db 100644
> > > > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > > > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > > > @@ -841,27 +841,27 @@ static int
> > > > ufs_mtk_link_startup_notify(struct ufs_hba *hba,
> > > >  	return ret;
> > > >  }
> > > > 
> > > > -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> > > > +static int ufs_mtk_device_reset(struct ufs_hba *hba, bool asserted)
> > > >  {
> > > >  	struct arm_smccc_res res;
> > > > 
> > > > -	ufs_mtk_device_reset_ctrl(0, res);
> > > > +	if (asserted) {
> > > > +		ufs_mtk_device_reset_ctrl(0, res);
> > > > 
> > > > -	/*
> > > > -	 * The reset signal is active low. UFS devices shall detect
> > > > -	 * more than or equal to 1us of positive or negative RST_n
> > > > -	 * pulse width.
> > > > -	 *
> > > > -	 * To be on safe side, keep the reset low for at least 10us.
> > > > -	 */
> > > > -	usleep_range(10, 15);
> > > > -
> > > > -	ufs_mtk_device_reset_ctrl(1, res);
> > > > -
> > > > -	/* Some devices may need time to respond to rst_n */
> > > > -	usleep_range(10000, 15000);
> > > > +		/*
> > > > +		 * The reset signal is active low. UFS devices shall detect
> > > > +		 * more than or equal to 1us of positive or negative RST_n
> > > > +		 * pulse width.
> > > > +		 *
> > > > +		 * To be on safe side, keep the reset low for at least 10us.
> > > > +		 */
> > > > +		usleep_range(10, 15);
> > > 
> > > I see no point in allowing vendors to "tweak" the 1us->10us
> > > adjustment.
> > > The specification says 1us and we all agree that 10us gives us good
> > > enough slack. I.e. this is common code.
> > 
> > Hi Bjron,
> > 
> > We tried, but Samsung fellows wanted 5us. We couldn't get a agreement
> > on this delay in short term, so we chose to leave it in vops.
> > 
> > > 
> > > > +	} else {
> > > > +		ufs_mtk_device_reset_ctrl(1, res);
> > > > 
> > > > -	dev_info(hba->dev, "device reset done\n");
> > > > +		/* Some devices may need time to respond to rst_n */
> > > > +		usleep_range(10000, 15000);
> > > 
> > > The comment in both the Qualcomm and Mediatek drivers claim that
> > > this is
> > > sleep relates to the UFS device (not host), so why should it be
> > > different?
> > > 
> > > What happens if I take the device that Mediatek see a need for a 10ms
> > > delay and hook that up to a Qualcomm host? This really should go in
> > > the
> > > common code.
> > > 
> > 
> > Agree, but Qualcomm host didn't have any problems with 10us yet, so if
> > we put
> > the 10ms delay to common code, Qualcomm host would suffer longer delay
> > when
> > device reset happens - both bootup and resume(xpm_lvl = 5/6) latency
> > would
> > be increased.
> > 
> > Regards,
> > Can Guo.
> > 
> 
> Besides, currently this device reset vops is only registered by ufs-qcom.c
> and ufs-mediatek.c, meaning any delays that we put in the common code are
> not
> necessary for those who do not have this vops registered, i.e ufs-exynos.c,
> ufs-hisi.c.
> 

Surely we can detect this in the common code and only sleep if the vops
is implemented - and successfully deasserted the reset.

Regards,
Bjorn
