Return-Path: <linux-arm-msm+bounces-40161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0599E3099
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 02:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B82516150B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 01:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0F74A06;
	Wed,  4 Dec 2024 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eeRnuw8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B7BBA2D;
	Wed,  4 Dec 2024 01:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733274074; cv=none; b=sfqt1+dDuHgtNc5j1kjY7B5cCb7Ir7wqNZcOOKAiocBjwLEBHHHPUMKo1lxANmRyvhygSRwiieR3RZuCuSMDUwThQ20PLmLsNZGf9ZXj0VU91rF4MoazMLOBkRXGD5RL7BHnjK0TZXRl1R26Wx/fasBU4jZ71zSFbM7o11XDctA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733274074; c=relaxed/simple;
	bh=Hzl8DN+o51/qaLp8AD41FS/ysNvwP/zYvaAZCXYJ9qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gqCp6O1fbYlzWePfWRxGhV7tmlhPQiZJ3XjZ5uLS27bBiCziJ4V5m4NBCvV9FJQ4U5HO+lsbOhQVe6iY0h+WrLI37Hsld/Odh1VglJGFdqnILGB9VCQirVRgzq7DFmDU1sDUta+2nuoNfr/a2+UnhXhDUFMJLZLobiGrBujAL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eeRnuw8w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3HKxKn017944;
	Wed, 4 Dec 2024 01:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+x0MzlGg5qJKvxLqim39PFmDlyz7QqBnshG523g4NTY=; b=eeRnuw8wZ/EbPbY/
	gGd4xMCXL9ZlNB7vs6OMf5yajWPijZ4pqBY5GxCaHY2ab85dLBMJJdDw2nelHTuL
	NUlMIQry05luKi15Yvsqd9e9AMkKEYeOXk+Jw7ZrYAM+ueBP7JAG8c2yp5rLum8U
	ku6ePr+kutjgXgJM7pmtYBjSRn3UMBX6Hn73dfRG4ii0ucw8Q9Qhfy8uK3kDjwhy
	GTzW5s0FqmWRUycgSc8z6M3kIlphc6U202iqWm1scGHa5RcBWVPAxkdVPE1kqkit
	6f8gIn3x59LsyLZYNzeMSunaJJqa77vpQK8JhEBjiB9Tp1h0YEgF/pQLsAajSM9u
	zpXhAg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437tsthsjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 01:01:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4114jr024202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 01:01:04 GMT
Received: from [10.4.85.39] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 17:01:01 -0800
Message-ID: <e9c048b1-6027-46a5-afc3-d8a964a0fdce@quicinc.com>
Date: Wed, 4 Dec 2024 12:00:58 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sm8650: add support for QTEE
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-9-f502ef01e016@quicinc.com>
 <11038b0c-e9f7-46ce-bd7f-2d763db230cb@kernel.org>
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <11038b0c-e9f7-46ce-bd7f-2d763db230cb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wxQHQWHbhpBqwGRmWWJnZO0zdztZN8h9
X-Proofpoint-GUID: wxQHQWHbhpBqwGRmWWJnZO0zdztZN8h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxlogscore=922 mlxscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040007



On 12/3/2024 6:59 PM, Krzysztof Kozlowski wrote:
> On 03/12/2024 05:19, Amirreza Zarrabi wrote:
>> Add qcom_tee node.
> 
> Why? "What" we see from the diff. Stop repeating subjects, but say
> something useful. This applies to all your patches.
> 
> Anyway, your driver and binding say that this is just a fake node used
> purely to instantiate the Linux driver. Drop the patch.
> 

Hi Krzysztof,

Thank you so much for your comments. I totally understand.
I'll remove the fake node.

Best Regards,
Amir

> 
> Best regards,
> Krzysztof

