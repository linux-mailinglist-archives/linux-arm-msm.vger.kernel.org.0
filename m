Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC66C6879E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbjBBKMw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbjBBKMu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:12:50 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39CD71981
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:12:46 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-50e7a0f0cc8so20018937b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gjb62+lXPdUY1rPIYnUIQiGvb9ZLzScX+izmbGPK+3U=;
        b=b3jpffC5QBAc6Y0TX3tWib7NdtevvGs482SwwlvxxVIzWpdp0THhhvPRHonMjuC56G
         QaOxFkd5SECO1HeAgD0nXM/KYX+NdgpwstiNNj8aa73OpdbDMUsd9pW7m9SBTLggf/Eh
         HT0yjtlrlHtFCaWktqQehIwvRx612HCrQTSKD31tVBJ0qK2p6Hjj00cUaoWwq8Dn5Pal
         g/Ldpbkl+YKtoqod16DVEJS+XNfdSczTr9PkkhFJGk2IOI9kNd9qgjPXIjDb6fTRi3g5
         md6HjM2N/EzCQYl3PdjWqWquKb9upmwhDQqMDH+aHFM1UzfKTdz/YaKHXFSlOM1GWeks
         nXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gjb62+lXPdUY1rPIYnUIQiGvb9ZLzScX+izmbGPK+3U=;
        b=D1LP4vTEjd78cDZBf5Eq9/mOkup3FTMCqf/+0PdlA3bDL9/jZFZDiXeymicM+H0D/Q
         5LtRfQtzCAp9N+Ns1xSMvkUzKbF15y6lMP5wB0qXmMPFEjytL5pN84RS0fkWGCuTbsWF
         0C94WwxNllMPlP3aho7EEgL3zP53m5UrRQ4rgcsvfgDhSyCAEynjgtqKPJgWlD8nNmTf
         wLYawt9Wz60LdaUtXHgIybnUsEU4mnVMVntVj14+7vWFCljh4CQOnEy7c8jA/ZIaQkpR
         JCNyzEgu8zViT7ILEV1mgAwJZw9UdBeAz/3+0Zel6L6SWUw1l/W0ivfWk9cbURjR0aZY
         pefg==
X-Gm-Message-State: AO0yUKV3a0eNT8ZI4X6JxHNQV8YajLbeZuuCFU6r0LmkjJ9STHEo+9PZ
        UsGhBIjfKlMLKKT157pj8LGRYjikPyB2REqbDW5M7Q==
X-Google-Smtp-Source: AK7set8t5AtXPUHdkAT5542L7e945bse78Iansl0jQRe0L8gTrJLOYwhUI4/KVM9pHXA3uiayA2diX9Vwhy5JiestRk=
X-Received: by 2002:a05:690c:f93:b0:506:79fc:3df6 with SMTP id
 df19-20020a05690c0f9300b0050679fc3df6mr593658ywb.127.1675332766077; Thu, 02
 Feb 2023 02:12:46 -0800 (PST)
MIME-Version: 1.0
References: <1674562755-5378-1-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1674562755-5378-1-git-send-email-quic_mojha@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Feb 2023 12:12:35 +0200
Message-ID: <CAA8EJpoeSMr5+-EBE7zYsqo7G-agFWwP8o-+jk_D0fLopHwFxA@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom_scm: modify qcom_scm_set_download_mode()
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Jan 2023 at 14:19, Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>
> Modify qcom_scm_set_download_mode() such that it can support
> multiple modes. There is no functional change with this change.

Please describe usecases for such a change. Without them it's just an
unused complication.

>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/firmware/qcom_scm.c | 17 ++++++++---------
>  include/linux/qcom_scm.h    |  5 +++++
>  2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index cdbfe54..712bb03 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -400,22 +400,22 @@ int qcom_scm_set_remote_state(u32 state, u32 id)
>  }
>  EXPORT_SYMBOL(qcom_scm_set_remote_state);
>
> -static int __qcom_scm_set_dload_mode(struct device *dev, bool enable)
> +static int __qcom_scm_set_dload_mode(struct device *dev, enum qcom_download_mode mode)
>  {
>         struct qcom_scm_desc desc = {
>                 .svc = QCOM_SCM_SVC_BOOT,
>                 .cmd = QCOM_SCM_BOOT_SET_DLOAD_MODE,
>                 .arginfo = QCOM_SCM_ARGS(2),
> -               .args[0] = QCOM_SCM_BOOT_SET_DLOAD_MODE,
> +               .args[0] = mode,
>                 .owner = ARM_SMCCC_OWNER_SIP,
>         };
>
> -       desc.args[1] = enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0;
> +       desc.args[1] = mode;
>
>         return qcom_scm_call_atomic(__scm->dev, &desc, NULL);
>  }
>
> -static void qcom_scm_set_download_mode(bool enable)
> +static void qcom_scm_set_download_mode(enum qcom_download_mode mode)
>  {
>         bool avail;
>         int ret = 0;
> @@ -424,10 +424,9 @@ static void qcom_scm_set_download_mode(bool enable)
>                                              QCOM_SCM_SVC_BOOT,
>                                              QCOM_SCM_BOOT_SET_DLOAD_MODE);
>         if (avail) {
> -               ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
> +               ret = __qcom_scm_set_dload_mode(__scm->dev, mode);
>         } else if (__scm->dload_mode_addr) {
> -               ret = qcom_scm_io_writel(__scm->dload_mode_addr,
> -                               enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
> +               ret = qcom_scm_io_writel(__scm->dload_mode_addr, mode);
>         } else {
>                 dev_err(__scm->dev,
>                         "No available mechanism for setting download mode\n");
> @@ -1410,7 +1409,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
>          * disabled below by a clean shutdown/reboot.
>          */
>         if (download_mode)
> -               qcom_scm_set_download_mode(true);
> +               qcom_scm_set_download_mode(QCOM_DOWNLOAD_FULLDUMP);
>
>         return 0;
>  }
> @@ -1419,7 +1418,7 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
>  {
>         /* Clean shutdown, disable download mode to allow normal restart */
>         if (download_mode)
> -               qcom_scm_set_download_mode(false);
> +               qcom_scm_set_download_mode(QCOM_DOWNLOAD_NODUMP);
>  }
>
>  static const struct of_device_id qcom_scm_dt_match[] = {
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index f833564..f9bc84e 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -14,6 +14,11 @@
>  #define QCOM_SCM_CPU_PWR_DOWN_L2_OFF   0x1
>  #define QCOM_SCM_HDCP_MAX_REQ_CNT      5
>
> +enum qcom_download_mode {
> +       QCOM_DOWNLOAD_NODUMP    = 0x00,
> +       QCOM_DOWNLOAD_FULLDUMP  = 0x10,
> +};
> +
>  struct qcom_scm_hdcp_req {
>         u32 addr;
>         u32 val;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
