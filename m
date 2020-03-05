Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A795417A41D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 12:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgCELWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 06:22:21 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:38874 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725880AbgCELWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 06:22:21 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025BMJFg075252;
        Thu, 5 Mar 2020 05:22:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1583407339;
        bh=H5n4ZR/2MzSw0KYHcIl651TeKAPvxmf3E4BR3l6yDmY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=fviuiFVN6eGX5vxKxG/LIlWW+J2u5JqNEsu+fuU3Rs6uykL2L33XvS09W1vmsuwun
         rJtepSwpapaLOAL0/lRwLNt7kSfbmYABED473OzJGCG1wXe4+ubqmocUfvXAm9PdMJ
         kyBnAUZVtTVtf74nOx9MDad6vaHDJUPGUGR6CjY4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025BMJa2069072
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 5 Mar 2020 05:22:19 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 05:22:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 05:22:19 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025BMHm0050701;
        Thu, 5 Mar 2020 05:22:18 -0600
Subject: Re: [PATCH v4] phy: qcom: qmp: Use power_on/off ops for PCIe
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200106081142.3192204-1-bjorn.andersson@linaro.org>
 <20200221140933.GM2618@vkoul-mobl>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <418bbbf3-15c3-d1ea-a07a-ff510e254e40@ti.com>
Date:   Thu, 5 Mar 2020 16:56:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200221140933.GM2618@vkoul-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21/02/20 7:39 pm, Vinod Koul wrote:
> On 06-01-20, 00:11, Bjorn Andersson wrote:
>> The PCIe PHY initialization requires the attached device to be present,
>> which is primarily achieved by the PCI controller driver.  So move the
>> logic from init/exit to power_on/power_off.
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
merged, thanks!

-Kishon
