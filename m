Return-Path: <linux-arm-msm+bounces-51127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA2A5DA54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 11:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75941175D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3486723C8B3;
	Wed, 12 Mar 2025 10:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cBdIgCD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9121D59F;
	Wed, 12 Mar 2025 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741774770; cv=none; b=jB2lxt9c5zkUqtr540JcrtF7hszJ6/qrVvVFiJJ7FRsb5UzmOU29shxgcgRVrjAD3sQAe3Un2oiT/hYTiw+esTWJOMMCrbXNVUMu8ioaSOokOJ1pHdH/TIK9f6w0/N5sAthtbgbZI2XRWtCOqW6gHN6e24AI9w1uyN9EvfdlO90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741774770; c=relaxed/simple;
	bh=TJHip2cx7e/NfYxyHq5bmIzuT5vtIAhIdopeDQLbvlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TfbLKTC/1EdDI0Go7vaxae3s/d5Run1N4QYqWSFJKGAW2dI1qbgeOnToG85lA40RfycGKqqzA5ZHepGF1ikZIE5r0W/j9JltTX1NN0bWpYYpPLkvk9H9TRGCStyJ48mjA9yM4L6ebEdyIi3S75tHgIauNsQVaYNHoFzFT+wGf+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cBdIgCD5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CACmi1017709;
	Wed, 12 Mar 2025 10:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLpwz5o8pHGC1j10ZFntjLYwLh7GdeyWYCoc3lVul+M=; b=cBdIgCD5bfCkIXpy
	d8XiN32R1/vsJaDrhQ1qIwW4VnaCdA7Y7IfpJNwBJTaSSmsX3W5HoTDASkKkh+fu
	rzVIwCdUGaSbiXckQiGvXpuAgIhnm8D5YDVgi/gsSSQmlAioMRcNufJ/uooP7YMe
	v9Iw1S6P3V6VdVmaEf8oEX+oCFAc1DJ6VZiVzsT2Hg1TKYt+a3kusdIsMHbvwCjo
	EjC8po6aLCzJaO11pJRChVs+u0AKWxrEtl6X+O3S1zsAXgJRtZPpwcI9sJgWv41B
	rG9wU0rnAK2swcyrdjbGrV5FLcLRMMJqIsOQtDbsOXLNUqAE3xwbSNxQB0QEiWXZ
	myHcvg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au50a0f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 10:19:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52CAJNag009188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 10:19:23 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Mar
 2025 03:19:20 -0700
Message-ID: <a59c99a0-262d-4f16-99a4-985486849218@quicinc.com>
Date: Wed, 12 Mar 2025 15:49:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Dmitry Baryshkov <lumag@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250206-qcs8300-pcie-smmu-v1-1-8eee0e3585bc@quicinc.com>
 <aau6kgdbsq5mu5h4kqggzgua26o7dwc6hbkpmtgcnqx5dqhlgd@qcm2xzr64fyg>
 <43450c5e-837c-4215-9bb4-69066b175832@quicinc.com>
 <rj4jtqchuetrbtczbhvaa5hcp5olumwdbao3x4pulkxiqcq2ag@v6ftffk6bcc5>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <rj4jtqchuetrbtczbhvaa5hcp5olumwdbao3x4pulkxiqcq2ag@v6ftffk6bcc5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hxadSXf6e1kmLW1MNVyyHlF4NY4_lIMk
X-Proofpoint-ORIG-GUID: hxadSXf6e1kmLW1MNVyyHlF4NY4_lIMk
X-Authority-Analysis: v=2.4 cv=a4ow9VSF c=1 sm=1 tr=0 ts=67d15fac cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=y0BQO-919zeWhUMib7cA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=427
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120071


On 3/12/2025 2:14 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 12, 2025 at 12:41:38PM +0530, Pratyush Brahma wrote:
>> On 3/12/2025 12:23 PM, Dmitry Baryshkov wrote:
>>> On Thu, Feb 06, 2025 at 07:13:17PM +0530, Pratyush Brahma wrote:
>>>> Add the PCIe SMMU node to enable address translations
>>>> for pcie.
>>>>
>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 75 +++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 75 insertions(+)
>>>>
>>> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
>>>
>>> Though I see a little benefit in having this SMMU node if it is not
>>> followed by the PCIe enablement.
>> Thanks for the review!
>>
>> PCIe enablement changes for qcs8300 have been posted already [1] and [1]
>> needs
>> this patch as mentioned in [2].
> Ack. In future please consider posting series in a logical way: if PCIe
> SMMU is only useful for PCIe and it is required for PCIe to work it
> makes much more sense to have it as a part of the PCIe enablement series
> rather than having it as a separate patch which can easily get lost.
Sure, will keep this in mind further.
>
>> [1] https://lore.kernel.org/lkml/20250310063103.3924525-8-quic_ziyuzhan@quicinc.com
>> [2] https://lore.kernel.org/lkml/20250310063103.3924525-1-quic_ziyuzhan@quicinc.com
>>
>> -- 
>> Thanks and Regards
>> Pratyush Brahma
>>
-- 
Thanks and Regards
Pratyush Brahma


