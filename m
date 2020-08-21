Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D4B24D04B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 10:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgHUIGC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 04:06:02 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:54288 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbgHUIFl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 04:05:41 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07L82M8Y002909;
        Fri, 21 Aug 2020 10:05:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=mEEFGwxCR0LLzSzT8N8HBawMHqEEzWXO7414JAV6Gqg=;
 b=eYPOpaotWPQ4f7pbwo3lzzRAHL9gJ56LxFpuIA7vitShstnf99AMesLYK1sXmMGj/Kt2
 bBCxV5KgtkMg0X9xo0FN4bPkE5S5KtfzMPpfBoilBcOiK/ljUVnxz/mGV3ya/OOAVhH7
 rGofCoqqfd+XpWN4ikYKTdell/ML0x6/ro4sxUHBAI4QeWBse9thJNWaohSYgwtozo1/
 4sunJcWcCUUJNMlYMO38jj9TZWvepJU/yKbdC9IMSFPsiqEUpEfks79Uivx6BZ6cp78e
 gY9ONdq1bPVS1uTsFuG55lCrxYhpak8wh3TRj7Qa7u4t9dRL9E/okTsxWFD6Jj4OxA0D Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 330jg7nrr1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Aug 2020 10:05:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF69B10002A;
        Fri, 21 Aug 2020 10:05:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C439321FE90;
        Fri, 21 Aug 2020 10:05:20 +0200 (CEST)
Received: from [10.48.1.149] (10.75.127.47) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Aug
 2020 10:05:19 +0200
Subject: Re: [PATCH v2 11/15] regulator: stm32-vrefbuf: Fix W=1 build warning
 when CONFIG_OF=n
To:     Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Icenowy Zheng <icenowy@aosc.io>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20200821111135.0b958d3a@xhacker.debian>
 <20200821111755.4c461039@xhacker.debian>
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <fc1035fe-b90f-59d5-cb4c-aff31136459a@st.com>
Date:   Fri, 21 Aug 2020 10:05:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821111755.4c461039@xhacker.debian>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-21_06:2020-08-19,2020-08-21 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/21/20 5:17 AM, Jisheng Zhang wrote:
> Fix below warning when CONFIG_OF=n:
> 
> drivers/regulator/stm32-vrefbuf.c:287:34: warning: ‘stm32_vrefbuf_of_match’ defined but not used [-Wunused-const-variable=]
>   287 | static const struct of_device_id stm32_vrefbuf_of_match[] = {
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Hi Jisheng,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks for the patch,
Fabrice
> ---
>  drivers/regulator/stm32-vrefbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
> index 992bc18101ef..161622ea7259 100644
> --- a/drivers/regulator/stm32-vrefbuf.c
> +++ b/drivers/regulator/stm32-vrefbuf.c
> @@ -284,7 +284,7 @@ static const struct dev_pm_ops stm32_vrefbuf_pm_ops = {
>  			   NULL)
>  };
>  
> -static const struct of_device_id stm32_vrefbuf_of_match[] = {
> +static const struct of_device_id __maybe_unused stm32_vrefbuf_of_match[] = {
>  	{ .compatible = "st,stm32-vrefbuf", },
>  	{},
>  };
> 
