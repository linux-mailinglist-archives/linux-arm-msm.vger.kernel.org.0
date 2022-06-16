Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B48D54DC17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 09:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbiFPHop (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 03:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiFPHop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 03:44:45 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC425D18A
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:44:44 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-f2a4c51c45so952711fac.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=7kECHAE+GXQYNLXmd8ZAfx5ZSTEycGpfhYD0voXiTLY=;
        b=ZlB6csKF4ISyBxvF3WZVmH3ccTYq8q4zos7p5zIrY45z3g2k0cOgnf+AM0UMcW2kOY
         eOvxJHlLzUFnUYOpkDTI0IyCG6rv7wCgMPUeERoOUGhv0WeyUHCmnKDVV7QvSp84BFbu
         k+cLWnWHOoAaGRUXFo+K3yI/RQyjA3047e6m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=7kECHAE+GXQYNLXmd8ZAfx5ZSTEycGpfhYD0voXiTLY=;
        b=TsKKgosoj05+DeJC46DtLwLCHPy8dV2j8iIg56wOhSGzd7vuwEQXI3S+u1rjlIrelZ
         dLQ+DPGtfo3ScvsR9bDT0OSvujMxwGChAV1uinfyKSCHWXkoBJO2YQAHu7BcQUCo1QvD
         XS1AUUyWYVd8tg3Prbu7NoSoNsfdpYat+EFCEj/mmYae/ldhup6k/KJ9QBkaXMUDLZok
         r+GJZ4tQDW11cqSsC1JG4yMRriaJ/M4BqTStb0B11QDxoXq1tdk778ad7uAm/DcRQ178
         Etc8QWFJj/DaVypo6W2sTm8IcXLuAQCOVyK3n5Dm1xVW5+nxcCG4V/auoJuZiUcyAzGQ
         S1qw==
X-Gm-Message-State: AJIora9tcc5PvCywgOd+p0aANRyj8wT/aXUbq/OLuv9OmH0mkxciASxG
        d/ZoS+QwmXp5+wqDXccFAYnCWJ7kcUmsbpi+54RRmg==
X-Google-Smtp-Source: AGRyM1vropgb4ykS9bw8dwWFYy2i5x4/eBW5pZbUUEFI8RXotaQSBW4hF9nijvQLZFy5GYwRMk2MzJTUIy2iyjfCkaQ=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1973274oap.63.1655365483669; Thu, 16 Jun
 2022 00:44:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 00:44:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org> <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 16 Jun 2022 00:44:43 -0700
Message-ID: <CAE-0n53dmgHDzEzKnRAX+1e-G5zYmvhSD9F0CaDMYzZyedU-ow@mail.gmail.com>
Subject: Re: [PATCH v3 07/14] drm/msm/hdmi: enable core-vcc/core-vdda-supply
 for 8996 platform
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
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-09 05:23:43)
> DB820c makes use of core-vcc-supply and core-vdda-supply, however the
> driver code doesn't support these regulators. Enable them for HDMI on
> 8996 platform.
>
> Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
