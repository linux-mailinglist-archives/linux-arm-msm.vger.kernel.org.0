Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB0C92E0438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 03:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgLVCE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Dec 2020 21:04:59 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:20542 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLVCE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Dec 2020 21:04:59 -0500
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20201222020413epoutp03cce64d2c3715b15e383c4c84dccd3e63~S55co24G53004730047epoutp03t
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 02:04:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20201222020413epoutp03cce64d2c3715b15e383c4c84dccd3e63~S55co24G53004730047epoutp03t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1608602653;
        bh=jsABL048sKgquBcUL4iYwzxTZCdZYLe3mpBE4wI3IlI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=GYvaP3e1jRgGQzipSRudnntoxc7MLGCB/X7OSOfYBW6GPySaUrMmt6fq9m0qZ5oGR
         bt2uoKc3ZkweWK0nW8p6DnxCFIFomOvW6pk3kObbuWV7NQlnxvG18WtXj0jZhofvbK
         caRmvKbiANi1ih3ENCJhngB0KJzLjK9+METm7A64=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20201222020412epcas2p3502642ae94aeb8b429edee1aed5928cf~S55bypZK50645606456epcas2p3O;
        Tue, 22 Dec 2020 02:04:12 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.40.186]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4D0KQK5rf1z4x9Q4; Tue, 22 Dec
        2020 02:04:09 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        DD.4A.05262.91451EF5; Tue, 22 Dec 2020 11:04:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20201222020408epcas2p3f7747f2b8ac3c6fa2771a49313274904~S55YgfN9p2461324613epcas2p3w;
        Tue, 22 Dec 2020 02:04:08 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201222020408epsmtrp2e6fe88d1f6740e478376de375397b677~S55YXhY3q0243102431epsmtrp2B;
        Tue, 22 Dec 2020 02:04:08 +0000 (GMT)
