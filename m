Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7D01279E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 12:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbfLTLXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 06:23:30 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40354 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfLTLXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 06:23:30 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKBNRdx078554;
        Fri, 20 Dec 2019 05:23:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576841007;
        bh=GGo0UqaDWF2C26AMO3J7zsJZNuO5lIDTl3DebqtQbeQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=vWBCHnhEpoBpfH7WRmAxYNCDefdLv2Hz0z76c6W46b7za52A7K2N2Ry4q426TK2ke
         1MYGFA6BGC9Eozxl8GJjk4ClXCZnAGvhXVX4umD/yL/NXuqH+h86Mx5lwnGOFqlw4z
         du685NcduPn9IvYRE1DJEvrxYeILR1PvqRLxhVlE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBKBNRef114777
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Dec 2019 05:23:27 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Dec 2019 05:23:27 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Dec 2019 05:23:26 -0600
Received: from [10.24.69.159] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKBNOl3010044;
        Fri, 20 Dec 2019 05:23:25 -0600
Subject: Re: [PATCH] phy: qualcomm: Adjust indentation in read_poll_timeout
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>
CC:     Andy Gross <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <clang-built-linux@googlegroups.com>
References: <20191218013637.29123-1-natechancellor@gmail.com>
 <20191218062906.GB3755841@builder>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <a5743631-5e45-ef36-d1b5-61f445fd7018@ti.com>
Date:   Fri, 20 Dec 2019 16:55:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191218062906.GB3755841@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/12/19 11:59 am, Bjorn Andersson wrote:
> On Tue 17 Dec 17:36 PST 2019, Nathan Chancellor wrote:
> 
>> Clang warns:
>>
>> ../drivers/phy/qualcomm/phy-qcom-apq8064-sata.c:83:4: warning:
>> misleading indentation; statement is not part of the previous 'if'
>> [-Wmisleading-indentation]
>>                  usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
>>                  ^
>> ../drivers/phy/qualcomm/phy-qcom-apq8064-sata.c:80:3: note: previous
>> statement is here
>>                 if (readl_relaxed(addr) & mask)
>>                 ^
>> 1 warning generated.
>>
>> This warning occurs because there is a space after the tab on this line.
>> Remove it so that the indentation is consistent with the Linux kernel
>> coding style and clang no longer warns.
>>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

merged, thanks!

-Kishon
> 
>> Fixes: 1de990d8a169 ("phy: qcom: Add driver for QCOM APQ8064 SATA PHY")
>> Link: https://github.com/ClangBuiltLinux/linux/issues/816
>> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
>> index 42bc5150dd92..febe0aef68d4 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
>> @@ -80,7 +80,7 @@ static int read_poll_timeout(void __iomem *addr, u32 mask)
>>  		if (readl_relaxed(addr) & mask)
>>  			return 0;
>>  
>> -		 usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
>> +		usleep_range(DELAY_INTERVAL_US, DELAY_INTERVAL_US + 50);
>>  	} while (!time_after(jiffies, timeout));
>>  
>>  	return (readl_relaxed(addr) & mask) ? 0 : -ETIMEDOUT;
>> -- 
>> 2.24.1
>>
