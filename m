Return-Path: <linux-arm-msm+bounces-71412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73730B3E7D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55DDB7ACD46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4002630DEBE;
	Mon,  1 Sep 2025 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U6I6+Ffd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3B34167B;
	Mon,  1 Sep 2025 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756738271; cv=none; b=HDregFQB0keeXvhGfGKOFVMuda96wqaVHJrmjj31/uRxun6Mq+Igt0nR00PK2vb9CrMURiLp2SJocrFD8pFrdO4w3/QjxH+cjV84Ask4BQh9r1a+WJKZpPSIItz53sZ6IIIJuHkOL7tdZl8bIULdv8uk6YYv+0ohgfI8MC9g7QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756738271; c=relaxed/simple;
	bh=HMfcWtZH4GfvP8ZQjqKKGaNEwZCreXFhbBtPKK8hH3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hxDoqNUtfUJ1hIbSNnoJhB2s+NcAFV5XsLYMnzFn7koIYmJhwSLU4r8hxdKXRaDotOLL6pHUgqd7Q7/XNVDGK6MBmEZ+hPZcByFqZ49gN20saModee2S4JDuNv/NxGgxHdsm1n0xJHhf1OnV0fWiWaijT5tGjHylT+orHy523QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U6I6+Ffd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581B4I7B013737;
	Mon, 1 Sep 2025 14:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WylkCM7GEVrZp/hwxRtLeGV36zbXgc2z6PnvbtJ5bTc=; b=U6I6+Ffd9KhhFhgg
	aX76Nih1gnjMMXNYR8+C5ZtuND0JQaKvRrFC8nD3LOhWhy3rKgpglfZjbSERqmvD
	KcXyVJB1xFYCaVD0eANfRHpkAk9GTBI60MfiKnJlbW0/Yq4Frd8+sNenqHtM/jZH
	4MxXPefptHLKNdPnThRaHGbchXg9aaJtUWuExdCdhjr2XNm1VSXPbjHZkFca1yHh
	8kH+PVJvaMOj1+ZGqnRfUv4f+EaP0e7GIBVO41Q1udRu0HrK4zy0jWRA4+jZk2Ml
	WVg5ZyAYHhwZkyMefBgxlqDuwyVGUMbMaOMRAlIkBLQKTkYRKVKgb3kbqnGyAwlV
	tpqWlA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8n2ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 14:50:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 581Eoawx020499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Sep 2025 14:50:36 GMT
Received: from [10.216.44.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 1 Sep
 2025 07:50:31 -0700
Message-ID: <0fb24c50-1f4f-4dd8-a3c7-4c84fd0bb7c1@quicinc.com>
Date: Mon, 1 Sep 2025 20:20:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <James.Bottomley@hansenpartnership.com>,
        <martin.petersen@oracle.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-5-quic_rdwivedi@quicinc.com>
 <eeecc7a3-8ce3-4cfd-8d40-988736fc0c59@kernel.org>
 <34aqaxgkykyhenrjfj3vrarin2c3uebgfaya7rxi7d5p5skhom@ie4gitcw36mr>
 <ba227580-add8-4ea8-a973-c39083301e67@kernel.org>
 <aonf4hobz6b3a75lwiblu44gxvae4hnp2mcnh5sqlyzo6k7hwe@a5toymspbkdy>
 <b049c4be-f3c1-49e4-8737-c29c52185e60@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <b049c4be-f3c1-49e4-8737-c29c52185e60@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1Az8Emd4kY7JrAF6MIzkayett6GvseOy
X-Proofpoint-GUID: 1Az8Emd4kY7JrAF6MIzkayett6GvseOy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXzTCkh25E7X7T
 VQcMM6bincj015S4W+/aheJUuVxgHnBwRv8M4N+1EY7U/ML7AwQGQUlXhOmFJzxOqqsiUTFC28G
 sXRQ+cvXdvKFmV7unLCeXOZpMScuOYLpYuCF8K7VQ53WCmGEn+fnH2W4RjQbGFMb2uEiIUuBuIE
 KRUWiyhFlDM7NhLNFAw0rqefJgStjpgF7KHKerVkaA850mihnr4mrIMbd0xDimuTkfIRYKQ3VCi
 P/WnCcj1NQDd+lzLZu9F5pjOIpxvLpaYdybogeX0qdfNt2aZ2kIfLL9Bx1OOZAZMDGDFyd94m4F
 4tXSQfdflrtazmJCUzbWpcJrh2qkv28DRwkiEpXRZJiSaDaU4pDhaM6DB5NqcSJHClXqoRH0atX
 J1xeTLJ+
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b5b2bd cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=WDwdR3GTf5Sq1hJQ3NcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020



On 9/1/2025 1:35 PM, Krzysztof Kozlowski wrote:
> On 01/09/2025 06:15, Manivannan Sadhasivam wrote:
>>>>>
>>>>> I don't understand why you combine DTS patch into UFS patchset. This
>>>>> creates impression of dependent work, which would be a trouble for merging.
>>>>>
>>>>
>>>> What trouble? Even if the DTS depends on the driver/bindings change, can't it
>>>> still go through a different tree for the same cycle? It happened previously as
>>>
>>> It all depends on sort of dependency.
>>>
>>>> well, unless the rule changed now.
>>>
>>> No, the point is that there is absolutely nothing relevant between the
>>> DTS and drivers here. Combining unrelated patches, completely different
>>> ones, targeting different subsystems into one patchset was always a
>>> mistake. This makes only life of maintainers more difficult, for no gain.
>>>
>>
>> Ok. Since patch 2 is just a refactoring, it should not be required for enabling
>> MCQ. But it is not clear if that is the case.
>>
>> @Ram/Nitin: Please confirm if MCQ can be enabled without patch 2. If yes, then
>> post the DTS separately, otherwise, you need to rewrite the commit message of
>> patch 2 to state it explicitly.
> 
> Dependency of DTS on driver would be another issue and in any case must
> be clearly documented, not implicit via patch order.

Hi Krzysztof/Mani,

We've verified that the driver and DTS function correctly when tested 
independently. We Will submit separate patches for the driver and DTS.

Regards,
Nitin




> 
> Best regards,
> Krzysztof
> 


