Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09B4D22A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiCHUde (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:33:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbiCHUdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:33:33 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC37B865
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:32:34 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id j7-20020a4ad6c7000000b0031c690e4123so360425oot.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=y/JhkM56M2JPgnyR2Hqr1XU3GKAwilTDhiga8fqeuZ8=;
        b=CrXtvpEpPpVaSH37tOfQlBtmBWQklnqSlBW4Ya0lTsDrQFGosjDM1+l84MYiAly3IU
         KHFdEtMs3Qg2BCmq3wQTq2ANFguFhg8zWWzTqvJeiEEyP6+WDV2eMU/W+tt2/rJQeDEB
         2iVQslEqIfGDl0ImpEL0TG2dScVffAexa9rQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=y/JhkM56M2JPgnyR2Hqr1XU3GKAwilTDhiga8fqeuZ8=;
        b=LRyrWXNIXusxCB/52E4IcII/999K9dJ5sh4wk03boieK/D/i/JsuDfzhMoNlIZ/iQq
         D0VvvxG4HfY+fBpIRqv8Rl4avnGAfELSk3B3deXs+H7TWALVvnnrQY+I75b9uz9orze7
         bQouGuy5Z6HC9Q6O5C6HqOhDcceaZ2hzkPLD8+Sj9EN8GbvuJi9TvgtRNORbQqy/iIAd
         23EPMVjw2x9/sQWEyt/PzR7ntO5QUXCJxBMfFQ0Ma9ilidLFthTuIKtunai1AU0oKNHq
         YUpbV909HRhWX4d24++PkQh6RcxZz9PxWLPFc8args/4wT1k6kUNgstyrn45e21PsP16
         FUCw==
X-Gm-Message-State: AOAM53203qlbsIcOfpsiZL2d/1LLZmi5EKizgEs9rtVO2kKWXlBIhkbu
        S+tXGdtstZOPaecBUTs6R0vNixK71j2XE5lTGad/mA==
X-Google-Smtp-Source: ABdhPJws5Lz0RSigzpFKPC4FJpUn+q62XZROHFGhRSq8AcCtEQPllOLq4N6c7U65crAuKCx4V2yAkcG5+T7kt3SHVBw=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr7717471oon.25.1646771553985; Tue, 08
 Mar 2022 12:32:33 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:32:33 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-5-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org> <20220304032106.2866043-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:32:33 -0800
Message-ID: <CAE-0n5179gihcXQDxMVgLXK5n-UApDeU6Oe6zttdPrG1zY6CPA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm: stop using device's match data pointer
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 19:21:05)
> Let's make the match's data pointer a (sub-)driver's private data. The
> only user currently is the msm_drm_init() function, using this data to
> select kms_init callback. Pass this callback through the driver's
> private data instead.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
