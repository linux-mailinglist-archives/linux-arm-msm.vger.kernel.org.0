Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A424DCFFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 22:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiCQVNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 17:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiCQVNL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 17:13:11 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725BDD4CBD
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 14:11:54 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id e4so3895361oif.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=zYhskxegLwNK/LX0CyypPoqsPsPg4Ndg/EH2xEj9EDc=;
        b=aW8tJQrlsx0XXlz61yMOOiWyjJ1MKZCzhxcV2H4Mp8IzQ20W2ETqUGd3k7+Cp+uJDS
         d5qZ3W5EmmC1r5CcvrZ6EDiT8JvXO/KVgLp05KFPGaOe1tXEBAw63Vzlondxpaao9iyg
         3A3SL/JrhceG91mQ2Tm9OB3hEGd+BcVRHJ9lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=zYhskxegLwNK/LX0CyypPoqsPsPg4Ndg/EH2xEj9EDc=;
        b=mn4ntvSmqaiU4+dbpfWRMv+bBRZQHqlsrl6ykuaeR4oYrZ3O/4KzWN7Nqi/8swnsjY
         Fe13KBoTxWOxupjt9PIZt95//gEFLT3h7d45Em3wU35x+PBpOp76G401DeDsvq3oM40K
         49HD4TVuzOrWtzb1Uod/siz9vSlad9Kl1FOBE8KY7xxxa3ZxR7emMVczYQPHMLEPatm/
         yPZXJRgLgpE6uO2TZ1iKHsOICHYFZKnmf0yBR/mvizhGybe49RafuWa/u9b2j9iRta9v
         iEdPqsx6GfIb0rDmFOaYQl5WS+Lqsm0kgb0Dnpn9lYKIzx/kz65EQMQQz5OGJNeSxQXR
         +4iQ==
X-Gm-Message-State: AOAM532pUEilRMt0VqH5qSlc5NwsvkeKb7dNg2RPBI3UhAemWA+kdFTW
        RzP6kuafgJwZBoQG6ziyiVGaFUkZLCIeC6tGAEofwQ==
X-Google-Smtp-Source: ABdhPJzeShV0kMKyS3lJi78u6Ki8Lo3e40whciOYCG9btFUalOyozbw84Dn3KMOY+A18MI91AHrLaDx/GyGmDHOiDTg=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr2819997oie.193.1647551513754; Thu, 17
 Mar 2022 14:11:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:11:53 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com> <1647452154-16361-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 17 Mar 2022 17:11:53 -0400
Message-ID: <CAE-0n523guUYO=qCYcEhw92L4YtpTih_LyXtcJBGWP+EL3pMGg@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] arm64: dts: qcom: sc7280: rename edp_out label to mdss_edp_out
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        quic_kalyant@quicinc.com, quic_abhinavk@quicinc.com,
        dianders@chromium.org, quic_khsieh@quicinc.com, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        thierry.reding@gmail.com, sam@ravnborg.org,
        dmitry.baryshkov@linaro.org, quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2022-03-16 10:35:46)
> Rename the edp_out label in the sc7280 platform to mdss_edp_out
> so that the nodes related to mdss are all grouped together in
> the board specific files.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
