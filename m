Return-Path: <linux-arm-msm+bounces-58220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72212AB9C8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F8D01B669DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE652405E3;
	Fri, 16 May 2025 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLzkf2sA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75623504B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399788; cv=none; b=YP2c4dm5t5bT00p/OJ08cIROqEH+a1BLP16yKCjKsozR452Olpqg4iKNg11MkJiOicndgYC2SNtMeGE7maLa7G+0atgsQ8fQtJ3MUqvN8fhI3t/ypUR3R8E+vHzrwb08jsy0KOxR67mhAClMa+JEkq3/hfX+2nh5um+AHgVroBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399788; c=relaxed/simple;
	bh=3XXz7vRINk0tGaKj+MeS3kJIyL4bpCw4p+dTKdtdfM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZ5dNUr0Fmh1/s13Hilu9fF3DIpW6Q3DTz3PjkAXf+GzS3ARQBe34eoVGIOPjJCYmQBOAyRii7SHZcNIgcSgNX788cOuZ9vOF9o55EWUGMtpJ9vEIuC2Z9sEGqcHILaGfXXigDHKRbmHSwLDtVl7FIgMhWNJj4DILWWLQA2PyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLzkf2sA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB071p025721
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 12:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWaS/wBVLAvfdc/nM2uoXAFHKvztBdqdG5TtveZ7LUM=; b=MLzkf2sA58xbgcHq
	tFDhCFKlWCFy3uY47/9KRVLZrTrm/R6FwDCLzpnxswkzblxP/KxkP/cflyGiUSvx
	HhTATA5BPhBo9hzSnLp4VftKFmHMVjlaMdTvcsL14CAw63Kew0tiQrHp9wwB243T
	3d5WmST8nD02hrPN6iNHBWFFwI5e2/bQNlfqTLm6PTK9SLJx1aur6o2wVgILD3jf
	WHCGWQy3L9Z26S0xO22mDRdjc7KtvMDGh/VkEc35TCGJySbnKolBP25g3A5PAj1t
	29vEzInrsSu8AxM4+5LBr7nWZnGiCv86qHUxRJlkOGEzKRkgkKXW1vBB/5WDu2sL
	0uAuxw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp1yw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 12:49:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74235ee893fso3033543b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 May 2025 05:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399784; x=1748004584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWaS/wBVLAvfdc/nM2uoXAFHKvztBdqdG5TtveZ7LUM=;
        b=rytwFbbbHRZ/Px00uzTglA6xiLtO9L4kejE1H42GsmXhrayN5XdLVyzROqYF5lC+FX
         wcCwIJRdcTO3p/Xatvl1/gdVqH7pT+sfjcGztP0N0tSbW8c4Pdv1iy3C3qTDq3rinLFS
         CaoTb2rRiQPJdHv9RcoPQF4J29bqftu2fUUKNB8XOoh0f1OCzjP/4pMO2sDo8HoR1Q4S
         8Kkpi3m6ZFMg5HOc5XnK6SItaWcgSBej83naHA3DzmbnoFDRhPKsI7cyRIs7J5CVOTLu
         fhnR4y9b3vXYxW+o9HO7LJRGhlz8+yilo31bk2vuzbEaiW9a8U34smtJV73lF7ZAlxlI
         Bs4A==
X-Forwarded-Encrypted: i=1; AJvYcCXdkHDqdh+N7xPf/rQ/bZjdX+17jFUKy6XPiTaIRlHiQrL1iZVrfD+3NmH7d57K3KC6PCziE+Osqxig/i55@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcBoWesCtTBIlnu16Vk19SexokAjFN1WYHSN5GWGE3d2ODTQY
	V/MugzA63CwOVUPUacPX5WY/Cd12loTrJIAbwah3RMLklsNdRnDa1lBbwBt2nptA8vlVzLUlAX8
	8pvVxkysZeXZsCDCTJnh+HHkugT2JJYu4SmEXhRP23mt2nO/V9wMHbwdvBlLZidrqjZRK
X-Gm-Gg: ASbGncubz5OsvMGhDXGH8caY03hNtI6ynEfLfAqkB0+s9Deef+FmAvhrFa7jUZC3+VU
	UH+WmnbGVvjzKiSKk9GMj3eJ78JyTJ2IF3VEWG6yegfe/TtGYs6duKq3680hr5E+1r2HhoB0XT0
	PBr50eZF6w7W21a5XGxLQ3n8iYZZjXSnocCO2bbl52sswBmeJ6O9OimzCrF7EMX4pev0EtR3EG7
	n/FR9OBC5SLxTG43V/Y2odtjWlaNQjW+VJuwoRUSGaKR5TO04ixB5pDbnqP8NmgT/mMT4VH5w/w
	rW+nENsI41qI27XJLEdTpHyzFjGJjz2y44iYuEjewg==
