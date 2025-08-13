Return-Path: <linux-arm-msm+bounces-68881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13980B23F34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 05:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32F91B677ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 03:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5241F2BE63A;
	Wed, 13 Aug 2025 03:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzoMEIEP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B552BE02B
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755057315; cv=none; b=CI1XUD/7QuVvsouGQptwGkarHyOTgyZbNGlmlneobjgAj11BBK0Rq5VAkpKtrExujYlljrs5pDGtslH2J/tKvPZd3gCdHhQ645IxCe9u+eYhThPpGEfCA1UDCLddG1qd5HnnhDxG8LYyiV57sdv3U91U4pqf/Q8BnSAHBGpoFkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755057315; c=relaxed/simple;
	bh=dnz52Dgxeba8OreSCFoW8AzKahq6NE+sYCZabA34LQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4PxUs6AAASqxpPskqHbSo8EgAJy8w5fG3FpEBbbgMhARcAdphthdKuBa2ix9ml2KC55rHwEu8ze9iKhhsr+nQpDhnyWHTk9N2GtPP64OICFu/pnJvtG2kF1UdD/zB/XvgB/Yrsj2GUGNEaTVYMwMJYDdtvSFuI18Layewu7qjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzoMEIEP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nbAt007781
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nL73GNJKLk9gxYhZAyNJw/OghTTtC6l/WSrfhqhdCug=; b=MzoMEIEPMWSVoNUJ
	3sk0aj2VjkqD3b8AyFo6WpEwt8aIVsj4ufroqT3KgThb9nUcDLnfknXUywqb0bif
	jmlCYgJduTOO2IfnHo+PtlO9nwL3z8Xylhf2EFCrE9e0+Ik/45GhJihZqtBptd7S
	LEHKIewo8ZpbSfIiDVo7LcWkaaFump4j4z1DiqqCHuPNexgS0bMwWB8VHS5i9IuH
	1ltASY2fCZ9XrwK9+PDBJc+gFLL4G6yHyxjSirc5jqwrA9c54IBNnVw+hvf1cluq
	bNN9c4oLcG3HtzWd2t1y0ArTQG+4b2mHkhFcPTRalnIJK+8SaTDBn8y+E6TtYFVD
	O+LvzA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj4ac4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 03:55:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-321c4003961so2587801a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 20:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755057311; x=1755662111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL73GNJKLk9gxYhZAyNJw/OghTTtC6l/WSrfhqhdCug=;
        b=lMNaMG/Pa6ONeOTHsk3+wiJNEMkEPEMcFLAGFaQkpqqqDvq6r2ZJEhCrJMHdhfiDUB
         qXnjNgdUBnf62QnpUjUM82Njo6OB5M6T4xbR00egCJzBEsspx4xjT5OUmkxo6gxkGheo
         ZknlNGAbJpGkn6tiN8d5YZIbouxa/vf/QItHlHkLC5N3DmRVqbzRUDH+iEXQT8vKNG2C
         GPAAs28phOp/N0kT6sL3/+CmQR3hAi//mPZ3pElY5tZsbwuRIldSADAKQADFc3WqXbgX
         zgYIf+GHgDhAtqnnG6uhzzs9ecTiSwgeTMFNzf372L4Rh4r2VnpocLZoQlIsK5zifi4r
         rxgA==
X-Forwarded-Encrypted: i=1; AJvYcCU6tmtT16ZutPOfrKze9xufGAQnd69Ow3drz7nv3buyi2vnR2vzLNKnC1mwQzHAk6xbDfeT/rdOOvflUxqC@vger.kernel.org
X-Gm-Message-State: AOJu0YzzsApe1EZFt8FuU8mXPYFpEoMP+DRQPpFP0+wfOAZo48FK2DlY
	ktBkcSlLo05Cnj3+1hUdA2YWGbUdfBnrujUyzQa9OTUSzCfuu0tocs/xleOc2st9oVK7ksDOlmM
	UaPlrNfypvAkQfM9b2M6lVp3lgyVHlW1QUOVV3kBK4O35/7+xgncon+ZS8SEmnOyoreQxXEmJVi
	/a
