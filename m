Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442B76106C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 02:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbiJ1AXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 20:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234184AbiJ1AXt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 20:23:49 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CE54A027D
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 17:23:48 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id k19so5987886lji.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 17:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZYWmbkkX4tjycvaxT68XqwdEysdPnbhAunSSy5OJgM=;
        b=IHxYowaoqHjIbbyLOYZS90Pa8uc4TM5JOtjG8Mn58hLNLNzChZt2xPWeUXf0xBUn9X
         SdzHy2cgav9WSafWuNoL5gtQTLJuhgcDZRuECg+YcB1jBmmx0pMhjLp8MIlGJE/9u/z/
         vVmzvbPI9f2NzGPdGLN3zoILUCGRSE2d/pnH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZYWmbkkX4tjycvaxT68XqwdEysdPnbhAunSSy5OJgM=;
        b=N+z7glcK9vyu7dw/zocC0oXbeizhNFGbDRQP1uD+thBucrb3iLDIkBKB24zYRti1/7
         ShnKYn/TQu6mYB3Pb4KRAOuThlvYjSszj9bWpOkKP6Y+FzGVhrym2Px7yqLm949MBlKH
         35lsZqu6ZvmYQB7Rqhe5uVyg8ypHZcBC5GPaw70wHbrO0a4jVxDhKjjrfwfSPysejDKY
         btU9TpToTBwntivBCh8OKa4BazjiuaUyV4n9DCO4zI/jsPluPUVm6/6cd6V4t1fXYUkP
         dfBJilsjOd5tSnK5vhZZtVtPVKv5L/Vg+Ufh+vNh82QinjKk8dqu3aPkgvEXi3CPEBUI
         7A9w==
X-Gm-Message-State: ACrzQf2LX1y230r9x6A9MVngvJoF2S+rEX6xD2N/zHaisFgEOEuaBnGm
        gDPCwK6W/TBiSLnwWLHUqh3mEyHg09YJD5TPvAjnsQ==
X-Google-Smtp-Source: AMsMyM4XnutzWavl2CaDfCXL+NDneRFi94v1QO+dssMzMZyLaX2H7s4OEN4i8mf8M3e074LWZ65Q0+cFfxQ3DjJdW8U=
X-Received: by 2002:a05:651c:222c:b0:26b:dec5:a4f0 with SMTP id
 y44-20020a05651c222c00b0026bdec5a4f0mr20966207ljq.359.1666916626872; Thu, 27
 Oct 2022 17:23:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Oct 2022 20:23:46 -0400
MIME-Version: 1.0
In-Reply-To: <1666159535-6447-1-git-send-email-quic_c_skakit@quicinc.com>
References: <1666159535-6447-1-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 27 Oct 2022 20:23:46 -0400
Message-ID: <CAE-0n51s94fsxz2Ay7YOs96aL1ScPUQGovbjut3R5m=2yxHnzg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: Update the force mem core bit for GPU clocks
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_tdas@quicinc.com, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2022-10-18 23:05:35)
> From: Taniya Das <quic_tdas@quicinc.com>
>
> There are few GPU clocks which are powering up the memories
> and thus enable the FORCE_MEM_PERIPH always for these clocks
> to force the periph_on signal to remain active during halt
> state of the clock.
>
> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
> Fixes: 3e0f01d6c7e7 ("clk: qcom: Add graphics clock controller driver for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> ---

Applied to clk-fixes
