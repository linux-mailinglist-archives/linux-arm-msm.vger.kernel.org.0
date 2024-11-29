Return-Path: <linux-arm-msm+bounces-39559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F39DC1FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 11:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 215E8B21163
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 10:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F167C189BA8;
	Fri, 29 Nov 2024 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L+KbsDQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFF018871F;
	Fri, 29 Nov 2024 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732874964; cv=none; b=f3viOPxtT8tlUPsbogZUWFlFJLpU+yWytAIS6MOg9jV61RLzOZ+lS2Lw43dHcYCVxnTRRXKDpUA3H1IMnBLNaOMNDhpXqmdHscxipEjdtaNMARMLf8ZFY7YpIwU5wHtIRB1G0Zk22rqupwvEDvW+1alYE+m1WqVJnd4OOihsz5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732874964; c=relaxed/simple;
	bh=Z8SNdp2ZHeQvOgBJ7HFc+XNtSnBCbLBSA4Q1Fw4NcmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d4EfEODpQL84HN1Y66CNbvmK3C4BZrrzabQUjA0vHixlheGL0NIIE/oIYXEgENaL9qwOXRzoKX7SDaaoHsxX0NGNkDZ7i4+wzCJYLqCwPqE/7nFG/+V+ooEDEb6voNxZSPew454/xSR/IpX54PZ8W2HRrVOHoCFZA/g2jwIdFJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L+KbsDQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASMlgBB000409;
	Fri, 29 Nov 2024 10:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3EG/L0w96RHJGaT0NUhLKqWsFaz54juEmpm/S1SYB/I=; b=L+KbsDQOtbRz8Wc/
	wDESm58YXfAQ1nz/Ra/UeQBWIbT7AJE+To0y/lWJQC/7GYzoH5d57amiLKCP+tZL
	KEfVg0IDstg30i4vwZQYQi+PWVPvgNiH33dPNc/fC/B5/OGH6/ml7hXNBSqeTO7a
	2sA8S/V587/H7902tgh/o642lLK8/4r+xRPtHRS0uHqsQEqMZpj8dKtj4oZBEVqU
	IG4jIStluedRwIZ1ZFWOOoJCLafgZqQRK8I2oSFp7NDrcyYedmEL4LGVPdAJQwl3
	wK/UqZZahmz5cnsCHBuMuDpBNddrLiXW1PGSiQpV7RJ2jJi/oqs6OxuwB2h/tpK7
	p21wTw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xvn5qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 10:09:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATA979l026533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 10:09:07 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 02:09:00 -0800
Message-ID: <db3aef25-07d3-495c-9f10-ca08e4e4ed5f@quicinc.com>
Date: Fri, 29 Nov 2024 18:08:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: phy: Add eDP PHY compatible for qcs8300
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        "Ritesh
 Kumar" <quic_riteshk@quicinc.com>
References: <20241127-qcs8300_dp-v1-0-0d30065c8c58@quicinc.com>
 <20241127-qcs8300_dp-v1-1-0d30065c8c58@quicinc.com>
 <3729bdcb-5f3d-4845-8f96-dbb0616b88f4@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <3729bdcb-5f3d-4845-8f96-dbb0616b88f4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L7mUXApJfYPtRlOvYNn8u4IqV_60xJ35
X-Proofpoint-ORIG-GUID: L7mUXApJfYPtRlOvYNn8u4IqV_60xJ35
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=997 clxscore=1015 adultscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290083



On 2024/11/28 2:28, Krzysztof Kozlowski wrote:
> On 27/11/2024 09:15, Yongxing Mou wrote:
>> Add compatible string for the supported eDP PHY on qcs8300 platform.
> 
> 
> What is supported eDP PHY? Can it be unsupported? Anyway, this repeats
> the diff. Say something useful instead, like why this is not compatible
> with sa8775p.
> 
> Best regards,
> Krzysztof

Actually,for edp phy,it is same with sa8775p, so will reuse it's driver 
in next patchset.so this patch should drop it..Thansk for reviewing.


