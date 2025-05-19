Return-Path: <linux-arm-msm+bounces-58361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B67ABB39F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 05:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5261894300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 03:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440A01DDA09;
	Mon, 19 May 2025 03:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NsuRWG9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CE411185;
	Mon, 19 May 2025 03:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747624745; cv=none; b=pW9aOe9Tq4bmtHZzTGdxPS3RtI1cAk4axZJqrNyPgJIcEhZWu7fHX+oJUAsKd/Rm90gL1SFHul/BngaGMpnhZZBkEWEfj3s+QzdPQ+PU/RnSb1ZwDNlYG82AGrekp8njHX8WvdgDukydUzvMMDqV4oz7yFwx6N4CEfmsMaeHz7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747624745; c=relaxed/simple;
	bh=YO86jE4zmm6TjeaXwEwCHBGRwdoY3h0C5zYeXxpoTFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FRBtz5wg8aUvjg+2N145Hd24L1NxlQoWVeMT7ehy0hlPctfjng5b9VpUdR3M4+x6jcjNRyPZ6MuPkCJJi+Lu9jOAIz35Cy1RRm0cAq/jnqriCIArJBOBfJBOr7PQ+HmOA2qRPlLqrGJtxF7iT+VV9uf5Wgt02OygcwBnqTpk9Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NsuRWG9M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INtGt1014157;
	Mon, 19 May 2025 03:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6pm19lgWPDi0vi0ZE8xqYMAGPaSCwnY2sRj2Je6EJGQ=; b=NsuRWG9MEM7tCP6E
	F/zSrAlCefJ/RppMnGB/UzKUvPozuXqLxgyBOCOmoo8Xf3fmO4zAfRdi6oWGkpZU
	R0F34+nESi3jTL+6Y46heRkWdIFsuO4N0r8t5kgsKfY1ZyueO6mGdBqtODr5YmNv
	4EsLDUg2FfXzQ1tN1ZBuBAWTJvVyKcHSI9wx/vAiv31RlXe/1KUA50Tx6GwOsUo/
	TqaQvpLQFKI6R+fZHpzCVrug8tiPZgT3HZsEjPRxd6BI2GtJ4fC+N/jLwWsh0ft8
	LnOODqJ8oaUwM6EhHstAalRPm9Awc9iWXY/1xLeeV0f3/oVm4RUKq3l/muo1ObKe
	0i8ECw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4twdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 03:18:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54J3Iwf3011035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 03:18:58 GMT
Received: from [10.239.132.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 18 May
 2025 20:18:51 -0700
Message-ID: <774485c3-2046-40dd-a15e-978f781c134a@quicinc.com>
Date: Mon, 19 May 2025 11:18:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-5-ad12ceeafdd0@quicinc.com>
 <thtk5vv2hpbnoapmt6j7nlgrcyedjzjbi3ntlyb3ll7atks46n@bp4isaoert67>
 <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
From: Lijuan Gao <quic_lijuang@quicinc.com>
In-Reply-To: <73a689a1-e8a3-4417-b0e6-374ec9b091d5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682aa323 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=TnUyPrpFTRFRPAhg5l4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ET3mMl51iU2PetUKeuEthcgJ2HbD0VP7
X-Proofpoint-GUID: ET3mMl51iU2PetUKeuEthcgJ2HbD0VP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAyOSBTYWx0ZWRfX1F8OvWN4kjq2
 3hDFK9v2khmJN3kbj5q3xEeQSwujUnDLAuxJIVjnpDiEgA9hv72l4uG4Q/Zzgp4VaDnwR7zzx8p
 3iFwrnIEb+wLVWakZx+yWVBU9C/DwrRx2QAYU+BPjqK4OVCo3ipJL/LGo2ACdxK8rWpdnLtzxLq
 tN7ymYCSo0Mha8IeNFZgdIq09GyeGDp6a+5xlOwjRNpRf1J8SXHVPPnn9VDXv01jgOFRuP1RVpX
 qUPN5atlNPAVUAxcn3tPWDCRUY7x2QhUymd2IinijCyq/LSjf5iqGvy6QdHXd7hZ7105Zyxx/sz
 h9/pNOTilBYe0yWClTRbut8/v3HHKO2JGlq64h9/OiYuZ5zMK416go0MSZ6mOA/Ddpc8Q3HOPXy
 C6mIEO8kUcqM5Txc8xfxudaDKiB/6UeJyeAYZP3lH+wtNdfsNCL/R1u/eHSjlrhg457cyRiD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=694 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190029



在 5/18/2025 12:59 AM, Konrad Dybcio 写道:
> On 5/17/25 12:11 AM, Dmitry Baryshkov wrote:
>> On Fri, May 16, 2025 at 11:27:06AM +0800, Lijuan Gao wrote:
>>> Add nodes for remoteprocs: ADSP and CDSP for QCS615 SoC to enable proper
>>> remoteproc functionality.
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 86 insertions(+)
>>
>> Is the MPSS not present on the QCS615? It was a part of the SM6150
>> design.
> 
> Hmm.. good point..
> 
> It's surely not there on QC*S*
> 
> it is there on SM6150 though, quite obviously
> 
> downstream ref:
> 
> https://github.com/ianmacd/gts6lwifi/blob/master/arch/arm64/boot/dts/qcom/sm6150.dtsi
> 
> Konrad

Thanks Konrad and Dmitry, I will add MPSS in next patch.
-- 
Thx and BRs
Lijuan Gao


