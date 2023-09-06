Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF044794577
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 23:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244892AbjIFVy5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 17:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbjIFVy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 17:54:57 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069D0E7C
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 14:54:54 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-500b66f8b27so422566e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 14:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694037292; x=1694642092; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkYl7VpiqGBLcvquobAdpQle0l6YAv8HW9CuQ0g8z3E=;
        b=L6kVHzTn+sIEetgScPg1qK7XieN6qX/Nrrc4PolEGk4oglA6Z3PLwdgFgY/UW8LSiK
         +rYzBAyrjvFWSkJelWm2Lx1Wsx/76cY2YxwE9YX2uPMxyK9Mi+KJH//m8izlFKbi2v4E
         f182z4SwX8o7Zu0Z7UIyQA5jvwexeF3jG47gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694037292; x=1694642092;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkYl7VpiqGBLcvquobAdpQle0l6YAv8HW9CuQ0g8z3E=;
        b=RCO/bkK5zqBb27H/pehOK/BYKuZSbWFko682thkme0ZTuBryRDuecmJz53Ydp4riL0
         o81IefxfOfc+oFUaoerWikirDtyQHmsM62Gk8+AO4qxT/dPVzSOaHKO3SBzN2tQ3ybaj
         62hKVP+A+mV7jENboC3Cyck7bkyFqJrJ6aWHwkdfLw7JpcgctIj3sQnVAtr25oodTvjF
         yCiHzQkIwB/L0zV9w9SqeFUrvvi1yggK+qA9OGm0ys/QJzs9JwA27CU8YQRXtp0i8Dnj
         3MKma6CYbzKouGes5ci/sPV2d69bCXJHGiZfoj3f/WyKnJy8eSOzFZr1nbHyMqhv/hhj
         xtMw==
X-Gm-Message-State: AOJu0Yzfnzg8oGL7fSRLx7ZVaL6yBH8KTyko5M9vnZt8XCetCD0PiVoQ
        Z2LdsZ1rymIZdQG3VP2kL8ldK0JKNwyGJ0DxlINowQ==
X-Google-Smtp-Source: AGHT+IFaSO4E/UjLX8wEpGO6s8aIiIGvV3rajeXxbn36XQd+d1XBBlsCEK0E9MFFtjh00AsmBN5wr+6S5yv+y1DrN4U=
X-Received: by 2002:a19:5e17:0:b0:500:d4d9:25b5 with SMTP id
 s23-20020a195e17000000b00500d4d925b5mr3321799lfb.56.1694037292435; Wed, 06
 Sep 2023 14:54:52 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:54:52 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 16:54:52 -0500
Message-ID: <CAE-0n51Wrh8J2eH3uEnOW2e78TW=BGpS+UGtEdfjOqnHjXGjHg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
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

Quoting Dmitry Baryshkov (2023-09-03 19:04:49)
> The DPU_PINGPONG_TE flag became unused, we can drop it now.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
