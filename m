Return-Path: <linux-arm-msm+bounces-68968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6225B2485D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FE56880410
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42852F0689;
	Wed, 13 Aug 2025 11:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q+dZmpOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD7121256B;
	Wed, 13 Aug 2025 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084067; cv=none; b=miEzbG8N/Gmwltd+qf+yOaUpqYnZoy4OB76OI3oEc5umgM+1vz4+YPqvTxvgY3c1ITx9Qfnof90qO/qx08UQMvAitFx24fbJAF+Aa9roQf9MppgGUvqGpQbQZuN4L4nYA7DH1N7rt08odzSlUV1r5yhqLjnAETb9OMqVH9wS4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084067; c=relaxed/simple;
	bh=ZJwO4aIu2PWNlHL3ATQwqH7xwDXEREkkD3uj8U9qkI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pMt3XKlCn/Ks/yzaLD7fyloknBW3iaG/47hSmXurcdFN1wT8f3tq+UjhjUV8AcH5ogWKKq9JfwuGrHGQjKAIuk2nbKUFdZVNgLmKzXST6J4CqqXOtIcZoBcqhzl65aQ/kSC5klpf1R/SWcGpjU0Pum7v2ddaX0lYhx/GdflbBLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q+dZmpOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mMAc030018;
	Wed, 13 Aug 2025 11:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRK4rsk41Atr9PHy7lELbkJhE6IsQ1nxXS1E9iMHC0s=; b=Q+dZmpOqT1h1SfkZ
	FIdK+MWJi1SoHvBv3DG5Zi3gCfWGQENW7UJCY+4X0uE59cgsm1e+qXXS5NIInNEq
	RAONRNr3aYDp1fLV0ciwbVh6dGh3sbVLPC1gcc239Vw/lsU2AKolRBmMeQvNOMwm
	qFt7gaUQE0Eaql9Fn7AhbmEQRKc2M8MF24Rc2vcsD6BPP5zu9K4uLCFX4jaaCq6P
	oK+aif/RkvHI02zUp2KQQbP/euZatuZmkC9XHY1INtiKNqAU3iAEmtjQmqXiHsgl
	fhRgUyMDXrMDeiBbP47gzfiMI16VnzmjyyAoNtbHig1ohdkdhavH7TumW/d186Eb
	FPr+lw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gbhvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:21:02 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBL2mb004508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:21:02 GMT
Received: from [10.206.107.4] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:20:56 -0700
Message-ID: <564d2557-7ed0-4cf9-981c-fd427a0378c3@quicinc.com>
Date: Wed, 13 Aug 2025 16:50:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <kernel@oss.qualcomm.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
 <lkjp2353athoi76h3j3bgkcxdwfn6akcyyweipt4g774ztmmer@vcw7ru5red3n>
 <5d5820c5-463a-4fa0-8ad9-21b75797aaf9@oss.qualcomm.com>
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <5d5820c5-463a-4fa0-8ad9-21b75797aaf9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689c751e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=RN5q-oIBhZMF581UVrgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX3kL4xu/MHpNA
 10P7fwdnfcBqCnmLhfrnBGFqSmZnkaDq5siBc2ouCiC73z/L7FaSImIXBLoYG91IcxiVwOmAuoZ
 Gpqtos+CdOc9m1LMgwQ0AxOdT0v4QfCowJRp5rpOBm0NOQz8SNr1i1fxUxBdYqYbWMmqoD1fBcM
 QbhPwKabVnYIRi3G499B5xWakCcHrJt+93laOfJSjtW+qGzA2vyEseQxaeD5oIbubqz/Ms+BBW6
 biVBDKLIj9zu4iYyyqJMO3wAPXzqpWPpZ7YWZumI4xHa7QzU6c6+GTG8AdSZ0iJuM4U3iojM8Jb
 w2YqNIFZbAvxr54bnrT7Ry0YZ5SBtWsw+z8BR7OgzWEoXD1sdrmEJ58xJqMZA9vqPwMrmTExTcg
 maINMnwN
X-Proofpoint-GUID: TmITf-y3G0DaXq1HkFIdtS177Z9NH6GS
X-Proofpoint-ORIG-GUID: TmITf-y3G0DaXq1HkFIdtS177Z9NH6GS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/5/2025 6:38 PM, Konrad Dybcio wrote:
> On 8/5/25 11:59 AM, Dmitry Baryshkov wrote:
>> On Tue, Aug 05, 2025 at 02:49:29PM +0530, Sarthak Garg wrote:
>>>
>>>
>>> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
>>>> On 01/08/2025 10:45, Sarthak Garg wrote:
>>>>> The kernel now handles level shifter limitations affecting SD card
>>>>> modes, making it unnecessary to explicitly disable SDR104 and SDR50
>>>>> capabilities in the device tree.
>>>>>
>>>>> However, due to board-specific hardware constraints particularly related
>>>>> to level shifter in this case the maximum frequency for SD High-Speed
>>>>> (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
>>>>> card in HS mode. This is achieved using the max-sd-hs-frequency property
>>>>> in the board DTS.
>>>>>
>>>>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
>>>>>    arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
>>>>>    arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
>>>>>    arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
>>
>> You missed several devices which use SM8550. Please fix that.
> 
> I would be in favor of making this addition in the SoC dtsi and removing/
> altering it on a case by case basis, since as I explained in the threads
> of previous revisions, the fix for the limitation is additional on-board
> hardware
> 
> Konrad

@Krzysztof Kozlowski please let me know your view on placement of the 
max-sd-hs-frequency
DT property in SOC dtsi as per above comment.

Best regards,
Sarthak

