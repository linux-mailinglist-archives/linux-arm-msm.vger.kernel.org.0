Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7CC4B7D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343635AbiBPCRO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:17:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235319AbiBPCRN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:17:13 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C875C1165
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:17:02 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id r27so1030054oiw.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=kde7/XTU2PafoBmMQBQwevj0YqOlB5phYkdEBWwVR9A=;
        b=bvqlVe6XuOA3ar+rEW2dBP1EAEFbjSwGHM1QVbj8l7WMsI/iU/k4xTYgJWnYJvLZlO
         eMnu/BfVID/vb78QwtAg6U8CX4y5yUWrd59H8cb0/7MJOFWn/JwYBS+bOLpfDV1NKx7G
         3KnxWbAq5bPPlJtKKbe4JRMaZUXK4I7zXLQQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=kde7/XTU2PafoBmMQBQwevj0YqOlB5phYkdEBWwVR9A=;
        b=KJ3WZsVmAkhkeLfsUHFlYhJdxPhd3wEZtLuYJ4GLdoMNlckkM456imkRV0xnpZCASL
         LXSteU/YWg4/GfujhveLA/XE1sZaK5LwnCY7VJdKslRxCUrKl6aspcvNWSIbKOT8Pw6R
         xdA2szKbdAj7mz7z5pyyAtsyzigXSyMROJK6YWcDRsXISJqxP+QkDtviMmRCju3L6EK8
         iF9De0jQ+MgK4R5ZLpZ6Xbs31abmbpDCX9fc1RFoGq0Ntcwt+r8tUH4dbwhIfTtBxQbd
         DxQ2X/TJoJzGKEesiODi07DoTNb5b+cQMTntpg2cgeP6RCIXuQMuOK8lDscZ3ONdn1Uc
         0AGQ==
X-Gm-Message-State: AOAM530nIDp3TXwQg02PdSS35dYjH/sitdoWwT2WuzTj6j1PFRwsrNv4
        xX6hO/wKAxAI5QEjVQVlxDchj/TVoNVSIpU3XfJriQ==
X-Google-Smtp-Source: ABdhPJz6zcCH239EpdIWwsMam/u/vKcry0Zx2rcbSzYb05td5YLCxSpA8S8OJpW9NYeWmOdrWRrJ1BdfylJkNqL5eMw=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2972963oig.40.1644977821830; Tue, 15
 Feb 2022 18:17:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:17:01 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-8-dmitry.baryshkov@linaro.org> <CAE-0n53y6x+4aqQMjwgQ=W-m2v5BjaFQptLB+D8dh0R8n-pzhQ@mail.gmail.com>
 <CAA8EJpqhKdYBisj9qEExKX20zPLpBnCs12FAYYSTo89hcXa48Q@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:17:01 -0800
Message-ID: <CAE-0n52whdW5XZ0LuemRkGv9nEZcV9wutUVmpNCZn3sYtJ3xsA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] drm/msm/dpu: pull connector from dpu_encoder_phys
 to dpu_encoder_virt
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-15 18:13:09)
> On Wed, 16 Feb 2022 at 05:00, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-02-15 06:16:42)
> > > All physical encoders used by virtual encoder share the same connector,
> > > so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
> > > structure.
> >
> > What is the benefit? Less code? Clearer association?
>
> Clearer association. Otherwise code suggests that different phys_encs
> can have different connectors.

Got it. With that info added to the commit text

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
