Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1061B29EC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2019 21:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729597AbfEXTEq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 15:04:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727115AbfEXTEq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 15:04:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4291B21848;
        Fri, 24 May 2019 19:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558724685;
        bh=1Otej3DqW8kLZe+otOAU42a39fB+op/iRkL/qfZt6fg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NwJLeqRFtTod+iPoBP/acd7TE4ryKxbyswv6Fpy55OK9uiD+XFkAvnx6y2TJtSsR5
         WsD5YNJLSWx7SKouF3NC7IDgLog9/Gn8ermSMQbQ1dhTfRgWvRgKRYxd3EYIGYnS+9
         yVWCGDay8rhC1zBPnQn4GelPufHKIaDoB4xmCChA=
Date:   Fri, 24 May 2019 21:04:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Muchun Song <smuchun@gmail.com>
Cc:     rafael@kernel.org, benh@kernel.crashing.org, prsood@codeaurora.org,
        mojha@codeaurora.org, gkohli@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        zhaowuyun@wingtech.com
Subject: Re: [PATCH v4] driver core: Fix use-after-free and double free on
 glue directory
Message-ID: <20190524190443.GB29565@kroah.com>
References: <20190516142342.28019-1-smuchun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516142342.28019-1-smuchun@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 16, 2019 at 10:23:42PM +0800, Muchun Song wrote:
> There is a race condition between removing glue directory and adding a new
> device under the glue directory. It can be reproduced in following test:

<snip>

Is this related to:
	Subject: [PATCH v3] drivers: core: Remove glue dirs early only when refcount is 1

?

If so, why is the solution so different?

thanks,

greg k-h
