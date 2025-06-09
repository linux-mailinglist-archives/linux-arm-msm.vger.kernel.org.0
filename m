Return-Path: <linux-arm-msm+bounces-60560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22067AD1870
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 07:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE1B016244D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 05:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD5A27FD7F;
	Mon,  9 Jun 2025 05:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dD7ppcSN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D962727FB1E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jun 2025 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749448680; cv=none; b=Kf57YCcRn/8x8+hu4/Que5i5cugewQHBcm5Eqjq4Ro0ytzlnACCL+2SgUGSrfeSdgYwCXSMe+gcgDAzdKhnlD0xHZcC5WR/seD1ijxldBsVUrAEgLU4NMldQzx03qClZLx7f6bLIXYzfiP3OLKYyRW/1fVpTtdR6DJW4HVLDzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749448680; c=relaxed/simple;
	bh=Mpn3Zxli17D2OF2PlMwZa6rwNKulWuAjX+MzPpEib78=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cs0HF+IPUsvkF4QM+YnzEzvKptPmm4PcG0PsD/vUwws5I8r3Il8vm8mSBUIIDu2VHajO5q0W2jKVT4Dw9u/2D7/K2WByLNqpdU2hjJ0E1WepGG+emLeDDJQ4d0PkTOka8OTf6lp83+CdOPyU5pqgemy1qQdlM+lOjvRDxkCkIao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dD7ppcSN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5590SMLS014675
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Jun 2025 05:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SrUnZXfqt9KjlRqLlnrECKyis2VxRFCvtOYI6adzx6s=; b=dD7ppcSNozsk1fx/
	D1i7xW6mTrzQDTsBetPetUZpgwdvXON/GGz+KHIJ+2zo6zBMsITQZGB4Mf/dcFAF
	qkMUcRBxIrSSrUHMx4tU+MSTQVYQj2ALAoGgsc5v0iTvQb1U1ptjvVnLeL5jZSrH
	ewgGsUmHOzchgLLJjTT8mMY4E8CxWm6nsI8/KRRftrAaT95Paych+FpK4EO5EvhE
	fcrvsokCFmUAtztXj80dOCVNUjESvA5aQanMuG45sjNny+CbxEMAodFaWWNqOcAF
	MRhznrKZ3/+0OEF6xhN/aW2RF2kpq1kr+FDuoJHN2ZwtyddwJG1mKbCXxQRgPY5m
	2ZaAxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475g75s5yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 05:57:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f77f86f6so25174455ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jun 2025 22:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749448676; x=1750053476;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SrUnZXfqt9KjlRqLlnrECKyis2VxRFCvtOYI6adzx6s=;
        b=uUDc0hV2W71ypamuXV7gqCktVAA0Vg/nj7hDJYgj2xfbKK9TwW4B2lgr1nsAIdeCtl
         GKaTxE1qHtTgCh4U/S0vOp+MV0/FKQE+QjHy8nQxLmWF5rgZBqtlbmrIEeWsf3T23EER
         ZTZHeHQYRFjhxb7TrIER3SXPjOa2mEKEkAWws0BzSAfXaSt0YUZGLXt+N9P0EhbDdhZo
         vo76DEjZKHyuP8A2dNWOWz/wmX7wKlagcxz4FH/kJ6EMnZOSXrziOC11H+NbKQE0KZwJ
         bsEcc5Fb2rrIHs10F0X/CgZbKovUFfFFvtZFnT8Zt3lOk/Jv3t71zo5BqnQV2zhHW5+d
         CeQw==
X-Forwarded-Encrypted: i=1; AJvYcCWKoXA5CBuJjGFjqOXuY0j+8/Npt8BSXXQqaPWoRqHuMDtSe2RP+FkWh9Eq4gCeFsRwSnw0leSumSj7T1xr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7t7gp7eVlwOSKHX+tg+R+G7m1EiAWmE0OR3rVDCosGN5S2plL
	g9D04fUZcZd8cKGZZdzZfXpuvo864dMWIVN6NYWcXUS5GI7EUdtY7unlsxEOT52IoO9bXsesoJo
	/rY51Rxf69wtvbU8BTRJ+t+QRKhGZzGdiz0r7z6FbNfYLoW/ug2LYNs0d9AC+buqtgrdR
