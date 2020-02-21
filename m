Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D661167666
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 09:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733011AbgBUIdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 03:33:24 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:58058 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732609AbgBUIdX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 03:33:23 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01L8XJsc015920;
        Fri, 21 Feb 2020 02:33:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582273999;
        bh=HS1Md6M0KSfcAvB5AaAuTKyUy/n3WhhTB/+q8IGl1yc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hI/LwG2KS7nyGndqeFXCyRBVuIBvFnzyPcYsynXqpEpEBLfYP470xHU+CssX/b9S4
         IXB4EXF5EMHAfKgC7b1aPySMu1193wD5DoTydMdcE4bO38Q03kFFwBVHs22v8zx9/D
         HaAru45OYb/JFKjjXUibT0CpAxiEgHnWbwuScXCg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01L8XJNN072114
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 21 Feb 2020 02:33:19 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 21
 Feb 2020 02:33:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 21 Feb 2020 02:33:18 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01L8XGLE004067;
        Fri, 21 Feb 2020 02:33:17 -0600
Subject: Re: [PATCH v4 0/3] phy: qcom-qmp: Add SDM845 QMP and QHP PHYs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200106081821.3192922-1-bjorn.andersson@linaro.org>
 <20200220063837.GX1908628@ripper>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <ec401b79-b0af-78b3-ba8a-03aee5ba3584@ti.com>
Date:   Fri, 21 Feb 2020 14:06:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200220063837.GX1908628@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/02/20 12:08 pm, Bjorn Andersson wrote:
> On Mon 06 Jan 00:18 PST 2020, Bjorn Andersson wrote:
> 
>> Add support for the two PCIe PHYs found in Qualcomm SDM845
>>
> 
> Kishon, these patches still applies cleanly, could you please pick them
> up?

merged now, thanks!

-Kishon

> 
> Regards,
> Bjorn
> 
>> Bjorn Andersson (3):
>>   dt-bindings: phy-qcom-qmp: Add SDM845 PCIe to binding
>>   phy: qcom: qmp: Add SDM845 PCIe QMP PHY support
>>   phy: qcom: qmp: Add SDM845 QHP PCIe PHY
>>
>>  .../devicetree/bindings/phy/qcom-qmp-phy.txt  |  10 +
>>  drivers/phy/qualcomm/phy-qcom-qmp.c           | 313 ++++++++++++++++++
>>  drivers/phy/qualcomm/phy-qcom-qmp.h           | 114 +++++++
>>  3 files changed, 437 insertions(+)
>>
>> -- 
>> 2.24.0
>>
