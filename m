Return-Path: <linux-arm-msm+bounces-13405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D7F872F08
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 268A51F2733E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB3D5BAE0;
	Wed,  6 Mar 2024 06:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cQrhqcr4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949CB1B816;
	Wed,  6 Mar 2024 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708054; cv=none; b=pIKML++X1SnW+hkjoEncZ0TiMg5gTJ7KqUt8AFm5xDFj0TXc2FHUqKAUjh+WfG0WpVK9xTkpmRW+2JN9LjvInJ/W2MTok7OwrzXaXOqgX+ajofkR1XbHhmePrZ/2Gmu/pr/Ohkhdb1pIYdCnVjppOQP6XzwOorGWDVngCN74VGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708054; c=relaxed/simple;
	bh=mMSUEcBX42g9CNPT+yotwqGzjpi7hLkBJpym+qJKC5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jDBUzN4p8JAmD9///BC9Uw939zZ+rRs0+h9qXvmHoaQJIkInwhsOMeS6oPhq8YplSTUiWrcQH80knf9TdO0nxkh69+Wf8rrGCV2Sef2iA88a74gPV1eaMpqId8CKOvFk80sFyFMbkB2FDgJ+6RDZHU1azBkphQcwjHeklv3biBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cQrhqcr4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4264Y2l8011875;
	Wed, 6 Mar 2024 06:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ei4uqjdtmb8/ZfZM+08daHW+onk9e59MBWjPUhVBTKg=; b=cQ
	rhqcr4TQWxd64SXPqLpAOIMG9jL9eep/paQf3i8anSZFavKZDqXIbNaNUP8mCw+F
	Nh0T9yFyfk8iPkISd0FD/ZX5AdAa5VWPhD1Qlp6prmmd7yj5EVpXV1gIiYPKGlO1
	FXK7KT4g+Stfz2cxoSB/vpaEr/Yqri/0hx6lJYfy0yyhyYcIRrF4CuJ+5J0A6tZ0
	txNiw9ueZrnv4Og1YOpwYf09A4/ccUBcbxdaq0AHmlWILRVmwBvS1bVN6rni/sXo
	vzo/vupYQ+5LhP6BE+KgvyWSU8ccfw1NQ3LQjgV89Gkgu/eECwNxeMuAyMaEVhIG
	67dWv7cOMT2EAuX2QXzQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpgwmr9cw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266s6at022097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:54:06 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:54:03 -0800
Message-ID: <91741024-b1f1-404a-a1aa-bc1a0d684ba0@quicinc.com>
Date: Wed, 6 Mar 2024 12:23:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bindings: clock: qcom: Add "qcom,adsp-skip-pll"
 property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-2-quic_tdas@quicinc.com>
 <568c26db-45c4-4a62-9504-738d78007802@linaro.org>
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <568c26db-45c4-4a62-9504-738d78007802@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C9rhobjP6HxydueHWcd1f8rbrC3Si47H
X-Proofpoint-ORIG-GUID: C9rhobjP6HxydueHWcd1f8rbrC3Si47H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060054

Thanks for your review Krzysztof.

On 2/8/2024 1:45 PM, Krzysztof Kozlowski wrote:
> On 08/02/2024 07:28, Taniya Das wrote:
>> When remoteproc is used to boot the LPASS the ADSP PLL should not be
>> configured from the high level OS. Thus add support for property to
>> avoid configuring the LPASS PLL.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> 
> You nicely bypassed all my filters.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching.
> 

My bad, I will update the commit subject.

> Anyway, I don't understand point of this commit. Aren't you now
> duplicating qcom,adsp-pil-mode?

No, the expectation with pil-mode was still certain level of 
configuration from HLOS LPASS clock drivers. But on the QCM6490 boards 
these clocks need to be completely reserved except the resets.

> 
> Best regards,
> Krzysztof
> 

-- 
Thanks & Regards,
Taniya Das.

