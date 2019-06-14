Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432AD45B59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 13:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfFNLYu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 07:24:50 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54782 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727119AbfFNLYu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 07:24:50 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 92D7A2046B;
        Fri, 14 Jun 2019 13:24:48 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 7BD2520186;
        Fri, 14 Jun 2019 13:24:48 +0200 (CEST)
Subject: Re: [PATCH v3] iommu/arm-smmu: Avoid constant zero in TLBI writes
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <f523effd-ef81-46fe-1f9e-1a0cb42c8b7b@free.fr>
 <20190529130559.GB11023@fuggles.cambridge.arm.com>
 <84791515-e0ae-0322-78aa-02ca0b40d157@free.fr>
 <09a290f1-27a0-5ee3-16b9-659ef2ba99dc@free.fr>
 <20190612081051.GD21613@8bytes.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <3939f36f-eb7b-b165-426a-1beed23bf4a9@free.fr>
Date:   Fri, 14 Jun 2019 13:24:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612081051.GD21613@8bytes.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jun 14 13:24:48 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ Trimming recipients to minimize inconvenience ]

On 12/06/2019 10:10, Joerg Roedel wrote:

> On Mon, Jun 03, 2019 at 02:15:37PM +0200, Marc Gonzalez wrote:
> 
>>  drivers/iommu/arm-smmu.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> Applied, thanks. It should show up in linux-next in the next days.

Almost there... Should be in tomorrow's next.

https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/log/?h=next
https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/commit/?h=next&id=4e4abae311e4b44aaf61f18a826fd7136037f199

Regards.
