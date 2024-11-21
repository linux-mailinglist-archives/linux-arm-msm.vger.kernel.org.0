Return-Path: <linux-arm-msm+bounces-38605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB389D4740
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 06:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC43C1F21318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 05:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F5C145B1B;
	Thu, 21 Nov 2024 05:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jaybZBP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4E812B169;
	Thu, 21 Nov 2024 05:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732166546; cv=none; b=T0QVBJvvoAxELq3gXdvcRa0IzMdLMA79FCNgg9yrzJz0gDaG2zao2ixQmw0+N1WKo6tvuqSqDmVfw/XC9AwnNzHGHu/lAxLsplVLDlCBPQbvXuyusUZqsD9BfS8ZiNR3dYehLW8PCqhY4LB41BlkQt+RyzbA3BYW0uqXAE/vOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732166546; c=relaxed/simple;
	bh=O2R+Se3YyvXNMKWRAdtvYEJ5Z8PdAdt1UDa7qVQHg0k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kjw54ghHs8WMWZCh440RjGk3a6N8K9ktOFDqqp8seQ7LV/8eatIPkmmkQetnJ8gD68U/7T081EQTgfUDnbn2zdT192/19njV3JNgK3+YaZt5f2Li1Uj06UkghEcQkGHCgvyR2nrACL9cogs3KX6UuTYHU9uCBXqaM2dGovM7i68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jaybZBP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJtuxU014470;
	Thu, 21 Nov 2024 05:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5DDY66amN31GTcow/rxIj+ou
	5DSlmyR7PX6Pd+ZJwzU=; b=jaybZBP7K6fxyT51dSjP0dr9NxFoqN9PFtuKr66s
	GeTvx6AwmlZUzYVzNtyBV+3E7jsFAjXe/Q//ohk3BghysFAj35Siz+kiGtrBa5ku
	DYYi98KfOkWHIyXr+mXK1/sWYxZCOdHW2sq8gkJeftyKGIx0p7SMXnfJ2btNyiIH
	VCaq5alGxzdx51uIPosaOi8t1zFFYcCEdwjPVhACBMu6wt73hODgTwyBNw+20ddN
	jHBOX+jbY6PA2q1nxrBEWoRzZ+7kw82aDcLPDBKwAiu8atMy1NkyxvYgC4XTtn+6
	OssvNId5WXDe4gVJfsAa2PRTlz998znug0i9YvONaqEUKw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y9809s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:22:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL5MKYs024893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 05:22:20 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 21:22:17 -0800
Date: Thu, 21 Nov 2024 10:52:12 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
Message-ID: <Zz7DhDSihJmbmDkz@hu-varada-blr.qualcomm.com>
References: <20241119060754.3350320-1-quic_varada@quicinc.com>
 <20241119060754.3350320-3-quic_varada@quicinc.com>
 <fkpp4ii254ewtmhg2j4nnjarvl7qkvet7i7urr6xhbblcmdb3u@tcbwmfqrnch2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fkpp4ii254ewtmhg2j4nnjarvl7qkvet7i7urr6xhbblcmdb3u@tcbwmfqrnch2>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: diRcvg8aito_3blNMXnP40nf1O-NutPF
X-Proofpoint-ORIG-GUID: diRcvg8aito_3blNMXnP40nf1O-NutPF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411210040

On Wed, Nov 20, 2024 at 02:40:41PM +0200, Dmitry Baryshkov wrote:
> On Tue, Nov 19, 2024 at 11:37:53AM +0530, Varadarajan Narayanan wrote:
> > The 'broadcast' register space is present only in chipsets that
> > have multiple instances of LLCC IP. Since IPQ5424 has only one
> > instance, both the LLCC and LLCC_BROADCAST points to the same
> > register space.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v3: Rebase to ToT
> >     Remove 'need_llcc_cfg = true'
> >
> > v2: Use 'true/false' instead of '1/0' for boolean variables.
> >     Add 'no_broadcast_register' to qcom_llcc_config structure
> >     to identify SoC without LLCC_BROADCAST register space instead
> >     of using 'num_banks'.
> > ---
> >  drivers/soc/qcom/llcc-qcom.c | 57 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 55 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
> > index 32c3bc887cef..106f2619277a 100644
> > --- a/drivers/soc/qcom/llcc-qcom.c
> > +++ b/drivers/soc/qcom/llcc-qcom.c

	[ . . . ]

> >  	/* Extract version of the IP */
> > @@ -4032,6 +4084,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
> >  	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
> >  	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
> >  	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
> > +	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
>
> I wonder why is this getting inserted at this point. The list is sorted
> and your entry definitely is not in the correct place.
>
> Please review if your addition is breaking sorting order in other places
> too.

Sorry, have fixed this here and in the dt-bindings yaml file
and posted v4. Please review.

Thanks
Varada

> >  	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
> >  	{ .compatible = "qcom,sar1130p-llcc", .data = &sar1130p_cfgs },
> >  	{ .compatible = "qcom,sar2130p-llcc", .data = &sar2130p_cfgs },

