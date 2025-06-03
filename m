Return-Path: <linux-arm-msm+bounces-60086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E2ACC02E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3D7E3A3129
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 06:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204D31547CC;
	Tue,  3 Jun 2025 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kDJEf4fh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CAE25D522
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 06:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748932029; cv=none; b=eQUJNWUf2mZq8gYH/fWvADGK2UOfU8AtGMqHRnAY2HMwMUn+OUdGwxA6+wsOvkeP2uovapG517lWZPBQX0xPFMltl3E5DHDmZlT8dga3ZFFy0DjHYwFTQ1mOTf7MbZrFoBGWcBBnP7VpshjSRp2oPLo/p3gY5cg8cnns9rpgA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748932029; c=relaxed/simple;
	bh=pgbmzyXkjANX9nV6rfBHZhYfTLLC84FPsJOdW1kLwLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=asI2Mi9SnUCCG4sj0GBx9glFLOoJvFu5R44LqlaMJovSlikGKXTGhH87hflMNNS3y9eGRJ/rLbbW3e8S3UKrB656gI51kAaVokVZMnnmgei8Ws0AUaO3vt6AnprCVeG58IEnhedoTwcGPBqBvFLPLi1LRfddBzHHKVsuEfv8osM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDJEf4fh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJsfp011705
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 06:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8CFq5uuLaQJqYVVZzTgnCqorXoI6WhlI7n6d+Xq9WcI=; b=kDJEf4fhE16Pofz1
	yelXVHlZOA/tk0iWqZRBerqE5HH8D4fd7iXmvHLAZLy/xPf3nl1PZl2Q8w4i4+1v
	/drAHNxwf13Bk+NfylsgW2VPNX+tarC4gBhDwGTv38OrCl3qedzK35M1pcN9h/Jl
	L7qnZyD0//g9wK0GRC16vRDO/B3FSYVlXKMzjAndKwPJNKfp4vdiNwQO/6g6QPX4
	Ao855wnriaJhfwWbSqACNCsIKVCp4QjX4wwP77JiXoox1EE86W5geoD9TAXtB7+z
	y02WO5p+3+kiZc0SQKKYeH9ojL4MLdAY2jwPxfqtXiULAiWj7bSVmZR47Ao1vpQ6
	d9JvMg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8sshxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 06:27:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d13ac4d4so75858215ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 23:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748932025; x=1749536825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8CFq5uuLaQJqYVVZzTgnCqorXoI6WhlI7n6d+Xq9WcI=;
        b=KRkiPfagr0+m2XJw0fGiXltxBDSFlSpyG7IfhWd0LskLOxT3TMfkaTXPI9I8U4zkyn
         ShOtvgg/h8XZgdZO5mNAvDIIC6ojN76cWJQrbeCU0WCuKK8MFiLPrsklEd0ig27xl6GH
         EWqD2MdArtqvWGn2GaYEsKuDKa+/GJ6qkuI/QKe1BOqQw7DSKwwyVSd5/i1EdYh20TPk
         tx+n2uuYQdks27x8blOBc8Puu/nNRulztcBEj+rRoa/s/mdxhNTDDlAIx2QtDpGOGPM2
         mhxQHWcwznQthjMFOqKj8SY3lH4a4ST51tNez2tR5NvrwPgIm6ANuB9p33kmBUTss1AH
         WUCw==
X-Forwarded-Encrypted: i=1; AJvYcCWmVLPhWK08LCs5B8rqepopqdAwn925SJ7KTllpGzvBdfzKQWuexXdNYpCTYjR1sH7qxen+wkg4kw/eCf6L@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIGPzDE71tLu+4d1CggfcNkU9AkbARP3hAXa5wHVDp3jA3C1l
	xXMABx3gPzwQdJ/+ERa1hDB66dSwA/dGxOIz1mOK8eEcQCtx687rcvZuFotsNJEoLHheadJwm5a
	cbufd5KD6aVafCiYfzZ+BmJPYbvfOS2/uNIhT0x7blcaKC8E03TbSjZyK0f7bDwTS69QH
