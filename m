Return-Path: <linux-arm-msm+bounces-35762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A0D9AF6DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED07B1F21985
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 01:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 319982AF00;
	Fri, 25 Oct 2024 01:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QIpeJ6Wf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A25C8D7;
	Fri, 25 Oct 2024 01:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820095; cv=none; b=NwdC/49W+9xWqivPNsgtS2UFfLT381HmGKYa4kCEtZpd3SlJZlCziaqGvmnXWvpa1/YlTwSdfJBJvOfPuGRKlDgwmAjgdO/f5P+eMpHsrVOCpRkzCZcX+kklmRMlIVdJA/1EvCptiRJAECkHErEyyQmFANX+wYEO0lDOH0y/ZRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820095; c=relaxed/simple;
	bh=XNgMadnOoxiaYRnSGvZgKDrRxyKZfFg+vfCBn3FhO4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mGSBTsxRY5EcK4VE1t0F8IBfpqlFkCBEfEw7i0DMuYxn7yRcfzXrdLYdJZlimIbVx2a7dGD5AGHrzh7q0gql06hsWmJAnXvRuoFDFFZ2uE2ypln8BlVRB5zZAAw3etoSZsib2o56M31HF3P1ngyT/28nOp/b0U6s2Zy4KbFRkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QIpeJ6Wf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKcuk5029449;
	Fri, 25 Oct 2024 01:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6MLf+Y/aCDveXs9hGkvNQtX3/JgMfifQtCF8OwlN1o=; b=QIpeJ6WfgoHr6ncS
	Dleg8PAc+92bwAsH6twIiWPqmfViUyUgF3i24OTvbG+jXyDs3JmmmTIM/dVE640C
	MzmM80qGu+yHSXpJDNTEAprLZwsBk9V/B4kUnya6yBo7NgMxQP8B8jvW9MIaa/P2
	kUtlF0hjSxVhDpFFcnAj3fcdIaVKwCU7K9brI71Ptnxu9ZKvgHaqOxP9aNadRM3w
	Q3ypPGiKgqp4qFvS0nsV5Q9tQLsYlks8jdn/y0LkKF4wCd4Eo7KOMz+0XW+VA6eD
	SQIvFFpkmrRddXbK4ktPBwHtnJN2q+tGQJiryfDI/OyBmvq48fXZ4Eyty3FZ5Pzj
	oFNSgQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3w7dv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 01:34:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P1Yl0H029660
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 01:34:47 GMT
Received: from [10.216.6.117] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 18:34:40 -0700
Message-ID: <ec15e7d2-ed18-b2fe-37a1-9609c5c91d1a@quicinc.com>
Date: Fri, 25 Oct 2024 07:04:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/1] mmc: sdhci-msm: Toggle the FIFO write clock after
 ungate
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_sachgupt@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <kernel@quicinc.com>
References: <20241022111025.25157-1-quic_rampraka@quicinc.com>
 <CAPDyKFr8EhLU8EhydypLwL_PZH0+KMTqAU_D7AFdNmRac5R=vg@mail.gmail.com>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <CAPDyKFr8EhLU8EhydypLwL_PZH0+KMTqAU_D7AFdNmRac5R=vg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1wll00Pfxp1rhaGlRopnccq9WKCH-Pav
X-Proofpoint-GUID: 1wll00Pfxp1rhaGlRopnccq9WKCH-Pav
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250011



On 10/22/2024 6:15 PM, Ulf Hansson wrote:
> On Tue, 22 Oct 2024 at 13:10, Ram Prakash Gupta
> <quic_rampraka@quicinc.com> wrote:
>>
>> For Qualcomm SoCs with sdcc minor version 6B and more, command path
>> state machine is getting corrupted post clock ungate which is leading
>> to software timeout.
>>
>> Toggle the write fifo clock to reset the async fifo to fix this issue.
>>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> 
> Seems like we should add a stable tag, but do we have a fixes tag that
> we can use too?
> 
> Kind regards
> Uffe
>

No, we don't have fixes tag for this as this is not dependent on any
software version. And there is no way to map minor version with stable
tag also here, I guess. But I agree this needs stable tag, if you have
any suggestion to find right stable tag, we can add.

Thanks
Ram

>> ---
>>   drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e113b99a3eab..c2ccdac21232 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -146,6 +146,7 @@
>>   /* CQHCI vendor specific registers */
>>   #define CQHCI_VENDOR_CFG1      0xA00
>>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
>> +#define RCLK_TOGGLE BIT(1)
>>
>>   struct sdhci_msm_offset {
>>          u32 core_hc_mode;
>> @@ -290,6 +291,7 @@ struct sdhci_msm_host {
>>          u32 dll_config;
>>          u32 ddr_config;
>>          bool vqmmc_enabled;
>> +       bool toggle_fifo_clk;
>>   };
>>
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -1162,6 +1164,39 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
>>          return ret;
>>   }
>>
>> +/*
>> + * After MCLK ugating, toggle the FIFO write clock to get
>> + * the FIFO pointers and flags to valid state.
>> + */
>> +static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
>> +{
>> +       u32 config;
>> +       struct mmc_ios ios = host->mmc->ios;
>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +       const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>> +
>> +       if ((msm_host->tuning_done || ios.enhanced_strobe) &&
>> +               host->mmc->ios.timing == MMC_TIMING_MMC_HS400) {
>> +               /*
>> +                * Select MCLK as DLL input clock.
>> +                */
>> +               config = readl_relaxed(host->ioaddr + msm_offset->core_dll_config_3);
>> +               config |= RCLK_TOGGLE;
>> +               writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
>> +
>> +               /* ensure above write as toggling same bit quickly */
>> +               wmb();
>> +               udelay(2);
>> +
>> +               /*
>> +                * Select RCLK as DLL input clock
>> +                */
>> +               config &= ~RCLK_TOGGLE;
>> +               writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config_3);
>> +       }
>> +}
>> +
>>   static void sdhci_msm_set_cdr(struct sdhci_host *host, bool enable)
>>   {
>>          const struct sdhci_msm_offset *msm_offset = sdhci_priv_msm_offset(host);
>> @@ -2587,6 +2622,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>          if (core_major == 1 && core_minor >= 0x71)
>>                  msm_host->uses_tassadar_dll = true;
>>
>> +       if (core_major == 1 && core_minor >= 0x6B)
>> +               msm_host->toggle_fifo_clk = true;
>> +
>>          ret = sdhci_msm_register_vreg(msm_host);
>>          if (ret)
>>                  goto clk_disable;
>> @@ -2720,6 +2758,9 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>>                                         msm_host->bulk_clks);
>>          if (ret)
>>                  return ret;
>> +
>> +       if (msm_host->toggle_fifo_clk)
>> +               sdhci_msm_toggle_fifo_write_clk(host);
>>          /*
>>           * Whenever core-clock is gated dynamically, it's needed to
>>           * restore the SDR DLL settings when the clock is ungated.
>> --
>> 2.17.1
>>

