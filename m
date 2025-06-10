Return-Path: <linux-arm-msm+bounces-60707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48801AD2CA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 06:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246B73B1BD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 04:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049C221FF32;
	Tue, 10 Jun 2025 04:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOGc80I8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32021883F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529832; cv=none; b=hmHsGJoqmbLX79vUuyOl7DohcxqPIG6drRbksdx7U3ds13VPVh1CdiLNQY+J3AdXjPRAFVdt3zT4q/rP1T91i4H46ODPxyxbTmRrmjisBX7lBnq9YvEw4HZPgWrNHGZl1ebRnXpmK1aTikwiHrBFSVmJ046txP4OI42NIXJygVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529832; c=relaxed/simple;
	bh=9EwRn4xU5rqDmmQ0dN46vDzRZok4Nuw/0K9axCTxamY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXQ/rwLGrFGnvIUJvLw8PrtooZrqs4UUD3l5VXGV945XSu2fS9+jA1mbKsrvNwiTmW7IXqfDh6WpWr9Oggp1RhhJx5Tduj0O7IgjhFTROTtWffMjIP3S2EsScjLiCt/kP2Ler1gxJ7YOHXYCQ9a9ccQKZpJ4FZtGWzXsXn7PSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOGc80I8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559LVNZr009687
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlxTzuNSKnaMomnStjfm5BQj5tbuQzgmRWsa6rdM0ig=; b=JOGc80I8UA/MFOHR
	EHiykkNlJsndHO/GZNWe5t2lc9PzFKVtZu9kPLKgP+tpl4/vZM8iX+Ie6+jgtpmT
	8knjVoOhrPDqxK0aHUexh+EFQGku8FESjcgk4Vqu1JQj/K2JoDElKgPwUfRaMBO2
	0lRzsqP618BgmfkdhEMBQ/OMWV+5BSOuwD3DN99kNgx5jXgGBwvlw4jpkAE4LeQZ
	M/+1/rMH0rylpa69VVj0qrgW9C+mOTuFFqOJDlCqsnZwGg8WQwUSR2rCXHk2TSwQ
	uVQED17AED80Lo48UlRYUcA+mO/dhtaMHjCK+xYXgSrCh7byXCuztNVHp36iDPs9
	7mamlw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jfw83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:30:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7377139d8b1so4167235b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jun 2025 21:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749529829; x=1750134629;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlxTzuNSKnaMomnStjfm5BQj5tbuQzgmRWsa6rdM0ig=;
        b=s8vNMG5hQ99h65QfHhjdB3yFLOj0e2JLCf/7cUDcFANCJLRM/8d7a4JRLAy9uyIpbd
         yx8b4SO+3NEUGtABvq40/U1njf5UH2tWO0cYRRYDH9k3gFwpXOmSOTUcAySfFmEFxNqB
         PuzDh0p/A35Hd034PUerKVnk25m36Cy7vHo5duWi2KLjUXd5d49mK3getyPIVbDX0unK
         0KE8ChnHE1FuSvNRIPalDV7E38/ebDJb7CCIfgPOkorKPDL57w7dLg/PVA3QnASEzwaE
         v3kXLbG2iTxTij8TaWHjMbQiyAXsIS0JvoSUQwa/v6m+9h7g4W1YxypBRnUQ36CN1ATN
         1xFA==
X-Forwarded-Encrypted: i=1; AJvYcCXae7cHpuktxKB9+3et3KKzk6gK5FvqPNNZrCeMoMg3eyGREFThNNOgDT2O19frL+X0VIk6ffzIPK2gGYUs@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXW7BlMTuktFdoifwx2DTnRc+cTDGFtNwf/WPrQmMaJjJTfp/
	drXfX9UedSpkWyVPifEPIb0QAFjbyktQ7+5w8rfa4VqTDkFSRE+nVPz4y95ZXZbyEEHwLcE6YbW
	zSpt8KqUfNacsTrUxM3kqZlnQt0DGicKMiYrtyxHBZzyYiSzM1uIalPuTIgc3ZnEm+t/4
