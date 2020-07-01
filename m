Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A15F5210983
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 12:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbgGAKhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 06:37:19 -0400
Received: from onstation.org ([52.200.56.107]:45296 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729939AbgGAKhT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 06:37:19 -0400
X-Greylist: delayed 396 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Jul 2020 06:37:18 EDT
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 48FFB3E8F8;
        Wed,  1 Jul 2020 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1593599442;
        bh=AfMnHuNqEFE1eiUXfPAPZcZ71kvTA3HP878CQfPF7ts=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k/IMfhNWmQ6NBOOlZ3+aH0ZSqT5p2sLBdcXiWAFZevUiEknrJ5Ec1X/PJdCdMmIry
         qjvlc+VNsWJUYWbD4U70mHL5/SsRJrCUsshAkVFRXdDTckyP7UUI6iRZqiriucny6T
         F8w3FHpaKymodReo+y62bolSB++U2keyCZlQJg34=
Date:   Wed, 1 Jul 2020 06:30:41 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: qcom: msm8974: klte: Enable some hardware
Message-ID: <20200701103041.GA3246@onstation.org>
References: <20200630140912.260294-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630140912.260294-1-iskren.chernev@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Iskren,

On Tue, Jun 30, 2020 at 05:09:05PM +0300, Iskren Chernev wrote:
> Enable support for various hw found on the Samsung Galaxy S5:
> - touchkey (the two buttons around the home button)
> - touchscreen
> - notification led
> - wifi
> - external SD card
> 
> Please note that for working wifi the correct firmware is needed. Check [1]
> for links and locations.
> 
> Also note, that to actually run a mainline kernel on the klte, you'd need
> to apply this patch [2]. Any feedback on getting this to run on pure
> mainline are welcome.
> 
> [1] https://gitlab.com/postmarketOS/pmaports/-/blob/master/firmware/firmware-samsung-klte/APKBUILD
> [2] https://gitlab.com/postmarketOS/linux-postmarketos/-/commit/765f55b248cd3b231af8431fe2f2aeca263b4e4b

Good to see more msm8974 support upstream!

Regarding the second patch, that should only be needed in order to
use the GPU on these devices. I hope that patch won't be needed once
IOMMU support is added, which is the last major missing piece in order
to have the GPU working upstream. I posted a RFC patch [3] in January
but didn't get any suggestions. I suspect some kind of memory corruption
since the board gets unstable with that patch.

If that hack patch is still needed to use the GPU once IOMMU support is
in place, then I planned to troubleshoot it further by adding some log
statements to various probe functions with and without that patch to see
the probe order between the various subsystems. I suspect the issue is
that a clock isn't ticking yet.

[3] https://lore.kernel.org/lkml/20200109002606.35653-1-masneyb@onstation.org/T/#u

Brian