X-Gm-Gg: ASbGnct2/Deq6vYrcudRluJpHt4eVMafm9BUZUVSMxsD2RtahTDwHgqahlZxKHamdmx
	dumXJJDBHErnAhK0H3Ri87Y3iWSOzecxVeULsw8EHCbc/S5j9ucdFJLwQcUE0Fx8i1emPeAp3NH
	1va1xBaU0xtjgvV/vRWrTD6FpKI34A4F6EPy35MXalrNyi/bIBxMtHq9rzVzGQ7XrVzTIlYSjSm
	0JPBeInScpvx+FCNxkOXZgBL2mSEKalvWb7kGjJx4FA9eJGI2qODpHTdnyoXikp9N0t1EwUJO2R
	IQHWpNa4240al+am2sRdL5YGcb68jB6/nIDaaLz6/mZVzgjINshF
X-Received: by 2002:a17:902:d2c6:b0:234:cc7c:d2fc with SMTP id d9443c01a7336-23601d24945mr160464785ad.27.1749448675832;
        Sun, 08 Jun 2025 22:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE78MvYavfGwv9UjYUEnj5TRNzYelwxltkwZqYUvbIetyfuwzjXm7VoteUx/HSe1LfF8827fg==
X-Received: by 2002:a17:902:d2c6:b0:234:cc7c:d2fc with SMTP id d9443c01a7336-23601d24945mr160464555ad.27.1749448675392;
        Sun, 08 Jun 2025 22:57:55 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340fe89sm47400665ad.204.2025.06.08.22.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 22:57:54 -0700 (PDT)
Message-ID: <7b91b725-6b47-bf8f-e6e5-e4584f274ec4@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 11:27:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] PCI/portdrv: Add support for PCIe wake interrupt
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, Sherry Sun <sherry.sun@nxp.com>
References: <20250605202630.GA622231@bhelgaas>
Content-Language: en-US
In-Reply-To: <20250605202630.GA622231@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 3xe9IQIRNK-5LNnhZ7oEdDDlPvoiTffE
X-Proofpoint-ORIG-GUID: 3xe9IQIRNK-5LNnhZ7oEdDDlPvoiTffE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA0NSBTYWx0ZWRfX19hqM2yinLhz
 0/eXGsQWY81VFVY6pVCwMkgaLJbI5UT0jJpG1tL987zYvBVynrRhqiLbMiK5Eyur/wvY7nKNwkB
 U2wzjLyKhiWQLFOEuYAUZQLROLgewd21jBQ2e0OPqb57JQTJotCPcpReUNfsIvdHHET0HgsTHjB
 C8uuXGQifYZm4OaAX0ATefuzJmUbpxW7zBG4KcikVzQL1Q55mhOAd92NCdcEt7TN8dcAv8+1mFU
 m0jHcM1XPJL3xVX9CPffN8bGusfx1++Eq28fzykebl4W1d6jKOUn9zc9QyufBj+vUCb9M+SrVDF
 Gmr6cvMbNaWLT2TrPgzjftvQ2lOvsqYNp2kccJxjha9SJsM9fpT9lhty292IswC41y9ssmPJz06
 ZV1kKr1SVx5fy0sMuf52dXSgzMPKQadHzpglE8jlta6S3jMDhkHffMH1VJl8FZz+09HJsFt4
X-Authority-Analysis: v=2.4 cv=TeqWtQQh c=1 sm=1 tr=0 ts=684677e5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=sFKuWwQCCB-pgVPeRP0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090045



