Return-Path: <linux-arm-msm+bounces-21305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6641B8D64E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96D301C2411D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 14:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C8256448;
	Fri, 31 May 2024 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nJN1++Xq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB79770EA;
	Fri, 31 May 2024 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717167140; cv=none; b=WTiozne9sb1hvG0nHOm3apJ6Ulqden/r9wTpzwYyakrEviZuAieqIYDRY9zmPXS96Q70Gw+nBchtBXvTrQdQHTNBxF0iKHFu0h5z1JV5PlrC4j87Wzt0uPVF6EmzwlEDuJ4MXqCRvl0RIm4NIZ+ednTxNhmcF0TYQvHFHmh0hrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717167140; c=relaxed/simple;
	bh=ZFiZrue0HN69gCDWqYdx8oP2j7lujcCjKuWNJDuzz/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tNEvB0VP2Jqy26BVAMSaKsRNACjUDvh+SGOySVje1cHumx/nhDyaT0aaIrUmtSAMrjXutgSbOQZD29ZY+2HiCuCxLJDd7ouTHz/L40CgiGweq+7vh2WszDVI3rVZmm0qSPJuFIKCRxCU5fFiWJQAIaxEca+LMHuam95PIooLAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nJN1++Xq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VA1HDx015725;
	Fri, 31 May 2024 14:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKoGiFE8U0Hz4us4ZPo+aD6AjWEeN1VhK7zaTrNaG20=; b=nJN1++XqrFI+Cgfy
	CJFgZlhGHABmA2O+la9RaEu4drjNcFxT3+BFzZ7ufltNMxWniuCHkUJqREtInLcT
	newhkSlCGEYL7KPCX2948f9bpwg0Do/dn/PpBDlFPAqFd9Z/6qEJnP4TV2QHwuVM
	scfn5MreAtraXhI3rmww5S6jiHPBrh4SxUfWgZZGy9wA9xmI1cMZaOIiNxxXJV1G
	3jzlFHtrOf0Urmi8NAhfdukBSmBuIvzuKU2jh0pPSYSOY5o1nmAwWqBejtFxhzNR
	1AH/ft/8UcTxtC6B61EppYjgD5f8UyfuUTGrDpbOZqmFOisXgDdfW2TIVqWes0c7
	tpsL0g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qq6rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 14:52:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VEqC1q017847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 14:52:12 GMT
Received: from [10.216.8.21] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 07:52:06 -0700
Message-ID: <68621b7a-0079-49ad-adf0-71d1fe24bcf0@quicinc.com>
Date: Fri, 31 May 2024 20:22:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Disable SS instances in park mode for SC7180/ SC7280
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Doug Anderson
	<dianders@chromium.org>
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
 <d61ede0b-f689-46af-9bc8-e715784b86c0@quicinc.com>
 <CAD=FV=Xwf4eW+zwPecDg5855nVEY2NQMqpvHu59_e2xma6=wxQ@mail.gmail.com>
 <33db558f-2863-4246-a06a-d94ae2efc0a1@linaro.org>
Content-Language: en-US
From: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
In-Reply-To: <33db558f-2863-4246-a06a-d94ae2efc0a1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1kEPteRDxgoOvPuEcZz1qwzckogaa9tO
X-Proofpoint-ORIG-GUID: 1kEPteRDxgoOvPuEcZz1qwzckogaa9tO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_10,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=874 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310110



On 5/31/2024 8:11 PM, Konrad Dybcio wrote:
> On 31.05.2024 4:31 PM, Doug Anderson wrote:
>> Hi,
>>
>> On Fri, May 31, 2024 at 7:27 AM Krishna Kurapati PSSNV
>> <quic_kriskura@quicinc.com> wrote:
>>>
>>>> My only guess is that somehow SC8280XP is faster and that changes the
>>>> timing of how it handles interrupts. I guess you could try capping
>>>> your cpufreq in sysfs and see if that makes a difference in
>>>> reproducing. ;-) ...or maybe somehow SC8280XP has a newer version of
>>>> the IP where they've fixed this?
>>>>
>>>> It would be interesting if someone with a SDM845 dragonboard could try
>>>> replicating since that seems highly likely to reproduce, at least.
>>>>
>>>
>>> Hi Konrad, Doug,
>>>
>>>    Usually on downstream we set this quirk only for all Gen-1 targets
>>> (not particularly for this testcase) but to avoid these kind of
>>> controller going dead issues. I can filter out the gen-1 targets (other
>>> than sc7280/sc7180) and send a separate series to add this quirk in all
>>> of them.
>>
>> Sounds like a plan to me!
> 
> Yep!
> 
> In case there are more gen1 platforms than what we have upstream, it would
> be of great utility if you could list them all, so that we can have a reference
> for future additions, Krishna.
> 

I am not sure if I can give out info on targets that are not on 
upstream. I will check internally if I can do that. Else we can just 
ensure that from now on whenever a Gen-1 target is getting upstreamed, 
this quirk is set.

Regards,
Krishna,

