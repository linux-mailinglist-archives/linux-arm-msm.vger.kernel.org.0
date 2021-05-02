Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1016F370995
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 03:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhEBBnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 May 2021 21:43:37 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:46222 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhEBBng (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 May 2021 21:43:36 -0400
Date:   Sun, 02 May 2021 01:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1619919764;
        bh=3SxLseZTkFZ7tfPTsDwVPySMmxAXj/CfZ7wDf13aMR4=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=JqFWsVaeFByWFs4qKkz3Ydm8T2ZZxXpIT/8x2Mp+QYsfhZpc8HYltcHrmlD2vX23L
         WNEe5zRBnLH9lweQCe8q4yY3GxuM6RIslMINHfUtXUP53u/z0Raud2J0L87IwC1iBZ
         SLxFT+u6PZK1uEZasDKWqlrUSn7QWWYkgSgwkOnM=
To:     caleb@connolly.tech
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: OnePlus 6 fixups
Message-ID: <20210502014146.85642-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains a few fixes for the OnePlus 6 and 6T.

The display panel driver for the devices currently implements
support for the reset pin.
This behaviour is fine on the 6 but on the 6T it seems to break the
panel. This suggests an issue with the initialisation sequence however
we haven't been able to find a way to bring up the panel without this.
In the mean time, removing the reset capabilities solves the issues for
us and doesn't introduce any other problems.

We also add a guard around the RMTFS memory region, this is implemented
by the msm_sharedmem driver in the vendor kernel, but not a feature
supported by mainline just yet. This is to workaround limitations in
Qualcomms XPU hardware which can trigger false violations and crash the
device if memory is allocated close to the RMTFS region.

Finally, enable the IPA node, modemmanager is gaining support for QRTR
modems and with that we can have mobile data working on the device!

=09^Caleb



