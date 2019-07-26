Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21886764A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 13:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbfGZLdU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 07:33:20 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:42815 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbfGZLdU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 07:33:20 -0400
X-Originating-IP: 86.250.200.211
Received: from windsurf (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: thomas.petazzoni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id ABC04240014;
        Fri, 26 Jul 2019 11:33:17 +0000 (UTC)
Date:   Fri, 26 Jul 2019 13:33:16 +0200
From:   Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [Regression] Missing device nodes for ETR, ETF and STM after
 CONFIG_UEVENT_HELPER=n
Message-ID: <20190726133316.688a43d8@windsurf>
In-Reply-To: <20190726101925.GA22476@kroah.com>
References: <cfe09a46-462f-633a-37c2-52f8bfc0ffb2@codeaurora.org>
        <20190726070429.GA15714@kroah.com>
        <165028a7-ff12-dd28-cc4c-57a3961dbb40@codeaurora.org>
        <20190726084127.GA28470@kroah.com>
        <097942a1-6914-2542-450f-65a6147dc7aa@codeaurora.org>
        <6d48f996-6297-dc69-250b-790be6d2670c@codeaurora.org>
        <20190726101925.GA22476@kroah.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Fri, 26 Jul 2019 12:19:25 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> > This somehow is not mounting etr, etf, stm devices when uevent-helper is
> > disabled. Anyways as Suzuki mentioned, using devtmpfs does fix the issue.  
> 
> Last I looked (many years ago) mdev requires uevent-helper in order for
> it to work.  I recommend that if you rely on mdev to keep that option
> enabled, or to just use devtmpfs and udev :)

Since Busybox 1.31.0, mdev has gained a daemon mode. In this mode, mdev
runs in the background, and receives uevent through a netlink socket.
So there's been some changes in how Busybox mdev works in recent times.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
