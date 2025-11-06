Return-Path: <linux-arm-msm+bounces-80597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2901CC3AB50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 12:52:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 341BA42092E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2E730F948;
	Thu,  6 Nov 2025 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O71WoNgu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRelBRQ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2EB30F946
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762429331; cv=none; b=bMOTjqKsmQirUyx3yIo58+kf+MbdBWhsUoE9tqmWA2N6qiEAvVC5hRsQgqCZ8PslS4egbNFIB4ySsmQL5Xp5a+geD2mpHrkShWGM2Dw+zxcAXZ9RFNNo8QE1Ja8oWH92Le9gm0MDX24V8QBGHWWozNm4paHgHlwNnu/W8q+6+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762429331; c=relaxed/simple;
	bh=sQLg/ltUathCjSADzC6pfsCa5ibsNIbv+YZgTavNDqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJ8QoR8Sg5Q01Z3EA2lax1LSUHBeQa3l0NbvvKSgV7eLtOzNdyKWGYfII+6bi9KlZwdOWeX25vfrrQBi9hYf/Z+rI+bSqeVd4KvuarsV5hHenFKdhdylCFAK5Pp1Chkowdv3tnSq93upfro1GZFyrQNTy5Hte4am/JHKc+OFsoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O71WoNgu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRelBRQ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68PiHt2390648
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 11:42:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XyNQCdDuYt8FJ59B50KoPOS+Dq0RnIAj1w8pRuHSc1A=; b=O71WoNgualVbB4gO
	gGKayh8cjXI3XqcJwjUE49yMHZVVhTFb0LumjebySrTqklpZdYeF9dO9kbstU5Ey
	HNSopO0bCzMLyJTFs+RI4p3QKQ2d1mUxd5HYn8ALccQsYmJL3YZD0W4ZbVXfsnBD
	TPuBZwIGW7P2vXXY8iEUIvEcsVsmrHrAs4QrrAH2mT6fX0odpVtgwfjhGzQuWtqH
	S5J5Vb056WkxMeGNcw9cenhHIGg3OPo2eMeJXh9wPqszdRAGu0HIIWYTbRAT77g+
	XAUMkqYyfa71bNdYRKKrtojAPFqe6lcNQNPseKyxQupVJhfQg3bqPW5ZPJL2bhFw
	FKeaEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8h9uspu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 11:42:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290ab8f5af6so10531885ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762429327; x=1763034127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyNQCdDuYt8FJ59B50KoPOS+Dq0RnIAj1w8pRuHSc1A=;
        b=BRelBRQ9CWj8Nvo/gTXm61yRtzFe3Qc0wQGMEE/PSOUZOnRgDuM6lhmiT/eanduW/k
         IxU9ftcIJTIhpFXOnBXuLS20iWWkAvEdxzy/3JvyOIti1XdO86FJmLtZNpQH5IzRpejg
         KJafqeol+jKIBovhKCDNE5bnjrIy8ItPlbqU8Z3MSN9Etssu+zff2tSvIIu9qEVaEuar
         3UhwIMLmmprYtqYYcxtYjQShzQZ49TOu630EjYFqiTMNBG6am9ZpXsre3nnX121+0lI5
         SaU7n75W2nj5dF0IyIZKqXBHqbTq0RsPfb6YYdErGaY0RCUQoN3l/yo3W+UXBuCOCQ8d
         f2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762429327; x=1763034127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyNQCdDuYt8FJ59B50KoPOS+Dq0RnIAj1w8pRuHSc1A=;
        b=TBawhUpDaok9dQXP0lEqiwZgqxcI0Ls2a4mI29kQhfWuWUOZdBXpx9lx7v8l2ZWi/N
         wyQfyiSdHDM1v47PZ3C2YdmpgorqaIukBz6/J3HXaXkqh09XaF+0WAhOBgCtqR9GFeKb
         O1OjlIIsmQ4tjAEk1YOeyGs3rYTOWqhkqi6+mAuMiOViF66w8PdWFVEGaFx+qTycvpL6
         YSQTHEk+VmRVN/tKcJI7nuLhbOmksP42eegLc/F76cldS4HtCrlErP7aya3yuCF53B3T
         2/nDyr+6OpE/oppZJuM9qioYdhfb+TYJMHEmj3wnEOJF1rNY5++nfy14n79qTXjSfl3y
         3lwA==
