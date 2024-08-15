Return-Path: <linux-arm-msm+bounces-28631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DDE953035
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F1541F26782
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F462187348;
	Thu, 15 Aug 2024 13:40:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8E01714A8;
	Thu, 15 Aug 2024 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729220; cv=none; b=pLgfCFrSStxsiaDp+kvX4GPGMUjo1RozxbHV9RCmU5+2onvs3kV/cAj9JjMBa+gp1VZt5HsmjUvnV9CoCbT0okPnZiRAWBlMwCuZYqUPLTymdP4yT5pCpq1C/SSoi0uzoYnFoioAFutuc0cEzA9vYAp46jCe55EBDKsdkAcAI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729220; c=relaxed/simple;
	bh=LsEF9SwjjRfvqRTvgOKr/Mldazy9d/zwtcPOdxn7FGQ=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=S3QSAuNeppFnbMUF3/BvXWjJeQt2uMw6TV8wxDzVCvNS20FXqIocKvnenxcKep/Vsx+A4a7N1YgOogOqvX+dVABnUubfKeSA80nLeyl8IXGqKBxwH5vE/Xxw5BuSfKUAITigkLIVkDR8+bNTSMbiSJYb2tPkToVuqXquVyAHVw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wl5p66BKLzyPsT;
	Thu, 15 Aug 2024 21:39:42 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B0701800A4;
	Thu, 15 Aug 2024 21:40:14 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 15 Aug 2024 21:40:13 +0800
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
Subject: Re: [PATCH 1/4] perf/dwc_pcie: Fix registration issue in multi PCIe
 controller instances
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-1-ca47d153e5b2@quicinc.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <3dcb4074-9958-b454-7456-9dcc455dd736@huawei.com>
Date: Thu, 15 Aug 2024 21:40:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240731-dwc_pmu_fix-v1-1-ca47d153e5b2@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
> When there are multiple of instances of PCIe controllers, registration
> to perf driver fails with this error.
> sysfs: cannot create duplicate filename '/devices/platform/dwc_pcie_pmu.0'
> CPU: 0 PID: 166 Comm: modprobe Not tainted 6.10.0-rc2-next-20240607-dirty
> Hardware name: Qualcomm SA8775P Ride (DT)
> Call trace:
>  dump_backtrace.part.8+0x98/0xf0
>  show_stack+0x14/0x1c
>  dump_stack_lvl+0x74/0x88
>  dump_stack+0x14/0x1c
>  sysfs_warn_dup+0x60/0x78
>  sysfs_create_dir_ns+0xe8/0x100
>  kobject_add_internal+0x94/0x224
>  kobject_add+0xa8/0x118
>  device_add+0x298/0x7b4
>  platform_device_add+0x1a0/0x228
>  platform_device_register_full+0x11c/0x148
>  dwc_pcie_register_dev+0x74/0xf0 [dwc_pcie_pmu]
>  dwc_pcie_pmu_init+0x7c/0x1000 [dwc_pcie_pmu]
>  do_one_initcall+0x58/0x1c0
>  do_init_module+0x58/0x208
>  load_module+0x1804/0x188c
>  __do_sys_init_module+0x18c/0x1f0
>  __arm64_sys_init_module+0x14/0x1c
>  invoke_syscall+0x40/0xf8
>  el0_svc_common.constprop.1+0x70/0xf4
>  do_el0_svc+0x18/0x20
>  el0_svc+0x28/0xb0
>  el0t_64_sync_handler+0x9c/0xc0
>  el0t_64_sync+0x160/0x164
> kobject: kobject_add_internal failed for dwc_pcie_pmu.0 with -EEXIST,
> don't try to register things with the same name in the same directory.
> 
> This is because of having same bdf value for devices under two different
> controllers.
> 
> Update the logic to use sbdf which is a unique number in case of
> multi instance also.
> 
> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")

Did you run into this on a QCOM platform with Patch 4/4 since there's
multiple PCIe domains?

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/perf/dwc_pcie_pmu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index c5e328f23841..c115348b8d53 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -556,10 +556,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
>  {
>  	struct platform_device *plat_dev;
>  	struct dwc_pcie_dev_info *dev_info;
> -	u32 bdf;
> +	u32 sbdf;
>  
> -	bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
> -	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", bdf,
> +	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
> +	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
>  						 pdev, sizeof(*pdev));
>  
>  	if (IS_ERR(plat_dev))
> @@ -611,15 +611,15 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>  	struct pci_dev *pdev = plat_dev->dev.platform_data;
>  	struct dwc_pcie_pmu *pcie_pmu;
>  	char *name;
> -	u32 bdf, val;
> +	u32 sbdf, val;
>  	u16 vsec;
>  	int ret;
>  
>  	vsec = pci_find_vsec_capability(pdev, pdev->vendor,
>  					DWC_PCIE_VSEC_RAS_DES_ID);
>  	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
> -	bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
> -	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", bdf);
> +	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);

sbdf is also registerd as the id of the platform device in platform_device_register_data() above,
can we use it directly here without encoding it again?

Thanks.

> +	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
>  	if (!name)
>  		return -ENOMEM;
>  
> @@ -650,7 +650,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>  	ret = cpuhp_state_add_instance(dwc_pcie_pmu_hp_state,
>  				       &pcie_pmu->cpuhp_node);
>  	if (ret) {
> -		pci_err(pdev, "Error %d registering hotplug @%x\n", ret, bdf);
> +		pci_err(pdev, "Error %d registering hotplug @%x\n", ret, sbdf);
>  		return ret;
>  	}
>  
> @@ -663,7 +663,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
>  
>  	ret = perf_pmu_register(&pcie_pmu->pmu, name, -1);
>  	if (ret) {
> -		pci_err(pdev, "Error %d registering PMU @%x\n", ret, bdf);
> +		pci_err(pdev, "Error %d registering PMU @%x\n", ret, sbdf);
>  		return ret;
>  	}
>  	ret = devm_add_action_or_reset(&plat_dev->dev, dwc_pcie_unregister_pmu,
> 

