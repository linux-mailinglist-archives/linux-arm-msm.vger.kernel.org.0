Return-Path: <linux-arm-msm+bounces-76317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A12BC3BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27919352140
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD96F2F28E0;
	Wed,  8 Oct 2025 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RccIbxiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E0321A458
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759910433; cv=none; b=o97/UhqX6MSpmssImRabi8m7ntSauwrcIe0ycQeij05v8XflLMcGi1cEXtA5eGVLeusAbW+FcQUEaGoc1seB6q8qNWN47dJDAg9SNHPNBpH1XlbTSwE+DO7hO4w8ZfaIzNi9/4P6ybKq2C8nfouMUgZZLT+hj17mxi/gya35Y5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759910433; c=relaxed/simple;
	bh=/5xitTXiQ5eDNNCs1sAfErPkBv/6ZwwQcRGoSXhHsn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TQvmciZxpASbDIQ+mO5J2Xbl7p2cu6DN6mz5qdPi5CNL2lTdm9vqZiqZTcvIARzssbNL//ns5yt7LZskQODhW20ptmHAxCTTcSgfGopVNuJP8bo9zUBfg+5I/2ZahToIliASWGFIfWRSCt9mZ2KGi/ftJzTL2VAtsO/mCttSmLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RccIbxiO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aWpZ013795
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 08:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OFBsMtCW5P8eEthAK5JuEKPN/rQgShEl32y8lMaMUYM=; b=RccIbxiO+wSUrXG7
	riqHQZmZIfzrflvAq8w10eOLfSbRctyQIO8oJIp77PiBK7lL5oh9R58DALB7pqPB
	L4TeCUX42QRRomR5XzSxnjtrIAiPpN7u6cQ07cftrynrZMR6olXl3BTPW4DYR+Ho
	4L5E5vY8rcnz4+vNi//Q88dh/lKKovR0AEHa2o2ftO0CoR7hlLSM4sqoKi81uA4/
	nhktj/GYKZcw/AuwfOoJIb0gRrUjTMQqKDmMpL7v0RHopgPx3MGWnpFdsMLV1Yi/
	mFz4Zh1qEg3OUJu96jaZgEK9emn0uok6n9Mu53c09fMBl/J1M37sAQAB0DadNPwC
	taV/zA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpvjk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 08:00:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7abea94d621so17135006d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:00:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759910430; x=1760515230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFBsMtCW5P8eEthAK5JuEKPN/rQgShEl32y8lMaMUYM=;
        b=hu1g0NARQ10uv6bLhsHBSKsAt3djA0tTjR+t/8ChW1ABkF5eMKInrxIwmostDl2cK6
         axLQvKgKu9W5KbsPgkL9o95y94RfxtEnipdLxD/B5B1EfUQgBuUFLGV/iglsomblIBTG
         YTOtplpA16s/YG75uJdbzf0OZUZ41ED42uAxQE3lMpYZKLyOhwn0tRrWJoouwzZwphYj
         lOi/28r48qHa7ZwRwgW8Vg+yrpvb5FpjLS+jEt0rx8DA3L/4LUbz5SPcLc84t+F+JAz5
         IV+A+YJuESzTv8ovXHf223hsP+snxXUKVvAbvRcjDAASgGhIIQE5rsJSPGiy+3WC/sB7
         N6iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXRHIb/J4oAATVOh8DDYv2YhGJycG+r8UkYKfCh7RCVzu6klO3iitAMdCjILb3lqIjjjug8yqPNAhmvYaK@vger.kernel.org
X-Gm-Message-State: AOJu0YzwIp08l4JpbNyBWmAx1cS6VUA92sDhBT4GoZSwhutqPQaTyHBy
	y7bDUcDlWS0bKH9pczzoHwcGKNiMEER/515xPbtwZSGpkJJ/VJh5QGMVx8R1QU8AeknFkF40Xf/
	U92Ib1YEwJJ4pS3XgnzPfQrUmIdJeIKeRPQcGXre9gq9RTMJlL8gptnEOhhD5IciipbPI