X-Forwarded-Encrypted: i=1; AJvYcCUI8ZRmF+mvRoMoisaU6SNgjv0VjTllBoRLAdzKWlL1Af78i2+y9qSLqeER7tlBl8Z2Od100w8tLcqswg5I@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe69GDVwgmJesYL2cmnHWchVtR8Hc3ooWDYlQQwccBKTg0HDEi
	QCDfbjPt99chLdTc2TPulRZdOzhTb8sDSpAQVc1eDRyDqbd0wEvCYjFM+Hu2Kx5OXAJL5U4f9pW
	PejiCmFtZqiQFZMeVtxYWEeEEe9CGrX/OyGg3IT2+CL0glnekq6blHDJeZDtoDkrAS9mWCR5FzK
	nn
X-Gm-Gg: ASbGncsWqVfyR5RfPUt7xd7U2iWoTScqmaIZPGAsFEyYEF5gLJXaVgPmDBSErOSdLM3
	/TuN0yg7Dr7PngmdaD0Cbs5xko1SQDN35ZBExjbhZUYwp3mj456QqOXwmeaDb1yG4NYQI5kwtkw
	t9HgXiiCWi371Y3nWZvwUUPZMhNVuAMh24qm3AmwhubBcOho+cwdiYO3aRQcAd6XbHzRYOCPM3g
	f8nRv289ZGg7bP7UTxxDLV/tm8cBZsRopABLkiQrFj9EjTqX4T1vgTIqjRChKRXh699UZ/X/48q
	zoSGPdOW8iNahvKmJnmG4J1sHRVYwppUg6AeFvvJu3qwYsfxQ3T7o/Xy5qmyW3bpEkM/3x2mOJI
	tOaqcZLpaACcFdQ8yEuJ6a/o+VdueuUQ=
X-Received: by 2002:a17:902:d48e:b0:24b:25f:5f81 with SMTP id d9443c01a7336-2962ad16addmr101807185ad.17.1762429327234;
        Thu, 06 Nov 2025 03:42:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGA9TIB8orqE5oPIwoVJXvrc38Pb3yNWldPGYOvWIlv3ebdEia7DEdvxcYxMUiRoVSNBpxMMw==
X-Received: by 2002:a17:902:d48e:b0:24b:25f:5f81 with SMTP id d9443c01a7336-2962ad16addmr101806835ad.17.1762429326694;
        Thu, 06 Nov 2025 03:42:06 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5fdb5sm26117435ad.44.2025.11.06.03.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 03:42:06 -0800 (PST)
Message-ID: <d739102c-d7b1-4c5c-9246-200e17cf1ef1@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 17:12:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Program correct T_POWER_ON value for L1.2 exit
 timing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mayank.rana@oss.qualcomm.com,
        quic_vbadigan@quicinc.com
