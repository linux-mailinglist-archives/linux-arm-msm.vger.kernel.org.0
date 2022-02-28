Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656744C7B46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 22:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiB1VDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 16:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiB1VDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 16:03:11 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC7C2B240
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 13:02:31 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id a6so14397733oid.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 13:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=OjxaRtww+0xjPVA2HOQsw52HxUVAinM3d0O8FoXeDko=;
        b=BAB4ti96IwrLL45RTnLkyVlTAFqJ8Gh6Ntg3w0Rk2WSWnBfnOec8AKO/J2rWYeriVS
         JQbU7JrNNsR9Q3ge5zfmlnX0P7WIOzNbU3ugL6IYLL++VqB3WQeegRpCYo68Lips/lfp
         82gfdqDxH3c2c6zf4vn0pA0w0qTvVqMGOQMAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=OjxaRtww+0xjPVA2HOQsw52HxUVAinM3d0O8FoXeDko=;
        b=a4bDOJno+bk5it2s2Q8ZD+xAm9NtwflRkcgUSQj60C+MzuZ0NofdTbVt6v+SeWcies
         8AD7h5dhEfZNft6wm2g5SicIoNr+gFSqhjdBfeiHYmJtfmCwL4Dgbws53guOneojvXxI
         72COb6HEskiTAISkRdThUax8wdWPfoXn0aLXoNOeJBfuZObrfRbqu9gSRrJi3BYAlwYX
         iypX9tu+FwUe+euhA4cURwYLh2Y183SShlh5BWDvaxpajSMglzHsJvPuQMXoErCcEQ+5
         pPOO9cBAAPHEHKhWxHveiWkJqd6I2kkAD5jpou9cpjsKiV2ZCD8P3hHA9cvWp1VANnjc
         syUA==
X-Gm-Message-State: AOAM533qoHrx8Gx5a62NFfxYLmlSPqONlNgOU8aL43Eya3GPfJMukIBb
        +dPZru6qyeJZpfbZUpW2+eHTC+fIe41B9i9pKwg2ow==
X-Google-Smtp-Source: ABdhPJz0rtxf29o77JVEbaaT9zWczUDsrAzEfY9cyLITyQ8XWVVDNvI/ytMrImJbvsCu+c4Aupsp99oh6218O1qRzqM=
X-Received: by 2002:a05:6808:1a28:b0:2d7:3c61:e0d6 with SMTP id
 bk40-20020a0568081a2800b002d73c61e0d6mr12241619oib.32.1646082150802; Mon, 28
 Feb 2022 13:02:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Feb 2022 13:02:30 -0800
MIME-Version: 1.0
In-Reply-To: <1646030377-12092-2-git-send-email-quic_srivasam@quicinc.com>
References: <1646030377-12092-1-git-send-email-quic_srivasam@quicinc.com> <1646030377-12092-2-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 28 Feb 2022 13:02:30 -0800
Message-ID: <CAE-0n53XVfXeVHFhokw7pwSOnL4MQAzDg-83OaH=FB=cB2gqdA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] soundwire: qcom: Add compatible name for v1.6.0
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, pierre-louis.bossart@linux.intel.com,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        sanyog.r.kale@intel.com, srinivas.kandagatla@linaro.org,
        tiwai@suse.com, yung-chuan.liao@linux.intel.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2022-02-27 22:39:36)
> Update compatible string and master data information in soundwire driver
> to support v1.6.0 in lpass sc7280 based platform.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/soundwire/qcom.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 9eb31ba..fb183bd 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -175,6 +175,11 @@ static struct qcom_swrm_data swrm_v1_5_data = {
>         .default_cols = 16,
>  };
>
> +static struct qcom_swrm_data swrm_v1_6_data = {

Why not const?

> +       .default_rows = 50,
> +       .default_cols = 16,

This is the same as swrm_v1_5_data so just use that struct again?

> +};
> +
>  #define to_qcom_sdw(b) container_of(b, struct qcom_swrm_ctrl, bus)
>
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> @@ -1343,6 +1348,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>  static const struct of_device_id qcom_swrm_of_match[] = {
>         { .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>         { .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },

These other structs for v1.5 and v1.3 could also be const.

> +       { .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>         {/* sentinel */},
