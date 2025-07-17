Return-Path: <linux-arm-msm+bounces-65440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B72B08B2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084913A8641
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 10:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF1C2D9493;
	Thu, 17 Jul 2025 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhwLQQSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294DC2D8DA2
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 10:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749183; cv=none; b=RiyUo5svD5SdvW3rjoB0lgtF7Wd/bmlyD+TwQljlDw5qAesbMVcDhM/Lv9QqZ/ipCN8jRxjFTwL2ABbklnt8bcEqWtNBCwpePPLfiQDu6/OhnpTCE8oZsiz9AWAjakKeneqTFRcdBycWmWKoQPeErLDi8CNbwY53JJ2PD/Edenc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749183; c=relaxed/simple;
	bh=VvUtV52l3KImX65+9uDS4CdyADX7cz8MKiwoD8yRVK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9OmWkDP0ppyCTjbefQNIzf6lldMMaMGDkSosMkrkBb+536aEo0Cq/NkoHpLVHS9LV9U8RKkjClyF4XEx6gYNPrJcA5n46Z/EOmpNNOIrMvL+4yq+jwokk+UojWP28nAYTTTm20PDlXDvTsb26GfS6WUUQH7SdSphmbLZa0s8kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhwLQQSg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4Y7R4028124
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 10:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B723+r5BA8byBPbGDEYFQhUBH8gC/ULM8G4kkMzp/9M=; b=fhwLQQSgwvLCf9ab
	+C/qprDc5R9QOC2pu3ZcWhRDBjWWi9PTbsx2XUyhTnsVoAJagIZscIRrl+VMH6yi
	sr107eM3f2aBaXIya40TniFoJ0BXK0V4BYXl/qIkW5BznQeH1pmTPZC39Drv4IbT
	wDwhOzBz1a3xuhpb1cv916N0bBN4RuI4Q9UT7rSlnTWHROHcRhGUk1YqEnIyjTca
	ByOCxcESv6JrlX3Fsb3JzVI9KfSEK2uaQaCGYNNYcaa6KV63dAtCGY6fJNRDy8mM
	2iqd2A7QiZlZUeMCrFC2TnelAQsUmGKXZ9MV/goKKXXBp6/0Ocf/HlDBuPFkuqQ3
	ur08+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wnh5yhve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 10:46:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-749177ad09fso422701b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 03:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752749179; x=1753353979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B723+r5BA8byBPbGDEYFQhUBH8gC/ULM8G4kkMzp/9M=;
        b=EUr/gqg8Vq1M+B24GfWCICq07Kim7e8G8/GNuIWVoxfmQDWZWvkZjJqvJuMQ4gT6ax
         a8N2fdbR0guFqykTkiowkbmNWY44WXO2aylrUvdct9frGdydMB0YeNHqF3Qmivt7yie2
         lam1dnR13lWOpbmsPapS5ZbhIgAOSIigTJrY8xjT119EGXK+XUVUEs5oc4yFhGdURTsS
         0LI576iNJCt5HNe9HiilnS7IkAr8j2mwjzarDU7WRdAGkvKl+zSuMfQehAXt6fUl0Id1
         x4fA/NZsECbJP8bS5U/EldR4epXLa2H26/n+u9Yg4JTBc168dJ1IUxt2CoYE9fjS2X+N
         qmdg==
X-Forwarded-Encrypted: i=1; AJvYcCX6vRpgJro1rcPusS3V6yf3qobhgpZrIz37ZX67k/75/ArPUnaXs6fS5rBDAVua5awn6m/ENg1xyM5gTpbP@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNFoXcwHWMWhcZ2wnlPIskUmso4Ut3UP2coLa+pDdJC6/00Kz
	H/5KABYlky+Fa3c+gUKm3v+NKys8z2c9XLAjb/GARop/7nDwQer13KoCX26FlBUxkA0mtI4F0So
	9pmnM0nwGsJ1YwydClxZqe9pXRBVrXMVPh0jM9Dp5Q5OkB7uoDLmvhOlbjrnXbZZ+xW+1
X-Gm-Gg: ASbGnctzGQCKn0GZT6OtY3V26TB1CL4meSUDOyAy+nOpCPoDQESlXS5SK3m1G9jZzQE
	/bF3f+m+xi7oLeoBNJrJ7XGAlGA9l/SJWoFazNx1X4jOCO8Ett/hvN0FIYq4eJE9OtpfJVhFML+
	cZc5L2PQi/rEpWMlXz3ZNXOhewHHQYW+b2Y39xllL64ThSsCc8P2sJFfZQLzXY0LtkLQ+t8zlCs
	I7RSs+UAQiWkhxhe7Gicvfsg/4wO0jU53u9YCkynC1EE9BBEELO/htw9OQ3TXB49ZHfymS1fixP
	g8LXVwHFNHSth6fbYYBG1vAhB1/64p47+2bWw1consWijsSh5lYKZ+j2dQNtcrR4az52eDhFisS
	/ZD67Y4T79e30b/7dGacBK3KHFgawSndE
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id d2e1a72fcca58-75930138e54mr181462b3a.18.1752749179256;
        Thu, 17 Jul 2025 03:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJuVslIFv21m6ImazfJSUw6oMv57Mp8930u7+QPOdytv2k43uhEySGP6kVYQgfWfa8cNhOpw==
X-Received: by 2002:a05:6a00:1d82:b0:759:3013:8dfa with SMTP id d2e1a72fcca58-75930138e54mr181410b3a.18.1752749178734;
        Thu, 17 Jul 2025 03:46:18 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f25269sm15886150b3a.107.2025.07.17.03.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 03:46:18 -0700 (PDT)
