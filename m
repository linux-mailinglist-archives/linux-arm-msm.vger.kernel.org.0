Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C2DE60CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 06:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbfJ0Fkf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 01:40:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:47476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbfJ0Fkf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 01:40:35 -0400
Received: from localhost (mobile-166-176-122-39.mycingular.net [166.176.122.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C453A214AF;
        Sun, 27 Oct 2019 05:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572154834;
        bh=OCCaBp16e3xCiP3x2aFhaCuEsNQYB+FJTD6/O6dDB/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yxH8TJGIoLm8wYTgCeKTBsSzrMCNYZtdpVl78uoG3QcgwxdsipVakls+pltc//hRR
         EfB3w4q/uKAvewT5GJBKFCLDXsAAlVgA5KEi3AmLeKQjQSdC2KO21jCGdcMhugN2OS
         O8ElmD2lJIsnPKC5R724gktVczIZkWodm5i+df34=
Date:   Sun, 27 Oct 2019 00:40:32 -0500
From:   Andy Gross <agross@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-cheza: delete zap-shader
Message-ID: <20191027054032.GI5514@hector.lan>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191025212106.2657-1-robdclark@gmail.com>
 <CAD=FV=VqNpttUXQZ7KUd1ahsDrxST9BVoy9NXCM+xhQb9aRb1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=VqNpttUXQZ7KUd1ahsDrxST9BVoy9NXCM+xhQb9aRb1A@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 25, 2019 at 02:28:22PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 25, 2019 at 2:23 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This is unused on cheza.  Delete the node to get ride of the reserved-
> > memory section, and to avoid the driver from attempting to load a zap
> > shader that doesn't exist every time it powers up the GPU.
> >
> > (This also avoids a massive amount of dmesg spam about missing zap fw.)
> 
> optional nit: maybe when this is applied Bjorn / Andy can put in the
> actual error message to make this easier to find if anyone is seeing
> this problem.  Specifically:
> 
>   msm ae00000.mdss: [drm:adreno_request_fw] *ERROR* failed to load
> qcom/a630_zap.mdt: -2
>   adreno 5000000.gpu: [drm:adreno_zap_shader_load] *ERROR* Unable to
> load a630_zap.mdt
> 
> 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 2 ++
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> I probably would have put it in two patches (one for sdm845.dtsi and
> one for cheza) but that's more because I'm obsessive-compulsive than
> for any real reason.  ;-)  In any case:
> 
> Fixes: 3fdeaee951aa ("arm64: dts: sdm845: Add zap shader region for GPU")
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Tested-by: Douglas Anderson <dianders@chromium.org>

Applied this patch and added in the dmesg error messages.

Andy
