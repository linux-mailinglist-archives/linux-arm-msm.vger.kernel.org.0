Return-Path: <linux-arm-msm+bounces-65649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD32BB0A18A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 13:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37228A8779D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92C22BE65E;
	Fri, 18 Jul 2025 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STGkbIFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD542BE634
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752836713; cv=none; b=Uo9ilaNFISYWVQYITO2hYNZ0MkOdaGlHUzVWmmI0xh/OM6Qc0knMfu4r5tsVLP9gJj9JyJb8vduJq8nHElr8AkCbU1piFsC3gWqEJrd+LlRqck6SAOFUTBUbhnPMn37THapRY+We8vMLW2vs0cOF5qVP26aOwSF510UQ4vkXn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752836713; c=relaxed/simple;
	bh=dMtuoxGSdjumZV+lLK49yZ9rk8j5SdmiUjAmrg9aJuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXMmFB6hMO6JMN3WCTHoo2bvPQApGES5qQFd5Mh5StCMsjxYwj9ZyAXGGkbrvJAvlpves504rom1xKcupJb9fQffTgrsyLiSpoAKEs4NJMYvHdpBEDY3r3h7J3ocMW3sTnE1wtr9kD0LJqWeMQIvsu8op/eZG8ig2u0O034Mnfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STGkbIFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IAWIT8015953
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F31vlSMyXbjYusWa7M3cQemIFdIPlrkmW7eRg+7tqFY=; b=STGkbIFqpf7zTrXV
	3k9c8VBN2Vxpfg90hCJg59eGHhVaQ2irgJ+ndSuWZq9yR+qNUbRvlCDC+4s+Q31q
	33sK8izSNBd4tA5Q3Wu9+36EF4Halh8iT1Db5PSAScGolBt03WyZ/qgDpd2AWueA
	rcRComGwDeP6rEaYJBbebtHZhzSK9gCIa7g95XGtA+uwDSXU6LC4rUN2FovrrTp8
	BzenXqoi256UGUUL8Kj6W3nfVxgUa6UNQH5DUcg5ixhMi8SK0kVnrlTViFts1N3f
	yIjk+OVswiyY6fgYbs3j1L8Q6cC3gQ1FAHDqDo9g8Bq7AQ/18af1Z0Vt9S8MF7O+
	Szj//Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47y3tc33x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 11:05:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23824a9bc29so28971075ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 04:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836710; x=1753441510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F31vlSMyXbjYusWa7M3cQemIFdIPlrkmW7eRg+7tqFY=;
        b=YREDRWtHRIHgiU2QL3Cl4D3U0Jj81FDBeVFZtXiOmhF9YF4I0skTyX1WIkT7RKcYio
         o4TKX3m565YQ3nnfB2mB+ejBSED0TqzpSwP1P97QhaEmfDydbpnEL2pdUOuYh+NeXYks
         tNY8mB0PY1Ja1S4waQ0GZsZp9W3eDeKhv9pF77IBjej+5TnonNYrbEoAkqdfjA3J0GN0
         WCKmi8LEGNUv+00mBxULV04Gxe/JoKB5Hh0TCEgNuLL1oI9pRGK9B379K6pZCPYPkCP5
         nCd85mnJ4mznDj0JbUei5hN2QbPcL31EcWMXryyL1mGRW1D3ld7JBVA4hk+3Xhj+3hi1
         pMoA==
X-Forwarded-Encrypted: i=1; AJvYcCXikw6N8kjkfEItELG7Rtc0LuKVfsISzQuFbcNBZHUHT5hu/MPRa5YkHuL4+6X3/gS+8+kyy/5/+CqZCGuU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Mu0ghCxHCglVUD44JgAMC4QW1A/u9qSwxvHHDtNa6S+zaVw1
	k9LU2DEmH6yESYKKoKCEZ8Y4cl/7I0qJxZ+3dE8NvnAmIxk0gduJ2QMlllag//JCVO3PLm7Bk3M
	g/LvaJjzUzrMcKOLd9mpv3tfZJD3JXjuardzaKKyg2rWKDiFIzH13mVW9GsdXVC391BHL
X-Gm-Gg: ASbGncuIpO71EYirS5C5aL706VzBfor8QTGzstnJafhJHAHDU/NUM/Xi3LlZNDQsaCH
	zuNYURXzRuZEupBkGy+a7T2KnDzAwUhpcwQCVHSGij2hk6Q/igQEQhntIUtWr1PlrA5vqY0zaI+
	a5jLqe7XnK2a+5AnXCqX92NbcJCA7RZlBt65cNz/97dVm3BXMk0rjsHwvpWrkfCR3NxEwhon/1r
	d8nj/SZpXJADJbbHlWViE/82yW3sMS4TOA3u7kHX2FSg0AXhwHerbEe+C0fw1d5ASo7nr94WrlS
	epEgvHXPHQeVjnkzi4gXOSKHOjULa0h4IdwSQKPN4SJX4/hRYopw/UpFXE3YdDtshCg22klV3xZ
	vDJD5gt6TaN3RUJ6l6Jhw63n0LyNdR8w5
