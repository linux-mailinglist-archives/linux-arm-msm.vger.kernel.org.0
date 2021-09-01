Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6403FDE1B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 16:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbhIAO4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 10:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbhIAO4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 10:56:03 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF330C061760
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 07:55:06 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5693F1FAF9;
        Wed,  1 Sep 2021 16:55:05 +0200 (CEST)
Subject: Re: [PATCH] arm64: dts: qcom: pm660: Add reboot mode support
To:     Shawn Guo <shawn.guo@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20210824021918.17271-1-shawn.guo@linaro.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <a6ab7332-feda-3c19-e64e-2ffbc06f7f42@somainline.org>
Date:   Wed, 1 Sep 2021 16:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210824021918.17271-1-shawn.guo@linaro.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 24/08/21 04:19, Shawn Guo ha scritto:
> It turns out that the pm660 PON is a GEN2 device.  Update the compatible
> to "qcom,pm8998-pon" and add reboot mode support, so that devices can be
> rebooted into bootloader and recovery mode.  Tested on Xiaomi Redmi Note
> 7 phone.
> 
> While at it, drop the unnecessary newline between 'compatible' and 'reg'
> property.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
