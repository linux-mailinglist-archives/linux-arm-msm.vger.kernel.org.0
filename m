Return-Path: <linux-arm-msm+bounces-40153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 130869E2EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 23:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCEE9283979
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 22:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913E0209F4C;
	Tue,  3 Dec 2024 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Za/D1pmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4D7207A20;
	Tue,  3 Dec 2024 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733264036; cv=none; b=VDdChSRr5HPgXhRkVpUJwRvl17X6WPQxLdJLY8Z7V8NHtH6s8ARM67lcfaPxflDn64OBwcUmZYyqlZcnxFzdcB8RK+GWZeoSjlxMhdUtyWKdq1QJZlQH0Pk6ImUo6buIcWPjZHm9rE9AC39Y+HOGu4T32CPhQLyi0JRL0Aqzlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733264036; c=relaxed/simple;
	bh=BkbrVzdOiRECikibD4L1YGd8E6iWdSVVwdyBf+AYo/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GySMKxeNBzD6JMwisolXmmodaIb6gtwHKAUhcPDmq3nUzX33aoyS2ye48nlhOK8wZttnPuEyRGxSNtE6AkAZ7v02/olTnXHzNLtBM2suYa92klmjRc9TTLOcnuE8O5EzgiGRo9ZBA5FxUOjH1fYSOryXXSM+9z/mFQQVY3qfuIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Za/D1pmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3DX5RW031984;
	Tue, 3 Dec 2024 22:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o638fS9a+Kgl6sSSM4E5PIbTqYncs25H9BZwPzS/vgQ=; b=Za/D1pmU1C0oej/1
	l5hAliFZZxo+iTJmfoXovUIf8RFNArDJ6bkxojpH4AJYtmjEM2+5t8iuzeuPoDQK
	U7zhYkQVtbmEIU+SUdIZJTV6Lmg0EcHYto2j7d3I/ha4u8psVNylov139DPuJ7gw
	AS+ULkrpJWbGBJNZgeZ6tqLhFBLniG9koWAiRqIG8uJaNgU34o67qifBdzhZNhrA
	Izr+2Khc6c6EXXm7BM/Qu8MeMUEGNGy0UeOatUfWVsD2t4q5ULmKPuCmEd5+nR7V
	bYp/1zh6nIvWgj8+n6uoMSO4hhrgB8RrI7afqpn8U2J81jo75tOEjnuT7OcWLiFF
	fvaePQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439trbjpym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 22:13:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3MDmdc030640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 22:13:48 GMT
Received: from [10.4.85.39] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 14:13:45 -0800
Message-ID: <0df58435-94e7-4b81-b688-ec0e1c49c0e0@quicinc.com>
Date: Wed, 4 Dec 2024 09:13:43 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
To: Trilok Soni <quic_tsoni@quicinc.com>,
        Jens Wiklander
	<jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
 <518ee3f1-b871-4349-ba85-3b3fc835a4ca@quicinc.com>
Content-Language: en-US
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
In-Reply-To: <518ee3f1-b871-4349-ba85-3b3fc835a4ca@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ul74uRlLCFN8ibDVqsxhKq7DcVbsTQSq
X-Proofpoint-ORIG-GUID: ul74uRlLCFN8ibDVqsxhKq7DcVbsTQSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=891 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030184

Based on our discussions, we implemented significant changes. We essentially
rewrote most of the files and altered the overall direction, except for a
couple of files. The changelog entry would have been extensive.

- Amir

On 12/3/2024 5:06 PM, Trilok Soni wrote:
> On 12/2/2024 8:19 PM, Amirreza Zarrabi wrote:
>> This patch series introduces a Trusted Execution Environment (TEE)
>> driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
>> and services to run securely. It uses an object-based interface, where
>> each service is an object with sets of operations. Clients can invoke
>> these operations on objects, which can generate results, including other
>> objects. For example, an object can load a TA and return another object
>> that represents the loaded TA, allowing access to its services.
> 
> The first patch series was RFC and now you had removed the RFC. Can you please
> provide the reasons?
> 
> https://lwn.net/ml/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com/
> 
> I understand that you have now changed to tee framework but I want to check
> if we should continue with the version and increment here or start from [00]?
> 

