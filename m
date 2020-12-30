Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066502E7CFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 23:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgL3WiX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 17:38:23 -0500
Received: from onstation.org ([52.200.56.107]:47508 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgL3WiW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 17:38:22 -0500
X-Greylist: delayed 589 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Dec 2020 17:38:22 EST
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9A1923F04D;
        Wed, 30 Dec 2020 22:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1609367272;
        bh=T+KDQhOLKxhX3SFrj9937REjkmjQU64N6sgNdRFgPt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PNGG0u6hSHPqdugFjpfO6k/Q6o/cDhaAZoVV/0oR14dAbjIY0PuD/47GsLI3umxuR
         fpBoQuSuIdky4JI+PbIMwTaaZHW9Oa/wfsHunTlLBYuKDvRdHuuu6+Rw62EDlutzBl
         i9Vgd0vxXEA2g57A1vSJ1fwwQWOcxnUVTumh6gPs=
Date:   Wed, 30 Dec 2020 17:27:52 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add gpu support
Message-ID: <20201230222752.GC8627@onstation.org>
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230155132.3661292-1-iskren.chernev@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 30, 2020 at 05:51:29PM +0200, Iskren Chernev wrote:
> From: Brian Masney <masneyb@onstation.org>
> 
> Add support for the a3xx GPU
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Reviewed-by: Brian Masney <masneyb@onstation.org>

