Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0F4352E017
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 00:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244469AbiESWs7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 18:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244074AbiESWs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 18:48:57 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA3D92D08
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 15:48:56 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-edf3b6b0f2so8467576fac.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=gPmJM59HilOSZAiNocBUyn1VGxu9PFrDrw8E4Yeqrfk=;
        b=Ivbz2PDWtVwyLf0aE9K3mPrsVLOK80ClXfeDGxNsqdlxmI6lf/HqV7VfS+K1pFR238
         KfAvg7i6sxEPBmB782C8Q6xIoiiz4VrGwKI6qxj4FpHIfeHM7VsU0oaEHwdpWxktouqK
         31WAtWkdHxSG3SjDgz+OusBnk+tjWjtiPafIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=gPmJM59HilOSZAiNocBUyn1VGxu9PFrDrw8E4Yeqrfk=;
        b=OW8FdEyNF1HN2uhcIG5w3oeG07ioa1g7OBxdTBzx6vmU+ayqNRPMG02QySauuGS7L9
         ULH0bwQG+lCQ4nLI3tPIWzXSzem0+EnG7Pjh4N+ve06IUkP6XHbGwlYD09cIZd24otZw
         zsJl2mxyshn3haM3JzRL7dAo9jsU5/p7laVKDDIVYT9PYzCdF6f5UGVb42aRHzTDzOkx
         SCJxobszsSL2z8xibYSUkRi/07k8+dQraYpTA2uzdsqJyZOcffAko64VKxhUIVecWiQM
         jx/X3Us1mBfFW7npvUve+PQ3vRaKZKVpNqvLdJSbKZybvMhboPTmSDxWu+NZEr9v+a6q
         tquQ==
X-Gm-Message-State: AOAM533kyrSFAdc1/Nijnm8ZagaGntEYbqRxPch9T4+XSK7XPcCjuBw+
        PlPZgOSja9IpoZ+XK4Uw8zt3CpVNSPQea0AqkmeK1A==
X-Google-Smtp-Source: ABdhPJw5ddHxY0cfryu3hgg4S9UcGUCH59iSaeUGGcNe4rzoKsPmMGWR455MyyYyru3KXBJ68SY9LKIemGUmA3oUAE4=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3801393oap.193.1653000536016; Thu, 19
 May 2022 15:48:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 15:48:55 -0700
MIME-Version: 1.0
In-Reply-To: <1652982339-18190-3-git-send-email-quic_khsieh@quicinc.com>
References: <1652982339-18190-1-git-send-email-quic_khsieh@quicinc.com> <1652982339-18190-3-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 19 May 2022 15:48:55 -0700
Message-ID: <CAE-0n52ugbZfhP7BTYoo9yt1CMsKTW5uW74GdBNx14cRzj39gA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-19 10:45:38)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..24f39ee 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -5008,6 +5019,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                 return 0;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = 0; i <= cfg->num_vregs; i++)

Just less than (<) cfg->num_vregs, not less than or equal to (<=)

> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
> +       }
>
