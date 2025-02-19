Return-Path: <linux-arm-msm+bounces-48543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB435A3C6D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 18:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9126916CA83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 17:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B7A2147F4;
	Wed, 19 Feb 2025 17:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1SRxA3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0162116EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739987856; cv=none; b=fnMnlXiq07d31wGx8GFwMGGIgyxZPJ14L6U4Q4oHC90O617UN4uWXywP6TlFjNB5562GECPGqas8n1F3g6a1djxId2bENqlqPkuQAV8UkNsluC6735ejFLZJWoEfUi+lOubjV2gZyV+xpjJvNQL36mUkbiUbJaszOK4WdTWx1f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739987856; c=relaxed/simple;
	bh=6sc5vtDBVt0WGcXf2/2k+XKp2TfrekaRkNGeNs+uqtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LWSuKTv7cEg8nDszyNk4sNh100Pd3xY7JyUutVFF9w+s+TaO9j6PmLSAzV8oULL8Kj5mBv0SqVxnriSJ6z0qHKBRio7dBAHlSn51GD3xeYe5QSG3ru6qoD4qqmdYKno78btDhQO1/gMdxOyPImSzkbaQ4Ddha7/1Gm8l7Vm/IYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1SRxA3G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JH93UQ025937
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78pq2Tqo6aDU3KcPcf25D+KEq6BDiVBvwf3/VKY2io8=; b=N1SRxA3GvUcj7Xqp
	Zct5UGrRdxIZr9OJ9HrX5AKk53IOsaWHvFVVw5Tg9VrG1vtsKTaxAOZUv5earOHM
	d6NdHHFhu/Jbziz6+Y9V4N/57y9LmqzAO4FzrKuhQgK2MoywQnTIFwShoNXHsezO
	VRuxp7NSfJuwoMra45Y8uLkdEujGC4sDn9QUaifPGpZ11bCDw7xAzCY0Q69gSGyQ
	e3dt8DMBdeJT86l85rFDHJCMqls/PyyLL1TWvunPOFDEdGJJ0CzPpgBDE2nhNNZR
	RS2NM1HSULo1/BuDb5WIoHEAIb+7MWH4yUOgqiiLL0aPltuuuSH6tHXZIiUMlX8l
	OBTm0Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0khuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 17:57:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc0bc05afdso293415a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 09:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739987852; x=1740592652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78pq2Tqo6aDU3KcPcf25D+KEq6BDiVBvwf3/VKY2io8=;
        b=XrrSdh/+tHl24HR9qMQSdhKzd+7kFaNZzwfQ8YU7j7+Sd+x0rgwK8ORqzF0gf564ja
         z7TjBXZAus2of4qOS/AgiPAp5IyKjVKHRThlWhTd+tk9B3dhVuMWgOhmN/8e60u/CSMg
         PMCVnxAR37Rx2Vh4nQdH1CJLJM9szcU20iyrVJQ44X4OH9biu1y5Of7bPCS3Gga9Ax4o
         YwSiF7xrQ7D0NLnzl71qtOICfZXWQqWYKl/bvvmlTZHuT5qIYjAEg7gxH6ngeSRaM5on
         pXG+gN2HlP9uT/YG0h7vMBNVTX1KCP4Pu3W/i4ARH/njzML+9+R9l+v6dtWakZbIySgc
         Yn+g==
X-Forwarded-Encrypted: i=1; AJvYcCWS3lBZv4d5wEaUCW1AGvnx0lF3vY0Aax4M+gntlURqH2Sa2xtdjSoq45niE9BHpeD0d2ruWIFPIqm0rqGF@vger.kernel.org
X-Gm-Message-State: AOJu0YzOatex7yDnm3XqLT7N06Jok9aPU4/5Cw8ZWJvFEh2XOOy+4GoK
	V5TzSYhkDJY7kxmJMUiJy8gPZI5eAcuND+EmWV3l9Dscb5lHg7IQRwhuvQzN0F3y9gczjZ4y2L6
	zg6Z/3QFW0SkaJGjDmAJ2OSgOrYBWGXHP56jZN54xvTH9BUm5KquNEGyQmiw7iIlq
