Return-Path: <linux-arm-msm+bounces-75316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD26BA3EAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 471AF1C026EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148F01E489;
	Fri, 26 Sep 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izncMGYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC312F744F
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758893971; cv=none; b=jWM/km15jj/urxOU0LkkGlRyes8HPvDH0kDNvMvqQ7D/LQBboBv1yJ9u5OhYtA100pYiwOnLc0bOWZlavBGmMwzv5AgFl3PAJnrDJHAvlNRFFbqiYnsInuN+4z0aky0fBLTzrsB2zko1dX2GOAjRitnf9Dh/YRCwq6XHYRjAbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758893971; c=relaxed/simple;
	bh=j48e7ePqhHhvcJSE6F/tY3Q0p1ZzRgdOesq05a6n2Q0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hVke5oM2alYEeBdjQgQGqkvMNGdrC+Sw1PmN7OBnzub6Lj2PxSbvmMeCEPfpLRgU6HnxeZkwxgctrzS7bj/sYYCaxjtGWxNZcEwJILBkkj2LJce+zDDoutlmPkSgpucVb71QM2ZgPIjvkCfDU6sN8SEnTOHDZm6ktrjQaeN3tNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izncMGYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8voSd028961
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E63HIm6hfUIUCF/NebOyqvn6g+tEqkfrm8u2QMJ5tw8=; b=izncMGYNdUqo8E3w
	gQZxTs52PektAYwyZSafWsuPESdlDkPK79sbajX8hDHMXorHmH8P9o2HR/1JLQdt
	OpZW+6yye80afqDWs3iqyNoIkqtWPXvbBVX9S/gz6TOPExAM26rAnehCi8+ij/6a
	sueHn0d6nN9i76ndyP9gxQ5IuZbpjfjStLS5a4SAtgzA6G85JfQGvC340XrkHuZN
	EoPyY3RHd44NdBFvJTyblFemUHcRVwdGyCIvhgp2o1W/p0uM55anRT95fpOlt7/Q
	qxZMGKiAyDNoXBfglP4uWeELZgzvUQsTcvKWbVn3cTo6GyMFTnAuLtMonQp5M3Ai
	xsnmDw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q303d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:39:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810af03a63so2969212b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758893968; x=1759498768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E63HIm6hfUIUCF/NebOyqvn6g+tEqkfrm8u2QMJ5tw8=;
        b=kiRhOKOBYy9Er2YaX03P9/24s5uEThgbQlNpCbnsqwHvG+xVKrmqT/k8atmDNRV69i
         W4C67pwqHC8rHbs4X2B/LyA5yvl4PobHj/IbCONfXDSaMBQLmE23V2T0q6Enj9QyO3s4
         tgpI1hYp8gYXPnVCTmSK6WD56rulxVckFXGBNt9GKAT1YWedpurZMiz2WkXR4siPUoBI
         3ToU8Zr949x4cKBnVdB+OQK0XNSCY99ty1iGT7gIPq1oVF2Nq7rugMDyXZNSTNJvfkVp
         aO9SSoEisMjF8IO35px23vYBP9d9zMTUEUBvvxZm69WRKZYEfWIOe6KalDvMTvTpLnsX
         bjxg==
X-Forwarded-Encrypted: i=1; AJvYcCU1LfmadRd3pElYhxzUmbUjLPJ7LRIV26W+XUIcIRP/Nw3lyW3XuAAv2qZjEBn7OC6OutcQYrAJEJ1UYSCH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VMuHYupUeP5AwvAGlLEL/1NZEzm5n1CPzWpE4WfbdtuNrPSu
	Q5Vkn/9Q75H5yPoxI3eeBWlZZsw3HrMQOU3sHMHa/4lFBIpe5xCQjfO732KvqUOB2dmFo3csYT2
	ztN4nsxQVffIGYWLWAR/r4GsdGyYjBWnpT+OkCq/w2s5J8p4zlkbX8dqcXuisPpKD912B
X-Gm-Gg: ASbGncuF8puy4VYSoYUqJ9n019rPrIE0VBB2G273y7vYvemxJFtYpQSBLsxxQ+XuKUW
	NlfYi+APgC/uTuKnL2xBQ/yKCY7sz5v9ILb9bf80T3WYpjCUE6PFRgK1hWrhh2NljGnZMo4UdqI
	dHul69l4Ly6augvx1Rwg9dLeWsExdKEJYviTIsEbsJdmKI5tOF+mgx6fbCwv+ITXtXsVJt1LEg8
	OVKkhQcUQxHyHCkqyjcm2DyA60a/bGmzZ8B4fgtC9rJfokYr/zcGRCVnaViwHISWYAIAOUTI4du
	xfPQloJiVaFTfimk4FLdiDpQzgQ3H3fjk6pUi0OFOr0ApaWq+9KMIW1COl3Xm3i6nielFLnfGi0
	=
