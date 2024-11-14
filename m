Return-Path: <linux-arm-msm+bounces-37886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B72889C85FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 10:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AC46285156
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 09:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9541DED72;
	Thu, 14 Nov 2024 09:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iqR4O7gM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CDF1DD529;
	Thu, 14 Nov 2024 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576217; cv=none; b=FVF9xN8GqKC1pVa8de8fYx8xl70I66kfbgG3xrGjHO9Rglo18HcdChoVfBiOZeMb+RLwGBGOsi+5bGvC+k/ZyXlYKJ3bNUyQD1KTS2NVB+H5KwgQoQ5EOkTYJs6ysIL0AwRkE695vC5r9ElO/kWQrDz6j/X0mpfvj4r539qumEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576217; c=relaxed/simple;
	bh=AkLGNV400kAQ639QB4827WuxWndPZZGH0KgWbLVMTR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=V3vcHl+IoJD6z+ZKj/pJtPCzaKNlV5JlpTfYoWbqM1Zsjdlza8SpRbd00g0NxfnBA3m56JoSyoSp3TLzrzghuSYJM7eAnzczgLnaCH03Qy5nGvYD1TyR4SRFjW15PMDVnaa2LyA4pntLGggT2tQe6FA5b+WNRqoT3zO4DKu1luI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iqR4O7gM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADNmR83025101;
	Thu, 14 Nov 2024 09:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4n60gCjwTB4k0vFnwjJ6c9cPHtkEDcPzYJRRyrfs6DE=; b=iqR4O7gMDDdiID1Q
	R4M0ihdBJ/Xa1LlBE5dFeA6GYvHMqcjMGCb5pJAbXXRJuC9sSh/n8UXvtcSnf+2Z
	CoWRu5nT5oJUY/Da+fk7EeslrZE28sRdPbKAgqJc9QCUK6pveaLrov4SPuZolAmR
	90Y+kyLkuh2vvNcA4ep1L0/kUvEte6aBer1Hu9oX5FtwlSRG6tpT6fu+/Fin88oI
	HWUnM+DPdbmDsrPNpyj26i9iuVHLRypwnKfc2mXEM6il0n7vvaxMZQ9Xif1jMvOT
	TnRRAxJ1Y25j5rnpalEbSNKro/QyAZ+yJ1QlLeGVLikc3csNtrot4hXXwbwrmCfn
	uNRu5A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07ey1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:23:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE9NUEr029236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 09:23:30 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 14 Nov
 2024 01:23:27 -0800
Message-ID: <1b405496-bba9-4fc9-833f-6d2f662068ba@quicinc.com>
Date: Thu, 14 Nov 2024 17:23:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: remoteproc: qcom,sa8775p-pas: Document
 QCS8300 remoteproc
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Xin Liu <quic_liuxin@quicinc.com>
References: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <20240925-qcs8300_remoteproc_binding-v3-1-21b0c52b142b@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mFWyoFankoEldcRS3gY8BhGW97J-uxMh
X-Proofpoint-ORIG-GUID: mFWyoFankoEldcRS3gY8BhGW97J-uxMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=555 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140071


Hi Maintainers,

On 9/25/2024 3:21 PM, Jingyi Wang wrote:
> Document the components used to boot the ADSP, CDSP and GPDSP on the
> Qualcomm QCS8300 SoC. Use fallback to indicate the compatibility of the
> remoteproc on the QCS8300 with that on the SA8775P.
> 
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
<...>
> 
> Best regards,

Gentle ping for the patch apply.

Thanks,
Jingyi