X-Gm-Gg: ASbGncs9aKG0vLOdv4lZDoqVtxvRYFwhbCR5LcNcxHJDhMBIydllGtwKaPZiGH64oZu
	pUYJxnmaIhkiX9rSx1yGBlK/ZMzveNAUpSHMe54H6vNdLdCkN5pmn4W6+bZrYt/KkbyPyH2ok39
	p/EzSI93l+18kuOVlQ8YkWm7kVOMh99x/+L+Mj9On7pAp22VEm8WicrAnIQ4hb7NhKKAvRZG1I3
	bf2z1RR1NzvXntqsOmvZ3e5W2UZf6BNx7ldxteGaOtVd33x7MnP+nS0HLFx/v8F/uMOeAohqQxm
	YtxJJ/dPFECkpXvU4FV/kHcZ5LgPAeEL+tY=
X-Received: by 2002:a05:6a20:6a24:b0:1ee:dcd3:80eb with SMTP id adf61e73a8af0-1eedcd382c1mr3404946637.22.1739987852605;
        Wed, 19 Feb 2025 09:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR5P32nd4JPmJkWHQBBmcstlZrG31rBUniS5q+4t2AdRvM+sL+oJVFS4OznQBsMO+V9ZWjlQ==
X-Received: by 2002:a05:6a20:6a24:b0:1ee:dcd3:80eb with SMTP id adf61e73a8af0-1eedcd382c1mr3404894637.22.1739987852215;
        Wed, 19 Feb 2025 09:57:32 -0800 (PST)
Received: from [192.168.29.92] ([49.43.231.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm12233766b3a.30.2025.02.19.09.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:57:31 -0800 (PST)
Message-ID: <915795ea-3e75-fc55-4c37-a05a6570fbbf@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 23:27:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/8] PCI/bwctrl: Add support to scale bandwidth before &
 after link re-training
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_jjohnson@quicinc.com,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
 <20250217-mhi_bw_up-v1-2-9bad1e42bdb1@oss.qualcomm.com>
 <f58ff91f-95a1-1a0d-91e9-972f0eeddd4c@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f58ff91f-95a1-1a0d-91e9-972f0eeddd4c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eEMxI6PWv_-OaamX0n-wRm1QvCeox2sE
X-Proofpoint-ORIG-GUID: eEMxI6PWv_-OaamX0n-wRm1QvCeox2sE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190139



On 2/17/2025 2:58 PM, Ilpo Järvinen wrote:
> On Mon, 17 Feb 2025, Krishna Chaitanya Chundru wrote:
> 
>> If the driver wants to move to higher data rate/speed than the current data
>> rate then the controller driver may need to change certain votes so that
>> link may come up at requested data rate/speed like QCOM PCIe controllers
>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>> link retraining is done controller drivers needs to adjust their votes
>> based on the final data rate.
>>
>> Some controllers also may need to update their bandwidth voting like
>> ICC bw votings etc.
>>
>> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
>> the link re-train.
>>
>> In case of PCIe switch, if there is a request to change target speed for a
>> downstream port then no need to call these function ops as these are
>> outside the scope of the controller drivers.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>>   include/linux/pci.h       |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
>> index 0a5e7efbce2c..e3faa4d1f935 100644
>> --- a/drivers/pci/pcie/bwctrl.c
>> +++ b/drivers/pci/pcie/bwctrl.c
>> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>>   int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   			  bool use_lt)
>>   {
>> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
>> +	bool is_root = pci_is_root_bus(port->bus);
> 
> is_rootport ?
> 
ack.
>>   	struct pci_bus *bus = port->subordinate;
>>   	u16 target_speed;
>>   	int ret;
>> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   
>>   	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>>   
>> +	/*
>> +	 * The controller driver may need to be scaled for targeted speed
>> +	 * otherwise link might not come up at requested speed.
>> +	 */
>> +	if (is_root && host->ops->pre_scale_bus_bw) {
>> +		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>>   		struct pcie_bwctrl_data *data = port->link_bwctrl;
>>   
>> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   	    !list_empty(&bus->devices))
>>   		ret = -EAGAIN;
>>   
>> +	if (is_root && host->ops->post_scale_bus_bw)
>> +		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> 
> Is the naming of these callbacks too specific for your use case? Does PCIe
> spec actually call changing the Target Speed "scaling bus bandwidth" or
> something along those line?
> 
it is not the PCIe spec, I named based on current driver only. If there
is better name I can modify it.
>>   	return ret;
>>   }
>>   
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 47b31ad724fa..58f1de626c37 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -804,6 +804,8 @@ struct pci_ops {
>>   	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>>   	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>>   	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
>> +	int (*pre_scale_bus_bw)(struct pci_bus *bus, int target_speed);
>> +	void (*post_scale_bus_bw)(struct pci_bus *bus, int current_speed);
> 
> Please document these, including the locking requirements.
ack.

- Krishna Chaitanya.
> 

