Return-Path: <linux-arm-msm+bounces-27100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC95293D604
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 17:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2F11C218FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 15:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB9217838B;
	Fri, 26 Jul 2024 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GSr7Nl0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D4F168C7;
	Fri, 26 Jul 2024 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007441; cv=none; b=S6sdjUlniiWzHvpnm9Svs45KJj22JhonBzGX8EZYFd4/7od+SeLo2/xe2wKdcKVkgPRFG8rUjJDX9OCtGRcm32PND9zLME8RaNt4oBuuvBYQv8gTPh07tezzewUlF3lDzgmnb3HgWUcmRltZFHEILMxPQtfskZQSnC6yGueA8zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007441; c=relaxed/simple;
	bh=FUlzQ1RCYgtrJFr3U4uAU2RzXWDpqchaD5Kf5gfGsAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=c18Wl+hQXa0yrzaPFSKZXPpcZy9HFds8zUkdpCSLFEsWFRvbVvNW5mN6J8RlH3uEUKipUOZbPaXYewEFH04jGSogP0MTsx4qtotKEKii/77FAMZb27uh3F5SzMKrfB6uiew9el7dhTuEeLdDG3C9SBsx0G9sBOvh3pXrKOHeMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GSr7Nl0B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QBcQPK027480;
	Fri, 26 Jul 2024 15:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6J+DZytAkG/xNSiUxHFD/ZG7rBh5cTF5wxNhs1+PhSY=; b=GSr7Nl0Boz1fOTXG
	/eOYnxA57EMiYl7uu9MWI+guC3yLtiUc04PzpoSV8lfaZnYrH/CEO3CmyyxQCqdp
	+/xiC8r6UGe9ufeZOHxBZRoHm6xJtyXUXiqwbsBLnWafv8WG8kztjOUsmhS8Eue+
	vi0oLw5vAf1QVBia0Tb18QO28XgXTb1MTTGJAm4LSZ1qPowsVj3oUTaTh7JAr/of
	i5AivInCVgPoAaMnVac+9S50DBOOnj47jx7c0y8AxyJT2T8O5PLwaJ2Fvqc4MOV5
	OgKpK7oL76Mm6kfQ0H93xC2PBgKWWWB1UmFv5HDjAW4orSgkH7+7UPpByBqxwqsf
	O5iqPw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1vyht1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:23:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QFNuxl013985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 15:23:56 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 08:23:55 -0700
Message-ID: <68e0396c-0fec-09fc-ce5b-9c80f232d436@quicinc.com>
Date: Fri, 26 Jul 2024 09:23:54 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: msm8998-lenovo-miix-630: enable
 aDSP and SLPI
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
 <20240723-miix630-support-v2-2-7d98f6047a17@linaro.org>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240723-miix630-support-v2-2-7d98f6047a17@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _RItzT-Q_cAT299pdTrJYp-UchwEsgrl
X-Proofpoint-GUID: _RItzT-Q_cAT299pdTrJYp-UchwEsgrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 mlxlogscore=546 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407260103

On 7/23/2024 5:28 AM, Dmitry Baryshkov wrote:
> Enable two other DSP instances on this platofm, aDSP and SLPI.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