X-Received: by 2002:a17:903:320b:b0:234:d292:be83 with SMTP id d9443c01a7336-23e25693897mr152371735ad.10.1752836710179;
        Fri, 18 Jul 2025 04:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrxaqDfHtW8KZ3Yog7NNdzKoptJfo76jyLrkhxmzJHeTOo+hCR8UOXByV7C/6RTEySc+0X7Q==
X-Received: by 2002:a17:903:320b:b0:234:d292:be83 with SMTP id d9443c01a7336-23e25693897mr152370645ad.10.1752836709041;
        Fri, 18 Jul 2025 04:05:09 -0700 (PDT)
Received: from [10.133.33.245] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6cfe05sm11056385ad.143.2025.07.18.04.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 04:05:08 -0700 (PDT)
Message-ID: <30fe1325-16d6-4621-a7d2-811d9c958e04@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 19:05:03 +0800
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
 <03806d02-1cfc-4db2-8b63-c1e51f5456e2@oss.qualcomm.com>
 <o2gqqty6lakc4iw7vems2dejh6prjyl746gnq4gny4sxdxl65v@zmqse3244afv>
 <1db7c119-882f-4184-9ca4-9dbe5a49cb16@oss.qualcomm.com>
 <gx5gruyhrhwhvwkiqlkp2bggqd4oqe4quvqiiphfzolhjtzun6@okogvabkqah3>
 <otdgyzdymraa3f33vyb445kmssi3mqf5z2mw7w5pib4q4sb7vz@qbrzvrojqji3>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <otdgyzdymraa3f33vyb445kmssi3mqf5z2mw7w5pib4q4sb7vz@qbrzvrojqji3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z5PsHGRA c=1 sm=1 tr=0 ts=687a2a67 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=_ABfaSfIuMkMDhf_T8wA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: SUNnNrecXOjVPjqDNQY5h0Fg_RXIHlYX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA4NiBTYWx0ZWRfX+++DKErdygxK
 bjCmYqqtUNRKSkpdm1F7KqULdNDBPvLNKy3RaU3jC6bV+j/J7jhebFZgLZdbMXxquR5PlpHVyPv
 CoIfLXukyEkpk7OH+dKsLT7onSi0P+6Z57tXUO6FMbeFneuZ8BWkDzJB+6F45pPuEG8AylegO7x
 LTG8iYca3GasJ89YWxPU9VHf+VPkVW9db6Qz2PwpsHaJEBUXu294YIPJHtMPFOXvwFmbgGX5CFY
 YqWkDW9pysrkbSCv70gB7mZaKNEnwvIFyq8XAs5ny2CSf7xqDmU4rdbDLzzO90Pc1rB3pUW4taV
 7m5MhqnuwtpJifOPKRi9atsnBqQP+h848TQfE8T1XGj8yLlqJqxnWjeD+eaFKUNPrkfhYO2sPlg
 i0swd1KTI34oqdGfqolF3jCUjBwb+YbuI8V2tJ/X8Son+I4oYPdA9VkKTuSrbXCW1lXSrCJB
X-Proofpoint-GUID: SUNnNrecXOjVPjqDNQY5h0Fg_RXIHlYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180086



