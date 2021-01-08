Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D31C2EF341
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 14:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbhAHNkv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 08:40:51 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:40839 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbhAHNkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 08:40:51 -0500
Received: from [192.168.1.101] (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 252EA3F611;
        Fri,  8 Jan 2021 14:39:52 +0100 (CET)
Subject: Re: [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        robdclark@gmail.com
Cc:     airlied@linux.ie, airlied@redhat.com, akhilpo@codeaurora.org,
        angelogioacchino.delregno@somainline.org,
        bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        jcrouse@codeaurora.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        phone-devel@vger.kernel.org, sean@poorly.run, shawn.guo@linaro.org,
        smasetty@codeaurora.org, ~postmarketos/upstreaming@lists.sr.ht
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
Date:   Fri, 8 Jan 2021 14:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Konrad, can you please test this below change without your change?

This brings no difference, a BUG still happens. We're still calling to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330 into an A640..

Also, relying on disabling LLCC in the config is out of question as it makes the arm32 kernel not compile with DRM/MSM and it just removes the functionality on devices with a6xx.. (unless somebody removes the dependency on it, which in my opinion is even worse and will cause more problems for developers!).

The bigger question is how and why did that piece of code ever make it to adreno_gpu.c and not a6xx_gpu.c?

To solve it in a cleaner way I propose to move it to an a6xx-specific file, or if it's going to be used with next-gen GPUs, perhaps manage calling of this code via an adreno quirk/feature in adreno_device.c. Now that I think about it, A5xx GPMU en/disable could probably managed like that, instead of using tons of if-statements for each GPU model that has it..

While we're at it, do ALL (and I truly do mean ALL, including the low-end ones, this will be important later on) A6xx GPUs make use of that feature?

Konrad

