Return-Path: <linux-arm-msm+bounces-87362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0F6CF1D01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 05:55:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C9C301227B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 04:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB9332471C;
	Mon,  5 Jan 2026 04:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BK0alOoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFC8KSRa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A07324707
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 04:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767588906; cv=none; b=p5+GG8tpV94/y2cVPWE7LyKiDWgdCQtSL2rsgCC2BaqcpeUT8KnSOJ5UgybMwRazNzWMVgSwWe0kmEbpkrZS33Kcej8O1JA+6Qo2YZ9oQETan7rYuUHdtHL9/kYxI2ZBmM1GwIEfreLt0OsHjjf3+MZGBNZRgEBw3vevcgKx/1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767588906; c=relaxed/simple;
	bh=D5+wsa8d6AKmE8SYNa401J10zc1Opslrw81zmIM508M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lHkQUofzdNqTy2CdSPl/7ct0unYubgX4CmimjbzvMyarj9eub1YSxJScgzLXP8jbfK6Pa4dlb/zMeAgMKeS28IEhQ+Yca6VlgFHBycHwRUHyB6sS0Si4bLw3KYSYMTCfO1Mbs4bmE+zCFxzcH1MDJp8WSt6ftQS8PEuXqFEZQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BK0alOoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFC8KSRa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 604MdJH83842465
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 04:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nm45HE0wSttWHB4PgGIZB5I7jtkr8Gbc6fC1XCjkHhA=; b=BK0alOoOWdTxtjPl
	kW2eYUTSx4H7NwY1htIeUjYYNE3XumbtgSNp1SSOM6TLc4u5OTOeKy+IIRx3wLGy
	BOPVQpzZQBCgX80WccgDNhqFVhz1B3wApbBipa3xYEXKhJZbqgdVa5BJXS4ZslyI
	3PPfe4JBv3N4S80oW3gEICDKENMcMT2WOaZ4t6wi2+a5KmryAndsB/5011Snd4a0
	qLHBT8B0TWbQ23aGkTudioiBcyGxYuxfWDigs3jN6ccK37RBCqy3SXos781yMvPf
	4jyxJ4RnebYY+zGmHKnZwBJHaHVN6UdQlq7ePEDxQ3NeXSySWnB4JS/O+VRFqYkY
	tLU9Fw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0gnkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 04:55:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so15292185ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 20:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767588903; x=1768193703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nm45HE0wSttWHB4PgGIZB5I7jtkr8Gbc6fC1XCjkHhA=;
        b=gFC8KSRa6QOxLNCr1OaToNrPKCyQboUkDZ8TBgJLG9s9JZAdYW/PTNl5KQWCb0X+4+
         NieJXJnP9u3GjtEN/ofZI07qslUhCKEwGa2dACFzR5Sc9weyicS/KvQSiFCLLW4VMnoP
         /zsO+MVnomMsKgTw22As79N+A5YYq9vNuxWzzM7JWABVZBcwGZCOQeTTM0JChWctle0R
         5cuyHBdIDJpinwRUN1xFkCAeCfsma26U7R0MFGMToahwmoYj+yT7WeOUM0H6sZkMY5MR
         Npref23+OH4d9ausNyP7YeN6cHt5Z8zVq+B6baxaoNDmNA2HfS7JZdVVcP5cEszzb/Cy
         M/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767588903; x=1768193703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nm45HE0wSttWHB4PgGIZB5I7jtkr8Gbc6fC1XCjkHhA=;
        b=nORGplZZnz119tgjjjPvwtx0DQxc00Kig7+g41g9vjuEq0qhoD3R1XUqYGUqTcgz3p
         z52pP9gh1RyV3Bf+g7ruJW1ae9WFKDPkQDqRpHCkx0eoG5JUpf/+BGGaE0MefL3iJMZW
         pwoqQqOSNZcTi+Zjhw0mhEORWHhZUqQVuL6ctB2D3NroJEN52enkOj2ekjKk3m/xQRmH
         ksjJ27lIpylS6+A7kdW11JTrGwqvSXfPFovHy0AkLrAK829KqmKSVTL8fP+gqowmHhV6
         s1x4xlv3OETmekcLpI2ErtmtgVVaRfcnxRgPL3iWbmEDwqq5wEcANr+b/tnJF3QWTBqH
         iXEg==
X-Gm-Message-State: AOJu0YxDCUZi5n2lV7LxMCtOml0zG+sKJIyAkkmpjT7cwZqAzN/nNlgo
	GKdUyT4KRz/g2bbgjPvkneUzAGmjC2sg8m+/Gn2tuO/8oyPIc4GN7XRFE29xzEOQ4mpdgYI2cbb
	gcg+ZtiuQhDQIXtWC3bqRVfBE2rmZrhcshgWDr/xYzBxbYgBJ9yo3tulPCM1Rhpg/6xtY
X-Gm-Gg: AY/fxX5ntDZyODlbLbHwNB/JbKXHNJDhTVyIw8X/d98HRrl0BeY/8/skm4mTN5CzqLt
	XAXo+P0qfTTvQ/ekMBbKMx1sqhkcsopBInJP11LJbvbPxEyzzAWg/bMrwn1s7CHHhHcHnq6aKOO
	r2EvTkbIE+b7RhvH6d/LpyUG2EnLctm1IXWhefDW9m0HBXM68ePOwJLDoIXAhUvXS3kivODw1Sl
	QLt3VS7OV9AN/1d6cRtSyCdWZl0jylW5yURNDnGJfRfCHyW2QXmm4ZlFvtxH3Z7zpPN+mGfTFkE
	ZUn3hZULWyWH/8fp61qn3RtMVQXEJCZhmgLUPap857BCg2FTftlmle4hlsURyJHhcxQdUmME4eu
	rqZgK0ahtDYiJAZTWgZPYYWt7CCvY7Fbk+nnJ6z1iGA==