On 7/18/2025 6:20 PM, Manivannan Sadhasivam wrote:
> On Fri, Jul 18, 2025 at 01:27:27PM GMT, Manivannan Sadhasivam wrote:
>> On Fri, Jul 18, 2025 at 10:05:02AM GMT, Baochen Qiang wrote:
>>>
>>>
>>> On 7/17/2025 7:29 PM, Manivannan Sadhasivam wrote:
>>>> On Thu, Jul 17, 2025 at 06:46:12PM GMT, Baochen Qiang wrote:
>>>>>
>>>>>
>>>>> On 7/17/2025 6:31 PM, Manivannan Sadhasivam wrote:
>>>>>> On Thu, Jul 17, 2025 at 05:24:13PM GMT, Baochen Qiang wrote:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>>> @@ -16,6 +16,8 @@
>>>>>>>>  #include "mhi.h"
>>>>>>>>  #include "debug.h"
>>>>>>>>  
>>>>>>>> +#include "../ath.h"
>>>>>>>> +
>>>>>>>>  #define ATH12K_PCI_BAR_NUM		0
>>>>>>>>  #define ATH12K_PCI_DMA_MASK		36
>>>>>>>>  
>>>>>>>> @@ -928,8 +930,7 @@ static void ath12k_pci_aspm_disable(struct ath12k_pci *ab_pci)
>>>>>>>>  		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
>>>>>>>>  
>>>>>>>>  	/* disable L0s and L1 */
>>>>>>>> -	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>> -				   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>> +	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
>>>>>>>
>>>>>>> Not always, but sometimes seems the 'disable' does not work:
>>>>>>>
>>>>>>> [  279.920507] ath12k_pci_power_up 1475: link_ctl 0x43 //before disable
>>>>>>> [  279.920539] ath12k_pci_power_up 1482: link_ctl 0x43 //after disable
>>>>>>>
>>>>>>>
>>>>>>>>  
>>>>>>>>  	set_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags);
>>>>>>>>  }
>>>>>>>> @@ -958,10 +959,7 @@ static void ath12k_pci_aspm_restore(struct ath12k_pci *ab_pci)
>>>>>>>>  {
>>>>>>>>  	if (ab_pci->ab->hw_params->supports_aspm &&
>>>>>>>>  	    test_and_clear_bit(ATH12K_PCI_ASPM_RESTORE, &ab_pci->flags))
>>>>>>>> -		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC,
>>>>>>>> -						   ab_pci->link_ctl &
>>>>>>>> -						   PCI_EXP_LNKCTL_ASPMC);
>>>>>>>> +		pci_enable_link_state(ab_pci->pdev, ath_pci_aspm_state(ab_pci->link_ctl));
>>>>>>>
>>>>>>> always, the 'enable' is not working:
>>>>>>>
>>>>>>> [  280.561762] ath12k_pci_start 1180: link_ctl 0x43 //before restore
>>>>>>> [  280.561809] ath12k_pci_start 1185: link_ctl 0x42 //after restore
>>>>>>>
>>>>>>
>>>>>> Interesting! I applied your diff and I never see this issue so far (across 10+
>>>>>> reboots):
>>>>>
>>>>> I was not testing reboot. Here is what I am doing:
>>>>>
>>>>> step1: rmmod ath12k
>>>>> step2: force LinkCtrl using setpci (make sure it is 0x43, which seems more likely to see
>>>>> the issue)
>>>>>
>>>>> 	sudo setpci -s 02:00.0 0x80.B=0x43
>>>>>
>>>>> step3: insmod ath12k and check linkctrl
>>>>>
>>>>
>>>> So I did the same and got:
>>>>
>>>> [ 3283.363569] ath12k_pci_power_up 1475: link_ctl 0x43
>>>> [ 3283.363769] ath12k_pci_power_up 1480: link_ctl 0x40
>>>> [ 3284.007661] ath12k_pci_start 1180: link_ctl 0x40
>>>> [ 3284.007826] ath12k_pci_start 1185: link_ctl 0x42
>>>>
>>>> My host machine is Qcom based Thinkpad T14s and it doesn't support L0s. So
>>>> that's why the lnkctl value once enabled becomes 0x42. This is exactly the
>>>> reason why the drivers should not muck around LNKCTL register manually.
>>>
>>> Thanks, then the 0x43 -> 0x40 -> 0x40 -> 0x42 sequence should not be a concern. But still
>>> the random 0x43 -> 0x43 -> 0x43 -> 0x42 sequence seems problematic.
>>>
>>> How many iterations have you done with above steps? From my side it seems random so better
>>> to do some stress test.
>>>
>>
>> So I ran the modprobe for about 50 times on the Intel NUC that has QCA6390, but
>> didn't spot the disparity. This is the script I used:
>>
>> for i in {1..50} ;do echo "Loop $i"; sudo setpci -s 01:00.0 0x80.B=0x43;\
>> sudo modprobe -r ath11k_pci; sleep 1; sudo modprobe ath11k_pci; sleep 1;done
>>
>> And I always got:
>>
>> [ 5862.388083] ath11k_pci_aspm_disable: 609 lnkctrl: 0x43
>> [ 5862.388124] ath11k_pci_aspm_disable: 614 lnkctrl: 0x40
>> [ 5862.876291] ath11k_pci_start: 880 lnkctrl: 0x40
>> [ 5862.876346] ath11k_pci_start: 886 lnkctrl: 0x42
>>
>> Also no AER messages. TBH, I'm not sure how you were able to see the random
>> issues with these APIs. That looks like a race, which is scary.
>>
>> I do not want to ignore your scenario, but would like to reproduce and get to
>> the bottom of it.
>>
> 
> I synced with Baochen internally and able to repro the issue. Ths issue is due
> to hand modifying the LNKCTL register from userspace. The PCI core maintains
> the ASPM state internally and uses it to change the state when the
> pci_{enable/disable}_link_state*() APIs are called.
> 
> So if the userspace or a client driver modifies the LNKCTL register manually, it
> makes the PCI cached ASPM states invalid. So while this series fixes the driver
> from doing that, nothing prevents userspace from doing so using 'setpci' and
> other tools. Userspace should only use sysfs attributes to change the state and
> avoid modifying the PCI registers when the PCI core is controlling the device.
> So this is the reason behind the errantic behavior of the API and it is not due
> to the issue with the API or the PCI core.

IMO we can not rely on userspace doing what or not doing what, or on how it is doing,
right? So can we fix PCI core to avoid this?

> 
> - Mani
> 


