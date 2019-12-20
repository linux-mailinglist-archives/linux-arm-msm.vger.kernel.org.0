Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 433D61279EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 12:27:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfLTL13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 06:27:29 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:34796 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbfLTL13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 06:27:29 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKBRPHM043202;
        Fri, 20 Dec 2019 05:27:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576841245;
        bh=LuXvkGUQhmIvpvVeCzXwOvyR/SnWmXXTguGUpFcnRHM=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=a6viUw7VhsUyLUqX4TjUO+BVJP7WkfYnPDLMh0NHw5hRdMYYvY5/D/Xjzq8z2dRuF
         5j/cfOH/SlTBdvr1fYMsDSVNhZX8IoVVH029Q+hnr6n40P6OwqTxcManLxoiaUfekb
         1q/vHE+eC+t1kVyt7B6FYKgb5hlsmOvZsZd1UVss=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBKBRPjB036355
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Dec 2019 05:27:25 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 05:27:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 05:27:23 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKBRKHj122944;
        Fri, 20 Dec 2019 05:27:21 -0600
Subject: Re: [PATCH v2 0/5] phy: qcom-qmp: Fixes and updates for sm8150
To:     Vinod Koul <vkoul@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, Can Guo <cang@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        <linux-kernel@vger.kernel.org>
References: <20191220101719.3024693-1-vkoul@kernel.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <64b5cb4b-1f41-383b-af99-fb4e21aea5dc@ti.com>
Date:   Fri, 20 Dec 2019 16:59:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220101719.3024693-1-vkoul@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/12/19 3:47 pm, Vinod Koul wrote:
> On 5.5-rc1 we have seen regression on UFS phy on 8998 and SM8150. As
> suggested by Can, increasing the timeout helps so we increase the phy init
> timeout and that fixes the issue for 8998.  The patch 1 should be applied
> to fixes for 5.5

patch 1 is applied to fixes, Thanks!

-Kishon
> 
> For SM8150 we need additional SW reset so add additional SW reset and
> configure if flag is defined, while at it do small updates to Use register
> defines and remove duplicate powerdown write.
> 
> Changes in v2:
>  - Drop patch 1 and pick the one Bjorn had already sent, makes timeout 10ms
>  - Fix optional reset write as pointed by Can
>  - Fix register define as pointed by Can
> 
> Bjorn Andersson (1):
> 
>   phy: qcom-qmp: Increase PHY ready timeout
> 
> Vinod Koul (4):
>   phy: qcom-qmp: Use register defines
>   phy: qcom-qmp: Add optional SW reset
>   phy: qcom-qmp: remove duplicate powerdown write
>   phy: qcom-qmp: remove no_pcs_sw_reset for sm8150
> 
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
