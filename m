Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B8A3A2CF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 15:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhFJNaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 09:30:10 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59082 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230250AbhFJNaJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 09:30:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623331693; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=zdh8Ve3I0bYMzcTgGWZH5OZKHgsbwm12U3W/MB8rCAU=; b=hQ2DNeNuam25rCYC38PGoZIt2LgA+sAbzwuSZO9o8OKqTvvWLC7QH/Kgc9FqXcwY6Yhb0XWV
 fDjUM+PI+zO6TkSRo617jg5tGlEPZYSovMaKdc3QXJR0Mm0mG8GOE2HlkL/5mB0oSHo94HA3
 DKybYpxfSYqv05vhbg1oZ3QR8kA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60c21367e27c0cc77f28bd90 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 10 Jun 2021 13:28:07
 GMT
Sender: vhiren=codeaurora.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0531C433D3; Thu, 10 Jun 2021 13:28:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: vhiren)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7CA7C433F1;
        Thu, 10 Jun 2021 13:28:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 10 Jun 2021 18:58:04 +0530
From:   vhiren@codeaurora.com
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        nitirawa@codeaurora.org
Subject: Re : Query on UFS Lun detection
Message-ID: <d60373362ed41b49f763cdb46c9973e2@codeaurora.com>
X-Sender: vhiren@codeaurora.com
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Community,

We are using UFS as a boot device, and we encountered an error, 
mentioned below while booting through UFS.


APPS Crash - Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(8,7)

Here in Kernel command line we are passing "root=sda7", this is our 
Filesystem partition to be mounted.

While debugging the same we observed the partition which is suppose to 
be mounted as Filesystem is not enumerated  itself.
The reason behind not enumerating of partition is, the other Lun got 
detected first instead of one which is having FS partition.

We are using async probe, hence we know the detection will happen in 
async way,


In working case :  it looks like below

sd 0:0:0:0: sda1 sda2 sda3 sda4 …..sda8

sd 0:0:0:1: sdb1 sdb2
Here, sd 0:0:0:0 Lun got detected first and enumerated as "sdaN", we 
have FS partition as "sda7" and so we don’t see above mentioned error.


In non working case : it looks like below

sd 0:0:0:0: sdb1 sdb2 sdb3 sdb4 …..sdb8

sd 0:0:0:1: sda1 sda2
Here, sd 0:0:0:1 Lun got detected first and enumerated as "sdaN" but we 
don’t have FS partition in this Lun. Instead FS partition now became 
"sdb7".


Observation here is, which ever Lun gets detected first it will have 
"sda" enumeration and so on.
However, sdx’s driver scsi/sd.c uses async probe to improve performance, 
meaning sdx disks are created in parallel. Whoever calls 
device_add_disk() first becomes sda, the next become sdb….


Is there any way, where we can fix this in the Lun detection part of 
code?

Thank You,
Regards,
Hiren Gohel