X-Received: by 2002:a05:6a00:4606:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-742a98004abmr3848559b3a.10.1747399783827;
        Fri, 16 May 2025 05:49:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQNLTbI1B+VJP2oSagYa9oYzNOY1Dzfl1XASdr4bvFkyNdifiPDpdHQrMJseRvKhV111pTPQ==
X-Received: by 2002:a05:6a00:4606:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-742a98004abmr3848526b3a.10.1747399783377;
        Fri, 16 May 2025 05:49:43 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a986d9c3sm1407485b3a.121.2025.05.16.05.49.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:49:42 -0700 (PDT)
Message-ID: <7673cb4e-b359-be7c-27db-639f208e3835@oss.qualcomm.com>
Date: Fri, 16 May 2025 18:19:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 02/10] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?=
 <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_pyarlaga@quicinc.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250313-mhi_bw_up-v2-0-869ca32170bf@oss.qualcomm.com>
 <20250313-mhi_bw_up-v2-2-869ca32170bf@oss.qualcomm.com>
 <7njsbucxngxc2eninh57oexywiqsyysrbesyige5zwr4pmxf7t@rw6657lheg4j>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <7njsbucxngxc2eninh57oexywiqsyysrbesyige5zwr4pmxf7t@rw6657lheg4j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xkw6wwH2sNE_EJSBloRwY7dSKWXvGzZT
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68273468 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=PjKuzrdxt0Go-pjIBLUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEyMyBTYWx0ZWRfX2N+G6PxEkLfw
 glNzofHTBQN4fwHFVGvuEUFeAD43oDkdGuWa3hVisKeiN0h98e7vh9JJ6cQoSHGmKlM8ICO3D49
 5xz3Xsn6EtogvYsuBuLamlKycK51SLJ1pV2sAFZjNf9VSv7zgvRlnSYt8lCpdEcfDBBHEpdpFl+
 mDyV10RzBO1+HdlYyz/Vm7cIzO2F8Ql5t49tJO36GozDNV4+1RDwbgm35F5PiGTUm2UDFiHYyIB
 ZP/BQ42MC/njqY5/1XixNqS4CT0SAAphK+3bC+wS3zyPPw9V/l5UJUGumikT/EVL7+EZTatF9wO
 V6RcMKgkliqaFkpRkct0713qPbHv7qTw5me8d6lb2pJL+eNSCiwVeJtEgb4GDH+rArSmDB9qibv
 n1t+EV9kNK1yzK8TW7pU3h8wxEnWt6qWqhW/MCStOS9cmbCbHVQiQjXXsTycb5JlHlijIlV8
X-Proofpoint-GUID: xkw6wwH2sNE_EJSBloRwY7dSKWXvGzZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160123



On 4/25/2025 9:27 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 13, 2025 at 05:10:09PM +0530, Krishna Chaitanya Chundru wrote:
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
>> the link re-train. There is no explicit locking mechanisms as these are
>> called by a single client endpoint driver.
>>
>> In case of PCIe switch, if there is a request to change target speed for a
>> downstream port then no need to call these function ops as these are
>> outside the scope of the controller drivers.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>>   include/linux/pci.h       | 13 +++++++++++++
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
>> index 0a5e7efbce2c..b1d660359553 100644
>> --- a/drivers/pci/pcie/bwctrl.c
>> +++ b/drivers/pci/pcie/bwctrl.c
>> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>>   int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   			  bool use_lt)
>>   {
>> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
>> +	bool is_rootport = pci_is_root_bus(port->bus);
> 
> s/rootport/rootbus
> 
>>   	struct pci_bus *bus = port->subordinate;
>>   	u16 target_speed;
>>   	int ret;
>> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   
>>   	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>>   
>> +	/*
>> +	 * The controller driver may need to be scaled for targeted speed
> 
> s/controller/host bridge
> 
>> +	 * otherwise link might not come up at requested speed.
>> +	 */
>> +	if (is_rootport && host->ops->pre_scale_bus_bw) {
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
>> +	if (is_rootport && host->ops->post_scale_bus_bw)
>> +		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
>> +
>>   	return ret;
>>   }
>>   
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 47b31ad724fa..9ae199c1e698 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -804,6 +804,19 @@ struct pci_ops {
>>   	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>>   	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>>   	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
>> +	/*
>> +	 * Callback to the drivers to update ICC bw votes, clock frequencies etc for
> 
> s/drivers/host bridge drivers/
> 
>> +	 * the link re-train to come up in targeted speed. These are called by a single
>> +	 * client endpoint driver, so there is no need for explicit locking mechanisms.
> 
> You need to mention that these ops are meant to be called by devices attached
> to the root port.
> 
Ack.

As these are bridge driver specific ops, it feels to me we need to add
these in the host bridge driver similar to recently added one
reset_slot, I will move it in the next series.

- Krishna Chaitanya.
> - Mani
> 

