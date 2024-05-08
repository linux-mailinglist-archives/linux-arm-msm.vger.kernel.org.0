Return-Path: <linux-arm-msm+bounces-19492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D778BFADE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 12:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2D024B22A7C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896BA7BB1A;
	Wed,  8 May 2024 10:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RsKRnsHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF053F8EA;
	Wed,  8 May 2024 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715163978; cv=none; b=sEomKJBLZbzxP9ezMVTKwNX263rn1jSq5BBEdZO4CKRQfyzl3IuoreKDTAq4xjs3TRjlaj3Qj/UFBr9WNHjremA71g5wltbmLcZIGzmQCv/dj5rM95zh3/64xI0kxUZs9VkfnO9FcEGj4ngzdPSICFkDemvinJs+XLYzloGmNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715163978; c=relaxed/simple;
	bh=nBPYVzAx9cwxVrnY92tM2LrRfb8Bv01mZKVT04K9/Zw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUijnobKcn5PuPG1h+4+mLizI1SCIveDPTB0Xaw6t6bwF0iItNO+sAmLquK5xvvxPSnuy11UROduwGD6qA8kZPH2skzl2J8nIkmmG/eArV3Jo+MDmA6ZnJyIR1eK1RpW94VN1lDOiyW0jQenj6HX5vG3D1xBASSbW9wuAYddD2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RsKRnsHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4485sG6e030188;
	Wed, 8 May 2024 10:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:reply-to:references
	:mime-version:content-type:in-reply-to; s=qcppdkim1; bh=oZqiy5EI
	HXwaa6yWe+iTtCq8Qn4x3Fbym7S9/w94myE=; b=RsKRnsHLsepu+VzERfK65x+Y
	cgAc7L8zNeygpmPyhLRlt774qLaVfEPlDuI0RpES/+eHOeUqmRGhRdhXUK/b5Nn8
	3NqQQO6aLrXnjq41CNQRgaX5vidVLjg6V5rEo3zAJ7Gp8rtkRy9ihFZahNTeyxr0
	UQcdj4u64y/2lDTLfSWnsJiYxpbkVVX/DgfRID6j5i68XqamTrk3tVKmZBv6BM5F
	+eG6Gwn8IijGOkawyfHwB4tUg2mM2epk5g++sPS13rzX6VMl4EJsVrZvRdBvZ8bg
	V+erhe66rQ7k7N1uxFLl0RBFt8qSH6Ar23X3br2/D3DLNwONIWADl+nIdY9SVA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y01tc8pyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 10:26:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448AQBqN027013
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 10:26:11 GMT
Received: from hu-vvalluru-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 03:26:07 -0700
Date: Wed, 8 May 2024 15:56:03 +0530
From: Prahlad Valluru <quic_vvalluru@quicinc.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <andersson@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nankam@quicinc.com>, <robh@kernel.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Message-ID: <20240508102603.GB28609@hu-vvalluru-hyd.qualcomm.com>
Reply-To: <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240507163045.28450-1-quic_vvalluru@quicinc.com>
 <a32fa81d-bd70-4dfa-b512-e2adce4f8c35@linaro.org>
 <9a48b0a8-d1d7-8e2d-dafa-47e136a46c99@quicinc.com>
 <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0ac82gOv1vV_Ozv5JRODn8kSEUF2BTN4
X-Proofpoint-ORIG-GUID: 0ac82gOv1vV_Ozv5JRODn8kSEUF2BTN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_05,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080074

On Wed, May 08, 2024 at 09:38:50AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2024 21:20, Abhinav Kumar wrote:
> > 
> > 
> > On 5/7/2024 9:35 AM, Krzysztof Kozlowski wrote:
> >> On 07/05/2024 18:30, Venkata Prahlad Valluru wrote:
> >>> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> >>> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> >>> Bridge supplies are Vdd connected to input supply directly
> >>> and vcc to L11c. Enable HDMI output, bridge and corresponding
> >>> DSI output.
> >>>
> >>> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> >>> ---
> >>> v3: - Updated commit text
> >>>      - Arranged nodes in alphabetical order
> >>>      - Fixed signoff
> >>>      - Fixed drive strength for lt9611_irq_pin
> >>>      - Removed 'label' from hdmi-connector, which is optional
> >>
> >> Please respond to each Bjorn comment and explain how did you implement it...
> >>
> > 
> > Yes, agreed. Even though it seems like you mostly just agreed to mine 
> > and Bjorn's suggestions and decided to implement all those in v3 , it 
> > would have been better to explicitly ack them or tell why you agreed or 
> > what went wrong that you had not done it in v2 itself to close the loop.
> 
> The problem is that one or more were ignored... By responding to each of
> them, I hope they will be finally read and understood instead of
> repeating the same mistake three times.

Agreed. Will make sure to acknowledge the comments.

> 
> Best regards,
> Krzysztof
> 

