Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8023C543E2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 23:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234698AbiFHVE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 17:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234683AbiFHVEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 17:04:49 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F77226CC2
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 14:04:48 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-fe32122311so123001fac.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 14:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=76kDmXTl6n20l0N3wMIAHBopXj92kDXl0aNreW0xlog=;
        b=ACuv6dIrKUhatTPgkh9ihw4JDfAtZuexalyvUFBehcn/g+w/cHWDoutvKBlHUMd2kw
         peSHMKjHkNUiammMRf68xcZ2JmCc/DhEmaL6TiakXagb0GPM5zat5pp83dPEot/afrw1
         N2gj2q2+Wy8zKbhtuhcf7H9z2iAhobZcKb7GM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=76kDmXTl6n20l0N3wMIAHBopXj92kDXl0aNreW0xlog=;
        b=3KV+zTy0WCcye+gACGFqc+wBlmlyQOwtyvLdDBbcSLOQEcoz6ndlY0TbV82bpg62P+
         aGmnvIGDTBDimgdoPiix/EwPV+rD1fu3bv11zhXxgwQBXGproJ+9+Q3ZmDB9QZNf9nqV
         KxslktQdIhfZAMOoMcR23+3Q9/wXbJl3h/NTLWkm4A8I/buD7HQKmp5yOZALYVr7pvvX
         Nr6l4HoK+jys/gZNbjKjy5m/cWikyu0oU/++AZ7eRzyNFLeLsR0lVotmiPjaGQ/MyW2D
         E6l1kkuiUVzVidG9axvDi4mvw9lcAP539SpCgjdViLMQXmZUIlrjCn7qtiqsluzIWKyF
         3ssA==
X-Gm-Message-State: AOAM533Hs/Guf56aBfH0KZEJrqcOvQ5RXOTk2QtSIevu4urXus8pGf+K
        TsQy7F+RtXnoqZf5WoZCjqPZLfIIH3mSu99SO9xSSQ==
X-Google-Smtp-Source: ABdhPJx5QgouVrnNVjSRQ5Ti8tygKWrwahuC3IBuZEnkG6Id6JLff5As9nN3YO6dFQR/ervQ0uOSDKBZDydn+sTQqj8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3386036oap.193.1654722287412; Wed, 08
 Jun 2022 14:04:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:04:46 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-12-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 14:04:46 -0700
Message-ID: <CAE-0n536e0+huMmmiBaXMZ4v_GiOYfrEh6Zp1b5piLpv4WMogw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] drm/msm/hdmi: reuse MSM8960's config for MSM8660
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:22)
> MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
> MSM8960's config for the MSM8660 (8x60).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