X-Gm-Gg: ASbGncsKMCS6WKEkO+tB3GyL2/62We8lg7eJcV1mhPvxb02bKBvv6h0Wkyay4XRYAfu
	5QPkgD6pimSck4jrs6UgxUtGgpQjNF1dDhGla/hhDf8A+vWsrNv7qb6kl/IDrldpwG870aCbpAc
	hwn8aJLRJg+/wcdYBiqH+X6THPZ89IU0zHm7H7PIFqhScMY6QITfCGwgh2+fKcH1yyXPxGnmJLl
	SiMPuYuDhXsT+22K7DH85NnxSDtQ8dxghFX5khGZ210RbQtLCvL79Etksq3L7vTXJ68gm5qucp9
	yp+rp3qkHZx80RJ8YyuATDZHmKUbMj19M9q3d4LTuPmoDTQxIRisUuiMmYfDW1RMo9imXYUcXQ=
	=
X-Received: by 2002:a17:90b:2808:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-321d0da48c2mr1826572a91.13.1755057311368;
        Tue, 12 Aug 2025 20:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6DBH2kfzGflZ64cNW7+2CaKUESotFcZzef6cAyZ1L/M83j5cwOGYdfHt9J3/vXq3xPUnICQ==
X-Received: by 2002:a17:90b:2808:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-321d0da48c2mr1826528a91.13.1755057310792;
        Tue, 12 Aug 2025 20:55:10 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5da0sm668773a91.16.2025.08.12.20.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 20:55:10 -0700 (PDT)
Message-ID: <ec0e3b33-76f4-4ad5-8497-5c8c8b42f67e@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 09:25:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
 <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
 <ycbh6zfwae3q4s6lfxepmxoq32jaqu5i7csa2ayuqaanwbvzvi@id4prmhl3yvh>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ycbh6zfwae3q4s6lfxepmxoq32jaqu5i7csa2ayuqaanwbvzvi@id4prmhl3yvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfX5HhhnNHaKNB0
 iefMqyJTYtZcnPU2v9IrEsdNVZw6bhCYEf/obOpGNdBr+Hd0OPYnc5e1GH9N4CjYqbWEty3cMrT
 LyRjG/qYSxNQ9BS8FQR7e8P/mJ6XlwR1l0TJy8T1HkLJGGVKoONJuOtiHN/HuFO3Gd0rm2sN3m5
 dKCeHKar5ao2pqVl0fiBJcFYllMesIHu0e6tW5peviUHhW83qHL1+NXo2D15bX5PDBbtpx3UzU2
 18/oG/Tnfa7ftwea7d99wW+3dNQbk0wTpNJb58leTHW4/feDgHQVHXa5qeQ3HP8ixMMBT3+Dunz
 QuvkJkQqj4cNMEIPipGrKOHrfRef931+fdGYOUQ/Qe7tv2hK1IUV5aOcep4qpIpA1qo5FHfv7AS
 6LnRh7Xc
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=689c0ca0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Rc7TGh9G46w0mRT8ouYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 1_maxKdFvSj7cQSkN2J_u4RrtAvALoxV
X-Proofpoint-GUID: 1_maxKdFvSj7cQSkN2J_u4RrtAvALoxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027



