Return-Path: <linux-arm-msm+bounces-58919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E94ABF726
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 16:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44E85174B93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 14:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F5D18BBB9;
	Wed, 21 May 2025 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ViuagPKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654BA18B47C;
	Wed, 21 May 2025 14:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836418; cv=none; b=Sxf0t7OEpC2nsqYT0NDRK/5PUQ3vI5D782gdveahCLMguaiUwSZkKF1GZoU36GMZkInV747JUwblPTs2/Wv5HqyeBFJfJQh3HwSu2/7wYPgJo1ATSkAUKAbBnFGRVg4Rg8offILynC3Sa5RjYWKG909PDE0LzjDQnn/t+poNIVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836418; c=relaxed/simple;
	bh=SVBIAry5diav5AcInN8gs8lqjfGsmpDJg/gQpPaZMrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rsSVNXqWvBROZEfiE3AnIVYOY02qZMjBFY1DbdKqfbTfUFVDpSJha+o5Swp7pHEAThWSEssSMlKSE5o/rttUY4EXAxOV8XuOEqEogByQ6s49wjcqWG4HXs2+JB8gz4+LCmhBcBifAklFwrpjaFFQhs06WWlXg/fqXTf7Bz5Ntak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ViuagPKs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XJXV031702;
	Wed, 21 May 2025 14:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQbP+SH9J660U0q35K9OzSg2MdznoCxxpaUVi93Eyoc=; b=ViuagPKsl3+Zz7Ia
	gi6GtNJhcGpolvim25UGwYExvsDy1TNLUo1L3Y2JKQYE5nPodfsin1akzmzIwUsP
	01fP6jy0uIVBbVr7Qn0mIAsharaJArDiBY4CAETD2pKHstwkoHBnAeMs1iFQrlRv
	ZqdjfVifnS6Zm+Nlk/uifqGn+jJxwGsiSkVDVKtQcObZxr1eOmX31ZovXBY4SuXs
	sf7WD0I16RuxEShAzbImTtQ0G5ONwZstbRWadypDJ44z5clNSJvdQF5UCKFn5dKj
	hDfJB1NfxmdYwTqemjFlcAB9vq0b1mYi3fGQvRdUQhuCJxfHSMOvilVww1TvxR7J
	oo9dyQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c21pn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:06:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LE6o4h003288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 14:06:50 GMT
Received: from [10.219.49.109] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 May
 2025 07:06:46 -0700
Message-ID: <3b498b4e-7159-4cb4-bc71-78f32feaf402@quicinc.com>
Date: Wed, 21 May 2025 19:36:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@oss.qualcomm.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
 <3fbffse4iqkegqjheeptnmsofz7fasqgnpbhhbzlzibv5qjxx6@dft4vafwlkfr>
Content-Language: en-US
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <3fbffse4iqkegqjheeptnmsofz7fasqgnpbhhbzlzibv5qjxx6@dft4vafwlkfr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEzNyBTYWx0ZWRfX0Pje3bpufgC2
 pwf5NEMkOa2EEfQho1UKiQRp8FeUtrYbbL44siFulM28OTsM4G12LEXCVV60Y6vhoXEjy5f0aTI
 oW36nEwE/qKpWgJTO3nQWzHy60OnoNsd3T0Xs+tHZF7GMAgFVn6Fdg5wWNI/OOQMBJSQVVo+c2R
 iKsxDzlL0tySFpgzVwiQFn9yZWioV2qJcQJ6Zfh7dxH6HOj9fPMHQwlvQ9/NL7clxV9M8ym7Cjl
 A9aTakFg0xouVLLIUXpFzi3n39bv3YqM+75xSrVpANFEtKiibbjHgPEMhZqxI+j1qlv6wNf973L
 lYBtJASM4A16/mtAoSTzrLWNUK7AvHpEWfV0RdDRwfKSYT4P6CtH9qotGEP+E6eaVcy9y25bjmW
 ijbSbuHjbWOHtV8fwmkLRweZSgGktyIW7JolusPFXTKRVKrRIyc8EdsJCK0oANcqoOacZhpS
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682dddfa cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=_2Pm6FfrxIRCaX_8azEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: j6b06aqaouBsH941gbF5Akd6-Q0Aza2R
X-Proofpoint-GUID: j6b06aqaouBsH941gbF5Akd6-Q0Aza2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=571 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210137



On 5/21/2025 1:33 AM, Dmitry Baryshkov wrote:
> On Tue, May 20, 2025 at 11:56:16AM +0530, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>
>> Add the sound card node with tested playback over WSA8835 speakers
>> and digital on-board mics.
> 
> No WCD codec?

Yes, No WCD on qcs6490-rb3gen2.

Thanks,
Prasad>
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 45 ++++++++++++++++++++
>>   1 file changed, 45 insertions(+)
> 


