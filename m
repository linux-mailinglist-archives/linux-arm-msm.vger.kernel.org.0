Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7976A1B7C73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 19:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgDXRMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 13:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgDXRMV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 13:12:21 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF807C09B047
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:12:20 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id c17so10193283uae.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y4x/EibMxQc7fPoEcBMgM921gNbQOy6kQZP/OouoL7w=;
        b=Fg7ouCwC8QZ4cEnJO4hNfllKuJFP5aegTkmybs5rxcq6KjwVGXjvpkRS6a4tt7W6HH
         XmSko4GsOMX+6qp+K9Ss+3TyVPYAFqTDwYWIeTmtTTu3KV7KYGHVkWaeEkTbzqfmjoRE
         DDyaev+BbAk4jc6lE0gV2WxXUQcYpK8D1MEGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y4x/EibMxQc7fPoEcBMgM921gNbQOy6kQZP/OouoL7w=;
        b=odEQf5nhb9UibmwzdoXMeOYUDxl8UOrFg5OKLoBJjxY5R2M7RhgGLUai/TOqcHQrQV
         vvCFlq9y12eVoapvW/cqK25VVe2HCztUeQKSdidoJf8hMWbetbp2Cip9I/3JkjrDWjBu
         EuoF4OjIYWGJsxTTRfGT7GeKAhnk3A/j/89CCrCu8ZM111QmfUl6Cv6dSF5POCfz2HoD
         DicmghwjsQqp3aYPYCpfXyEi0DtnWMzGY3+CoumhidZ6WfUVQQVHa9uiPZLYz9j5FDCQ
         SxwfaG/R6R7FOfWR7Rw4cnmRljRgUJi2spPdY2XFnUpVDXLMtP23x/yQdxo3C5MNpABS
         u6rg==
X-Gm-Message-State: AGi0PubAnpYOcmIXIlEm1+XIDg/B8L3HK7rgrz76BqYSza6dCY+jqmDQ
        h8dMtcF6tYp9sFdNQZeQX+1D6I59AQc=
X-Google-Smtp-Source: APiQypI82AjT41466lk/qw9e7r+lcO994p3D76XqidYS7MFMfNX3uDuI0WsE+DQf4eu2tSXGjSqzjg==
X-Received: by 2002:a67:7d83:: with SMTP id y125mr7811354vsc.96.1587748339167;
        Fri, 24 Apr 2020 10:12:19 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id h1sm1737480vke.7.2020.04.24.10.12.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2020 10:12:18 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id z16so10197656uae.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2020 10:12:18 -0700 (PDT)
X-Received: by 2002:a9f:3244:: with SMTP id y4mr8649776uad.49.1587748337637;
 Fri, 24 Apr 2020 10:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200424045414.133381-1-swboyd@chromium.org> <20200424045414.133381-2-swboyd@chromium.org>
In-Reply-To: <20200424045414.133381-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Apr 2020 10:12:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WT1rw9H34GjQSjbubR6y61=v-jR-gEvRtN4tU_NwviHA@mail.gmail.com>
Message-ID: <CAD=FV=WT1rw9H34GjQSjbubR6y61=v-jR-gEvRtN4tU_NwviHA@mail.gmail.com>
Subject: Re: [PATCH 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() API
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 23, 2020 at 9:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> This API does very little. Let's replace all the callsites with the
> normal operations that would be done on top of the bitmap that
> tcs_in_use is. This simplifies and reduces the code size.
>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 56 +++++++++++--------------------------
>  1 file changed, 17 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 060be10bc491..76e0294a672c 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -172,22 +172,6 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>         }
>  }
>
> -/**
> - * tcs_is_free() - Return if a TCS is totally free.
> - * @drv:    The RSC controller.
> - * @tcs_id: The global ID of this TCS.
> - *
> - * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
> - *
> - * Context: Must be called with the drv->lock held.
> - *
> - * Return: true if the given TCS is free.
> - */
> -static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
> -{
> -       return !test_bit(tcs_id, drv->tcs_in_use);
> -}
> -
>  /**
>   * tcs_invalidate() - Invalidate all TCSes of the given type (sleep or wake).
>   * @drv:  The RSC controller.
> @@ -500,7 +484,7 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>   *
>   * Return: 0 if nothing in flight or -EBUSY if we should try again later.
>   *         The caller must re-enable interrupts between tries since that's
> - *         the only way tcs_is_free() will ever return true and the only way
> + *         the only way tcs_in_use will ever be updated and the only way
>   *         RSC_DRV_CMD_ENABLE will ever be cleared.
>   */
>  static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
> @@ -508,17 +492,14 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>  {
>         unsigned long curr_enabled;
>         u32 addr;
> -       int i, j, k;
> -       int tcs_id = tcs->offset;
> +       int j, k;
> +       int i = tcs->offset;
>
> -       for (i = 0; i < tcs->num_tcs; i++, tcs_id++) {
> -               if (tcs_is_free(drv, tcs_id))
> -                       continue;
> -
> -               curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
> +       for_each_set_bit_from(i, drv->tcs_in_use, tcs->offset + tcs->num_tcs) {
> +               curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i);
>
>                 for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> -                       addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
> +                       addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i, j);
>                         for (k = 0; k < msg->num_cmds; k++) {
>                                 if (addr == msg->cmds[k].addr)
>                                         return -EBUSY;
> @@ -536,18 +517,18 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
>   *
>   * Must be called with the drv->lock held since that protects tcs_in_use.
>   *
> - * Return: The first tcs that's free.
> + * Return: The first tcs that's free or -EBUSY if all in use.
>   */
>  static int find_free_tcs(struct tcs_group *tcs)
>  {
> -       int i;
> +       const struct rsc_drv *drv = tcs->drv;
> +       unsigned long i;
>
> -       for (i = 0; i < tcs->num_tcs; i++) {
> -               if (tcs_is_free(tcs->drv, tcs->offset + i))
> -                       return tcs->offset + i;
> -       }
> +       i = find_next_zero_bit(drv->tcs_in_use, MAX_TCS_NR, tcs->offset);

Rather than passing MAX_TCS_NR would it be legit to pass "tcs->offset
+ tcs->num_tcs"?  You are passing that as "size" above in
check_for_req_inflight().


> +       if (i > tcs->offset + tcs->num_tcs)

Should the above be ">=" ?  Oh, I guess Bjorn found the same thing.  ;-)


> +               return -EBUSY;
>
> -       return -EBUSY;
> +       return i;
>  }
>
>  /**
> @@ -744,8 +725,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>   */
>  static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>  {
> -       int m;
> -       struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
> +       unsigned long set;
> +       const struct tcs_group *tcs = &drv->tcs[ACTIVE_TCS];
>
>         /*
>          * If we made an active request on a RSC that does not have a
> @@ -756,12 +737,9 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>         if (!tcs->num_tcs)
>                 tcs = &drv->tcs[WAKE_TCS];
>
> -       for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
> -               if (!tcs_is_free(drv, m))
> -                       return true;
> -       }
> +       set = find_next_bit(drv->tcs_in_use, MAX_TCS_NR, tcs->offset);

Similar to above, can you pass "tcs->offset + tcs->num_tcs" instead of
MAX_TCS_NR?
