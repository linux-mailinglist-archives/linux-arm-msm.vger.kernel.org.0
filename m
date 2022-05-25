Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1FCE533441
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 02:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242692AbiEYAVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 May 2022 20:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242942AbiEYAVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 May 2022 20:21:10 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CFAD64
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:21:08 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id d22so1372778edj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=po9Z+ZnC7Ru+UUqihsKbLp4miOkDQWGaTskPH6Fy5Dg=;
        b=DogEVOs1h9Ij4NbEnwQCFgHrnO+6c/aG33k1MdmT+QsVZDGJ5A1Xid8Y6NhT55/YZB
         wcIwCwdH49o+G8LNtX6oQ89Hi/v8+WA2AYdKpNkXEYzqSv3TpfNn42nSqr/xaiyJvA1P
         K9imYTOTjx9raNfGaw0DwbkGCwB+CKBzlOR6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=po9Z+ZnC7Ru+UUqihsKbLp4miOkDQWGaTskPH6Fy5Dg=;
        b=T1f+irGGuUT+DLfLy5qUI6ylaBYGAnvek3xkafOIo86rWR5o7pO8iaQyyYyvst3bPQ
         4loK5z7nnPkMfT0Yfij8wEqTaM2sdYmhN+xZ/su0sbg5MOWHAtyO3mfZeWejrUOkvD8e
         lOkDjhRKixdjefsqFvGQCN1OhZ7F0gl882fLQEaGSliS+oG+1d0rvV++CV38Ru6FMOju
         a2TcFZgL1tW1SlmXD56VFfSui6jbbmYOOFlDJvWVqRaqvxXYIsO2GPotY080VYYERyxa
         WtdVxHEthNIJaM2t404csI/SEUlQxp8fkZJPGoWkvVn7pdv4/tX6KFS/ub2/TcZ4CblK
         9QMg==
X-Gm-Message-State: AOAM53289/+F4CfNEBhYnRJhoVyCNvkRJ9MpOw4oodafRO7yFwkcElNs
        k3xFbFwWlNuC+AylBw7VOzd/FGTjsVHg+QD1mhk=
X-Google-Smtp-Source: ABdhPJyAsdKAqW5COlcJ99iADerpVh447Dn5IOCzBQpWLoKFv2CPWA/1ZI3WokSIDXGYuu9dOdUv8w==
X-Received: by 2002:a05:6402:1d48:b0:42b:6e02:5ece with SMTP id dz8-20020a0564021d4800b0042b6e025ecemr12050772edb.178.1653438066359;
        Tue, 24 May 2022 17:21:06 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id q14-20020a50c34e000000b0042ba8658d1csm742809edb.73.2022.05.24.17.21.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 May 2022 17:21:04 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id t6so27912128wra.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 May 2022 17:21:03 -0700 (PDT)
X-Received: by 2002:a5d:5009:0:b0:20d:846:f4da with SMTP id
 e9-20020a5d5009000000b0020d0846f4damr25355018wrt.301.1653438063415; Tue, 24
 May 2022 17:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <1653082028-10211-1-git-send-email-quic_khsieh@quicinc.com> <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653082028-10211-2-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 May 2022 17:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VRNAC3=VAZcw5H1jReGzdbTCbD83OqRcYztrzhPD3PAg@mail.gmail.com>
Message-ID: <CAD=FV=VRNAC3=VAZcw5H1jReGzdbTCbD83OqRcYztrzhPD3PAg@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] phy: qcom-edp: add regulator_set_load to edp phy
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, May 20, 2022 at 2:28 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
