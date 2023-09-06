Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 946A37945EC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjIFWEk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjIFWEk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:04:40 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A4C172E
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:04:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50291d987a2so267379e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037874; x=1694642674; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4j0fXDx0veW0oHGlyRxz1wFWfTQnf1+IJzl7yxdqZI=;
        b=HlUuX6k/wi3JpiyLdy5veHr717sHE0exAvqPmVsKmkQd39zDc4HjRkiktaTgRR02Vv
         kpkR8R8IV8DJrrAVMKosqILJLZurbvQuPvMpVB9v+j4kJMFuHkFMHT+9iXYMpGZP6dd6
         4ki4omeBveHcwP7WKLG4EbpA11iGVW/KJ80hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037874; x=1694642674;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4j0fXDx0veW0oHGlyRxz1wFWfTQnf1+IJzl7yxdqZI=;
        b=DJccLEPqDtsa0sFygM6dJ3i4aWY3Z66FH724BIwTVaY51CAWQv7YqyCDpTzK8wkorL
         IlMBzowAVFzdjjN43vunCIN5LZ4IijtGTzrdFlyuUl/FmWYAjl6dRYA3sve8xVcZY1I7
         oLtXqD0J2GRbTIapQsuYfqehd3KtbfVNPStUYR9BlMZOJmfv9ysKWSxHeP4hAK7aNch7
         0J9SnbgIS5/FSmeVP+ioRQ4x66m4fQmZXrXfQ3eBwU4kpNStxNSjfRHcIUdWhRWZh5SJ
         n4omHHcwSNaKusvLIsv6Z4+VPbgwl2ZuoqzjAdq9uDn2bFWIAFR8lG5av1Dnt2/AS8Ty
         Vvgw==
X-Gm-Message-State: AOJu0YxT0yWIx83KadsVRp/n+UexkaIVvE1R1qNAATWNP6oLDCXj3hzW
        GLzF3OYk7X4R4AKeM/5mNEzUr+ZpFZDhR64RHzQ04w==
X-Google-Smtp-Source: AGHT+IHogaYquQ/PSAv/DYcZmNikDOVlv8huAQHfNnOBb8UD02P+ah517cBedi3ixoKQSI3JIRzAa2e4TiStFXwOIxA=
X-Received: by 2002:ac2:5f8b:0:b0:500:ac10:1641 with SMTP id
 r11-20020ac25f8b000000b00500ac101641mr2914398lfe.46.1694037873986; Wed, 06
 Sep 2023 15:04:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:33 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:04:33 -0500
Message-ID: <CAE-0n51WNOZashWbEYQ0hUu1SnrS2m1-Y2Aq1S0mfkzm2p8uig@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 19:04:53)
> The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
> nor hw_pp data, so we can drop the corresponding check.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
