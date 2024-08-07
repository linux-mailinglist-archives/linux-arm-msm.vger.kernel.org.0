Return-Path: <linux-arm-msm+bounces-28073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E82994A3EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 11:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E4D91C2174E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 09:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F58D1CB331;
	Wed,  7 Aug 2024 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rf7aVBM3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7C1CB327;
	Wed,  7 Aug 2024 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022109; cv=none; b=CqCfDCZ8A9pZ1DWDzGl7Mp34eQVXDTKksX0yB5XGmN+kfcEgUJXqo9AV6yei0/bwn/pI2isqYYE5q/OtJFiHNm1t7yli6fHu2idG9Z3k0E/+on4ix5ap/uS/707NIbpft0Vqi0f5tsT5RsFf8dYeINuU9FSGtMY7FsdTh0BZEsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022109; c=relaxed/simple;
	bh=0Ee4NBZ+XU3FD/drwenXmyRdjIDUUWcGifl0p5oAzWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OfEXXX+3weILYImkVdphNBd8ARtE1TIhpUfeJlP1yuBBKYgmZylZMp0AKFIm7Bzh/GIQpXK90lnuq9QITTb183r9uMIx7ca35dPHzQCmnQ0ngZpoL3crcKl5hEmYaeQaeejH0i5M4peAmbk518l64ywuNz/Ggd14/qF72rDelt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rf7aVBM3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4778Ajne012183;
	Wed, 7 Aug 2024 09:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzGHoSxoysOv/3+tXWrfwRAbEspulTcaP6k/36tWkec=; b=Rf7aVBM35fH1Re3e
	9hdggsGmAlqONYXFKnJxZGSvl8/CeDez5oTi0LATKFOOpYSMxHth1qk9w+VN6VtX
	thYiCHSGV9dNldMs+zbJfa9XQQKqqqouoNRG0L7NauFccjFo1sDi2Z/1d2NTEKhs
	6D8kkOePt6SzshGwWew3Ka1APo/2mqQg7uwkNAuDwzMPXt31/AC4VNGex7UQmpjd
	nfbuYa+mlrNHaH5NYU8MUceZh8H581d4BA7itLYDClX8zTajW7Zv7SiFIUmo3n90
	HsOzCanb6P31kjssjwQSZGKGiRr6TdspJgkbrPw0su0lhlr5lyTG+/GsPt1FW4RI
	Xgw1Pg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6t7hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 09:15:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4779F1dd010544
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 09:15:01 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 02:14:56 -0700
Message-ID: <773dc5b5-a537-4e6d-8e71-d2cb405c98fd@quicinc.com>
Date: Wed, 7 Aug 2024 17:14:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: Document QCS9100 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com>
 <20240806-add_qcs9100_soc_id-v1-3-04d14081f304@quicinc.com>
 <3020262e-f3b2-4921-b33b-8d0d7babf36a@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <3020262e-f3b2-4921-b33b-8d0d7babf36a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _iOxX2f88qH79RQw9V2RgXrKQu0U2xhq
X-Proofpoint-GUID: _iOxX2f88qH79RQw9V2RgXrKQu0U2xhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_06,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=853 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408070063



On 8/7/2024 3:27 PM, Krzysztof Kozlowski wrote:
> On 06/08/2024 06:19, Tengfei Fan wrote:
>> Add the compatible for QCS9100 SoC.
> 
> Standard reply: we see that from the diff. Oh wait, no! The diff is
> doing something entirely else.
> 
> You do much more - change SA8775p bindings.
> 
> Commit msg should say why you are doing such invasive change.
> 
> Best regards,
> Krzysztof
> 

I will explain the reason why change SA8775p bindings for support 
QCS9100 in the commit message of the next version patch series.

-- 
Thx and BRs,
Tengfei Fan