On 8/12/2025 10:13 PM, Manivannan Sadhasivam wrote:
> On Tue, Aug 12, 2025 at 09:35:46AM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya
>>>>> Chundru wrote:
>>>>>> If the driver wants to move to higher data rate/speed than
>>>>>> the current data
>>>>>> rate then the controller driver may need to change certain
>>>>>> votes so that
>>>>>> link may come up at requested data rate/speed like QCOM PCIe
>>>>>> controllers
>>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>>> based on the final data rate.
>>>>>>
>>>>>> Some controllers also may need to update their bandwidth voting like
>>>>>> ICC BW votings etc.
>>>>>>
>>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>>> before & after the link re-train. There is no explicit
>>>>>> locking mechanisms
>>>>>> as these are called by a single client Endpoint driver.
>>>>>>
>>>>>> In case of PCIe switch, if there is a request to change
>>>>>> target speed for a
>>>>>> downstream port then no need to call these function ops as these are
>>>>>> outside the scope of the controller drivers.
>>>>>
>>>>>> +++ b/include/linux/pci.h
>>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>>        void (*release_fn)(struct pci_host_bridge *);
>>>>>>        int (*enable_device)(struct pci_host_bridge *bridge,
>>>>>> struct pci_dev *dev);
>>>>>>        void (*disable_device)(struct pci_host_bridge *bridge,
>>>>>> struct pci_dev *dev);
>>>>>> +    /*
>>>>>> +     * Callback to the host bridge drivers to update ICC BW
>>>>>> votes, clock
>>>>>> +     * frequencies etc.. for the link re-train to come up
>>>>>> in targeted speed.
>>>>>> +     * These are intended to be called by devices directly
>>>>>> attached to the
>>>>>> +     * Root Port. These are called by a single client
>>>>>> Endpoint driver, so
>>>>>> +     * there is no need for explicit locking mechanisms.
>>>>>> +     */
>>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>>> +                     struct pci_dev *dev, int speed);
>>>>>> +    /*
>>>>>> +     * Callback to the host bridge drivers to adjust ICC BW
>>>>>> votes, clock
>>>>>> +     * frequencies etc.. to the updated speed after link
>>>>>> re-train. These
>>>>>> +     * are intended to be called by devices directly attached to the
>>>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>>>> +     * so there is no need for explicit locking mechanisms.
>>>>>
>>>>> No need to repeat the entire comment.  s/.././
>>>>>
>>>>> These pointers feel awfully specific for being in struct
>>>>> pci_host_bridge, since we only need them for a questionable QCOM
>>>>> controller.  I think this needs to be pushed down into qcom somehow as
>>>>> some kind of quirk.
>>>>>
>>>> Currently these are needed by QCOM controllers, but it may also needed
>>>> by other controllers may also need these for updating ICC votes, any
>>>> system level votes, clock frequencies etc.
>>>> QCOM controllers is also doing one extra step in these functions to
>>>> disable and enable ASPM only as it cannot link speed change support
>>>> with ASPM enabled.
>>>>
>>> Bjorn, can you check this.
>>>
>>> For QCOM devices we need to update the RPMh vote i.e a power source
>>> votes for the link to come up in required speed. and also we need
>>> to update interconnect votes also. This will be applicable for
>>> other vendors also.
>>>
>>> If this is not correct place I can add them in the pci_ops.
>> Bjorn,
>>
>> Can you please comment on this.
>>
>> Is this fine to move these to the pci_ops of the bridge.
>> Again these are not specific to QCOM, any controller driver which
>> needs to change their clock rates, ICC bw votes etc needs to have
>> these.
>>
> 
> No, moving to 'pci_ops' is terrible than having it in 'pci_host_bridge' IMO. If
> we want to get rid of these ops, we can introduce a quirk flag in
> 'pci_host_bridge' and when set, the bwctrl code can disable/enable ASPM
> before/after link retrain. This clearly states that the controller is quirky and
> we need to disable/enable ASPM.
> 
> For setting OPP, you can have a separate callback in 'pci_host_bridge' that just
> allows setting OPP *after* retrain, like 'pci_host_bridge:link_change_notify()'.
> I don't think you really need to set OPP before retrain though. As even if you
> do it pre and post link retrain, there is still a small window where the link
> will operate without adequate vote.
> 
Hi Mani,

we need to update the OPP votes before link retrain, for example if
there is request  to change data rate from 5 GT/s to 8 GT/s on some
platforms we need to update RPMh votes from low_svs to NOM corner
without this clocks will not scale for data rates 8 GT/s and link
retrain will fail. For that reason we are trying to add pre and post
callbacks.

- Krishna Chaitanya.
> - Mani
> 

