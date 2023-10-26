Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B34127D89CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Oct 2023 22:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjJZUqt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Oct 2023 16:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbjJZUqs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Oct 2023 16:46:48 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7B61AB
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:46:46 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ce2fc858feso875515a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Oct 2023 13:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698353205; x=1698958005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/G02VsxhYJWjx+P8kMFTWWV+s1yYYgHb9RgEPb8krc=;
        b=BdIfO7vxM0aySqu4uCj/FEkbITDB/UOmui6tVug/wlhfmC0e5gLXhynWO9gwKkYsP2
         CSZskACeAOGqT34ABPLONkDunbPZkepMfSPERrY3meAF2fJ54KeynN4PkDH0K998xo8l
         QeVEbmEgIBxodmLc2MlHPGshCtpDU9agmizTAn8kVEIS3ZAtrNNLPPz/3DMs2cqPUrkA
         PU/qjnoeXtx52NN8nvLui2ZRDPv6dUOXNIK90I4CxBg+v+IGjSXLsq2IAimfCTi7cApE
         x9AjozHzi8CxB8+3bR0ccXp00FV5DIJjueRDQtMMHXDEkUuKAUs/F1JV/Iil6ohQLibK
         Tx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698353205; x=1698958005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/G02VsxhYJWjx+P8kMFTWWV+s1yYYgHb9RgEPb8krc=;
        b=Y5cOJgI441SKFYjOmvRH+Kf1mwzSpirmbrv4+ACoWjirNIdPKZPQGjjdLNtt/gF7gq
         FoxwhPxLIoJvnP5arkXUnCa803Wt5jIYog2Ovd0JJRXsLrUEaS0sUzivA42nODc0LFJq
         X/WwbbZm5lisIIf6HuRWTpUnG/AylAYHpwvbNvCXvZ17qQ2CQ/THSh0QoJMfqC18y90x
         PctYvHZ4Dlbqe2OBYk+pcJHLz5gypmkHHkF29ZHTuugaz0nRBq5FkJ9D2kVRoNy/4Cff
         J0w0pFv0RjOaN1W1t6Vf4R77XTeIKUaA8lQz3ZYt3TTJ8idYgf88nkPUCSBgONgGfLwj
         5MlQ==
X-Gm-Message-State: AOJu0Yy/pmAJZWSOVmFjBl57y9Cdyh+haUIIyVZ3h3j/Vko+8XXPg6ah
        fUKEvEeEsnljYzId4gqO4nB9FcV8ICnPKXX8Ug3FZg==
X-Google-Smtp-Source: AGHT+IFVa6fJL5TjjQrb46JjIVUSocFW+PYDsLYQl5v/O4exSYbtWF5+eYNBjXmSZw79pzDpYDJn2OV8FuRMoqSfUoo=
X-Received: by 2002:a9d:66ce:0:b0:6c5:233:fc28 with SMTP id
 t14-20020a9d66ce000000b006c50233fc28mr664232otm.33.1698353205417; Thu, 26 Oct
 2023 13:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
 <20230928111630.1217419-14-dmitry.baryshkov@linaro.org> <36d6379b-66e6-4781-b08d-ef90f6e47828@linaro.org>
In-Reply-To: <36d6379b-66e6-4781-b08d-ef90f6e47828@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 26 Oct 2023 23:46:34 +0300
Message-ID: <CAA8EJppa8-M8Uah+=GBhG4bHvdGUwqgh0aj8o9rLfEdZq=JUKA@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] drm/msm/hdmi: pair msm_hdmi_phy_powerup with msm_hdmi_phy_powerdown
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

On Thu, 26 Oct 2023 at 22:54, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 9/28/23 13:16, Dmitry Baryshkov wrote:
> > In preparation to converting MSM HDMI driver to use PHY framework, which
> > requires phy_power_on() calls to be paired with phy_power_off(), add a
> > conditional call to msm_hdmi_phy_powerdown() before the call to
> > msm_hdmi_phy_powerup().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> Is this a conversion artifact that will be undone, or does the
> framework actually expect that refcounting may not be enough and
> phy resetting will have to take place?

I don't remember why I did it this way. Let me check, most likely this
patch can be completely dropped as the enable / disable operations are
paired by the DRM core.

-- 
With best wishes
Dmitry
