Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E89C24D04E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Aug 2020 10:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgHUIGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Aug 2020 04:06:31 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:54530 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725965AbgHUIG2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Aug 2020 04:06:28 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07L82JJr002831;
        Fri, 21 Aug 2020 10:06:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=th7iteinfJ5v35Fs8Ofjskmkk4fXfBSVgD7G2rq8Rbw=;
 b=vB2upX7yZQWJVaoHeJvA3i5JRJJufz9ih3al4Dd9JKa2GMqA5VyPqnnFOF/r/X/W+jq+
 /kmqWUqSs25OkbIl/0JXNogFpSWe0waYNiCVIFCWS/KSHWtBNlg9svjcCQYXXlJUo1eV
 fa/9BtjoTwvZVcAmNoSi8pbnGbmTxXOqGJDY69vN+jKP8y2jNagCcrMVtBwL8TC3vTP2
 ZJBly60IK16ZzesyuJ6jOLtTjEDi/qMUfgLxcSmeCPxoyKAMcUwMQkH4lS1JtLS2Auy4
 NF8DPTL+9fIINFL3zMJSQpZHdDe92fTw/Jr3lT0fm3maRnF4lyA9h3Lg/b//YdcdrAoc gA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 330jg7nrvs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Aug 2020 10:06:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D0F310002A;
        Fri, 21 Aug 2020 10:06:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6DBE721FE90;
        Fri, 21 Aug 2020 10:06:17 +0200 (CEST)
Received: from [10.48.1.149] (10.75.127.45) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 21 Aug
 2020 10:06:16 +0200
Subject: Re: [PATCH v2 14/15] regulator: stm32-booster: Fix W=1 build warning
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
 <20200821111943.29b2b4ca@xhacker.debian>
From:   Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <98a8224e-9797-cbd0-7a99-972f3c6db292@st.com>
Date:   Fri, 21 Aug 2020 10:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821111943.29b2b4ca@xhacker.debian>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-21_06:2020-08-19,2020-08-21 signatures=0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/21/20 5:19 AM, Jisheng Zhang wrote:
> Fix below warning when CONFIG_OF=n:
> 
> drivers/regulator/stm32-booster.c:104:34: warning: ‘stm32_booster_of_match’ defined but not used [-Wunused-const-variable=]
>   104 | static const struct of_device_id stm32_booster_of_match[] = {
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

Hi Jisheng,

Acked-by: Fabrice Gasnier <fabrice.gasnier@st.com>

Thanks for the patch,
Fabrice
> ---
>  drivers/regulator/stm32-booster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/stm32-booster.c b/drivers/regulator/stm32-booster.c
> index 03f162ffd144..3136ea8a35d5 100644
> --- a/drivers/regulator/stm32-booster.c
> +++ b/drivers/regulator/stm32-booster.c
> @@ -101,7 +101,7 @@ static int stm32_booster_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static const struct of_device_id stm32_booster_of_match[] = {
> +static const struct of_device_id __maybe_unused stm32_booster_of_match[] = {
>  	{
>  		.compatible = "st,stm32h7-booster",
>  		.data = (void *)&stm32h7_booster_desc
> 