On 6/6/2025 1:56 AM, Bjorn Helgaas wrote:
> On Thu, Jun 05, 2025 at 10:54:45AM +0530, Krishna Chaitanya Chundru wrote:
>> PCIe wake interrupt is needed for bringing back PCIe device state
>> from D3cold to D0.
> 
> Does this refer to the WAKE# signal or Beacon or both?  I guess the
> comments in the patch suggest WAKE#.  Is there any spec section we can
> cite here?
> 
we are referring only WAKE# signal, I will add the PCIe spec r6.0, sec
5.3.3.2 in next patch version.
>> Implement new functions, of_pci_setup_wake_irq() and
>> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
>> using the Device Tree.
>>
>>  From the port bus driver call these functions to enable wake support
>> for bridges.
> 
> What is the connection to bridges and portdrv?  WAKE# is described in
> PCIe r6.0, sec 5.3.3.2, and PCIe CEM r6.0, sec 2.3, but AFAICS neither
> restricts it to bridges.
> 
The wake# is used by the endpoints to wake host to bring PCIe device
state to D0 again, in direct attach root port wake# will be connected
to the root port and in switch cases the wake# will connected to the
switch Downstream ports and switch will consolidate wake# from different
downstream ports and sends to the root port. The wake# will be used by
root port bridges only. portdrv is the driver for root port.
> Unless there's some related functionality in a Root Port, RCEC, or
> Switch Port, maybe this code should be elsewhere, like
> set_pcie_port_type(), so we could set this up for any PCIe device that
> has a WAKE# description?
> 
As this is only used by root port, I am ok to change it to there to
enable this only in case of rootport.
But we need to make some changes in the flow as of node is not assigned
yet pci dev and also if wake registration fails we can't stop the driver
from probing as driver is not yet in the picture yet.
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> Tested-by: Sherry Sun <sherry.sun@nxp.com>
>> ---
>>   drivers/pci/of.c           | 67 ++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.h          |  6 +++++
>>   drivers/pci/pcie/portdrv.c | 12 ++++++++-
>>   3 files changed, 84 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index ab7a8252bf4137a17971c3eb8ab70ce78ca70969..3487cd62d81f0a66e7408e286475e8d91c2e410a 100644
>> --- a/drivers/pci/of.c
>> +++ b/drivers/pci/of.c
>> @@ -7,6 +7,7 @@
>>   #define pr_fmt(fmt)	"PCI: OF: " fmt
>>   
>>   #include <linux/cleanup.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/irqdomain.h>
>>   #include <linux/kernel.h>
>>   #include <linux/pci.h>
>> @@ -15,6 +16,7 @@
>>   #include <linux/of_address.h>
>>   #include <linux/of_pci.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/pm_wakeirq.h>
>>   #include "pci.h"
>>   
>>   #ifdef CONFIG_PCI
>> @@ -966,3 +968,68 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>>   	return slot_power_limit_mw;
>>   }
>>   EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>> +
>> +/**
>> + * of_pci_slot_setup_wake_irq - Set up wake interrupt for PCI device
>> + * @pdev: The PCI device structure
>> + *
>> + * This function sets up the wake interrupt for a PCI device by getting the
>> + * corresponding WAKE# gpio from the device tree, and configuring it as a
>> + * dedicated wake interrupt.
>> + *
>> + * Return: 0 if the WAKE# gpio is not available or successfully parsed else
>> + * errno otherwise.
>> + */
>> +int of_pci_slot_setup_wake_irq(struct pci_dev *pdev)
>> +{
>> +	struct gpio_desc *wake;
>> +	struct device_node *dn;
>> +	int ret, wake_irq;
>> +
>> +	dn = pci_device_to_OF_node(pdev);
>> +	if (!dn)
>> +		return 0;
>> +
>> +	wake = devm_fwnode_gpiod_get(&pdev->dev, of_fwnode_handle(dn),
>> +				     "wake", GPIOD_IN, NULL);
> 
> I guess this finds "wake-gpio" or "wake-gpios", as used in
> Documentation/devicetree/bindings/pci/qcom,pcie.yaml,
> qcom,pcie-sa8775p.yaml, etc?  Are these names specified in any generic
> place, e.g.,
> https://github.com/devicetree-org/dt-schema/tree/main/dtschema/schemas/pci?
> 
I created a patch to add them in common schemas:
https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/

- Krishna Chaitanya.
>> +	if (IS_ERR(wake) && PTR_ERR(wake) != -ENOENT) {
>> +		dev_err(&pdev->dev, "Failed to get wake GPIO: %ld\n", PTR_ERR(wake));
>> +		return PTR_ERR(wake);
>> +	}
>> +	if (IS_ERR(wake))
>> +		return 0;
>> +
>> +	wake_irq = gpiod_to_irq(wake);
>> +	if (wake_irq < 0) {
>> +		dev_err(&pdev->dev, "Dailed to get wake irq: %d\n", wake_irq);
> 
> s/Dailed/Failed/
> 
>> +		return wake_irq;
>> +	}
>> +
>> +	device_init_wakeup(&pdev->dev, true);
>> +
>> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
>> +	if (ret < 0) {
>> +		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
>> +		device_init_wakeup(&pdev->dev, false);
>> +		return ret;
>> +	}
>> +	irq_set_irq_type(wake_irq, IRQ_TYPE_EDGE_FALLING);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(of_pci_slot_setup_wake_irq);
>> +
>> +/**
>> + * of_pci_slot_teardown_wake_irq - Teardown wake interrupt setup for PCI device
>> + *
>> + * @pdev: The PCI device structure
>> + *
>> + * This function tears down the wake interrupt setup for a PCI device,
>> + * clearing the dedicated wake interrupt and disabling device wake-up.
>> + */
>> +void of_pci_slot_teardown_wake_irq(struct pci_dev *pdev)
>> +{
>> +	dev_pm_clear_wake_irq(&pdev->dev);
>> +	device_init_wakeup(&pdev->dev, false);
>> +}
>> +EXPORT_SYMBOL_GPL(of_pci_slot_teardown_wake_irq);
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 39f368d2f26de872f6484c6cb4e12752abfff7bc..dd7a4da1225bbdb1dff82707b580e7e0a95a5abf 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -888,6 +888,9 @@ void pci_release_of_node(struct pci_dev *dev);
>>   void pci_set_bus_of_node(struct pci_bus *bus);
>>   void pci_release_bus_of_node(struct pci_bus *bus);
>>   
>> +int of_pci_slot_setup_wake_irq(struct pci_dev *pdev);
>> +void of_pci_slot_teardown_wake_irq(struct pci_dev *pdev);
>> +
>>   int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>>   bool of_pci_supply_present(struct device_node *np);
>>   
>> @@ -931,6 +934,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>>   	return 0;
>>   }
>>   
>> +static int of_pci_slot_setup_wake_irq(struct pci_dev *pdev) { return 0; }
>> +static void of_pci_slot_teardown_wake_irq(struct pci_dev *pdev) { }
>> +
>>   static inline bool of_pci_supply_present(struct device_node *np)
>>   {
>>   	return false;
>> diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
>> index e8318fd5f6ed537a1b236a3a0f054161d5710abd..9a6beec87e4523a33ecace684109cd44e025c97b 100644
>> --- a/drivers/pci/pcie/portdrv.c
>> +++ b/drivers/pci/pcie/portdrv.c
>> @@ -694,12 +694,18 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
>>   	     (type != PCI_EXP_TYPE_RC_EC)))
>>   		return -ENODEV;
>>   
>> +	status = of_pci_slot_setup_wake_irq(dev);
>> +	if (status)
>> +		return status;
>> +
>>   	if (type == PCI_EXP_TYPE_RC_EC)
>>   		pcie_link_rcec(dev);
>>   
>>   	status = pcie_port_device_register(dev);
>> -	if (status)
>> +	if (status) {
>> +		of_pci_slot_teardown_wake_irq(dev);
>>   		return status;
>> +	}
>>   
>>   	pci_save_state(dev);
>>   
>> @@ -732,6 +738,8 @@ static void pcie_portdrv_remove(struct pci_dev *dev)
>>   
>>   	pcie_port_device_remove(dev);
>>   
>> +	of_pci_slot_teardown_wake_irq(dev);
>> +
>>   	pci_disable_device(dev);
>>   }
>>   
>> @@ -744,6 +752,8 @@ static void pcie_portdrv_shutdown(struct pci_dev *dev)
>>   	}
>>   
>>   	pcie_port_device_remove(dev);
>> +
>> +	of_pci_slot_teardown_wake_irq(dev);
>>   }
>>   
>>   static pci_ers_result_t pcie_portdrv_error_detected(struct pci_dev *dev,
>>
>> -- 
>> 2.34.1
>>

