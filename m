Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FC23B87EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 19:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhF3RtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 13:49:25 -0400
Received: from ixit.cz ([94.230.151.217]:45168 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229852AbhF3RtZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 13:49:25 -0400
X-Greylist: delayed 470 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Jun 2021 13:49:24 EDT
Received: from [192.168.1.138] (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id BB65D23B1D;
        Wed, 30 Jun 2021 19:39:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625074744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=XcYnCM/vBMKcw+LIcx+RAmXLSgw7/fRGxOoIkWaORd0=;
        b=mapOVZuRunzs5qG73++dG5+DjAxmYM6PXf7/NXT24hb75Wgkh0KzVom9QQEkdHxN3mGQaX
        pxwys+Ka4C6CC7x0lqm2scQvvrvknIzpfKvWxRuZOPnnXKh7j+xa4GxeX5ahvfylHA5PIf
        WYl6h7/DwrA0O5elwbGbHag69wdFiK4=
Date:   Wed, 30 Jun 2021 19:38:17 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: "soc: qcom: mdt_loader: Support loading non-split images" breaks
 wcnss fw loading on Nexus 7
To:     bjorn.andersson@linaro.org, jeffrey.l.hugo@gmail.com,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, David Heidelberg <david@ixit.cz>
Message-Id: <TNZIVQ.NUOZ8IPZF0UA1@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kernel: stable-5.10.y
HW: chipset APQ8064, Nexus 7 2013 (codename flo or deb)
Problem first occured when I was porting Nexus from 4.19 to 5.4 LTS.

Hello,

after reverting this particular commit ( 
498b98e939007f8bb65094dfa229e84b6bf30e62 ), I'm able do

echo 'start' > 
/sys/devices/platform/soc/3200800.riva-pil/remoteproc/remoteproc0/state

[ 64.271634] remoteproc remoteproc0: powering up 3200800.riva-pil
[ 64.276210] remoteproc remoteproc0: Booting fw image wcnss.mdt, size 
6804
[ 70.087107] remoteproc remoteproc0: remote processor 3200800.riva-pil 
is now up
[ 70.100817] qcom_wcnss_ctrl remoteproc0:smd-edge.WCNSS_CTRL.-1.-1: 
WCNSS Version 1.4 1.2
[ 70.124279] wcn36xx: mac address: 18:00:2d:88:9c:a9
[ 95.357907] wcn36xx: firmware WLAN version 'WCN v2.0 RadioPhy 
vIris_TSMC_2.0 with 48MHz XO' and CRM version '201080'
[ 95.357938] wcn36xx: firmware API 1.4.1.2, 41 stations, 2 bssids

with current stable-5.4.y - stable-5.10.y (cannot test later since it 
crashes without saving pstore dmesg):

[ 50.972560] remoteproc remoteproc0: powering up 3200800.riva-pil
[ 50.977121] remoteproc remoteproc0: Booting fw image wcnss.mdt, size 
6804
[ 50.977166] remoteproc remoteproc0: Failed to load program segments: 
-22
[ 50.977225] remoteproc remoteproc0: Boot failed: -22

These logs are from 5.10 LTS. Firmware files are untouched between 
kernel versions.

I'll be very grateful for any tips or patches to test (best against 
5.10, I haven't been able to fix and run later versions yet)
Best regards
David Heidelberg


