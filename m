Return-Path: <linux-arm-msm+bounces-65011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BBB056F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD49C3A2270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9753238D52;
	Tue, 15 Jul 2025 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP/s6cDS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B76225761
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572790; cv=none; b=X9dfapZdlB/wrSAaxs6DQPsHc6cikWHlO5YxDR+UwK9XCDxw5kMRJLu9sFeyH84+HNeIm57leO6q+t8QZYXKbOcUAHTSAcQOvO4Fq4739vq+nNdZsXVnbMiv3o8YXyzyz3bCAqavoLi++sinIqoeq17Bs2VmTKn6yVan6l+4Ut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572790; c=relaxed/simple;
	bh=iuamj3FF11HHl8VB519n1KJyoXG8OM+moA88Ho0SoUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lALtTa3S0KYbzDRwyQecEfZri1mjDcsdpqxFh5cjqvOYdAfLItZckjqY7Cpat7LJcCjWMVyGPKWc7H/ZqaDEG5FjB7Fv3YdCnOdMybWaImiUXdWFZZYfDnPG9a+h+0vPI3Er5kr4asi5OnAxOvffuqUZ+64Pn+z/GE+y0pkwFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lP/s6cDS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5kr4b028916
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMeFe7Yd5rjoftwSAtu6TnAzqpVfJxmbYj1DDhEXd90=; b=lP/s6cDS+BF7KJSb
	NctHB8nqCD9SU6DyVSE1pGjDjDOC2y+NrWgc3aGptG54JUfF+p0K/Ps3C3I/Dnyd
	E9Z3z4JSesbzf+GoNzuvMvTrHDi6B7w1SP3gasMwORrvV9KlvQoNxAn001ZYbUji
	IMZcRBwEskpZHWLTXLiA8a2RKAQSwAERV+GQY0AGlUAsb9VgtaCZmdEU196Fb+1a
	z91gvQsKRxG0e6znfCe9+iO+rNNNEVC/Z7WSUj40BJPNx2o3mZbhoZnbdOwNlbe6
	HKDDCTlq3M5QX4kxXLeF+78FHvZv5aQ7SvJeBZTWGGpRDD5+0aCAF+uX0RVZa/07
	FovwHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dq2g9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 09:46:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7deca3ef277so128263785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 02:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572787; x=1753177587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMeFe7Yd5rjoftwSAtu6TnAzqpVfJxmbYj1DDhEXd90=;
        b=Qh+mtv4RtlC/BmYPo4hZG6NRHXA7QwAjmhXF2J/OuhA/X/thISlHz6Oo+CLYyIbLOm
         q3ioD/X3LHR54TkP4+eVpZDgcnMBTMMABVnI1nSHLhM7wCMHvC0Z2bFfHgBk+XkOtkAa
         aiX56UVzGYwHZ4AfSDhJ4SLSGg2YRJYZirdGRqCd359LuB8mKAMMsbAY4tfFhIn8TuPV
         YtgXjUWa6Z99i3JFImwRR8b+rMPwA+nxvUc7CcEI9OdNaJ4mMSK6lihKWbneUXciywfs
         E0AjLC2IZQIC4skbev7JNCYnDxDoResgB+jTrrNbbTMeisCQgcFwm/zz1oT6ZcB+WEZy
         qS+A==
X-Forwarded-Encrypted: i=1; AJvYcCXj4QRYCZJj/+hnElz8lLTpguSfDY2ilCHvQd2jXIBdL7oDAOpgAmq1tYKCcA+yv0oLyjVX2pwkaUNNZWW5@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ/6o//QnJ4N5qZYnrS5gNIppa5hS6PEP2dIsRj6nT3hBqrEfj
	c/1UtMdmuBMKJCJYYXykKvlwRI6h9OjhtymSmSe5YunsgrGhznDIzRmkJnS7uLb+/0L8sT55fZq
	id7ipttsn2XD13TozzBzPHsajT8Y/p3I5e+lOVrSbDO8PASMr2G5QjhbyvT+vU4ZfST+Y
X-Gm-Gg: ASbGnctsPO0FAGLON2UJ39g5NV88ZkXC88f3ZiF1GfPvE6/edKtK7ySZe3maJAy3NXp
	BzAyDbb2xB8xTTOS9VXSr9pxWT1os3YAGTBZ+6fcgT8/N6I2iY7GdEdPn5Nwb5ltTKY9CAqH9zM
	+JP6j1qn6/gt5WSH3lUa6bo3n5FXxzmViNa201zhFXHEzyPtpnuxmxwcUbCgwF7l54rz5geOOz+
	jpfohU/I/Wf7Y18ZMmsRY32RKj83x7AYAYI8dioSX608SuwQ0eXKOX5qUgcDdL3+rMfEOPM57j7
	JhmOUroHspxRt6G/JBuIQxg5AJTxwV8kScdAU1TehbkDYfTxwVXwAwI71vypSgBuIMnes0AuSCs
	eUOd+GqP/CDjv8pauPl+g
