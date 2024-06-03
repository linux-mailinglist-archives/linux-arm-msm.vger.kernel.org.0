Return-Path: <linux-arm-msm+bounces-21493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E470C8D8759
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 18:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D66328992D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 16:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF5913541B;
	Mon,  3 Jun 2024 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dljAJy3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A397E8;
	Mon,  3 Jun 2024 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717432524; cv=none; b=pU6iqQ4YzVTZis6xSAN30828v+t3AfjeER7GN4HPaVSlbYR0ZOFpTddHoHr2mUtiet202qGMeuhZucgkkjO+a/lZq+dFzs+z1BP+xm/6xv9DkGocHlt7r74pj3+JOEoHTD9bltKSjP2/1eYSfTSrXr+lzYFP2ND65KxXXgnGDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717432524; c=relaxed/simple;
	bh=BO3aVJ0FfkEKoNFzLUlb3mwvrU9V3ipNtcJaX7DM/Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XUVL1uwRzZhrnWq6L5pclXoxg2tQDUdMWrrgj9ra3B6SRU2APsP0xsAoRWAGT3CtwBsKmH7eMV+oWwkGxDUavMXV3KX/yvBcSMkb9xha3MR/YYaYGxYJ9j3B+JAN3S4lNJxX8xQd2Inis5AEl/2WLDadSQYt01mw07coiUxngOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dljAJy3f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453C5K9P009078;
	Mon, 3 Jun 2024 16:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VladUwHMx4+LGUlSn+CNhK4B9YObfz94IGIKwRIcgiM=; b=dljAJy3f/Lz929yF
	bjSOATzpw8uaZUJ1mq6PNWEvm16PKKaFCj9BBDmAsoSsfmBCxApyaZc0Nx/btNbG
	qfYGVOB/+VaV7TQn5ltrtumQto6i9yFeWAuyuNE02VwppoJTfqJ4M4zVlJmoXJkH
	+Zs9xfSl/ofnIUTyLJQYX+NE93MEmFn42FscGgLO7oX33Qf/W+3cDhHJhG964H+a
	TYNOj2BR/0OtONTqy3exSnsyLOGn8tuWU/eEdJdFLenM2HonhnUtWw2L6UbJYFr5
	LoaCledEc3ggw5uIJPFaBAZ5TsFk5NiND7uIkHI457Et0J2m62lhw6rYAgq1t1UM
	6cjUtQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw7dmesp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 16:35:18 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453GZGsV008159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 16:35:16 GMT
Received: from [10.110.33.27] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 09:35:13 -0700
Message-ID: <5adaf1ec-7e10-49f8-9b2c-ece932a835fd@quicinc.com>
Date: Mon, 3 Jun 2024 09:35:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v6 0/5] LLCC: Support for Broadcast_AND region
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <cover.1717014052.git.quic_uchalich@quicinc.com>
 <171730042577.665897.8196444348725965878.b4-ty@kernel.org>
Content-Language: en-US
From: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
In-Reply-To: <171730042577.665897.8196444348725965878.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tFYtsQJ0OHMoNJ_3SbZr_3oDYerD8arS
X-Proofpoint-GUID: tFYtsQJ0OHMoNJ_3SbZr_3oDYerD8arS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_13,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=888 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030136

On 6/1/2024 8:53 PM, Bjorn Andersson wrote:
> 
> On Fri, 31 May 2024 09:45:23 -0700, Unnathi Chalicheemala wrote:
>> This series adds:
>> 1. Device tree register mapping for Broadcast_AND region in SM8450,
>> SM8550, SM8650.
>> 2. LLCC driver updates to reflect addition of Broadcast_AND regmap.
>>
>> To support CSR programming, a broadcast interface is used to program all
>> channels in a single command. Until SM8450 there was only one broadcast
>> region (Broadcast_OR) used to broadcast write and check for status bit
>> 0. From SM8450 onwards another broadcast region (Broadcast_AND) has been
>> added which checks for status bit 1.
>>
>> [...]
> 
> Applied, thanks!
> 
Thanks Bjorn, Krzystof and Konrad for the reviews!
> [3/5] arm64: dts: qcom: sm8450: Add Broadcast_AND register in LLCC block
>       commit: c566143137aaacfed1af09d8710edab1971c312d
> [4/5] arm64: dts: qcom: sm8550: Add Broadcast_AND register in LLCC block
>       commit: 2a71a2eb1f5ec438f0ac1c7e294cd7ed32119af3
> [5/5] arm64: dts: qcom: sm8650: Add Broadcast_AND register in LLCC block
>       commit: a7823576f7f7b1cb0a595332ab6b0b38e15f45a7
> 
> Best regards,

