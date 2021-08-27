Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4566E3F9B83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 17:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245398AbhH0PO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 11:14:27 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:39503 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbhH0PO0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 11:14:26 -0400
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B094E1F533;
        Fri, 27 Aug 2021 17:13:34 +0200 (CEST)
Subject: Re: [PATCH] soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
References: <20210824094109.7272-1-shawnguo@kernel.org>
 <0410695f-85fe-1df9-46ee-bc494b81bf23@somainline.org>
 <20210826141826.GB31229@dragon>
 <ed941f01-7855-006a-9eb9-29388b3be2f4@somainline.org>
 <20210827062359.GC31229@dragon>
 <3df9b523-4d8b-b817-f074-88e38456b35b@somainline.org>
 <20210827095716.GD31229@dragon>
 <9166e1a9-5afa-7ae8-91e5-21704bc7a40f@somainline.org>
 <20210827141200.GA4274@dragon>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <16c45f98-60ed-61d0-9e6a-d0c2aa2a20d1@somainline.org>
Date:   Fri, 27 Aug 2021 17:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827141200.GA4274@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/27/21 4:12 PM, Shawn Guo wrote:
> [..]
> 
> So you proposed to reject PT_LOAD in the else clause, which right now
> handles .mbn case


Yes, I propose to reject PT_LOAD in the else-case, and additionally 
reject cases where p_offset+p_filesz > sw->size since PT_NULL can also 
cause external file loads (meaning split-firmware).  This is what 
Siddharth's patchset - or my respin of it - is going to implement.

> are you sure hash segment in .mbn is not going to be
> PT_LOAD?


PT_LOAD unambiguously indicates a program header that ought to be loaded 
from an external file.  Any mbn file (non-split firmware) without split 
files that set PT_LOAD are misusing this program header type field.  I 
have no way to validate whether such mbns are in circulation.

Of note, I have never referenced the definition of the program header 
types yet.  Please see [1]:

     PT_LOAD (1)
         Indicates that this program header describes a segment to be
         loaded from the file.

Let me know if you're planning to send a v2 of this patch with 
aforementioned improvements, then I'll adjust my plans to respin 
Siddharth's patchset accordingly.

- Marijn

[1]: https://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_23.html
