Return-Path: <linux-arm-msm+bounces-39297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78779DA634
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 11:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A42163AFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97801D516E;
	Wed, 27 Nov 2024 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jZZf7clD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E391D4615;
	Wed, 27 Nov 2024 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732704877; cv=none; b=gvlfEusIF+q8j5cQECmWMtVe0dibkmfZpXcbz8XQdK9pgRnJQynljJLRlW+BIcx8R2OJ7HDTJl1bkkMqqOn/V9kVgm1LiMUcMum9/YJGg935iS+E/9vR1gSM4tzZXyqptTM4T38Eqaj+A2DXUgBs9ER3nH8UPfuefkBbKQipUV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732704877; c=relaxed/simple;
	bh=bw4R/xaVIhqazXmWYeRS//XfI0YzbW0vTTgSRGVI3SA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WuLnE4M4mXAJ+IPH08o5DqR7PZs8Yd+pQ1h6aVqfMI1y40SH7Cr304Bw63IO0wQ8YrDHUL2XegOsN12XygF2Rcm4HdECz4Z0V+gGZslbxSE68A70CcJJhi1Ho8IJCDm7rLqepPUOvdcBmy4n9yo2A8G8YJc3b7X2l1+iBAMJzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jZZf7clD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR93TN2004424;
	Wed, 27 Nov 2024 10:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rEMqPPtfJwiWelzz0hRF2xRvmtFgCOZyATXF6ddQuHA=; b=jZZf7clDnMgEw2sS
	jJsrBWwIhVKcpZlVjPbd9lL2MA9PUX9CXvYp1wQMfjMLyRP0/AdESMrovJejtrms
	z/+KlX+h2Cc2inmDf+2ByLN4CsD8reLkacqQaKWeWzoo9yH1lkjmWyZTndLnV2yZ
	jZ1v0upIJV75dr1wmAzuLsKgmWq+H9XAvewCVuE0s/2LJy3Zuj0vI6lXdnOYvHAF
	yp53gcgq1wQz9VP5ZtsiplLcmHXYY0+zedzDZR5CBp8CHLRsWoBfK+ZAcuHm96Si
	tApyA7WV29VlU+jttSL2rtH/5LWAp1Cek1CcCoiL3RzEF333tFmEhBR/nK8pfVqI
	EiKEsw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435839cdh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:54:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ARAsKVL015882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 10:54:20 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 02:54:13 -0800
Message-ID: <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
Date: Wed, 27 Nov 2024 18:54:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Ritesh Kumar
	<quic_riteshk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Neil
 Armstrong" <neil.armstrong@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Gpp7Knmg-xPkJylILt6Rf0k6FYHYWrFs
X-Proofpoint-ORIG-GUID: Gpp7Knmg-xPkJylILt6Rf0k6FYHYWrFs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=969 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270090



On 2024/11/27 15:13, Krzysztof Kozlowski wrote:
> On 27/11/2024 08:05, Yongxing Mou wrote:
>> This series introduces support to enable the Mobile Display Subsystem (MDSS)
>> and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
>> includes the addition of the hardware catalog, compatible string,
>> relevant device tree changes, and their YAML bindings.
>>
>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>> ---
>> This series depends on following series:
>> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
>> https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
> Above was not part of this merge window, so nothing from your patchset
> can be merged for this v6.14.
> 
> If you want things to get merged, I suggest decoupling dependencies.
> 
Thanks for reviewing.Can we keep the dependency on above changes and 
merge our changes after the dependent changes are merged?
> Best regards,
> Krzysztof


