Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038ED2E9D96
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 19:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbhADS6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 13:58:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbhADS6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 13:58:45 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584B8C061798
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 10:57:38 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id n42so26967550ota.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AxRDxatAn48XeoAQDSF+FYroSeUTKm+snczcSA22SDI=;
        b=VtuLlXXLLXP4t7vcA9qGFIvFy+WuHiMvxFp9kFH+M1pw7QwHg+sx6/Byo83+FI+PIY
         e+x2qJlPffvnNEUQz89EW1hv6yZ9dTJmK3rCvggZpdvTR5mc5g+eVohDNo4VNnenzh1D
         3f8uKEwhOBo3iDQFSjHnRlruWqKjCiAYPwVD5kgf9cC/7MY/a8ZI8OmsKhQbcRqwiaNe
         pNzrr53ZBs/3G9F+3G4voZ7nr5uqLDgdBWYWWfT20YBq89Sr/vLf2c41Ax0GnW56drAn
         DE6njB5YWpdMACcleSX4DWJXwtKwcyRQHLdChMOAsdj1LpCE4cGEBLRNU9EQm9eY9QKO
         1Zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AxRDxatAn48XeoAQDSF+FYroSeUTKm+snczcSA22SDI=;
        b=hL0eR/8G1ZPyPp9tT4eWlMguF2Ac5h1kUSiZGAqli/Vt3/zmLCdjfpHMVUckfzDslY
         1HJp/G7X+niFzmqgqFRbmx561l0qA3tWwyTFW2tQ0cYFVW9UPZOYSDyjRndb+f32ETBO
         NwvmAWD6dXkHvzYwAJBeBpnhIlqdbijRaK1cvb9u1DkVoN5yMbGho+ymdueILfZ1YF4K
         mhDTOgJDakM9Oz54zqfIMg6aIQl6PShdZ8FZJqZuwlezPfzSi01m0G1XGtg8ioJ+sa8k
         ZCq9Hg8pzXdRThNfOvqFi6zfO6lb38ybmJBc2IgOEb86Vn4iIpGkOandxEIktgkDbGN2
         KpPA==
X-Gm-Message-State: AOAM532YjBx/g9uOVRB9TXF5rbFfiEXU4s2HPmBtFVA/TcfW/P/gVT+2
        nPL8Pda20ltvSaX3LZ+npbnBwA==
X-Google-Smtp-Source: ABdhPJyUhcbpbYYbEt6C5icdpl1bAabfGDLYUR0sTVoH29vN/MHPdtkQA6QD9b35GFVD0QS/W2kgPg==
X-Received: by 2002:a9d:640b:: with SMTP id h11mr41314232otl.224.1609786657572;
        Mon, 04 Jan 2021 10:57:37 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o21sm13708159otj.1.2021.01.04.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 10:57:36 -0800 (PST)
Date:   Mon, 4 Jan 2021 12:57:34 -0600
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
Message-ID: <X/NlHkiNdZO1hvJ2@builder.lan>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <X+ob+FylvPfl3NR/@builder.lan>
 <4c3035c418d0a0c4344be84fb1919314@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c3035c418d0a0c4344be84fb1919314@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Dec 19:18 CST 2020, Can Guo wrote:

