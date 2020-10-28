Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B8229DF99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 02:03:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730723AbgJ1WMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 18:12:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:56458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730828AbgJ1WMX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:12:23 -0400
Received: from localhost (unknown [122.171.163.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 661D2247E2;
        Wed, 28 Oct 2020 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603901602;
        bh=L+QwKahSKzv/qhtMJwU9ogRRIOuyzLkUT5911oT6gkY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dHBozcDkBKHYTs0Kk0SCBWQhr1BbZjXM2l0gydqBdGpTv7Biwftxmfp43vA0XXd3a
         MQcFMnHQ3VIyOjuZubdb6A1SZsw3xgvx3IRfpD3HfY+OfpMMXvC97xK5Rz2xQDwNF2
         31aKt0G3tnbcddvi5xB7mn7ZHnmmXihUPRArsnLg=
Date:   Wed, 28 Oct 2020 21:43:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH] MAINTAINERS: Add entry for Qualcomm IPQ4019 USB PHY
Message-ID: <20201028161318.GT3550@vkoul-mobl>
References: <20201016204610.2406075-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201016204610.2406075-1-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16-10-20, 22:46, Robert Marko wrote:
> Add maintainers entry for the Qualcomm IPQ4019 USB PHY driver.

Applied, thanks

-- 
~Vinod
