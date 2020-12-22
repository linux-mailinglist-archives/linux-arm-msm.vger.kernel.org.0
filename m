Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774882E069F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 08:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgLVHJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 02:09:56 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:60560 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgLVHJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 02:09:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608620971; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rXmG+yG1PufplSYABUCYYLNiRIqRtfqqzw3wspNfqlc=;
 b=Xu6Shlto13AtJptZbCyzvhLLNfjdh4iN11tO79iUSQErIyB6BCmQqWuzM4SufQzEpJfrbL12
 8xscHC7DqVDJLs9fLXoH7pyjX7klGz1H59By0fQc8IQ5mhH6YgiYBUMDwPvrz5uxakghdm+m
 tl1ZruIivSJsqpji+bFuL3csm+w=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe19b8ecfe5dd67db6541cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 07:09:02
 GMT
Sender: ziqichen=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CDAFC43465; Tue, 22 Dec 2020 07:09:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ziqichen)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2BB2C433CA;
        Tue, 22 Dec 2020 07:08:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Dec 2020 15:08:58 +0800
From:   ziqichen@codeaurora.org
To:     Kiwoong Kim <kwmad.kim@samsung.com>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        cang@codeaurora.org, hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        'Avri Altman' <avri.altman@wdc.com>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        'Andy Gross' <agross@kernel.org>,
        'Bjorn Andersson' <bjorn.andersson@linaro.org>,
        'Matthias Brugger' <matthias.bgg@gmail.com>,
        'Bean Huo' <beanhuo@micron.com>,
        'Bart Van Assche' <bvanassche@acm.org>,
        'Adrian@codeaurora.org, Hunter' <adrian.hunter@intel.com>,
        'Satya Tangirala' <satyat@google.com>,
        "'moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...'" 
        <linux-mediatek@lists.infradead.org>,
        'open list' <linux-kernel@vger.kernel.org>,
        "'open list:ARM/QUALCOMM SUPPORT'" <linux-arm-msm@vger.kernel.org>,
        "'moderated list:ARM/Mediatek SoC support'" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RFC v3 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
In-Reply-To: <000801d6d827$c8c89100$5a59b300$@samsung.com>
References: <CGME20201221075209epcas2p489ef5a304a7227ae1ef20e581c08c043@epcas2p4.samsung.com>
 <1608537091-78575-1-git-send-email-ziqichen@codeaurora.org>
 <009001d6d806$bbac1a30$33044e90$@samsung.com>
 <ddaf73587964e543e916368db036f536@codeaurora.org>
 <000801d6d827$c8c89100$5a59b300$@samsung.com>
