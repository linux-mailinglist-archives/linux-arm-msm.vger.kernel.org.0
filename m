Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D611A3C3AF9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jul 2021 09:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhGKHSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Jul 2021 03:18:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:47690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229544AbhGKHSi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Jul 2021 03:18:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 833B561351;
        Sun, 11 Jul 2021 07:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625987751;
        bh=z58bNMM3hhzvbsV96yCZjMHGp/nJ0qCVyPILy3am8HU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cf1jGehHwUfnZ1auuGFj3S0WyxDdCMMrIZBILqFQWGphqz7heQfZm+nM6JuHoXxHX
         tjgUbcJH2JaSPvb0FugFPlzTJwVGbNo+YFORJ3lJXFudDrcDHbQK9Whey1Ef+S+ZZj
         GTuSKgWA+0xYqjPQxKObD9mPciknCK7BPU9Ts3Lmes3Z+/JU5Q7cM7uzk18vgsfzdF
         x5Kfr7xikcWs8tZT19MWcUHHqA031byq7IJFnJGOmSv1DlEq499aEG2rkypv+KdfqS
         wp61a3qPH6c4cTNt28iRI7SSguolvSHG7jnDo+b475WUcvFnIGiqjL2h4te6Cw1nAA
         O/E9EJa96i50A==
Date:   Sun, 11 Jul 2021 15:15:46 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: c630: fix correct powerdown pin for
 WSA881x
Message-ID: <20210711071545.GA621@dragon>
References: <20210706083523.10601-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706083523.10601-1-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 06, 2021 at 09:35:23AM +0100, Srinivas Kandagatla wrote:
> WSA881x powerdown pin is connected to GPIO1, GPIO2 not GPIO2 and GPIO3,
> so correct this. This was working so far due to a shift bug in gpio driver,
> however once that is fixed this will stop working, so fix this!
> 
> For some reason we forgot to add this dts change in last merge cycle so
> currently audio is broken in 5.13 as the gpio driver fix already landed
> in 5.13.
> 
> Reported-by: Shawn Guo <shawnguo@kernel.org>
> Fixes: 45021d35fcb2 ("arm64: dts: qcom: c630: Enable audio support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Tested-by: Shawn Guo <shawnguo@kernel.org>
