Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FC686BE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 22:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390361AbfHHUtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 16:49:36 -0400
Received: from onstation.org ([52.200.56.107]:48184 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732327AbfHHUtf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 16:49:35 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E95C83E951;
        Thu,  8 Aug 2019 20:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565297375;
        bh=mu8Hoth5cBuZwZBgG90FZ5cBUwqlbhYtcYXdI1EvJgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UVobRNgLCZxMG6GJCRZ8mil9Cap/JvY58PprGQQIldZc9C5lv9EflcLkiNI5cGY0m
         8tRuCNuAwiommt+Zto6+r9eeMxLdPaQZdLtye9U4JlUBy5XsSd0xmO+FRjTbB1a0VP
         ZmFlqIwRen1Vk8XShKLKmd5kVWRCre7Vvmx4dHnc=
Date:   Thu, 8 Aug 2019 16:49:34 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/15] arm64: dts: msm8974: thermal: Add interrupt support
Message-ID: <20190808204934.GB29281@onstation.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec8205566eb9c015ad51fbb88f0da7ca60b414fd.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 26, 2019 at 03:48:47AM +0530, Amit Kucheria wrote:
> Register upper-lower interrupt for the tsens controller.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Tested-by: Brian Masney <masneyb@onstation.org>

