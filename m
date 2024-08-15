Return-Path: <linux-arm-msm+bounces-28634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ACD953109
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BAF81C23CAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36319E7F6;
	Thu, 15 Aug 2024 13:49:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B011494C5;
	Thu, 15 Aug 2024 13:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729770; cv=none; b=FH+4LG9pEg0So+hPyYbCFsqV1B1LY8a6FvqZNB7OEMknOZkb5ks1X2qdU5LF9LC+mLIjDFz9fPKQBQu5Z+taTKTcZYFqqNYJJNNH4568lk1tuaRWTFsnK2ULE9LqPBo58HyUCY4qFZ28MeBKw35c+GXBq90/KRBQAzyvlha7g1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729770; c=relaxed/simple;
	bh=TCpjlsm4xqeK0L2uxXsv6Gm044Qcen8eAGQR3XuiNRg=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jGEH27V5hWCq+OKwzU6tsDb8sjobYSszR0zY9He9W8P0XEeEukHkMDRRlBSK2C/Tvlb+w3fcuN2OqHqhLF+VIzOLx1xUOHrpc6J59oAKizQQWMnh6LGu2wcKIialI5Pu9tHNOyjSr1wJ7HA9JIjsFYdQc3SN3RGH5C71BOinsnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wl5vz5Dx6zQpvK;
	Thu, 15 Aug 2024 21:44:47 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A4621400E3;
	Thu, 15 Aug 2024 21:49:23 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 15 Aug 2024 21:49:22 +0800
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
Subject: Re: [PATCH 3/4] perf/dwc_pcie: Always register for PCIe bus notifier
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-3-ca47d153e5b2@quicinc.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <55303289-bb41-4e67-9912-4cf4335244ca@huawei.com>
Date: Thu, 15 Aug 2024 21:49:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240731-dwc_pmu_fix-v1-3-ca47d153e5b2@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
> When the PCIe devices are discovered late, the driver can't find
> the PCIe devices and returns in the init without registering with
> the bus notifier. Due to that the devices which are discovered late
> the driver can't register for this.
> 
> Register for bus notifier even if the device is not found in init.
> 
> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/perf/dwc_pcie_pmu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index c115348b8d53..aa1010b44bcb 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -741,8 +741,6 @@ static int __init dwc_pcie_pmu_init(void)
>  
>  		found = true;
>  	}
> -	if (!found)
> -		return -ENODEV;
>  
>  	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>  				      "perf/dwc_pcie_pmu:online",
> @@ -753,9 +751,11 @@ static int __init dwc_pcie_pmu_init(void)
>  
>  	dwc_pcie_pmu_hp_state = ret;
>  
> -	ret = platform_driver_register(&dwc_pcie_pmu_driver);
> -	if (ret)
> -		goto platform_driver_register_err;
> +	if (!found) {
> +		ret = platform_driver_register(&dwc_pcie_pmu_driver);
> +		if (ret)
> +			goto platform_driver_register_err;
> +	}
> 

This doesn't match the commit.

If any device is found at this stage, we cannot use them since you don't
register a driver.

>  	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
>  	if (ret)
> 

