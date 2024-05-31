Return-Path: <linux-arm-msm+bounces-21301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 229498D6480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC784286C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7E51C6B4;
	Fri, 31 May 2024 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YJ9dtygA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE14D1B812;
	Fri, 31 May 2024 14:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165645; cv=none; b=ba0PclPEU4fBjSWrmoRVkO+5w7ybbCdh1inLcw796EJM9yN9qsqr8LZA4uNtdTYcT0lmY+EY4KRQIJHhPvIXWpqoCN1nB5wYgzvvTAPVwqa9afWk5eNlAqOdmLthUrPeP1uxhr7ZvofA1D+TtaWBpDWKDSVMx/CAHCQAlFfWJjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165645; c=relaxed/simple;
	bh=n7YEdd11QRP/OOwY4XoPE4WkASBPeP/8wqIEQykbh5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=urMrZ5lx9yG2l8czVpQmEvC/v14/x0Fy6EOQrT/l7+LPe/dXcWrWKsXtaCxbCeG8QYGWoQhrFoQK959MYTonPcloTmrL3IJBHiRC54AP/YahDc7LhdQ/Zi8occyOsZSOcOLRCgmaFjUpOrYX+3QIBTZ+wJQvXr0fFyiF5F6089g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YJ9dtygA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V4lbgJ015681;
	Fri, 31 May 2024 14:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4Mj8x/aCM3XhdQ9xf9ggG0TXxFkcWcMDxerZnHJ5eU=; b=YJ9dtygAMca15Jfs
	No+ccb4/s5xhijZxvt6/W/M1wRskJy8P9aD50hgOwV86cShzsqwVdrVIcJAwbxlJ
	xL3/BcXB3DRBse2dniIqkQ8E5N2qYbb4YE+1nA7WjF+v6h6UY5HRFmzt5VARYH16
	HX0EBTNP1TVhICzIi33TIy35QD3gRMYb7a9riVaL/SLfnJwiK6a1jWy7S7ZqVQPB
	Cl0ECXe+YLWzt7qV3H5a+jbbQznUoedKkMX5FsxozqoffJpJBsM2+RKc55gJt58n
	Lz4odvaR/wiChsIJ9sEYRp92VRhmatxjJI+4/eamJKW1n2WXg2cVTimSaNUAPLO1
	WS+hmw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws6rwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 14:27:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VERAPj002260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 14:27:10 GMT
Received: from [10.216.8.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 07:27:05 -0700
Message-ID: <d61ede0b-f689-46af-9bc8-e715784b86c0@quicinc.com>
Date: Fri, 31 May 2024 19:57:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Doug Anderson <dianders@chromium.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <cros-qcom-dts-watchers@chromium.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Boyd
	<swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Kaehlcke <mka@chromium.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <CAD=FV=UhrCKCv5R-LAAugrLXFp=cDcj2=Pp9-N3qk5pk2=sGEg@mail.gmail.com>
 <e732257d-cd16-4e81-9a20-af481184ce0e@linaro.org>
 <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <CAD=FV=XO_8SwDLJfoNwwCKEO6CZyMRMY_BdsWMLPBkpczErppA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VvL8KsKv2ymPW9_VKpspcZA-EDrhIw6_
X-Proofpoint-GUID: VvL8KsKv2ymPW9_VKpspcZA-EDrhIw6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_10,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=712
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310107



On 5/31/2024 7:47 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 31, 2024 at 5:33 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 30.05.2024 3:34 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Thu, May 30, 2024 at 1:26 AM Krishna Kurapati
>>> <quic_kriskura@quicinc.com> wrote:
>>>>
>>>> When working in host mode, in certain conditions, when the USB
>>>> host controller is stressed, there is a HC died warning that comes up.
>>>> Fix this up by disabling SS instances in park mode for SC7280 and SC7180.
>>>>
>>>> Krishna Kurapati (2):
>>>>    arm64: dts: qcom: sc7180: Disable SS instances in park mode
>>>>    arm64: dts: qcom: sc7280: Disable SS instances in park mode
>>>>
>>>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>>>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
>>>>   2 files changed, 2 insertions(+)
>>>
>>> FWIW, the test case I used to reproduce this:
>>>
>>> 1. Plug in a USB dock w/ Ethernet
>>> 2. Plug a USB 3 SD card reader into the dock.
>>> 3. Use lsusb -t to confirm both Ethernet and card reader are on USB3.
>>> 4. From a shell, run for i in $(seq 5); do dd if=/dev/sdb of=/dev/null
>>> bs=4M; done to read from the card reader.
>>> 5. At the same time, stress the Internet. If you've got a very fast
>>> Internet connection then running Google's "Internet speed test" did
>>> it, but I could also reproduce by just running this from a PC
>>> connected to the same network as my DUT: ssh ${DUT} "dd of=/dev/null"
>>> < /dev/zero
>>>
>>> I would also note that, though I personally reproduced this on sc7180
>>> and sc7280 boards and thus Krishna posted the patch for those boards,
>>> there's no reason to believe that this problem doesn't affect all of
>>> Qualcomm's SoCs. It would be nice if someone at Qualcomm could post a
>>> followup patch fixing this everywhere.
>>
>> Right, this sounds like a more widespread issue
>>
>> That said, I couldn't reproduce it on SC8280XP / X13s (which does NOT mean
>> 8280 isn't affected). My setup was:
>>
>> - USB3 5GB/s hub plugged into one of the side USBs
>>    - on-hub 1 Gb /s network hub connected straight to my router with a
>>      600 / 60 Mbps link, spamming speedtest-cli and dd-over-ssh
>>    - M.2 SSD connected over a USB adapter, nearing 280 MB/s speeds (the
>>      adapter isn't particularly speedy)
>>
>> So it stands to reason that it might not have been enough to trigger it.
> 
> In my case I wasn't using anything nearly as fast as a M.2 SSD. I was
> just using a normal USB3 SD card reader. That being said, multiple
> people at Qualcomm were able to replicate the issue without lots of
> back and forth, so I'd guess that the problem isn't that sensitive to
> the exact storage device. I will also note that it's not sensitive to
> the exact network device as I replicated it with two Ethernet adapters
> with very different chipsets.
> 
> My only guess is that somehow SC8280XP is faster and that changes the
> timing of how it handles interrupts. I guess you could try capping
> your cpufreq in sysfs and see if that makes a difference in
> reproducing. ;-) ...or maybe somehow SC8280XP has a newer version of
> the IP where they've fixed this?
> 
> It would be interesting if someone with a SDM845 dragonboard could try
> replicating since that seems highly likely to reproduce, at least.
> 

Hi Konrad, Doug,

  Usually on downstream we set this quirk only for all Gen-1 targets 
(not particularly for this testcase) but to avoid these kind of 
controller going dead issues. I can filter out the gen-1 targets (other 
than sc7280/sc7180) and send a separate series to add this quirk in all 
of them.

Regards,
Krishna,