Message-ID: <ded734a45aa6d9045ce568c9d265881c@codeaurora.org>
X-Sender: ziqichen@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-22 14:00, Kiwoong Kim wrote:
>> On 2020-12-22 10:04, Kiwoong Kim wrote:
>> >> As per specs, e.g, JESD220E chapter 7.2, while powering off/on the
>> >> ufs device, RST_N signal and REF_CLK signal should be between
>> >> VSS(Ground) and VCCQ/VCCQ2.
>> >>
>> >> To flexibly control device reset line, re-name the function
>> >> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
>> >> vops_toggle_device_reset(sturct ufs_hba *hba, bool down). The new
>> >> parameter "bool down" is used to separate device reset line pulling
>> >> down from pulling up.
>> >>
>> >> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
>> >> Cc: Stanley Chu <stanley.chu@mediatek.com>
>> >> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
>> >> ---
>> >>  drivers/scsi/ufs/ufs-mediatek.c | 27 +++++++++-----------------
>> >>  drivers/scsi/ufs/ufs-qcom.c     | 22 ++++++++++-----------
>> >>  drivers/scsi/ufs/ufshcd.c       | 43
>> >> ++++++++++++++++++++++++++++++------
>> > --
>> >> ---
>> >>  drivers/scsi/ufs/ufshcd.h       | 10 +++++-----
>> >>  4 files changed, 56 insertions(+), 46 deletions(-)
>> >>
>> >> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-
>> >> mediatek.c index 80618af..bff2c42 100644
>> >> --- a/drivers/scsi/ufs/ufs-mediatek.c
>> >> +++ b/drivers/scsi/ufs/ufs-mediatek.c
>> >> @@ -841,27 +841,18 @@ static int ufs_mtk_link_startup_notify(struct
>> >> ufs_hba *hba,
>> >>  	return ret;
>> >>  }
>> >>
>> >> -static int ufs_mtk_device_reset(struct ufs_hba *hba)
>> >> +static int ufs_mtk_toggle_device_reset(struct ufs_hba *hba, bool
>> >> down)
>> >>  {
>> >>  	struct arm_smccc_res res;
>> >>
>> >> -	ufs_mtk_device_reset_ctrl(0, res);
>> >> -
>> >> -	/*
>> >> -	 * The reset signal is active low. UFS devices shall detect
>> >> -	 * more than or equal to 1us of positive or negative RST_n
>> >> -	 * pulse width.
>> >> -	 *
>> >> -	 * To be on safe side, keep the reset low for at least 10us.
>> >> -	 */
>> >> -	usleep_range(10, 15);
>> >> -
>> >> -	ufs_mtk_device_reset_ctrl(1, res);
>> >> -
>> >> -	/* Some devices may need time to respond to rst_n */
>> >> -	usleep_range(10000, 15000);
>> >> +	if (down) {
>> >> +		ufs_mtk_device_reset_ctrl(0, res);
>> >> +	} else {
>> >> +		ufs_mtk_device_reset_ctrl(1, res);
>> >>
>> >> -	dev_info(hba->dev, "device reset done\n");
>> >> +		/* Some devices may need time to respond to rst_n */
>> >> +		usleep_range(10000, 15000);
>> >> +	}
>> >>
>> >>  	return 0;
>> >>  }
>> >> @@ -1052,7 +1043,7 @@ static const struct ufs_hba_variant_ops
>> >> ufs_hba_mtk_vops = {
>> >>  	.suspend             = ufs_mtk_suspend,
>> >>  	.resume              = ufs_mtk_resume,
>> >>  	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
>> >> -	.device_reset        = ufs_mtk_device_reset,
>> >> +	.toggle_device_reset        = ufs_mtk_toggle_device_reset,
>> >>  	.event_notify        = ufs_mtk_event_notify,
>> >>  };
>> >>
>> >> diff --git a/drivers/scsi/ufs/ufs-qcom.c
>> >> b/drivers/scsi/ufs/ufs-qcom.c index 2206b1e..c2ccaa5 100644
>> >> --- a/drivers/scsi/ufs/ufs-qcom.c
>> >> +++ b/drivers/scsi/ufs/ufs-qcom.c
>> >> @@ -1404,12 +1404,13 @@ static void ufs_qcom_dump_dbg_regs(struct
>> >> ufs_hba
>> >> *hba)  }
>> >>
>> >>  /**
>> >> - * ufs_qcom_device_reset() - toggle the (optional) device reset line
>> >> + * ufs_qcom_toggle_device_reset() - toggle the (optional) device
>> >> reset
>> >> + line
>> >>   * @hba: per-adapter instance
>> >> + * @down: pull down or pull up device reset line
>> >>   *
>> >>   * Toggles the (optional) reset line to reset the attached device.
>> >>   */
>> >> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
>> >> +static int ufs_qcom_toggle_device_reset(struct ufs_hba *hba, bool
>> >> down)
>> >>  {
>> >>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> >>
>> >> @@ -1417,15 +1418,12 @@ static int ufs_qcom_device_reset(struct
>> >> ufs_hba
>> >> *hba)
>> >>  	if (!host->device_reset)
>> >>  		return -EOPNOTSUPP;
>> >>
>> >> -	/*
>> >> -	 * The UFS device shall detect reset pulses of 1us, sleep for 10us
>> >> to
>> >> -	 * be on the safe side.
>> >> -	 */
>> >> -	gpiod_set_value_cansleep(host->device_reset, 1);
>> >> -	usleep_range(10, 15);
>> >> -
>> >> -	gpiod_set_value_cansleep(host->device_reset, 0);
>> >> -	usleep_range(10, 15);
>> >> +	if (down) {
>> >> +		gpiod_set_value_cansleep(host->device_reset, 1);
>> >> +	} else {
>> >> +		gpiod_set_value_cansleep(host->device_reset, 0);
>> >> +		usleep_range(10, 15);
>> >> +	}
>> >>
>> >>  	return 0;
>> >>  }
>> >> @@ -1473,7 +1471,7 @@ static const struct ufs_hba_variant_ops
>> >> ufs_hba_qcom_vops = {
>> >>  	.suspend		= ufs_qcom_suspend,
>> >>  	.resume			= ufs_qcom_resume,
>> >>  	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
>> >> -	.device_reset		= ufs_qcom_device_reset,
>> >> +	.toggle_device_reset		= ufs_qcom_toggle_device_reset,
>> >>  	.config_scaling_param = ufs_qcom_config_scaling_param,
>> >>  	.program_key		= ufs_qcom_ice_program_key,
>> >>  };
>> >> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
>> >> index e221add..2ee905f 100644
>> >> --- a/drivers/scsi/ufs/ufshcd.c
>> >> +++ b/drivers/scsi/ufs/ufshcd.c
>> >> @@ -585,7 +585,20 @@ static void ufshcd_device_reset(struct ufs_hba
>> >> *hba)
>> >> {
>> >>  	int err;
>> >>
>> >> -	err = ufshcd_vops_device_reset(hba);
>> >> +	err = ufshcd_vops_toggle_device_reset(hba, true);
>> >> +	if (err) {
>> >> +		dev_err(hba->dev, "device reset pulling down failure: %d\n",
>> >> err);
>> >> +		return;
>> >> +	}
>> >> +
>> >> +	/*
>> >> +	 * The reset signal is active low. The UFS device
>> >> +	 * shall detect reset pulses of 1us, sleep for at
>> >> +	 * least 10us to be on the safe side.
>> >> +	 */
>> >> +	usleep_range(10, 15);
>> >
>> > Is there any point where UFS specification tells this explicitly?
>> > I think this should be moved only if the number, i.e. 10 and 15  just
>> > relies on hardware conditions.
>> >
>> >
>> > Thanks.
>> > Kiwoong Kim
>> 
>> Hi Kiwoong,
>> 
>> Thanks for your comment. JESD220E Line 610~611 "The UFS device shall
>> detect more than or equal to 1us of positive or negative RST_n pulse".
>> Both QCOM and Mediatek use 10~15us. What number do you think more
>> appropriate?
>> 
>> Best Regards,
>> Ziqi
> 
> With yours, all the SoC vendors should wait for around 10us 
> unconditionally
> even if there will be a possibility that some can use shorter period.
> I see this as a sort of optimization point.
> 
> 
> Thanks.
> Kiwoong Kim

Got your point. As it is a controversial delay among different SoC 
vendor, I'll
move it back to vops and handle it by vendor's driver.

Best Regards,
Ziqi
>> 
>> >
>> >> +	err = ufshcd_vops_toggle_device_reset(hba, false);
>> >>
>> >>  	if (!err) {
>> >>  		ufshcd_set_ufs_dev_active(hba);
>> >> @@ -593,7 +606,11 @@ static void ufshcd_device_reset(struct ufs_hba
>> >> *hba)
>> >>  			hba->wb_enabled = false;
>> >>  			hba->wb_buf_flush_enabled = false;
>> >>  		}
>> >> +		dev_info(hba->dev, "device reset done\n");
>> >> +	} else {
>> >> +		dev_err(hba->dev, "device reset pulling up failure: %d\n",
>> >> err);
>> >>  	}
>> >> +
>> >>  	if (err != -EOPNOTSUPP)
>> >>  		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);  } @@ -
>> >> 8686,8 +8703,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum
>> >> ufs_pm_op pm_op)
>> >>  	if (ret)
>> >>  		goto set_dev_active;
>> >>
>> >> -	ufshcd_vreg_set_lpm(hba);
>> >> -
>> >>  disable_clks:
>> >>  	/*
>> >>  	 * Call vendor specific suspend callback. As these callbacks may
>> >> access @@ -8703,6 +8718,9 @@ static int ufshcd_suspend(struct ufs_hba
>> >> *hba, enum ufs_pm_op pm_op)
>> >>  	 */
>> >>  	ufshcd_disable_irq(hba);
>> >>
>> >> +	if (ufshcd_is_link_off(hba))
>> >> +		ufshcd_vops_toggle_device_reset(hba, true);
>> >> +
>> >>  	ufshcd_setup_clocks(hba, false);
>> >>
>> >>  	if (ufshcd_is_clkgating_allowed(hba)) { @@ -8711,6 +8729,8 @@
>> >> static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>> >>  					hba->clk_gating.state);
>> >>  	}
>> >>
>> >> +	ufshcd_vreg_set_lpm(hba);
>> >> +
>> >>  	/* Put the host controller in low power mode if possible */
>> >>  	ufshcd_hba_vreg_set_lpm(hba);
>> >>  	goto out;
>> >> @@ -8778,18 +8798,19 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> >> enum ufs_pm_op pm_op)
>> >>  	old_link_state = hba->uic_link_state;
>> >>
>> >>  	ufshcd_hba_vreg_set_hpm(hba);
>> >> +
>> >> +	ret = ufshcd_vreg_set_hpm(hba);
>> >> +	if (ret)
>> >> +		goto out;
>> >> +
>> >>  	/* Make sure clocks are enabled before accessing controller */
>> >>  	ret = ufshcd_setup_clocks(hba, true);
>> >>  	if (ret)
>> >> -		goto out;
>> >> +		goto disable_vreg;
>> >>
>> >>  	/* enable the host irq as host controller would be active soon */
>> >>  	ufshcd_enable_irq(hba);
>> >>
>> >> -	ret = ufshcd_vreg_set_hpm(hba);
>> >> -	if (ret)
>> >> -		goto disable_irq_and_vops_clks;
>> >> -
>> >>  	/*
>> >>  	 * Call vendor specific resume callback. As these callbacks may
>> >> access
>> >>  	 * vendor specific host controller register space call them when
>> >> the @@ -8797,7 +8818,7 @@ static int ufshcd_resume(struct ufs_hba
>> >> *hba, enum ufs_pm_op pm_op)
>> >>  	 */
>> >>  	ret = ufshcd_vops_resume(hba, pm_op);
>> >>  	if (ret)
>> >> -		goto disable_vreg;
>> >> +		goto disable_irq_and_vops_clks;
>> >>
>> >>  	/* For DeepSleep, the only supported option is to have the link off
>> >> */
>> >>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba)
>> >> && !ufshcd_is_link_off(hba)); @@ -8864,8 +8885,6 @@ static int
>> >> ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>> >>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>> >>  vendor_suspend:
>> >>  	ufshcd_vops_suspend(hba, pm_op);
>> >> -disable_vreg:
>> >> -	ufshcd_vreg_set_lpm(hba);
>> >>  disable_irq_and_vops_clks:
>> >>  	ufshcd_disable_irq(hba);
>> >>  	if (hba->clk_scaling.is_allowed)
>> >> @@ -8876,6 +8895,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
>> >> enum ufs_pm_op pm_op)
>> >>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>> >>  					hba->clk_gating.state);
>> >>  	}
>> >> +disable_vreg:
>> >> +	ufshcd_vreg_set_lpm(hba);
>> >>  out:
>> >>  	hba->pm_op_in_progress = 0;
>> >>  	if (ret)
>> >> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
>> >> index 9bb5f0e..dccc3eb 100644
>> >> --- a/drivers/scsi/ufs/ufshcd.h
>> >> +++ b/drivers/scsi/ufs/ufshcd.h
>> >> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
>> >>   * @resume: called during host controller PM callback
>> >>   * @dbg_register_dump: used to dump controller debug information
>> >>   * @phy_initialization: used to initialize phys
>> >> - * @device_reset: called to issue a reset pulse on the UFS device
>> >> + * @toggle_device_reset: called to change logic level of reset gpio
>> >> on
>> >> + the UFS device
>> >>   * @program_key: program or evict an inline encryption key
>> >>   * @event_notify: called to notify important events
>> >>   */
>> >> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
>> >>  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>> >>  	void	(*dbg_register_dump)(struct ufs_hba *hba);
>> >>  	int	(*phy_initialization)(struct ufs_hba *);
>> >> -	int	(*device_reset)(struct ufs_hba *hba);
>> >> +	int	(*toggle_device_reset)(struct ufs_hba *hba, bool down);
>> >>  	void	(*config_scaling_param)(struct ufs_hba *hba,
>> >>  					struct devfreq_dev_profile *profile,
>> >>  					void *data);
>> >> @@ -1216,10 +1216,10 @@ static inline void
>> >> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>> >>  		hba->vops->dbg_register_dump(hba);
>> >>  }
>> >>
>> >> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
>> >> +static inline int ufshcd_vops_toggle_device_reset(struct ufs_hba
>> >> *hba,
>> >> +bool down)
>> >>  {
>> >> -	if (hba->vops && hba->vops->device_reset)
>> >> -		return hba->vops->device_reset(hba);
>> >> +	if (hba->vops && hba->vops->toggle_device_reset)
>> >> +		return hba->vops->toggle_device_reset(hba, down);
>> >>
>> >>  	return -EOPNOTSUPP;
>> >>  }
>> >> --
>> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> >> Forum, a Linux Foundation Collaborative Project
