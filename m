Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A70694B8ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 14:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731674AbfFSMni (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 08:43:38 -0400
Received: from ns.iliad.fr ([212.27.33.1]:37930 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727244AbfFSMni (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 08:43:38 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id ECA7720564;
        Wed, 19 Jun 2019 14:43:36 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D084F20186;
        Wed, 19 Jun 2019 14:43:36 +0200 (CEST)
Subject: Re: [PATCH] phy: qcom-qmp: Correct READY_STATUS poll break condition
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
References: <20190604232443.3417-1-bjorn.andersson@linaro.org>
 <619d2559-6d88-e795-76e0-3078236933ef@free.fr>
 <20190612172501.GY4814@minitux>
 <3570d880-2b76-88ae-8721-e75cf5acec4c@free.fr>
Message-ID: <ed29cd18-81de-f90d-474b-30612418a67e@free.fr>
Date:   Wed, 19 Jun 2019 14:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3570d880-2b76-88ae-8721-e75cf5acec4c@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 19 14:43:36 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2019 11:10, Marc Gonzalez wrote:

> Here are my observations for a 8998 board:
> 
> 1) If I apply only the readl_poll_timeout() fix (not the mask_pcs_ready fixup)
> qcom_pcie_probe() fails with a timeout in phy_init.
> => this is in line with your regression analysis.
> 
> 2) Your patch also fixes a long-standing bug in UFS init whereby sending
> lots of information to the console during phy init would lead to an
> incorrectly diagnosed time-out.
> 
> Good stuff!
> 
> Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Tested-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Hello Kishon,

Could you take this patch through your tree?
It fixes a pair of nasty bugs.

I do have a follow-up (trivial) patch on top of this one:
https://lore.kernel.org/patchwork/patch/1088044/

What are your thoughts on the usleep_range issue?
https://lore.kernel.org/patchwork/patch/1088035/

Regards.