X-Received: by 2002:a05:6a00:23cc:b0:780:f6db:b1bd with SMTP id d2e1a72fcca58-780fcdd28d1mr8678960b3a.4.1758893967768;
        Fri, 26 Sep 2025 06:39:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiaP1HxRLVUpY8VZEiq5l3q06EZMQQVXQhWmy8UEaYDj2MmG+Nz3UAs4qURBGWNpupm3mF0Q==
X-Received: by 2002:a05:6a00:23cc:b0:780:f6db:b1bd with SMTP id d2e1a72fcca58-780fcdd28d1mr8678917b3a.4.1758893967264;
        Fri, 26 Sep 2025 06:39:27 -0700 (PDT)
Received: from [192.168.29.113] ([49.43.224.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c048fasm4502469b3a.75.2025.09.26.06.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:39:26 -0700 (PDT)
Message-ID: <4a3f9494-27a2-47d6-bdef-0b1bcbd99903@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 19:09:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
To: Bjorn Helgaas <helgaas@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250925172517.GA2169496@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250925172517.GA2169496@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXySrArfANcy0G
 8SkMWFHQq3D8ykKbynS1dH02N5ZY7/xDjk4S/kclZtdQScBwKFqyeimFP7jpLoubJ4F3C1tahFT
 OzyAThvfelShEIta04hP0XpmiBz8BaegA0bF3ZGMvyruAYqkxocLQwps/Q+M2tVd8xiG4QHXimG
 dNidU3GoCLwVlVHSgpBt4E2IFi+jKqtw0XzzNN89K36uOmdJJP3gKKojzCxuHobo+lDLv2jJrg2
 LT7mfCoTOg4lrJD9KyqxEB0ck0AwmsUyI3bT+4dj2jYfZCtQ2v/wyNNDV9HumSko6qWbdzwk3tr
 zrCgiDXKfxy5h3owj0nEylxnbkVN96YGZrHYZXms7zsJYb7lb8TFmCFsyW9ORTOrb/X8FaDi+rH
 sJ5IL0RdKFAZBkbyT+V0cMhlbm/TfQ==
X-Proofpoint-GUID: dbfNTmqjRUByE2n8x2uph0ZCjCEj6FuX
X-Proofpoint-ORIG-GUID: dbfNTmqjRUByE2n8x2uph0ZCjCEj6FuX
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d69790 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=w+9hNF1SH6wH5mqaHp+xkw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AYVm423qkfQxZcs1cpAA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 10:55 PM, Bjorn Helgaas wrote:
> On Thu, Sep 25, 2025 at 09:49:16PM +0530, Manivannan Sadhasivam wrote:
>> On Thu, Sep 25, 2025 at 09:54:16AM -0500, Bjorn Helgaas wrote:
>>> On Thu, Aug 28, 2025 at 05:39:02PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Implement stop_link() and  start_link() function op for dwc drivers.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
>>>>   1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>>>> index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>>>> @@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>>>>   
>>>> +static int dw_pcie_op_start_link(struct pci_bus *bus)
>>>> +{
>>>> +	struct dw_pcie_rp *pp = bus->sysdata;
>>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>>> +
>>>> +	return dw_pcie_host_start_link(pci);
>>>
>>> This takes a pci_bus *, which could be any PCI bus, but this only
>>> works for root buses because it affects the link from a Root Port.
>>>
>>> I know the TC9563 is directly below the Root Port in the current
>>> topology, but it seems like the ability to configure a Switch with
>>> I2C or similar is potentially of general interest, even if the
>>> switch is deeper in the hierarchy.
>>>
>>> Is there a generic way to inhibit link training, e.g., with the
>>> Link Disable bit in the Link Control register?  If so, this could
>>> potentially be done in a way that would work for any vendor and
>>> for any Downstream Port, including Root Ports and Switch
>>> Downstream Ports.
>>
>> FWIW, the link should not be stopped for a single device, since it
>> could affect other devices in the bus. Imagine if this switch is
>> connected to one of the downstream port of another switch. Then
>> stopping and starting the link will affect other devices connected
>> to the upstream switch as well.
> 
> Link Disable would affect all devices downstream of the bridge where
> it is set, same as dw_pcie_op_stop_link().
> 
>> This driver is doing it right now just because, there is no other
>> way to control the switch state machine. Ideally, we would want the
>> PERST# to be in asserted stage to keep the device from starting the
>> state machine, then program the registers over I2C and deassert
>> PERST#. This will work across all of the host controller drivers (if
>> they support pwrctrl framework).
> 
> I don't think there's a way to implement .start_link() and
> .stop_link() for ACPI unless it's by using Link Disable, which is why
> I asked about this.  If Link Disable *does* work, it would be a very
> generic way to do this because it's part of the PCIe base spec.
>
Hi Bjorn,

We did test as you suggested but unfortunately the setting are not
getting reflected we need to explicitly assert perst to make sure
pcie is in reset state while applying these settings.

- Krishna Chaitanya.

> Bjorn
> 

