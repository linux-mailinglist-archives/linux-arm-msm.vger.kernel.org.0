Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4A867D4DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 20:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjAZTBZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 14:01:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbjAZTBU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 14:01:20 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E1565346
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:17 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so7711806ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 11:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9GuZIQFiQiPaXRH54eN2BlHrDLxxiKxYVwEtE53efA=;
        b=Ls4xDl5ETNxM4rGQg/ALFS1DnJdwaHO8rUjvrCve3UHHfUGrE5T/aKPakNWoAbEmRi
         YxI3xWWHOo+j6pFL06KYxnoq8kWpaHgcw1SnD1iHaJNmjLfpjnXT1w+iIYgcXHFt5YeB
         Q/hdXuiNk4JgQ5OsO54SChqNONavdWTDTDDJtPBohXB8J74mOTZzgLmuT+Iu5cV+s3JB
         +blkT7pkT0ceTmVj66qMq0IY/YQVSbqXR3Tp9AXUdEWEgKIDPeVTBdobBmWS8MWhSTtx
         XvbvrgfP+vZw1NaRNRcy7y/wUGSIfWMbqiQEflDlyR/LjGSYqeL7xGJIXrMRr7peJjUJ
         dEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9GuZIQFiQiPaXRH54eN2BlHrDLxxiKxYVwEtE53efA=;
        b=fZr7B9WHS0TM5B0252w7KTW5tc9TDwK4ITwrhu4sR41ClhDp4WD0/TrIt5wt8DdJtA
         tEXmrhKnweqeK/0xW4fDFGr/zctZaPAqMlx2QvAnl9YbbV15ZQKDegcMP0w8RNBPoK0X
         a5ErBSaBA6CTE+XoR64Au0CNq6l6JgQ4QFzDFKGhgtiw1O5sBQn+cRv7Ae5EalLE5vop
         SXeEokYyFdGTrQHD3Zh3+KIwfj0nreKevhQ8ezJcYmG6BorXjmpzEbL5UayrNi/s+xKc
         6BZ4lOxgDL90ZpzwRmmd8IC50+GlpOfHDa0Kcp6bbAjzRxfm7Wk56OT8Y5FgwO4HbNrA
         cuVw==
X-Gm-Message-State: AFqh2koAyz7bvtKWDTRSZcKYyf7OTYlX9DnTdAwubFp7wW/4kMeTgGEZ
        HE1pK1fgmY2CpyMohPBnSLVe1g==
X-Google-Smtp-Source: AMrXdXvBONRphu/IOhYxlFKyGySVwQAB6PjdJ4S/MaO6+PdZGJOQS4Vf2zGp9Dz+pTfYlrjHWqo7gA==
X-Received: by 2002:a17:906:3b01:b0:84d:4767:734 with SMTP id g1-20020a1709063b0100b0084d47670734mr47874459ejf.6.1674759676003;
        Thu, 26 Jan 2023 11:01:16 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 11:01:15 -0800 (PST)
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
Subject: Re: [PATCH] drm/msm/dsi: properly handle the case of empty OPP table in dsi_mgr_bridge_mode_valid
Date:   Thu, 26 Jan 2023 21:00:59 +0200
Message-Id: <167475959087.3954305.17231782796910998330.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
References: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
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


On Tue, 24 Jan 2023 22:36:00 +0200, Dmitry Baryshkov wrote:
> It was left unnoticed during the review that even if there is no OPP
> table in device tree, one will be created by a call to the function
> devm_pm_opp_set_clkname(). This leads to dsi_mgr_bridge_mode_valid()
> rejecting all modes if DT contains no OPP table for the DSI host.
> 
> Rework dsi_mgr_bridge_mode_valid() to handle this case by actually
> checking that the table is populated with frequency entries before
> returning an error.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dsi: properly handle the case of empty OPP table in dsi_mgr_bridge_mode_valid
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2ec56b232b97

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
