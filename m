Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA6D2F6E5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 23:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbhANWko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 17:40:44 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:49041 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730680AbhANWko (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 17:40:44 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1BB0C3F116;
        Thu, 14 Jan 2021 23:40:02 +0100 (CET)
Subject: Re: [PATCH 1/9] clk: qcom: gcc-msm8998: Wire up gcc_mmss_gpll0 clock
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
References: <20210109134617.146275-1-angelogioacchino.delregno@somainline.org>
 <20210109134617.146275-2-angelogioacchino.delregno@somainline.org>
 <CAOCk7NqUpa0DqW=han49MtwUqNkNsQC3OPpO7B-872bvNukDJw@mail.gmail.com>
 <9942f98c-c186-5cd0-d6ac-a18a4e20583e@somainline.org>
 <CAOCk7Nod9a+5EUUWGpso+EBb2dJVLMvjrOoMpqeTcm+L6mxvtQ@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <b5f6095d-ed74-26a9-a485-df0dc1203f8e@somainline.org>
Date:   Thu, 14 Jan 2021 23:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7Nod9a+5EUUWGpso+EBb2dJVLMvjrOoMpqeTcm+L6mxvtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 14/01/21 23:33, Jeffrey Hugo ha scritto:
> On Thu, Jan 14, 2021 at 3:13 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>>
>> Il 14/01/21 23:12, Jeffrey Hugo ha scritto:
>>> On Sat, Jan 9, 2021 at 6:47 AM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@somainline.org> wrote:
>>>>
>>>> This clock enables the GPLL0 output to the multimedia subsystem
>>>> clock controller.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>>>
>>> Any reason why you are not also adding the div_clk?
>>>
>>
>> Yes, just one: I haven't tested it... and my devices worked without.
>> Perhaps we can add it whenever we find out if something really needs it?
> 
> I'm mildly surprised you need to turn on the gate to the PLL0 out, but
> not the div_out.  The div_out/div_clk is also fed into every RCG that
> exists in the MMCC.
> 
> Per the frequency plan the following RCGs require it -
> 
> cci
> cpp
> fd_core
> camss_gp[0-1]
> jpeg0
> mclk[0-3]
> csi[0-2]phytimer
> dp_gtc
> maxi
> axi
> ahb
> 
> Also, I'm very interested in all things 8998, and would generally
> appreciate being added to the to: list.
> 

To be honest, I was surprised as well because.. yes, I know that these 
RCGs seem to need it, but then their clock tables don't contain any 
reference to the gpll0 divider, hence it's never getting used - and that 
works great, for now.

I am aware of the fact that the clocks that you've mentioned are using 
the divider to reduce jitter, but I haven't done any camera test on my 
devices yet: that's definitely in my plans and I really can't wait to do 
that (as I successfully did for SDM630/660), but... we have more than 
100 patches in our trees.
We need to get upstream in the same working order as what we have here, 
so that we don't diverge that much and our work is kept in a 
maintainable state (avoiding to lose pieces around).

I'm sure that I'll send a commit adding the gpll0 divider branch as soon 
as I will start the camera work: I feel it, it's going to give me issues 
without, in that field.

By the way, noted. I'll make sure to add you in the to/cc for all of the 
next series regarding 8998 that I'll send.

Meanwhile, you may want to check out all the recent patches that I've 
sent, as like 90% are MSM8998-centric... :))

-- Angelo
