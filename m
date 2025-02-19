Return-Path: <linux-arm-msm+bounces-48544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C66A3C6E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78E153B62A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D57021481F;
	Wed, 19 Feb 2025 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PscXiEyB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18139214805
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739987941; cv=none; b=PquYUSnzFo8zHWYT+g+ml6xYyH8/w2YPaVBExplukVjVcArZkJ8Ulg6ZjIkn8IcKR9zbatYoATt05vT89JUZpcaQoeZN2oWJpqFkPRMmM62hsqcZujrs+rb4y6PVfzKBUjcRjDCcw2vhIdT5ex20XVgDIh00K06dclL7RxxGZPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739987941; c=relaxed/simple;
	bh=bca4/lOlAI/66D+6VdDDMQS936BD6LQ3sNTZwS+FImM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBCm5lAuUP75IBzYQdRx2XS/k1xppUyyBlYHft71dp6Z2dKcnHMJUySqmulekdKvnZc40PoTqE/BlHp1dSQlyR8u35AHHSEzeJrxtyCc8D7Qj4JHLaUXU/Ysi1E7ngC45xQFcsuk1e72pl7ARQqOjlqUcOK4vYel263tyu/myUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PscXiEyB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGJJq3023221
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZPYXYhznydRoNkH0Kcvg2U8jDI9yURgtXY5VTKjyko=; b=PscXiEyBqT9oImjr
	DFubEALiRiOyR2Gck+mvk+zM7IYu3Zd6Lu+mYqBLHt6p5SjWEk9/HJVlYhTYQz60
	j1QXksRrA3taY8NCfFDngNHvgoop6FXffcl1BBJ43j9eeMSCecXOZwwUo96ARn3j
	GKZWpVIh45VZbmTsroHh+xzwIHYVrgHh9eLscZ+2BKqxb3FQOgzMvNnZRn5zZQLe
	n+fCVkTUbKjHERsTCKYqgfwr3nfvcacsSM80R+4uWAQi6hkK2IpOQPF/8HW4Vdd6
	ZitGL/o5uWzT+BPlLjhCpJNaqKz9Gt30ZKVpB6jzuH58QsgQHzleB9D1o3fXmZPt
	NSa0xw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3kj6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:58:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22114b800f0so121388445ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739987937; x=1740592737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZPYXYhznydRoNkH0Kcvg2U8jDI9yURgtXY5VTKjyko=;
        b=H78wOo5Acqht6M8gZM7cfWzI9DA3yUL55WEGicpffwbcauAqBvW3eaIRG4Z5SUmilj
         8gQO17Zuo2a9TJl7dBIL9CewzTdRL8BfmXbNPHIkblYCXQ0ZgRoNU5wNJQ8VZLW9Ot3/
         YOVPSAyu8UlCA4+aJdCYSmFpXQvfpAvLwY+L+bX2lrr7dUbwxV/G5ViRVlzwFqsE51hj
         txXy5FF8pXiB+iTeeUMOREqszznMGzse0bQGeBHOEVnKjhBNpqL7ZWe7GuCSj+cSjau5
         U69tXckcqZNRHllIj9TE1s6l4SEo/vtAOq2ZP1xsRQop4kCYViv33Z5goQoBV5j7azLx
         QSFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW92Qxg6XkAZUD+mEDOOR5nFXGCydvaat7tdlEoTQ254VeeVtQFqVxswC5RAlPWZnyszjvYRJjkbrMKflOu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywei/LaI2c3V+I8G+KiHK4TrYfE83S1BP8PZFfZviWxgvPPIRFR
	2bpV1svj6YzazLMS9FOk+JdVCJRIjvlK5AsXop9ZIAkid70oV8CAQCRIUjXWWWDLLNF6dw4PuXx
	fmHsyZzq/sl84JeqWCIfLL7Gc7/u8TRoYD23BX+WFvSm3+b1pcoc52PkImIzAKSrG