X-Gm-Gg: ASbGncui9eEt2x3Q4EUwj9jvpUCFeeAbeHCvsg87XYgIUNmsu3LYdGKpNUM5+CM9Nh/
	HCTZl8taSB3PkqWTyQLiAmdyDMQgxh3ejr3Cj4vuFpQX+MgqGaMk5GYzWkmagkYOvfCD67iQonH
	Q+8/fHYWiQQViUcvssWW6PwxSUQuHIFKHY8+m0V4qmkNDcZvzozfJumcezak5JDBEKixPdPxovG
	XAurEVGw/mV7TyK/cSlRZ28y2n/m+sv3ZWR0vK33WNwk/R8nNnDwmR1toOPFo/4CDJlbZdHsouf
	Sme3urr7O6PUhnYPvU+nBgtecnA//dgPgmGN5n5vAvWUbyQbp8Gqtw/E9H+b78UKqCDjElrOxRM
	LE4ytAW75XNijIoaN4rT5UbTLRow=
X-Received: by 2002:a05:6214:240c:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87b2ef94b05mr19467906d6.8.1759910430063;
        Wed, 08 Oct 2025 01:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI7CFIzMjiswdfQ2gg99EIIpUQZ3va0hQlGmy6utcIOqmtXbh7OWljL6IiZ8lPAjtXu1zVkQ==
X-Received: by 2002:a05:6214:240c:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-87b2ef94b05mr19467286d6.8.1759910429070;
        Wed, 08 Oct 2025 01:00:29 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788112bbdsm14092770a12.41.2025.10.08.01.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:00:28 -0700 (PDT)
Message-ID: <73e72e48-bc8e-4f92-b486-43a5f1f4afb0@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 10:00:25 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d586f0f-c336-4bf6-81cb-c7c7b07fb3c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CrRVGn0NOu_TRzOiE2R0g14uI-HSqI9y
X-Proofpoint-ORIG-GUID: CrRVGn0NOu_TRzOiE2R0g14uI-HSqI9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXxfY8Sa92jXl+
 kwm2ScZGwKkD24ag/hwpfPeE2vpMoNaWeftbNaaZHwMvs6wmtC5nHMSK4Z+HeVOT0pTuhF1zK4G
 /AwEfpmA8bfK/QRDP6heYdRGx8pl0dX5TjljojFGOHVeR8kQLE/iyFwR6pbT/4N5ScCHJTD/fWX
 D6xJneLcmkVUU/9v716x3FAxtJhrTuLdpElOtaoYZ0mk2SBwhEAFE81/aPUQHQAs66vXuG5MuIa
 3i+Wk03MCCoDtCcmx+XZ0nmw2KAmD4BsdmRugCk7i/ITNUZw/LKUmeO14hZPkDDWqNB0sQspKGO
 5jLpLZ+EqCVIBQcqFuypsqz0wFZfBU3KIqDlO8Vv/jpZVkIpJx8Ijany6Z9wdUhpMX0LuWvyMJO
 ZuP1Vn37+HfeliXmkkcU1F5ttFimVw==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e61a1f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=w91pQayDMOQRg3Yv5IMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 10/8/25 6:41 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/2/2025 5:07 AM, Bjorn Andersson wrote:
>> On Tue, Aug 26, 2025 at 04:32:54PM +0530, Krishna Chaitanya Chundru wrote:
>>> Add PCIe controller and PHY nodes which supports data rates of 8GT/s
>>> and x2 lane.
>>>
>>
>> I tried to boot the upstream kernel (next-20250925 defconfig) on my
>> Pakala MTP with latest LA1.0 META and unless I disable &pcie0 the device
>> is crashing during boot as PCIe is being probed.
>>
>> Is this a known problem? Is there any workaround/changes in flight that
>> I'm missing?
>>
> Hi Bjorn,
> 
> we need this fix for the PCIe to work properly. Please try it once.
> https://lore.kernel.org/all/20251008-sm8750-v1-1-daeadfcae980@oss.qualcomm.com/

This surely shouldn't cause/fix any issues, no?

Konrad