X-Gm-Gg: ASbGncvrXJWTn2xY0LB6Sx2W86Y9KTo31l+qTu2jw+QK9eDmd9L6eoMq8NTKo4pMecE
	WB2neDc20B2VgOilXf08kDN21k3PMAlNqB+laRA1HAujkpfRDab0coKJbApoNeYVIzIf0GJGkeX
	DM+cMJ8S6wPLQDwHMj6s9JeztaUoSTNxk6OXqX5vnMapLqQr0ji1++Scju3iT9vrjP35XqQC8R9
	x97g2dYnVsJ01Z0gql06o4fDBMmKEnwSlwR7uDxoj/dck+QHEY9DZSMSa0SXfF37daNT5V6E9b/
	DiuQ/5ExUej1W8z9EMMLiSyNzzHbyg7npON5+ebs6FExIJ6VnMn7
X-Received: by 2002:a05:6a21:2d8f:b0:1f3:33bf:6640 with SMTP id adf61e73a8af0-21ee25554a1mr24661216637.18.1749529829475;
        Mon, 09 Jun 2025 21:30:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9qOq+J871xprt9k13YaxyprFae54ri1s5ir8th5tRruipb0nys9F/q4cZ6ref0m/tl2p8rw==
X-Received: by 2002:a05:6a21:2d8f:b0:1f3:33bf:6640 with SMTP id adf61e73a8af0-21ee25554a1mr24661173637.18.1749529828953;
        Mon, 09 Jun 2025 21:30:28 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee70c5asm6082792a12.30.2025.06.09.21.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 21:30:28 -0700 (PDT)
Message-ID: <31f13d04-83a1-ffae-38ec-56b14cc6f469@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 10:00:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 2/2] PCI/portdrv: Add support for PCIe wake interrupt
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Tony Lindgren <tony@atomide.com>,
        JeffyChen <jeffy.chen@rock-chips.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, Sherry Sun <sherry.sun@nxp.com>
References: <20250609223428.GA756387@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250609223428.GA756387@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=6847b4e6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=s8YR1HE3AAAA:8
 a=83v7bLYTj1cJe6AAMioA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: yKY_KkpYU0aUDSIGqj9kx5mOX0eyIkhq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAzMiBTYWx0ZWRfX2nWmRrO1ZfJ4
 BrJdWYnGnSLonnNO8Yw0tGJbzqSaJ5UwwsSE/O47jtTOI0ba3XzNBayagfzZ/TLQEKxTu2bEspb
 NNV1yl4zSNz/1wcTjEI+MXAs1eyMoxLGxrw4T6h6SpS36sjjBVkloI+XSxp0CezyQyv4CkfuSP0
 DlVjqXn7GCAWx73QTlbIxvgI7AIynZwuHWH/FlbuG0I6b1MbHIdt+86hKy4nNR+rOTGfqMA7TAF
 jBtC/2TdbsHVLMAlj6p9Pzw5i/n8MzhIfkPYqqt5Xx4JI9vbgHRoEFqoBomOyNPK+ygmUIVisaI
 AWp55cJrOBpUjiUKjjAFpkaIdY6DidagOzC6WrTAEjYDRISKvTmEee0NMj/+Io5nryTgk7XYYSX
 xF+4g+bYO4LVdN6ag4wTEkHBCTx6Br9aBBVYZofEtyjhEI5NGl+VbVWbZ7+QjEO9BGaiWJTS
X-Proofpoint-GUID: yKY_KkpYU0aUDSIGqj9kx5mOX0eyIkhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100032



