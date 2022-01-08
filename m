Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519AA488705
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jan 2022 00:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbiAHX44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Jan 2022 18:56:56 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:2270 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229974AbiAHX4z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Jan 2022 18:56:55 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4JWcSj2Nmgz9c;
        Sun,  9 Jan 2022 00:56:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1641686214; bh=Z2n6Y6Sf4Y6Bf2Ppe85jypN2n8Y8lV1D9040Mx5hpos=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ni4KnjOtn+hCc9wZqB4O1lyd/SQvYGeDveDJiVEyqIzfK9xa+8kQssISAVkp10OOS
         QJG+E4XBi/DI9IrVihm8pNKRfTZCFWiUpeYSaANqHiLQuq0Ni5+Hq9janns3FG36Kf
         HRKczCvbqcseuavdP2cQwxe7fy71FhFJj6Gm6Y4uGMMVMQSeRiX37DK+TgkZiuj3fa
         u28xFMriqr/zJvK9WXZtbO48c35IRJ1q6hNu/DUpyyFQUSD8XVJ//1ciCunkK6TGIC
         W3OZnrCmSV3xtiEnJdTHJ2fKvOUk+pZzPnn8646Ku8Z1lL9KH0tHYrreIjGwZuj/iD
         1zclsDw8lR1IQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.4 at mail
Date:   Sun, 9 Jan 2022 00:56:51 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/dp: Move DisplayPort helpers into separate
 helper module
Message-ID: <Ydokw2y6w9JlCsgR@qmqm.qmqm.pl>
References: <20211215104318.18866-1-tzimmermann@suse.de>
 <20211215104318.18866-4-tzimmermann@suse.de>
 <87pmpy3za7.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmpy3za7.fsf@intel.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 15, 2021 at 01:04:00PM +0200, Jani Nikula wrote:
> On Wed, 15 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > 	* move DP helper code into dp/ (Jani)
> 
> I suggested adding the subdirectory, but I'm going to bikeshed the name,
> which I didn't suggest.
> 
> $ find drivers/gpu/drm -mindepth 1 -maxdepth 1 -type d | wc -l
> 68

Maybe the hardware-specific drivers could be moved up to drivers/gpu/
instead? That would make it obvious what code is generic and what is not.

Best Regards
Micha³ Miros³aw
