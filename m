Return-Path: <linux-arm-msm+bounces-60788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F75AD38B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 523E43BF1C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E9719D890;
	Tue, 10 Jun 2025 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="do8T6Pio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122BA19A;
	Tue, 10 Jun 2025 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560848; cv=none; b=D/iX2lhN3vxuK48m0i/taI5Ouv2qUMjzjX1O91ilmRH4asuGYxgZRUNJjeXq8AyUi8Ohcv9egrgoqscWHdbqdpoKpBtfF+yQzSyK+XjAnc2WwFkh0SPVDkCvzDGYNI2tdn/E1NVC6XLU4c6VZBWY8rRaM6zNFhYtBMNqOn/5p5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560848; c=relaxed/simple;
	bh=JGBU6yuMcEu9jaDvH7qVhIiGmXq1vguIdg7PTe9Agks=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D4kdeRFd2iYhtW5Sdu54IT+EsRVK8t5uXVIbJ+FvR9FjNvfGuyC1uX3OfM4Ze5+57MS2fD0MCfOek1MgbLJCKrlfq28fsidDklAz79EDOR0WTEXqYtIgFydoJZSC0Oq0tgCdrMQw+Yv6VqdedquAHZcKQblii4HJ6kGHqLRbNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=do8T6Pio; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8XvAZ029862;
	Tue, 10 Jun 2025 13:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGBU6yuMcEu9jaDvH7qVhIiGmXq1vguIdg7PTe9Agks=; b=do8T6Pio0Og8JEsZ
	NzDdZCF3GcmsR6vOOXu+AWgAjNb7X72ddrCyIXwxBL2/uA9xUsxWGNuvFOk/RPGW
	ssSxGCxNkHmV859nBfZ5xhUsXgmc8PnBnVIAJOcetu2ns6sZAAy7+5xECd4xggMO
	cO+mhY8v4eIx/T+aQjr0V6hM/yFnLQqFGglgr5FoFC8sdx1SpisZf2TEdbAjX3gc
	gQAuFbuBR1eCNbmtevX9ViGeDG2oFKOmdfkvTJGyVYELIATUf95J6Gw09/Fnml/c
	xdNvowJiwLsLoel2p5JZx45bw5Zg83wfY66BwS/3ksCdPvofwOeYy/vU6fRmdCl1
	JA99ZQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqchdb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 13:07:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AD7Ki1002349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 13:07:20 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 06:07:15 -0700
Message-ID: <3b75fe83-85c5-f0d3-c5db-481ef133d6de@quicinc.com>
Date: Tue, 10 Jun 2025 18:37:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <e0f43fc7-2f38-335d-1515-c97594a55566@quicinc.com>
 <18053999-c337-47e5-b6df-72c2be6a72df@kernel.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <18053999-c337-47e5-b6df-72c2be6a72df@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDEwMiBTYWx0ZWRfX5o5lYcdz9Uj4
 Kp5Om5Lvf4iRs6CFmtyztKCWZ8wrBai6SWCVWzuPTnYGGeFuZ/udDShCTTsv9LdYO4sDNxRauOM
 E7Spn+cAsYkGcAVuGXfU/BEe1t6cKcymrPvew/PXnX/xi9r7KT5ZzWrQc7PAsCnmuNxT9I0A7Y8
 wUJRAeqoOP0vxPDQXasOdD2yr4LWqwj7ajejDgUxTD31uzz8c87zH+SrzK3U8hWvj7+hl9ZXK2p
 c9jasM1jf67aevnff4XYNvtwvEZxja04kvgzU/F4DfX2+1I5YPPucPAWqek8qmz70u7V+Zq6YjG
 sgEeUQ7nlZi+WzdLcV3tvEs8Vm1ooGRuRlzrpjfTDGmIK/b6cZQZoRsgbBg0H+VCdVtJmrvvxqq
 7yGjgz/ptYPDIdpslArBj2QoMNFcdWWSj1LM7VdvuFMWfLO/PAOj6ibih3fsahNtkLOzT34a
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68482e09 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=tplrWfVxwPniNMw0LL4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5-G7pzJu0YH_cMYSW9WaKP5MyQBHE-3V
X-Proofpoint-ORIG-GUID: 5-G7pzJu0YH_cMYSW9WaKP5MyQBHE-3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100102


On 6/10/2025 6:23 PM, Krzysztof Kozlowski wrote:
> On 10/06/2025 14:07, Ram Prakash Gupta wrote:
>> Hi Krzysztof,
>>
>> Thanks for your comment, The Qualcomm Engineer who initiated this work,
>> is no longer working on this and I am taking up the responsibility to continue
>> on this work. I have started to check this and will start with addressing your
>> comment next.
>>
>> Thanks,
>> Ram
>>
>> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>>> On 22/01/2025 10:47, Sachin Gupta wrote:
> Above timeline is interesting:
> 1. Patch sent on 22nd January.
> 2. I provided comments few hours later, the same day.
> 3. Silence.
> 4. Employee changes job.
> 5. Five months later...
>
> Not your fault Ram of course, but above timeline is not a responsible
> way of upstreaming patches.
>
> Best regards,
> Krzysztof

my apologies for this, I will give inputs internally to improve process
for changing hands.


