Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8170721453
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbjFDDCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjFDDBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:54 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501DCB6
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:50 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so4439091e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847708; x=1688439708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtZdx8VPfoD43LcN321S8R1aRuJCVhuM31iNj9CzZBg=;
        b=gs9KsUkjmXF9Nkkokk4HdPi6t8M26KY8Y+CWPUb5euQdK6RllukgoprfdEUYbvdCMy
         U5Yzm8RHiMNVbaUwpKxQXx4YRBUvhYEZliT4xVfE4cSiQMZaGZU7Q5Xu/km6qROWYVkQ
         +JRB8PSxQ+YXXkTQ6/7G7c/KyLxblkqb7D0ePuJTf7MwbnHdzGwFixReqHpiTsfPtwTm
         +RL7ajisHfdEXg2GkkQm6Ty+ArDaV2+e0sB/q2/HYHY7lfI8NFjT/T1cS2sxC+S8Q+Es
         JVSp/nRGNEfl2k4R+sQjOpCrkzfdvIO+ves7JxCIfjTwq6pgByPV0xESjU7sQJCcggUb
         UILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847708; x=1688439708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtZdx8VPfoD43LcN321S8R1aRuJCVhuM31iNj9CzZBg=;
        b=Frlec5RM7Llqj/XVOuRurdxe3hAQOBJcdzWcHKHx/YQrVkil/0Atyj7rplO6j+YW2U
         t6eKmFWEOzSfuQe+in7dlQZL1xTy3kFkQQa+P2yr3+0MFK6pALXfozOVL5hI4397erXx
         Xj2JnWa+NDXrqzrUKn1yoru5u1Z7i82rnMMrEGolNyQ3Ssi1jOAEnYiYnghNzysu0lY1
         w6QF5nobFJgZkSetGm7mWue8c241SDJ2x9MK3k8I1N30CJc1m3aSmxiDxjkbMTKZ86LH
         Hl98N1Kf6U26a97VvPhyKTRI3JnH1ZJZdid86kxhb/5RDjHEQj7MnV1CKfs/FHkxIA4H
         dkvQ==
X-Gm-Message-State: AC+VfDxxu5NazagZd+m1nWlG1CK0/zbioeZ4N0KuUcYRVC4Q5Dc9WcVv
        rdqQpbZpd8gzEeJYQB8ZbqSIUg==
X-Google-Smtp-Source: ACHHUZ7DiqTKdDpgxC6h5ke18d9gZSPA85LosaMquHyK46GcZQQFpzWj+2anUhv629EUWNFZalOePg==
X-Received: by 2002:ac2:531c:0:b0:4dd:ce0b:7692 with SMTP id c28-20020ac2531c000000b004ddce0b7692mr3398444lfh.46.1685847708607;
        Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Su Hui <suhui@nfschina.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Remove unnecessary (void*) conversions
Date:   Sun,  4 Jun 2023 06:01:37 +0300
Message-Id: <168584750428.890410.17475920431206937962.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522013213.25876-1-suhui@nfschina.com>
References: <20230522013213.25876-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 22 May 2023 09:32:13 +0800, Su Hui wrote:
> Pointer variables of (void*) type do not require type cast.
> 
> 

Applied, thanks!

[1/1] drm/msm: Remove unnecessary (void*) conversions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eea9cf72b718

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
