Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A399E2026BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 23:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728932AbgFTVOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 17:14:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34874 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbgFTVOQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 17:14:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id e15so165268edr.2;
        Sat, 20 Jun 2020 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JyaxkVYiaXxktyeKVZR2N5wrl/dZZWq10YUgFRxJERw=;
        b=sTrTNFJLn0vFByS50a+wy9KYVagTAb24hDnF+A6Ifb0umF9mSDCQmJkkQlOeJa0Wdp
         VmGiYGE6bDqGWGrYkRvTOfYv1p+gO0B+oi4jtSjCZ8fC7TRlNImripqs2QpNHRsTjAf/
         1G21xIZMPF9DsJ46JPhxlE7x/MNACfBuA9v+ZOwvgBAxKG6YXc1mp9XOBfuS+K2rsNKo
         nJpNma9t/oFphpmU/cLI54G5Tq7wzE3xjCLVRuZZcXQ9GizCk52QoV43S6/yaAxzjrLE
         a2P+eDas19hQQ5Q0/Qp5hWklD4lHr19MmVqx+qhgZQ58zsLMGsbse//Fv4wErJFKiZwh
         WIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JyaxkVYiaXxktyeKVZR2N5wrl/dZZWq10YUgFRxJERw=;
        b=lnZEB1n6ADKxNMTQox8LCvXp5vxbGHMKyz27vACH6GyB5PN1CMcaH8NL5ErsZlfvOX
         TD6xeGi23HFgvWeAUkeWlfDVtLB6+O2oZk3X1SZH/kCARNxVLMc1TkwZbxhv9baAJjaR
         mQmPDfQFNt1newsNitYmoOf1Ztq6CDfioj+Rt7NjcamnOk2DJx33gYu3XLUqfil2vyH/
         NJGtSe0H31FtHan4Lp8Qm7YmhgcsQT5KftyHKljlrQ/SJ/C7hkM40HvM01RwaFGprryt
         /MWtIn7xjF0HbHRDH3jMJjOjxJ+Yc9tOplad+akifSsBULfqogb9BOBSnEJEyN1xw1Tj
         90WA==
X-Gm-Message-State: AOAM530wSkI9/XpMdZDrM3I5Bz8zOWQSh0QU9QXbLnL10BU4OTiSGnrK
        VO8FAEjDo0GPCH14/PRsreZoZ4xaaisLyq/zXWI=
X-Google-Smtp-Source: ABdhPJx1/jdrMyxymdexQ716yZhV5LQX1SoneauG2JexNGWD/MTtg+hH1IkCrQL2W9nhqC0oP7JYc6O8jfmsfo8lzfA=
X-Received: by 2002:aa7:d952:: with SMTP id l18mr9462092eds.151.1592687591070;
 Sat, 20 Jun 2020 14:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586374414.git.asutoshd@codeaurora.org> <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
In-Reply-To: <3c186284280c37c76cf77bf482dde725359b8a8a.1586382357.git.asutoshd@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 20 Jun 2020 14:13:39 -0700
Message-ID: <CAF6AEGvgmfYoybv4XMVVH85fGMr-eDfpzxdzkFWCx-2N5PEw2w@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] scsi: ufs: add write booster feature support
To:     Asutosh Das <asutoshd@codeaurora.org>
Cc:     cang@codeaurora.org, martin.petersen@oracle.com,
        Avri.Altman@wdc.com, linux-scsi@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Bean Huo <beanhuo@micron.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Bart Van Assche <bvanassche@acm.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 8, 2020 at 3:00 PM Asutosh Das <asutoshd@codeaurora.org> wrote:
>
> The write performance of TLC NAND is considerably
> lower than SLC NAND. Using SLC NAND as a WriteBooster
> Buffer enables the write request to be processed with
> lower latency and improves the overall write performance.
>
> Adds support for shared-buffer mode WriteBooster.
>
> WriteBooster enable: SW enables it when clocks are
> scaled up, thus it's enabled only in high load conditions.
>
> WriteBooster disable: SW will disable the feature,
> when clocks are scaled down. Thus writes would go as normal
> writes.

btw, in v5.8-rc1 (plus handful of remaining patches for lenovo c630
laptop (sdm850)), I'm seeing a lot of:

  ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending flag query for
