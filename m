Return-Path: <linux-arm-msm+bounces-41140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E19E9E2B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 19:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D04C188848C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08585178368;
	Mon,  9 Dec 2024 18:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PNSRFMnv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF787080B;
	Mon,  9 Dec 2024 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769452; cv=none; b=JxAhovBROzDu5zmFOl415GzRdA54C/8hfH4RIn2jia6z/Fqgw2ik5Vhfm7yP0ROyKA3sBgTy5n2yY53D4q4QF6u4R8GQHbxe7wLFJQvzS3hYbUNjy14iONE9LzD8YmhyIR/9MXr/HWbB5Oy24NvI2nl4XzqS+OQK7XF/R1HbQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769452; c=relaxed/simple;
	bh=sdh/pKCPulvsYk7s6zcfy6YYPGtMjxgbQkbbF/rlioE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8jgvwJfE2W6zDN2nQ0FFiGNmX2s3IWJXDfc0iLW23OmpMb3V2opFa24MLhyZb2N6LSBNTdqKFRAq5QO80KqrKzwN9GO6V/j+9r2Q2NEd7r4eA+eyikV7RWVk+HC+2jBJXn5YwDjSNnK+XwhuxIFM/OZHE/IUXm9em6r7w2JtoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PNSRFMnv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Aeavm025562;
	Mon, 9 Dec 2024 18:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eSt64EjpXHkGT6hboROcLtUd
	nqbF3vn/huz5rZLzQ7U=; b=PNSRFMnvgehX1EMFuSKOj8kweLo+TuIXELGtFYIW
	4b8Kl1LxwWylY4hVeX2XyveVQc3L8FM7P3J5ao7hkM47lFcK/PfZmFJU2PNqxgQh
	TFj9SBqMx63hLgLC7GAOpsZChwoYkiQ/aRMzblA1YiOqWBgPTzaUwxTx0HrB18EC
	HlYa7DesfTWHUvd/ttonnDct5wMGrXSEzPl7kAs01l8ZqhD+U3CpfweCYIbZGSta
	HV9Isgnf5LqwBw4Urr6cWmnSKszqAXRvla/KeJm5hYlSugBTN6wIahbQE+JJBGQk
	DbcObqMGQY9B4TNd9rOMloQJmpFxStolEBphNdRoXbDWTA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cfhkdpd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 18:37:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B9IbRtZ001925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 18:37:27 GMT
Received: from hu-wasimn-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 10:37:20 -0800
Date: Tue, 10 Dec 2024 00:07:10 +0530
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: Re: [PATCH v3 0/5] arm64: qcom: Add support for QCS9075 boards
Message-ID: <Z1c4sIX0QNufi6xe@hu-wasimn-hyd.qualcomm.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
 <7f52e0d2-0934-49ca-9c7d-4ba88460096a@kernel.org>
 <Z1LVYelWl3sPPHcD@hu-wasimn-hyd.qualcomm.com>
 <cpxuqo5luqqk6wtk2d3wqsbchq4awrmna4xoye3klatrzu4j54@axbgklv6kdqs>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cpxuqo5luqqk6wtk2d3wqsbchq4awrmna4xoye3klatrzu4j54@axbgklv6kdqs>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ujV6k_xjMjqYmY_kd6ZM18jUeyYhy5J1
X-Proofpoint-GUID: ujV6k_xjMjqYmY_kd6ZM18jUeyYhy5J1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=775 mlxscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090144

On Sun, Dec 08, 2024 at 07:46:55PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 04:13:45PM +0530, Wasim Nazir wrote:
> > On Wed, Nov 20, 2024 at 05:41:39PM +0100, Krzysztof Kozlowski wrote:
> > > On 19/11/2024 18:49, Wasim Nazir wrote:
> > > > This series:
> > > > 
> > > > Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> > > > 
> > > > QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> > > How does it relate to qcs9100? Why this is not compatible with the
> > > other? It looks like you duplicate here a lot without trying to make
> > > these built on top of each other.
> > > 
> > 
> > QCS9075 is non-safe while QCS9100 is safe.
> > Reference: https://docs.qualcomm.com/bundle/publicresource/87-83840-1_REV_A_Qualcomm_IQ9_Series_Product_Brief.pdf
> > 
> > Separate board files are needed as thermal mitigation changes are
> > required for non-safe variant only.
> 
> To reduce possible questions, please include those in the initial
> submission.
> 

Sure, will add the differences in next patch version.

> -- 
> With best wishes
> Dmitry

Thanks & Regards,
Wasim

