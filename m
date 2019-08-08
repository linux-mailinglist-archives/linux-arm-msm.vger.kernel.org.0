Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C5B86BDC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 22:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732609AbfHHUtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 16:49:05 -0400
Received: from onstation.org ([52.200.56.107]:48160 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbfHHUtF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 16:49:05 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 4419E3E951;
        Thu,  8 Aug 2019 20:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565297344;
        bh=z40sFIjBHuNk0pCItuiinepV2TIRu1yjBoVnwUx5NOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JGVUba8PTiwToxoaWosd/pKnCpxQkzIQ1jOp6hRljC7VdYInraA3TSQ5La6pYIydW
         nQq15llYMdJFiZUkZP1wsBjV+ltDZsHenVynnPC3juvtUVugZssHCooQSpYB0Bt31Q
         gcwvs8AcdQ/iRvCxoLkSGEae5Bz/E6P/g6V4T4iU=
Date:   Thu, 8 Aug 2019 16:49:03 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/15] arm: dts: msm8974: thermal: Add thermal zones for
 each sensor
Message-ID: <20190808204903.GA29281@onstation.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <9e2948528c789225bf8a6ef458b83a5350a7ea26.1564091601.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e2948528c789225bf8a6ef458b83a5350a7ea26.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 26, 2019 at 03:48:40AM +0530, Amit Kucheria wrote:
> msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
> zone for each of those sensors to expose the temperature of each zone.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Tested-by: Brian Masney <masneyb@onstation.org> # msm8974

