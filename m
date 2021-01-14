Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0392F6ECA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 00:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730938AbhANXG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 18:06:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730936AbhANXG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 18:06:27 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C09DC061757;
        Thu, 14 Jan 2021 15:05:47 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 801033F0AF;
        Fri, 15 Jan 2021 00:05:45 +0100 (CET)
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-msm8998: Mark gpu_cfg_ahb_clk as
 critical
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        DTML <devicetree@vger.kernel.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
 <20210114221059.483390-6-angelogioacchino.delregno@somainline.org>
 <CAOCk7NoVts21FjhhLtZp-0Xdw6-BnrKio_-tuZBRsgapsUdwfw@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <25d40e7d-fbd6-697f-7d4d-a7233aeb652c@somainline.org>
Date:   Fri, 15 Jan 2021 00:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7NoVts21FjhhLtZp-0Xdw6-BnrKio_-tuZBRsgapsUdwfw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 14/01/21 23:37, Jeffrey Hugo ha scritto:
> On Thu, Jan 14, 2021 at 3:13 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>>
>> The GPU IOMMU depends on this clock and the hypervisor will crash
>> the SoC if this clock gets disabled because the secure contexts
>> that have been set on this IOMMU by the bootloader will become
>> unaccessible (or they get reset).
>> Mark this clock as critical to avoid this issue when the Adreno
>> GPU is enabled.
>>
> 
> You should go review the last attempt to do this -
> https://lkml.org/lkml/2019/12/17/881
> 

Thanks for the tip, but unfortunately this isn't possible on the 
gpu_cfg_ahb_clk, as it is also needed for the Adreno IOMMU, which has 
secure contexts that are set up from one of the bootloader stages and if 
you reset/"mess up" one of them (by - in this case - un-clocking the 
MMU), then the hypervisor will kick in and generate a fault, rebooting 
the SoC.

Of course, this scenario is for the case in which you want to boot the 
device without any gpucc nor any runtime pm user of that.. and the 
aforementioned issue makes that solution not really usable.

Again, unfortunately.
