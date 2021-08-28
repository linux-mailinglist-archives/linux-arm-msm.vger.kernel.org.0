Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992A33FA498
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 11:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhH1I7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 04:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbhH1I7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 04:59:22 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F166C061756
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Aug 2021 01:58:30 -0700 (PDT)
Received: from [10.0.20.3] (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 339E31F986;
        Sat, 28 Aug 2021 10:58:29 +0200 (CEST)
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
 <16c45f98-60ed-61d0-9e6a-d0c2aa2a20d1@somainline.org>
 <20210828060349.GB4274@dragon>
From:   Marijn Suijten <marijn.suijten@somainline.org>
Message-ID: <1c418a4d-f433-a02f-9a25-61308dd69722@somainline.org>
Date:   Sat, 28 Aug 2021 10:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210828060349.GB4274@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 8/28/21 8:03 AM, Shawn Guo wrote:
> [..]
> 
> Or you think these are all misusing of PT_LOAD?  Sorry, I hardly believe
> your understanding on PT_LOAD matches the reality.  Instead, I'm inclined
> to agree with Bjorn's comment.


Agreed, PT_LOAD does not imply _external_ loading at all, merely whether 
it has to be copied to the final memory region.  That's my 
misunderstanding, even after quoting the documentation.

This external loading is merely a qcom implementation detail AFAIK, and 
solely detected by the source boundaries (p_offset - p_offset+p_filesz) 
residing outside the .mdt file.

> Quote:
> 
> "I would expect that PT_LOAD denotes that the segment should be loaded
> into the final firmware region and that the hash segment would be
> PT_NULL regardless of being part of the .mdt, single .mbn or a separate
> .bNN segment."
> 
> The only part that doesn't hold is "the hash segment would be PT_NULL".
> But the point is that PT_LOAD doesn't mean the segment should be loaded
> externally (from .bNN file).


Yes, this is strange.  Why would the .mdt request the hash segment to be 
loaded to firmware memory when it's filtered out anyway?  Are we 
supposed to filter it out?

> [..]
> 
> I will send v2. However there will be no code change but just commit log
> update based on all these discussion.  Thanks!


Sounds good - glad we could have this discussion to get to the bottom of 
this and conclude that removing this check is the right approach without 
any side-effects, including a detailed justification in the commit-message.

- Marijn
