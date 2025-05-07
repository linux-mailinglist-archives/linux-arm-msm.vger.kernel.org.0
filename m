Return-Path: <linux-arm-msm+bounces-57041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8BCAAD458
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 681CC4A82D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 04:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E161D5174;
	Wed,  7 May 2025 04:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cBVxwihD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F32AE84;
	Wed,  7 May 2025 04:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746591120; cv=none; b=UjeOeQ5LM9oP4vy1qomeXD9D/SgzCF/uTnpyRiqbMF1fNMpyzzbV46dc+jIhAie3qazffldo1FtIg6ijXNGQNqz77mB7bBwLcc/qk1GN9WDf58edux6t06LTwZETw4Q/ZMo+CaJzkvaCZAIqBR1D+97zACvPTeFxtYpBhe1ysNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746591120; c=relaxed/simple;
	bh=t6o/Kr1oTxulD7Lw+8iLnHW/czcDclgYwK3GLTNakZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lFv8FlMz5FYO+P0x9a7D/Ibj4NPRLrDIfkut+lXh3mA61Tihkwd9qCe7kOBbgYKWDd9JVCqMscp/nt6bxHCHOPpLExuOeTNUFTba5JJ59fH3cpB+hW+RpXGILc7/SaYvJK1GR91i9i0aACAMeYgj637iGS9DO2qi8aTML2VoX94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cBVxwihD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471H7bB028394;
	Wed, 7 May 2025 04:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6o/Kr1oTxulD7Lw+8iLnHW/czcDclgYwK3GLTNakZA=; b=cBVxwihDnqJIkHLu
	T3A1wvmCSdfl6D9sw1BrgvNZXY0acu54LyW2fArYSA/tuHiwHFUmXeifl7Fwb0Bl
	d1/1j534ppezQ+yFt4OH7R0ILG64Pt7ZZWJK0PZw2Ubw1N4ihPN63xIU/3Hl45N9
	6Nx0he+24LdQVgfc81U8hXUH+RusLeHRb1WC6ESAG/fdTlSrDLwJbT2deSGCMHJd
	2hC2tj0UiXF99OFbBiIl1Y7qYVpt+XvV0rmCL0Bcojwhx/+F3tMdWSIy32zurHL9
	oceu79hHLJsZSCZM1fkosTH2WWcFTMxSB8Jzs/Ljfzyjtmc4ITYpQIqYnJd/iuwR
	iKoPIw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguujh5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 04:11:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5474Bsa2004120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 04:11:54 GMT
Received: from [10.218.23.250] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 21:11:49 -0700
Message-ID: <d41d1c72-6f43-497a-8021-8a9af59f5877@quicinc.com>
Date: Wed, 7 May 2025 09:41:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>
 <20250502-singing-hypersonic-snail-bef73a@kuoka>
 <cbca1b2f-0608-4bd3-b1fb-7f338d347b5e@quicinc.com>
 <35662ebc-d975-4891-8cbb-1ba3c324f504@kernel.org>
 <1cd1d97f-a6f1-43e6-8451-b9433db93c16@oss.qualcomm.com>
Content-Language: en-US
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
In-Reply-To: <1cd1d97f-a6f1-43e6-8451-b9433db93c16@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=681add8b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=Vq3j57szJu-oTNTe2DwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 7O9dthSOPnR6rI1R0WwGrHRCYyxAu8xO
X-Proofpoint-GUID: 7O9dthSOPnR6rI1R0WwGrHRCYyxAu8xO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAzNiBTYWx0ZWRfX7H1Spp35sAko
 yief7MwyDhF4DhdIFxmRpHmWl/iiSYAJawNbZRIaRFTNerwVwE6leEzx+9L40KrotaFqsXfyhF+
 zM2fbmfulDnh9CDATZVhkN+81mBX0W3x+t7J3tRj6KBVUwUXoF7TC3JzwIjEk8BoWXzM+Votw4P
 eyD1ZxA20K6S9/ywF8Yr/Q0izVjMgVPUgprjYT8eRpkjCvc2pq/TpEJ0MZhcw/8D9oH6ZclLxQa
 U8ybUJbki3RZ6V8faQWPNaZK1VfoPdf+DD/tC4q9YMqI6IuiGtXtCRFX4ut8Pm+zt50JLhkt74I
 xlJujRi+NAC9QC7ydARLY4/s9wUP7ZrNp5AkOiRYwsKOe1huQdlgi0JOUwh6GdSkPAYH0698CGx
 MgN5OxExTaMzHTGnz+NZYygIbfldCVuHRqEl5W7iNqoqdiAjwTJQn+LlGpFqSFxkNtVjfOxT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=754 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070036


On 5/5/2025 6:52 PM, Konrad Dybcio wrote:
> On 5/5/25 11:46 AM, Krzysztof Kozlowski wrote:
>> On 05/05/2025 11:43, Satya Priya Kakitapalli wrote:
>>> On 5/2/2025 12:15 PM, Krzysztof Kozlowski wrote:
>>>> On Wed, Apr 30, 2025 at 04:08:55PM GMT, Satya Priya Kakitapalli wrote:
>>>>> Add all the missing clock bindings for gcc-sc8180x.
>>>>>
>>>>> Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
>>>>> Cc: stable@vger.kernel.org
>>>> What sort of bug is being fixed here? This needs to be clearly expressed
>>>> in commit msg - bug or observable issue.
>>>
>>> The multi-media AHB clocks are needed to create HW dependency in the
>>> multimedia CC dt blocks and avoid any issues. They were not defined in
>>> the initial bindings.
>>>
>>> Sure, I'll add the details in the commit text.
>> I don't understand what is the bug here. You just described missing feature.
> i.e. this patch is fine, but the fixes tag doesn't apply, as it doesn't
> really fix anything on its own


Okay, I'll drop the fixes tag.


> Konrad

