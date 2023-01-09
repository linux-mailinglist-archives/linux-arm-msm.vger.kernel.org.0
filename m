Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 438C5663570
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 00:36:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237909AbjAIXgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 18:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237994AbjAIXgZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 18:36:25 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E69D3BE90
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 15:36:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bt23so15554114lfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 15:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbCC4/NAEi7QL8GVYq6w9KKB1sHLRdN0BAnnJp4jmt8=;
        b=QUKkUjDYxkCANV7FXFWAUCbtNdYq7o1JAGSF4bdCRRd+7kq/ye4HIqfKqFkbneK00c
         BymCCO9DjFleTxh1kCUZWRJ5Hr+MJPLl0o1QA9RWghyCoG+3jV9foyHNvqaV4Z7kzPIL
         M6hWDW2Qta7LfB4uv0UMyrjdCRSdR6Fm+Pa+mbRkvCDxR6Tx63ihqBvWRcOJzQ+PXRoI
         WJHjYhSO7bqZYzEFL0aKbfO5aFs3K7AEdMNxyYJ7zOIsf2uXabjIyuDj2HIQB/xuGikh
         qQw+/j8VXo8/cwOponk2G9YKEssaKTA3BVqo8efaRfd5bRYnXjgRFMRq9PYq1jTjCmRQ
         9yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbCC4/NAEi7QL8GVYq6w9KKB1sHLRdN0BAnnJp4jmt8=;
        b=nRLLoYI16xl/hK4XL0J358uyAG48sUVEtDV4KT6z3EHK18JFss5rHz7yShemOxvUMk
         1ccXamTrWXta9nAXTYe8jHb7fjUQ60okx4hXoFDCNNOHZH2RYdnupkcA0rpMzl1DYQex
         KWs3quDHayVQ8rzEiJZfekkjqLbLovZN7X5ZSUdx9BxTx9N2GPihCZ1lSbkSgynf9zni
         RXrNiQ1YsVk07En/848SUQCqVUT04JLXdMrjS6zIe0cv9EMt5JJwLNTftHYr3UraOWDo
         8bb73g4eC3lrBAhFxiupWV9VfdTF3IfS03JXCyf1Dw9xRvqAwGJRtKFfTc40vtGnFvvn
         1NTQ==
X-Gm-Message-State: AFqh2koDkzrmz/qz0U5JStFhMzWP7W0Cx9DR3xKS1RWNd6WrnGT8C8Kp
        tR8xLLWQcMGcHrbG1siqQe6Rfw==
X-Google-Smtp-Source: AMrXdXvXjSjyrWinT0Qx1C/ylFYva16KNvkPkx496D30fxTHNGVyv8d6IUO8gZU9xBTAzAKNI4S9pg==
X-Received: by 2002:a05:6512:32d2:b0:4cc:8375:701d with SMTP id f18-20020a05651232d200b004cc8375701dmr1559796lfg.44.1673307373497;
        Mon, 09 Jan 2023 15:36:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f44000000b00492e3a8366esm1841307lfz.9.2023.01.09.15.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:36:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: disable DSC blocks for SM8350
Date:   Tue, 10 Jan 2023 01:36:12 +0200
Message-Id: <167330637780.615458.8361646864456567493.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
References: <20230109214309.586130-1-dmitry.baryshkov@linaro.org>
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

On Mon, 09 Jan 2023 23:43:09 +0200, Dmitry Baryshkov wrote:
> SM8350 has newer version of DSC blocks, which are not supported by the
> driver yet. Remove them for now until these blocks are supported by the
> driver.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: disable DSC blocks for SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3b2551eaeac3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
