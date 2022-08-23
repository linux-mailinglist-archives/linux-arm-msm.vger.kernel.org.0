Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F48E59CEDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Aug 2022 04:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239412AbiHWC5o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 22:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbiHWC5n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 22:57:43 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68A65C37D
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:57:42 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-11cb3c811d9so13618904fac.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc;
        bh=k9bh85zEwdXnkIg7OqvJbsldra6EITvqvq3BXqIAXKk=;
        b=Aea2giar/rgR4x1lgytCyCxTVv8f9PDlrDOAdnxyS0IGj61DMS3sV8sanZX2svonJj
         K1oEkGtUtKsI4/pbZQL2I4p8KcwnDbfE6/n5SEAearxyLxGcevAnEyB3PcJ+ER5gf+VU
         uFKzLOQ9Ds264e37UhQhFWu8pF5utN6r2MUAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=k9bh85zEwdXnkIg7OqvJbsldra6EITvqvq3BXqIAXKk=;
        b=E/yholrPRbACMHoAQsLwHicCI536e+Eo6LD58kKpmnrXiLuvC543jd9UdFl35eSgvp
         VBVaJ0wZiPN7XnkafmRJX+Vyqlyon/kxlyVhjWIt9cGUhMj+1TrZ7Jd6lohmyi08kZNp
         zgQSiCaGwOGdKoxm0loU2ker+jYdVoBaMh/Ey7pj6JvV+WPPpcmhA8RoqFs0/+iC8sTY
         WqK+O0Fv8qAZOm5t05thLgXwukvSvoAV2AWZY7k+YUZp7aqvsDslo6awfwOdEikMNBuW
         m1h06z4YLy0h3c91IL73daKXT/vZx7qleokFqddYaZgGiQRQ+zGU3Dnw9tzBoXY5l9vK
         bLKQ==
X-Gm-Message-State: ACgBeo20eaYZ6X+LnO5LqouPL7zQwMVxkBCEeqX0LSk9ysDCNKPMBQ9A
        4Lq/rJFZfhQMDCPGXN9ttGmjYRTMxkfwVQzkpc3tJsDR7cA=
X-Google-Smtp-Source: AA6agR5r49UulfMOnXRzzL5cO1NYpo0SpanybCWC1I8v58Dp0GMjmdbnk5reWM17/kcgTAgkupqBW/lMsNT2CUZwOtQ=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr547267oab.0.1661223461927; Mon, 22 Aug
 2022 19:57:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:57:41 -0500
MIME-Version: 1.0
In-Reply-To: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
References: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 22 Aug 2022 21:57:41 -0500
Message-ID: <CAE-0n53wZLe73-f+zt2kPNWHNp+zGHx127e=gH=Vi+et4aAmEg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: drop unused variable from dpu_kms_mdp_snapshot()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-08-22 10:22:04)
> Follow up the merge of address fields and drop the variable that became
> unused after the commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with
> blk_off in struct dpu_hw_blk_reg_map").
>
> Fixes: 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
