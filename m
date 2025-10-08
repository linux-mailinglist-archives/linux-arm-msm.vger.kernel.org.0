Return-Path: <linux-arm-msm+bounces-76349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2291DBC41F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 11:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B9244E362A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 09:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076642F3609;
	Wed,  8 Oct 2025 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMdemdZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6553E2ECD21
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759914710; cv=none; b=B2aLlol9SWmSkWItn8R1u2KRPoYhJbLj1mQCRCQRcqPTibMg9Qr2XCBN/RUZ9OiDGoHlNZsQPM+SDGVUmjRsLi4Ypo1Zf64i1X56pxfkG+s6+T+To++koFVR7sXKdDKD/h+B5+Pg7PRqvO73/2CURfb86eL4BQYLxYxfIFYdyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759914710; c=relaxed/simple;
	bh=7tlsNYw7jry2YwQr503x8M7vYIit29lQJU9LWiYHdcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPSZvBbUBwn127hcE2oUpz4pN7dNsj4cPKez394//7eQacshdDeATno2vkSoxSq/Nq23zzS3FhtDIQ/FV6K1Bqwo+s35Pn0pSV6ZrL9jb7IzVFIxE+UNr7jw5TZb96uShFUVSFMb9iWQxFpZ571kNxKcczCMzZ7uCRqe1YR0xWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMdemdZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Pxo028801
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 09:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzZHHkGJEfwd1Se8SA0pc+Db37+3AwYJluCV2KmgWEU=; b=JMdemdZaJUP+7wpa
	tW65ekjIBzNsC2rjj0t390yqI8Je2vQ/zKEpOu3tDrLVjRwewQYBVk6CKdutPXhD
	sDX6bRkzP4QOuIcamCuWFUUaLez5qNg07ionp0vpEjeMzbv81yNp1cFUQqouTYDB
	FhuhZAkG9POIvcKyvLsVGFPy6WKwyzpnp1X/ON+9BLC1aT1LybN0MPBu+c+s4tL/
	lwzE+e2MWuFiIiPt1G5thxNVYorjUAuk+Bz5SzgFcM1ztbtVaGRZMMGZQvZz/9uq
	NXXuDobjlkURwW+JhlE3xBD1yymCRRBBHgOwsQKCjvQlXfFdQKWV9OQB9/6ja1A7
	IbpZow==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgsxf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 09:11:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d6c3d10716so13443171cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 02:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914707; x=1760519507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzZHHkGJEfwd1Se8SA0pc+Db37+3AwYJluCV2KmgWEU=;
        b=XXT8cAFPSH+I+vw6FjLzjZVaI8yT5SIdJ34oPrbhECXTza+taOdqnkUcekYKS253vL
         IO0ubz7kD8CmeIr0nkCptDGBzms27CTJevKCUvixtWUlXgmP0lD8pjOAe1o1P1ACD3LW
         BbZTgec8IKWPRHhH99h/TDV8r8uOqy8FzngfDBAeLgBglq1H0WyUbdhqWfTOQb2o7IjS
         +y0sZB4Doc4dh7C1aM2jRjQ3E1R50R28XhoNOJ7CQgkddB1Zh2FW88xXb6eandaZWKK5
         QP008N94Xki3ezVsvRWy5ejRTmYLBq6BfWTd+LdwmfsafLun5Nz54cECS95lcdyrMcye
         9SzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK8EhSIf94SI9w9O0J0OpgPbh0P1VcgrPKzncPUbL1/bnKwCwzAS3RxYesI8dVlILukEW+F3L5yqYQPANX@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYrW9tHLFVesopdTUO014PpSWPCLNfF1Vfvf9/Gbyb0RcErRR
	EGHEL5FrneHqEKMTlCs0igth7z76EFqsaQUvMJnbxu55S7q454/JeuB0Hr4Tt0FDzfnD8GZ5uma
	VWufZ/B43tXWeDZmQ5/stI/l0YL8AZYA9rnnZIUkAY8jJteMo7u+zw5q9AgCw/H7r8fTq
X-Gm-Gg: ASbGncse0rPfKbScG1q+MMZYnkABd1XeR20veu/ySt+YxD87KZftc1YlMSsjfPdUrzy
	e+t7Jx6R+FndfciIBFCjuYr4AOsyYPI2XhNpfEv79A3XlTeuzlXGqc+nBA6rOmJHIWYPzvp7TJy
	hZs4W+ECuK1r2nb2LyILCYKVBBE7P5eIcSdj8mTby/gWBk04cX4GFMF8ilWli4wGGc8/4W0nRJG
	Y9UAcobNDYItAEbtnVDXfP0m56TYO/VeKcI3q2UoWKh1gdChYypeecG/1LX7HuxRF71dMyREDny
	055ITv/CDSgrUK9FRO9XmSqenpv8Jn4QYL2YCRUUsb2CqRYtnZ9vnl7ZhhrCeNL9x+VtwWIIP3L
	WIDrjJOiepm8Z7FlfwX7hi2aVd24=
