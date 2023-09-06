Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A415C7945EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238430AbjIFWFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233043AbjIFWFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:05:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EDB19AF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:04:58 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50078e52537so437272e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037897; x=1694642697; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K/a1TmtmamqPXEdUE0Z+t8otjGm5SU4KAy0PSuw4Hus=;
        b=eEw9s9uYUyW3pvQVwY0uDhQxiU+IwUPT62Eessw/nEH+bKNCkA5kIUAFCjpKvq6hEf
         oJ29bxHGVTnmNgSWDuBR75G2Kxjnz/Z2X45uaxAflGLk8v3VvYQVOYhN1V1W9AHkoFbV
         nN8O1uOUB8Wwgte6fkd7eAn/L1F06QLkpBgnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037897; x=1694642697;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/a1TmtmamqPXEdUE0Z+t8otjGm5SU4KAy0PSuw4Hus=;
        b=D5nairuAQN3JW+KyjhQmAKv2pNnnu4J6hYVN9n461HutDOZfQcAvdSE5Fj8e2MS046
         dlJowkEsi+p8kiNr3A6SbH0Fke4dvHtdsaRnHmka0GzGeoKiE39oP/sWRC1IqsIHA+0i
         Bx6n3Nya7VogzRJyFHl0CfAaQHBhGblF1mvBMLRdKzFCpnvm40OY2zJgucMmrSRu3/WC
         8f0/1HDj7zXisbzXv7dN6JD2xQSUUXfKAheganuVG3CYyiUpDzUbBFzQcqpv6rwysx1V
         /wS35c44/g2/17yzJ3EQPPiJNHD3Dd9X+87wcR9LSpb91jCr537rTHaRL67jjQh1Iz3W
         chNQ==
X-Gm-Message-State: AOJu0YyhdJc7nVOE5cIdNwTHItVMgX2xjar8KH3TgcWJBGkV9pvwad38
        kxsLOCuXYMZ5KUSNg+tQldpH9g9IIn59hNGDpcOIhQ==
X-Google-Smtp-Source: AGHT+IHaZD0sJC8YRqHnLX/pEEe+4RFI3T0inoGPucjNFb+Bar11rJv2jpxoWR4VYrsfsmzf1TRv2xDZPFbvAJKg4+0=
X-Received: by 2002:a19:4342:0:b0:500:79a9:d714 with SMTP id
 m2-20020a194342000000b0050079a9d714mr2776490lfj.65.1694037896915; Wed, 06 Sep
 2023 15:04:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:04:56 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-7-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:04:56 -0500
Message-ID: <CAE-0n53JeHYLNneAzdDfUU7c05F8ZZw69F-Gq5wVeWZ96_UExg@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
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

Quoting Dmitry Baryshkov (2023-09-03 19:04:52)
> Replace the only user of the DPU_INTF_TE feature flag with the direct
> DPU version comparison.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