References: <20251104175657.GA1861670@bhelgaas>
 <e459b4de-52f1-4c20-be84-07efdc9fed93@oss.qualcomm.com>
 <tecoemfjvcuwrvhiqxla2e7b27tgsmkahrbe2msr6vlh65alvp@vhlklrfasjd5>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <tecoemfjvcuwrvhiqxla2e7b27tgsmkahrbe2msr6vlh65alvp@vhlklrfasjd5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5UO2NRX c=1 sm=1 tr=0 ts=690c8990 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lcPbnEz4b48S40dIIKQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lQRDHLAUivc_-No-vbxn5OfoMmAiq0KK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5MiBTYWx0ZWRfXzFqmXLtcuq7V
 3hE8DVGT7Qf4QYjYKYF+X3cEBN8LeTXKs898x8jVQDmUrtt3XI0YItpSAwPP3bB+2ntMhM7KqBz
 hbJdj+NBAa5awD3CYZqkR5HA1oJwPxP6Nca0qN+/pNbla/dEqX5WcLXmr6mAPqnT6qjabjVF6iq
 x9/qtoF0AxtdiOkffH8UagMS8SMSgZ/dEQUqhOeiu1kkLAZImP1y/oizOlAMPA6QSsPOkvVqyzg
 DiucVRX7Zf5ngJ0U6WOFcufAvtQTH0p2rBZnsdd8byzJaOMWKZDaleqiNAnZlLtwL57MdIDPPV5
 DDdXlK2TVHAqDNRWTrgX9iB5v8NuV8K9E3U9mknkp0EBjmbhA1LEKcbhoQb4jXGwJr3CwVAxZ3k
 6Q7BbdhUdyrRj+ItYR3ixU78USfWIw==
X-Proofpoint-GUID: lQRDHLAUivc_-No-vbxn5OfoMmAiq0KK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060092


On 11/6/2025 11:51 AM, Manivannan Sadhasivam wrote:
> On Thu, Nov 06, 2025 at 10:30:44AM +0530, Krishna Chaitanya Chundru wrote:
>> On 11/4/2025 11:26 PM, Bjorn Helgaas wrote:
>>> On Tue, Nov 04, 2025 at 05:42:45PM +0530, Krishna Chaitanya Chundru wrote:
>>>> The T_POWER_ON indicates the time (in μs) that a Port requires the port
>>>> on the opposite side of Link to wait in L1.2.Exit after sampling CLKREQ#
>>>> asserted before actively driving the interface. This value is used by
>>>> the ASPM driver to compute the LTR_L1.2_THRESHOLD.
>>>>
>>>> Currently, the root port exposes a T_POWER_ON value of zero in the L1SS
>>>> capability registers, leading to incorrect LTR_L1.2_THRESHOLD calculations.
>>>> This can result in improper L1.2 exit behavior and can trigger AER's.
>>>>
>>>> To address this, program the T_POWER_ON value to 80us (scale = 1,
>>>> value = 8) in the PCI_L1SS_CAP register during host initialization. This
>>>> ensures that ASPM can take the root port's T_POWER_ON value into account
>>>> while calculating the LTR_L1.2_THRESHOLD value.
>>> I think the question is whether the value depends on the circuit
>>> design of a particular platform (and should therefore come from DT),
>>> or whether it depends solely on the qcom device.
>> Yes it depends on design.
>>> PCIe r7.0, sec 5.5.4, says:
>>>
>>>     The T_POWER_ON and Common_Mode_Restore_Time fields must be
>>>     programmed to the appropriate values based on the components and AC
>>>     coupling capacitors used in the connection linking the two
>>>     components. The determination of these values is design
>>>     implementation specific.
>>>
>>> That suggests to me that maybe there should be devicetree properties
>>> related to these.  Obviously these would not be qcom-specific since
>>> this is standard PCIe stuff.
>> Yes Bjorn these are PCIe stuff only, I can go to Device tree route if we
>> have different values for each target, as of now we are using this same
>> value in all targets as recommended by our HW team. If there is at least one
>> more target or one more vendor who needs to program this we can take
>> devicetree property route.
>>
>> I am ok to go with devicetree way also if you insists. - Krishna Chaitanya.
>>
> Since this is a PCI generic value, using devicetree property makes sense to me.
Raised devicetree change here [PATCH] schemas: pci: Document PCIe T_POWER_ON

<https://lore.kernel.org/all/20251106113951.844312-1-krishna.chundru@oss.qualcomm.com/>- 
Krishna Chaitanya.
> - Mani
>

