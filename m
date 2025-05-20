Return-Path: <linux-arm-msm+bounces-58676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 251D0ABD30E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 496C18A660C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A542521ABB2;
	Tue, 20 May 2025 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZE0YVX5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E4261596;
	Tue, 20 May 2025 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732533; cv=none; b=HQY7GmpGCvKIjUZHPXoK93kffZKragLu6xYW1lYH+PRJjuhpABCFY7NVMnbYbOf7BzCTCet5cvtE5KZYZCNvHJP1wcWSk6iJKj/e6yXLieewVKJx/YlVXcGXVQXoby2rXaFyVzA8KE5PiSOhSoP/sq7IORf7ADrAypNcr1pvWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732533; c=relaxed/simple;
	bh=cZCPsc0axY6vwzg6GVxYmN7cC4sJ0+7gHL+hQv9JZn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gb3blejcP/ogYyed+3ZSbSYiJBLCxWk5+AsayWrCl6mUa1HaaxC7UjzOMEivwq5NbIYIJ8COWFN7LViuDTZ7ft7r8eCPcH9HhhOsaHsPZ/3XgVYyMI6kZYmBDrfdQogtiReTbhHcYcTwc/r7tFfIpCqF0zqHQahHDd1btuOxJ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZE0YVX5E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K80lD6027736;
	Tue, 20 May 2025 09:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Csf3v73qcTg/6a2zKpEnV119AkhPy4Kn1isOqUWbZAQ=; b=ZE0YVX5EolMHSJGM
	q5jJ3uYYP/KL+FTCVRXv7UkXS2Cvap8vin4eYRbqAqiUKFdf0w3qoE7fvVagEunF
	kaN06u3s/moAzcHk+rLbMAgMpKlhT5yCoSncepFgEfk5cDDQGZ+EGaJCISctuAGu
	CKu+IprmMLbF8MFH/Q777l02z+tYAoNVwwwHDcuoQn1ADytIO8DGe1XpzCQtjn12
	7P3lVTliY+w4VTZxyapOHFMdbNkYwOJWR7iawVrACXIyk/mcMlFXGtQZ4Ia66Vgy
	ZbzM4EKmzsivQMGEYfqM2+B+mOgz2hkUljWtFoRwuEUmzldS002Z+44FhjbRq4Ap
	1x6V2Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4y971-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 09:15:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54K9FQm1025996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 09:15:26 GMT
Received: from [10.218.0.120] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 02:15:17 -0700
Message-ID: <478e86ca-4638-4b90-9a36-ed411b547f7a@quicinc.com>
Date: Tue, 20 May 2025 14:45:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/3] dt-bindings: mmc: qcom: Document level shifter
 flag for SD card
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_narepall@quicinc.com>, <kernel@quicinc.com>
References: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
 <20241107080505.29244-2-quic_sartgarg@quicinc.com>
 <qffggh2ld2cw7d3eqwaerzicerhvdqojwsasherx7dgoda42b7@bigsjxr6vtao>
 <ba49151a-e32d-438d-8a2a-50840368a87c@quicinc.com>
 <8c6d37bb-8e07-4e44-bef1-f4376b54b853@kernel.org>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <8c6d37bb-8e07-4e44-bef1-f4376b54b853@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682c482f cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=VhTX7d0uqKoKWHOLC50A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pHuSY4N49Epo46v-eH-X7Ozbh5dpumRz
X-Proofpoint-GUID: pHuSY4N49Epo46v-eH-X7Ozbh5dpumRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA3NSBTYWx0ZWRfXwhXGJ8iLtsSd
 kgoRwa1JFmJAK2hfyTjWS92gZeBcBH7Kcesz8r03V0nAABDuECsAAWJj/40wob328X7eQc3cN5a
 TOYl5pRmmwfmTs/f3KatvN+dwC2GgIw4QCmlo4C7BmLHjR+PNJfN3PQhK3Z6//cj2zahNMsd6ae
 r6imi1ZC0p1GllxM5QYHmNRla15OuKNNu7hQ4xWQMBoRDFPW7SB8ICjXieXy+lsj30pJ6ublGN5
 P6qpHxLPYpokjR1RnRt2z5sT9DzWRUOLEfVVQc1vn0QaQOvoPvxB1TTJSr8/eiAOCnPT+6CzCYG
 pKxLF3tfKdHEEz6/ZABJuk2TAD63Rb2FHSV/ZZFFa1yZMGyGGptmqfVsj7gDbmM44nKmKiy7inu
 Lw7olSzRaieDoIOl5u2n1KuKk5hL9MsJFNuNxwIh7joGHo3q7XIQVr6PsDKPJExG2kRWa3A2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=897 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200075



On 5/20/2025 12:48 PM, Krzysztof Kozlowski wrote:
> On 20/05/2025 08:58, Sarthak Garg wrote:
>>
>>
>> On 11/7/2024 3:29 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Nov 07, 2024 at 01:35:03PM +0530, Sarthak Garg wrote:
>>>> Introduce a flag to indicate if the Qualcomm platform has a level
>>>> shifter for SD cards. With level shifter addition some extra delay is
>>>> seen on RX data path leading to CRC errors. To compensate these delays
>>>> and avoid CRC errors below things needs to be done:
>>>>
>>>> 1) Enable tuning for SDR50 mode
>>>> 2) Limit HS mode frequency to 37.5MHz from 50MHz
>>>>
>>>> Add this flag for all targets with a level shifter to handle these
>>>> issues for SD card.
>>>>
>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>
>>> This wasn't tested, so just short review - platform means SoC usually,
>>> so this looks SoC specific, thus implied by compatible.
>>>   > Best regards,
>>> Krzysztof
>>>
>>
>> Sure will redesign this logic and use compatible in patch V2.
> 
> Hi, I hope you are well and that was just some mishap, but I cannot help
> but notice that you received review within two hours after posting
> patch, but now you responded to my review after 6 months.
> 
> Sometimes I really consider reviewing at the end of 2 weeks - the usual
> maximum time frame.
> 
> Best regards,
> Krzysztof

Sorry I was on a break.
My apologies that I couldn't give a heads up for this in advance.
I have started this activity again and will be actively working now.

