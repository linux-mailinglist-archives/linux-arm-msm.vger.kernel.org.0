Return-Path: <linux-arm-msm+bounces-78912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C52CC0DFCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55F003A46A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D429D283FF4;
	Mon, 27 Oct 2025 13:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JK7xfJJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5470523D289
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571352; cv=none; b=HlloVH9ZGE83ETX0Sn5uUWf6+r/lSPzpvu2G8YjMZBTn1s6gulPK3sdyTBCwxXSGkrMaOjMUbaf0k3WONBw3yXjmWQnhHzkF++ouysndmLGBJeve7U4Q1UXE0N0ey3JHk6bzN+HoQMSYhluOW19ccGWfQRXMJvSczdtshxocYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571352; c=relaxed/simple;
	bh=FuLPGb9lpc3kIhzrWDfWe9XL+0VkpsfAt3WLq5eKKKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lofNLyItkY/Ebhjq6fX8+K5aTYrwPosvLAEY9mbpZpZRviSAzNTKrmKpUNoU4uyWkHKzGoxq2eWawPQ1CAe7qQsBCB4Q9giFS59gSvECX6Y5ory11z8HFiuBkWjSNHbOFwXULdTdnguwuGSTQdvU/whkpZeCcNdYPIAFCevzxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JK7xfJJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8xNCe1174448
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bOamnVJjm+3duRsX5YWXJXmZ4fYfBcBJKOdsubpmAGE=; b=JK7xfJJmIhsARo/h
	+zlqzqH+epJrohpGrugMsbmErn3Q+xnKQ/nHTu910A8MbmhSSmQ+McAUTWAqO6Jj
	GfS8mnPh2q7hT6nOJnXYNz5he+KkokLYwSylPopuSHr5vnX8Vv3n3vZTzAZ5qWug
	Ln34lsRMWGa6mvC8UgiAovtS0+dCUOjvM/ka5ojng6z81c0MEWn8SM0yporgkY2m
	/GC8E18WGCwh1NoJ+XKnX6xVYsLcpZJlZSyaPM7kXUYfEZGh1pWP86QsYDxKSKfI
	sRUAGGhgDdTs8JL0p9QdLKMpxpiOt6t4j4eSdf/xBP28K6j8gOFr3pquAxSZ5VRg
	p+iJvA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0nnb4rk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:22:30 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-826b30ed087so14119026d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571349; x=1762176149;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bOamnVJjm+3duRsX5YWXJXmZ4fYfBcBJKOdsubpmAGE=;
        b=hHV5vrBfRkQAGiTDSVJ/Nwan72iiCQV96EE7CggWxs44HBlpaTv93H8CJF8lzjqT6R
         g3X5G1Faod3m54YGFLVi5Npyp2Dq2pez57u725jFZyEZDd1jTJi4tfMl6dc1eohjM0N2
         HmFE1CtHorZC6xffP4T6b5skLTSMwqnZX7SfRcAZN8QSJGEpKAZtHxWU7TtzXoztmES4
         twUQpMHmitQgUY0GsRs769lzMtq0ykrQ5AQ72wHenLHvyWIEkK1Mv17Sc/nI5/Bc8OCm
         Efd43sn0Dz8P94lVEfl9YOxGcuQbMPm5ND/bEBO9D9ePqPrXZRzZtgL5E5JZtJ8MTwld
         pHYA==
X-Forwarded-Encrypted: i=1; AJvYcCXetbY6c/aFCgwyTiUHXGx+wylG2fClXKvU9G8PgA4RETXBcLg5x5sH8X7JE/7Q7Te2iZvfWvlWe/Khd59m@vger.kernel.org
X-Gm-Message-State: AOJu0YxmJUckBUu8qmOQc59zBqRqAT63H4KaDCE33VW/xDZ6EAmWDUn5
	ZccDI9ak+zEGIlVic2DceK2r9egDvsjL6LUd2xl4xkXC5W5+5ALgGnXG5yT4iViTnSgJbqUYOvf
	sYo6K+SzuvgZVCDtAcItg/WCBJ7A24ijZ5+lmnM7uJcY3M+nC+XnazpmtLZetAU4L2OKw
