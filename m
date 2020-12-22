Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF042E05E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 07:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgLVGBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 01:01:40 -0500
Received: from mailout2.samsung.com ([203.254.224.25]:25175 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725820AbgLVGBk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 01:01:40 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20201222060055epoutp02fdf5040405d615e8d11b2d6970492798~S9IHkh6Vy0377103771epoutp02_
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 06:00:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20201222060055epoutp02fdf5040405d615e8d11b2d6970492798~S9IHkh6Vy0377103771epoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608616855;
        bh=XqRmRlAQlC72ecn4ix7/ysv8X8EoEWWWhcN1os2w1ic=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=nyQeZNOA92CcIb6AlLpKahnJdqZ1v0cdFp56umftagfiwAq+Sx3hgJyvU0Igd0BGP
         KZTqYqTvuumX6tDIX3XRdnLbqvFZaRrULn1aUDNG1JDU3d5wtVdGTT80HtncvsjYxz
         kJ1A3fN20LwAQnu+SneRsCusmfHUuk8zniekgleg=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20201222060051epcas2p152462a5018971e90d5d1270be03bfdf9~S9IEFn_NB0605406054epcas2p11;
        Tue, 22 Dec 2020 06:00:51 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.40.189]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4D0QgP5WcYz4x9Py; Tue, 22 Dec
        2020 06:00:49 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        BE.0F.56312.19B81EF5; Tue, 22 Dec 2020 15:00:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20201222060044epcas2p1b207a5cd8ad30855ac297c287bd6b091~S9H8xP6Df0093900939epcas2p1H;
        Tue, 22 Dec 2020 06:00:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201222060043epsmtrp2b74c7c793f49fd72ec5d04e915f2de14~S9H8su1CS1610016100epsmtrp2g;
        Tue, 22 Dec 2020 06:00:43 +0000 (GMT)
