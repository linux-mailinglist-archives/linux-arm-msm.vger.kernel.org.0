Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45AA84CC7C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbiCCVRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:17:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbiCCVRO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:17:14 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166244E3AA
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:16:28 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id d134-20020a4a528c000000b00319244f4b04so7242317oob.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=b9LkDSalYnfbbApSpe3SAwrawk5gyyAOB8WRwBR0Y/4=;
        b=Om8PjTsgYQBPn8NSNUOMRV/o0qDRvTWv+21nczSZSqtYT1II1THl/sirbaOHq59EoD
         8oC9UczjjJGype9msfKydyEGmLPS5mOFh4O+qYFjBR9vpF1g7fGyMYCuhm9fUw81IhQk
         qEg5U793sxIMvzIHOHNC6MFlKe/7PeiS6VM/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=b9LkDSalYnfbbApSpe3SAwrawk5gyyAOB8WRwBR0Y/4=;
        b=V289vc3cCS/NIUMGuCKeSh5HitcVKvTMZa9cbvpW/xUCV6RlZx3+VbzhkpIVW2Ds/F
         VHC2z1SrYXfpb/xwZ84HAUFFNYsDhCmvEVCQtF4rVA0qy3GfT+bYer/+scDHJxRsYVVd
         ssxGUT8yTrYFJwuvoAoQ4x0sEtISZr2tTlz2Q3Ofhrbd9vvV8D+dTNkalYdUWA8MR2+J
         oL23a3yAEEDOjKYHAQk2C3w4Bt9HOZ576MRYj67Omy6zrbwKWjlWbyfHjIG950wsQxAE
         7SLWj1Jo7OF9Ryc64x6VTuAc3mMRoUxbz1dWFRk9QCuTmMI1I2dk7LGlO6jAOemyHc7M
         kPCA==
X-Gm-Message-State: AOAM532seb8Bh4RcHheM0Uwr36sp1PQULgZ+ZH1FCCSbJ8wew8D0Szil
        qC7szPPmSO4Y1iQRGI4ISl15SgyGkXJtziSXzl7D3Q==
X-Google-Smtp-Source: ABdhPJyA6ybPAMYhh82KSFMBxr72uT1gRalCTbSK02jkxBO6UIRxSOj0S1+FwINbQlxVAgTyYWMW/UCHAaXj/JjSH5U=
X-Received: by 2002:a05:6870:14cf:b0:d9:a9ce:92a9 with SMTP id
 l15-20020a05687014cf00b000d9a9ce92a9mr5606543oab.64.1646342188296; Thu, 03
 Mar 2022 13:16:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:16:27 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-2-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org> <20220222062246.242577-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:16:27 -0800
Message-ID: <CAE-0n52ZvcshSzGDsSrCzBkT95BidDOBpsPwu2x_5sjW9d55Zg@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/dpu: document INTF_EDP/INTF_DP difference
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

Quoting Dmitry Baryshkov (2022-02-21 22:22:43)
> Based on the discussions on the mailing list, document enum
> dpu_intf_type and it's controversial fields: INTF_DP and INTF_EDP.
>
> INTF_EDP is used for older eDP interface found on msm8x74/msm8x84
> INTF_DP is used for both eDP and DP interfaces handled by the msm/dp
> driver. The DPU driver does not make a difference between them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
