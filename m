Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1BDA74F202
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232830AbjGKOXr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbjGKOWi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:22:38 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BBA268B
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:22:18 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b69dcf45faso91926961fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689085323; x=1691677323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik/qOyICB+hOJlY4lmFAhBvArnDlT8QyNux/Uwz9Gbo=;
        b=r0v+ygSfzimP/KLRdLbKaY6CMkxtZVxhReFrhft0vSI/Nvuk2cRuxud72IbafdNu9B
         81poxleuZvfFmfxzykbgjux9VjTCzmAyTQRaMRk4myVDAwhmc4jP0CWqOcuV/VJLIEAo
         9W4cjEDrBm8tVFhnrvtPEG7Pak7wHsk3pDmpv1OJZ6nrb8t0TswD513rzYIH9k880cYi
         YC69AkBvuuM82vnExcT62/Jjb8SFDGySH3O3JMUuLCDCvD2OaOS1n+74xbgwhSZ7+vAC
         l78egxP9CK+Fzo16vvQ7J8esIz7wARIaI+goy3PH5xywbvcKFGm3WAF98BFBZZ86/W+8
         zOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689085323; x=1691677323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik/qOyICB+hOJlY4lmFAhBvArnDlT8QyNux/Uwz9Gbo=;
        b=BgiHYGSAYA3h5KMp3ncGiF6S7sId5+o7u09NwjRFmYfakPgYfRzpIJYUbHgFsLo4xO
         HK/M4i8UVrVvVx4cwSQwVuPv3ZdC4Ngzg8NpWdPzTBmDFhotfeucHZDQ511JVP0NSGsl
         2q7n0OIJfKDopWiQXsGOZf6H6sLJJvRFmE+bGg++NLfVpD6DETHYgE6HAvp+gFPtVH9R
         NKnOZwedDswLgD7booxxWpC+J6zePth0l66SS1Xph64wpuXxZgQrs0MFvviISlz3UodV
         TKKSUpkEnZGxOKSjZUUVGHtN2c+A4gb6dWigGpO81JZW5YUjg+JXSXBsdwbESZo4M8p2
         gRkg==
X-Gm-Message-State: ABy/qLbOBe+AvPmgNh4tXOAvE0sdwAYxBCrrU+lV8AphU6o3crmUdto8
        5rRrRi+3dHZTgib7dxooUkbkEQ==
X-Google-Smtp-Source: APBJJlEBalRUj+ijS5CyMwGZ73deoQ4XRunAyY0wJowOTqWQavAPcjIpA36nSTndCOGOxWS/74NRxw==
X-Received: by 2002:a2e:8611:0:b0:2b6:daa3:f0af with SMTP id a17-20020a2e8611000000b002b6daa3f0afmr14149206lji.25.1689085323017;
        Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dsi: Enable BURST_MODE for command mode for DSI 6G v1.3+
Date:   Tue, 11 Jul 2023 17:21:52 +0300
Message-Id: <168908465039.1869384.13751958187068298061.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
References: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 27 Jun 2023 13:31:45 -0700, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dsi: Enable BURST_MODE for command mode for DSI 6G v1.3+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4ac447e89e71

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
