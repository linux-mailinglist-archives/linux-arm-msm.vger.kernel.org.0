Return-Path: <linux-arm-msm+bounces-32189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE197E860
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 11:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E8531F20F95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 09:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A21D1946B4;
	Mon, 23 Sep 2024 09:16:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C904B7641D;
	Mon, 23 Sep 2024 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727083017; cv=none; b=PikHXqlIkc1a9r1aOTpYvVnEfxQdN+/BdvZogEDG98w/9fGyISCHzxmrb0dD6hH3EZM1zx8z2JNXZa517SQ0wAASsFQJRnU7X6v6O1F1Sb6UeDS/h7QXwgGvr4So/FuT5dsVWM0TYrQtUsloUVAhxmVD+EgB3nxbF4czLXA5jhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727083017; c=relaxed/simple;
	bh=wz17lKT5s3cGnLvfBBpvGC9XZNd4l5pCoHzuPmwBMkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=emkYRt7Zd36Na/bx5AA5rZEMFhgc1w84ArfpnEwxtggpqTI70UdsFo/oXP4VG4kkNo9sHyMjVMGKBegZdUt6Kg3sV6yU3TjAoNMh093Z78gBugMUX+EbDzvaqZmMGLzVwk9vQO/WV3ANGm1TTZG/jy4PSYqgqBuKx0t0No8qCSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XBy2R4t1Cz1HKgD;
	Mon, 23 Sep 2024 17:13:03 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id DFF9E1A0188;
	Mon, 23 Sep 2024 17:16:51 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Sep 2024 17:16:51 +0800
Message-ID: <9bcfefda-2cff-f41e-53b9-5104227e2c7a@huawei.com>
Date: Mon, 23 Sep 2024 17:16:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] net: wwan: qcom_bam_dmux: Fix missing
 pm_runtime_disable()
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: <stephan@gerhold.net>, <loic.poulain@linaro.org>,
	<ryazanov.s.a@gmail.com>, <johannes@sipsolutions.net>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240920100711.2744120-1-ruanjinjie@huawei.com>
 <Zu1ugT3cYptfeUaa@linaro.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <Zu1ugT3cYptfeUaa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)



On 2024/9/20 20:45, Stephan Gerhold wrote:
> On Fri, Sep 20, 2024 at 06:07:11PM +0800, Jinjie Ruan wrote:
>> It's important to undo pm_runtime_use_autosuspend() with
>> pm_runtime_dont_use_autosuspend() at driver exit time.
>>
>> But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
>> is missing in the error path for bam_dmux_probe(). So add it.
>>
>> Fixes: 21a0ffd9b38c ("net: wwan: Add Qualcomm BAM-DMUX WWAN network driver")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/net/wwan/qcom_bam_dmux.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index 26ca719fa0de..34a4e8095161 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
>> @@ -823,17 +823,17 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>  	ret = devm_request_threaded_irq(dev, pc_ack_irq, NULL, bam_dmux_pc_ack_irq,
>>  					IRQF_ONESHOT, NULL, dmux);
>>  	if (ret)
>> -		return ret;
>> +		goto err_disable_pm;
>>  
>>  	ret = devm_request_threaded_irq(dev, dmux->pc_irq, NULL, bam_dmux_pc_irq,
>>  					IRQF_ONESHOT, NULL, dmux);
>>  	if (ret)
>> -		return ret;
>> +		goto err_disable_pm;
>>  
>>  	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>  				    &dmux->pc_state);
>>  	if (ret)
>> -		return ret;
>> +		goto err_disable_pm;
>>  
>>  	/* Check if remote finished initialization before us */
>>  	if (dmux->pc_state) {
>> @@ -844,6 +844,12 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	return 0;
>> +
>> +err_disable_pm:
>> +	pm_runtime_disable(dev);
>> +	pm_runtime_dont_use_autosuspend(dev);
>> +	pm_runtime_set_suspended(dev);
> 
> Please drop the pm_runtime_set_suspended(dev); line, it should be
> unneeded since runtime PM documentation says:
> 
> 	the initial runtime PM status of all devices is ‘suspended’

Thank you!

> 
> Thanks,
> Stephan

