Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 735784BC4EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241109AbiBSChQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:37:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239909AbiBSChQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:37:16 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAFC054BEB
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:36:58 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id r41-20020a4a966c000000b0031bf85a4124so5890877ooi.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
        b=Bk7rZo63WFjFUSnO4tKCyrWj6rYnFOp7yPp/BHupJggG8IRXcqYgB8LVXZ8YwNQ97K
         e9KEHfdxp2/cJNO42Ry1qQGnp6/duq13w3fLU8f4Z/54K4iIJGyyYEiCCrjSEXaWnKrl
         uGIqwTLNcA0+cr+eIUof3oq363RdQrMaapM6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=k7MibnFlGnXWaoyuZc5fFX+hxS1DyD57HaegQF8+k5M=;
        b=6HgMuozCKhxuZ0FW6iVIwR0mr4WB/Rkko/f6z+lti90G+uc3zlp7OuvDzSAMrRdKuE
         eHAM3pQdIhJLeetvwFTYTYFCL3evgohk6m/emno5fus4A8PWzHdulKNIbX8Neph3tsq6
         /KQjurUxl2261pR+JXjEi6/lNLOQN41rtASqnomgQKIVOJ+UY0M7B7xZteeI/p75fih6
         tPZ5kep4jaEWS3EG6olhX6bBL7qeAPZV8cbg6dnY8ClUr3TfRMSEA+YZo1jxrYhmnART
         a68v3AV3KvOIcS8n9YxKCHCVUeu7M1WCxiJ403CSY4nmn8I3bOGwvXlARCI3TVbUibT9
         j22Q==
X-Gm-Message-State: AOAM531mVDksJDhhF2dJAqukwls5WpPkiNj14VqJ8vkdF1fk0toQEijF
        9iN/kxcGnuFxTrLSTGPHAnnNcbUlYnrgMAW27j5JZg==
X-Google-Smtp-Source: ABdhPJzqlbIZ9/jzgYSBbZJnFgkexJgnaPi6xmRk2KUZIo43z8DVRDJDT73d9tERc88r8QLDQD6Sgey3RUqQPzCI1OU=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4185776oap.54.1645238218057; Fri, 18
 Feb 2022 18:36:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:36:57 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-4-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com> <1644851994-22732-4-git-send-email-quic_srivasam@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:36:57 -0800
Message-ID: <CAE-0n527fs5rfPG1HonW_9ZTugANnWNYSs_0+wts+zDK=zcZjA@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: qcom: Update macro name to LPI specific
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, perex@perex.cz,
        quic_plai@quicinc.com, robh+dt@kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, tiwai@suse.com
Cc:     Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:50)
> Update NO_SLEW macro to LPI_NO_SLEW macro as this driver lpi specific.

Is this to avoid NO_SLEW somewhere else?

>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
