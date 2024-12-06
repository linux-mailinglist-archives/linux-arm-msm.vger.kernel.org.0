Return-Path: <linux-arm-msm+bounces-40772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CB9E6C76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3064116515E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681091EF08A;
	Fri,  6 Dec 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="igEsb60U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CC91DFD89;
	Fri,  6 Dec 2024 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733481848; cv=none; b=aHzcy9lkLr7AuyDBdhyfNit1KRDAG2XT239g96ZTe5Xs/G9w+E5QJZKGJmtE9ytj9RxcjCWE3sSV3JMiHIFLXWKu6nKj3a93VwkTqC1PAiUhoC0FrexXdSPWEF0vf2O+0y8z+jqUKgbQK/VDP+egv94yYtVZiByW+/i0rQ/Tcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733481848; c=relaxed/simple;
	bh=D5NwxUYd/7Gk33lOmB/SZAd5lGLdnHgSUsTAhuNAnEs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYDDw9il7D7vwmGinRCgV4Vx7m7WykGXczdPWPDkKISM0IWCUe41gpp47qMJuUA/Ffrj5sRVQgvY2xgH3nrUDMkBVUnVeSGscD5ZKSmH2Bbg0ay/Ee9v3eRmybf8o6Kf6zTwkeMVcTF4O5PxTWjro9Lq/CjicG/17FQlJS8Pj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=igEsb60U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67lXcC007445;
	Fri, 6 Dec 2024 10:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ijNIPLgbGRllGx1qPc8GZ8yk
	5hMbtPgQc4xhg9JkayE=; b=igEsb60UR0QfOFGHEHAYBb61dXhNTSyJPCNPjk9n
	mYpK7+qKbWmM/EHh31LNZvZw2TBpS0yufFNKoggHGDJqkKGxxct5rPhMuiaYfo4z
	hpmdDLJGrbSpgY3Xdu1KX02/Zo15HKb4HiC+oCCg90h0VWUOXtX0tmS1MI1BRz4Y
	u1RGkRFwSnJwRJaJ/JLsUQ1jrEMzpXmRfLZfkOshgzmBPL44O3+RjLl/Xt7Jci5l
	FZCGr5CHsVdbe6J0mixolBZ7M+yIdw7fdNTJBLd1b2y/2EqAtMT0XzspqLegIfzZ
	sKHOVZ+U6jp/GaPvjsKtnBn7ASVyDP99G3CbzmevPkI9ww==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ben8as2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 10:44:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6Ai25c015507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 10:44:02 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 02:43:55 -0800
Date: Fri, 6 Dec 2024 16:13:45 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 0/5] arm64: qcom: Add support for QCS9075 boards
Message-ID: <Z1LVYelWl3sPPHcD@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <7f52e0d2-0934-49ca-9c7d-4ba88460096a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f52e0d2-0934-49ca-9c7d-4ba88460096a@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bwC6cpYf3EE9U_JLXHPBYuHAmO2s6oRE
X-Proofpoint-GUID: bwC6cpYf3EE9U_JLXHPBYuHAmO2s6oRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=695 clxscore=1011
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060078

On Wed, Nov 20, 2024 at 05:41:39PM +0100, Krzysztof Kozlowski wrote:
> On 19/11/2024 18:49, Wasim Nazir wrote:
> > This series:
> > 
> > Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> > 
> > QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> How does it relate to qcs9100? Why this is not compatible with the
> other? It looks like you duplicate here a lot without trying to make
> these built on top of each other.
> 

QCS9075 is non-safe while QCS9100 is safe.
Reference: https://docs.qualcomm.com/bundle/publicresource/87-83840-1_REV_A_Qualcomm_IQ9_Series_Product_Brief.pdf

Separate board files are needed as thermal mitigation changes are
required for non-safe variant only.


> Best regards,
> Krzysztof


Thanks & Regards,
Wasim

