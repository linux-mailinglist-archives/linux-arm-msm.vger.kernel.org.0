Return-Path: <linux-arm-msm+bounces-33311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E4999241D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18B491F22EBF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED46B13C9B3;
	Mon,  7 Oct 2024 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cj/QZ3bS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA8524B4;
	Mon,  7 Oct 2024 06:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728281264; cv=none; b=FKXvmFZ+qeY3tHRzajhe51QjNOIizqigazmUtF5gicu6xGwsfuRJ4XEnutRYsZhjkWmcapWuGJ2nkvqZTE9VzfaDT5/liIljsp9Y4EA1Z++hTT+7GVlV6FikWxbE8gq7Va5go0OUO8c4kvy0e/swBgFO5rY4G/OVQIM8tf2gHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728281264; c=relaxed/simple;
	bh=Yb6yyuKQEmtpy8E30ecLqrI0qfWSSlnSrlOl29Pvxc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nkjkIwP8dq43e5Fa/CZMB0Y43ud9Dt+5aiYMVlNSfjKLlu8V9rVjvzUQw67WXMZHMulBk5czLlDFl79xJ3ydhisFfMwMMcpB8l1VqRI8E8IaxyDQpdFp6zNIg0CNadQRANl95ef+odYSW1g+hI8QPoH0bWx+kcJwoAdsJH/oI3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cj/QZ3bS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SqT8019060;
	Mon, 7 Oct 2024 06:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/TWUqbSKxuAEzj9WTVZlXakG3hBlInJ6ilHN0mR83k0=; b=cj/QZ3bSUnIOdRaP
	hPQJl3ykP7a4qyvLJLMi4qCVec2SMk3s8VhSbixfvjbNfNIGbEwZoVSPWBNH1aTk
	B333t8U56vVRJMiLZUTjzf/WshpU5dgItiipuKnSgjvMLrdBdtjd0T+mgnXUzKb9
	//GrzTalOqTLpUHLWQxjAbsSoXE3amf4liXho7KIM8uBhctmPugcFxoTszDJzTG7
	aM8rA9EfixAM7Z/hYEbLfgg85opDGGQqCqKt3xCzWK5hDLeMwh7rMmn+faweZgGY
	NixFttzJm0OYSNxS+nIIHqdk8uDvhrRCugrjlsW0vC8NX0lQA+Kj9h61Nxhkj+7R
	75A99Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsn369a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:07:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49767Qkv021978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:07:26 GMT
Received: from [10.216.15.15] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Oct 2024
 23:07:23 -0700
Message-ID: <1fd4b0db-f9c1-44db-9aec-45f3aa269e19@quicinc.com>
Date: Mon, 7 Oct 2024 11:36:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2] arm64: dts: qcom: sa8775p: Populate additional
 UART DT nodes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
References: <20240930085533.17119-1-quic_vdadhani@quicinc.com>
 <uk3zgyee62vrkcwtujkuw754wacvullmsjnimlqhmmbjit24rm@sqcrmbn7ngsg>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <uk3zgyee62vrkcwtujkuw754wacvullmsjnimlqhmmbjit24rm@sqcrmbn7ngsg>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1p4wXqPnT_7yQiYsamcJ-5EajfhCeFOZ
X-Proofpoint-GUID: 1p4wXqPnT_7yQiYsamcJ-5EajfhCeFOZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=874
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410070041



On 10/7/2024 2:26 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 30, 2024 at 02:25:33PM GMT, Viken Dadhaniya wrote:
>> Currently, UART configuration is populated for few
>> SEs(Serial engine) only in sa8775p DTSI file.
>>
>> Populate UART configurations of remaining SEs for sa8775p soc.
> 
> I think this is a long standing tradition of adding UART configuration
> only to those nodes that actually will be used for UART on one or
> another device. Is this the case for all these UART nodes?

Recently, we have begun adding all possible UART configurations, similar 
to what we’ve done with I2C and SPI.
We will continue this approach for future targets.

> 
>>
>> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
>> ---
>> v1 -> v2:
>>
>> - Modifed commit log as requested by Krzysztof.
>> - Added co-developed-by tag.
>>
>> v1 Link: https://lore.kernel.org/linux-arm-msm/98e7dc28-4413-4247-bad1-98b529f6d62d@kernel.org/T/
>> ---
>> ---
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
>>   1 file changed, 231 insertions(+)
>>
> 

