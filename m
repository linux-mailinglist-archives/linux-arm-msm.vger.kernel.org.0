Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F66421FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 09:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232892AbhJEHwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 03:52:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:37516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232834AbhJEHwa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 03:52:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DC79610FC;
        Tue,  5 Oct 2021 07:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633420240;
        bh=9l2mJUM8P5HtB5bff6tB0MR13WiG5f7SZZjCmx9SBjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jy0ZerDv+HhEHkwlfLSGJn2EsZ2ZYR0wpE8WuQlLTSd+pZ5u+QpSXXl1sWTsqixVr
         ymMiQ9tknp4YlmKwYb6dHPCc0uIXktQiiGwzPaRfl4G1FvAm+4BxTHxb24guLZM0HY
         PiKO6YgIxHjpMt3f9Cd/5rO4U1d1W9Xi2B/9ahhsfsKxQ/1Mubzd7v9ZThb+cDlcSX
         Ph0ViVUqvh/mtAKXtsVEuDxZ1Ps/GohN26KwP1WfJ6ydMmxACida2Yi/7xvClbAW4L
         KHSyxp1nxIoF0Qr44jEdFL03HZkagJythVyC/+r51TzrX0ghHgqX1wOpbFw425/FIK
         WYT/uT9hvQ26w==
Date:   Tue, 5 Oct 2021 13:20:36 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add QCM2290 USB3 PHY support
Message-ID: <YVwDzGCh6jDbACPr@matsya>
References: <20210927064829.5752-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927064829.5752-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-09-21, 14:48, Shawn Guo wrote:
> The series adds support for USB3 PHY found on QCM2290 SoC.

Applied, thanks

-- 
~Vinod
