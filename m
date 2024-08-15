Return-Path: <linux-arm-msm+bounces-28632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC1495309F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9700C2887E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493CA1A7072;
	Thu, 15 Aug 2024 13:44:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03CB1A705B;
	Thu, 15 Aug 2024 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729479; cv=none; b=FS9FtyzBiX8GET/qfz+C3JKLkFJ5pJMhconHtMlNIr9UL3CGCPPz2cK0cz2Sw38wnEecUNFVsFgIN4jCErH/vZVwGvZ/hUfPRYI0cBSB4yq76wi6Z59WPNKE2OFG4ZouJLEgopMrng8/sPBCUhoMHjFAEfCWoTLOjtFJ4OESb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729479; c=relaxed/simple;
	bh=uVmWifW0HS3c4Banhr20uIDh6Blz7xySuRYRmhk0SEc=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FabKJNPxgsi8EsUJJW7YA8b8sRECYUxCVU7bf7eDBhNtIQsWK2VZ7VvPN957cCgWDobg17fznendtneZFssMkraCB5eiEuK0Vg8321ihRAzCtVPU2WLmKbSwE71oxEtXaTh42lcXnONfmEKCmFAu8VTkXVuI+1gBxkA0lqOqzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wl5pQ4FlHz20lh4;
	Thu, 15 Aug 2024 21:39:58 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id C23271A016C;
	Thu, 15 Aug 2024 21:44:33 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 15 Aug 2024 21:44:32 +0800
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
Subject: Re: [PATCH 2/4] Documentation: dwc_pcie_pmu: Update bdf to sbdf
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-2-ca47d153e5b2@quicinc.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <9a6bf90e-ce7f-8a20-93a1-63a75f312392@huawei.com>
Date: Thu, 15 Aug 2024 21:44:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240731-dwc_pmu_fix-v1-2-ca47d153e5b2@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
> Update document to reflect the driver change to use sbdf instead
> of bdf alone.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
> index d47cd229d710..39b8e1fdd0cd 100644
> --- a/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
> +++ b/Documentation/admin-guide/perf/dwc_pcie_pmu.rst
> @@ -46,16 +46,16 @@ Some of the events only exist for specific configurations.
>  DesignWare Cores (DWC) PCIe PMU Driver
>  =======================================
>  
> -This driver adds PMU devices for each PCIe Root Port named based on the BDF of
> +This driver adds PMU devices for each PCIe Root Port named based on the SBDF of
>  the Root Port. For example,
>  
> -    30:03.0 PCI bridge: Device 1ded:8000 (rev 01)
> +    0001:30:03.0 PCI bridge: Device 1ded:8000 (rev 01)
>  
> -the PMU device name for this Root Port is dwc_rootport_3018.
> +the PMU device name for this Root Port is dwc_rootport_13018.
>  
>  The DWC PCIe PMU driver registers a perf PMU driver, which provides
>  description of available events and configuration options in sysfs, see
> -/sys/bus/event_source/devices/dwc_rootport_{bdf}.
> +/sys/bus/event_source/devices/dwc_rootport_{sbdf}.
>  
>  The "format" directory describes format of the config fields of the
>  perf_event_attr structure. The "events" directory provides configuration
> @@ -66,16 +66,16 @@ The "perf list" command shall list the available events from sysfs, e.g.::
>  
>      $# perf list | grep dwc_rootport
>      <...>
> -    dwc_rootport_3018/Rx_PCIe_TLP_Data_Payload/        [Kernel PMU event]
> +    dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/        [Kernel PMU event]
>      <...>
> -    dwc_rootport_3018/rx_memory_read,lane=?/               [Kernel PMU event]
> +    dwc_rootport_13018/rx_memory_read,lane=?/               [Kernel PMU event]
>  
>  Time Based Analysis Event Usage
>  -------------------------------
>  
>  Example usage of counting PCIe RX TLP data payload (Units of bytes)::
>  
> -    $# perf stat -a -e dwc_rootport_3018/Rx_PCIe_TLP_Data_Payload/
> +    $# perf stat -a -e dwc_rootport_13018/Rx_PCIe_TLP_Data_Payload/
>  
>  The average RX/TX bandwidth can be calculated using the following formula:
>  
> @@ -88,7 +88,7 @@ Lane Event Usage
>  Each lane has the same event set and to avoid generating a list of hundreds
>  of events, the user need to specify the lane ID explicitly, e.g.::
>  
> -    $# perf stat -a -e dwc_rootport_3018/rx_memory_read,lane=4/
> +    $# perf stat -a -e dwc_rootport_13018/rx_memory_read,lane=4/
>  
>  The driver does not support sampling, therefore "perf record" will not
>  work. Per-task (without "-a") perf sessions are not supported.
> 