X-Received: by 2002:a05:6a20:a104:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-389593bda2fmr5948221637.35.1767588902909;
        Sun, 04 Jan 2026 20:55:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFacj7culxX1WSh1Rq5jfZxcULqvVOrEjZIp8JekHVlP7djaScfvXdTMwv9fW0VLbjINJOlHQ==
X-Received: by 2002:a05:6a20:a104:b0:366:14b0:4b18 with SMTP id adf61e73a8af0-389593bda2fmr5948184637.35.1767588902398;
        Sun, 04 Jan 2026 20:55:02 -0800 (PST)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476f8f3fsm4806409a91.5.2026.01.04.20.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 20:55:01 -0800 (PST)
Message-ID: <32f1b476-c3b5-4912-bf60-b24ff67a4320@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 10:24:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
 <a42f963f-a869-4789-a353-e574ba22eca8@oss.qualcomm.com>
 <edca97aa-429e-4a6b-95a0-2a6dfe510ef2@oss.qualcomm.com>
 <500313f1-51fd-450e-877e-e4626b7652bc@oss.qualcomm.com>
 <4d61e8b3-0d40-4b78-9f40-a68b05284a3d@oss.qualcomm.com>
 <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <e917e98a-4ff3-45b8-87a0-fe0d6823ac2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695b4427 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7th-FYyNm21myA_937sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA0MyBTYWx0ZWRfX+VotrlQBxnmr
 4Rnj6X/aLnDfCveM+jAFv6/mfQF5bEdLq1BxcKe75oMdwdLvkSi4hIbwA9aMBTBb9Zr9hRrzbxB
 zDcFc9uXSbS0KflU5jr8vZhcv4Vex7F0H56Nm0j/Y8jG6RiIMCQsFlmshmhaz1aGjflwIc2ljiG
 LkNEg8aGXjbixJNhz4DFgAwoHiNx42pyZtgpYPWcR+96AyVgIjxGsqQn0mwHD5ibBSYY/nt+aUm
 nSZOyUogIgovGXgV0JlINnKKGSoI4nnu14jtnpZ3e2lF+GvAgbhCEiWXJMB5oWSHfFys0NsEAEp
 65HTP0rCVKxZlBltql9ComYveNNT6yJratB45RtVSAyHZT+XzeJuCfPXCaGLHkUnCEzK3LgyNFY
 z3Htk32xJh4XKWFhqKNBpKw1w1O998WBPtgxCgO8ctH77DD2wFJaXESzUK5MqU7kDHhCyH5jw4F
 8XdQRIaowpsINXcu0+A==
X-Proofpoint-GUID: O7mJ_4qD0l3hKiQ7gnINyuSeCmhDznEI
X-Proofpoint-ORIG-GUID: O7mJ_4qD0l3hKiQ7gnINyuSeCmhDznEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-04_07,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050043



On 1/2/2026 7:27 PM, Konrad Dybcio wrote:
> On 1/2/26 2:19 PM, Krishna Chaitanya Chundru wrote:
>>
>> On 1/2/2026 5:09 PM, Konrad Dybcio wrote:
>>> On 1/2/26 12:36 PM, Krishna Chaitanya Chundru wrote:
>>>> On 1/2/2026 5:04 PM, Konrad Dybcio wrote:
>>>>> On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
>>>>>> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
>>>>>> can happen during scenarios such as system suspend and breaks the resume
>>>>>> of PCIe controllers from suspend.
>>>>> Isn't turning the GDSCs off what we want though? At least during system
>>>>> suspend?
>>>> If we are keeping link in D3cold it makes sense, but currently we are not keeping in D3cold
>>>> so we don't expect them to get off.
>>> Since we seem to be tackling that in parallel, it seems to make sense
>>> that adding a mechanism to let the PCIe driver select "on" vs "ret" vs
>>> "off" could be useful for us
>> At least I am not aware of such API where we can tell genpd not to turn off gdsc
>> at runtime if we are keeping the device in D3cold state.
>> But anyway the PCIe gdsc supports Retention, in that case adding this flag here makes
>> more sense as it represents HW.
>> sm8450,sm8650 also had similar problem which are fixed by mani[1].
> Perhaps I should ask for a clarification - is retention superior to
> powering the GDSC off? Does it have any power costs?
>
>>> FWIW I recall I could turn off the GDSCs on at least makena with the old
>>> suspend patches and the controllers would come back to life afterwards
>> In the suspend patches, we are keeping link in D3cold, so turning off gdsc will not have any effect.
> What do you mean by it won't have any effect?
I meant to say that in this case we can turn off the gdsc and it won't 
have any effect in SW. But in non D3cold
case the link will be broken and will become non functional.

- Krishna Chaitanya.
>> But if some reason we skipped D3cold like in S2idle case then gdsc should not be off, in that case
>> in resume PCIe link will be broken.
> Right, obviously
>
> Konrad


