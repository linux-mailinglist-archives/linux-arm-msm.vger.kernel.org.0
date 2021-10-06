Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1745D423E05
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 14:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238337AbhJFMt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 08:49:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:33684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229894AbhJFMt2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 08:49:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF58660F59;
        Wed,  6 Oct 2021 12:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633524456;
        bh=tTQVklaQ/ldVLqaoEK1050e3eup4oM5ED69uVhqEmSo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kl7HkcYSlA5eh1NwBNeZasuALZA6nFX5EtgDlzo5SclCOpq0vmtzwzBYscFYfkHBD
         1UxWTCmLKoO1hrWIy05JfryPwMBkltkYgu/kCXSP705D+h8CgetgOmyfKQiZAKfBDs
         +osIlln5+g87KtAF8PpBBstrU20CWwzZ6U1cEomEj0I7Jz5P0OvoONsTHcPbadcPof
         qa8ia7v1UYz7rJVZ/jMGvbPCkv32B7fLDl1I7rjVeT4U1POqWUen5UEgbKKFUCEJ2E
         B5HxRQxyLXdvr6yPrC/oPtHb3QKTH+tER39egWbeojdfWs9FaeM2Rduy0n/d/c+2Sq
         Q5WJm/ErR7ATw==
Date:   Wed, 6 Oct 2021 18:17:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     abhinavk@codeaurora.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/disp/dpu1: Add support for DSC
 in encoder
Message-ID: <YV2a5MzDUWMTotpP@matsya>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-9-vkoul@kernel.org>
 <70d5abae07b4dbf63d8dbf47ba31262d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70d5abae07b4dbf63d8dbf47ba31262d@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-08-21, 17:57, abhinavk@codeaurora.org wrote:
> On 2021-07-14 23:52, Vinod Koul wrote:
> > When DSC is enabled in DT, we need to configure the encoder for DSC
> > configuration, calculate DSC parameters for the given timing.
> > 
> > This patch adds that support by adding dpu_encoder_prep_dsc() which is
> > invoked when DSC is enabled in DT
> correct me if wrong but this commit text is not valid anymore in my opinion.
> are there any params you are getting from DT now? I thought its all coming
> from the panel
> driver directly.

Yes thanks for spotting this, updated!

> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> agree with dmitry's comment's
> https://patchwork.freedesktop.org/patch/444078/?series=90413&rev=2
> 
> instead of dsc being part of priv->dsc it should be per encoder.
> 
> On top of his comment, I also think that like on the newer chipsets, moving
> the dsc related
> encoder configuration to a dpu_encoder_dce.c will help for future expansion
> of other topologies
> and also for other compression algorithms.

As replied to Dimitry, the DP and other topology support needs to be
comprehended so this should be done when we know how DP, other
compression algorithms and other topologies would be modeled here :)

-- 
~Vinod