On 6/10/2025 4:04 AM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 05:29:49PM +0530, Manivannan Sadhasivam wrote:
>> + Brian, Rafael, Tony, Jeffy (who were part of the previous attempt to add WAKE#
>> GPIO/interrupt support:
>> https://lore.kernel.org/linux-pci/20171225114742.18920-1-jeffy.chen@rock-chips.com
>>
>> On Mon, Jun 09, 2025 at 11:27:49AM +0530, Krishna Chaitanya Chundru wrote:
>>> On 6/6/2025 1:56 AM, Bjorn Helgaas wrote:
>>>> On Thu, Jun 05, 2025 at 10:54:45AM +0530, Krishna Chaitanya Chundru wrote:
>>>>> PCIe wake interrupt is needed for bringing back PCIe device state
>>>>> from D3cold to D0.
>>>>
>>>> Does this refer to the WAKE# signal or Beacon or both?  I guess the
>>>> comments in the patch suggest WAKE#.  Is there any spec section we can
>>>> cite here?
>>>>
>>> we are referring only WAKE# signal, I will add the PCIe spec r6.0, sec
>>> 5.3.3.2 in next patch version.
>>>>> Implement new functions, of_pci_setup_wake_irq() and
>>>>> of_pci_teardown_wake_irq(), to manage wake interrupts for PCI devices
>>>>> using the Device Tree.
>>>>>
>>>>>   From the port bus driver call these functions to enable wake support
>>>>> for bridges.
>>>>
>>>> What is the connection to bridges and portdrv?  WAKE# is described in
>>>> PCIe r6.0, sec 5.3.3.2, and PCIe CEM r6.0, sec 2.3, but AFAICS neither
>>>> restricts it to bridges.
>>
>> You are right. WAKE# is really a PCIe slot/Endpoint property and
>> doesn't necessarily belong to a Root Port/Bridge. But the problem is
>> with handling the Wake interrupt in the host. For instance, below is
>> the DT representation of the PCIe hierarchy:
>>
>> 	PCIe Host Bridge
>> 		|
>> 		v
>> 	PCIe Root Port/Bridge
>> 		|
>> 		|
>> 		v
>> PCIe Slot <-------------> PCIe Endpoint
>>
>> DTs usually define both the WAKE# and PERST# GPIOs
>> ({wake/reset}-gpios property) in the PCIe Host Bridge node. But we
>> have decided to move atleast the PERST# to the Root Port node since
>> the PERST# lines are per slot and not per host bridge.
>>
>> Similar interpretation applies to WAKE# as well, but the major
>> difference is that it is controlled by the endpoints, not by the
>> host (RC/Host Bridge/Root Port). The host only cares about the
>> interrupt that rises from the WAKE# GPIO.  The PCIe spec, r6.0,
>> Figure 5-4, tells us that the WAKE# is routed to the PM controller
>> on the host. In most of the systems that tends to be true as the
>> WAKE# is not tied to the PCIe IP itself, but to a GPIO controller in
>> the host.
> 
> If WAKE# is supported at all, it's a sideband signal independent of
> the link topology.  PCIe CEM r6.0, sec 2.3, says WAKE# from multiple
> connectors can be wire-ORed together, or can have individual
> connections to the PM controller.
I believe they are referring to multi root port where WAKE# can routed
to individual root port where each root port can go D3cold individually.

 From endpoint perspective they will have single WAKE# signal, the WAKE#
from endpoint will be routed to its DSP's i.e root port in direct attach
and in case of switch they will routed to the USP from their again they
will be connected to the root port only as there is noway that 
individual DSP's in the switch can go to D3cold from linux point of view 
as linux will not have control over switch firmware to control D3cold to 
D0 sequence.

But still if the firmware in the DSP of a switch can allow device to go 
in to D3cold after moving host moving link to D3hot, the DSP in the
switch needs to receive the WAKE# signal first to supply power and 
refclk then DSP will propagate WAKE# to host to change device state to
D0. In this case if there is separate WAKE# signal routed to the host,
we can define WAKE# in the device-tree assigned to the DSP of the
switch. As the DSP's are also tied with the portdrv, the same existing
patch will work since this patch is looking for wake-gpios property
assigned to that particular port in the DT.

Please let me know your opinion's on this.

- Krishna Chaitanya.
> >> In this case, the PCI core somehow needs to know the IRQ number
>> corresponding to the WAKE# GPIO, so that it can register an IRQ
>> handler for it to wakeup the endpoint when an interrupt happens.
>> Previous attempts [1], tried to add a new DT property for the
>> interrupts:
>> https://lore.kernel.org/linux-pci/20171225114742.18920-2-jeffy.chen@rock-chips.com
>>
>> But that doesn't seem to fly. So Krishna came with the proposal to
>> reuse the WAKE# GPIO defined in the Root Port node (for DTs that
>> have moved the properties out of the Host Bridge node) and extract
>> the IRQ number from it using gpiod_to_irq() API.
> 
> I don't think we can assume a single WAKE# GPIO in a Root Port, as
> above.  I think we'll have to start looking at the endpoint and search
> upward till we find one.
>


> Bjorn

