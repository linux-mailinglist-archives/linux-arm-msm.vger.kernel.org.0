Return-Path: <linux-arm-msm+bounces-52955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BFCA778A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 12:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DAA73AB280
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258B41EB19A;
	Tue,  1 Apr 2025 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ayrmOtwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E3566A
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502611; cv=none; b=VcQXSjxNxzkyjhPYc6EgPK/zH5Qi/spRYYzqXI0881RhzNHdYYS+9sHk8ZmDA9T+pWWwyKdVdOuOZxXORgkdbi6QmFFZYcE4fcy50mIgQlCJGkgu5VGbUhosThDuUCADS97VkL0XKS3Bufa9Zd2txigr6KRTrRlBjmh+knvB3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502611; c=relaxed/simple;
	bh=sD4CB8CHFNifvtldLEPnFgCM7p6gq3dwx2PAH6fr6uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLNXpCopTNK8MH6EV/wKshS4YaAya/+WMLLawKzVjRTTVZzjyWjHJiaOOd2o5xJQNQxxooJoR7t3mwFxAjogVj5K/9UNg7G3klYTc66qBFS01uzXjts5APBJFMjmdh7vdA56tHwbb0qPFw+1xXwQIBGckcQVzeJ9t/snsZUgWL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ayrmOtwW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5316Jafm031775
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Apr 2025 10:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ytXOIhLLl5YHOvwMutlWCMfcOj8/4IQnCCLBLp7rU8=; b=ayrmOtwW6EDs4Tu1
	uNZIrU+veDGFmzZeLXcJN7wCzvna/tNipxIn0zzCTSb84K4htYdrzOXQoniNgjJt
	sDhQYGB3Q73jzS+Xtr+pdxKc9a//PTolvf7QIVt1kkoOpxDVFRHCkh8lQrojjYn2
	C7akX0HV95NvxsOMNU4kLxF2Kfiq2/FpLF+7I6DdrF+cCWU6drIPIFNyqXB72Vqg
	dJlX/ZrL9S8l4uq/I/+uE/uE6T4r3WctK951XlPBq0qQtwE2SBxZuGzasnV3Ehko
	sCjyHFTdq1DByqD4lTEszFJ1O1KGjWcnRdnQ7hC8bHghMpvJKmNDgBU2dl1lnJje
	oEDkIg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45qxa7tnfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 10:16:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30364fc706fso9388257a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 03:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502608; x=1744107408;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ytXOIhLLl5YHOvwMutlWCMfcOj8/4IQnCCLBLp7rU8=;
        b=FKu2+FsHSOvDb8cIAajp3sDwGEt5kA/YsY0X8G1FcT2IB8Jm3YasYNN5HDneP64XfV
         8i7avxI7vO4KHHJCRoM9YF4STXHxbf9jwEnvRdQ3tSxqfb9gZ3oggIOSW7xUmu2Ddx/s
         ayFOX1ZOrggKWkM7mAgb0bRKrqSOz4R10t3eNkirwvqJn+sgIrgbIL5MOk6i8blbWYia
         uBTS5R6iyB+2pjEwma+9+TabzO9vgqQzBzhScUijehEAYc80RlMveKuxHfai4/6853Ip
         AUVsOB/yWP6rthd7b63Is3d0/Xt6JH10xRgaxrHtKxjo4Uhg6ozqLLefNh/5+Et3JJ5H
         EVlw==
X-Gm-Message-State: AOJu0Yw/Hp/ejZQWFxqI0SylgZ++LMjKQpcLTym6CpG0ewiDpqMMApl0
	0lCxFG4OPvB5HwOJHGZZUtDWhEgiQu1xcJP2KpQjt1tmtEUHlFv+uVIsLQConKJLjRLOH7QevY0
	/W1PB3/vu+cl4kcreslABdF7+oFGHOUjw0+V6h961y3dfLvle5EwrXoGfRrKZNpqV
