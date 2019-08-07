Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B4784361
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2019 06:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfHGEZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Aug 2019 00:25:53 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44671 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfHGEZx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Aug 2019 00:25:53 -0400
Received: by mail-ot1-f66.google.com with SMTP id b7so48886027otl.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2019 21:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ATctTDaGdbuSHTCGNV3yIygAvKI+PZ5Bx0qOvsrsdU=;
        b=Pr1TFTBPQsPZQkpBl1gTXGD5ehedYAy5IgSiynzskrPnWdr4niMAIJVdzjNvrApE4r
         FDSjtJCibdOlzOpQNWmdaIhwwiHAN9UkbuccdaCJxa2w4HVSoLB0X7putJWBQ4mziSpC
         3/EHLm2TEeo4Ww++5N2jMzlt0GdyY86ZDUP2m5SSeqTTiIeUHaE7yGD4fNhJPwYiczEe
         K9vDFUsmlQvuQP6kZY7H+E7TiWLayveSS1ece73bgYdl8HEu1O6B5pi+wybjZDOtRgi1
         gxD3OKbAKL7L32rqu1b+yZOqR4ZYvwEd3dBvcmPEfDpf39eKu6wsYR1+4+huS8E+BjOK
         4NXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ATctTDaGdbuSHTCGNV3yIygAvKI+PZ5Bx0qOvsrsdU=;
        b=TN2PhZEipmT2F8Qpd42LDKtYlkrShHHVHuOas91EChZRn7aLuoda2YL+gd8Lm49ap6
         IHnxZSW709U6PMR6DCMYhmE14qDWXrD6YpvQ063oSbMQEfM4EnjTbpZMgV+J71eZpdaU
         f8XCXGyU+pLDhUmHVl7OchbMCJisbhWUFCw25UitFlQNdhJiDcJuXKRMPam8d0a0V9xQ
         22N+EHtPw0OQGwsqPB1xRaWtqP+LpDMFdpBP3CFIdJxE3OwFhEkqZZ2aCOBsP13Xqay2
         EZZHFhUcLhEOhmb9+WI9rw+okbwsPlHUUS1PU+SVXGOQunDwl51mxp/lHQJ6Y+TFC5oq
         bFFg==
X-Gm-Message-State: APjAAAW9n2rRJsArXsv1VfSebz4JtBO2gUXNFOmHihYhbXIAC8HUq/K9
        OT2VojksTbJ39tTcTBD7uT6XB07miiPI254rDdMisg==
X-Google-Smtp-Source: APXvYqyd/Zu0XywNS/VeNaLFP0dsw9hCkyh6Xki5zJ7X68h0qtL57F5zTIUSNPDvsC+fAUE8xwVCmn/m7vN3YCNliKg=
X-Received: by 2002:a05:6638:303:: with SMTP id w3mr7848813jap.103.1565151952221;
 Tue, 06 Aug 2019 21:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190807100803.63007737@canb.auug.org.au> <20190807022356.8502-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190807022356.8502-1-bjorn.andersson@linaro.org>
From:   Vaishali Thakkar <vaishali.thakkar@linaro.org>
Date:   Wed, 7 Aug 2019 09:55:41 +0530
Message-ID: <CANNG1HVRCfQPk4pP37SbEcR+_Upx7+N_SH95TYUxAhiB+jNLHg@mail.gmail.com>
Subject: Re: [PATCH v2] soc: qcom: socinfo: Annotate switch cases with fall through
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 7 Aug 2019 at 07:54, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> Introduce fall through annotations in the switch statements of
> socinfo_debugfs_init() to silence compiler warnings.

Oops, I missed this. Thanks for fixing it!

> Fixes: 9c84c1e78634 ("soc: qcom: socinfo: Expose custom attributes")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Vaishali Thakkar <vaishali.thakkar@linaro.org>

> ---
>  drivers/soc/qcom/socinfo.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 855353bed19e..a39ea5061dc5 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -323,6 +323,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>                 debugfs_create_x32("raw_device_number", 0400,
>                                    qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.raw_device_num);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 11):
>         case SOCINFO_VERSION(0, 10):
>         case SOCINFO_VERSION(0, 9):
> @@ -330,10 +331,12 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>
>                 debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.foundry_id);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 8):
>         case SOCINFO_VERSION(0, 7):
>                 DEBUGFS_ADD(info, pmic_model);
>                 DEBUGFS_ADD(info, pmic_die_rev);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 6):
>                 qcom_socinfo->info.hw_plat_subtype =
>                         __le32_to_cpu(info->hw_plat_subtype);
> @@ -341,6 +344,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>                 debugfs_create_u32("hardware_platform_subtype", 0400,
>                                    qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.hw_plat_subtype);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 5):
>                 qcom_socinfo->info.accessory_chip =
>                         __le32_to_cpu(info->accessory_chip);
> @@ -348,23 +352,27 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>                 debugfs_create_u32("accessory_chip", 0400,
>                                    qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.accessory_chip);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 4):
>                 qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
>
>                 debugfs_create_u32("platform_version", 0400,
>                                    qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.plat_ver);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 3):
>                 qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
>
>                 debugfs_create_u32("hardware_platform", 0400,
>                                    qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.hw_plat);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 2):
>                 qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
>
>                 debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
>                                    &qcom_socinfo->info.raw_ver);
> +               /* Fall through */
>         case SOCINFO_VERSION(0, 1):
>                 DEBUGFS_ADD(info, build_id);
>                 break;
> --
> 2.18.0
>