Message-ID: <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:46:12 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] wifi: ath12k: Use pci_{enable/disable}_link_state()
 APIs to enable/disable ASPM states
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: manivannan.sadhasivam@oss.qualcomm.com,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org, Bjorn Helgaas <helgaas@kernel.org>,
        ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
References: <20250716-ath-aspm-fix-v1-0-dd3e62c1b692@oss.qualcomm.com>
 <20250716-ath-aspm-fix-v1-4-dd3e62c1b692@oss.qualcomm.com>
 <38ace6a3-d594-4438-a193-cf730a7b87d6@oss.qualcomm.com>
 <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <wyqtr3tz3k2zdf62kgtcepf3sedm7z7wacv27visl2xsrqspmq@wi4fgef2mn2m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dKimmPZb c=1 sm=1 tr=0 ts=6878d47c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=oqDAYNfCzTduPHUzJrAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xjBUgk7JeXriVDxjNbTr8Uv2jTdW3kWK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA5NCBTYWx0ZWRfX14/tYZf1xEJI
 q1s0liUUExlZOGaAjChtYm+HinPQ7G+64Fj8+nTH+33zZ9nyPtTAr6U2KCG5CZN9fxQQ4Yub+hH
 cDfH7THWJalk/brQUjy3SfPIaoup4qhooHDV8EVgm05TeZf4dYEoO0Kg6KCOvPaMRJerrORu6L+
 YTZUcvYGioGRyTcoU6qGz3e75nZSto05WLA3C/tg6Pt5fFXDWoLLEUdBV4boaivdGoh8Gw8iPbU
 4Q3UCHZ3UDfML/W+Hd/6tPMzHCwaDHRTPBwxk3zsI2KyuukPD1In0uvMGfev0iXy/L/8t5jT3wl
 dNOfQJOLRgbrg4/YGkMxQsahHTzkYGCZzqF3iPNEDoDCnVGTFsRMHsRh9NFtdDblb7OCRfmUrJe
 ppRVyh29idYRLeWaS8/2FbzZlrO83Jg96p1/L45fwV0hszlahGcGQAuQpca5dthLFFtE4s93
X-Proofpoint-ORIG-GUID: xjBUgk7JeXriVDxjNbTr8Uv2jTdW3kWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170094



On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
> 
> [...]
> 
>>> @@ -16,6 +16,8 @@
>>>  #include "mhi.h"
>>>  #include "debug.h"
>>>  
>>> +#include "../ath.h"
>>> +
>>>  #define ATH12K_PCI_BAR_NUM		0
>>>  #define ATH12K_PCI_DMA_MASK		36
>>>  
>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>  
>>>  	/* disable L0s and L1 */
>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>
>> Not always, but sometimes seems the 'disable' does not work:
>>
>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>
>>
>>>  
>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>  }
>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>  {
>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>> -						   ab_pci->link_ctl &
>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>
>> always, the 'enable' is not working:
>>
>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>
> 
> Interesting! I applied your diff and I never see this issue so far (across 10+
> reboots):

I was not testing reboot. Here is what I am doing:

step1: rmmod ath12k
step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
the issue)

	sudo setpci -s 02:00.0 0x80.B=0x43

step3: insmod ath12k and check linkctrl

> 
> [    3.758239] ath12k_pci_power_up 1475: link_ctl 0x42
> [    3.758315] ath12k_pci_power_up 1480: link_ctl 0x40
> [    4.383900] ath12k_pci_start 1180: link_ctl 0x40
> [    4.384026] ath12k_pci_start 1185: link_ctl 0x42
> 
> Are you sure that you applied all the 6 patches in the series and not just the
> ath patches? Because, the first 3 PCI core patches are required to make the API
> work as intended.

pretty sure all of them:

$ git log --oneline
07387d1bc17f (HEAD -> VALIDATE-pci-enable-link-state-behavior) wifi: ath12k: dump linkctrl reg
dbb3e5a7828b wifi: ath10k: Use pci_{enable/disable}_link_state() APIs to enable/disable
ASPM states
392d7b3486b3 wifi: ath11k: Use pci_{enable/disable}_link_state() APIs to enable/disable
ASPM states
f2b0685c456d wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable
ASPM states
b1c8fad998f1 PCI/ASPM: Improve the kernel-doc for pci_disable_link_state*() APIs
b8f5204ba4b0 PCI/ASPM: Transition the device to D0 (if required) inside
pci_enable_link_state_locked() API
186b1bbd4c62 PCI/ASPM: Fix the behavior of pci_enable_link_state*() APIs
5a1ad8faaa16 (tag: ath-202507151704, origin/master, origin/main, origin/HEAD) Add
localversion-wireless-testing-ath


> 
>>
>>>  }
>>>  
>>>  static void ath12k_pci_cancel_workqueue(struct ath12k_base *ab)
>>>
>>
>> In addition, frequently I can see below AER warnings:
>>
>> [  280.383143] aer_ratelimit: 30 callbacks suppressed
>> [  280.383151] pcieport 0000:00:1c.0: AER: Correctable error message received from
>> 0000:00:1c.0
>> [  280.383177] pcieport 0000:00:1c.0: PCIe Bus Error: severity=Correctable, type=Data Link
>> Layer, (Transmitter ID)
>> [  280.383184] pcieport 0000:00:1c.0:   device [8086:7ab8] error status/mask=00001000/00002000
>> [  280.383193] pcieport 0000:00:1c.0:    [12] Timeout
>>
> 
> I don't see any AER errors either.

My WLAN chip is attached via a PCIe-to-M.2 adapter, maybe some hardware issue? However I
never saw them until your changes applied.

> 
> - Mani
> 


