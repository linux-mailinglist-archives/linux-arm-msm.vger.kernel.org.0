Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935BB6CCD59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbjC1WiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjC1WiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:11 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958BC2D48
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id by8so14148723ljb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtFbj44YPSQR/4fSgUx5IndQxVE/oG1HTaVeharokM4=;
        b=D0zPtyHkNeoJ9RqKP32Oa+YqC5WmMueAOAc4YAhJOMoxzbWyFjeNQmAlnlTMNYOaM+
         QWmtYwYrj6NIkNHIQT0FojJo7bjonvqDOYUujM+67t9y0QwXhsWISlY3BVLiXgTBzvUC
         v9G4fqliEJurzIFqkQJLmN8jA03v5QvW8+Y7CjOUWFZ7weQPTlWpYRoShXQ42r/q2mNq
         InLjLLAvUs36JR/CKbwLSL4vPp+R0TJVKTtuvcWYOcHGBk1EO8YlG6gAZIwlyLVJhs3k
         rMlBy4Wj8Tv8cOuGiWgZLl+6HLtn7zOREh6JV2a6Mu38+ELZsSnGiGK81mNxOlK6DW8C
         D/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtFbj44YPSQR/4fSgUx5IndQxVE/oG1HTaVeharokM4=;
        b=IDeMeflIKpiUCOC6tJP86TuO4QNjiKGMztI+dahBAIcKCV7n0gO5/793Bx3O20qyHv
         nDIzvSs2L8ZuUWKQ6VXtb2/RzjMmrTACJz8J7opSRjGpARyPH0bCjl+e1Q7TFzKYIc89
         RICXLWVeEGXhprzQCbTWV1OWutodO53sW7glya1CHnDw3H3Xp8WypoC8m1ingjmDQ9CO
         mrFV60bxUL/T6vS0ZyVKX91KIa0aGRCtm852drEDtkv9Fc37g3V02mQCl16Hc4q9sEeU
         vzmdWHmUxygPIZpvXXIDqw7xgRf7Ai1DTxaT778b6MGPx4/KTUFGa8wlF1sN4CWTJQhx
         pe5Q==
X-Gm-Message-State: AAQBX9fc3kR3S3I2FfICRLWx+Am4FzvL+AzOeBnWhASFR8udfxqux1DU
        ztJonOZvagjUBFw0sseO20FSMA==
X-Google-Smtp-Source: AKy350ZR+mT4CfQ2Ri1gunD53Flr5HdyR228sB0xZCr0s2ILhY5VdzrYf4HYOKAfKXHACX/9j1SYRg==
X-Received: by 2002:a2e:82d7:0:b0:298:9e64:c916 with SMTP id n23-20020a2e82d7000000b002989e64c916mr4837634ljh.17.1680043083914;
        Tue, 28 Mar 2023 15:38:03 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/dp: Clean up handling of DP AUX interrupts
Date:   Wed, 29 Mar 2023 01:37:47 +0300
Message-Id: <168004255468.1060915.8365675966800695901.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
References: <20230126170745.v2.1.I90ffed3ddd21e818ae534f820cb4d6d8638859ab@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 26 Jan 2023 17:09:12 -0800, Douglas Anderson wrote:
> The DP AUX interrupt handling was a bit of a mess.
> * There were two functions (one for "native" transfers and one for
>   "i2c" transfers) that were quite similar. It was hard to say how
>   many of the differences between the two functions were on purpose
>   and how many of them were just an accident of how they were coded.
> * Each function sometimes used "else if" to test for error bits and
>   sometimes didn't and again it was hard to say if this was on purpose
>   or just an accident.
> * The two functions wouldn't notice whether "unknown" bits were
>   set. For instance, there seems to be a bit "DP_INTR_PLL_UNLOCKED"
>   and if it was set there would be no indication.
> * The two functions wouldn't notice if more than one error was set.
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dp: Clean up handling of DP AUX interrupts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9dd5895a5687
[2/2] drm/msm/dp: Return IRQ_NONE for unhandled interrupts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f185c87fa119

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
