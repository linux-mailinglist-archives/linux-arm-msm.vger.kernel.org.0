Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59E09543E0A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 22:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiFHU4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 16:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbiFHU4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 16:56:53 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5221E2044D7
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 13:56:51 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-e656032735so28823680fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=v7Nak7X+2PmTexgwbA2pTmn1vNdtzIgIfHNl64wkMKY=;
        b=mEzg4mxTna9YIc14kLmTZ96iT6nIeloTFrcrRA9gSf1SA66PLSTZuK0mo/54Moy1KX
         tcQBJ2f4ayMmDWuYEqxChHp/Qbz0mZhjKJhth7KTWDw5iMz/fYXzOWys+JLTZzciGqDy
         p00Km0Ma13AYbY9AgcVdR9H33r37rOt01y91g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=v7Nak7X+2PmTexgwbA2pTmn1vNdtzIgIfHNl64wkMKY=;
        b=H3taNWmWnrWwXTi6jXqYfJ7H4XzhgKF3tbh85Bevtk+PlWN32XoYxG5cGzLEJGwcOG
         H1yMDqHiymumDsw1tdIHCQPOc9D5C7geIAisI8gcduRxoqegoxDgA1vd+hxdnmOGGwC5
         jVX/JiA1xioIo1Cno5yKtOnLXmLqopM0k1Zn4NHK3WB17p6dp8I6uKGDDbuUb0nL87LD
         bJL3g6OW0n13h8fHRwTuU78ItFJYgrSyHajGjXPtr44gVeAG9s48i1I1Y3lYbm/Unzwj
         VOzOnHkbGkq7lrAebHwHWs21YAzkxfPHV4LPXNtpkmEGPxJHoowwcSvM7WrotOy/DT4z
         Nl1A==
X-Gm-Message-State: AOAM530X6S7ZtlCx6Q6Te5srTNmyz1i7ayfZvHFzR4vzKYpQuW5s4tl4
        s0D1D4OKEvDNpWYQKo6y8zh8+o1hlbGanGrxfvMTDQ==
X-Google-Smtp-Source: ABdhPJxabmpsfSGW+bvn77sCFVrRP3NgpCd+ghOBpTDAkTie/k6DjxTP2EftIQ8wF8o2G0mJU2Xaer735XNxODj6Ncw=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3368428oap.193.1654721810576; Wed, 08
 Jun 2022 13:56:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:56:50 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 13:56:50 -0700
Message-ID: <CAE-0n538RnLT0KgLhZVfowmWNAmVmSJ3AaJUOCxgsToL6+VmgA@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] dt-bindings: display/msm: hdmi: mark
 hdmi-mux-supply as deprecated
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:14)
> hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
> power up the external logic. Thus it should not be a part of HDMI
> bindings, but it should be declared at some other device in the DT (like
> HDMI mux, bridge, etc). Mark it as deprecated.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