X-Gm-Gg: ASbGnct5STj1QN/DnPB+kr7LWBj6mBA4LQ7CqP15T+ua0ijuHP7Ol+QEs9eLAxcq7GC
	x/qft6GhTQo9GZ1nL2ZpHusPRLeg/I/pkfn/chQi5qccnjNFm/xkXqXQCRwvovdM2QK2siCHtBx
	rewEFx5VTYztoU4MlQ8yEZWImUSi1DaSzLuUFbc8YzuBCKw6AnX4gvRiHqLTewv0sp9KPLGhwFl
	ok+RqIeGUUWFP2Utmf2jxDzVwxWPuZqPIvdf6D7syKKphc4FRqwknfGYECnKtXCP9KFWnesKhYl
	ZpMoRvRxsCrU+feUidKMG7CfvXZz0nTPsbI2vDFYtQ==
X-Received: by 2002:a17:903:230d:b0:235:6e1:3ee8 with SMTP id d9443c01a7336-2355f763a30mr159297835ad.11.1748932025518;
        Mon, 02 Jun 2025 23:27:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8aRNsYbc9V+jEebHStqQA2ho4YdUmDecvWv7gxGhSOXn3RlY0aVsETQbYAG9hg+lUAs3nAg==
X-Received: by 2002:a17:903:230d:b0:235:6e1:3ee8 with SMTP id d9443c01a7336-2355f763a30mr159297495ad.11.1748932025106;
        Mon, 02 Jun 2025 23:27:05 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf952bsm80687235ad.191.2025.06.02.23.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 23:27:04 -0700 (PDT)
Message-ID: <c1de3745-d627-0d2f-6d51-679765603f11@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 11:56:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] PCI: Add support for PCIe wake interrupt
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250419-wake_irq_support-v2-0-06baed9a87a1@oss.qualcomm.com>
 <20250419-wake_irq_support-v2-2-06baed9a87a1@oss.qualcomm.com>
 <543ocn4vecyjej26ynjggm6zwj7bmn27rd6c4foo36gvxeltma@6d5dfdoscxwm>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <543ocn4vecyjej26ynjggm6zwj7bmn27rd6c4foo36gvxeltma@6d5dfdoscxwm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=683e95ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Y6MG0PhRDbTeA8aGlRgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1NCBTYWx0ZWRfX6Spf/U7i/kX0
 /NKvzqZKGriKtzsVu50t8NX/mPw8C0XmjZsSeGGFcc9yBFjwr5+axoUDXUSyiFhpyHOger5yxQq
 pAWT7PRfEGh1xIp7RfhLpp+wG0jalbL7LvP1FpXNt+cMtNVCAOOnpxNgBeHZkNSBaZPgLNiyXgF
 cKXCtVtRkFxqBMCkawdfL2bW3oyV4F/yw6aIpmQzIAlf0mtOBDDzFlGAALfQHCXDiSWcTGcM8+T
 v/I2Xe9o2rHCHVGEtQfbAP3qAOXvZ45uoo+5j7iPMhIEXdUYtqckU9MK3rY96Vg9QrzQZ9dnwiG
 7avlXgeBVPfulrddmRI3nKQZR262dUsDKaiXYrg8YqjFsRf+UvjRSHwIMUA/zFMELRYbhngP3dT
 WKBjV5ZEvfTHizTWEy0t4VxZ933DZOn0YaDcyY0x5ijkOkEnTlAgmr9beOIgOE26bqDTCG40
X-Proofpoint-GUID: cHyf1KfnCRRUnLXJWXoaxS_8zjL1thAe
X-Proofpoint-ORIG-GUID: cHyf1KfnCRRUnLXJWXoaxS_8zjL1thAe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030054



