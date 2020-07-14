Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519EC21E4FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2020 03:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbgGNBMW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 21:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726364AbgGNBMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 21:12:22 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16879C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 18:12:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l63so6824880pge.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5yjaTy96iRFPTsi26P18yq64D5S2151Zztu56aP2UQk=;
        b=DKREwuM1AdDK/M5PRjMceNQQ5PSr4Xfy3P/tz5j9KLqG7xpQvwFBtF6iqOKNiHJeHz
         0LtGhspN0cAeU/1/I6hlmRFzPP+PakMNDDWkk+6neyLAw6VjOq3PKxLlGjVYFwnl71jY
         CvuZix9jHtiIZKtZpVPiMHxs6yo596oGk6UAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5yjaTy96iRFPTsi26P18yq64D5S2151Zztu56aP2UQk=;
        b=q/4iamc224YHwFilUfkUyuhtx/4iZAOirSC4k5QY/HMLqdKpLRmR2uWJytT9O8Oeed
         QZ+WUkD/yrTDabRkaqCgjpXLvdGnc+EcYLWjZL/DqMplsxZmy0J0NXFWlWR8W3ZRQ7fw
         1zGKY+2GgEX8DibgY02rAweH0r3j6mBCCV9tBctb6w8b6E2Tl0Op3xOcapZayqvXFg/T
         6/Pqpchx2TwF+55Z5pMpSCh21QNZ/dlliolWx/a7TwyC3ZYmunlgaj+FjPgDIS8r5Qck
         puEwFReaKPUg7BjMbTJ7tfa1FB6nhsON2EoFXRoOEBA6UplzjbboU25NpsdcC4yQ0L/W
         qWlA==
X-Gm-Message-State: AOAM531hvCAqAs1jGahRYirKOATEd6pYoYQ37l1PS1SEJbxT//YiHGYn
        KSYYtMiR+wCR0uT1CN8qf45Z1A==
X-Google-Smtp-Source: ABdhPJzURU5w7Tj+O39sbKidAAXjNVHx+XXYlAgKEyC4g8eI7DWw01L8nI4SKvyRTPsf2//G04xEaQ==
X-Received: by 2002:a05:6a00:14ce:: with SMTP id w14mr2275557pfu.121.1594689141507;
        Mon, 13 Jul 2020 18:12:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id e8sm15972489pfl.125.2020.07.13.18.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 18:12:20 -0700 (PDT)
Date:   Mon, 13 Jul 2020 18:12:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        dianders@chromium.org, mkrishn@codeaurora.org,
        travitej@codeaurora.org, nganji@codeaurora.org
Subject: Re: [v1] drm/msm/dpu: add support for clk and bw scaling for display
Message-ID: <20200714011219.GQ3191083@google.com>
References: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1592489321-29213-1-git-send-email-kalyan_t@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 18, 2020 at 07:38:41PM +0530, Kalyan Thota wrote:
> This change adds support to scale src clk and bandwidth as
> per composition requirements.
> 
> Interconnect registration for bw has been moved to mdp
> device node from mdss to facilitate the scaling.
> 
> Changes in v1:
>  - Address armv7 compilation issues with the patch (Rob)
> 
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>

It seems this is an evolution of this series: https://patchwork.kernel.org/project/linux-arm-msm/list/?series=265351

Are the DT bits of the series still valid? If so please include them in the
series, otherwise please add DT patches to allow folks to test and review,
and get them landed in Bjorn's tree after the driver changes have landed.
