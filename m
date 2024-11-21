Return-Path: <linux-arm-msm+bounces-38622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C389D482F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 08:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D451281843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 07:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6391AD5DE;
	Thu, 21 Nov 2024 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SqjSSNUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDA71A7AFD;
	Thu, 21 Nov 2024 07:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732173822; cv=none; b=bJhBmOPRoc2UKp8ASeXglZ9j+QLHlXQUtELv7vsg/+Us81FrGW3sxoAdwCbJZ7DcouTnpQbmB03W3rJIYTc3tFR9JlREhjekqNV9OXk71wAlB9t/WPFewoVDnx0N4BRlPXq4frR9VBXwYD2aq/fzx9K7QOdltl/2ZS87PPMwfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732173822; c=relaxed/simple;
	bh=zr8/hJ0UahcT+StlJNZ1bWAAbNrwX9qz6unkkQiXPbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oJ+qtnFjbcoB8gw9wmbpAOWZQmcV3nlkTau+MU/JwnWMs52HbaACa45OfVOBC76MPLND4G+4rz0eRwTMduqTcZW1v4VzK6znp6Q7sIeLPSTmEeYPlGcwb8Qz2zx1C+jEmVXeGpK1OIOd77hUNdUqasVasVbarwQvhT1NPwOdLKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SqjSSNUQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKZitV003947;
	Thu, 21 Nov 2024 07:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zr8/hJ0UahcT+StlJNZ1bWAAbNrwX9qz6unkkQiXPbY=; b=SqjSSNUQc0YcAVvD
	Tpkg4fDrnW8PtlChUALeRM8oBQ1/Mt3BXKuGhHoWqgOpI2Z8t3745LcVizNNht15
	B/pATWlxMvz6PYdbfnmGAjSP6ndY8VY5jnC4sYwB9mZwcvqoHMMxT0AEBod5v6sJ
	4oiSFbePtZtTD2kDaC03JKGvb3kYJFFZPHkc9AYtnEVdOzL87/yPjaXDA+waVU3/
	uALZFWCks5xNkFV+BzZnjxcRzKJLQPb3Ki54tsbYzKNzNhOr7SDjmNupi1Xsoinx
	7BSMgPGhwZvmDdBYB3flGK/rOZSu0CNNnBiTjeLfFE++Aowtct2y3hFAXUN18sns
	tLo+aQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ce3b2x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:23:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL7NXY1015839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:23:33 GMT
Received: from [10.64.68.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 23:23:23 -0800
Message-ID: <99e9118b-e963-4797-be32-79d96c4f428d@quicinc.com>
Date: Thu, 21 Nov 2024 15:23:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs615: enable pcie for qcs615
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <robh+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <kw@linux.com>, <lpieralisi@kernel.org>, <quic_qianyu@quicinc.com>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        "Krishna
 chaitanya chundru" <quic_krichai@quicinc.com>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
 <20241118082619.177201-6-quic_ziyuzhan@quicinc.com>
 <u6wy6w5yfchbmhyvthhibyrhdp2pmusagxyalcanxvhg7ncbfn@vq6x6iwxtn2g>
Content-Language: en-US
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <u6wy6w5yfchbmhyvthhibyrhdp2pmusagxyalcanxvhg7ncbfn@vq6x6iwxtn2g>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5QCmXwt9rrnKyESKJsNeZcTdcT2IepMu
X-Proofpoint-ORIG-GUID: 5QCmXwt9rrnKyESKJsNeZcTdcT2IepMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=583
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411210056

Will modified in v2

On 11/18/2024 7:29 PM, Dmitry Baryshkov wrote:
> Split into platform and SoC changes.

