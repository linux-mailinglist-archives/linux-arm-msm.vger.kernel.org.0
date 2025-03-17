Return-Path: <linux-arm-msm+bounces-51579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36066A64076
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 07:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 826A716C29E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47EB215047;
	Mon, 17 Mar 2025 06:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NhevmzVs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7D3BBF0;
	Mon, 17 Mar 2025 06:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191226; cv=none; b=ATyQ/VaH4mbsI8l8rRRQ5H79HkE+EpU6/qO5l9VcgxqVeJdibtc4vM+BQ6h9mxGSTB1x//LnFwynhNgFVfClcx15elXMcbCmzi+gGfYEdoZkSWWSvE4WIl+AU5eAo6xSw+vWXAjnJstMIp2S9abIqUHDSqK7x9keIeSGD+CzQuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191226; c=relaxed/simple;
	bh=pFyvA1g9yJ5AjwyTyGA5uZRy7WTXS6f/HeTNMzNmVhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Id93u9hF0EYViCBLUs42JBOBN9+9AJwEGByndOGFLnNBWjRS1smpB19Pw+7N8NY4qVuZGVBDSjGAzTFDAWx+71Ug7MB66MCX5m9wF8pHVPlZadEyYjNgngx17VR3rxfOF6mjzdJuLslzr94TYWh2wIqFxr2EHZu/eXVTGu46tO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NhevmzVs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52GNwCXe006112;
	Mon, 17 Mar 2025 06:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfE8meacvzRTvPM5lBKcPRVOnWgBM4Ww9gj04EDAGwI=; b=NhevmzVsvYU9ITot
	r6iygw5XBGkeYMkzLIVTB5yacFz9VQTDYDIFVsAI2PTLnkwRV2W3Q4rCxQUL2TuN
	S4GUwN2PssLHTz9IaMlu3WkboWeLkg/9Sitwq4fW/LUtRdIurkxN/UBSpeH2r7dS
	yT84OF8nzSb77S1fbXegVFe9Q7w/PGWb46g5cYZDvVdh+hKNSat11qJAMeiyGNZH
	+4vr/AAZWpaPNGgfW+3gUr28J001Vv/6kjobv5xrgIS5/Nt+wSAEOFRrS29paqID
	Hspf5Ru8WMEsPJeVgIl1pM+0eJJJq4gMJZ9Axr1RnZ7OqA5I6B8vPUTXQgIc1wx/
	vkPhBg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d2qm3g10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:00:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52H60L0X028517
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Mar 2025 06:00:21 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Mar
 2025 23:00:17 -0700
Message-ID: <e6862fb0-c015-4019-8803-fa7b7676521f@quicinc.com>
Date: Mon, 17 Mar 2025 11:30:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add support to scale DDR and L3 on SA8775P
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Shivnandan
 Kumar" <quic_kshivnan@quicinc.com>,
        Raviteja Laggyshetty
	<quic_rlaggysh@quicinc.com>
References: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
 <174218015887.1913428.16257360641397675945.b4-ty@kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <174218015887.1913428.16257360641397675945.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GN53mKGciUxp6PUOktWLs7gPzJyDizmx
X-Proofpoint-GUID: GN53mKGciUxp6PUOktWLs7gPzJyDizmx
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=67d7ba76 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=b04cCG1JKnFS8Fa22XEA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_01,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=815 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170041



On 3/17/2025 8:25 AM, Bjorn Andersson wrote:
> 
> On Tue, 12 Nov 2024 18:14:10 +0530, Jagadeesh Kona wrote:
>> Add support to scale DDR and L3 frequencies
>> based on CPU frequencies on Qualcomm SA8775P
>> platform. Also add LMH interrupts in cpufreq_hw
>> node to indicate if there is any thermal throttle.
>>
>> The changes in this series are dependent on below series changes:
>> https://lore.kernel.org/all/20241112075826.28296-1-quic_rlaggysh@quicinc.com/
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/2] arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3
>       (no commit info)

Hi Bjorn, I am not sure if above DDR/L3 scaling commit is picked here, but as per
our earlier discussion[1], I have included the above patch in the dependent
interconnect series[2].

Above DDR/L3 scaling patch cannot be picked alone without interconnect changes, as it
will lead to compilation errors.

[1]: https://lore.kernel.org/all/d649eac7-c9bb-48f9-a5d7-758688b85107@quicinc.com/
[2]: https://lore.kernel.org/all/20250227155213.404-1-quic_rlaggysh@quicinc.com/

Thanks,
Jagadeesh

> [2/2] arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node
>       commit: cc13a858a79d8c5798a99e8cde677ea36272a5a0
> 
> Best regards,

