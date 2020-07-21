Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FF922896E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 21:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgGUTrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 15:47:05 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:62520 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728683AbgGUTrE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 15:47:04 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Jul 2020 12:47:03 -0700
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 21 Jul 2020 12:47:03 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id A64F415AF; Tue, 21 Jul 2020 12:47:03 -0700 (PDT)
Date:   Tue, 21 Jul 2020 12:47:03 -0700
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] nvmem: qcom-spmi-sdam: Enable multiple devices
Message-ID: <20200721194703.GA30565@codeaurora.org>
Mail-Followup-To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <1594684888-19090-1-git-send-email-gurus@codeaurora.org>
 <b6f5edf4-2b1c-349c-d070-ac7bc76af42d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6f5edf4-2b1c-349c-d070-ac7bc76af42d@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 09:49:22AM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 14/07/2020 01:01, Guru Das Srinagesh wrote:
> >Specifying the name of the nvmem device while registering it with the
> >nvmem framework has the side effect of causing the second instance of a
> >device using this driver to fail probe with the following error message:
> >
> >   sysfs: cannot create duplicate filename '/bus/nvmem/devices/spmi_sdam'
> >
> >Removing the name allows the nvmem framework to assign a monotonically
> >increasing integer id to each instance of this driver automatically,
> >like so:
> >
> >   /sys/bus/nvmem/devices # ls
> >   nvmem0  nvmem1  nvmem2
> >
> >Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> >---
> >  drivers/nvmem/qcom-spmi-sdam.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> >diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> >index 8682cda..6275f14 100644
> >--- a/drivers/nvmem/qcom-spmi-sdam.c
> >+++ b/drivers/nvmem/qcom-spmi-sdam.c
> >@@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> >- * Copyright (c) 2017 The Linux Foundation. All rights reserved.
> >+ * Copyright (c) 2017, 2020 The Linux Foundation. All rights reserved.
> >   */
> >  #include <linux/device.h>
> >@@ -140,8 +140,6 @@ static int sdam_probe(struct platform_device *pdev)
> >  	sdam->size = val * 32;
> >  	sdam->sdam_config.dev = &pdev->dev;
> >-	sdam->sdam_config.name = "spmi_sdam";
> >-	sdam->sdam_config.id = pdev->id;
> 
> Please use new flag NVMEM_DEVID_AUTO introduced in https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git/commit/?h=for-next&id=93ac5fdba1eddc679e9694b64f2fa321317df988
> instead of pdev->id, which should fix the issue.

Thank you for pointing this out, I've uploaded a v2 using this flag.

Thank you.

Guru Das.