X-Gm-Gg: ASbGncskD85xv4RPisigSxNhpZjtaRp7T6TsZz2L0WoBzrg7EnxgX6cDXTTba7TO49X
	tovIy6VHG0zpItRbZx4x1xHI+Qbi8HT6g+kemK6cM9HpeJbKl1gaSy1UMDf+eX4wbM1bhYzAbjG
	q7bPN1WWoDB7Ps8h1l2pJZBrLRVG5KWbeMq1glCAhmDV6q/gRh4sTQVVh3aCfx79IDqCDGDGBdI
	msv6DLuw6uLSQEjfchNin0JRJLeEZ+AdH+eNCTvPT8cpd946skZXKBFLIWD6S5nWmtTvBdrY37T
	i4ppwdkJXzdl+2w8ThAw8w0ExUl4TjM+VrGLg/Klu2KTBw==
X-Received: by 2002:a05:6a21:3285:b0:1f3:3690:bf32 with SMTP id adf61e73a8af0-200d13b8205mr4889987637.18.1743502607653;
        Tue, 01 Apr 2025 03:16:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt/SbGJp1ZzXK+tJ23rfeTdETFc59fUK4eY74eMQ8a03RJ15vsBJ1bWLyNMu5ewZz0aPu9xA==
X-Received: by 2002:a05:6a21:3285:b0:1f3:3690:bf32 with SMTP id adf61e73a8af0-200d13b8205mr4889933637.18.1743502607252;
        Tue, 01 Apr 2025 03:16:47 -0700 (PDT)
Received: from [10.92.192.202] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af95d59a786sm5273789a12.53.2025.04.01.03.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:16:46 -0700 (PDT)
Message-ID: <98e99c80-b073-e82a-0ea1-b3ccbe137c59@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 15:46:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] PCI: Add support for PCIe wake interrupt
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250401-wake_irq_support-v1-0-d2e22f4a0efd@oss.qualcomm.com>
 <20250401-wake_irq_support-v1-2-d2e22f4a0efd@oss.qualcomm.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250401-wake_irq_support-v1-2-d2e22f4a0efd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oFhvRXPp0N2_5-95zuez5QeP-fSyG_Ao
X-Proofpoint-GUID: oFhvRXPp0N2_5-95zuez5QeP-fSyG_Ao
X-Authority-Analysis: v=2.4 cv=J9Oq7BnS c=1 sm=1 tr=0 ts=67ebbd10 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=UypG6ifEkSd7053-VuIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010066



