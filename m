Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229237D89FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 23:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjJZVDl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 17:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJZVDk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 17:03:40 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672CD1AB
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:03:38 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a87ac9d245so10707357b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698354217; x=1698959017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs0BNJRXsqWeQVO5EP1NdVB6zhate3LzWauL+0ezX08=;
        b=OlC1Tdyv5x6BJ/P7gaeCz6dS7xlWRud3R3It/2KiW31Bqrdn693xVfVduRYfGm/Vlc
         pa9PvZ5M00X61ErYVrKfFwh104YmSMvP8If3YvEnkZ0drIN4JWy6HtpmttqejFAW++so
         xuOAIXfJmV9+S/64ZNEy2GJOu7QwhvvGdK74oIcUNgCe0RAnVy7R2nR9BXGRLiiC6td9
         ZtK9QiTqUokFl/3ubqs4jeo7YTsgAjRqOnO3s4xYO+lb82eCXUiR5tvVSUqC4XbRqk4W
         A6zPxZpd7WMbAqsD8yqk3Oo6l+TBx8BDhCmj0FY1hoHDoZNqOriQvZ1raCD+grXWI4Jg
         zXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698354217; x=1698959017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs0BNJRXsqWeQVO5EP1NdVB6zhate3LzWauL+0ezX08=;
        b=tFjamgi74J3aSHxwpgBBGvARECzwwimeCF/R4dUgDCvrmE7SqxCULQ6Zxt5grGuR3K
         t3gqlbEs4szknOgbE1CEd7GB5DLV8W9rVYqmDlt84h6nDFTt8KivrR+pmy7DFgyyZnUr
         eB3ieB1pROyCi0eaMDSEMJ9ZIOgHTJbLtl0BUYrwr6gx4690s9FZWuylNIN0gzT2ypyM
         y4vaZTfvziogNKUI4aGDF1rEnxt3isu5H0IDztAdFtyj3iD2MAWDICybTI/LcnuIDSaw
         S2KMCwFWL1tn7w76MALTY6f+LjO52zrXGHYYdE/EuSvjhDQCBC4NdClZu2okAep1JOVw
         Na4w==
X-Gm-Message-State: AOJu0YyWiHgntwDCHXBrgR1kh8BK0QS9415iYdHbb8Pj+qbIXq1cLdek
        OWXDtrpkKo8w67kYS8gNkVoYijqIyXK51w/fYNAAjrZHGWHoaMD/
X-Google-Smtp-Source: AGHT+IGIsaJR47ax6gzi+WxPKaKzmFJWDCzTOh00EWTxuEonpZFhqFrNTeIAYKVTU0ES42JDfdCmgRnw1PCX7ZDNeZ8=
X-Received: by 2002:a81:d209:0:b0:5ad:47ba:fa43 with SMTP id
 x9-20020a81d209000000b005ad47bafa43mr666424ywi.35.1698354217574; Thu, 26 Oct
 2023 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-16-dmitry.baryshkov@linaro.org> <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
In-Reply-To: <b779b911-dff3-420c-9bf9-5b7bef24337c@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 27 Oct 2023 00:03:26 +0300
Message-ID: <CAA8EJppFi6jJ=PKCdwBqM8hXdgp41XTY=QZkdiHkPPJ9KdTfTA@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] drm/msm/hdmi: drop old HDMI PHY code
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 27 Oct 2023 at 00:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 9/28/23 13:16, Dmitry Baryshkov wrote:
> > Drop source files used by old HDMI PHY and HDMI PLL drivers.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy.c      | 216 -------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c |  51 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 765 -----------------------
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 141 -----
> >   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c |  44 --
> >   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 458 --------------
> >   6 files changed, 1675 deletions(-)
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
> >   delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
> Uh-oh, is the 8996 HDMI phy accounted for somwhere else?

Yes, it is the QMP PHY now.


-- 
With best wishes
Dmitry
