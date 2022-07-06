Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 903155695DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 01:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbiGFXbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 19:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbiGFXbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 19:31:07 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35962C644
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 16:31:06 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id t26-20020a9d775a000000b006168f7563daso12876193otl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 16:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=bLBb96h4o+6m7G+7u8bDwIvQ0631/O8eJZaab+T17s0=;
        b=Vd9gt8Urb8w6iPVD/v7g1pifq9NFSRgh2NgsOEiOp86rfRNkozal3BpenJIcvOsru7
         hd/x3zZjpU27fNbXhoBEFjgDh60CtsSYn2xjmDu5QQC5dwSC8XDrgSgUEz872suYRmAm
         rTEei11GOXk7LwwvlTJdb2p04gTABzcIZMz6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=bLBb96h4o+6m7G+7u8bDwIvQ0631/O8eJZaab+T17s0=;
        b=ZrO7KJQkfUXaFJ7RdgoSe3lih2giCTuu8U08fHStBnZIiZpMcy0BGlzrHlwEd2i+l6
         Vx0ZhEnfhzbntv7peKpgERmGuS40K+97SIkXwt5q4jIl4t6YP/69qOpmHyihzRFHkdqk
         79M/J58fvHFTo82o1GokYcSj22u0Jajr4+NhzgBpHRmA6GaAKkH6D7IfdvpwGDJ8oxDj
         CcjafiOjkvNi8vSe9KV87YUMbDtHzirws9ARJoWFkKOSq3ZOLnbNUeddybffMsOnLuW8
         yR0/eDkYqP6hXR8ttE/8hRpSUhiGErU2z/fQ3A8GKHAQVPmxUXVqGlcf6kW6sMn6paeM
         FeuA==
X-Gm-Message-State: AJIora+uIPLrtWWzPAHYxUgMHxqkbvwxXREuP7LPtDEUFBb3+mz9yVIn
        uct7pr93IMDH8fw8l3pzLNiILAwbfxZkAo5l28SONiAAvBA=
X-Google-Smtp-Source: AGRyM1vNuiQwjPxBKLkD9XvgxVOjYM4F2c7Ajdm7Hss8UtcjtIkKw8yz94vtZ+yqZ/p1OH7O2q6wqiiOuLyTQ0m+HQQ=
X-Received: by 2002:a05:6830:d81:b0:616:c424:6f22 with SMTP id
 bv1-20020a0568300d8100b00616c4246f22mr19265666otb.77.1657150265868; Wed, 06
 Jul 2022 16:31:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 19:31:05 -0400
MIME-Version: 1.0
In-Reply-To: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Jul 2022 19:31:05 -0400
Message-ID: <CAE-0n50+-FUxLZZRCGr14csROPK=zqEc=kWfyMK_Qo_q_up3tQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dta: qcom: sc7180: delete vdda-1p2 and vdda-0p9
 from mdss_dp
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        dianders@chromium.org, robdclark@gmail.com, robh+dt@kernel.org,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, quic_mkrishn@quicinc.com,
        quic_kalyant@quicinc.coml, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Subject should have 'dts', not 'dta'.

Quoting Kuogee Hsieh (2022-07-01 08:47:16)
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
