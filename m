Return-Path: <linux-arm-msm+bounces-22391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F88904EB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F12531F26604
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3720616B72E;
	Wed, 12 Jun 2024 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cm03KOGy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8217E167DA4;
	Wed, 12 Jun 2024 09:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182935; cv=none; b=g3FQAyui855gLGBWViUAcNCgZK4FBGDUTJ8pBD3yRkzF+xVq/DRZChP2ZI/DO/JaRTJ10FoiGgnZ5vvUTwRr6zFzcKXEeGEXIgA6+RWq4XV6iACN0JJsknm+cy8jbUlOQGVNRmm5u4J20D5Jwp9Gu9dDls3yvOdiy0ylRKgs12s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182935; c=relaxed/simple;
	bh=By4U6oI5iE3KlrH6uUwBTU+MUsELXOgNmHJUvOqfuGo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxeN9DkBGXLU0kURCPQqLLCf7AKfHdAk7X3k/n/LboqFVN6vW5hDlkW4vl+eRH6LKT1JjW4NMKdjklCbYtsVGIAXKnuszfqVg2YPd1ZH6Ul7UBEswWbaxwEiKnZ0yQlsYqcHHoVal+fmUtQdX3fjowQtcFm0mMYKEKTKaIjh+ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cm03KOGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BMLxfm005154;
	Wed, 12 Jun 2024 09:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rAbIaxLTS1iKWSpxhIV7XTew
	nJIEqvXl8VDxjd0/DZ0=; b=Cm03KOGyrogmpngVXlnwHzDsu24ZRfl7A1OxpOj1
	IHzwfBlUpmvliA2OcfBDKGMtVi4wAZDVNUkHY8/EQIhf9/v2CSUzWuTBWV6GN+S9
	Spy2+IvpQIYbhWFjecmbdek/jjJYLSEwV5r6C7OmdsLlAFWTs9LWqrK99/2CBC6o
	MKs864HfOqfsXlRNdw0JjFxG+IQuIsSvAcRwiEamv6kcDsg2fn+N08bt1ZnYAiTf
	sy0aqPkTj2dHhBc0EFru7SBImhjj2U2mPfi8/mnLI9WqToO4IJT6GPa8zQNy4fq+
	Ace/oZM9fMGABhkaqY65XsLji5jPGuhCPBNyvhTempsS0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm45axyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 09:02:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C927lB032528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 09:02:07 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 02:02:04 -0700
Date: Wed, 12 Jun 2024 14:32:01 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Komal Bajaj <quic_kbajaj@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qdu1000: Fix LLCC reg property
Message-ID: <ZmlkCfvqpjSmKd+S@hu-mojha-hyd.qualcomm.com>
References: <20240612062719.31724-1-quic_kbajaj@quicinc.com>
 <20240612062719.31724-2-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240612062719.31724-2-quic_kbajaj@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -NrGtWmiZQp5yK75CW8Ne6w2g327-eou
X-Proofpoint-ORIG-GUID: -NrGtWmiZQp5yK75CW8Ne6w2g327-eou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_04,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=554 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120063

On Wed, Jun 12, 2024 at 11:57:18AM +0530, Komal Bajaj wrote:
> The LLCC binding and driver was corrected to handle the stride
> varying between platforms. Switch to the new format to ensure
> accesses are done in the right place.
> 
> Fixes: b0e0290bc47d ("arm64: dts: qcom: qdu1000: correct LLCC reg entries")
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>

Looks good to me.

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

