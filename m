Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 570FE2F8539
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 20:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387866AbhAOTQX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 14:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731529AbhAOTQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 14:16:23 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBFBC0613C1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 11:15:27 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 420891F518;
        Fri, 15 Jan 2021 20:15:26 +0100 (CET)
Subject: Re: (subset) [PATCH v2 0/7] Really implement Qualcomm LAB/IBB
 regulators
To:     Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, sumit.semwal@linaro.org,
        martin.botka@somainline.org, robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        phone-devel@vger.kernel.org, marijn.suijten@somainline.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com
References: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
 <161073479108.12431.17135576809621290489.b4-ty@kernel.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <93eedc72-e269-a67e-12f6-e391337a5c67@somainline.org>
Date:   Fri, 15 Jan 2021 20:15:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <161073479108.12431.17135576809621290489.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 15/01/21 19:19, Mark Brown ha scritto:
> On Wed, 13 Jan 2021 20:42:07 +0100, AngeloGioacchino Del Regno wrote:
>> Okay, the title may be a little "aggressive"? However, the qcom-labibb
>> driver wasn't really .. doing much.
>> The current form of this driver is only taking care of enabling or
>> disabling the regulators, which is pretty useless if they were not
>> pre-set from the bootloader, which sets them only if continuous
>> splash is enabled.
>> Moreover, some bootloaders are setting a higher voltage and/or a higher
>> current limit compared to what's actually required by the attached
>> hardware (which is, in 99.9% of the cases, a display) and this produces
>> a higher power consumption, higher heat output and a risk of actually
>> burning the display if kept up for a very long time: for example, this
>> is true on at least some Sony Xperia MSM8998 (Yoshino platform) and
>> especially on some Sony Xperia SDM845 (Tama platform) smartphones.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
> 
> Thanks!
> 
> [1/7] regulator: qcom-labibb: Implement voltage selector ops
>        commit: dd582369c6c1f39ec475af6191a934f3e57fda35
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

Hello Mark,

Thanks for applying the commit, however, I feel like reminding you that 
setting voltage on this regulator without setting a current limit is 
really unsafe (at least, from many, many experiments) so, to ensure the 
entire safety of this code and the hardware that's attached to these 
regulators you should, please, either apply the entire series, or nothing.

My concerns are only about keeping LAB and IBB safe for everyone's hardware.

Thank you again
-- Angelo
