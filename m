Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB544132070
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 08:28:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgAGH2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 02:28:13 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:54407 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgAGH2N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 02:28:13 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 147F43F802;
        Tue,  7 Jan 2020 08:28:10 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=flawful.org header.i=@flawful.org header.b=c85HOvOQ;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=flawful.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yaDjQPufIJux; Tue,  7 Jan 2020 08:28:09 +0100 (CET)
Received: from flawful.org (ua-84-217-220-205.bbcust.telenor.se [84.217.220.205])
        (Authenticated sender: mb274189)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 93E593F595;
        Tue,  7 Jan 2020 08:28:08 +0100 (CET)
Received: by flawful.org (Postfix, from userid 1001)
        id 9F2777D3; Tue,  7 Jan 2020 08:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flawful.org; s=mail;
        t=1578382087; bh=tnzsZ8mdTwEiMWFTfrnl9vn0sxTVhquSnNtRwsMD9tI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c85HOvOQhk3wevv8jlvpu4WJ97wJhym835xX+QX1ZnsUS00BR4OWw7cvFWXr+T2X0
         hUZZkcljGzzsavDVqUBPLNTjSk0nK6wAXIQ14hm9LkvMszoZUF845+u/moN/y+DF+M
         S3iMrnvcl/sNWA0Ruf8WaqT0VuLsjMdWIcUZuhXs=
Date:   Tue, 7 Jan 2020 08:28:07 +0100
From:   Niklas Cassel <nks@flawful.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20200107072807.2afp3bg7uopzxr4b@flawful.org>
References: <20200103111429.1347-1-nks@flawful.org>
 <20200105071620.04B872085B@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200105071620.04B872085B@mail.kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 04, 2020 at 11:16:19PM -0800, Stephen Boyd wrote:
> Quoting Niklas Cassel (2020-01-03 03:14:29)
> > From: Niklas Cassel <niklas.cassel@linaro.org>
> > 
> > Allow accessing the parent clock names required for the driver operation
> > by using the device tree 'clock-names' property, while falling back to
> > the previous method of using names in the global name space.
> > 
> > This permits extending the driver to other platforms without having to
> > modify its source code.
> > 
> > Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> > ---
> 
> Applied to clk-next
> 

Hello Stephen,

It has been 3 days, but I still can't find this in:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-next

Did you perhaps forget to push your branch, or am I simply being to eager? :)

Kind regards,
Niklas
