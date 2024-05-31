Return-Path: <linux-arm-msm+bounces-21317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE78D6689
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 18:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5CBA2851C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 16:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E287415A4BD;
	Fri, 31 May 2024 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jUEkqLC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB6158DA1;
	Fri, 31 May 2024 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717172074; cv=none; b=N0VMxVnC+ww60Iet8O6aAe1Jg3SpQLgJyZGzSrgZt0o9O74EBKCw6LjFaBPZofVDSap/hADc7afBtApKA00tpo+pRBGIEmgtwlEnngU1AAaFJnCoOqSg5QtO6KiBrItnbp9G4Ek5Df/3NaqhY3sCFOk2L091kKS08vVdO7SXhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717172074; c=relaxed/simple;
	bh=3KSMNaIZSFV2C3id0HmcXGXTU5PFHyAeE2BZ/TEMZNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GOOpYbtHccUwy3jtbDwputdIzoSw+l+Coub8dnlUThnUTKnlJ9lfItpe1/RufbqKEFe5DPi1MA4sA5//go0dF3DtgyodF/2JpV59I/+asTnpwjCI50hFl3ObvQf/F9Lx4LT9nHjX328YvWtR2sWBfUMkpQ1/gqcexoxzXWmX37I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jUEkqLC9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V7Qk6k011441;
	Fri, 31 May 2024 16:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQAVOkGtNvs31mvV0+sPwKefzbYI8BysTbTvsWWVpa4=; b=jUEkqLC9khlPqNxK
	Y+9YZr+3E347ThbOVpf9LC68t4nXoA8KqtzCsLhkCEaz99epYLtFHI4vrmB0YjHz
	VT00I5zRR2vuefe3RVP7jq/8KZKmS4xpfyuy0H4NZ2Al8/EVZiCrLVehSo1sQGZY
	6qytCUIM7xVpWn3zAxcJy/by3v/ckeMUKyQEaHfDqZzHdJHH7KaZBxxs25LK31Om
	K2WGA1jgdOGs8vUOqzOjGNtu+jx47cSRwo8HREMlsLnaIwviywROLtIMbaDOQKcw
	bomwEaSCC+qIIJDcW7bTl+hqNd3Cy2V66RVUnrseY3HHBNF/adBleU2rzn9iNc1J
	siPksA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjfj2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:14:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VGEOYa010863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 16:14:24 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 09:14:23 -0700
Message-ID: <619c244c-bde8-0595-651a-201166e6294f@quicinc.com>
Date: Fri, 31 May 2024 10:14:23 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: Marc Gonzalez <mgonzalez@freebox.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>, DT
	<devicetree@vger.kernel.org>,
        Bryan O Donoghue <bryan.odonoghue@linaro.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
 <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr>
 <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
 <4940120f-d0bb-4131-a190-e1af0e75b47b@linaro.org>
 <CAA8EJpoPed6TJX8kAO7YKMTwpxUKpfW8x40b+GW9owqHv8xhFA@mail.gmail.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <CAA8EJpoPed6TJX8kAO7YKMTwpxUKpfW8x40b+GW9owqHv8xhFA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gDKeTF5CPgaBemVnO5IvlGbCjjgLXaEU
X-Proofpoint-ORIG-GUID: gDKeTF5CPgaBemVnO5IvlGbCjjgLXaEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=542 spamscore=0
 clxscore=1011 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310122

On 5/31/2024 7:55 AM, Dmitry Baryshkov wrote:
> On Fri, 31 May 2024 at 15:01, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 30.05.2024 3:06 PM, Dmitry Baryshkov wrote:
>>
>> [...]
>>
>>>> +                               power-domains = <&rpmpd MSM8998_VDDCX>;
>>>
>>> Is it? I don't see this in msm-4.4
>>
>> Yes, it is. msm-4.4 says VDD_DIG which is &pm8998_s1_level which is CX
> 
> Oh, my...
> 
>>
>> As for the PHY, it's a safe guess to assume it's backed by MX. Maybe
>> Jeff could chime in with a confirmation.

Sounds right, but I'm not finding anything in the documentation.

-Jeff

