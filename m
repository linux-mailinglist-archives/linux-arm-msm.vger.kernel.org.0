Return-Path: <linux-arm-msm+bounces-56203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89145AA4431
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 09:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF6CC4C5C15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 07:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB76A204F9C;
	Wed, 30 Apr 2025 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwhuTM0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1FD1E104E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745998970; cv=none; b=UuShtR55JNfvyGmPLL7jMaKG8ckYKnb7vzO+VwukOanyaE5mexJIvoenk3iiAiK54npXbHO0WinR5O0r1oAafIQSlAYAOmhsCQ0GltJOKybQb09e/zO00yaIJ8NwfWpXXacBuBFKLkeCqGFdEpu5SFfLfSAtN9jwlYvNOYoMtNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745998970; c=relaxed/simple;
	bh=kBCa1T5PcSrLrAN7dxbaZ2FQY6mQg/7bIWGUREStzeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulZG8EuJA4b3kQwh3X5mNu9b2dlfyxu+Kkqlyo0V/D9OcaxdZT89W9KQLaJxkI+75B/imeQYTh2e74OeZUovcOstl3eN6qD26aTEmnQGF3mTgKwdOhrz5d6gnRTAzxC5CAT+eVVh+w0TN5VV0XZgUkahsji0vlygPgSdrHu1Hl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwhuTM0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLamUh013698
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=; b=KwhuTM0g5TRdRuxp
	p1yF6augN97oLuwZxtZH2sKDfY7ZtdFM693woo4X7Yv4loY3aePEnAlr33y58sUK
	Vo9SxrAATy7sSqqKWHu4n+2qNIi8wfa27i911CZJf51wYs+QRdhjkipbiXSHUPU1
	yhZTLXodLC/XzKZPQIVETYljejBUArTrAlEaXOP0bsq9Q743PohUecKop0d3Bkyy
	J4cfDTNRsSh5Kq0kWhveAIGuBYyVAnEcMD+XRb+i2kiqgDNyh6VGwgO5vN6d1np7
	JFjwCIj7trqGR/baTEZlk44GH9CZzvqnInmtCUrpH3BKCXhHaj7aFLYUg9PrODnD
	i2hfzA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubh7wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 07:42:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476786e50d9so15111421cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 00:42:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998967; x=1746603767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUaVf9VHjTFcpUGhpbhMQ3Ge/NGsAqULXFPt+N3iG1g=;
        b=MKLDGT/jpwn6MUHLTiv4LnAc1nmEm7am3UxsAZiiSk+5RYld28vhHultKkr5AfrdVI
         WexnD/lgpW6LS+wvmtUZKdA8RqANXnSG4+4VFz9P9+uAb1b6xTA5ZCUh37FiP/cxvbwc
         +zvu8WqqneFpv5RanJ0Jy29vhzWdwTvJAlSC/KWc8ybzuT+fVQVS6Ol75JxEtQct5CPY
         AxdPoe03oy6PyWaSrO9xu314LwZAiIUyoELFI2vL04JT48Xsqwf5wThvJbuGp65GYN7F
         aQn4dyTiqNXv+R7QW5xnMeNYj/nmt1YBCX5qk2uTNMFdOnDIlbkW1HRgzcJ+eT+JHldb
         C+6g==
X-Forwarded-Encrypted: i=1; AJvYcCUA2whaDHq+p9Q3nVFfaKIAl0R96qbGd0E7Uo+PHuzd1k1dni6WgNFisFas8jX9A04lZuUm8ZYW7NisOou1@vger.kernel.org
X-Gm-Message-State: AOJu0YwDo6tCwOevkCWdNNYWJNNh6cOXnCJeVpCRrU9YWeHsr2hBFagj
	ruPr+cGIiuHwIIeGC2FwAvHSccGcaa44T84uWj0Mc3Oi0UPvwSLyC2sYCe+enNYLc0bSZznSj0P
	LZvoUwCyVYCieu64T2+QtMR1kLVVyn20fzhX1ceXZxrNKbxTM9EgR4z0YlBrn98w9
X-Gm-Gg: ASbGnctaMSjH6aPN5sTZag/kkB18hOU4l/Tu7qoJzPfZfPUjFPdbgcgvNv0Q9N/AUer
	QIsIfO4hxmIqBq/41YSWNpxgMf3M3orq+iY6rQoL4tvNkA0hALXts8zZ0CNRIbebdb7KTl1tOG+
	88JLN22ldlPccK+0sSO4+S+jqOqWw8klcTsNoUNXO1PCbOyAuUrxj1+M92Xvxz5knZ16baGtBEe
	q1k/U8F8DfENm0kVBSV8adyZx/gV8k6PRhVvqNxQg4MC9Y42DK3BEzZ1qi+aRwUKWujbfRdSeyr
	NZgas0mQHKWoYbIIkVaXlmFSWZCmJJyjPgGcGDe/RJc29op1mc2kzhOT6y7d/HWBab8=
