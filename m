Return-Path: <linux-arm-msm+bounces-55535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C7A9BDC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC2A87A7747
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 05:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62157198E75;
	Fri, 25 Apr 2025 05:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z9ov/byH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1102701C1;
	Fri, 25 Apr 2025 05:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745558376; cv=none; b=EmsqcxeGmxsecycOD/Kz2emojY4Tnb499J9XGJNYCCwejBgXhAMHKgdW7EQ1NWPRr0u4LysrWhFFOdkSKFLz8c1I8iE9GA+SWNSLQ+GT/iI8p9KjD6VoLFWT6WZGBNbmwkCiJc9yd+M8DS/TBGuyhvGPkUFBipj0OaSR+qbf6s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745558376; c=relaxed/simple;
	bh=ZVZUTmeDPFRt/Z9pBTeeqz0A/odGMRaginCfACgAKS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tVGw0FTmJsYXZWUBbvcDULqkuA43hNW6+jo6jeFpfYyoKeGYe35HNnxbU7lx8DgkUiyZ8MkdmqmqQ9dLGNoUObvS3Rd0kJaV9Fv+cIDFTXbOOpUgZDt9K1k8EpgWTB5TOFYatIEeLiVUxhpHUFcEJMwISEykNnN+kHDuZ7jsmTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z9ov/byH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P17XDi012173;
	Fri, 25 Apr 2025 05:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cm4FYBGXuq9m+9Y9ZGCga0QZWrYzh/pJOSVPbS0jfS8=; b=Z9ov/byHgnQOet05
	C/tZ4W8xoXTPAT2gCMSgsxcRr8O/olPY8onJPE5d1mtE/DAyQOnAfcLyPXq9Hfql
	OfzthCbQpKwXwqlKz8VpbcTFRRm7vakHMhDJs++PCKOixCRQtSs7mJGAXil0a/Ux
	gfGk6hGMBWI/xZDiZik9HFbFamNPWFsTcDQh4nOiL6TwoNV7AIVsAcqxYRpNKYQC
	0koEBWlL0qvaM3KAHBmy4WuoblV5SYRFhGFRjZ/ZHP3N61uW7wQpDZeP9Hs+huWf
	9g56NrO107bGD2qYml+wtJP52ozSTqyT4SlarWhGeHf3f2v0KFlKCI5zBHpwJr/o
	80gsYw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ft4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 05:19:31 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53P5JUcp025931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 05:19:30 GMT
Received: from [10.47.235.76] (10.49.16.6) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 22:19:29 -0700
Message-ID: <e98d181a-f7d1-45b7-afa2-fa31563e8db7@quicinc.com>
Date: Thu, 24 Apr 2025 22:19:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: arm: qcom: add SA8255p Ride board
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_ptalari@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_shazhuss@quicinc.com>
References: <20250423003845.3980330-1-quic_djaggi@quicinc.com>
 <1d75a955-409a-409e-8708-754e89d6f046@linaro.org>
 <21a13826-0ee3-486a-956c-153f42477160@quicinc.com>
 <121d4e01-00cd-4be5-acbb-b140188048c3@linaro.org>
Content-Language: en-US
From: Deepti Jaggi <quic_djaggi@quicinc.com>
In-Reply-To: <121d4e01-00cd-4be5-acbb-b140188048c3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDAzNiBTYWx0ZWRfXzHgpZCNqB322 /b5/Q6mgse5rXqhveOx78VhN7s7D7ab2VH1DiXw8m0Z7h2i/ReumY226hYnxs3oS6387vFytp3u mgk9StcH21SrsTn9fKKaoyW43W+mrdH+CD2RQN7VSHfjx2qWD7izc3v3EHeWK5dqCcQEXjdiPJw
 841PXUa1fYOVlMoqA1Rt45hivb/PN5/b2w0BP/6e0GfBMRp19mTNp1AMO8TRFYci3COPFrWK7zE p+j+ZbUW++EunIIRmaVygQQ0f8mLJ3F+NteYRj6QYgz64MizYFBqBLhgQQRXMqtd2UmYYCZ1xSv xzKKFcEdpxv7yrcdvbOhdB5FPIgSzHSN5tRrlqHDCYL08YY9y3tY8yEk5SjBXXdoJoKY+SUe1Co
 H+Ck0yHdv0hTtvMDFmXUy/PfDoBZHHd6r6VQub8Ln0tUWLeC5gGY2ICK8auItuArMSZ4VJsZ
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b1b63 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=8Nqr4VOqxz35mBUtWYIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HZtQSeEjlGAqBmrSp0nPRT-55wjWOnER
X-Proofpoint-GUID: HZtQSeEjlGAqBmrSp0nPRT-55wjWOnER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250036



On 4/23/25 23:17, Krzysztof Kozlowski wrote:
> On 24/04/2025 01:54, Deepti Jaggi wrote:
>>
>> On 4/23/25 05:00, Krzysztof Kozlowski wrote:
>>> On 23/04/2025 02:38, Deepti Jaggi wrote:
>>>> From: Nikunj Kela <quic_nkela@quicinc.com>
>>>>
>>>> Document the SA8255p SoC and its reference board: sa8255p-ride.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
>>>> Signed-off-by: Deepti Jaggi <quic_djaggi@quicinc.com>
>>>> ---
>>>> Changes in v3:
>>>> 	Removed the patches from original series[1]
>>>
>>> Why? This makes no sense on its own. Binding goes with the user. No
>>> user? No binding.
>>
>> Thanks for taking the time to review the patch.
>> All the bindings that were initially included in the original series [1]
>> were removed and posted as individual patches.
>> devicetree has been posted as a separate patch :
>> Link: https://lore.kernel.org/all/20250422231249.871995-1-quic_djaggi@quicinc.com
>> If necessary, I can consolidate the bindings and dt into a single series
>> for the next version.
> I asked why and that's not the answer to why. That's description of what
> you did, but we see it here. Anyway, I explained you the process.

By examining other patches that were split from the series by the author, 
it appears that it was advised to split the patches based on subsystem.
However, I do not have any further details.

I followed the approach used for other bindings [1] [2] [3], which were part
of the original series and were sent as separate patches and accepted.
I misjudged that the SoC binding could also be sent as a 
separate patch. I will combine the remaining bindings along with 
the device tree (DT) into a single series in the next revision.

[1]: https://lore.kernel.org/all/20240910165926.2408630-1-quic_nkela@quicinc.com/ 
[2]: https://lore.kernel.org/all/20240910171534.2412263-1-quic_nkela@quicinc.com/ 
[3]: https://lore.kernel.org/all/20240905194741.3803345-1-quic_nkela@quicinc.com/ 

> 
> Best regards,
> Krzysztof