> On 2020-12-29 01:55, Bjorn Andersson wrote:
> > On Tue 22 Dec 07:49 CST 2020, Ziqi Chen wrote:
> > 
> > > As per specs, e.g, JESD220E chapter 7.2, while powering
> > > off/on the ufs device, RST_N signal and REF_CLK signal
> > > should be between VSS(Ground) and VCCQ/VCCQ2.
> > > 
> > > To flexibly control device reset line, refactor the function
> > > ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> > > vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> > > new parameter "bool asserted" is used to separate device reset
> > > line pulling down from pulling up.
> > > 
> > > Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> > > Cc: Stanley Chu <stanley.chu@mediatek.com>
> > > Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> > > ---
> > >  drivers/scsi/ufs/ufs-mediatek.c | 32 ++++++++++++++++----------------
> > >  drivers/scsi/ufs/ufs-qcom.c     | 24 +++++++++++++++---------
> > >  drivers/scsi/ufs/ufshcd.c       | 36
> > > +++++++++++++++++++++++++-----------
> > >  drivers/scsi/ufs/ufshcd.h       |  8 ++++----
> > >  4 files changed, 60 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
> > > b/drivers/scsi/ufs/ufs-mediatek.c
> > > index 80618af..072f4db 100644
> > > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > > @@ -841,27 +841,27 @@ static int ufs_mtk_link_startup_notify(struct
> > > ufs_hba *hba,
> > >  	return ret;
> > >  }
> > > 
> > > -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> > > +static int ufs_mtk_device_reset(struct ufs_hba *hba, bool asserted)
> > >  {
> > >  	struct arm_smccc_res res;
> > > 
> > > -	ufs_mtk_device_reset_ctrl(0, res);
> > > +	if (asserted) {
> > > +		ufs_mtk_device_reset_ctrl(0, res);
> > > 
> > > -	/*
> > > -	 * The reset signal is active low. UFS devices shall detect
> > > -	 * more than or equal to 1us of positive or negative RST_n
> > > -	 * pulse width.
> > > -	 *
> > > -	 * To be on safe side, keep the reset low for at least 10us.
> > > -	 */
> > > -	usleep_range(10, 15);
> > > -
> > > -	ufs_mtk_device_reset_ctrl(1, res);
> > > -
> > > -	/* Some devices may need time to respond to rst_n */
> > > -	usleep_range(10000, 15000);
> > > +		/*
> > > +		 * The reset signal is active low. UFS devices shall detect
> > > +		 * more than or equal to 1us of positive or negative RST_n
> > > +		 * pulse width.
> > > +		 *
> > > +		 * To be on safe side, keep the reset low for at least 10us.
> > > +		 */
> > > +		usleep_range(10, 15);
> > 
> > I see no point in allowing vendors to "tweak" the 1us->10us adjustment.
> > The specification says 1us and we all agree that 10us gives us good
> > enough slack. I.e. this is common code.
> 
> Hi Bjron,
> 
> We tried, but Samsung fellows wanted 5us. We couldn't get a agreement
> on this delay in short term, so we chose to leave it in vops.
> 

I'm not able to find the code you're referring to.

> > 
> > > +	} else {
> > > +		ufs_mtk_device_reset_ctrl(1, res);
> > > 
> > > -	dev_info(hba->dev, "device reset done\n");
> > > +		/* Some devices may need time to respond to rst_n */
> > > +		usleep_range(10000, 15000);
> > 
> > The comment in both the Qualcomm and Mediatek drivers claim that this is
> > sleep relates to the UFS device (not host), so why should it be
> > different?
> > 
> > What happens if I take the device that Mediatek see a need for a 10ms
> > delay and hook that up to a Qualcomm host? This really should go in the
> > common code.
> > 
> 
> Agree, but Qualcomm host didn't have any problems with 10us yet, so if we
> put
> the 10ms delay to common code, Qualcomm host would suffer longer delay when
> device reset happens - both bootup and resume(xpm_lvl = 5/6) latency would
> be increased.
> 

Okay, for the resume case I accept that this is a measurable difference.
I still believe this is a property of the device and not the platform
though.

Regards,
Bjorn

> Regards,
> Can Guo.
> 
> > 
> > 
> > As such I really would prefer to see these delays in the common code!
> > You really shouldn't write code based on a speculation that one day
> > there might come someone who need other values - when that day come we
> > can just change the code, and if it never comes we're better off with
> > the cleaner implementation.
> > 
> > Regards,
> > Bjorn
> > 
> > > +	}
> > > 
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> > > index 2206b1e..fed10e5 100644
> > > --- a/drivers/scsi/ufs/ufs-qcom.c
> > > +++ b/drivers/scsi/ufs/ufs-qcom.c
> > > @@ -1406,10 +1406,11 @@ static void ufs_qcom_dump_dbg_regs(struct
> > > ufs_hba *hba)
> > >  /**
> > >   * ufs_qcom_device_reset() - toggle the (optional) device reset line
> > >   * @hba: per-adapter instance
> > > + * @asserted: assert or deassert device reset line
> > >   *
> > >   * Toggles the (optional) reset line to reset the attached device.
> > >   */
> > > -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> > > +static int ufs_qcom_device_reset(struct ufs_hba *hba, bool asserted)
> > >  {
> > >  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> > > 
> > > @@ -1417,15 +1418,20 @@ static int ufs_qcom_device_reset(struct
> > > ufs_hba *hba)
> > >  	if (!host->device_reset)
> > >  		return -EOPNOTSUPP;
> > > 
> > > -	/*
> > > -	 * The UFS device shall detect reset pulses of 1us, sleep for 10us
> > > to
> > > -	 * be on the safe side.
> > > -	 */
> > > -	gpiod_set_value_cansleep(host->device_reset, 1);
> > > -	usleep_range(10, 15);
> > > +	if (asserted) {
> > > +		gpiod_set_value_cansleep(host->device_reset, 1);
> > > 
> > > -	gpiod_set_value_cansleep(host->device_reset, 0);
> > > -	usleep_range(10, 15);
> > > +		/*
> > > +		 * The UFS device shall detect reset pulses of 1us, sleep for
> > > 10us to
> > > +		 * be on the safe side.
> > > +		 */
> > > +		usleep_range(10, 15);
> > > +	} else {
> > > +		gpiod_set_value_cansleep(host->device_reset, 0);
> > > +
> > > +		 /* Some devices may need time to respond to rst_n */
> > > +		usleep_range(10, 15);
> > > +	}
> > > 
> > >  	return 0;
> > >  }
> > > diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> > > index e221add..f2daac2 100644
> > > --- a/drivers/scsi/ufs/ufshcd.c
> > > +++ b/drivers/scsi/ufs/ufshcd.c
> > > @@ -585,7 +585,13 @@ static void ufshcd_device_reset(struct ufs_hba
> > > *hba)
> > >  {
> > >  	int err;
> > > 
> > > -	err = ufshcd_vops_device_reset(hba);
> > > +	err = ufshcd_vops_device_reset(hba, true);
> > > +	if (err) {
> > > +		dev_err(hba->dev, "asserting device reset failed: %d\n", err);
> > > +		return;
> > > +	}
> > > +
> > > +	err = ufshcd_vops_device_reset(hba, false);
> > > 
> > >  	if (!err) {
> > >  		ufshcd_set_ufs_dev_active(hba);
> > > @@ -593,7 +599,11 @@ static void ufshcd_device_reset(struct ufs_hba
> > > *hba)
> > >  			hba->wb_enabled = false;
> > >  			hba->wb_buf_flush_enabled = false;
> > >  		}
> > > +		dev_dbg(hba->dev, "device reset done\n");
> > > +	} else {
> > > +		dev_err(hba->dev, "deasserting device reset failed: %d\n", err);
> > >  	}
> > > +
> > >  	if (err != -EOPNOTSUPP)
> > >  		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);
> > >  }
> > > @@ -8686,8 +8696,6 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> > > enum ufs_pm_op pm_op)
> > >  	if (ret)
> > >  		goto set_dev_active;
> > > 
> > > -	ufshcd_vreg_set_lpm(hba);
> > > -
> > >  disable_clks:
> > >  	/*
> > >  	 * Call vendor specific suspend callback. As these callbacks may
> > > access
> > > @@ -8703,6 +8711,9 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> > > enum ufs_pm_op pm_op)
> > >  	 */
> > >  	ufshcd_disable_irq(hba);
> > > 
> > > +	if (ufshcd_is_link_off(hba))
> > > +		ufshcd_vops_device_reset(hba, true);
> > > +
> > >  	ufshcd_setup_clocks(hba, false);
> > > 
> > >  	if (ufshcd_is_clkgating_allowed(hba)) {
> > > @@ -8711,6 +8722,8 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> > > enum ufs_pm_op pm_op)
> > >  					hba->clk_gating.state);
> > >  	}
> > > 
> > > +	ufshcd_vreg_set_lpm(hba);
> > > +
> > >  	/* Put the host controller in low power mode if possible */
> > >  	ufshcd_hba_vreg_set_lpm(hba);
> > >  	goto out;
> > > @@ -8778,18 +8791,19 @@ static int ufshcd_resume(struct ufs_hba
> > > *hba, enum ufs_pm_op pm_op)
> > >  	old_link_state = hba->uic_link_state;
> > > 
> > >  	ufshcd_hba_vreg_set_hpm(hba);
> > > +
> > > +	ret = ufshcd_vreg_set_hpm(hba);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > >  	/* Make sure clocks are enabled before accessing controller */
> > >  	ret = ufshcd_setup_clocks(hba, true);
> > >  	if (ret)
> > > -		goto out;
> > > +		goto disable_vreg;
> > > 
> > >  	/* enable the host irq as host controller would be active soon */
> > >  	ufshcd_enable_irq(hba);
> > > 
> > > -	ret = ufshcd_vreg_set_hpm(hba);
> > > -	if (ret)
> > > -		goto disable_irq_and_vops_clks;
> > > -
> > >  	/*
> > >  	 * Call vendor specific resume callback. As these callbacks may
> > > access
> > >  	 * vendor specific host controller register space call them when the
> > > @@ -8797,7 +8811,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
> > > enum ufs_pm_op pm_op)
> > >  	 */
> > >  	ret = ufshcd_vops_resume(hba, pm_op);
> > >  	if (ret)
> > > -		goto disable_vreg;
> > > +		goto disable_irq_and_vops_clks;
> > > 
> > >  	/* For DeepSleep, the only supported option is to have the link
> > > off */
> > >  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba) &&
> > > !ufshcd_is_link_off(hba));
> > > @@ -8864,8 +8878,6 @@ static int ufshcd_resume(struct ufs_hba *hba,
> > > enum ufs_pm_op pm_op)
> > >  	ufshcd_link_state_transition(hba, old_link_state, 0);
> > >  vendor_suspend:
> > >  	ufshcd_vops_suspend(hba, pm_op);
> > > -disable_vreg:
> > > -	ufshcd_vreg_set_lpm(hba);
> > >  disable_irq_and_vops_clks:
> > >  	ufshcd_disable_irq(hba);
> > >  	if (hba->clk_scaling.is_allowed)
> > > @@ -8876,6 +8888,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
> > > enum ufs_pm_op pm_op)
> > >  		trace_ufshcd_clk_gating(dev_name(hba->dev),
> > >  					hba->clk_gating.state);
> > >  	}
> > > +disable_vreg:
> > > +	ufshcd_vreg_set_lpm(hba);
> > >  out:
> > >  	hba->pm_op_in_progress = 0;
> > >  	if (ret)
> > > diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> > > index 9bb5f0e..d5fbaba 100644
> > > --- a/drivers/scsi/ufs/ufshcd.h
> > > +++ b/drivers/scsi/ufs/ufshcd.h
> > > @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
> > >   * @resume: called during host controller PM callback
> > >   * @dbg_register_dump: used to dump controller debug information
> > >   * @phy_initialization: used to initialize phys
> > > - * @device_reset: called to issue a reset pulse on the UFS device
> > > + * @device_reset: called to assert or deassert device reset line
> > >   * @program_key: program or evict an inline encryption key
> > >   * @event_notify: called to notify important events
> > >   */
> > > @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
> > >  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
> > >  	void	(*dbg_register_dump)(struct ufs_hba *hba);
> > >  	int	(*phy_initialization)(struct ufs_hba *);
> > > -	int	(*device_reset)(struct ufs_hba *hba);
> > > +	int	(*device_reset)(struct ufs_hba *hba, bool asserted);
> > >  	void	(*config_scaling_param)(struct ufs_hba *hba,
> > >  					struct devfreq_dev_profile *profile,
> > >  					void *data);
> > > @@ -1216,10 +1216,10 @@ static inline void
> > > ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
> > >  		hba->vops->dbg_register_dump(hba);
> > >  }
> > > 
> > > -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
> > > +static inline int ufshcd_vops_device_reset(struct ufs_hba *hba,
> > > bool asserted)
> > >  {
> > >  	if (hba->vops && hba->vops->device_reset)
> > > -		return hba->vops->device_reset(hba);
> > > +		return hba->vops->device_reset(hba, asserted);
> > > 
> > >  	return -EOPNOTSUPP;
> > >  }
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
