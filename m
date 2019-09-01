Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A93A4C55
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 23:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfIAVkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 17:40:47 -0400
Received: from onstation.org ([52.200.56.107]:48144 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728739AbfIAVkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 17:40:47 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 00BAB3E993;
        Sun,  1 Sep 2019 21:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1567374046;
        bh=yFlCHaBNAh10QurQOZiU1mvxCHhFWTKUbESMNHsI3oM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XMa2krbQak5fj5lyPbJuEKxTSFxIEGMzFR6NbZINT4gbbsTd2Qq1G2J1kUB++owJO
         Sb4idiBvJ08LgumuEeD+bA0zz9/R9n+pypLtqswcMqM0IjMa9MEnRiNI57ldFSPFsC
         4X0cl5mvKy9evzvJ7T1i/DrrnPW6f5aiCI50bxNo=
Date:   Sun, 1 Sep 2019 17:40:45 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, jcrouse@codeaurora.org
Subject: Re: [PATCH v7 0/7] qcom: add OCMEM support
Message-ID: <20190901214045.GA14321@onstation.org>
References: <20190823121637.5861-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823121637.5861-1-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob C / Sean P,

On Fri, Aug 23, 2019 at 05:16:30AM -0700, Brian Masney wrote:
> This patch series adds support for Qualcomm's On Chip MEMory (OCMEM)
> that is needed in order to support some a3xx and a4xx-based GPUs
> upstream. This is based on Rob Clark's patch series that he submitted
> in October 2015 and I am resubmitting updated patches with his
> permission. See the individual patches for the changelog.

I talked to Bjorn in person at the Embedded Linux Conference over a
week ago about this series. He thinks that this series should go through
your tree. I assume it's too late for the upcoming merge window, which
is fine. I just want to make sure that this series gets picked up for
the following merge window.

I just sent out a fix for a compiler error on MIPS as a separate patch:
https://lore.kernel.org/lkml/20190901213037.25889-1-masneyb@onstation.org/

Brian
