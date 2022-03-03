Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E1D4CC8D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:25:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbiCCW0X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:26:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbiCCW0X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:26:23 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE2D10DA6F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:25:37 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id l25-20020a9d7a99000000b005af173a2875so5869110otn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=W6b+sDlQ6fUC15y02viB9CBBs238nvSYgTbrXnSADxI=;
        b=i2VfhCwlYGuVKKwL2On8iEbyuLJyjQn2RZoPEiUYjw6HvvOnr1qNcHvsCi6NwL3w+Y
         oau/hrdWaWQwCpLO3mcfsYYwxfC4AXGtI8JB3sTnm8lZsoE7z3uI2oXik9/GeHNZW4GQ
         KBU77p6PVW4i8EQ+/ue+Mj1ZHXAesYbfQbVW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=W6b+sDlQ6fUC15y02viB9CBBs238nvSYgTbrXnSADxI=;
        b=mpRr3WnnPNhoyryAXmYIrXmZgu83KHpETfey5N3R+K1OMZSxECaS2DRWcjjk52bgrd
         tVEvM1Am6fQBr3Zy7xmiRoQ1gths4ijFdlc8PqK2odpmp9WTIlhmKUpnWqprZXldkRca
         yUf4wy+euDceON6fCbeXrpXrFWhnTVTEZlsWjTBqq160HgNIITBB2NnWFfoNlgcVg9tZ
         exWVasU0JqH02Rnmoflvn8LUybecko9fAEjnLZtLOssSlRfyzsGaGJHA6J+YCpLkd3Km
         EewQkzuMWV7eLRP3h7fd2R+ejbdGzf492A164YX3gt3YhV+N1H4301MQGSyfyhMALrxO
         IhAA==
X-Gm-Message-State: AOAM532Agy08w2SERB+LUnalFpynL/ycRtJQ3Q3n6kQehSuuISSq/J7J
        wgVfGpdHr7oirfxT+n0I6Y7VfX4UzpEos0CEiPoz8A==
X-Google-Smtp-Source: ABdhPJySDSyjRk7hKcrQxOwP82H8qzkkTjbRnV9lItUMyzxYwnq8G8pll8AB/Htj0HsykplhTrDx4gVGSByQP9iDe0k=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr20039488ota.159.1646346336645; Thu, 03
 Mar 2022 14:25:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:25:36 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org> <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:25:36 -0800
Message-ID: <CAE-0n53Zy3BV3Z0A55Fo2vefndAKayPdUBfQy1i0BFj0cNMnzw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
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

Quoting Dmitry Baryshkov (2022-02-16 21:55:26)
> "ctrl_link" is the clock from DP_CTRL_PM module. The result of setting
> the rate for it would be a call to dev_pm_opp_set_rate(). Instead of
> saving the rate inside struct dss_module_power, call the
> devm_pm_opp_set_rate() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
