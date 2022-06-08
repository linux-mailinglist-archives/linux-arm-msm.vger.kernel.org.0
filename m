Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428C4543E17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 23:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbiFHVCr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 17:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232431AbiFHVCn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 17:02:43 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C3C1DFC55
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 14:02:38 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id e67-20020a9d01c9000000b0060c221b1420so471909ote.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=2CGBmWLR2xIwoDoHoMFGRINdSlBNsIoLd8gsi73vQfg=;
        b=VzQ3zIc3G7mt2Ifg7TTSBMylzEr3xESyWpuSJuEeASkLmI2ziP3vZFx6MUyazXRZWf
         IbR0GT4Kx5+vK9gjLbXyiiup3rC2TitC1VuNWcsyzGo/pBvAyBo5kV9FYf/lGZxgor+X
         h5o+08/jecsCbonvsupxcV3+NOtXTcDlWkl4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=2CGBmWLR2xIwoDoHoMFGRINdSlBNsIoLd8gsi73vQfg=;
        b=tXuf4NrAHW61aMBHGEaq7m6/pWd+ICVbrDPtnjELanXyuM5PBeO7JNFdByGKnXW3IK
         aM2iWTzae3Id02vX0OIs10c7nK10cNFd3izaUtHzmejVpWMC8tEk2idw1qmbn8fHZgrH
         YC7kYdp3pViL69u+pTvOywZ79udJGCsnKWtG7xSX45GYzf0mZ0eitVvhWbL62YTPQFW7
         xLWKQcEC6OYFIRmE9cW62U7VkJV8jVHBRcB7rAiUDPH60BW8gi5+Rmx9zsT0JLCJSOrm
         BRzfOYN61+XQMhnR75lDKGhoJT1YHbSDtwVWK0PuKM1dg87UXZzbtJ8WkicIuhwV/va2
         n5rA==
X-Gm-Message-State: AOAM533bqIit5LEFIDlbMNS7LJUPngVQehjD1eQUDQyMlN1CsY3okIGd
        q33mROtqJi8V/Z2xzKpdDpd/RImldBjc+y7lB8E/kQ==
X-Google-Smtp-Source: ABdhPJxyMYGo6n+3U+XbOkgU/x6UlYrqKAW6EHI9VoY0z/klK3N5HwW21ZWy5t1rGHjjVuGeU6XWfVcApWoGdSEAFVI=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr599352otj.77.1654722158067; Wed, 08 Jun
 2022 14:02:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 14:02:37 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org> <20220608120723.2987843-8-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 8 Jun 2022 14:02:37 -0700
Message-ID: <CAE-0n517WyGbmN86=q5Qx06ektgKFNdY1N5fgkH7ZM6AhGJ+9A@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] drm/msm/hdmi: enable core-vcc/core-vdda-supply
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
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-06-08 05:07:18)
> DB820c makes use of core-vcc-supply and core-vdda-supply, however the
> driver code doesn't support these regulators. Enable them for HDMI on
> 8996 platform.

The 'vdda-supply' name makes me think this is another scenario where the
phy isn't powering on the analog supply when it should be and so the
controller driver is doing it instead. Is that the case here?

>
> Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
