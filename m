Return-Path: <linux-arm-msm+bounces-29088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF9B9583AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:09:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78010286BCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EA718C93A;
	Tue, 20 Aug 2024 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ax/SXiHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54CC18991B;
	Tue, 20 Aug 2024 10:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148542; cv=none; b=dOI78RxJIKk/sU/j1eSSTs/U5cFcyWujPdCYIkKCuNnA7Yyz1ip/0EHUrI5i9pMXNKtesTcgIPo4BDEeRxn+6plZkU9kb3BCAw/g42jsD6kbY1c0RWTHW10vGJ0GX2l0UuP1PWNaRc4IH6rr9EzowkjdhsLlF0c86PzC+xUW7lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148542; c=relaxed/simple;
	bh=zCuDKISEuTSYPPxdlpzmxb4MF3C2Ea+rRQ6WMYegRdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mfPbrEn0NUW3mK5D2rl4XdQbRSQ4miUsDNm2Ze+Ml56RiMywBGmAfX/9EXwsm/Kp2uAkrkiBpIhJhRphR/BnAiy4ulHO9nIFK1QNNBeG4EIwJc1jOP8qBgZmDe9dkWS/db3i+1xXbONd1euefo3VsQ5UU4odFdB13YjRBp0TGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ax/SXiHq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K8jYRL002694;
	Tue, 20 Aug 2024 10:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pfqeuMR4ZiNsS8jVb+mTszMWZT6jY0QLN9+u+2xCLzU=; b=Ax/SXiHqwGkmha9x
	hQS3vgCZaG5wCzRaSyf3Vscv7JDM1C99ebENCDmHUOQIyOtTjVdTQkdVYb2e3ajh
	a0ardY8R2BQRh2bSd06/XB1yLCECXlk0D2gOWinPx3WD9q2pN2lHxc5Q8uxInI9e
	UEA4sx0tNIJKFcgcySmh6WFmi7qsEYk7EB1Eo6BHEYx5Ud7mlSTdk/Z8JotUlGkS
	EuRYomCaEyVzMewJRPOufda9rgpQc+bGbrGQ35Ghs79bovgl9zk1TvZH5MC0L7XV
	DmiNxisdyt+zuanu50xsTkFMPoEZ7c8Fep574P6Je0kDqh68ncp15oj7sWmbOPrB
	BP8rsw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 413qxg5132-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 10:08:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KA8sX9022206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 10:08:54 GMT
Received: from [10.216.8.12] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 Aug
 2024 03:08:49 -0700
Message-ID: <5011eeb2-61e3-495a-85b3-e7c608340a82@quicinc.com>
Date: Tue, 20 Aug 2024 15:38:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for GCC on QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
 <c1dd239f-7b07-4a98-a346-2b6b525dafc4@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <c1dd239f-7b07-4a98-a346-2b6b525dafc4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JN9L4yNgMUbt7F5JxT8l4vOx-5xRc0I4
X-Proofpoint-GUID: JN9L4yNgMUbt7F5JxT8l4vOx-5xRc0I4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=887 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408200075



On 8/20/2024 3:27 PM, Krzysztof Kozlowski wrote:
> On 20/08/2024 11:36, Imran Shaik wrote:
>> This series adds the dt-bindings and driver support for GCC on QCS8300 platform.
>>
>> Please note that this series is dependent on [1] which adds support
>> for QCS8275/QCS8300 SoC ID.
>>
>> [1] https://lore.kernel.org/all/20240814072806.4107079-1-quic_jingyw@quicinc.com/
> 
> How do the depend? What is exactly the dependency?
> 
> If so this cannot be merged...
> 

They are not functionally dependent, but we want to ensure the base 
QCS8300 changes to merge first and then our GCC changes. Hence added the 
dependency.

Thanks,
Imran

> Best regards,
> Krzysztof
> 

