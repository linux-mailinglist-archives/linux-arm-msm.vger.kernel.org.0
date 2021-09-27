Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0069541A189
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 23:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237300AbhI0Vyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 17:54:35 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42709 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237245AbhI0Vye (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 17:54:34 -0400
X-Greylist: delayed 420 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Sep 2021 17:54:32 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Qu7dQEqBlUkYgFtfoJbYHfEYXPbW8/2J84uKAJ25ta8=;
        b=ZDm9nCGr949Kxmt4aGaRNvIKZ8wqj138CYJS2Xq1I+37JzQ6tU5ZelywPwNE0UdHZBT8XtPXEc6/69qWykNFiMFBwHTnWTzFCdhs8XtW81s0aF7PZI8moOwukSFRd4YA110VeAkvqG9YiSF1htCccXp0Xeua2V6U3I08u9iSr3IitIn7l+P10s57ICpTFJxFXGFWV4biFdW2m/Wl7YIJnyK7rVybMobZ5mtnWrD8cLW2dLhjf3xW66OjXhXQliuc6OXcsxjM9G9mEND7lVXQp+BMk7R0eN2xoVpJHo74BrnF+/A6nIvyOr4hWE44YsPXlXjLv4z+gYEybTb2uVTBPw==;
Received: from [177.95.15.66] (helo=[192.168.1.64])
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
        id 1mUyYM-0000e3-94; Mon, 27 Sep 2021 23:52:50 +0200
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add CPU cooling suppor,t
To:     y.oudjana@protonmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        kernel@gpiccoli.net, loic.poulain@linaro.org,
        konrad.dybcio@somainline.org
References: <5ccc4ea8-e000-b6b9-0781-dcde814eda96@igalia.com>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Message-ID: <233effdb-5604-2405-fdaa-ebd35b0c0126@igalia.com>
Date:   Mon, 27 Sep 2021 18:52:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5ccc4ea8-e000-b6b9-0781-dcde814eda96@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2021 18:45, Guilherme G. Piccoli wrote:
> Hi Yassine, thanks for the patch! I was doing some experiments with a
> dragonboard 820-based board, and without your patch, a CPU benchmark can
> quickly cause overheating - throttling mechanism doesn't start and we
> get a FW reset to a bad state (likely a HW protection mechanism).
> 
> I noticed that a similar patch including cooling maps is present in
> Linaro's qcom tree [0], and it was submitted upstream [1], but there was
> a re-submission [2] by Konrad that was merged and dropped the thermals
> part. Based on some threads I read, it seems a FW lockup was detected
> with the complete patch?
> 
> I'm not sure, so I'm looping Konrad / Loic / Bjorn here, to understand
> better what made this portion of the patch to be dropped.
> Anyway, I think worth to mention this in your commit message Yassine,
> including perhaps a fixes tag like:
> 
> Fixes: 90173a954a22 ("arm64: dts: qcom: msm8996: Add CPU opps").
> 
> Also, I'm not sure why there was no response here or why it wasn't
> merged, but if it helps, please have my:
> 
> Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> 
> Thanks,
> 
> 
> Guilherme
> 
> 
> [0]
> https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/?h=release/qcomlt-4.14&id=2274c48c671
> 
> [1]
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1595253740-29466-6-git-send-email-loic.poulain@linaro.org/
> 
> [2]
> https://lore.kernel.org/linux-arm-msm/20210527194455.782108-2-konrad.dybcio@somainline.org/
> 


Unfortunately, (likely) due to a typo in the Subject field, this wasn't
threaded correctly. So, the original message I was responding is:

https://lore.kernel.org/linux-arm-msm/jmayJcXoExAK2G7UBIXMz5CDN0BYgYkFZguHlPNRFOU@cp4-web-038.plabs.ch/

I'm sorry about the confusion with the mail thread!
Cheers,


Guilherme
