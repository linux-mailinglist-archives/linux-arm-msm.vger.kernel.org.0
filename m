Return-Path: <linux-arm-msm+bounces-65022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04956B0581F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 828521C23265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B562D6414;
	Tue, 15 Jul 2025 10:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jACinTzg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0146FC3
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752576344; cv=none; b=QUFeQgtTJdeTJeUU9y7ezh2qwRyyvg549wrjz6BKY9qE3wMCxlRad6tudrrlChZDCXA93u8ldOKVE3tj0S8GSl8G1H2qgetkrtjqZefPUlydsYeLnTBIfV+veatAxt6gyylE2vb8MUziZrGhmNmGLBHFGGq/8tFtgtTQC3PF1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752576344; c=relaxed/simple;
	bh=CfYh8DkkhWHdbOj70b8Ln5YS/2Tu1reIjDXMJzIQ994=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2JdyKeLG510T1VJHKAW1O8Rf4UKJp/cC12cUuvy5g1Y4ND57dy0uWCot+/YRjux00okG4eFlS9BmVesqr4Zfmwkx4F7e9XfEityAB8usXOrDBXyYOaR2/CPgE4E+b4uMnjTp/BD42QRo8b+S2JpT63Odhdo6gVOf41GAJyPd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jACinTzg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6Quto018413
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tr9WXr9Wgj7PvxNWPB9n3YKLwTySkY/xbEpjc9/ztVQ=; b=jACinTzgr1v0nWpu
	WZ6WR/aJa/cwBUlYXeoSTuw25mB3o97uUfdlBxz+Ebl3dHXmEdysfaw8EAD1HQ7r
	KeJbix/ryqbYrOHg0VKzmTiYJ4IP0yGnQ6zgHIzfxuZbspnB2/N1jL8GhJSUmhAG
	HjSxABCmfW4Ok/OD3pRKEc71ExtxEWrz6+XBSL3/V7SQ1Bs9t51niDnlJW1gGcaP
	M0Fuwuyrzl2fNMp+aSn088/WoWDyrS4oUrE238MvnLPg1i+htgAfikjELpUug2cR
	fi0ogDj1HTrjHN4kPBVDB6L5GKTqkHgzpFk7bi7jYkxxs5G4uXzDMFIjNX7NP1tq
	pGok6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug3800wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:45:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab65611676so3862651cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752576340; x=1753181140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tr9WXr9Wgj7PvxNWPB9n3YKLwTySkY/xbEpjc9/ztVQ=;
        b=DjZvNwrRI1AjZ/Wjc9uaXljWfY5xluGYuQXMoTJpmveWZY1s+mPXEo7kFlbGbiYtta
         G/vlftoL6b7midA4VIoCrcR/ePGIiUB5jfrRIBEUI0qBuidRFqZfsBBBfYdQiuCU4HJx
         AOyASF/TWbAll6PBk0His0kkzw4DF2/m+dgpz++0ywya8q4IBl9ciyC/ksAlCUygGJdQ
         2n/BPUCPdQ6Bix5qGtSOIg9P0lbknrfRSUfO/d0UXu0NSP21IGmTi4dpFflmArSU2HrE
         VilzjFMjL0a2usSQqKbXxibIGHA9/TzFblkOabCnGnT09kN9lM1ctUYX3OSiWEJeoKfP
         QXow==
X-Forwarded-Encrypted: i=1; AJvYcCUbt3XgfTWsuez1twZwtGk8T/TjGgoopijV4ILLPLwRHLn2P23pM06TDvi8/MDGTbdvIo1t2/R2LLomCnUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwrqC/qzVD2/81LkYpJCD0ybIYpUdEZBN3IetUZRQk2IVlnEy4T
	HKKGpTvINRIucdLGt3mYIs4EFBbXuSJFWLRu/kfHXCPt1l7MR9O+NJtJK3FC38fDrtxrHbg5QEF
	sjTZeLHjuNw3cCesHNUQnCzbB0OCrSwcbcJnrfI8UU19nNiokrZw5R2QHS2JyFn/spN8E
X-Gm-Gg: ASbGncvQaMLHGjuX0xMgjFgS246rJZy4l5QONbJ0iETil4zb4rGc3bJ4uSn4buaDfPI
	76YUbJlOG6CDenZ4p5uoctaeAWhyA4PXJsb7fO1WqbD2ItQBmi3fhfygTHPXNyLSp2rrqpsxqFa
	vSok5RImn8hrJYVnz7Idbf3Pvktoy9WwZc4YYuBv/RZ3Ht0OHYwjLWaBQ7kfPqFH4v3ObZJ+Wiy
	OB30kYO9JmBN7u975rtt+Z0s5b1Lcb/rNTLVDGLP+6W/APxfsGFHICdIkwNpVRX8TMkJJvcLktg
	lsBfpyY7zlAtLQwNhpCR0kojwyN9uGAAHNm6Zgyp6QPljNjPm6s9n/WbhhRhGRkvMqEmv59pxbr
	+IUdgkRtYQ+lw6Hw9O23h
