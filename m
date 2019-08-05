Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06FBD80FDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2019 02:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbfHEAzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Aug 2019 20:55:07 -0400
Received: from onstation.org ([52.200.56.107]:60648 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbfHEAzH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Aug 2019 20:55:07 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9806F3E911;
        Mon,  5 Aug 2019 00:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1564966506;
        bh=xcJu39yh/KDbuEIVcLZj8MtcXthNXhETiQXbPkx9TMw=;
        h=Date:From:To:Subject:From;
        b=Ul50OO+SV1rF0RHepUkaRaq00xhue/4JlkoXCxziDLMJ4+0whaLKRvqYO89GLY1VE
         CXaERLCZ00SvtVFW2eb31q/bfiOTnTHWjM3lz0BE5+c7znvfOw6MHW7NewVEfMED9g
         B09U/uhqU1K/u6mbGgaADkIq4CCOfoowmZTQlIXE=
Date:   Sun, 4 Aug 2019 20:55:06 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Mainline status update for the Nexus 5 phone (qcom msm8974 SoC)
Message-ID: <20190805005506.GA17695@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

There's been a fair bit of development effort to get the LG Nexus 5
working with a mainline kernel. Here is a brief summary of what's
working upstream as of this week:

- Display - X11, Wayland, and text mode work. No GPU yet however
  out of tree patches are available. I'm slowly working on proper
  support for inclusion upstream.
- Display backlight
- Touchscreen
- WiFi
- USB
- gyroscope / accelerometer
- magnetometer
- temperature / humidity / barometer
- proximity / ambient light sensor (ALS)
- Charger
- Serial port

See https://masneyb.github.io/nexus-5-upstream/ for more details. I
created a TODO list at
https://masneyb.github.io/nexus-5-upstream/TODO.html with links to
existing out-of-tree code in case anyone out there is looking for a
project.

The Nexus 5 uses the Qualcomm msm8974 SoC, and some of this work (such
as the display) should help other devices like the Fairphone 2, OnePlus
One, Samsung Galaxy S5, Sony Xperia Z1, and Sony Xperia Z2 tablets.

postmarketOS (https://postmarketos.org/) can be used as the userspace
to run the latest version of Alpine Linux.

Thank you to all of the maintainers and reviewers that have provided
feedback on this work. I picked this up as a side project last year and
have learned a lot doing this.

Brian