X-Gm-Gg: ASbGncu/rYNbn+UDQPtfexzCKvdTbIPGId16C3B55mbLeJXdWoFOzrj7e9A8Txn+k8h
	yYmjWKjUVBxsj4pWOTIYKzl9SFakdzxCO1p2erUIFw08bnnyKvkTN7FebumSQRUsBEI/Zpchy4v
	0jw/keuDbzkAx/+JrSR99C+fP6W2bZJy1kEOPdYOpHQUVhTuExfuSK7FmqwhT4bne/c2ubN+8vb
	k5u4zi03Rn+RoROsoTOHcVMY8WTiYJxNPHQClourEIz5Rhy9WYcoRLY3pWWh6iKKt5ceahNGnU5
	VqIh6bICQVxvuN2FgUenMZuWSvnYy9HAzMg=
X-Received: by 2002:a17:902:f543:b0:21f:542e:dd0a with SMTP id d9443c01a7336-221040a99d9mr278372575ad.41.1739987937119;
        Wed, 19 Feb 2025 09:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUYFCEoZHriB5wecTnOAu53AMlZezfTLFnsL8ikE+PkMeZB3Iwnzg0FnHSPGIoH3cIgQ5kgg==
X-Received: by 2002:a17:902:f543:b0:21f:542e:dd0a with SMTP id d9443c01a7336-221040a99d9mr278372065ad.41.1739987936755;
        Wed, 19 Feb 2025 09:58:56 -0800 (PST)
Received: from [192.168.29.92] ([49.43.231.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536b047sm107696615ad.101.2025.02.19.09.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:58:56 -0800 (PST)
Message-ID: <f0e5efb7-8ea0-a064-21e4-6d7596b1a9ae@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 23:28:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] PCI: dwc: qcom: Update ICC & OPP votes based upon the
 requested speed
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_jjohnson@quicinc.com,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com
References: <20250218220728.GA194681@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250218220728.GA194681@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JokIXWSV72tuUrrJbEvU_Tc1-9KEc1Rl
X-Proofpoint-ORIG-GUID: JokIXWSV72tuUrrJbEvU_Tc1-9KEc1Rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190139



On 2/19/2025 3:37 AM, Bjorn Helgaas wrote:
> Make subject line match history for this file.
> 
> On Mon, Feb 17, 2025 at 12:04:11PM +0530, Krishna Chaitanya Chundru wrote:
>> QCOM PCIe controllers needs to disable ASPM before initiating link
>> re-train. So as part of pre_bw_scale() disable ASPM and as part of
>> post_scale_bus_bw() enable ASPM back.
> 
> s/needs/need/
> 
> Why does Qcom need to disable ASPM?  Is there a PCIe spec restriction
> about this that should be applied to all PCIe host bridges?  Or is
> this a Qcom defect?
> 
It is QCOM controller issue, PCIe spec doesn't mention to disable ASPM.
>> Update ICC & OPP votes based on the requested speed so that RPMh votes
>> gets updated based on the speed.
> 
> s/gets/get/
> 
>> Bring out the core logic from qcom_pcie_icc_opp_update() to new function
>> qcom_pcie_set_icc_opp().
> 
> This refactoring possibly could be a separate patch to make the meat
> of this change clearer.
> 
ack.

- Krishna Chaitanya.
>> +static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
>> +{
>> +	struct dw_pcie *pci = pcie->pci;
>> +	unsigned long freq_kbps;
>> +	struct dev_pm_opp *opp;
>> +	int ret, freq_mbps;
>> +
>> +	if (pcie->icc_mem) {
>> +		ret = icc_set_bw(pcie->icc_mem, 0,
>> +				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
>> +		if (ret) {
>> +			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
>> +				ret);
>> +		}
>> +	} else if (pcie->use_pm_opp) {
>> +		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
>> +		if (freq_mbps < 0)
>> +			return -EINVAL;
>> +
>> +		freq_kbps = freq_mbps * KILO;
>> +		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
>> +						 true);
>> +		if (!IS_ERR(opp)) {
>> +			ret = dev_pm_opp_set_opp(pci->dev, opp);
>> +			if (ret)
>> +				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
>> +					freq_kbps * width, ret);
>> +			dev_pm_opp_put(opp);
>> +		}
>> +	}
>> +
>> +	return ret;
> 
> Looks uninitialized in some paths.

