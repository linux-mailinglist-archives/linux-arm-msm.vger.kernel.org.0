Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E95241A175
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 23:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbhI0Vrf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 17:47:35 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42418 "EHLO
        fanzine.igalia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237009AbhI0Vre (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 17:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; s=20170329;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:In-Reply-To; bh=76O8WApWZLvvT9G+XCfOcuQCiQOca2oZUFcluWt6zrM=;
        b=qYU02jarWH/Q81NUeqRbHk0JowJIp3xSc9ELm8wFxzLQzOEf4poDyieVahX4bbbyqBAZoucMFOKPu9oMwmJwa2TXoL/+oaZH0ZCGcaWvlDThhTJle1ACAVifr2BBKqPRcotX2FoeyTzMbXgOcw8lK4tujOiSCp9Fpzkk2lAiVJwCWxjm160HRHHhle1+HAb0T1FzPPjtQZHVkwBir2gojO824L+oZNjdU12snLjbIN3KSZqbeVvyJPYSKYLm5k48lNc9/Zm2ptjP9t7ig8BEcHnVWtSct9iS5YatiiL5djVoeWr1Fm51p6McVrvhQqSWJIZGT70su8jeZ6BkINpYVw==;
Received: from [177.95.15.66] (helo=[192.168.1.64])
        by fanzine.igalia.com with esmtpsa 
        (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
        id 1mUyRW-0008Rw-8w; Mon, 27 Sep 2021 23:45:46 +0200
In-Reply-To: 
To:     y.oudjana@protonmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        gpiccoli@igalia.com, kernel@gpiccoli.net, loic.poulain@linaro.org,
        konrad.dybcio@somainline.org
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add CPU cooling suppor,t
Message-ID: <5ccc4ea8-e000-b6b9-0781-dcde814eda96@igalia.com>
Date:   Mon, 27 Sep 2021 18:45:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Yassine, thanks for the patch! I was doing some experiments with a
dragonboard 820-based board, and without your patch, a CPU benchmark can
quickly cause overheating - throttling mechanism doesn't start and we
get a FW reset to a bad state (likely a HW protection mechanism).

I noticed that a similar patch including cooling maps is present in
Linaro's qcom tree [0], and it was submitted upstream [1], but there was
a re-submission [2] by Konrad that was merged and dropped the thermals
part. Based on some threads I read, it seems a FW lockup was detected
with the complete patch?

I'm not sure, so I'm looping Konrad / Loic / Bjorn here, to understand
better what made this portion of the patch to be dropped.
Anyway, I think worth to mention this in your commit message Yassine,
including perhaps a fixes tag like:

Fixes: 90173a954a22 ("arm64: dts: qcom: msm8996: Add CPU opps").

Also, I'm not sure why there was no response here or why it wasn't
merged, but if it helps, please have my:

Tested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Thanks,


Guilherme


[0]
https://git.linaro.org/landing-teams/working/qualcomm/kernel.git/commit/?h=release/qcomlt-4.14&id=2274c48c671

[1]
https://patchwork.kernel.org/project/linux-arm-msm/patch/1595253740-29466-6-git-send-email-loic.poulain@linaro.org/

[2]
https://lore.kernel.org/linux-arm-msm/20210527194455.782108-2-konrad.dybcio@somainline.org/

