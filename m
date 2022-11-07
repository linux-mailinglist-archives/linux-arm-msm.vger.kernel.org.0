Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E720C61FB80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 18:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbiKGRfK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 12:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbiKGRfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 12:35:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9FD26E6
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 09:35:08 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j4so17813018lfk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2vBV15/t75rMwmc5x5QmAZ8tvqjlJL8SG6UbJno1k6k=;
        b=eKf2NTY8glHETLli+gjYNG+IL7W9ro7LFV1OPSmNRquYMgpRtorVcFqvCMK6rfgWAs
         cF6QvwJC1qhgA6LiF45tB12iNeE+ZX0qgEVYC74n0t9+FbB0YDPFe74JOy4cLjGKERdF
         GSbeGl7gTWXX8YH8SOEvG4oEVe40EX3D9qUn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vBV15/t75rMwmc5x5QmAZ8tvqjlJL8SG6UbJno1k6k=;
        b=iBLL+5s4GIgGtJdqt2SBGniLr4kJ99Zgv9hQBCdsKLU6ySqvp/i9JEzAvJBCAHFOrt
         9kDdTciOMunV487xKRFo1teFTHdKGKI4iomQALBTwRDoqKf6cs2CD6Ha8NUzqxN2sqA8
         fp0my5jHV0GkWAAQ6TypnObpxhc9tKCZUHaBWv1QUO/xQdR0JG1S4+KAiXNyYSC7L+TK
         BZvlObUm3dcc7AtzpbugRVddPcnC3oYSrJJlsnYrjBY1Kcyort3ilPuXYe4P/g72axCO
         By1sP36xGW2cwqj/cqazfjjP6hjOXQl1NbsN4ROQ7NS3pxtJLw8EEWq2WNeNCLY3/WML
         Ig/w==
X-Gm-Message-State: ACrzQf0J1lVSS/VhpHv1kifOinHG4dmaXn2O5WcD6VQOLO6nIPUBFmaI
        Yt1CzeABU2JwdnXSWKFTBZBcUSzMPwivsDLx8xYWOw==
X-Google-Smtp-Source: AMsMyM7peMcJhcxlagtzkci1EPQ3TVIfAF1dZ2y0sH/gOy81Qea1b0adzI4yu1Ty8KXCcPs0CqJkhVw/hwKwbbPcUs0=
X-Received: by 2002:ac2:52af:0:b0:4a9:d072:f5c4 with SMTP id
 r15-20020ac252af000000b004a9d072f5c4mr390873lfm.82.1667842506322; Mon, 07 Nov
 2022 09:35:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 09:35:05 -0800
MIME-Version: 1.0
In-Reply-To: <20221104082828.14386-1-quic_youghand@quicinc.com>
References: <20221104082828.14386-1-quic_youghand@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 7 Nov 2022 09:35:05 -0800
Message-ID: <CAE-0n5260hssngqWE6j4A_YK0Rq_OSnscpkyVTTiPEMEDz6AGg@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: ath10k: Add WLAN firmware image version info
 into smem
To:     Youghandhar Chintala <quic_youghand@quicinc.com>,
        ath11k@lists.infradead.org
Cc:     linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mpubbise@quicinc.com, linux-arm-msm@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Youghandhar Chintala (2022-11-04 01:28:28)
> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
>
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
>
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
>
> This change is applicable only for WCN399X targets.
>
> Reported-by: kernel test robot <lkp@intel.com>
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

The trailers go together, no blank lines between them.

>
> ---
> Changes from v1:
>  - Changed print format specifier to %zu from %i
>  - Changed ath10k_qmi_add_wlan_ver_smem() API argument
>           to const char *fw_build_id from char *fw_build_id
>  - Changed version_string_size with MACRO
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 66cb7a1e628a..928d78f6d494 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/net.h>
>  #include <linux/platform_device.h>
>  #include <linux/qcom_scm.h>
> +#include <linux/soc/qcom/smem.h>
>  #include <linux/string.h>
>  #include <net/sock.h>
>
> @@ -22,6 +23,8 @@
>
>  #define ATH10K_QMI_CLIENT_ID           0x4b4e454c
>  #define ATH10K_QMI_TIMEOUT             30
> +#define ATH10K_SMEM_IMAGE_VERSION_TABLE       469
> +#define ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX     13
>
>  static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
>                                          struct ath10k_msa_mem_info *mem_info)
> @@ -536,6 +539,29 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
>         return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
>  }
>
> +static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, const char *fw_build_id)
> +{
> +       u8 *smem_table_ptr;
> +       size_t smem_block_size;
> +       const u32 version_string_size = MAX_BUILD_ID_LEN;

Why not make this size_t as well so the type is the same for the
comparison with smem_block_size?

> +       const u32 smem_img_idx_wlan = ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX * 128;

> +
> +       smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +                                      ATH10K_SMEM_IMAGE_VERSION_TABLE,
> +                                      &smem_block_size);
> +       if (IS_ERR(smem_table_ptr)) {
> +               ath10k_dbg(ar, ATH10K_DBG_QMI, "smem image version table not found");

Is this missing a newline?

> +               return;
> +       }
> +       if (smem_img_idx_wlan + version_string_size > smem_block_size) {
> +               ath10k_dbg(ar, ATH10K_DBG_QMI, "smem block size too small: %zu",

Same newline question.

> +                          smem_block_size);
> +               return;
> +       }
> +       memcpy(smem_table_ptr + smem_img_idx_wlan, fw_build_id,

Is it a string? Does it need to be NUL terminated? Should this use some
sort of strcpy()? Does the comparison above need to leave a space for
the NUL terminator?

> +              version_string_size);
> +}
> +
>  static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>  {
>         struct wlfw_cap_resp_msg_v01 *resp;