On 4/1/2025 10:12 AM, Krishna Chaitanya Chundru wrote:
> PCIe wake interrupt is needed for bringing back PCIe device state
> from D3cold to D0.
> 
> Implement new functions, of_pci_setup_wake_irq() and
> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
> using the Device Tree.
> 
>  From the port bus driver call these functions to enable wake support
> for bridges.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/pci/of.c           | 60 ++++++++++++++++++++++++++++++++++++++++++++++
>   drivers/pci/pci.h          |  6 +++++
>   drivers/pci/pcie/portdrv.c |  6 +++++
>   3 files changed, 72 insertions(+)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 7a806f5c0d201bc322d4a53d6ac47cab2cd28c55..abb0ba001edf604170aaa118f7fdc1a1709c171f 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -7,6 +7,7 @@
>   #define pr_fmt(fmt)	"PCI: OF: " fmt
>   
>   #include <linux/cleanup.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/irqdomain.h>
>   #include <linux/kernel.h>
>   #include <linux/pci.h>
> @@ -15,6 +16,7 @@
>   #include <linux/of_address.h>
>   #include <linux/of_pci.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>   #include "pci.h"
>   
>   #ifdef CONFIG_PCI
> @@ -851,3 +853,61 @@ u32 of_pci_get_slot_power_limit(struct device_node *node,
>   	return slot_power_limit_mw;
>   }
>   EXPORT_SYMBOL_GPL(of_pci_get_slot_power_limit);
> +
> +/**
> + * of_pci_setup_wake_irq - Set up wake interrupt for PCI device
> + * @pdev: The PCI device structure
> + *
> + * This function sets up the wake interrupt for a PCI device by getting the
> + * corresponding GPIO pin from the device tree, and configuring it as a
> + * dedicated wake interrupt.
> + *
> + * Return: 0 if the wake gpio is not available or successfully parsed else
> + * errno otherwise.
> + */
> +int of_pci_setup_wake_irq(struct pci_dev *pdev)
> +{
> +	struct gpio_desc *wake;
> +	struct device_node *dn;
> +	int ret, wake_irq;
> +
> +	dn = pci_device_to_OF_node(pdev);
> +	if (!dn)
> +		return 0;
> +
> +	wake = devm_fwnode_gpiod_get(&pdev->dev, of_fwnode_handle(dn),
> +				     "wake", GPIOD_IN, NULL);
> +	if (IS_ERR(wake)) {
> +		dev_warn(&pdev->dev, "Cannot get wake GPIO\n");
> +		return 0;
> +	}
> +
> +	wake_irq = gpiod_to_irq(wake);
> +	device_init_wakeup(&pdev->dev, true);
> +
> +	ret = dev_pm_set_dedicated_wake_irq(&pdev->dev, wake_irq);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to set wake IRQ: %d\n", ret);
> +		device_init_wakeup(&pdev->dev, false);
> +		return ret;
> +	}
> +	irq_set_irq_type(wake_irq, IRQ_TYPE_EDGE_FALLING);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(of_pci_setup_wake_irq);
> +
> +/**
> + * of_pci_teardown_wake_irq - Teardown wake interrupt setup for PCI device
> + *
> + * @pdev: The PCI device structure
> + *
> + * This function tears down the wake interrupt setup for a PCI device,
> + * clearing the dedicated wake interrupt and disabling device wake-up.
> + */
> +void of_pci_teardown_wake_irq(struct pci_dev *pdev)
> +{
> +	dev_pm_clear_wake_irq(&pdev->dev);
> +	device_init_wakeup(&pdev->dev, false);
> +}
> +EXPORT_SYMBOL_GPL(of_pci_teardown_wake_irq);
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 01e51db8d285af54673db3ea526ceda073c94ec9..6e3d90db4b2505dd3885b482d4c5eafa033714e7 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -820,6 +820,9 @@ void pci_release_of_node(struct pci_dev *dev);
>   void pci_set_bus_of_node(struct pci_bus *bus);
>   void pci_release_bus_of_node(struct pci_bus *bus);
>   
> +int of_pci_setup_wake_irq(struct pci_dev *pdev);
> +void of_pci_teardown_wake_irq(struct pci_dev *pdev);
> +
>   int devm_of_pci_bridge_init(struct device *dev, struct pci_host_bridge *bridge);
>   bool of_pci_supply_present(struct device_node *np);
>   
> @@ -863,6 +866,9 @@ static inline int devm_of_pci_bridge_init(struct device *dev, struct pci_host_br
>   	return 0;
>   }
>   
> +static int of_pci_setup_wake_irq(struct pci_dev *pdev) { return 0; }
> +static void of_pci_teardown_wake_irq(struct pci_dev *pdev) { }
> +
>   static inline bool of_pci_supply_present(struct device_node *np)
>   {
>   	return false;
> diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
> index 02e73099bad0532466fa10f549cc3c5013aa1bbb..fe1da757e9eca0f82ae0d8043c0e4547ac9c30b6 100644
> --- a/drivers/pci/pcie/portdrv.c
> +++ b/drivers/pci/pcie/portdrv.c
> @@ -695,6 +695,10 @@ static int pcie_portdrv_probe(struct pci_dev *dev,
>   	if (type == PCI_EXP_TYPE_RC_EC)
>   		pcie_link_rcec(dev);
>   
> +	status = of_pci_setup_wake_irq(dev);
> +	if (status)
> +		return status;
> +
>   	status = pcie_port_device_register(dev);
>   	if (status)
>   		return status;
> @@ -728,6 +732,8 @@ static void pcie_portdrv_remove(struct pci_dev *dev)
>   		pm_runtime_dont_use_autosuspend(&dev->dev);
>   	}
>   
> +	of_pci_teardown_wake_irq(dev);
> +
>   	pcie_port_device_remove(dev);
>   
>   	pci_disable_device(dev);
> 
we need to teardown the wake irq in shutdown also, I will add it in the
next patch.

- Krishna Chaitanya.

