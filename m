Return-Path: <linux-arm-msm+bounces-54969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799FA97333
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 18:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7480E1B60B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 16:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F43F296166;
	Tue, 22 Apr 2025 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="osaZni8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CE84A35;
	Tue, 22 Apr 2025 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745341177; cv=none; b=r0FRoKWT76t/xsBxs/aNZszQd9ciPibskz4My/lmiCavTi08iCiTc1JRB9oA/bqO+IP60Wga0khz6jRtf+LQat8zARyUD0gmnD7UOzS1TSZwS9UCTQjPPxazs6IsRDBJ6EIwpSRCtriNDob2pKWmS4YddRYsEDvA1j/w+Bkqdx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745341177; c=relaxed/simple;
	bh=HPm7ebMS1pT5xFP2rNYsmOVPV0KcSwCCVw0mVMUXIY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qi+vnnmCyIPZTL3rtLvZugeA6XICmSYGMIvdtYL8NlyRZ6Cjub/GiaMJp2NSnDNhBe2jCOs+vJtR4vDVG1AzyyC+HjYAjD2EhvFEc1iPryajgDRIcIzICntHwt2Fs3y64kc7Jnlmru5/EIM7dugfFvu9PfdLJt0njTL9OEb3XYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=osaZni8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MD0E6g018249;
	Tue, 22 Apr 2025 16:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6B5gQZViqAt6vdbEtYYBmsgMhaXVPhTXCt1gQpeDBTE=; b=osaZni8uucwFz7nw
	fULqIphI2LPOI25x1tGjzs8BbyOzkkTbrhqJLZv7ZPS0VUVs3idJQ/648+EMM/Wb
	8jJPqEmoLhviScPt047VG46/Coi6LJl4ji8U9JS1oAs5uNKA6jvHu6j6DYKiUmN+
	69NVXx+ozp8mMpJphH+aMFvkhfJM2jFKJaKVoirwaZE4mtBQ6AkTyaz5dOIvw431
	JPct0j1bz73hb/g1t45VuLTKKAKpWZT41FrSHXptEhhx6SCkYBA6w9xjdai0BEsK
	6VW4F5r7NaTVJbU7/iTCnaazw30GAFgHvps5o5KgLOzrFwpwTVo/G58dxf3YCT14
	rhAuvg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416r0q2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:59:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53MGxSKv028867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 16:59:28 GMT
Received: from [10.216.4.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Apr
 2025 09:59:23 -0700
Message-ID: <04b7212c-d048-46d2-b5d4-e929cfc17f63@quicinc.com>
Date: Tue, 22 Apr 2025 22:29:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: qcs6490-rb3gen2: Modify WSA and
 VA macro clock nodes for audioreach solution
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
 <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>
 <D8XO1JU37NEV.YN595H7NEOU7@fairphone.com>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <D8XO1JU37NEV.YN595H7NEOU7@fairphone.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6807caf1 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=iUpcbqiyXAxGOh159EUA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fTE02pQjfL6OqxssP8D5mT1R94alvSCy
X-Proofpoint-ORIG-GUID: fTE02pQjfL6OqxssP8D5mT1R94alvSCy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_08,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220127



On 4/4/2025 12:42 PM, Luca Weiss wrote:
> Hi Konrad,
> 
> On Tue Apr 1, 2025 at 6:05 PM CEST, Konrad Dybcio wrote:
>> On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
>>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>>
>>> Modify and enable WSA, VA and lpass_tlmm clock properties.
>>> For audioreach solution mclk, npl and fsgen clocks
>>> are enabled through the q6prm clock driver.
>>>
>>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>>> ---
>>
>> Instead, put the inverse changes in sc7280-chrome-common.dtsi please
> 
> How are we going to handle other sc7280-based platforms, such as my
> QCM6490 Fairphone 5 needing to use q6afecc instead of q6prmcc which gets
> used in this patchset?
> 
> One solution might be to put q6afecc into the base sc7280.dtsi file,
> then we have a sc7280-audioreach.dtsi which overwrites q6afecc with
> q6prmcc which then gets included by boards using audioreach.
> 
> I also don't think we can split this across sc7280 vs qcm6490 vs sm7325,
> there seems to be any combination possible on any of these SoCs -
> depending on the firmware shipped with it.
> 
> So somewhat similar to the current sc7280-chrome-common.dtsi but just
> for audioreach.
> 
> Regards
> Luca
ACK, We will handle in next patchset version by creating a new 
qcs6490-audioreach.dtsi file.

Thanks,
Prasad>
>>
>> Konrad
> 


