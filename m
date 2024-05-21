Return-Path: <linux-arm-msm+bounces-20092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB328CA738
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 06:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866A51F218FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 04:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DE71DA53;
	Tue, 21 May 2024 04:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CI+TuwHv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185486FDC;
	Tue, 21 May 2024 04:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716264566; cv=none; b=nHYXJHnZpOIxV8N8AHOKQd5ihv1sTNstWiyFcewpZAhnV7/01EZmai6tufD9/Pr6Yh1YxaOCWWEVu7eebAkG7eW2t3BtN8T2ssuQ0/4B7hK3shOu6D6GUjkBiwDTobxQDy3w8u91Vp8MyeRqlR8l9nF3N3INb9wHbD1qtlTJOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716264566; c=relaxed/simple;
	bh=G0RfpzHbQbPEMYGRnyOaBLmaQauY+K1fa3zLkroTKx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uO7vJ8DZMeNuEylUkYrI4IrH71pjxBVbNC4siwMDmJZXJeu1AYPCYQA+21GdL8t8/7+aDUZa0714X8K+sO+bSqygbriuOW/RhUVIZX/xMbgziMTnhn/kfipotQho0QQE0yU9K01C2+frCeW751Fy4MiAM50aWo43iEJktMkVrXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CI+TuwHv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44L2aMF2015841;
	Tue, 21 May 2024 04:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iMFmbqJV/ZTR9bccmUFxM94fDgUi8bcxTAUWFmwoJEU=; b=CI
	+TuwHv8t8B3DjGrwIxloD0ctJVkMYEM2hFEwzVL9gNH2Yoyk2Bk28xiQSxRsyoGz
	l7f5PC+jkufTedoPNIugVyVRmNnC6/3XzUUXIGwPWWSv4pDXl1zmLmvkTAlPeSqG
	QhqqaTSM2+LPf/Tu5d/KPDJTO/1ActyDcGrhEf6k5aTTFifvhmGzG6Y0tXyEY+j3
	IX0TpjrQExH9wFEgYXCYinW7X+hxFRh48zKC+2EqHkNNVNXasanDQyZtf50KJStL
	sEJmEHqC/YZUx+4BxevxwxdJCOeQwm6zAL/N4iWONovLu994B02cU7bD2ouGwkjV
	XGTMbkiQTqEZ9klQjUog==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6psncsm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 04:08:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44L48r16026215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 04:08:53 GMT
Received: from [10.110.15.188] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 21:08:52 -0700
Message-ID: <a944418a-1699-44fa-bdfc-2e57129adea1@quicinc.com>
Date: Mon, 20 May 2024 21:08:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] dt-bindings: remoteproc: qcom,pas: Add hwlocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Will Deacon
	<will@kernel.org>, Waiman Long <longman@redhat.com>,
        Boqun Feng
	<boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-5-47a90a859238@quicinc.com>
 <3521519f-34b8-472d-be37-f0e64bba24fc@kernel.org>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <3521519f-34b8-472d-be37-f0e64bba24fc@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lGa-4i3d4YmAMe17lVnHXa2N3V772CGJ
X-Proofpoint-ORIG-GUID: lGa-4i3d4YmAMe17lVnHXa2N3V772CGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_02,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 suspectscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210031



On 5/19/2024 10:36 AM, Krzysztof Kozlowski wrote:
> On 17/05/2024 00:58, Chris Lew wrote:
>> Add hwlocks property to describe the hwspinlock that remoteproc can try
>> to bust on behalf of the remoteproc's smem.
> 
> Sorry, as you wrote, the lock is part of smem, not here. Drivers do not
> crash, so if your crashes as you imply in the cover letter, then first
> fix the driver.
>

Hi Krzysztof,

Sorry for the confusion, I dont think I meant that the smem driver will 
ever crash. The referred to crash in the cover letter is a crash in the 
firmware running on the remoteproc. The remoteproc could crash for any 
unexpected reason, related or unrelated to smem, while holding the tcsr 
mutex. I want to ensure that all resources that a remoteproc might be 
using are released as part of remoteproc stop.

The SMEM driver manages the lock/unlock operations on the tcsr mutex 
from the Linux CPU's perspective. This case is for cleaning up from the 
remote side's perspective.

In this case it's the hwspinlock used to synchronize SMEM, but it's 
conceivable that firmware running on the remoteproc has additional locks 
that need to be busted in order for the system to continue executing 
until the firmware is reinitialized.

We did consider tying this to the SMEM instance, but the entitiy 
relating to firmware is the remoteproc instance.

> Best regards,
> Krzysztof
> 