X-Received: by 2002:ac8:58d2:0:b0:4b6:2efe:2f73 with SMTP id d75a77b69052e-4e6eacd5b7cmr24322061cf.1.1759914707427;
        Wed, 08 Oct 2025 02:11:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgmdkC0LE3dHLfUFj4RWEGCX/zas7y0dJ6kj/ES5PA+uvEzb5Ga7Acz9kcOVJYjeSkLcG61w==
X-Received: by 2002:ac8:58d2:0:b0:4b6:2efe:2f73 with SMTP id d75a77b69052e-4e6eacd5b7cmr24321931cf.1.1759914707010;
        Wed, 08 Oct 2025 02:11:47 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6397c9355c3sm7862106a12.0.2025.10.08.02.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 02:11:46 -0700 (PDT)
Message-ID: <8f2e0631-6c59-4298-b36e-060708970ced@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 11:11:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: sm8750: Add PCIe PHY and
 controller node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250826-pakala-v3-0-721627bd5bb0@oss.qualcomm.com>
 <20250826-pakala-v3-2-721627bd5bb0@oss.qualcomm.com>
 <aN22lamy86iesAJj@hu-bjorande-lv.qualcomm.com>
 <4d586f0f-c336-4bf6-81cb-c7c7b07fb3c5@oss.qualcomm.com>
 <73e72e48-bc8e-4f92-b486-43a5f1f4afb0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <73e72e48-bc8e-4f92-b486-43a5f1f4afb0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX8PEfGtMResmB
 TuHaG6nWk4cgUdQFRYL/+BWv0jNqQjZ5xr6y5boC6u8YaH/QtAb56HuTJlmU1eiJ672eEXDSaPX
 PLclwBDdccyRnDiLPqzJA1FZPx5j5PmPsMovN2t4crMU5r1+8QhcCEqazA4Do2oWLJQn4CgS96t
 Pt5TKYnENGcW86ZXo4MUwGJJ8j0m9tyj+0hii08UliaB6vxFqvhquW97IcrnPH+8937IWr/O1Ge
 woPMV/jtTnxM6hLvPKsPLEDJvXrkKJSq97SHQWyICPtfDbcCdX4DhdXivWA+BXUtbewi0XwjCJk
 h/cV7uFrhBDPaM+BwFxdqgXt3N4AwpEP/80Zh5fsbopautzTXJ89F3tbiVbqxzq5E3G9YcR5egl
 IMNhwzyEy3ZRm+Ui7k9JaEEEObJK4Q==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e62ad4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lX_GYFQQ6rhPkfvadcQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: C-ip1JS_Qbr9GOt4qImwTu-cEIbI59eo
X-Proofpoint-ORIG-GUID: C-ip1JS_Qbr9GOt4qImwTu-cEIbI59eo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019

On 10/8/25 10:00 AM, Konrad Dybcio wrote:
> On 10/8/25 6:41 AM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 10/2/2025 5:07 AM, Bjorn Andersson wrote:
>>> On Tue, Aug 26, 2025 at 04:32:54PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Add PCIe controller and PHY nodes which supports data rates of 8GT/s
>>>> and x2 lane.
>>>>
>>>
>>> I tried to boot the upstream kernel (next-20250925 defconfig) on my
>>> Pakala MTP with latest LA1.0 META and unless I disable &pcie0 the device
>>> is crashing during boot as PCIe is being probed.
>>>
>>> Is this a known problem? Is there any workaround/changes in flight that
>>> I'm missing?
>>>
>> Hi Bjorn,
>>
>> we need this fix for the PCIe to work properly. Please try it once.
>> https://lore.kernel.org/all/20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com/
> 
> This surely shouldn't cause/fix any issues, no?

Apparently this is a real fix, because sm8750.dtsi defines the PCIe
PHY under a port node, while the MTP DT assigns perst-gpios to the RC
node, which the legacy binding ("everything under the RC node") parsing
code can't cope with (please mention that in the commit message, Krishna)

And I couldn't come up with a way to describe "either both are required
if any is present under the RC node or none are allowed" in yaml

Konrad

