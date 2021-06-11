Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDE43A4AED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 00:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbhFKWWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 18:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFKWWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 18:22:09 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2707CC061574;
        Fri, 11 Jun 2021 15:20:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 726493F20B;
        Sat, 12 Jun 2021 00:20:07 +0200 (CEST)
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add support for SONY Xperia 1 / 5
 (Kumano platform)
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org, marijn.suijten@somainline.org,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
References: <20210611203301.101067-1-konrad.dybcio@somainline.org>
 <20210611203301.101067-2-konrad.dybcio@somainline.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <3fec843d-4e99-b7e9-0502-62b89b108038@somainline.org>
Date:   Sat, 12 Jun 2021 00:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210611203301.101067-2-konrad.dybcio@somainline.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 11/06/21 22:33, Konrad Dybcio ha scritto:
> Add support for SONY Xperia 1 and 5 smartphones, both based on the
> Qualcomm SM8150 chipset. There also exist 5G-capable versions of these
> devices, but they weren't sold much (if at all) outside Japan.
> 
> The devices are affected by a scary UFS behaviour where sending a certain UFS
> command (which is worked around on downstream) renders the device unbootable,
> by effectively erasing the bootloader. Therefore UFS AND UFSPHY are strictly
> disabled for now.
> 
> Downstream workaround:
> https://github.com/kholk/kernel/commit/2e7a9ee1c91a016baa0b826a7752ec45663a0561
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Tested on Xperia 1 (Griffin) with a small initrd system (sorry, no time
to flash a full fledged system!) and boots just fine.

On a note, I would like to bring to the attention of other developers
that we actually tried to get informations about the UFS quirks that
all Sony devices require, as they seem to be required "on purpose",
meaning that it's not a hardware/firmware bug, but rather an intentional
"feature", but nobody has been open to give such informations to us,
which made us unable to understand what's the best way to address this
kind of quirk here on mainline.

If anybody has such informations, or if anybody can give us a hint about
how can we properly/cleanly implement the Sony UFS quirks, we're totally
open for any kind of suggestion.

Thanks!

Reviewed-by: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@somainline.org>
Tested-by: AngeloGioacchino Del Regno 
<angelogioacchino.delregno@somainline.org>