X-Received: by 2002:a05:620a:198f:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cac857731emr77705985a.3.1745998967034;
        Wed, 30 Apr 2025 00:42:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFIi0dncAmVoeKyLj4QkQJlHUjRZmoK4qLIjwW+UX7y0o88dA8BCn6koU1U4nahlVTE6QMg==
X-Received: by 2002:a05:620a:198f:b0:7c5:ba85:357e with SMTP id af79cd13be357-7cac857731emr77704285a.3.1745998966696;
        Wed, 30 Apr 2025 00:42:46 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec28db2fcsm278111366b.17.2025.04.30.00.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 00:42:46 -0700 (PDT)
Message-ID: <8d18adf7-c1a6-410e-b3a5-496288825afd@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 09:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Qiang Yu <quic_qianyu@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
 <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
 <aAt54vikoREWZyGY@hovoldconsulting.com>
 <17a1a4d9-fdc5-477a-bf4e-91cae5a62479@oss.qualcomm.com>
 <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4115bbc-e120-4a20-b6ad-a0d5266319d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bjS7J4-NwJEeBVTqVAUqO0j3DtspBgit
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6811d477 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=U8xqaHzKl31ljCD5roAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA1MyBTYWx0ZWRfX8jlRAQagYqgL eeTPVZJWCOKzX+WSdaLuqLUccjAxP0UVY4QXjCpX3kSchTysaVMawA6+/A/S0WpLNW4gSY4VpN1 /KmG3KqyRQFgo37ftha+jtmsO+d77TINVDUmrNzlqeffUt92fCaypwIQui+ZSzp0T0+Jqjf3StO
 SnTvUjo+f7XUyG6dfr21K22iRNonIm9SWjSBs9eMlN4XHoGBXTDU7xYfUrzZOVw0l+fQDrs+460 sW8jNe+NW0x3OxSLutwPAHdyBkgvZ+xboo7p56LrPcfyvbeTN8o0brvMLqx4u9DeDtmApaVWeI8 yd1D8fiqMldMZ1/MTPzKvESoAf/wo9HIN/VwWO+DC1/7Ks1o+m+pZ9kfK9yFuBgitkdHlwh4cRw
 zlqq5FaVwpnm51WtrwMFxCjaIyG1f2ytvaKQCZzr9u0qtsVdYBmbBIa5X9Tje0g8uhTr0rRE
X-Proofpoint-ORIG-GUID: bjS7J4-NwJEeBVTqVAUqO0j3DtspBgit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300053

On 4/30/25 6:15 AM, Qiang Yu wrote:
> 
> On 4/26/2025 6:48 PM, Konrad Dybcio wrote:
>> On 4/25/25 2:02 PM, Johan Hovold wrote:
>>> On Fri, Apr 25, 2025 at 12:03:06PM +0200, Konrad Dybcio wrote:
>>>> On 4/25/25 11:51 AM, Johan Hovold wrote:
>>>>> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>>>>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>>>>
>>>>>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>>>>>> missing in the current PHY device tree node. The PCIe port can still
>>>>>> function because the regulator L3J, which vdda-qref consumes, is voted by
>>>>>> other components.
>>>>>>
>>>>>> Since the device tree should accurately describe the hardware, add the
>>>>>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
>>>>> AFAIU the PHYs do not use this qref supply directly so it does not
>>>>> belong in the PHY node (but possibly in the tcsr node that provides the
>>>>> refclk).
>>>>>
>>>>> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
>>>>> qref supplies") it also won't have any effect for pcie4 and pcie6.
>>>> QREF is a separate hw block distributing the reference clocks across
>>>> certain on-SoC peripherals
>>>>
>>>> If its power goes out, I don't think much of the platform would be
>>>> functional anyway, so it's redundant here..
>>>>
>>>> It doesn't have its own single register region and it's frankly
>>>> one-shot-configured way before Linux starts up, so there should be
>>>> no need of describing it at all.
>>> Then it sounds like the qref supplies should be marked as always-on. Can
>>> they be disabled at all?
>> The best answer I can say is "maybe". I would (without knowing any better)
>> assume RPMh wouldn't let you turn them off. QREF predictably takes VDD_CX/MX
>> and some additional lines
>>
>> Konrad
> The vdda-qref power supply feeds the QREF clocks, which are consumed by PCIe, UFS, USB and display on X1e80100.
> For PCIe, QREF clks are provided by the TCSR device with the following bindings on X1E80100:
> #define TCSR_PCIE_2L_4_CLKREF_EN
> #define TCSR_PCIE_2L_5_CLKREF_EN
> #define TCSR_PCIE_8L_CLKREF_EN
> #define TCSR_PCIE_4L_CLKREF_EN
> 
> These QREF clocks are not enabled all the time and are disabled during PHY deinit. Hence, vdda-qref should not be an always-on power supply. It should be turned off when the QREF clocks are disabled.
> 
> Describing vdda-qref in the PHY device tree node is reasonable, as it allows the vdda-qref power supply to be enabled or disabled along with the QREF clocks during PHY init/deinit.

We were advised to repeat this for all QREF consumers as what I said
before may not hold true for all platforms and nobody's gonna play
whack-a-mole with this

Konrad

