Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA86473169B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343632AbjFOLbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245751AbjFOLbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:40 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35F52716
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:38 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b34e133f5aso22053851fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828697; x=1689420697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iagvrTdJe16mbe43XCaGjCeX1Svdet6EWcsi0Mlbfo0=;
        b=C1G5NDiXspEzy5EQjsjez+uLoXWTbf1yhJfnfn5dw2nFfd7vBXpmy74ehzhi2gVWO0
         98BA54WhJ6FJm5DDQ0XhB8jkpmXBh0ABSt+sBLjEnLVb88t7lkoqn0ZycBe3DOXs8TBc
         Ezyff4QbewIrBte/SFLoA9fKc7m2p/X8k9i/KE/caEz9NN4kDvxahKkiybJN+8ZangzP
         VkFJNg0xUKAhA2ZEva6jLrkemxDXhe0a4IPVV0jIXYbZKFvSGnJk+O0fwTG3NuOC5m0p
         XjZFWWLSO8+d6tmRyNIzvOhN04zCvgRxHd8UDT3B8XakDsB3WR1xO57QE5JmQLIxnZa7
         RL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828697; x=1689420697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iagvrTdJe16mbe43XCaGjCeX1Svdet6EWcsi0Mlbfo0=;
        b=j3oOC9Fpq+wwHYxN6gO9v2rXqzEO8upbpA8p+z1wwF45424uMSY8CyE7O2dMc386BQ
         X1cgvgWMV3zTs6DgEnFPK4UyWLFnWQT0vUjTxVM2S6qDzB9Ucc54M7d3Da+JSrOVcTWm
         rqZJN5Kg4vIE/dKMQ4fRlAGA1UPo9TNuQWDHh/TOI1npvGZvumNBVIeCIAKH3aQBoGrA
         dHvolq0923XFpbjlNOOXkNLxxmj1hjeESmn5QEe3YwaliClmN2waZNtrUMLZ5+nZFjFk
         fvOJFELNfGNxLACa/jhTpUb1FayUnJFxo9wUXjVOHjynlojLEaPWZR+04AvcTl3fRcZt
         m51Q==
X-Gm-Message-State: AC+VfDzkfDCI9V9WWgF4rTJarjTn6umYZBIMWh59Rr6d33TrPUE7igZn
        2PQtBkXbYJBSLur2YKmpbJ4esA==
X-Google-Smtp-Source: ACHHUZ4Y0HPzWzh+M9sKVmQVFCAQ3f0hHOdfTS1SY7SsZK1b1Ui9Pb4I1jOd1s4VTLjtxaN/by9/4Q==
X-Received: by 2002:a2e:9e86:0:b0:2b3:2f9b:7c9d with SMTP id f6-20020a2e9e86000000b002b32f9b7c9dmr6606616ljk.28.1686828697221;
        Thu, 15 Jun 2023 04:31:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] Add DSC v1.2 Support for DSI
Date:   Thu, 15 Jun 2023 14:31:26 +0300
Message-Id: <168682860387.384026.9115594076193676039.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
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


On Fri, 09 Jun 2023 15:57:12 -0700, Jessica Zhang wrote:
> This is a series of changes for DSI to enable command mode support
> for DSC v1.2.
> 
> This includes:
> 
> 1) Rounding up `hdisplay / 3` in dsc_timing_setup()
> 2) Adjusting pclk_rate to account for compression
> 3) Fixing incorrect uses of slice_count in DSI DSC calculations
> 4) Setting the DATA_COMPRESS bit when DSC is enabled
> 
> [...]

Applied, thanks!

[1/6] msm/drm/dsi: Round up DSC hdisplay calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/21bf617110ba
[2/6] drm/msm/dsi: Reduce pclk rate for compression
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7c9e4a554d4a
[3/6] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag for DPU >= 7.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/22598cfc94bb
[4/6] drm/msm/dpu: Set DATA_COMPRESS on command mode for DCE/DSC 1.2
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1642b5803473
[5/6] drm/msm/dsi: Remove incorrect references to slice_count
      https://gitlab.freedesktop.org/lumag/msm/-/commit/155fa3a91d64

Note, patch 6 is skipped for now

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