idn 14 failed, err = 253
  ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag: Sending flag query for
idn 14 failed, err = 253
  ufshcd-qcom 1d84000.ufshc: ufshcd_query_flag_retry: query attribute,
opcode 6, idn 14, failed with error 253 after 3 retires
  ufshcd-qcom 1d84000.ufshc: ufshcd_wb_ctrl write booster enable failed 253

and at least subjectively, compiling mesa seems slower, which seems
like it might be related?

not sure if that is a known issue?

BR,
-R

>
> To keep the endurance of the WriteBooster Buffer at a
> maximum, this load based toggling is adopted.
>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
> ---
>  drivers/scsi/ufs/ufs.h    |  31 +++++-
>  drivers/scsi/ufs/ufshcd.c | 240 +++++++++++++++++++++++++++++++++++++++++++++-
>  drivers/scsi/ufs/ufshcd.h |  21 ++++
>  3 files changed, 288 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/scsi/ufs/ufs.h b/drivers/scsi/ufs/ufs.h
> index 990cb48..2c77b3e 100644
> --- a/drivers/scsi/ufs/ufs.h
> +++ b/drivers/scsi/ufs/ufs.h
> @@ -140,6 +140,9 @@ enum flag_idn {
>         QUERY_FLAG_IDN_BUSY_RTC                         = 0x09,
>         QUERY_FLAG_IDN_RESERVED3                        = 0x0A,
>         QUERY_FLAG_IDN_PERMANENTLY_DISABLE_FW_UPDATE    = 0x0B,
> +       QUERY_FLAG_IDN_WB_EN                            = 0x0E,
> +       QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN                 = 0x0F,
> +       QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8     = 0x10,
>  };
>
>  /* Attribute idn for Query requests */
> @@ -168,6 +171,10 @@ enum attr_idn {
>         QUERY_ATTR_IDN_PSA_STATE                = 0x15,
>         QUERY_ATTR_IDN_PSA_DATA_SIZE            = 0x16,
>         QUERY_ATTR_IDN_REF_CLK_GATING_WAIT_TIME = 0x17,
> +       QUERY_ATTR_IDN_WB_FLUSH_STATUS          = 0x1C,
> +       QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE       = 0x1D,
> +       QUERY_ATTR_IDN_WB_BUFF_LIFE_TIME_EST    = 0x1E,
> +       QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE        = 0x1F,
>  };
>
>  /* Descriptor idn for Query requests */
> @@ -191,7 +198,7 @@ enum desc_header_offset {
>  };
>
>  enum ufs_desc_def_size {
> -       QUERY_DESC_DEVICE_DEF_SIZE              = 0x40,
> +       QUERY_DESC_DEVICE_DEF_SIZE              = 0x59,
>         QUERY_DESC_CONFIGURATION_DEF_SIZE       = 0x90,
>         QUERY_DESC_UNIT_DEF_SIZE                = 0x23,
>         QUERY_DESC_INTERCONNECT_DEF_SIZE        = 0x06,
> @@ -219,6 +226,7 @@ enum unit_desc_param {
>         UNIT_DESC_PARAM_PHY_MEM_RSRC_CNT        = 0x18,
>         UNIT_DESC_PARAM_CTX_CAPABILITIES        = 0x20,
>         UNIT_DESC_PARAM_LARGE_UNIT_SIZE_M1      = 0x22,
> +       UNIT_DESC_PARAM_WB_BUF_ALLOC_UNITS      = 0x29,
>  };
>
>  /* Device descriptor parameters offsets in bytes*/
> @@ -258,6 +266,9 @@ enum device_desc_param {
>         DEVICE_DESC_PARAM_PSA_MAX_DATA          = 0x25,
>         DEVICE_DESC_PARAM_PSA_TMT               = 0x29,
>         DEVICE_DESC_PARAM_PRDCT_REV             = 0x2A,
> +       DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP   = 0x4F,
> +       DEVICE_DESC_PARAM_WB_TYPE               = 0x54,
> +       DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS = 0x55,
>  };
>
>  /* Interconnect descriptor parameters offsets in bytes*/
> @@ -333,6 +344,11 @@ enum {
>         UFSHCD_AMP              = 3,
>  };
>
> +/* Possible values for dExtendedUFSFeaturesSupport */
> +enum {
> +       UFS_DEV_WRITE_BOOSTER_SUP       = BIT(8),
> +};
> +
>  #define POWER_DESC_MAX_SIZE                    0x62
>  #define POWER_DESC_MAX_ACTV_ICC_LVLS           16
>
> @@ -447,6 +463,15 @@ enum ufs_dev_pwr_mode {
>         UFS_POWERDOWN_PWR_MODE  = 3,
>  };
>
> +enum ufs_dev_wb_buf_avail_size {
> +       UFS_WB_10_PERCENT_BUF_REMAIN = 0x1,
> +       UFS_WB_40_PERCENT_BUF_REMAIN = 0x4,
> +};
> +
> +enum ufs_dev_wb_buf_user_cap_config {
> +       UFS_WB_BUFF_PRESERVE_USER_SPACE = 1,
> +       UFS_WB_BUFF_USER_SPACE_RED_EN = 2,
> +};
>  /**
>   * struct utp_cmd_rsp - Response UPIU structure
>   * @residual_transfer_count: Residual transfer count DW-3
> @@ -537,6 +562,10 @@ struct ufs_dev_info {
>         u8 *model;
>         u16 wspecversion;
>         u32 clk_gating_wait_us;
> +       u32 d_ext_ufs_feature_sup;
> +       u8 b_wb_buffer_type;
> +       u32 d_wb_alloc_units;
> +       bool keep_vcc_on;
>  };
>
>  /**
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 64e42ef..5b3a92e 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -48,6 +48,8 @@
>  #include "unipro.h"
>  #include "ufs-sysfs.h"
>  #include "ufs_bsg.h"
> +#include <linux/blkdev.h>
> +#include <asm/unaligned.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/ufs.h>
> @@ -251,6 +253,13 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, bool scale_up);
>  static irqreturn_t ufshcd_intr(int irq, void *__hba);
>  static int ufshcd_change_power_mode(struct ufs_hba *hba,
>                              struct ufs_pa_layer_attr *pwr_mode);
> +static bool ufshcd_wb_sup(struct ufs_hba *hba);
> +static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba);
> +static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
> +static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
> +static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set);
> +static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable);
> +
>  static inline bool ufshcd_valid_tag(struct ufs_hba *hba, int tag)
>  {
>         return tag >= 0 && tag < hba->nutrs;
> @@ -272,6 +281,25 @@ static inline void ufshcd_disable_irq(struct ufs_hba *hba)
>         }
>  }
>
> +static inline void ufshcd_wb_config(struct ufs_hba *hba)
> +{
> +       int ret;
> +
> +       if (!ufshcd_wb_sup(hba))
> +               return;
> +
> +       ret = ufshcd_wb_ctrl(hba, true);
> +       if (ret)
> +               dev_err(hba->dev, "%s: Enable WB failed: %d\n", __func__, ret);
> +       else
> +               dev_info(hba->dev, "%s: Write Booster Configured\n", __func__);
> +       ret = ufshcd_wb_toggle_flush_during_h8(hba, true);
> +       if (ret)
> +               dev_err(hba->dev, "%s: En WB flush during H8: failed: %d\n",
> +                       __func__, ret);
> +       ufshcd_wb_toggle_flush(hba, true);
> +}
> +
>  static void ufshcd_scsi_unblock_requests(struct ufs_hba *hba)
>  {
>         if (atomic_dec_and_test(&hba->scsi_block_reqs_cnt))
> @@ -1154,6 +1182,13 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, bool scale_up)
>                         ufshcd_scale_clks(hba, false);
>         }
>
> +       /* Enable Write Booster if we have scaled up else disable it */
> +       if (!ret) {
> +               up_write(&hba->clk_scaling_lock);
> +               ufshcd_wb_ctrl(hba, scale_up);
> +               down_write(&hba->clk_scaling_lock);
> +       }
> +
>  out_unprepare:
>         ufshcd_clock_scaling_unprepare(hba);
>  out:
> @@ -5154,6 +5189,168 @@ static void ufshcd_bkops_exception_event_handler(struct ufs_hba *hba)
>                                 __func__, err);
>  }
>
> +static bool ufshcd_wb_sup(struct ufs_hba *hba)
> +{
> +       return (ufshcd_is_wb_allowed(hba) &&
> +               (hba->dev_info.d_ext_ufs_feature_sup &
> +                UFS_DEV_WRITE_BOOSTER_SUP) &&
> +               hba->dev_info.b_wb_buffer_type &&
> +               hba->dev_info.d_wb_alloc_units);
> +}
> +
> +static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable)
> +{
> +       int ret;
> +       enum query_opcode opcode;
> +
> +       if (!ufshcd_wb_sup(hba))
> +               return 0;
> +
> +       if (!(enable ^ hba->wb_enabled))
> +               return 0;
> +       if (enable)
> +               opcode = UPIU_QUERY_OPCODE_SET_FLAG;
> +       else
> +               opcode = UPIU_QUERY_OPCODE_CLEAR_FLAG;
> +
> +       ret = ufshcd_query_flag_retry(hba, opcode,
> +                                     QUERY_FLAG_IDN_WB_EN, NULL);
> +       if (ret) {
> +               dev_err(hba->dev, "%s write booster %s failed %d\n",
> +                       __func__, enable ? "enable" : "disable", ret);
> +               return ret;
> +       }
> +
> +       hba->wb_enabled = enable;
> +       dev_dbg(hba->dev, "%s write booster %s %d\n",
> +                       __func__, enable ? "enable" : "disable", ret);
> +
> +       return ret;
> +}
> +
> +static int ufshcd_wb_toggle_flush_during_h8(struct ufs_hba *hba, bool set)
> +{
> +       int val;
> +
> +       if (set)
> +               val =  UPIU_QUERY_OPCODE_SET_FLAG;
> +       else
> +               val = UPIU_QUERY_OPCODE_CLEAR_FLAG;
> +
> +       return ufshcd_query_flag_retry(hba, val,
> +                              QUERY_FLAG_IDN_WB_BUFF_FLUSH_DURING_HIBERN8,
> +                                      NULL);
> +}
> +
> +static inline void ufshcd_wb_toggle_flush(struct ufs_hba *hba, bool enable)
> +{
> +       if (enable)
> +               ufshcd_wb_buf_flush_enable(hba);
> +       else
> +               ufshcd_wb_buf_flush_disable(hba);
> +
> +}
> +
> +static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba)
> +{
> +       int ret;
> +
> +       if (!ufshcd_wb_sup(hba) || hba->wb_buf_flush_enabled)
> +               return 0;
> +
> +       ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_SET_FLAG,
> +                                     QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN, NULL);
> +       if (ret)
> +               dev_err(hba->dev, "%s WB - buf flush enable failed %d\n",
> +                       __func__, ret);
> +       else
> +               hba->wb_buf_flush_enabled = true;
> +
> +       dev_dbg(hba->dev, "WB - Flush enabled: %d\n", ret);
> +       return ret;
> +}
> +
> +static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba)
> +{
> +       int ret;
> +
> +       if (!ufshcd_wb_sup(hba) || !hba->wb_buf_flush_enabled)
> +               return 0;
> +
> +       ret = ufshcd_query_flag_retry(hba, UPIU_QUERY_OPCODE_CLEAR_FLAG,
> +                                     QUERY_FLAG_IDN_WB_BUFF_FLUSH_EN, NULL);
> +       if (ret) {
> +               dev_warn(hba->dev, "%s: WB - buf flush disable failed %d\n",
> +                        __func__, ret);
> +       } else {
> +               hba->wb_buf_flush_enabled = false;
> +               dev_dbg(hba->dev, "WB - Flush disabled: %d\n", ret);
> +       }
> +
> +       return ret;
> +}
> +
> +static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
> +{
> +       int ret;
> +       u32 cur_buf, avail_buf;
> +
> +       if (!ufshcd_wb_sup(hba))
> +               return false;
> +       /*
> +        * The ufs device needs the vcc to be ON to flush.
> +        * With user-space reduction enabled, it's enough to enable flush
> +        * by checking only the available buffer. The threshold
> +        * defined here is > 90% full.
> +        * With user-space preserved enabled, the current-buffer
> +        * should be checked too because the wb buffer size can reduce
> +        * when disk tends to be full. This info is provided by current
> +        * buffer (dCurrentWriteBoosterBufferSize). There's no point in
> +        * keeping vcc on when current buffer is empty.
> +        */
> +       ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
> +                                     QUERY_ATTR_IDN_AVAIL_WB_BUFF_SIZE,
> +                                     0, 0, &avail_buf);
> +       if (ret) {
> +               dev_warn(hba->dev, "%s dAvailableWriteBoosterBufferSize read failed %d\n",
> +                        __func__, ret);
> +               return false;
> +       }
> +
> +       ret = ufshcd_vops_get_user_cap_mode(hba);
> +       if (ret <= 0) {
> +               dev_dbg(hba->dev, "Get user-cap reduction mode: failed: %d\n",
> +                       ret);
> +               /* Most commonly used */
> +               ret = UFS_WB_BUFF_PRESERVE_USER_SPACE;
> +       }
> +
> +       if (ret == UFS_WB_BUFF_USER_SPACE_RED_EN) {
> +               if (avail_buf <= UFS_WB_10_PERCENT_BUF_REMAIN)
> +                       return true;
> +               return false;
> +       } else if (ret == UFS_WB_BUFF_PRESERVE_USER_SPACE) {
> +               ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_READ_ATTR,
> +                                             QUERY_ATTR_IDN_CURR_WB_BUFF_SIZE,
> +                                             0, 0, &cur_buf);
> +               if (ret) {
> +                       dev_err(hba->dev, "%s dCurWriteBoosterBufferSize read failed %d\n",
> +                                __func__, ret);
> +                       return false;
> +               }
> +
> +               if (!cur_buf) {
> +                       dev_info(hba->dev, "dCurWBBuf: %d WB disabled until free-space is available\n",
> +                                cur_buf);
> +                       return false;
> +               }
> +               /* Let it continue to flush when >60% full */
> +               if (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN)
> +                       return true;
> +       }
> +       return false;
> +}
> +
>  /**
>   * ufshcd_exception_event_handler - handle exceptions raised by device
>   * @work: pointer to work data
> @@ -6632,6 +6829,28 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
>                                       desc_buf[DEVICE_DESC_PARAM_SPEC_VER + 1];
>
>         model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
> +       /* Enable WB only for UFS-3.1 */
> +       if (dev_info->wspecversion >= 0x310) {
> +               hba->dev_info.d_ext_ufs_feature_sup =
> +                       get_unaligned_be32(desc_buf +
> +                               DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
> +               /*
> +                * WB may be supported but not configured while provisioning.
> +                * The spec says, in dedicated wb buffer mode,
> +                * a max of 1 lun would have wb buffer configured.
> +                * Now only shared buffer mode is supported.
> +                */
> +               hba->dev_info.b_wb_buffer_type =
> +                       desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
> +
> +               if (!hba->dev_info.b_wb_buffer_type)
> +                       goto skip_alloc_unit;
> +               hba->dev_info.d_wb_alloc_units =
> +                       get_unaligned_be32(desc_buf +
> +                               DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
> +       }
> +
> +skip_alloc_unit:
>         err = ufshcd_read_string_desc(hba, model_index,
>                                       &dev_info->model, SD_ASCII_STD);
>         if (err < 0) {
> @@ -7142,6 +7361,7 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool async)
>         /* set the state as operational after switching to desired gear */
>         hba->ufshcd_state = UFSHCD_STATE_OPERATIONAL;
>
> +       ufshcd_wb_config(hba);
>         /* Enable Auto-Hibernate if configured */
>         ufshcd_auto_hibern8_enable(hba);
>
> @@ -7802,12 +8022,16 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
>          *
>          * Ignore the error returned by ufshcd_toggle_vreg() as device is anyway
>          * in low power state which would save some power.
> +        *
> +        * If Write Booster is enabled and the device needs to flush the WB
> +        * buffer OR if bkops status is urgent for WB, keep Vcc on.
>          */
>         if (ufshcd_is_ufs_dev_poweroff(hba) && ufshcd_is_link_off(hba) &&
>             !hba->dev_info.is_lu_power_on_wp) {
>                 ufshcd_setup_vreg(hba, false);
>         } else if (!ufshcd_is_ufs_dev_active(hba)) {
> -               ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
> +               if (!hba->dev_info.keep_vcc_on)
> +                       ufshcd_toggle_vreg(hba->dev, hba->vreg_info.vcc, false);
>                 if (!ufshcd_is_link_active(hba)) {
>                         ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq);
>                         ufshcd_config_vreg_lpm(hba, hba->vreg_info.vccq2);
> @@ -7931,11 +8155,21 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>                         /* make sure that auto bkops is disabled */
>                         ufshcd_disable_auto_bkops(hba);
>                 }
> +               /*
> +                * With wb enabled, if the bkops is enabled or if the
> +                * configured WB type is 70% full, keep vcc ON
> +                * for the device to flush the wb buffer
> +                */
> +               if ((hba->auto_bkops_enabled && ufshcd_wb_sup(hba)) ||
> +                   ufshcd_wb_keep_vcc_on(hba))
> +                       hba->dev_info.keep_vcc_on = true;
> +       } else if (!ufshcd_is_runtime_pm(pm_op)) {
> +               hba->dev_info.keep_vcc_on = false;
>         }
>
>         if ((req_dev_pwr_mode != hba->curr_dev_pwr_mode) &&
> -            ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
> -              !ufshcd_is_runtime_pm(pm_op))) {
> +           ((ufshcd_is_runtime_pm(pm_op) && !hba->auto_bkops_enabled) ||
> +            !ufshcd_is_runtime_pm(pm_op))) {
>                 /* ensure that bkops is disabled */
>                 ufshcd_disable_auto_bkops(hba);
>                 ret = ufshcd_set_dev_pwr_mode(hba, req_dev_pwr_mode);
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 6ffc08a..59d6eb6 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -344,6 +344,7 @@ struct ufs_hba_variant_ops {
>         void    (*config_scaling_param)(struct ufs_hba *hba,
>                                         struct devfreq_dev_profile *profile,
>                                         void *data);
> +       u32     (*wb_get_user_cap_mode)(struct ufs_hba *hba);
>  };
>
>  /* clock gating state  */
> @@ -555,6 +556,13 @@ enum ufshcd_caps {
>          * for userspace to control the power management.
>          */
>         UFSHCD_CAP_RPM_AUTOSUSPEND                      = 1 << 6,
> +
> +       /*
> +        * This capability allows the host controller driver to turn-on
> +        * WriteBooster, if the underlying device supports it and is
> +        * provisioned to be used. This would increase the write performance.
> +        */
> +       UFSHCD_CAP_WB_EN                                = (1 << 7),
>  };
>
>  /**
> @@ -727,6 +735,8 @@ struct ufs_hba {
>
>         struct device           bsg_dev;
>         struct request_queue    *bsg_queue;
> +       bool wb_buf_flush_enabled;
> +       bool wb_enabled;
>  };
>
>  /* Returns true if clocks can be gated. Otherwise false */
> @@ -775,6 +785,11 @@ static inline bool ufshcd_is_auto_hibern8_enabled(struct ufs_hba *hba)
>         return FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK, hba->ahit) ? true : false;
>  }
>
> +static inline bool ufshcd_is_wb_allowed(struct ufs_hba *hba)
> +{
> +       return hba->caps & UFSHCD_CAP_WB_EN;
> +}
> +
>  #define ufshcd_writel(hba, val, reg)   \
>         writel((val), (hba)->mmio_base + (reg))
>  #define ufshcd_readl(hba, reg) \
> @@ -1130,4 +1145,10 @@ static inline u8 ufshcd_scsi_to_upiu_lun(unsigned int scsi_lun)
>  int ufshcd_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
>                      const char *prefix);
>
> +static inline unsigned int ufshcd_vops_get_user_cap_mode(struct ufs_hba *hba)
> +{
> +       if (hba->vops && hba->vops->wb_get_user_cap_mode)
> +               return hba->vops->wb_get_user_cap_mode(hba);
> +       return 0;
> +}
>  #endif /* End of Header */
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>