X-Received: by 2002:a05:622a:15ca:b0:4ab:56e5:f7a with SMTP id d75a77b69052e-4ab86f019bbmr6093161cf.8.1752576339742;
        Tue, 15 Jul 2025 03:45:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYZ+kADfcmFUm38+00lNuVDsKPEuidBQZWRv82Z/GlBci1nkAns1DuTkn8l/4Flef3Jxig1g==
X-Received: by 2002:a05:622a:15ca:b0:4ab:56e5:f7a with SMTP id d75a77b69052e-4ab86f019bbmr6092921cf.8.1752576339109;
        Tue, 15 Jul 2025 03:45:39 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e8f9b4sm990861366b.11.2025.07.15.03.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:45:38 -0700 (PDT)
Message-ID: <55f2e014-044c-4021-8b01-99bdf2a0fd7f@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 12:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: qcom: Move qcom_pcie_icc_opp_update() to
 notifier callback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20250714-aspm_fix-v1-0-7d04b8c140c8@oss.qualcomm.com>
 <20250714-aspm_fix-v1-2-7d04b8c140c8@oss.qualcomm.com>
 <b2f4be6c-93d9-430b-974d-8df5f3c3b336@oss.qualcomm.com>
 <jdnjyvw2kkos44unooy5ooix3yn2644r4yvtmekoyk2uozjvo5@atigu3wjikss>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jdnjyvw2kkos44unooy5ooix3yn2644r4yvtmekoyk2uozjvo5@atigu3wjikss>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5OCBTYWx0ZWRfXxw9lmsUjsPw/
 J2CeZLIA5JztSHhvxZkO14rf8KITiff8P1hM9IqQ8md9OXK3d9XbUlAxOJMv4H5oNUnCAEzpdU+
 JvCcOEXxnLoIRrk2FqeBnl9V5tGf+dwPfz0cYwmyLwqhXX06BbePefEADdp9nw6oaJCn142bNQ/
 bBngKW9SszsOzkcoEWUlUte5KAqShdTUE5ImN68AKDfskC6bGStb+fKGW6VhQ6UmP+IZSQyKpP6
 kEI4L6Miy2JdpDTkHL4o+cpBCik1OztyxuEzx719OHDhVTcyzi6gXHnRfvEz/FDHWzSt9qV9B5h
 5v5OjRbKcoXjIs8cny4Zm75flDydbqsMYGo5fwDhDisKXh9N25JrWHhe0Ux2DwgCUEo3auUtjhP
 72RNu2de35uSQlyRTQZV+6UEHk+GhXoXBMnivyoioAXkDjPdcmzZiHumpopg5XITkWDBeHnZ
X-Proofpoint-GUID: 3KOwbLipI71etjX2S8qpsI4DTqs8MJx4
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68763154 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=uNiOjgRUHSxkwL6ZQ2AA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3KOwbLipI71etjX2S8qpsI4DTqs8MJx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150098

On 7/15/25 12:36 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 15, 2025 at 11:54:48AM GMT, Konrad Dybcio wrote:
>> On 7/14/25 8:01 PM, Manivannan Sadhasivam wrote:
>>> It allows us to group all the settings that need to be done when a PCI
>>> device is attached to the bus in a single place.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>>  drivers/pci/controller/dwc/pcie-qcom.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index b4993642ed90915299e825e47d282b8175a78346..b364977d78a2c659f65f0f12ce4274601d20eaa6 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -1616,8 +1616,6 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>>>  		pci_lock_rescan_remove();
>>>  		pci_rescan_bus(pp->bridge->bus);
>>>  		pci_unlock_rescan_remove();
>>> -
>>> -		qcom_pcie_icc_opp_update(pcie);
>>>  	} else {
>>>  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
>>>  			      status);
>>> @@ -1765,6 +1763,7 @@ static int pcie_qcom_notify(struct notifier_block *nb, unsigned long action,
>>>  	switch (action) {
>>>  	case BUS_NOTIFY_BIND_DRIVER:
>>>  		qcom_pcie_enable_aspm(pdev);
>>> +		qcom_pcie_icc_opp_update(pcie);
>>
>> So I assume that we're not exactly going to do much with the device if
>> there isn't a driver for it, but I have concerns that since the link
>> would already be established(?), the icc vote may be too low, especially
>> if the user uses something funky like UIO
>>
> 
> Hmm, that's a good point. Not enabling ASPM wouldn't have much consequence, but
> not updating OPP would be.
> 
> Let me think of other ways to call these two APIs during the device addition. If
> there are no sane ways, I'll drop *this* patch.

Would it be too naive to assume BUS_NOTIFY_ADD_DEVICE is a good fit? Do
ASPM setting need to be reapplied after the PCIe device is reset? (well
I would assume there are probably multiple levels of "reset" :/)

Konrad

