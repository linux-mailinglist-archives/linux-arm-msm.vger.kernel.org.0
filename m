Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7343FE6076
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 06:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfJ0FKF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 01:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfJ0FKF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 01:10:05 -0400
Received: from localhost (mobile-166-176-122-39.mycingular.net [166.176.122.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B51BC2070B;
        Sun, 27 Oct 2019 05:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572153005;
        bh=0KPtbu+U8QCTTjDe8k2Ho9jdq3eW4pJz72l/7dPDUsM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tBFFw133ci0u3+3NDirVSxMsmU6qu+zp2pRWpFl5BXBN+U4eOEIKGcmY+cALe7nF0
         fzuLRXsH7G+r9CjvWDbcEsgMf+KboTBgS240G66mWIJi3cyww1ueV9z1IIagEGxcuF
         D+/4z4rGvBb8UvtaI0fIwcf54rkVLQhVmECNpAyg=
Date:   Sun, 27 Oct 2019 00:10:03 -0500
From:   Andy Gross <agross@kernel.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 10/15] arm64: dts: msm8998: thermal: Add interrupt
 support
Message-ID: <20191027051003.GD5514@hector.lan>
Mail-Followup-To: Amit Kucheria <amit.kucheria@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
        devicetree@vger.kernel.org
References: <cover.1571652874.git.amit.kucheria@linaro.org>
 <2735b57bb1e9477926bfef6f6b8ff84b926f5a1b.1571652874.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2735b57bb1e9477926bfef6f6b8ff84b926f5a1b.1571652874.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 04:05:29PM +0530, Amit Kucheria wrote:
> Register upper-lower interrupts for each of the two tsens controllers.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Applied for 5.5

Andy
