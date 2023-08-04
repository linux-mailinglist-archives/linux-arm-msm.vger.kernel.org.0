Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79D37704D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 17:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjHDPd3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 11:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjHDPd1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 11:33:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9956C49E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 08:33:25 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3872425e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691163204; x=1691768004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ct+HhFSf3JuuA0pS4qW/YHF3pCVOsmudw0iO0Dt49tI=;
        b=O+O0DdJB7gDBLNjPG25N+i5iYBocWpOSXo1e9KKSn+uIzN4wAkWVfWxNpAQshTubR9
         hIsogftgGgdnA573RdL2yI/56LIDgGsrEFwi/idXWw91cGDCG9kdxQ1qOVF88OmOfRBz
         ebA+TEDovyrAC24Acvnr78RW5R3lvnA73XPnz7TaA+MHOBaQF6KsdxZrqF1aYIZH2RM5
         DzPjNzVL+YCdXTSwKiAecoe6klmEvqqyJYM6+wUuOJ9I+TwV+ST5yg0s4DJhWyi0g1Ez
         vDrRPQ4GcQr2jAsH5tXyi003crAiyZfRiJv7wFvJTWzS+i/xLVQUa2A9jvEDarwGe6Tp
         PDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163204; x=1691768004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ct+HhFSf3JuuA0pS4qW/YHF3pCVOsmudw0iO0Dt49tI=;
        b=g0BrXWPsVyAHFFibBOz/qtx5cS8zf4rAZ4iLBG27yLqqM+eCR3TAwC1gFLZsvye8S8
         PIHsrqHGULvbBcfOxOxyXpX1/EOA66V4yvntz8M7OEXz+7oe1X6j0HMsKlDxqLT896SB
         NKvil8kNmwl97kORZirZD5q29NBEkM2m15BbM/JnfILcN/cwNcs25jc8xf6uyrqDA4pv
         NeEOsYI/KFPfTfsaiSL/+9UD40j2chZDxktS9E1LTFOWPI4zHyZiKPpbSthfhjVHbyJv
         aj+UxuEndlIFbXVFA/feXKxPasfOCyLUKHBSCUP3Y1tuBzvXcAPp3GooFZnjYg1IiGPQ
         iSVQ==
X-Gm-Message-State: AOJu0Yyh9yQhECkcjeTeeWScHEYbBuPYigFqyBAb3waBRfU3u90LvmcP
        LPRFr50cU93iPZ6inh5WZnOY+Q==
X-Google-Smtp-Source: AGHT+IHEKmz6wgZTpApnn2eeHnpWC8wifjJXIPan0+O+hTJlVADjPVgOzrAW4CFWVh8fXkk9hmfB9w==
X-Received: by 2002:a19:4f5e:0:b0:4fe:89f:cbad with SMTP id a30-20020a194f5e000000b004fe089fcbadmr1431945lfk.51.1691163203868;
        Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:33:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH] drm/msm/dpu: clean up some inconsistent indenting
Date:   Fri,  4 Aug 2023 18:33:18 +0300
Message-Id: <169116308155.148471.3951374224625324432.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
References: <20230804075746.77435-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 04 Aug 2023 15:57:46 +0800, Jiapeng Chong wrote:
> No functional modification involved.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:183 dpu_core_perf_crtc_check() warn: inconsistent indenting.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: clean up some inconsistent indenting
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0fe70105056

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
