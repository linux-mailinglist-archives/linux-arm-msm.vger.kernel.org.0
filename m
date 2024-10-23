Return-Path: <linux-arm-msm+bounces-35636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 023279AD788
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 00:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C0A1F239BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 22:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D943E1FDFB6;
	Wed, 23 Oct 2024 22:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LD6svwZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62431EF08A;
	Wed, 23 Oct 2024 22:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722385; cv=none; b=n4DirU8mJsDwevopvyNNdWxRmoKHQQezxm9neazdzTTysnlQ7OnQb7vlwrRzX3YcZRlaVL90qBVMVJCZB6vomg4X4PPBvRAzoJp1UlmcN5bdaS+9/hkMICU7kCCpawP0EPVRYv36WCkoGJSzvHiwj1wexfNSj+djy+cXn76ZpN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722385; c=relaxed/simple;
	bh=+rYygrhoSOc3Knp2xYlAxLQmiQ25V2jPf8SKuiMUiz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dxmkOxWvgn6KSLj7tM+OMUY/xumknFhfwgHGjMNo5XSLFmg9NV48eE/liOyF17Gz4EViP6GmtQtbQzUKKSJiBhxe7XI8iUqlT4St1WGggte/DVHs78tsvdJmg1A988F3HfRLO2RfSDidoynfuqoOCSmXU3HPiHf6te2epXk0h2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LD6svwZs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKTYZX023371;
	Wed, 23 Oct 2024 22:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DkNeeUY6AJ1V+YP4DeUtDk6d5YyyilBFns8lgByPOiA=; b=LD6svwZsmaOfGLe2
	thlyVlCHTSxkyXUqvZkEgLvBmHg85JSMLU50qmM14YJKOupmlGfGpQuXchkG/Ns2
	rrsy4trRI85DTsMS0fE7H2y6YqhSD7eAgb7Tc0oi+CtTVx2DE16MQ+32ux/xH+rb
	qMIYw43KmR1lZYwNU52M6omuVpNCLrD/6rFxLNhc9lGZSjYNp2hMyLScXyOE0JMo
	q8lq2nxlqaO/7IYIv12+z5jKLqXBCtbux6T5TyJRa33ayynwcScTOl5vBYWwdes1
	W8rKF7fJqP/xmg/3/7h/3f69F3yBKAJ33kd2KOOITNVtnk0MGCRST7iK3gpju0qr
	tbCHEQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3ukq51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 22:26:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NMQJsW007728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 22:26:19 GMT
Received: from [10.110.103.186] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 15:26:18 -0700
Message-ID: <58b74ec6-8185-42d2-ae64-c5c40c303364@quicinc.com>
Date: Wed, 23 Oct 2024 15:26:18 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Handle GLINK intent
 allocation rejections
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>
References: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
 <20241023-pmic-glink-ecancelled-v2-2-ebc268129407@oss.qualcomm.com>
Content-Language: en-US
From: Chris Lew <quic_clew@quicinc.com>
In-Reply-To: <20241023-pmic-glink-ecancelled-v2-2-ebc268129407@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4STLd7XG6AQjIag_FPjJMqLZ624narOp
X-Proofpoint-ORIG-GUID: 4STLd7XG6AQjIag_FPjJMqLZ624narOp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=815
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230146



On 10/23/2024 10:24 AM, Bjorn Andersson wrote:
> Some versions of the pmic_glink firmware does not allow dynamic GLINK
> intent allocations, attempting to send a message before the firmware has
> allocated its receive buffers and announced these intent allocations
> will fail. When this happens something like this showns up in the log:
> 
>      pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
>      pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
>      ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125
>      qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications
> 
> GLINK has been updated to distinguish between the cases where the remote
> is going down (-ECANCELED) and the intent allocation being rejected
> (-EAGAIN).
> 
> Retry the send until intent buffers becomes available, or an actual
> error occur.
> 
> To avoid infinitely waiting for the firmware in the event that this
> misbehaves and no intents arrive, an arbitrary 5 second timeout is
> used.
> 
> This patch was developed with input from Chris Lew.
> 
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t
> Cc: stable@vger.kernel.org # rpmsg: glink: Handle rejected intent request better
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Reviewed-by: Chris Lew <quic_clew@quicinc.com>

