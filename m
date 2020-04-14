Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B141A8C78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730355AbgDNUaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728107AbgDNUaM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:30:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52362C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:30:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b7so5800026pju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=EU1CMnDF0oiIvYhvVzGp363PBNEY9tYmy0a2rAKNwoI=;
        b=ZdrGsV0cP/ZdooyYQY2bxpt1/Pmxw5+CBoSmTkVcWnQHK/RoDdjRHkuHwta0LRGBq8
         UWlw/GRg98scGb1JnZmLeeMy3Lp/hac+38y+zaEeIkkxRVrNR8R59LAcM4i0HFAELmmJ
         DM71JzzvNFh2E4fH+4tWL2DTL//zVToPVnNJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=EU1CMnDF0oiIvYhvVzGp363PBNEY9tYmy0a2rAKNwoI=;
        b=c1tTBRao9tKPNuCotOI7Q3YXbuwsuijNCNUXSw1tTzEAsz/UScKPleb/H2SGCB86Ka
         v88nKzDgXCE/JHfMHKSPnzM7jrlQ8fjwcGAfOeQjejIB7q8zf1m5eCG22Iu+zNh2ZMyw
         +g9C3P/9aXWlh++dZWHZMGoswK+pMtsgBy9ivrtM4/J7BdyuzDknDwG1OUxymMFCvvY1
         7FxXUtvPnE5lXlMs8mPpWz5D/39hxTyWZq34ouNCB5bCCpsl1iOZOZnL5nnXaIGgJ8qn
         JjjIJwPz4HANHHxKzlaAXGohSIXjkGnGIjc7JgBcYJ2k7BIncQPggBgcSm4c8oZZFzE1
         S2FQ==
X-Gm-Message-State: AGi0PuaFloF64RnNp46tKFSuqotI6A5KK/+rf4cPmoJN02HVmvIw1MJg
        5S9+aZ4JjAtbZl9EcdEyI1XW2g==
X-Google-Smtp-Source: APiQypLuFXMQzrk14UAbS5YwhZQZ9DQ73n74mA98ygWJ2GhKXStkN8CGmjRRV+N7xjH3ED4F0PjlGw==
X-Received: by 2002:a17:90a:d153:: with SMTP id t19mr1924549pjw.188.1586896211797;
        Tue, 14 Apr 2020 13:30:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u24sm8732425pgo.65.2020.04.14.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:30:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200414131010.v2.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid>
References: <20200414131010.v2.1.Ic70288f256ff0be65cac6a600367212dfe39f6c9@changeid> <20200414131010.v2.2.I8550512081c89ec7a545018a7d2d9418a27c1a7a@changeid>
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mkshah@codeaurora.org, joe@perches.com, mka@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Date:   Tue, 14 Apr 2020 13:30:10 -0700
Message-ID: <158689621032.105027.15399009553185990099@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-14 13:10:16)
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index f988e9cc2c30..02fc114ffb4f 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -174,12 +175,13 @@ static void write_tcs_reg(const struct rsc_drv *drv=
, int reg, int tcs_id,
>  static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int t=
cs_id,
>                                u32 data)
>  {
> +       u32 new_data;
> +
>         writel(data, tcs_reg_addr(drv, reg, tcs_id));
> -       for (;;) {
> -               if (data =3D=3D readl(tcs_reg_addr(drv, reg, tcs_id)))
> -                       break;
> -               udelay(1);
> -       }
> +       if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new=
_data,
> +                                     new_data =3D=3D data, 1, USEC_PER_S=
EC))
> +               pr_err("%s: error writing %#x to %d:%d\n", drv->name,

Shouldn't the register be hex? That seems to be how the registers are
represented. But I guess tcs_id is decimal and can't be translated to be
meaningful enough to indicate which TCS it is like the sleep or wake
one.

> +                      data, tcs_id, reg);
>  }
