Return-Path: <linux-arm-msm+bounces-65126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FF7B06CD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 06:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A85AF7A3D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 04:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485D226D4C1;
	Wed, 16 Jul 2025 04:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7IO801v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D176FBF6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 04:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752641675; cv=none; b=sMdXxvO9xwxgZL0nHjNs4WUg+Jl2qyOPnXOIErhE8gb2jAR2QE5SKU6jNSSJucLPydQHo8ogttrPJ/prPG7ppSsy0c0a0hdL8Ulufhq9T0I4N0XnjG33sLXuKDHnchwY7XhxEJaJ9Echqt09p6nxdASYTHQBKqJ/sERT50S0kOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752641675; c=relaxed/simple;
	bh=JcgawIRkiXGDkejFfyGdNqbuJduoSCYxQVrXLGYc07A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M77jVByxUDXddVWtaM9GM3YOxg13nSf+n4zYDVo09CBsdYnC0N62itext2yxsq0IXzU4kdx2ybw1dagDHDBOPYLQRR8PI0InBwy0BNs7q8b1n+qzANTdHH3zFO9nuV0FD5fUlHlNQ+xw0nomxBw/3YcMe6jIER2dyLcPNxQuI50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7IO801v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDKBp026152
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 04:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAPA/34RtxDjvhrdalVzCKzkycZXICqD7bav8h/cZ5Y=; b=A7IO801vj/WHxsyc
	lis9RxTSJKlG3BasMsC9MlRC7tl2x8Kgo0m7Az4WXe7DxeAwEiqsfT+//08TOKgo
	UPD3eAPbBDIKPNeGv2LRp+Fsmvk+Epeq8Xg/G3CvLrJtxpow6Wf0mr+kCpTpPqdt
	JDlTOql3RxaQV3CrDkQPWj302b7asJToVBhSsYgqchozVc9BD1IKNvWZOiX/Z53X
	YI0FsWij10XmjqcEU4ZZRNgh40Nmi04R6t9VxCl4B2VSApmB6hP5mo/T06fKRjve
	PKdSWOWj5R7x4AhZdc5648SvEtXkyL+9PCSxKKp4ZoxQgkG0TWaDAAxNW2b7M8vH
	5lZ6XA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca3sam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 04:54:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2369dd58602so59880865ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 21:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752641671; x=1753246471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HAPA/34RtxDjvhrdalVzCKzkycZXICqD7bav8h/cZ5Y=;
        b=iQfXKmD71mYODSHf9f7x8LvoWluEZVPvwesqQFaLgH78VL4yAV+5BDcSCBJtiPT269
         sKdWEduQ+sWrKdb9ZbargN7LFkG3zjAHEQzVm+LscOQh0lTXPjGk3984LJukjTuCCQJj
         9uDUcZEiX5ujq8CpnzOYpRj2iex10gTCi/5tqTkDKIpNM0ECPF0Pev1GIGeoEHZjuxBt
         X+V+1a/kScQsEgkdgM55ZX96GGC1eyTCFfqPqQZX2NaIwGayPdAXExtWwQiaWWd1YXoG
         8sJHsijv/CGhn6PmWDynUFO/jaHj+IioT2+XotmhTLD0XAZqkl4vSO4TUgGGiid5P1WE
         WNGw==
X-Forwarded-Encrypted: i=1; AJvYcCUQU7cM8dxcyKXrb6+8VX8bMe2cZixKL6fpJmzDtMgD+WsQTfhvLJJyiOxS+TkgnyyzKKc+nrAcAS/jPC0B@vger.kernel.org
X-Gm-Message-State: AOJu0YziMUY8E9HY2LVoOCJxZ0gu28wGRGKvX6tL1bpIytK1nDSXF10e
	udBXmSxubEoLAlS7HItU1FVD02JhbdY+PCB6TxfJvsxUMYzq4JZvUNlmuL3yv2tSYqLx1JcwCrS
	/a9sXzQR9IrY5MNloUwIaZ6WkqA3brIzEGbVSuJNuXiDypp0kAg7sMZ9xkKHwT+rpULy0
X-Gm-Gg: ASbGnctJSZIPI/ufbjGm3sv6gUJPwdjy34pwfNYm97+//m/UycawiuYVnyohVaNTlzl
	J9TFVu6fYNoMQBVNnzPbiRMoQ4E1Anu/vlIAuH3M0wbbduluC6JZtWzIcAd2wUK/wurRvT0dzv0
	XDqm+fOoAq6dtlhfioy+Ir6HEtbNfp9L982o7qAfeNsge9hdYzfKpZxjbhrzY343q/XY+IRaMl7
	5gOB+5UCXdQKjNAttJCoV36RJIjQCvL3/2+drHHn6/MXxSoAqjXPYQBwX2z6YOW1Vwig2Ih8aWE
	bnK3b9klEtKm4ggEagn+y0qscKgXMWr57IB9E+TceAz//+5slGwdqIyAR7PHAIA7uUbKQA==
