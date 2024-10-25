Return-Path: <linux-arm-msm+bounces-35868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8679B026F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72620284C6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F705231C87;
	Fri, 25 Oct 2024 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4uNGFV+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B915231C8A;
	Fri, 25 Oct 2024 12:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859633; cv=none; b=ckUANAfY0polQtswQZMs389tKZTf3E2HXrQW93KewG4GbVb24WI88oln5lsY6i1KbMtd5kDQlTEdNnzpwHYVrmk+5gHKIMilL8Vjon6maPyM9cw+HIIUz1zKIzzfY0SXPZfZy1+Ho6EonFIuG9H9f6s29EnxW3ZlhiTDxXdkMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859633; c=relaxed/simple;
	bh=lNTR108Nr0vr8nl4kvb3VviXP0BIXBvDxN4RbXTLPHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3NX+rFCncnSIVhKyI2mVQQlQnT5fMNxI4Wc10ec7VoGgbtsgriqkSn6RcJoyofuhSMZ/nToR1sap9n6MRB1laQpqnJW2pQUw7VBL2K7s6+Oy0onuAyrheDTFfLfallwh/K0EssFaPKYTkvfCyRVr9QUlGfqlXA/8+lIyNm2avA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4uNGFV+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729859631; x=1761395631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lNTR108Nr0vr8nl4kvb3VviXP0BIXBvDxN4RbXTLPHc=;
  b=d4uNGFV+vBTQmb97NMjxRvRJWi3RzyDPHwO49HsW2fPVZNhd86pXlZ14
   DyqIVBGdtRCpEfX3eyIJ3w/bZ1EonzxT++F9Er4MRuqDq4lzvjvQ3XeA/
   DFFSf5frMVItDSE1+9xriMHUhWiRoAnjbEiJw7AH1W+XZ8AAZfzLgChLV
   jgQiRNDh273kO0CUgNOWM7+PEAv5f1snqdPcxUlnKbI6dnLWvB680yvj3
   7zXl1tjCt/wcHylseY0ttHN9bqnrsSqGS5UxAu95Jdd/rJGTYgNqdj4Zf
   0ROvzm/GTa/2fqwn96wcEDG5xFKx3ZK6AsoFP4E5rHG8gq2HDG9CyADRd
   w==;
X-CSE-ConnectionGUID: 8Si2HjtzTLiRWDLmwZFEVg==
X-CSE-MsgGUID: NKyoBCFUR1+zKFEvTGYbAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29644636"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="29644636"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:33:50 -0700
X-CSE-ConnectionGUID: izlB4ZUNRVyNNRH/bZ3bwQ==
X-CSE-MsgGUID: duCAq2P3SxW4MlnUZwDPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85669599"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.246.16.81])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 05:33:46 -0700
Message-ID: <be483786-d8d2-4d46-9ca2-fbb629ba0674@intel.com>
Date: Fri, 25 Oct 2024 15:33:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-msm: Slot indexing for distinguishing multiple
 SDCC instances
To: Sachin Gupta <quic_sachgupt@quicinc.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com,
 quic_narepall@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
References: <20241022141828.618-1-quic_sachgupt@quicinc.com>
 <3e2f8132-af87-40c0-9c31-c0103078fe39@intel.com>
 <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <1cb1e8c1-63f4-4752-8358-b5c7078f9c6b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/24 13:37, Sachin Gupta wrote:
> 
> 
> On 10/24/2024 4:38 PM, Adrian Hunter wrote:
>> On 22/10/24 17:18, Sachin Gupta wrote:
>>> This update addresses the requirement for accurate slot indexing
>>> in the sdhci-msm driver to differentiate between multiple SDCC
>>> (Secure Digital Card Controller) instances, such as eMMC, SD card,
>>> and SDIO.
>>>
>>> Additionally, it revises the slot indexing logic to comply with
>>> the new device tree (DT) specifications.
>>
>> This patch seems incomplete because all it does is assign a global
>> variable which is never used again.
>>
> 
> Qualcomm internal debugging tools utilize this global variable to
> access and differentiate between all the instance's sdhci_msm_host
> data structure (eMMC, SD card, and SDIO).

The kernel does not accept code that does not serve a functional
purpose.

You could look at using eBPF or KGDB to get the information,
otherwise you might just have to carry that kind of patch in
your internal tree.

> 
>>>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>> Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
>>> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>> ---
>>>   drivers/mmc/host/sdhci-msm.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>>> index e113b99a3eab..3cb79117916f 100644
>>> --- a/drivers/mmc/host/sdhci-msm.c
>>> +++ b/drivers/mmc/host/sdhci-msm.c
>>> @@ -292,6 +292,8 @@ struct sdhci_msm_host {
>>>       bool vqmmc_enabled;
>>>   };
>>>   +static struct sdhci_msm_host *sdhci_slot[3];
>>> +
>>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>>   {
>>>       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>> @@ -2426,6 +2428,14 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>>       if (ret)
>>>           goto pltfm_free;
>>>   +    if (node) {
>>> +        ret = of_alias_get_id(pdev->dev.of_node, "mmc");
>>> +        if (ret < 0)
>>> +            dev_err(&pdev->dev, "get slot index failed %d\n", ret);
>>> +        else
>>> +            sdhci_slot[ret] = msm_host;
>>> +    }
>>> +
>>>       /*
>>>        * Based on the compatible string, load the required msm host info from
>>>        * the data associated with the version info.
>>
> 