X-AuditID: b6c32a46-1d9ff7000000dbf8-3f-5fe18b91b7df
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        22.79.13470.B8B81EF5; Tue, 22 Dec 2020 15:00:43 +0900 (KST)
Received: from KORCO011456 (unknown [12.36.185.54]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201222060043epsmtip1834e1d58b75638184ee0f893f3ed3301~S9H8Wl-dF2032920329epsmtip1U;
        Tue, 22 Dec 2020 06:00:43 +0000 (GMT)
From:   "Kiwoong Kim" <kwmad.kim@samsung.com>
To:     <ziqichen@codeaurora.org>
Cc:     <asutoshd@codeaurora.org>, <nguyenb@codeaurora.org>,
        <cang@codeaurora.org>, <hongwus@codeaurora.org>,
        <rnayak@codeaurora.org>, <vinholikatti@gmail.com>,
        <jejb@linux.vnet.ibm.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>, <kernel-team@android.com>,
        <saravanak@google.com>, <salyzyn@google.com>,
        "'Alim Akhtar'" <alim.akhtar@samsung.com>,
        "'Avri Altman'" <avri.altman@wdc.com>,
        "'James E.J. Bottomley'" <jejb@linux.ibm.com>,
        "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Matthias Brugger'" <matthias.bgg@gmail.com>,
        "'Bean Huo'" <beanhuo@micron.com>,
        "'Bart Van Assche'" <bvanassche@acm.org>,
        "'Adrian Hunter'" <adrian.hunter@intel.com>,
        "'Satya Tangirala'" <satyat@google.com>,
        "'moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...'" 
        <linux-mediatek@lists.infradead.org>,
        "'open list'" <linux-kernel@vger.kernel.org>,
        "'open list:ARM/QUALCOMM SUPPORT'" <linux-arm-msm@vger.kernel.org>,
        "'moderated list:ARM/Mediatek SoC support'" 
        <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <ddaf73587964e543e916368db036f536@codeaurora.org>
Subject: RE: [PATCH RFC v3 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Date:   Tue, 22 Dec 2020 15:00:43 +0900
Message-ID: <000801d6d827$c8c89100$5a59b300$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYnlYW9RPy0rxW7i+kRjBOSmAq5wKVdWQhAW5/fNgCKCtQSadNsVVA
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTVxzHPbftvUXCcq3oziBoLZpNDdgCxYMT4nyQy2AbsmXJprFr6B0Q
        Stv0gjJiBjKHtIg8RJQWkDJgCRN0PCrI00J4jIlR8IUiICBoBvIIKBB1hVsT/vv8zvl+z+/3
        PSeHzxFcI5z4EapoWquSK0X4Wq65ZTtyy0gZkonNuZ+izpErOOoeXuKiwXwzjhqSOgj0YuEe
        jm4O6bioq2mSi7KnFjho5moJD3U9nyRQ4UMzhkozVKjmuiOqGL7PQxlNtwjUcyMXRz2/3QEo
        5UENjv5sf4ehxNOeaFpvBKikt5KHik9ZG+gtb3GU9lc/jmpMcaj40Rixz5nq6Q2kzHVmHtVz
        LhWjag39BFVQEUP9Uf8CoypKdTj15H49TqUXNgNq0FLJpSqL4qnXV5Nxanq0j0udqyoF1GzF
        JupMcwoWTP6o3BtOyxW0VkirQtWKCFWYryjwW9kBmdRbLHGT+KDdIqFKHkX7ig4GBbv5Ryit
        VyMSHpcrY6xLwXKGEe3y26tVx0TTwnA1E+0rojUKpUYi0bgz8igmRhXmHqqO2iMRiz2kVuVP
        yvDE8hs8zeLR2BFjI5YA8gL0wI4PSS9YW/AM6MFavoCsAdCk7yPYYgbA9+V5GFvMA1hd2Ag+
        WNpfddtUDQAu3XnPYYtxAA2tz4hlFU7uhNlDdbxldiRdYEZ5PW9ZxCEr+TB19j/u8oYd6Qev
        TJpXjl1PhsDxgf4V5pLbYH75GL7MDqQPtEwYeSyvg505IyteDimGr7ovc1jeDK9P5HLY8YRw
        YbTE1tgf9j9NB6zGERp1SSuTQnLGDl56PI+xhoOwuDjLlm09fNleRbDsBGcnG3CW42HjhQQe
        az4L4GjjO5vBExqen7Ey38qusLXPNtxHMLnlLcEuO8DkJAGrdoWLmedtzk9gzqMnRDoQGVZF
        M6yKZlgVzbAqQgHgloKNtIaJCqMZD43H6gevACtfZ4d/DciamHK3AIwPLADyOSJHB2+nAZnA
        QSH/JY7WqmXaGCXNWIDUetsZHKcNoWrr31NFyyRSD29vsY8USb09kOhjB0Y8KBOQYfJoOpKm
        NbT2gw/j2zklYPyt84qqm1uKfg+J23byhPPfxag6UL3GPvsYIhOZ7xbL7KpOpHbsn+aljcP0
        yVvO2eaCLfjt7XP3TLrp6s1H1+lb91zs1TwOGnM7UvC60JKJKQRj3DZwMaBI4nb31wMXBvLG
        /DLfHA72qvsyxGU+JJ932fllrNF0ZP+bS5J2l63KtofNluqAXYPBzU0RCcaSkbAHi3Pxiaad
        Ezma732Pc6O6InUbN4gDj21q0Hs6Kcrc03I6Fft8dKdK8oZPYh1Tpe61P9vXLv0TGXH78Oex
        8tNBVU9/iDH9a2Tuttgf+ubQ3GeuWfzp8x11wpyvRssnJs/5tmm/uFZWRawp64qf/5o+u9tL
        xGXC5ZIdHC0j/x8rY4nCwwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7bCSnG5398N4gzVTTCxOPlnDZnHu8W8W
        iwfztrFZ7G07wW7x8udVNouDDztZLE7vf8diMe3DT2aLT+uXsVqcfvaO3WLRjW1MFqsm5lns
        2C5isenxNVaLifvPsltc3jWHzeJy80VGi+7rO9gslh//x2TR1GJs8bFrNqPFsiubWS2WNgIt
        6Dr0l82if/VdNosdC6sslt58zu4g7XH5irfHtt3bWD0u9/UyeeycdZfdY8GmUo/Fe14yeWxa
        1cnmcefaHjaPCYsOMHo8OLSZxWPzknqP7+s72Dw+Pr3F4tG3ZRWjx+dNch7tB7qZAgSiuGxS
        UnMyy1KL9O0SuDKa1u1iLfgVU/Fk9j6mBsa5nl2MnBwSAiYSx9+fY+9i5OIQEtjNKNF44wUT
        REJS4sTO54wQtrDE/ZYjrBBFzxglzk9oZwNJsAloS0x7uJsVxBYRkJWYuG4PWBGzwHEOiW0N
        /5hBEkICPxklJt4vBLE5Bewk1rzbBjZVWCBA4sDO22CDWARUJeatew5m8wpYShx6O5sVwhaU
        ODnzCQuIzSxgJHHu0H42CFteYvvbOcwQ1ylI/Hy6DOoIN4m79yYwQtSISMzubGOewCg8C8mo
        WUhGzUIyahaSlgWMLKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3MYITj5bmDsbtqz7o
        HWJk4mA8xCjBwawkwmsmdT9eiDclsbIqtSg/vqg0J7X4EKM0B4uSOO+FrpPxQgLpiSWp2amp
        BalFMFkmDk6pBqagHS+Of9UL2LJ4JssuH1Y/wzfHxTk3mfLXf9SZ7qp46fhU7X2P9PY9SHTb
        mq1Rsnnz922M3Utfp6v7f9SdfLvPYTHTCb2i6lcbXP9ZrVuTsndlcPA8Vb+Nq3V/n/3wfaGJ
        p45DdM+UbR4b3+V/n+Hr++xy7LnZgV37jza838VqsuzQwtjg4t+t3HtbDWtudN/mymKtaDh8
        SO/zTa/5vKsrHh++Zr6ZWUCGbWYY42wnR9fczufn2T9l6TBxT5p7e+ELt4NrmatLn1aLis44
        9jFM6fF7MT5en9eaOsvkX/w0Xld6udu5yW9hir5Edshh+zOn39xb+FrxgG6nEl8b4zdGToP9
        jlZ8TPNU4o3U5vYqsRRnJBpqMRcVJwIAtkmP9KsDAAA=
X-CMS-MailID: 20201222060044epcas2p1b207a5cd8ad30855ac297c287bd6b091
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201221075209epcas2p489ef5a304a7227ae1ef20e581c08c043
References: <CGME20201221075209epcas2p489ef5a304a7227ae1ef20e581c08c043@epcas2p4.samsung.com>
        <1608537091-78575-1-git-send-email-ziqichen@codeaurora.org>
        <009001d6d806$bbac1a30$33044e90$@samsung.com>
        <ddaf73587964e543e916368db036f536@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On 2020-12-22 10:04, Kiwoong Kim wrote:
> >> As per specs, e.g, JESD220E chapter 7.2, while powering off/on the
> >> ufs device, RST_N signal and REF_CLK signal should be between
> >> VSS(Ground) and VCCQ/VCCQ2.
> >>
> >> To flexibly control device reset line, re-name the function
> >> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> >> vops_toggle_device_reset(sturct ufs_hba *hba, bool down). The new
> >> parameter "bool down" is used to separate device reset line pulling
> >> down from pulling up.
> >>
> >> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> >> Cc: Stanley Chu <stanley.chu@mediatek.com>
> >> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> >> ---
> >>  drivers/scsi/ufs/ufs-mediatek.c | 27 +++++++++-----------------
> >>  drivers/scsi/ufs/ufs-qcom.c     | 22 ++++++++++-----------
> >>  drivers/scsi/ufs/ufshcd.c       | 43
> >> ++++++++++++++++++++++++++++++------
> > --
> >> ---
> >>  drivers/scsi/ufs/ufshcd.h       | 10 +++++-----
> >>  4 files changed, 56 insertions(+), 46 deletions(-)
> >>
> >> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-
> >> mediatek.c index 80618af..bff2c42 100644
> >> --- a/drivers/scsi/ufs/ufs-mediatek.c
> >> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> >> @@ -841,27 +841,18 @@ static int ufs_mtk_link_startup_notify(struct
> >> ufs_hba *hba,
> >>  	return ret;
> >>  }
> >>
> >> -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> >> +static int ufs_mtk_toggle_device_reset(struct ufs_hba *hba, bool
> >> down)
> >>  {
> >>  	struct arm_smccc_res res;
> >>
> >> -	ufs_mtk_device_reset_ctrl(0, res);
> >> -
> >> -	/*
> >> -	 * The reset signal is active low. UFS devices shall detect
> >> -	 * more than or equal to 1us of positive or negative RST_n
> >> -	 * pulse width.
> >> -	 *
> >> -	 * To be on safe side, keep the reset low for at least 10us.
> >> -	 */
> >> -	usleep_range(10, 15);
> >> -
> >> -	ufs_mtk_device_reset_ctrl(1, res);
> >> -
> >> -	/* Some devices may need time to respond to rst_n */
> >> -	usleep_range(10000, 15000);
> >> +	if (down) {
> >> +		ufs_mtk_device_reset_ctrl(0, res);
> >> +	} else {
> >> +		ufs_mtk_device_reset_ctrl(1, res);
> >>
> >> -	dev_info(hba->dev, "device reset done\n");
> >> +		/* Some devices may need time to respond to rst_n */
> >> +		usleep_range(10000, 15000);
> >> +	}
> >>
> >>  	return 0;
> >>  }
> >> @@ -1052,7 +1043,7 @@ static const struct ufs_hba_variant_ops
> >> ufs_hba_mtk_vops = {
> >>  	.suspend             = ufs_mtk_suspend,
> >>  	.resume              = ufs_mtk_resume,
> >>  	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
> >> -	.device_reset        = ufs_mtk_device_reset,
> >> +	.toggle_device_reset        = ufs_mtk_toggle_device_reset,
> >>  	.event_notify        = ufs_mtk_event_notify,
> >>  };
> >>
> >> diff --git a/drivers/scsi/ufs/ufs-qcom.c
> >> b/drivers/scsi/ufs/ufs-qcom.c index 2206b1e..c2ccaa5 100644
> >> --- a/drivers/scsi/ufs/ufs-qcom.c
> >> +++ b/drivers/scsi/ufs/ufs-qcom.c
> >> @@ -1404,12 +1404,13 @@ static void ufs_qcom_dump_dbg_regs(struct
> >> ufs_hba
> >> *hba)  }
> >>
> >>  /**
> >> - * ufs_qcom_device_reset() - toggle the (optional) device reset line
> >> + * ufs_qcom_toggle_device_reset() - toggle the (optional) device
> >> reset
> >> + line
> >>   * @hba: per-adapter instance
> >> + * @down: pull down or pull up device reset line
> >>   *
> >>   * Toggles the (optional) reset line to reset the attached device.
> >>   */
> >> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> >> +static int ufs_qcom_toggle_device_reset(struct ufs_hba *hba, bool
> >> down)
> >>  {
> >>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> >>
> >> @@ -1417,15 +1418,12 @@ static int ufs_qcom_device_reset(struct
> >> ufs_hba
> >> *hba)
> >>  	if (!host->device_reset)
> >>  		return -EOPNOTSUPP;
> >>
> >> -	/*
> >> -	 * The UFS device shall detect reset pulses of 1us, sleep for 10us
> >> to
> >> -	 * be on the safe side.
> >> -	 */
> >> -	gpiod_set_value_cansleep(host->device_reset, 1);
> >> -	usleep_range(10, 15);
> >> -
> >> -	gpiod_set_value_cansleep(host->device_reset, 0);
> >> -	usleep_range(10, 15);
> >> +	if (down) {
> >> +		gpiod_set_value_cansleep(host->device_reset, 1);
> >> +	} else {
> >> +		gpiod_set_value_cansleep(host->device_reset, 0);
> >> +		usleep_range(10, 15);
> >> +	}
> >>
> >>  	return 0;
> >>  }
> >> @@ -1473,7 +1471,7 @@ static const struct ufs_hba_variant_ops
> >> ufs_hba_qcom_vops = {
> >>  	.suspend		= ufs_qcom_suspend,
> >>  	.resume			= ufs_qcom_resume,
> >>  	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
> >> -	.device_reset		= ufs_qcom_device_reset,
> >> +	.toggle_device_reset		= ufs_qcom_toggle_device_reset,
> >>  	.config_scaling_param = ufs_qcom_config_scaling_param,
> >>  	.program_key		= ufs_qcom_ice_program_key,
> >>  };
> >> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> >> index e221add..2ee905f 100644
> >> --- a/drivers/scsi/ufs/ufshcd.c
> >> +++ b/drivers/scsi/ufs/ufshcd.c
> >> @@ -585,7 +585,20 @@ static void ufshcd_device_reset(struct ufs_hba
> >> *hba)
> >> {
> >>  	int err;
> >>
> >> -	err = ufshcd_vops_device_reset(hba);
> >> +	err = ufshcd_vops_toggle_device_reset(hba, true);
> >> +	if (err) {
> >> +		dev_err(hba->dev, "device reset pulling down failure: %d\n",
> >> err);
> >> +		return;
> >> +	}
> >> +
> >> +	/*
> >> +	 * The reset signal is active low. The UFS device
> >> +	 * shall detect reset pulses of 1us, sleep for at
> >> +	 * least 10us to be on the safe side.
> >> +	 */
> >> +	usleep_range(10, 15);
> >
> > Is there any point where UFS specification tells this explicitly?
> > I think this should be moved only if the number, i.e. 10 and 15  just
> > relies on hardware conditions.
> >
> >
> > Thanks.
> > Kiwoong Kim
> 
> Hi Kiwoong,
> 
> Thanks for your comment. JESD220E Line 610~611 "The UFS device shall
> detect more than or equal to 1us of positive or negative RST_n pulse".
> Both QCOM and Mediatek use 10~15us. What number do you think more
> appropriate?
> 
> Best Regards,
> Ziqi

With yours, all the SoC vendors should wait for around 10us unconditionally
even if there will be a possibility that some can use shorter period.
I see this as a sort of optimization point.


Thanks.
Kiwoong Kim
> 
> >
> >> +	err = ufshcd_vops_toggle_device_reset(hba, false);
> >>
> >>  	if (!err) {
> >>  		ufshcd_set_ufs_dev_active(hba);
> >> @@ -593,7 +606,11 @@ static void ufshcd_device_reset(struct ufs_hba
> >> *hba)
> >>  			hba->wb_enabled = false;
> >>  			hba->wb_buf_flush_enabled = false;
> >>  		}
> >> +		dev_info(hba->dev, "device reset done\n");
> >> +	} else {
> >> +		dev_err(hba->dev, "device reset pulling up failure: %d\n",
> >> err);
> >>  	}
> >> +
> >>  	if (err != -EOPNOTSUPP)
> >>  		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);  } @@ -
> >> 8686,8 +8703,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum
> >> ufs_pm_op pm_op)
> >>  	if (ret)
> >>  		goto set_dev_active;
> >>
> >> -	ufshcd_vreg_set_lpm(hba);
> >> -
> >>  disable_clks:
> >>  	/*
> >>  	 * Call vendor specific suspend callback. As these callbacks may
> >> access @@ -8703,6 +8718,9 @@ static int ufshcd_suspend(struct ufs_hba
> >> *hba, enum ufs_pm_op pm_op)
> >>  	 */
> >>  	ufshcd_disable_irq(hba);
> >>
> >> +	if (ufshcd_is_link_off(hba))
> >> +		ufshcd_vops_toggle_device_reset(hba, true);
> >> +
> >>  	ufshcd_setup_clocks(hba, false);
> >>
> >>  	if (ufshcd_is_clkgating_allowed(hba)) { @@ -8711,6 +8729,8 @@
> >> static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >>  					hba->clk_gating.state);
> >>  	}
> >>
> >> +	ufshcd_vreg_set_lpm(hba);
> >> +
> >>  	/* Put the host controller in low power mode if possible */
> >>  	ufshcd_hba_vreg_set_lpm(hba);
> >>  	goto out;
> >> @@ -8778,18 +8798,19 @@ static int ufshcd_resume(struct ufs_hba *hba,
> >> enum ufs_pm_op pm_op)
> >>  	old_link_state = hba->uic_link_state;
> >>
> >>  	ufshcd_hba_vreg_set_hpm(hba);
> >> +
> >> +	ret = ufshcd_vreg_set_hpm(hba);
> >> +	if (ret)
> >> +		goto out;
> >> +
> >>  	/* Make sure clocks are enabled before accessing controller */
> >>  	ret = ufshcd_setup_clocks(hba, true);
> >>  	if (ret)
> >> -		goto out;
> >> +		goto disable_vreg;
> >>
> >>  	/* enable the host irq as host controller would be active soon */
> >>  	ufshcd_enable_irq(hba);
> >>
> >> -	ret = ufshcd_vreg_set_hpm(hba);
> >> -	if (ret)
> >> -		goto disable_irq_and_vops_clks;
> >> -
> >>  	/*
> >>  	 * Call vendor specific resume callback. As these callbacks may
> >> access
> >>  	 * vendor specific host controller register space call them when
> >> the @@ -8797,7 +8818,7 @@ static int ufshcd_resume(struct ufs_hba
> >> *hba, enum ufs_pm_op pm_op)
> >>  	 */
> >>  	ret = ufshcd_vops_resume(hba, pm_op);
> >>  	if (ret)
> >> -		goto disable_vreg;
> >> +		goto disable_irq_and_vops_clks;
> >>
> >>  	/* For DeepSleep, the only supported option is to have the link off
> >> */
> >>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba)
> >> && !ufshcd_is_link_off(hba)); @@ -8864,8 +8885,6 @@ static int
> >> ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
> >>  	ufshcd_link_state_transition(hba, old_link_state, 0);
> >>  vendor_suspend:
> >>  	ufshcd_vops_suspend(hba, pm_op);
> >> -disable_vreg:
> >> -	ufshcd_vreg_set_lpm(hba);
> >>  disable_irq_and_vops_clks:
> >>  	ufshcd_disable_irq(hba);
> >>  	if (hba->clk_scaling.is_allowed)
> >> @@ -8876,6 +8895,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
> >> enum ufs_pm_op pm_op)
> >>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
> >>  					hba->clk_gating.state);
> >>  	}
> >> +disable_vreg:
> >> +	ufshcd_vreg_set_lpm(hba);
> >>  out:
> >>  	hba->pm_op_in_progress = 0;
> >>  	if (ret)
> >> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> >> index 9bb5f0e..dccc3eb 100644
> >> --- a/drivers/scsi/ufs/ufshcd.h
> >> +++ b/drivers/scsi/ufs/ufshcd.h
> >> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
> >>   * @resume: called during host controller PM callback
> >>   * @dbg_register_dump: used to dump controller debug information
> >>   * @phy_initialization: used to initialize phys
> >> - * @device_reset: called to issue a reset pulse on the UFS device
> >> + * @toggle_device_reset: called to change logic level of reset gpio
> >> on
> >> + the UFS device
> >>   * @program_key: program or evict an inline encryption key
> >>   * @event_notify: called to notify important events
> >>   */
> >> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
> >>  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
> >>  	void	(*dbg_register_dump)(struct ufs_hba *hba);
> >>  	int	(*phy_initialization)(struct ufs_hba *);
> >> -	int	(*device_reset)(struct ufs_hba *hba);
> >> +	int	(*toggle_device_reset)(struct ufs_hba *hba, bool down);
> >>  	void	(*config_scaling_param)(struct ufs_hba *hba,
> >>  					struct devfreq_dev_profile *profile,
> >>  					void *data);
> >> @@ -1216,10 +1216,10 @@ static inline void
> >> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
> >>  		hba->vops->dbg_register_dump(hba);
> >>  }
> >>
> >> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
> >> +static inline int ufshcd_vops_toggle_device_reset(struct ufs_hba
> >> *hba,
> >> +bool down)
> >>  {
> >> -	if (hba->vops && hba->vops->device_reset)
> >> -		return hba->vops->device_reset(hba);
> >> +	if (hba->vops && hba->vops->toggle_device_reset)
> >> +		return hba->vops->toggle_device_reset(hba, down);
> >>
> >>  	return -EOPNOTSUPP;
> >>  }
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> >> Forum, a Linux Foundation Collaborative Project