On 6/1/2025 8:51 PM, Manivannan Sadhasivam wrote:
> On Sat, Apr 19, 2025 at 11:13:04AM +0530, Krishna Chaitanya Chundru wrote:
> 
> Subject prefix should be 'PCI/portdrv'
> 
>> PCIe wake interrupt is needed for bringing back PCIe device state
>> from D3cold to D0.
>>
>> Implement new functions, of_pci_setup_wake_irq() and
>> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
>> using the Device Tree.
>>
>>  From the port bus driver call these functions to enable wake support
>> for bridges.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/of.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>>   drivers/pci/pci.h          |  6 +++++
>>   drivers/pci/pcie/portdrv.c | 12 +++++++++-
>>   3 files changed, 77 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
>> index ab7a8252bf4137a17971c3eb8ab70ce78ca70969..13623797c88a03dfb9d9079518d87a5e1e68df38 100644
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
>> @@ -966,3 +968,61 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>>   	return slot_power_limit_mw;
>>   }
>>   EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
>> +
>> +/**
>> + * of_pci_setup_wake_irq - Set up wake interrupt for PCI device
> 
> This function is for setting up the wake interrupt for slot, not for endpoint
> devices, isn't it? Then it should be named as such:
> 
> 	of_pci_slot_setup_wake_irq()
> 
>> + * @pdev: The PCI device structure
>> + *
>> + * This function sets up the wake interrupt for a PCI device by getting the
>> + * corresponding GPIO pin from the device tree, and configuring it as a
> 
> s/GPIO pin/WAKE# GPIO
> 
>> + * dedicated wake interrupt.
>> + *
>> + * Return: 0 if the wake gpio is not available or successfully parsed else
> 
> s/wake gpio/WAKE# GPIO
> 
>> + * errno otherwise.
>> + */
>> +int of_pci_setup_wake_irq(struct pci_dev *pdev)
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
>> +	if (IS_ERR(wake)) {
>> +		dev_warn(&pdev->dev, "Cannot get wake GPIO\n");
> 
> WAKE# is an optional GPIO. So the driver should not warn users if it is not
> defined in the root port node. It should however print the error log and return
> errno, if the API returns other than -ENOENT.
> 
>> +		return 0;
>> +	}
>> +
>> +	wake_irq = gpiod_to_irq(wake);
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
>> +EXPORT_SYMBOL_GPL(of_pci_setup_wake_irq);
>> +
>> +/**
>> + * of_pci_teardown_wake_irq - Teardown wake interrupt setup for PCI device
> 
> Same comment as above.
> 
>> + *
>> + * @pdev: The PCI device structure
>> + *
>> + * This function tears down the wake interrupt setup for a PCI device,
>> + * clearing the dedicated wake interrupt and disabling device wake-up.
>> + */
>> +void of_pci_teardown_wake_irq(struct pci_dev *pdev)
>> +{
>> +	dev_pm_clear_wake_irq(&pdev->dev);
>> +	device_init_wakeup(&pdev->dev, false);
>> +}
>> +EXPORT_SYMBOL_GPL(of_pci_teardown_wake_irq);
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index b81e99cd4b62a3022c8b07a09f212f6888674487..b2f65289f4156fa1851c2d2f20c4ca948f36258f 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -888,6 +888,9 @@ void pci_release_of_node(struct pci_dev *dev);
>>   void pci_set_bus_of_node(struct pci_bus *bus);
>>   void pci_release_bus_of_node(struct pci_bus *bus);
>>   
>> +int of_pci_setup_wake_irq(struct pci_dev *pdev);
>> +void of_pci_teardown_wake_irq(struct pci_dev *pdev);
>> +
>>   int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>>   bool of_pci_supply_present(struct device_node *np);
>>   
>> @@ -931,6 +934,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>>   	return 0;
>>   }
>>   
>> +static int of_pci_setup_wake_irq(struct pci_dev *pdev) { return 0; }
>> +static void of_pci_teardown_wake_irq(struct pci_dev *pdev) { }
>> +
> 
> Provide stub for these APIs if CONFIG_OF is not enabled.
> 
These are the stub functions when CONFIG_OF is not enabled.

- Krishna Chaitanya.
> - Mani
> 