X-Received: by 2002:a05:620a:8394:b0:7e2:1609:a19a with SMTP id af79cd13be357-7e33c73e8a7mr58804285a.8.1752572786779;
        Tue, 15 Jul 2025 02:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRkQ8Y6Ruj+5IBcsQut+JGM8QhTgkUcytlUsTQhCYc/LTZuLaVF1S6ATLDMlmqgpiqCo/MEA==
X-Received: by 2002:a05:620a:8394:b0:7e2:1609:a19a with SMTP id af79cd13be357-7e33c73e8a7mr58802485a.8.1752572786214;
        Tue, 15 Jul 2025 02:46:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90c1dsm971335166b.4.2025.07.15.02.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 02:46:25 -0700 (PDT)
Message-ID: <dbb1d203-9ac3-4c4d-bfd3-2d337a20693c@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 11:46:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] PCI: qcom: Switch to bus notifier for enabling ASPM
 of PCI devices
To: Johan Hovold <johan@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <20250714-aspm_fix-v1-0-7d04b8c140c8@oss.qualcomm.com>
 <20250714-aspm_fix-v1-1-7d04b8c140c8@oss.qualcomm.com>
 <aHYHzrl0DE2HV86S@hovoldconsulting.com>
 <yqot334mqik74bb7rmoj27kfppwfb4fvfk2ziuczwsylsff4ll@oqaozypwpwa2>
 <aHYgXKkoYbdIYCOE@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aHYgXKkoYbdIYCOE@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA4OCBTYWx0ZWRfXx0VuQIYsn3Pf
 fe1OM1SokYvvtmhMTtWoa3D07F5yG8ay9AhhqpRMAq4AhSvkFVmRDUUX/E5eqz8wu5nRyP+ozhB
 Wru5BLtP2twcSx0ES7iAmp2yJwQyXVafonuA+6y9Q3BVyCeaLVyHu9iRnD3Go8ts8qS+SOUEoZO
 Exi0/5egRuWNEXlCCSUCzB5r217mIkp6qDQGZ73E39zRa4mrZeub9GAPdmL7RR+p/z3922Fecbh
 S7pFLZMBRlCKl3sAUO0xtt15++9lb7v04P6u37+2l2drWKuvBMgWRbVMtFCdffhPJBS4hKX1npQ
 0c2PbHe7ArueUp3KlgHLPoNZ/YDxj9Nu91dJMkj+Z6J4wngHI84S5DwANEjX8oUFOHGLHBBXOi2
 roYfWo9+71KnEDsIa11gn8GkeNZH2mwN5kr816xmO4VOh/U8sJ9twwzdQ9OPMQIKMpH1zP7x
X-Proofpoint-ORIG-GUID: GvtfAZQ3vg-cT-oQfRB26pE48C1ibtFv
X-Proofpoint-GUID: GvtfAZQ3vg-cT-oQfRB26pE48C1ibtFv
X-Authority-Analysis: v=2.4 cv=MpZS63ae c=1 sm=1 tr=0 ts=68762374 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=cZ255JXqXJs46pWIKbQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150088

On 7/15/25 11:33 AM, Johan Hovold wrote:
> On Tue, Jul 15, 2025 at 02:41:23PM +0530, Manivannan Sadhasivam wrote:
>> On Tue, Jul 15, 2025 at 09:48:30AM GMT, Johan Hovold wrote:
>>> On Mon, Jul 14, 2025 at 11:31:04PM +0530, Manivannan Sadhasivam wrote:
> 
>>>> Obviously, it is the pwrctrl change that caused regression, but it
>>>> ultimately uncovered a flaw in the ASPM enablement logic of the controller
>>>> driver. So to address the actual issue, switch to the bus notifier for
>>>> enabling ASPM of the PCI devices. The notifier will notify the controller
>>>> driver when a PCI device is attached to the bus, thereby allowing it to
>>>> enable ASPM more reliably. It should be noted that the
>>>> 'pci_dev::link_state', which is required for enabling ASPM by the
>>>> pci_enable_link_state_locked() API, is only set by the time of
>>>> BUS_NOTIFY_BIND_DRIVER stage of the notification. So we cannot enable ASPM
>>>> during BUS_NOTIFY_ADD_DEVICE stage.
>>>
>>> A problem with this approach is that ASPM will never be enabled (and
>>> power consumption will be higher) in case an endpoint driver is missing.
>>
>> I'm aware of this limiation. But I don't think we should really worry about that
>> scenario. No one is going to run an OS intentionally with a PCI device and
>> without the relevant driver. If that happens, it might be due to some issue in
>> driver loading or the user is doing it intentionally. Such scenarios are short
>> lived IMO.
> 
> There may not even be a driver (yet). A user could plug in whatever
> device in a free slot. I can also imagine someone wanting to blacklist
> a driver temporarily for whatever reason.
> 
> How would this work on x86? Would the BIOS typically enable ASPM for
> each EP? Then that's what we should do here too, even if the EP driver
> happens to be disabled.

Not sure about all x86, but the Intel VMD controller driver surely doesn't
care what's on the other end:

drivers/pci/controller/vmd.c : vmd_pm_enable_quirk()

Konrad

