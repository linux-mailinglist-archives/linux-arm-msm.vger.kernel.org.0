Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF386635CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237980AbjAIXo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237968AbjAIXoQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:44:16 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512AC1AD98
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:44:14 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id f34so15577864lfv.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
        b=KdluC5isYfGPedU/R2fjuuNpCoSuFF1Gex4PxTwA/N8jNDHS/AVQE5mKglBc1iQzkS
         PsYw3u+iVbQxMe+TjLhY/zIwy1l/27O2gFVrl2UK7tdwpA/NEej1wX+R514XKyLF+uSv
         xHsN/YuPfGmmfmBKCwj9zCYW+8Oc3ryiysNMANUaS+wodqw0J5mEFq3QoHYnY4t3Lzjg
         FeXOAW48fZW+o7VQhUl8UGSy3Ji3tHu//ALLLsKYTDdmCo9/IQWdubtGXEHiGiIXDctP
         vHyW137kiAwiwBvnxNWqh9LLcNkjZbml1VAWAHKK2831myR9iU3oxsy/g9IJ30OGHok9
         yLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHjEtNVaTqOtCpnB9ZP021rbETT/k+vzPdGSi2OKKbk=;
        b=v5b1+AFtx6IFpAZMEz2LotwEJnDkO5ANdfQMohueiX6mK2aKM/VULeDN+0BdWtaZIR
         C8NRdO6iW4qOzcKMuqPjCb3QwW/4OvptDgkXyYfsBQNFCthsXbc+W6pIiqs1C/U4alTp
         kE8vDrs7n4FFs3vsT7EAeCH7ZlMBepn1s96kGu7Zw4BtC2dUgqdBR7LhmLlZ44fB0eaD
         2Lrs5ry2nM8QzujeMkDedzsYFc8/ckmjSQ8URT10V5qXrG4EgA+z4dSqbJV71BRJEw7P
         5CGzlo9gK7nwRgYOyQ39ns2/TG24wTWEB6IHA60K2hv5ZE+jqqDdurJkeW3hG60ZYBQ3
         qjWg==
X-Gm-Message-State: AFqh2koXUC0uh85ipyKzu9ufLo1AfRb336QGYqdXT/zETotVmK37FOKn
        q1TBL6V5gtlg3aq2q/ZL7Hll1Q==
X-Google-Smtp-Source: AMrXdXs4hWSrnGESPaDMiC7Skctx3mIanGzpIn+a29djjV3HrxocDoxhqI+rKdtTzMIxIdZgqlnGAg==
X-Received: by 2002:a05:6512:3b91:b0:4a4:68b8:f4e5 with SMTP id g17-20020a0565123b9100b004a468b8f4e5mr23148885lfv.43.1673307853915;
        Mon, 09 Jan 2023 15:44:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:44:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com, airlied@gmail.com,
        daniel@ffwll.ch, Hui Tang <tanghui20@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        yusongping@huawei.com
Subject: Re: [PATCH] drm/msm/dpu: check for null return of devm_kzalloc() in dpu_writeback_init()
Date:   Tue, 10 Jan 2023 01:43:59 +0200
Message-Id: <167330408783.609993.13860899129914018447.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221119055518.179937-1-tanghui20@huawei.com>
References: <20221119055518.179937-1-tanghui20@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sat, 19 Nov 2022 13:55:18 +0800, Hui Tang wrote:
> Because of the possilble failure of devm_kzalloc(), dpu_wb_conn might
> be NULL and will cause null pointer derefrence later.
> 
> Therefore, it might be better to check it and directly return -ENOMEM.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: check for null return of devm_kzalloc() in dpu_writeback_init()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21e9a838f505

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
