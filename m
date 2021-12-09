Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D29F46F002
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 18:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242136AbhLIRGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 12:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242138AbhLIRGS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 12:06:18 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEB7AC061353
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 09:02:44 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 45AE63F63F;
        Thu,  9 Dec 2021 18:02:41 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
 <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
Date:   Thu, 9 Dec 2021 18:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 02/10/21 00:33, Dmitry Baryshkov ha scritto:
> On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
>> In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
>> checking if the relative CTL is started by waiting for an interrupt
>> to fire: it is fine to do that, but then sometimes we call this
>> function while the CTL is up and has never been put down, but that
>> interrupt gets raised only when the CTL gets a state change from
>> 0 to 1 (disabled to enabled), so we're going to wait for something
>> that will never happen on its own.
>>
>> Solving this while avoiding to restart the CTL is actually possible
>> and can be done by just checking if it is already up and running
>> when the wait_for_commit_done function is called: in this case, so,
>> if the CTL was already running, we can say that the commit is done
>> if the command transmission is complete (in other terms, if the
>> interface has been flushed).
> 
> I've compared this with the MDP5 driver, where we always wait for PP_DONE 
> interrupt. Would it be enough to always wait for it (= always call 
> dpu_encoder_phys_cmd_wait_for_tx_complete())?
> 

This sets my delay record to reply to two months. Great achievement!

Jokes apart, yes it would make sense to do that, it's something that works
at least... but we should verify that such a thing doesn't break new platforms
(like sm8150 and newer).