X-AuditID: b6c32a47-b81ff7000000148e-50-5fe15419a265
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.C1.08745.81451EF5; Tue, 22 Dec 2020 11:04:08 +0900 (KST)
Received: from KORCO011456 (unknown [12.36.185.54]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20201222020408epsmtip1238f5f6a580d4b24abe72641e4dc5ad1~S55X5TbND0176601766epsmtip1Q;
        Tue, 22 Dec 2020 02:04:08 +0000 (GMT)
From:   "Kiwoong Kim" <kwmad.kim@samsung.com>
To:     "'Ziqi Chen'" <ziqichen@codeaurora.org>, <asutoshd@codeaurora.org>,
        <nguyenb@codeaurora.org>, <cang@codeaurora.org>,
        <hongwus@codeaurora.org>, <rnayak@codeaurora.org>,
        <vinholikatti@gmail.com>, <jejb@linux.vnet.ibm.com>,
        <martin.petersen@oracle.com>, <linux-scsi@vger.kernel.org>,
        <kernel-team@android.com>, <saravanak@google.com>,
        <salyzyn@google.com>
Cc:     "'Alim Akhtar'" <alim.akhtar@samsung.com>,
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
In-Reply-To: <1608537091-78575-1-git-send-email-ziqichen@codeaurora.org>
Subject: RE: [PATCH RFC v3 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Date:   Tue, 22 Dec 2020 11:04:08 +0900
Message-ID: <009001d6d806$bbac1a30$33044e90$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMYnlYW9RPy0rxW7i+kRjBOSmAq5wKVdWQhp2ok3IA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0yTZxTO28vXlq3us4J76SY0VbaJA1q6lhciiJlx3yYxTHEh+1Mb+EKJ
        pe1a6hiD0ckdEcVlXFqcwqRswIIBBuV+M0GCLGMgyE1ALrNslNsSAgZd7YcJ/55zzvOc9zzn
        zWHTefdYfHasOp7UqRUqIebCaOg5KvNxj5iVizKqP0B989UY+mPuOQPN/NSAobaMByxk23qE
        oa7ZbAbq77AzUMHqFh2t11iYqH/RzkJljxtoqDJfjayNrqh2boSJ8jsGWGiouQRDQ6mDAF0d
        tWKoovcFDV1Jk6C1HDNAluE6Jir/3vFATvcOhq5XTWHIWpqIysf+ZoW+QwwNnyEaWhqYxFDe
        NRrRZJpiEXdqDcTPrTYaUVuZjRGTI60YcaOsExAz3XUMou5uCrFZk4URawvjDCKvvhIQG7Ue
        RGbnVVo4/qXquJJURJM6AamO0kTHqmOChWfOyz+WS2UisY84EAUIBWpFHBksPBUW7nM6VuVY
        jVBwWaEyOFLhCr1e6BdyXKcxxJMCpUYfHywktdEqrVis9dUr4vQGdYxvlCYuSCwS+UsdzIsq
        5UjuPNAWf57wOL2QbgTroTmAw4b4RzBt4l96DnBh83ArgH8utTGpYB3A0vUhBhVsANg3aWG9
        lljGiwFVaAbwysOnu8EzAG/m/epkYfgxWDDb4uzlittpcGAn09mLjq8yoW1gh/mKxcEJWDd3
        D7zCB/Bz8Nn0lBMzcC84v/KLE3PxQLjda2dQeD/sK553YjruD+9W3aZR2BM2LpfQqfkEcGvB
        4uzvigfBzucVdIrjCs3ZGU6rELdzYE7asoPEdgSn4MaUN6U9AJd663d98uGGvQ2jcAps/9HI
        pLS5AC60vwBUQQJNi5mA6nMY3h/fnW0fzOrZYVFpLszK4FHsw3D75g+7SndYPDbJugGEpj3O
        THucmfY4M+1xcAcwKsFBUquPiyH1/lrJ3g+vBc7T8f7ECoqWV327AY0NugFk04WuXBl/Ws7j
        Riu+SSR1GrnOoCL13UDqWHY+ne8WpXHcnjpeLpb6y2SiQCmSyvyR8G2uXjQj5+ExinjyEklq
        Sd1rHY3N4Rtpsct1K7PfXuv6nVs1nryPl2TdvogVeAxWJyf/81Wh2wWlb0KI4jY53ndQkv6h
        2ms6ndGKH8qcSUlNKp9PbD5Zxq0pOx+2M7n0W2/kkU33em7LxP33ucpOxQTGC/FTrbxh/HpF
        wI0zH8lajDaf+GwrKviyyxeeaptXe09Jyxo6e0xpSjPKOJ5+D/46dOstnmXYo+mpLfJR/nuL
        /dNv6koLI8QhPrPehf/pA0Jy8KITqUaRJMiW8CSyxE1+VDfxHYQBsZJzXRxPfkYRfPdlU+rk
        mGjxZZLLWW1C6Kfmk+pRt4jNJ2OGUWm5+/5c90uqTlqYuQk9vFBS0dx4q2JukNVxWsjQKxVi
        b7pOr/gfMWG8B8MEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7bCSnK5EyMN4g1U7ZS1OPlnDZnHu8W8W
        iwfztrFZ7G07wW7x8udVNouDDztZLE7vf8diMe3DT2aLT+uXsVqcfvaO3WLRjW1MFqsm5lns
        2C5isenxNVaLifvPsltc3jWHzeJy80VGi+7rO9gslh//x2TR1GJs8bFrNqPFsiubWS2WNgIt
        6Dr0l82if/VdNosdC6sslt58zu4g7XH5irfHtt3bWD0u9/UyeeycdZfdY8GmUo/Fe14yeWxa
        1cnmcefaHjaPCYsOMHo8OLSZxWPzknqP7+s72Dw+Pr3F4tG3ZRWjx+dNch7tB7qZAgSiuGxS
        UnMyy1KL9O0SuDKu9TxhLJgZWHGjdTpzA+Mnhy5GTg4JAROJZbdmMnYxcnEICexglPjdf58d
        IiEpcWLnc0YIW1jifssRVoiiZ4wS37ufMYMk2AS0JaY93A2WEBH4wyTxeNcjFhCHWeAbq8Tv
        X91Qc2cySkzs/wM2i1PAQ2Lz4w1gtrBAgMSBnbfZQGwWAVWJJ+9XgMV5BSwlfh1/xwJhC0qc
        nPkEzGYGOrbxcDeULS+x/e0cZoj7FCR+Pl3GCmKLCFhJHPi9nBmiRkRidmcb8wRG4VlIRs1C
        MmoWklGzkLQsYGRZxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRnHy0tHYw7ln1Qe8Q
        IxMH4yFGCQ5mJRFeM6n78UK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1I
        LYLJMnFwSjUwxbSbiCy9+NvCaVHTYvWg5YGaO9mvfXxVfvuRVVnws4Arv3WtOt6H7NmePy/g
        g72JUK/x5U1yB95Omv383McvegpZ3p/F5Ocn1YjtPX8kuT5mfv9HW3Y3LvWHu1km29z5Vj+7
        3DDqhXverUCxsnbn8M1OE7PiWpwVvqs/mZERYXW19Ky6qOCEtBn1Lp85P85ecvuOTfeWWo6O
        u1ztWxeZf2vaJMHcdy10m+e+tce5eW2jD+Y9PK5zXHpnxtFTUhucvp5/G3P+S+7Goi1lH/KN
        udRf8vsmiR1eYtJb9kX2RE3PjRkTbr96b7+75FGJ0+Mbk19duqWj6pPye59D/Fqj42mTJhbv
        uMEjs+HgQ6WoQiWW4oxEQy3mouJEANbUqrKtAwAA
X-CMS-MailID: 20201222020408epcas2p3f7747f2b8ac3c6fa2771a49313274904
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201221075209epcas2p489ef5a304a7227ae1ef20e581c08c043
References: <CGME20201221075209epcas2p489ef5a304a7227ae1ef20e581c08c043@epcas2p4.samsung.com>
        <1608537091-78575-1-git-send-email-ziqichen@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> As per specs, e.g, JESD220E chapter 7.2, while powering off/on the ufs
> device, RST_N signal and REF_CLK signal should be between VSS(Ground) and
> VCCQ/VCCQ2.
> 
> To flexibly control device reset line, re-name the function
> ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> vops_toggle_device_reset(sturct ufs_hba *hba, bool down). The new
> parameter "bool down" is used to separate device reset line pulling down
> from pulling up.
> 
> Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs-mediatek.c | 27 +++++++++-----------------
>  drivers/scsi/ufs/ufs-qcom.c     | 22 ++++++++++-----------
>  drivers/scsi/ufs/ufshcd.c       | 43 ++++++++++++++++++++++++++++++------
--
> ---
>  drivers/scsi/ufs/ufshcd.h       | 10 +++++-----
>  4 files changed, 56 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-
> mediatek.c index 80618af..bff2c42 100644
> --- a/drivers/scsi/ufs/ufs-mediatek.c
> +++ b/drivers/scsi/ufs/ufs-mediatek.c
> @@ -841,27 +841,18 @@ static int ufs_mtk_link_startup_notify(struct
> ufs_hba *hba,
>  	return ret;
>  }
> 
> -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> +static int ufs_mtk_toggle_device_reset(struct ufs_hba *hba, bool down)
>  {
>  	struct arm_smccc_res res;
> 
> -	ufs_mtk_device_reset_ctrl(0, res);
> -
> -	/*
> -	 * The reset signal is active low. UFS devices shall detect
> -	 * more than or equal to 1us of positive or negative RST_n
> -	 * pulse width.
> -	 *
> -	 * To be on safe side, keep the reset low for at least 10us.
> -	 */
> -	usleep_range(10, 15);
> -
> -	ufs_mtk_device_reset_ctrl(1, res);
> -
> -	/* Some devices may need time to respond to rst_n */
> -	usleep_range(10000, 15000);
> +	if (down) {
> +		ufs_mtk_device_reset_ctrl(0, res);
> +	} else {
> +		ufs_mtk_device_reset_ctrl(1, res);
> 
> -	dev_info(hba->dev, "device reset done\n");
> +		/* Some devices may need time to respond to rst_n */
> +		usleep_range(10000, 15000);
> +	}
> 
>  	return 0;
>  }
> @@ -1052,7 +1043,7 @@ static const struct ufs_hba_variant_ops
> ufs_hba_mtk_vops = {
>  	.suspend             = ufs_mtk_suspend,
>  	.resume              = ufs_mtk_resume,
>  	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
> -	.device_reset        = ufs_mtk_device_reset,
> +	.toggle_device_reset        = ufs_mtk_toggle_device_reset,
>  	.event_notify        = ufs_mtk_event_notify,
>  };
> 
> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
> index 2206b1e..c2ccaa5 100644
> --- a/drivers/scsi/ufs/ufs-qcom.c
> +++ b/drivers/scsi/ufs/ufs-qcom.c
> @@ -1404,12 +1404,13 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba
> *hba)  }
> 
>  /**
> - * ufs_qcom_device_reset() - toggle the (optional) device reset line
> + * ufs_qcom_toggle_device_reset() - toggle the (optional) device reset
> + line
>   * @hba: per-adapter instance
> + * @down: pull down or pull up device reset line
>   *
>   * Toggles the (optional) reset line to reset the attached device.
>   */
> -static int ufs_qcom_device_reset(struct ufs_hba *hba)
> +static int ufs_qcom_toggle_device_reset(struct ufs_hba *hba, bool down)
>  {
>  	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
> 
> @@ -1417,15 +1418,12 @@ static int ufs_qcom_device_reset(struct ufs_hba
> *hba)
>  	if (!host->device_reset)
>  		return -EOPNOTSUPP;
> 
> -	/*
> -	 * The UFS device shall detect reset pulses of 1us, sleep for 10us
> to
> -	 * be on the safe side.
> -	 */
> -	gpiod_set_value_cansleep(host->device_reset, 1);
> -	usleep_range(10, 15);
> -
> -	gpiod_set_value_cansleep(host->device_reset, 0);
> -	usleep_range(10, 15);
> +	if (down) {
> +		gpiod_set_value_cansleep(host->device_reset, 1);
> +	} else {
> +		gpiod_set_value_cansleep(host->device_reset, 0);
> +		usleep_range(10, 15);
> +	}
> 
>  	return 0;
>  }
> @@ -1473,7 +1471,7 @@ static const struct ufs_hba_variant_ops
> ufs_hba_qcom_vops = {
>  	.suspend		= ufs_qcom_suspend,
>  	.resume			= ufs_qcom_resume,
>  	.dbg_register_dump	= ufs_qcom_dump_dbg_regs,
> -	.device_reset		= ufs_qcom_device_reset,
> +	.toggle_device_reset		= ufs_qcom_toggle_device_reset,
>  	.config_scaling_param = ufs_qcom_config_scaling_param,
>  	.program_key		= ufs_qcom_ice_program_key,
>  };
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c index
> e221add..2ee905f 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -585,7 +585,20 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
> {
>  	int err;
> 
> -	err = ufshcd_vops_device_reset(hba);
> +	err = ufshcd_vops_toggle_device_reset(hba, true);
> +	if (err) {
> +		dev_err(hba->dev, "device reset pulling down failure: %d\n",
> err);
> +		return;
> +	}
> +
> +	/*
> +	 * The reset signal is active low. The UFS device
> +	 * shall detect reset pulses of 1us, sleep for at
> +	 * least 10us to be on the safe side.
> +	 */
> +	usleep_range(10, 15);

Is there any point where UFS specification tells this explicitly?
I think this should be moved only if the number, i.e. 10 and 15  just
relies on hardware conditions.


Thanks.
Kiwoong Kim

> +	err = ufshcd_vops_toggle_device_reset(hba, false);
> 
>  	if (!err) {
>  		ufshcd_set_ufs_dev_active(hba);
> @@ -593,7 +606,11 @@ static void ufshcd_device_reset(struct ufs_hba *hba)
>  			hba->wb_enabled = false;
>  			hba->wb_buf_flush_enabled = false;
>  		}
> +		dev_info(hba->dev, "device reset done\n");
> +	} else {
> +		dev_err(hba->dev, "device reset pulling up failure: %d\n",
> err);
>  	}
> +
>  	if (err != -EOPNOTSUPP)
>  		ufshcd_update_evt_hist(hba, UFS_EVT_DEV_RESET, err);  } @@ -
> 8686,8 +8703,6 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum
> ufs_pm_op pm_op)
>  	if (ret)
>  		goto set_dev_active;
> 
> -	ufshcd_vreg_set_lpm(hba);
> -
>  disable_clks:
>  	/*
>  	 * Call vendor specific suspend callback. As these callbacks may
> access @@ -8703,6 +8718,9 @@ static int ufshcd_suspend(struct ufs_hba
*hba,
> enum ufs_pm_op pm_op)
>  	 */
>  	ufshcd_disable_irq(hba);
> 
> +	if (ufshcd_is_link_off(hba))
> +		ufshcd_vops_toggle_device_reset(hba, true);
> +
>  	ufshcd_setup_clocks(hba, false);
> 
>  	if (ufshcd_is_clkgating_allowed(hba)) { @@ -8711,6 +8729,8 @@
> static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  					hba->clk_gating.state);
>  	}
> 
> +	ufshcd_vreg_set_lpm(hba);
> +
>  	/* Put the host controller in low power mode if possible */
>  	ufshcd_hba_vreg_set_lpm(hba);
>  	goto out;
> @@ -8778,18 +8798,19 @@ static int ufshcd_resume(struct ufs_hba *hba, enum
> ufs_pm_op pm_op)
>  	old_link_state = hba->uic_link_state;
> 
>  	ufshcd_hba_vreg_set_hpm(hba);
> +
> +	ret = ufshcd_vreg_set_hpm(hba);
> +	if (ret)
> +		goto out;
> +
>  	/* Make sure clocks are enabled before accessing controller */
>  	ret = ufshcd_setup_clocks(hba, true);
>  	if (ret)
> -		goto out;
> +		goto disable_vreg;
> 
>  	/* enable the host irq as host controller would be active soon */
>  	ufshcd_enable_irq(hba);
> 
> -	ret = ufshcd_vreg_set_hpm(hba);
> -	if (ret)
> -		goto disable_irq_and_vops_clks;
> -
>  	/*
>  	 * Call vendor specific resume callback. As these callbacks may
> access
>  	 * vendor specific host controller register space call them when
> the @@ -8797,7 +8818,7 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	 */
>  	ret = ufshcd_vops_resume(hba, pm_op);
>  	if (ret)
> -		goto disable_vreg;
> +		goto disable_irq_and_vops_clks;
> 
>  	/* For DeepSleep, the only supported option is to have the link off
> */
>  	WARN_ON(ufshcd_is_ufs_dev_deepsleep(hba)
> && !ufshcd_is_link_off(hba)); @@ -8864,8 +8885,6 @@ static int
> ufshcd_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  	ufshcd_link_state_transition(hba, old_link_state, 0);
>  vendor_suspend:
>  	ufshcd_vops_suspend(hba, pm_op);
> -disable_vreg:
> -	ufshcd_vreg_set_lpm(hba);
>  disable_irq_and_vops_clks:
>  	ufshcd_disable_irq(hba);
>  	if (hba->clk_scaling.is_allowed)
> @@ -8876,6 +8895,8 @@ static int ufshcd_resume(struct ufs_hba *hba, enum
> ufs_pm_op pm_op)
>  		trace_ufshcd_clk_gating(dev_name(hba->dev),
>  					hba->clk_gating.state);
>  	}
> +disable_vreg:
> +	ufshcd_vreg_set_lpm(hba);
>  out:
>  	hba->pm_op_in_progress = 0;
>  	if (ret)
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h index
> 9bb5f0e..dccc3eb 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -319,7 +319,7 @@ struct ufs_pwr_mode_info {
>   * @resume: called during host controller PM callback
>   * @dbg_register_dump: used to dump controller debug information
>   * @phy_initialization: used to initialize phys
> - * @device_reset: called to issue a reset pulse on the UFS device
> + * @toggle_device_reset: called to change logic level of reset gpio on
> + the UFS device
>   * @program_key: program or evict an inline encryption key
>   * @event_notify: called to notify important events
>   */
> @@ -350,7 +350,7 @@ struct ufs_hba_variant_ops {
>  	int     (*resume)(struct ufs_hba *, enum ufs_pm_op);
>  	void	(*dbg_register_dump)(struct ufs_hba *hba);
>  	int	(*phy_initialization)(struct ufs_hba *);
> -	int	(*device_reset)(struct ufs_hba *hba);
> +	int	(*toggle_device_reset)(struct ufs_hba *hba, bool down);
>  	void	(*config_scaling_param)(struct ufs_hba *hba,
>  					struct devfreq_dev_profile *profile,
>  					void *data);
> @@ -1216,10 +1216,10 @@ static inline void
> ufshcd_vops_dbg_register_dump(struct ufs_hba *hba)
>  		hba->vops->dbg_register_dump(hba);
>  }
> 
> -static inline int ufshcd_vops_device_reset(struct ufs_hba *hba)
> +static inline int ufshcd_vops_toggle_device_reset(struct ufs_hba *hba,
> +bool down)
>  {
> -	if (hba->vops && hba->vops->device_reset)
> -		return hba->vops->device_reset(hba);
> +	if (hba->vops && hba->vops->toggle_device_reset)
> +		return hba->vops->toggle_device_reset(hba, down);
> 
>  	return -EOPNOTSUPP;
>  }
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project


