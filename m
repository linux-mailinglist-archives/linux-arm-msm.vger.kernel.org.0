Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66FB16CCD5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjC1WiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbjC1WiN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:13 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A48212F
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 20so14217308lju.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZTRJ0TTqpgk5AjNv95VOIk7xe/ymEV+pZnyuKfYsGM=;
        b=MeyWE82b5nRejN5xQ6xs/nTf4qV/VYG55PfiMgUVuECOnfrCeGEAFUAdAfV7a3QVWS
         F0oR+OhDiAoLm2+K2dI/DEXjvwQ1s8LXB6+6RK8cIq4iRN32sY/GyCnve8TTBKjgQuEc
         Kg4bdvcZje4GD0Cg/jjCR8WTPdU/hJrE5TBK/u6zVMrefCe+x/aZTojiP0sc6XhSiu2X
         Iz1w21O5qJkrRNU5fjGBRn8903bqEruNkSm8TxTgugVHYuw1Q3kBSSz9GH7SHiXYvf+P
         bPJs+IY75bLsmrhlPu2nj8whMLi7mk/qDRAe2UEg92EBynFLjmeDMoZ5EIvPTosSP5LC
         6Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZTRJ0TTqpgk5AjNv95VOIk7xe/ymEV+pZnyuKfYsGM=;
        b=ETKks26/oX1tyXtBDaFCsCh5j9RYa/9JlzoNA8qqzqQdfoMe6fUyaBL5CMgJT9QSIt
         Cxy8VA9gtT2LoBe+mKJU7B4zfSEqJRBL+wPURuLc37qmOqQ+yT357knH07i6609mvaPK
         mfW2gTus1J+r+JV8b56mpQfW37NVsWb/cxwxroEBiHBBBCwoJbDhbBDFG5zx4ncnbSyT
         +m5nfQK/dWpsGbne0U/teySjhfb72vVBqHLA/IOtWFBjl/0vStc7/tC6eQfZ1MQ1vNIq
         qwV9GcGSVxCX3YF5ZoEmX4RL64KDf0Maq4IA5GGJBvggZN+0yC53+VGO1TATPWBf68CG
         zicw==
X-Gm-Message-State: AAQBX9cbL0NqFRAnJ7w8eShnNzJYAF4CmSXsTIRbOWdq7F/XDgUbSe1H
        mUaD6pWvmDbGeajTV8C6XXdGzg==
X-Google-Smtp-Source: AKy350ZZ6ELOP4cO/h4cwM1q/AaisZK8fOKm7ULEBLxVANiD4pFWjDs6CEtRSDHRPCZDhKNGppC+8g==
X-Received: by 2002:a2e:3813:0:b0:299:9de5:2f08 with SMTP id f19-20020a2e3813000000b002999de52f08mr5119053lja.6.1680043086182;
        Tue, 28 Mar 2023 15:38:06 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
Date:   Wed, 29 Mar 2023 01:37:50 +0300
Message-Id: <168004255463.1060915.9592020077874857953.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306090633.65918-1-geert+renesas@glider.be>
References: <20230306090633.65918-1-geert+renesas@glider.be>
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


On Mon, 06 Mar 2023 10:06:33 +0100, Geert Uytterhoeven wrote:
> With gcc-5 and CONFIG_UBSAN_SHIFT=y:
> 
>     drivers/gpu/drm/msm/msm_mdss.c: In function 'msm_mdss_enable':
>     drivers/gpu/drm/msm/msm_mdss.c:296:2: error: case label does not reduce to an integer constant
>       case DPU_HW_VER_800:
>       ^
>     drivers/gpu/drm/msm/msm_mdss.c:299:2: error: case label does not reduce to an integer constant
>       case DPU_HW_VER_810:
>       ^
>     drivers/gpu/drm/msm/msm_mdss.c:300:2: error: case label does not reduce to an integer constant
>       case DPU_HW_VER_900:
>       ^
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Fix bit-shifting UB in DPU_HW_VER() macro
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c8f370bde5b9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
