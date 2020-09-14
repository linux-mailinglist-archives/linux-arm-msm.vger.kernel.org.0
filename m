Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4462269524
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 20:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgINSpU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 14:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgINSpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 14:45:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167DBC06174A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 11:44:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s65so560583pgb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=agJZ2GUvodYk8REC64Enu+qBGzQETZONlk2R56cWqGk=;
        b=NbkqyKdQVeX449Q/lODGRhYt/6bAanlwfoX2gaBL/YVMnECCaAca9R1/6ziUZsdV2a
         NtDpY1ydF1yzkj8BJOX4fEdOgU7ZMWlnn1EP6hl9qB/gSa9rjOZP0707oYem1H99WBP6
         YLIZVnML+795E2r+aP3W2mt0CtY/jPV4Fqb70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=agJZ2GUvodYk8REC64Enu+qBGzQETZONlk2R56cWqGk=;
        b=nhYHrboRuSBuae453Vt00ySgcj+Dk0BL4REf3s7ETeDHpOouX1bP5hSdnImZCmiY6A
         dWdZGHJ5W8C9KXtuUcAX0QA00MFMUyLhn8F+bA4NTTMJXryqQCd2A/5Ft/OMc52PNGGH
         z0hKX1E9MMU+LDLUHTjHhshbtF0DKkgFW3K2TliPrRmpaB7XBYdddrVC13mo1ZwGU61E
         7OUUbUVjfYcaxlFa1S1yXAmr2xDxsXe7MfbEcZbw0e0smCvOw69Jo8qeKoflTx79tNtZ
         LPeIslzPeFFtN3uMp03BhePX23bNcQXWi5ll8BYTLXKuldwjvJetFXO/PkdmcyOrXDCI
         Ybnw==
X-Gm-Message-State: AOAM530AKRGen3+UPN+pGrbgPl+0ZaalfzYHJW+6mILvuBgibqazEQ9y
        mtWq+xFiyLSPSfIjTB2zSjU2lslsmMYqUQ==
X-Google-Smtp-Source: ABdhPJxGUGr21Vkhss+zLD5oiCH5Qy91XpE6K6NDruQN17AdnRpdb4WsIJfIMPntQUGDjwcWpGsrHw==
X-Received: by 2002:a63:e645:: with SMTP id p5mr11596983pgj.276.1600109097559;
        Mon, 14 Sep 2020 11:44:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id k3sm11289661pfp.41.2020.09.14.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 11:44:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <343db8a7b0e85ae6e29b9e79b68b98c22fcbcdce.1599974998.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1599974998.git.saiprakash.ranjan@codeaurora.org> <343db8a7b0e85ae6e29b9e79b68b98c22fcbcdce.1599974998.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv4 1/2] soc: qcom: llcc: Move attribute config to its own function
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Mon, 14 Sep 2020 11:44:55 -0700
Message-ID: <160010909573.4188128.171199552773965552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-09-14 04:12:59)
> Cleanup qcom_llcc_cfg_program() by moving llcc attribute
> configuration to a separate function of its own. Also
> correct misspelled 'instance' caught by checkpatch.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/soc/qcom/llcc-qcom.c | 75 ++++++++++++++++++++----------------
>  1 file changed, 41 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> index 429b5a60a1ba..60ee31842dea 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -318,14 +318,50 @@ size_t llcc_get_slice_size(struct llcc_slice_desc *=
desc)
>  }
>  EXPORT_SYMBOL_GPL(llcc_get_slice_size);
> =20
> -static int qcom_llcc_cfg_program(struct platform_device *pdev)
> +static int qcom_llcc_attr_cfg(const struct llcc_slice_config *table)

Call it config? It's certainly not a table.

>  {
> -       int i;
>         u32 attr1_cfg;
>         u32 attr0_cfg;
>         u32 attr1_val;
>         u32 attr0_val;
>         u32 max_cap_cacheline;
> +       int ret;
> +
> +       attr1_cfg =3D LLCC_TRP_ATTR1_CFGn(table->slice_id);
> +       attr0_cfg =3D LLCC_TRP_ATTR0_CFGn(table->slice_id);

Can this move down to near where it is used?

> +
> +       attr1_val =3D table->cache_mode;
> +       attr1_val |=3D table->probe_target_ways << ATTR1_PROBE_TARGET_WAY=
S_SHIFT;
> +       attr1_val |=3D table->fixed_size << ATTR1_FIXED_SIZE_SHIFT;
> +       attr1_val |=3D table->priority << ATTR1_PRIORITY_SHIFT;
> +
> +       max_cap_cacheline =3D MAX_CAP_TO_BYTES(table->max_cap);
> +
> +       /* LLCC instances can vary for each target.

The /* should be on a line by itself.

> +        * The SW writes to broadcast register which gets propagated
> +        * to each llcc instance (llcc0,.. llccN).
> +        * Since the size of the memory is divided equally amongst the
> +        * llcc instances, we need to configure the max cap accordingly.
> +        */
> +       max_cap_cacheline =3D max_cap_cacheline / drv_data->num_banks;
> +       max_cap_cacheline >>=3D CACHE_LINE_SIZE_SHIFT;
> +       attr1_val |=3D max_cap_cacheline << ATTR1_MAX_CAP_SHIFT;
> +
> +       attr0_val =3D table->res_ways & ATTR0_RES_WAYS_MASK;
> +       attr0_val |=3D table->bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
> +
> +       ret =3D regmap_write(drv_data->bcast_regmap, attr1_cfg, attr1_val=
);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_write(drv_data->bcast_regmap, attr0_cfg, attr0_val=
);
> +
> +       return ret;

return regmap_write(...)

> +}
> +
> +static int qcom_llcc_cfg_program(struct platform_device *pdev)
> +{
> +       int i;
>         u32 sz;
>         int ret =3D 0;
>         const struct llcc_slice_config *llcc_table;
