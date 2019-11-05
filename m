Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853A3EF19D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 01:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbfKEABb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 19:01:31 -0500
Received: from onstation.org ([52.200.56.107]:44462 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728234AbfKEABb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 19:01:31 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 465E43E88C;
        Tue,  5 Nov 2019 00:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1572912090;
        bh=taJalr9ULaeTpvFha/eSrqk1aU8+Dlc81UWCxgyIWYM=;
        h=Date:From:To:Cc:Subject:From;
        b=MAzUzpIp+9/lO1CVwmOHkttx44ezWf0vlhhd+EiWAdxYkKJN0LKriYHULJF2Xswes
         SnWdiEs2nA59BagwT9FdQesRgU8/yzg7VEkNyuMSzz/g1HeyU8aJ+Gjk7XuoasehQE
         7gBj3ClZMgqzBzP3sK24IWK4MFXGY4Gg9Ihb1SFE=
Date:   Mon, 4 Nov 2019 19:01:29 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Rob Clark <robdclark@chromium.org>
Cc:     Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: drm/msm: 'pp done time out' errors after async commit changes
Message-ID: <20191105000129.GA6536@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Rob,

Since commit 2d99ced787e3 ("drm/msm: async commit support"), the frame
buffer console on my Nexus 5 began throwing these errors:

msm fd900000.mdss: pp done time out, lm=0

The display still works.

I see that mdp5_flush_commit() was introduced in commit 9f6b65642bd2
("drm/msm: add kms->flush_commit()") with a TODO comment and the commit
description mentions flushing registers. I assume that this is the
proper fix. If so, can you point me to where these registers are
defined and I can work on the mdp5 implementation.

Thanks,

Brian
