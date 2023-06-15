Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51B731694
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245473AbjFOLbi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245389AbjFOLbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:36 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E28E2716
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:35 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1bb2fc9c6so26240901fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828693; x=1689420693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+ILs23VDjH7i7mI0fWXkAKxSZYuahl0zC/MkJHloGo=;
        b=oBiIi9gL+Ha0pHIzfHmW/7IOVMZlbHpTc/+wAIG44AGSF0P1uWif0rGXRZTyBssYkA
         V+WbCm9NDmllkjGF70Zn7iT9dEESwti8/ea6lOjXknjXWnlIdcdEtn1c04w/WF3wZp+O
         PrtokjcpASYKEvQpDhpEML9TfrqdorSYf/xxoIT1r0PLWLitfbl6DLMi8D0ItVExEBU/
         CtFb0kKDu7Jp+LQlpkmfXjeGAuRRXBMJAMiv1NGIj6+CwVP2iK8fUcSXYxGxevnC2fq/
         Ef17W77iU2XqYXY1mmr1bHUqxj+yu7slUFSIpIzRPP5d+W0CDnA9Zog4ShpmVf2kbcU7
         Ww9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828693; x=1689420693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+ILs23VDjH7i7mI0fWXkAKxSZYuahl0zC/MkJHloGo=;
        b=a8XXHorlexLIZ8p/nfO/3MNzaruQF9eiZEng0weONpXmZVrs22f2wUB3HK6dHnOhXS
         nQ2Ymx0w3mWDzvd3LH1DIBc/F1En2tUFBbrDGEgoYWwH/2kxbJhq59Mh1FGOHntfUdyq
         qUOIAw8tofoxRMEdW83pZOK6L96rTt0yvdVv3DbKvbN+Rl0fHcrCZ+IJP59XQBnBiErQ
         OVCi4DvfEQ+9BIz5x5g5+o3K/derzTQ3UEFDYK5ixzlBC6rsVZ0rNT6sMV+2Dy3qizAZ
         I8ROJeIQNQLyM0Ek8YoElJtMMTI63vw+uwyC6Wj3sPczsuJIdjv1KOGw9730gQSe7O3V
         aenA==
X-Gm-Message-State: AC+VfDys6NiL3/PSoUbaMlntRxUO8YjsBEVJbUkHSZr2JrF28IK0R1p2
        QOj1pIEBWAbvXRBXFJUtuOQQng==
X-Google-Smtp-Source: ACHHUZ4G6b++G23dV54nFY5x9tcMqhFvU20QUp8NmqaFOrwRhPMRIe/TRaOFAfk5OmkSzRvi+EYcrw==
X-Received: by 2002:a2e:91c6:0:b0:2b4:430a:83f3 with SMTP id u6-20020a2e91c6000000b002b4430a83f3mr1385560ljg.53.1686828693628;
        Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Drop aux devices together with DP controller
Date:   Thu, 15 Jun 2023 14:31:23 +0300
Message-Id: <168682860385.384026.4498168865636345708.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 12 Jun 2023 15:01:06 -0700, Bjorn Andersson wrote:
> Using devres to depopulate the aux bus made sure that upon a probe
> deferral the EDP panel device would be destroyed and recreated upon next
> attempt.
> 
> But the struct device which the devres is tied to is the DPUs
> (drm_dev->dev), which may be happen after the DP controller is torn
> down.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: Drop aux devices together with DP controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a7bfb2ad2184

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