X-Gm-Gg: ASbGnctkEVat09uX2x+IcGQ+0I6NGhI315OQTU5bevgh9gVekQ9hEY1dWljlBmedHnK
	zjtjLJ96HYZ+xtmoFlcTL1EkhwKL8B0It72qvu8p1tF2K7Tx3jsE8ksI1K8AQEBFl9SVprk4hBC
	XIPk+HbMAnEEVpSHwn7zM1b06PzfYorlzgOSlcoOS9fByt4y/F4omVooVNmEP4pBNPrKCpEIG01
	qEp+hRPuLYyK9Ii54uTEuiFzD2lew7nnL0FFByLviWOtDzmSNa5NpbRWUBoGkOq2fG7Aqg8vjs8
	l+7/lyfgWTY1st5e2bD2/J69Yo2lr1Xv2BT+4vIiFSyPTejKSsYJbhp/KakJ0sndaNmYctJJFbn
	SjgNkLYG9dtJSamSWmYuKZT3VylqKyUxN5D7JeyLeh9syRMfmMIfJffxn
X-Received: by 2002:ad4:5de6:0:b0:87c:19b6:398e with SMTP id 6a1803df08f44-87de70b4724mr204621266d6.2.1761571349358;
        Mon, 27 Oct 2025 06:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERE9vYsDZcoNA0WsLgwk+/4zZa5M1BCBMWIBkdBse7SWtg/6ZU8mEslR7ufn5BKT+zPKuiFA==
X-Received: by 2002:ad4:5de6:0:b0:87c:19b6:398e with SMTP id 6a1803df08f44-87de70b4724mr204620706d6.2.1761571348570;
        Mon, 27 Oct 2025 06:22:28 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6c129sm6430632a12.3.2025.10.27.06.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 06:22:28 -0700 (PDT)
Message-ID: <b16872b5-e497-484d-bba5-7c4ec590cfc2@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 14:22:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Add PCIe support for Kaanapali
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
 <o4o6tthwz4vz5uqqjv5c4cld6qhhrfa7xzotjd3qyz7gpoab5s@ki4nwe6us4zc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <o4o6tthwz4vz5uqqjv5c4cld6qhhrfa7xzotjd3qyz7gpoab5s@ki4nwe6us4zc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cpF2G3jTKiabFKeirfKP5ZVgRsXEd7hp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfX5bbACGP9e1Wd
 GJZ238paCFsduoSiwJB5BK7ZMvqpDhVmvuUHEsc5lzZS2F9GGvUUAiJ8pHKOQjuK7Y98xzW+nCP
 KlpxDY5vYyMgclyH3r3NjHMMVnSnX3LQvAapaoa8UBNi2URJ0WjV8e8QBV0iokAWQBC76cpR+bU
 ah+Aexaktj6GB3ip73cmJgY6pFD2ntyfzSDAjnjIqC2VVg1XopBSTvODFbXGc2e2D+MrKLO5XVF
 MGadplghoQrEWCVORvLTE9Y/4OBo+G7uBq100Y4tWMcU1wlaF9FVvw7jMsaGKBc9vHpcAJNnDrJ
 wfsvA42NC+ShOADRaBaHOdRTadCKDYzvMPIhrjL1p79y4YWHoRRkKriw6OGgUf7zW9cKOlkcp6j
 FQEpPY3KAXcsDx3s2jJ7lCXaI235kQ==
X-Authority-Analysis: v=2.4 cv=AJoZt3K7 c=1 sm=1 tr=0 ts=68ff7216 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ceeQHXABJUnddBcZNCUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: cpF2G3jTKiabFKeirfKP5ZVgRsXEd7hp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270125

On 10/27/25 2:21 PM, Manivannan Sadhasivam wrote:
> On Wed, Oct 15, 2025 at 03:27:30AM -0700, Qiang Yu wrote:
>> Describe PCIe controller and PHY. Also add required system resources like
>> regulators, clocks, interrupts and registers configuration for PCIe.
>>
>> Changes in v2:
>> - Rewrite commit msg for PATCH[3/6]
>> - Keep keep pcs-pcie reigster definitions sorted.
>> - Add Reviewed-by tag.
>> - Keep qmp_pcie_of_match_table sorted.
>> - Link to v1: https://lore.kernel.org/all/20250924-knp-pcie-v1-0-5fb59e398b83@oss.qualcomm.com/
>>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> ---
>> Qiang Yu (6):
>>       dt-bindings: PCI: qcom,pcie-sm8550: Add Kaanapali compatible
>>       dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Kaanapali compatible
>>       phy: qcom-qmp: qserdes-txrx: Add complete QMP PCIe PHY v8 register offsets
>>       phy: qcom-qmp: pcs-pcie: Add v8 register offsets
>>       phy: qcom-qmp: qserdes-com: Add some more v8 register offsets
>>       phy: qcom: qmp-pcie: add QMP PCIe PHY tables for Kaanapali
> 
> So this platform doesn't support nocsr PHY reset?

There's a reset, but the UEFI doesn't program the sequences on mobile..

I raised that point internally, maybe next gen > 
> - Mani
> 

