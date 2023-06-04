Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F88C721459
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjFDDCG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbjFDDBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220431A5
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1bb2fc9c6so12180871fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847709; x=1688439709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoDmEqdjgADGppA5pdPKPSiVhqTr16jFOpE9tYVHKIk=;
        b=n9ilQJgRuvWxI6him4PxD1czi6TyIoEqM/b57419MXMdiSlvLxONSwBZXFBbmBO/pC
         Iu4Dfrz/s5q+3DiaxV/Xtga37l5amnrVKtb4nxaBiusNimXzjmrIxzijywAcd+TH/DF7
         cT904Q2kZPYQXGlh4VlOfDwPl/MECbiXTPSKClpKswh0Elu2QapSRKTSD1rRWhR/10YZ
         ymW1JnGEHD+fy3QXsgzF2WK3pJAfLjTao5PxN/Ffz92OKatQKmGehQF2fOx1N8N8h6EU
         NtdcmABQrhMGdvx5jeGg9EwuCRLPc+ohQ20NOIMZMDoEPLznkbKKdgEY2KONZjRKi2HS
         i8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847709; x=1688439709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoDmEqdjgADGppA5pdPKPSiVhqTr16jFOpE9tYVHKIk=;
        b=a38fksgH2ho+/yoc7YslI1Q+WYleBNpIUYxJuVoVuIctxtlxm2Wcz+xjtHaX2rSwws
         bNjbkIT5rXFkNUx5mybtHcZ5at2G4GShWCmK3pzP7ALxXqJvJPkKvZKfANit0SBglz3s
         WBprL0fy8REy4TfwOyCBeenU1pi1yIKvhRILQgjJ+LNDEIpuB+ZBDKCQ98ubFrjIR4vH
         znJA8yLqINTls9ejvHJBPpSOhdh8A3lnxquDLgeJWbO3hko/FJkSNuw+t9cqMrGMimSw
         eWTIcGqKkFeXxLgxa3o9U102icwS+RmtTYfKTu39igaTRoFk6snxyCKXExC4YMr9aF5c
         XjQw==
X-Gm-Message-State: AC+VfDyIE5JXESa2h3p0UbNZ506cggk3PtRlYu9E6TmRzweMcrrvqXZP
        Y/08k71CMCP4PA840zdmQi0udg==
X-Google-Smtp-Source: ACHHUZ6vyK8kmwfY1u4AC4cTxf1sVIa3uyxiHbkLLwPpzTC2Klc0LFD/frFQcwahThhl2ZjqGKudXA==
X-Received: by 2002:a2e:b0f2:0:b0:2b0:5a04:a5bc with SMTP id h18-20020a2eb0f2000000b002b05a04a5bcmr2290645ljl.13.1685847709393;
        Sat, 03 Jun 2023 20:01:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Use struct fb_info.screen_buffer
Date:   Sun,  4 Jun 2023 06:01:38 +0300
Message-Id: <168584750429.890410.10110988637937008875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522191701.13406-1-tzimmermann@suse.de>
References: <20230522191701.13406-1-tzimmermann@suse.de>
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


On Mon, 22 May 2023 21:17:01 +0200, Thomas Zimmermann wrote:
> The fbdev framebuffer is in system memory. Store the address in
> the field 'screen_buffer'. Fixes the following sparse warning.
> 
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26: warning: incorrect type in assignment (different address spaces)
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    expected char [noderef] __iomem *screen_base
> ../drivers/gpu/drm/msm/msm_fbdev.c:124:26:    got void *
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Use struct fb_info.screen_buffer
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4fb5ad612c5c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
