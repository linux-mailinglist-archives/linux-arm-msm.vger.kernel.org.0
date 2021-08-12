Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C16713EAACF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 21:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbhHLTUd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 15:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbhHLTUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 15:20:33 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDB9C0617A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 12:20:07 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso2117129ooi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Aug 2021 12:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=m5oFsRHrJOjXfcn+Ba/k0Xba2WmvP4C0WOGVKJDz/Uk=;
        b=O/mh77vNJo9Ib606oFinKMTuwY5MyUN86DF8a01T9KSfwzdN2POVzMYRTYhAv+YSO2
         BYZ1TSp9KnND/MgGxuSN0wRnTdZdOXp4qniEoXdiy2FJq65uLJfYNqt0TTxylbvrcDKA
         HeKWxfAlWHjQv6WCDO9Wx+GJqU1pGJxDmPJgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=m5oFsRHrJOjXfcn+Ba/k0Xba2WmvP4C0WOGVKJDz/Uk=;
        b=aFuMJOk8EcfY+xdXQS2BpUKhhRfwQYTb6qmmGYCw0tVEATJPUPQt6H6QX+5BYfV+Fs
         fiVFu1bdcr13vvBFuuonh3r1mjwH2KAEfMfXW5f/D2D6ngd7kRRvs/CfYrrTZi+RXGPK
         WzASkTbGXzqYzDqHuFjthvN4UazrCQcpBFw+VhIFnczAyq43V83jE+B1sznpVTHGBSCi
         X6m2Ooui1/uTjGAPcqI2+jVqCsu1569MyCfH4BtWv1ydz5v1K/1Hr901zeOP6yRaHv48
         hVWT4Uyvj+pSPR10SX5bRSSRxQ00ij8UH8cmETt/zPelW7tP8D7pag/zT/npJxpYmeRx
         A34A==
X-Gm-Message-State: AOAM532MgIlaoWKiTZCQLNDmNznRefswO4nUVcwcw1pCyi2ORVl5QCo/
        Gc26qdv0fVrwfLaWQTAB5cnkskHbG6a80rmGgmZwAw==
X-Google-Smtp-Source: ABdhPJzKEXQQlxGoeVHXAuHXOc8FAuq2COLQMYXRlSEYl52tW2jac0A+EnBMEETnafKUGYktUwO2SDukJvJ3sjEi7pk=
X-Received: by 2002:a4a:c60e:: with SMTP id l14mr4286245ooq.80.1628796006339;
 Thu, 12 Aug 2021 12:20:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Aug 2021 12:20:05 -0700
MIME-Version: 1.0
In-Reply-To: <1628588875-23790-6-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org> <1628588875-23790-6-git-send-email-dikshita@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 12 Aug 2021 12:20:05 -0700
Message-ID: <CAE-0n50y1PHu--5dg3ehYcmyLGsU6V7-VnPfVLoN452dK04TVA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] venus: vdec: set work route to fw
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dikshita Agarwal (2021-08-10 02:47:53)
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 198e47e..4e7b9e5 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -653,6 +653,24 @@ static int vdec_set_properties(struct venus_inst *inst)
>         return 0;
>  }
>
> +static int vdec_set_work_route(struct venus_inst *inst)
> +{
> +       struct hfi_video_work_route wr;
> +       u32 ptype;
> +       int ret;
> +
> +       if(!IS_V6(inst->core))

Please add a space after 'if'

> +               return 0;
> +
> +       wr.video_work_route = inst->core->res->num_vpp_pipes;
> +
> +       ptype = HFI_PROPERTY_PARAM_WORK_ROUTE;
> +       ret = hfi_session_set_property(inst, ptype, &wr);
> +       if (ret)
> +               return ret;
> +       return 0;

return hfi_session_set_property(...) is shorter.

> +}
> +
>  #define is_ubwc_fmt(fmt) (!!((fmt) & HFI_COLOR_FORMAT_UBWC_BASE))
>
>  static int vdec_output_conf(struct venus_inst *inst)
