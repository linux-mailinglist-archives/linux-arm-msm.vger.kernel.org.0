Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623C13F6B91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 00:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237289AbhHXWLL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 18:11:11 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:52348 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231792AbhHXWLH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 18:11:07 -0400
X-Greylist: delayed 577 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Aug 2021 18:11:07 EDT
Received: from [192.168.20.2] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 0B45160A56;
        Tue, 24 Aug 2021 22:00:44 +0000 (UTC)
Subject: Re: [PATCH] arm64: dts: qcom: sdm660: Add initial IFC6560 board
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20210824151036.678802-1-bjorn.andersson@linaro.org>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <2b552137-d279-8ec6-8324-5a97f2291d55@postmarketos.org>
Date:   Wed, 25 Aug 2021 01:00:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824151036.678802-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

24.08.2021 18:10, Bjorn Andersson wrote:

> diff --git a/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts b/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
> new file mode 100644
> index 000000000000..2244529bc6bf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm660-ifc6560.dts
...
> +
> +&rpm_requests {
...
> +	pm660l-regulators 
> +		vreg_l2b_2p95: l2 {
...
> +		vreg_l4b_29p5: l4 {

Maybe call it 2p95 (and not 29p5) like the one above, for consistency?

> +
> +		vreg_l5b_29p5: l5 {

Maybe call it 2p95 too?

-- 
Regards
Alexey Minnekhanov