X-Received: by 2002:a17:902:f545:b0:234:ba37:879e with SMTP id d9443c01a7336-23e2574547dmr20717565ad.38.1752641670788;
        Tue, 15 Jul 2025 21:54:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3o8ZyYwDjR7aKMNEc/ivaUPzgonLNBGd7pGRCieP1Gp9KfqY+Mxb+hO4nDvgLn070PhIIpQ==
X-Received: by 2002:a17:902:f545:b0:234:ba37:879e with SMTP id d9443c01a7336-23e2574547dmr20717285ad.38.1752641670325;
        Tue, 15 Jul 2025 21:54:30 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435bbc1sm117686505ad.228.2025.07.15.21.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 21:54:29 -0700 (PDT)
Message-ID: <eccae2e8-f158-4501-be21-e4188e6cbd84@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 10:24:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: qcom: Move qcom_pcie_icc_opp_update() to
 notifier callback
To: Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20250714-aspm_fix-v1-0-7d04b8c140c8@oss.qualcomm.com>
 <20250714-aspm_fix-v1-2-7d04b8c140c8@oss.qualcomm.com>
 <b2f4be6c-93d9-430b-974d-8df5f3c3b336@oss.qualcomm.com>
 <jdnjyvw2kkos44unooy5ooix3yn2644r4yvtmekoyk2uozjvo5@atigu3wjikss>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <jdnjyvw2kkos44unooy5ooix3yn2644r4yvtmekoyk2uozjvo5@atigu3wjikss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0MSBTYWx0ZWRfX95BJEYXX/pqG
 bHqhS9NlrDTc1Ia3U994AWS4KRmZssCYs/dqQPQpGhQqhBOZY+GuBghP+6RBIpsy8vBMzfCey/v
 JnWyQuS/lLtWFf6Q2aPxfx3Qz/YEH74hWzfnnb9EWEvEyGS+43HcWOReSV0tOf2GJfAHlMFQDR8
 Ft3LK+SYB1G9WTWqQWYaQQgHg+NfWR05+6Krexz3puUJN6fdu+TFYo/pQ15a6JUHw0dLyJLx9n5
 Pj6nBe6SEN8rjbj6lqh28WIts4SCLC0GxbEc7P+E1GXhnIKLOBYq+fYmd1oMGoWTdbN8fSAgvEg
 uuk9nTVeY2dVh0kWqV7EhdByDfiMrOC4+d7/MRnaiZpbDkSXq0xrOYunVkkupZ4KwpphW8Sar4c
 +8jKoWHR63DHKFYE29ny+t/IRT0OpikIzgSo58GYq7cATO5yrn1odGy7/FfbmGP5okishLUv
X-Proofpoint-GUID: jGaSioH4gIB5_rPJA4yFqKiDvN5qnIe6
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68773088 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=uNiOjgRUHSxkwL6ZQ2AA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jGaSioH4gIB5_rPJA4yFqKiDvN5qnIe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160041



On 7/15/2025 4:06 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 15, 2025 at 11:54:48AM GMT, Konrad Dybcio wrote:
>> On 7/14/25 8:01 PM, Manivannan Sadhasivam wrote:
>>> It allows us to group all the settings that need to be done when a PCI
>>> device is attached to the bus in a single place.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>>   drivers/pci/controller/dwc/pcie-qcom.c | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index b4993642ed90915299e825e47d282b8175a78346..b364977d78a2c659f65f0f12ce4274601d20eaa6 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -1616,8 +1616,6 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>>>   		pci_lock_rescan_remove();
>>>   		pci_rescan_bus(pp->bridge->bus);
>>>   		pci_unlock_rescan_remove();
>>> -
>>> -		qcom_pcie_icc_opp_update(pcie);
>>>   	} else {
>>>   		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
>>>   			      status);
>>> @@ -1765,6 +1763,7 @@ static int pcie_qcom_notify(struct notifier_block *nb, unsigned long action,
>>>   	switch (action) {
>>>   	case BUS_NOTIFY_BIND_DRIVER:
>>>   		qcom_pcie_enable_aspm(pdev);
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
> 
How about using enable_device in host bridge, without pci_enable_device
call the endpoints can't start the transfers. May be we can use that.

- Krishna Chaitanya.
> - Mani
> 

