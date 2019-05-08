Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9584917B86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 16:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfEHO3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 10:29:20 -0400
Received: from foss.arm.com ([217.140.101.70]:36098 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726670AbfEHO3T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 10:29:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2318BA78;
        Wed,  8 May 2019 07:29:19 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 496BF3F238;
        Wed,  8 May 2019 07:29:14 -0700 (PDT)
Subject: Re: [PATCH v2 00/11] dts: Update DT bindings for CoreSight replicator
 and funnel
To:     leo.yan@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mathieu.poirier@linaro.org, mike.leach@linaro.org,
        xuwei5@hisilicon.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        agross@kernel.org, david.brown@linaro.org,
        linus.walleij@linaro.org, liviu.dudau@arm.com,
        Sudeep.Holla@arm.com, Lorenzo.Pieralisi@arm.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     guodong.xu@linaro.org, zhangfei.gao@linaro.org,
        haojian.zhuang@linaro.org, cphealy@gmail.com, andrew@lunn.ch,
        lee.jones@linaro.org, zhang.chunyan@linaro.org
References: <20190508021902.10358-1-leo.yan@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <9c56323b-7b14-c662-b824-ed60fbb1638f@arm.com>
Date:   Wed, 8 May 2019 15:29:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508021902.10358-1-leo.yan@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/05/2019 03:18, Leo Yan wrote:
> Since the DT bindings consolidatoins for CoreSight replicator and funnel
> is ready for kernel v5.2 merge window [1], this patch set is to update
> the related CoreSight DT bindings for platforms; IIUC, this patch set
> will be safe for merging into kernel v5.2 because the dependency
> patches in [1] will be landed into mainline kernel v5.2 cycle.
> 
> In this patch set, it tries to update below two compatible strings to
> the latest strings:
> 
>    s/"arm,coresight-replicator"/"arm,coresight-static-replicator"
>    s/"arm,coresight-funnel"/"arm,coresight-dynamic-funnel"
> 
> Please note, some platforms have two continuous patches, one is for
> updating static replicator compatible string and another is for dynamic
> funnel change; and other platforms have only one patch since it only
> needs to change for dynamic funnel.

This is now misleading ;-), but that doesn't matter.

For the entire series :

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
