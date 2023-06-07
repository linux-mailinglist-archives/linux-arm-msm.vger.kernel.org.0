Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17AEB727304
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 01:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjFGXdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 19:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbjFGXdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 19:33:36 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31F282695
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 16:33:35 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f6255ad8aeso55083e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 16:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686180813; x=1688772813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lDlutq59/7K4O/ryHd5kkyj0gex47Jt6UQeyUtN12c=;
        b=J1TWoMenYdXW7obNzZw8NOC/SdNCGnZFQHwTb+KuyzNhslN/CNgiYWG4I4mYo8mA0p
         Pjtgaf68KovPIblJBL0S+zMTL22sUxFWT0BtwVwOILPBy/UskI8p1F5winjluuMFhQyv
         X38s5ii26ANVaMtySX40ZZMNTgcR2QDKiJMiYZdT8JUBwECCFTIQrzahvQsvGG2jGFfy
         uhjqFKxpvSUIWMtsmQ83yv+vIvJ9xq/PPPSujykLQ6QUjLEXVs7+4rdEaL/8PG7/g3EH
         vaasv86oeJgAoq3phFBNRX0BnE5SIk4in1G2h4bb+RMiJDSHMTxhv18sN35WUelMGfl+
         5Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180813; x=1688772813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lDlutq59/7K4O/ryHd5kkyj0gex47Jt6UQeyUtN12c=;
        b=UZ05sz4ry0BcI2DtRzenm+MvmVZ7MJstclCWm5GZs9ZL2fw4sGDqCITGpwSQhVxI0+
         99F6E7PLM+x+8+RvYtSJzLHLCMnPOiPeLIbSjTAMxpoN4NFk2wIYz44HZ51sGVBqvH28
         dmuPK/NXzRbafbyvf+EK+u2Z+LvL1oDOK63/hMxuszdXENBAE+aGomAyKT1fQP1XeXUb
         OVtpBAHFRDo+Ydz5qlKNVOdAdPfalAQtMXneLY1UlnOT+zz3Ji2uTaT2q5UqoqogdCZu
         r5ntxktd08hEmWlXZiMcul8XokE+LUv0GMcfoRO24lKPfgrTIbxQzXuSZRNk30avr2CX
         K7bA==
X-Gm-Message-State: AC+VfDxdvdGIlujRQELkw66C3pj55uCrX3+MCGWmGVWIQD2u5wp6/e8f
        bW4XzB30KWPInQuJW3rLd5sexA==
X-Google-Smtp-Source: ACHHUZ5PDGB3d5i12eL55i/NBR8u8kJFenkMlHl7KQCxpRKMLa9dTwF9ztv8RLWp1CgAvjOdeb0e1w==
X-Received: by 2002:a19:f00a:0:b0:4f4:d41b:f421 with SMTP id p10-20020a19f00a000000b004f4d41bf421mr2490086lfc.33.1686180813420;
        Wed, 07 Jun 2023 16:33:33 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25631000000b004f001b0eda2sm1951199lff.56.2023.06.07.16.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 16:33:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch,
        airlied@gmail.com, agross@kernel.org, andersson@kernel.org,
        marijn.suijten@somainline.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
Date:   Thu,  8 Jun 2023 02:33:31 +0300
Message-Id: <168618077608.1883603.14367317273588128557.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
References: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 06 Jun 2023 13:11:12 -0700, Kuogee Hsieh wrote:
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/203b2019b3ac

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
