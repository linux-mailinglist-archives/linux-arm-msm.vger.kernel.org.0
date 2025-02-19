Return-Path: <linux-arm-msm+bounces-48482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF71A3BB21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F073A458D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 10:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE3521CAA6D;
	Wed, 19 Feb 2025 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YEimXggQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89B1C8618;
	Wed, 19 Feb 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739959227; cv=none; b=YzbfPhVoPmg6m9epABY7FIlWmFV9g/1AVseyDb5LJIo2xjQgEh+76Hq9FBTEtZqHZVvn5gWqpBkgJE+0gDz3mTbr0YBVt8P7RCxFURKO0auIesAGRTbqExKiimo8s5T8YsQPF17c83bnqyDPVxVSi5FPUn8y5aCb57lKYvD4slQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739959227; c=relaxed/simple;
	bh=1lT8J7nf/g2wW/aCR9ySDczadSvjYW+BAF9e0HIam4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DBiAypMAaTo2QxxgE94N7jySmzkeXHOvuzjKlAacm3nWSnCbPcMDqudBE7mLVG77hRxg+lPoWBW9YOq9VbLEGQHYT3YNbtoS4/rJg8yBeYar1kjUQ9NxdWN7ZcihOxliXkgijC+TRKCeVBuF3O29Xgy+MuYXadDYtzd/p7O9w8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YEimXggQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8NILl022553;
	Wed, 19 Feb 2025 10:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cYN8oVWIRJD9p7eESwsiZnmW9EbJkUV3gdGuBKY8MK0=; b=YEimXggQKctp0Oay
	hILMIzzgmvIrPV3J+NB/H/CK3NQNGAO8idEe23DfKe9yKAD3sqH5n4/xVXLfC+TP
	dRCegNLt5nxrEgL2ztxBcheFmCMWcXQ65qR9pJOS5hoD/LpwoW4d86XJEdLZ806h
	1mRMqd78eFUZSc6mor9UU6kyqFYNcIret+MfKg5kIDKrLWf27BzCAvbyn4mzFy4Q
	JiIsHm//VvByUQEnWLenwjtk6r1WDOmVFF87NKZZx5j1iprUfEu9NZYqYRLEb+UF
	UyOt9Prl+W7uhatIQedaAKi91wPUQFm3afhHwvqS8vf8kdGDeBefwP0wGCkApOed
	yJPx6A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3j26c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:00:10 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JA09cW031956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:00:09 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 02:00:04 -0800
Message-ID: <789401a8-7fbd-449e-953d-1571a2d253f7@quicinc.com>
Date: Wed, 19 Feb 2025 18:00:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: Add stream 1 pixel clock
 for QCS8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-2-38a8aa08394b@quicinc.com>
 <6ff25e41-536c-4871-a047-8aec38f359c4@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <6ff25e41-536c-4871-a047-8aec38f359c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5I7WWPchmGvCMqhZK85IuvbgldoT-r-U
X-Proofpoint-ORIG-GUID: 5I7WWPchmGvCMqhZK85IuvbgldoT-r-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=966 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190079



On 2025/2/12 16:34, Krzysztof Kozlowski wrote:
> Your patchset leads to warnings - it is non-bisectable.
> 
> Fix original code, don't post buggy patches just to fix them immediately.

Got it. Thanks for the reminder, won't do it again.

