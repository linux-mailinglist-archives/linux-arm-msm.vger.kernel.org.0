Return-Path: <linux-arm-msm+bounces-29116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5419586FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6C42834CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E3A18DF6F;
	Tue, 20 Aug 2024 12:31:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32A10F4;
	Tue, 20 Aug 2024 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157116; cv=none; b=Whzss831CfoRfF8nHgvMy4bEWRypU5CIIDuo7Nfo+ncoXso3UAZuna9KyYC40wdt2/UOx512hfslsOU6g4+2eB27aWDa8vbswPonV0tD3bjelu1Sb1XCGWWEV9bNz0zk/7c2RQDnsOCZUD2jmD5mOaSVbOaXNlz4+nGhgsWp2TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157116; c=relaxed/simple;
	bh=RFxURgrbNqZmx1pc7EzRQd16fPcrOc0ykD2JjcUtrXk=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=qQ2Fiqdaa0VfyzMnZfqsDfS16laGr9iiRAbaKdBghLC6aJ+SWAQWS5qHQEc8uoxlipNHE77akqlJyaswwBmYKP8OGpm0zB11zv88rVf1YWav16oVNYafxfbyo+S+MterU0XnjrIPrPuk3s16+CL7hxcCLHIhRR1OOvMUwH0lF5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wp7xf0y6bz1S89b;
	Tue, 20 Aug 2024 20:26:46 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 4236618002B;
	Tue, 20 Aug 2024 20:31:46 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 20 Aug 2024 20:31:45 +0800
CC: Shuai Xue <xueshuai@linux.alibaba.com>, Jing Zhang
	<renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Yicong
 Yang <yangyicong@hisilicon.com>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<quic_vbadigan@quicinc.com>, <quic_nitegupt@quicinc.com>,
	<quic_skananth@quicinc.com>, <quic_ramkri@quicinc.com>,
	<quic_parass@quicinc.com>, <quic_mrana@quicinc.com>
Subject: Re: [PATCH v2 3/4] perf/dwc_pcie: Always register for PCIe bus
 notifier
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
 <20240816-dwc_pmu_fix-v2-3-198b8ab1077c@quicinc.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <79b68805-1b62-7aad-c5c4-a2efb780626e@huawei.com>
Date: Tue, 20 Aug 2024 20:31:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240816-dwc_pmu_fix-v2-3-198b8ab1077c@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/8/16 23:17, Krishna chaitanya chundru wrote:
> When the PCIe devices are discovered late, the driver can't find
> the PCIe devices and returns in the init without registering with
> the bus notifier. Due to that the devices which are discovered late
> the driver can't register for this.
> 
> Register for bus notifier & driver even if the device is not found
> as part of init.
> 
> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  drivers/perf/dwc_pcie_pmu.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index 85a5155d6018..f205ecad2e4c 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -726,7 +726,6 @@ static struct platform_driver dwc_pcie_pmu_driver = {
>  static int __init dwc_pcie_pmu_init(void)
>  {
>  	struct pci_dev *pdev = NULL;
> -	bool found = false;
>  	int ret;
>  
>  	for_each_pci_dev(pdev) {
> @@ -738,11 +737,7 @@ static int __init dwc_pcie_pmu_init(void)
>  			pci_dev_put(pdev);
>  			return ret;
>  		}
> -
> -		found = true;
>  	}
> -	if (!found)
> -		return -ENODEV;
>  
>  	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>  				      "perf/dwc_pcie_pmu:online",
> 

