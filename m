Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFDF8E607C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2019 06:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfJ0FKs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Oct 2019 01:10:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:42164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbfJ0FKr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Oct 2019 01:10:47 -0400
Received: from localhost (mobile-166-176-122-39.mycingular.net [166.176.122.39])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D81E52070B;
        Sun, 27 Oct 2019 05:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572153047;
        bh=fR3J0Yiuur5GlWgRzW26kRTaeBLOZs7wD1pSjsB7uYY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vfLx9opK11r0NGXZ13CGtf3mSq9wZB8WMwBkchZdIismbfgLauZLCqlrQGzJze/LT
         Vpr4aZEXSlmDGrNZtkw6yPn8/BV2PqQx+XY6Fc6Qvt/s9kVcn4oasgP5IY5toHyZwF
         eBMtlgoaxFnS7SHA64I4EtspXm2F0DJpQARzVRbo=
Date:   Sun, 27 Oct 2019 00:10:45 -0500
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
Subject: Re: [PATCH v6 08/15] arm64: dts: sdm845: thermal: Add interrupt
 support
Message-ID: <20191027051045.GF5514@hector.lan>
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
 <5a96df48e546576f90081bbde218e7cff88ae8ce.1571652874.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a96df48e546576f90081bbde218e7cff88ae8ce.1571652874.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 21, 2019 at 04:05:27PM +0530, Amit Kucheria wrote:
> Register upper-lower interrupts for each of the two tsens controllers.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---

Applied for 5.5

Andy
