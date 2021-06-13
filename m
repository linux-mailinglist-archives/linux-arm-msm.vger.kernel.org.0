Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87C63A56F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jun 2021 09:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhFMHwN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Jun 2021 03:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbhFMHwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Jun 2021 03:52:12 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AAABC061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jun 2021 00:50:11 -0700 (PDT)
Received: from [192.168.1.69] (bband-dyn73.178-41-129.t-com.sk [178.41.129.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C473F3F41B;
        Sun, 13 Jun 2021 09:50:08 +0200 (CEST)
Date:   Sun, 13 Jun 2021 09:50:03 +0200
From:   Martin Botka <martin.botka@somainline.org>
Subject: Re: [PATCH v2 1/2] arch: arm64: dts: qcom: Add support for SM6125
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>
Message-Id: <F3RMUQ.F1IP4XKK3SP92@somainline.org>
In-Reply-To: <d98a8361-5ee5-cde3-03e0-8f61af6686cd@postmarketos.org>
References: <20210612094652.90354-1-martin.botka@somainline.org>
        <d98a8361-5ee5-cde3-03e0-8f61af6686cd@postmarketos.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On Sun, Jun 13 2021 at 12:20:53 AM +0300, Alexey Minnekhanov 
<alexeymin@postmarketos.org> wrote:
> > +		sdhc_1: sdhci@4744000 {
>> +			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0x04744000 0x1000>, <0x04744000 0x1000>;
>> +			reg-names = "hc_mem", "core_mem";
> 
> ichernev: reg-names should be "hc" and "cqhci" and the 2 values 
> you've supplied should be different maybe?
> 

Actually reg-names are OK to use like this. Driver will accept both hc 
and hc_mem and the same for core.
The getresource function in the driver most likely checks for both as 
other DTS files have hc_mem as well.
But i will change them in V3 to follow the bindings properly.

I will check if they should be different.

>> +
>> +		sdhc_2: sdhci@4784000 {
>> +			compatible = "qcom,sm6125-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0x04784000 0x1000>;
>> +			reg-names = "hc_mem";
> 
> Wrong reg names again?
> 

Same as above.

Thank you for the suggestions.

Best regards,
Martin Botka


