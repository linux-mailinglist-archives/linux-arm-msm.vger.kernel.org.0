Return-Path: <linux-arm-msm+bounces-28635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A249F95313C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34051C25595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B973F19E7F6;
	Thu, 15 Aug 2024 13:51:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0361494C5;
	Thu, 15 Aug 2024 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729913; cv=none; b=lUbBEBe4Am4R8YZYLpC2wgG7Ip5MJmQ/fQ5ynduJev5pJ2t+fDiqnWClGd/EvVhZx3e7mgcMjCEEZbfmdQXzCeVmmRF43QLpc8SAcdk3WFm+smXMTNzMqY6h/+n840u42LJ8jWiXfBsh6T0wGXFtIVzkzQzP+dbBKoUTwjgwNfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729913; c=relaxed/simple;
	bh=nFgQxnPUbSSy7jytrvmUlsKG60yuqwDcrmHRHV47t4g=;
	h=CC:Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bXBmGwKDRpbux+wDZz+Bm95qFEzEm+PdGydJ5FoOzRt64oPrI0kE+LAHmFUJrPQn62koBPSzLcPXBM9+Q5wZK7+Tg0f4nUExQ1/RolXS5PpMY47JmUFh7ePUwDHG6IE0mZKL0/16voXyCx2IcrthozlMnDyUfxZ0s/GJbI5FYA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Wl63S5tbsz1T7Pv;
	Thu, 15 Aug 2024 21:51:16 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D1C71800A1;
	Thu, 15 Aug 2024 21:51:48 +0800 (CST)
Received: from [10.67.121.177] (10.67.121.177) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 15 Aug 2024 21:51:47 +0800
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
Subject: Re: [PATCH 4/4] perf/dwc_pcie: Add support for QCOM vendor devices
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
 <20240731-dwc_pmu_fix-v1-4-ca47d153e5b2@quicinc.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <0d285b10-f77d-71d0-2ff1-79e400976af8@huawei.com>
Date: Thu, 15 Aug 2024 21:51:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240731-dwc_pmu_fix-v1-4-ca47d153e5b2@quicinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)

On 2024/7/31 12:23, Krishna chaitanya chundru wrote:
> Update the vendor table with QCOM PCIe vendorid.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>

> ---
>  drivers/perf/dwc_pcie_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
> index aa1010b44bcb..ea73ae5c45c5 100644
> --- a/drivers/perf/dwc_pcie_pmu.c
> +++ b/drivers/perf/dwc_pcie_pmu.c
> @@ -107,6 +107,7 @@ struct dwc_pcie_vendor_id {
>  
>  static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
>  	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
> +	{.vendor_id = PCI_VENDOR_ID_QCOM },
>  	{} /* terminator */
>  };
>  
> 

