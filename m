Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898A52823BB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 12:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgJCK6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Oct 2020 06:58:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:45610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgJCK6p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Oct 2020 06:58:45 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25745206CA;
        Sat,  3 Oct 2020 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601722725;
        bh=uFVhoBussJDdpm1+WgGs2qiAeM+JfCpjaUV85968YSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X/4V0Posa8zRrMR7Xoq1Ojy3liMEtL5fjFjbnXeH2t7h2ZsY8mnMua05++Dk/5n3l
         YaBD900kDc55pmi2oqTOPLk3Anf1ae8lhbphmUJTFo3ULArhjo/0QG84c8+8h4TMlB
         fHhng6xfFpXhOSXIbcl+mntcNvpSbUEXeuwCGwUo=
Date:   Sat, 3 Oct 2020 12:56:53 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Some small cleanup/fixes for SPMI driver
Message-ID: <20201003105653.GA117381@kroah.com>
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
 <160167373743.310579.11803841154320142421@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160167373743.310579.11803841154320142421@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 02, 2020 at 02:22:17PM -0700, Stephen Boyd wrote:
> Quoting Mauro Carvalho Chehab (2020-09-28 23:22:11)
> > Hi Stephen,
> > 
> > While double-checking against yesterday's linux-next, I noticed
> > that those two patches weren't merge yet. 
> > 
> > As you replied to both with your Reviewed-by:, are you expecting
> > them to be merged via someone's tree, or are you intending
> > to merge them via your tree?
> 
> Per the maintainers file I am a reviewer not a maintainer of SPMI.
> Usually Greg applies patches here. I can collect patches and send them
> on up if that helps.

Who is the maintainer?  Having a "reviewer only" is confusing to
everyone involved, as you might have someone who can review patches, but
no one to actually merge them anywhere?

Not a good situation :(

greg k-h
