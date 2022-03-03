Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4FE4CC8CD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235943AbiCCWZm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:25:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbiCCWZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:25:41 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 240F535260
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:24:55 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id a6so6158727oid.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EecN/c73wOIohuQn8PrvwN6Jgs4DeI3pWu9Onrz9zIk=;
        b=D2ku5iFZYEW8dRCUEjIo7CmTFPTLpViWt4NR+wE9RDPu6pnRjpPLzESu6g0DvdX12N
         NC6Cq++YiWxu5cXJtoKnD0lZn/3n/kJ6UBKg4BQYg3A7YjfaI0rBPTYBpWFIu6HtUZN3
         0GqFMncJH0+2TWuEMO2iBFeDGsftk1GFg/8pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EecN/c73wOIohuQn8PrvwN6Jgs4DeI3pWu9Onrz9zIk=;
        b=6q1trfbL3/MKGjp8ze+5p1ER7pR46NF/WegI7t8fwXHHcCfXZNKg4NbXxmhI13PJlF
         /oikGf8CkXcRAYrMZxX4xxff7lEEqTu8RiDNWMEInkugPeImwSfQ7H4WrLM0ksTKBbnU
         9xeOkecg/q0ObgUTxlWnTrBv4OuoZmuzoVuyGxICSrP/kU5zdibtjy/tmPmOp4PtUfFm
         bcJdLVmfxApc5JTsWSW8U2aQvgRiws6tAmsaA4p+lWM/Wt/EaECS2av7WFXPydjWmYeW
         Mk6GJoNKOuDzictU/6ZpS+/cRrfddTX9+VQmKPMVGq54y8udzUoFpuL+zUrHKWqUZdII
         CW0Q==
X-Gm-Message-State: AOAM531pEc3ZQrze2KERuzoI/lFi2SaurhWQmgDNwQ5clUxZyGP48RwR
        lGTj2j+WG6YOj9Ft01U03T5ncUlcoKEzZ+I2LfoMZQ==
X-Google-Smtp-Source: ABdhPJw3s6IiTQazalElWt1zQLZWoj7bqeupLQ/GlHpoXcCWZwMKBEBZz4ZLID/hc55EMLVOcGr2F5uBkONp1NDZN1U=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6640139oiw.64.1646346294538; Thu, 03
 Mar 2022 14:24:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:24:54 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-2-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org> <20220217055529.499829-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:24:53 -0800
Message-ID: <CAE-0n50_o1jHOj6OFVOQA=-aXXMsC35ZTtNDxWQa8CsPuQP+qA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] drm/msm/dpu: simplify clocks handling
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:25)
> DPU driver contains code to parse clock items from device tree into
> special data struct and then enable/disable/set rate for the clocks
> using that data struct. However the DPU driver itself uses only parsing
> and enabling/disabling part (the rate setting is used by DP driver).
>
> Move this implementation to the DP driver (which actually uses rate
> setting) and replace hand-coded enable/disable/get loops in the DPU
> with the respective clk_bulk operations. Put operation is removed
> completely because, it is handled using devres instead.
>
> DP implementation is unchanged for now.
>
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB3 (sdm845) and RB5  (qrb5165)
> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
