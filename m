Return-Path: <linux-arm-msm+bounces-37043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7DB9BCA68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EE221F2498C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 10:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A776D1D27AF;
	Tue,  5 Nov 2024 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YRIsaaCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F31D1F46;
	Tue,  5 Nov 2024 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802297; cv=none; b=T1LyEuJKomGJhTkocNARF9Km21/8S6Q6d1gTahebf6dx5u6Z8gGypiE3IDI3TKrvi6zBcap49sbG6gTT/osLEP+d5JVVwVyQzYIHjgmtWKgWfmm7Zknlih/yC860c2XkiV9sIIuNCy3FsRWuVqX0HyjGJUCSp5qkcXHC5wlL9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802297; c=relaxed/simple;
	bh=aNhlg/xBCN4Kshu0S8jzVVI53jpGuAiW51JPsPv0aEg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kf3sKlfWNZpSYZC28yW/Uws+KqiRgP3Rjc3AKkVcxwR5BOmiGPovzyOSMehvrSu6DJ59L6+H/SRXtbcFBTbrQ+G+xjn51a7YRRScPJPLuLBM4RmL4NGJXfV6GSOuzaVVXQDEiwFEtVhKYSCcHbL5VAMB3zRUJy+yYK73LCMTkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YRIsaaCH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A57v3hE004697;
	Tue, 5 Nov 2024 10:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J1FdQgFCaGfu7d9q+ECFP4Re
	On+VdB8eOJ9GFPYwjRw=; b=YRIsaaCH21g5dSAb5MuzRj4iou4CXMa8fJWMOwpe
	XCJhlQtrUfDKCdkR4WtA68VGcYUkGA5PVOSBuc+OFzLGGWte/f9F1HNptkIM1CCf
	n5u8f21I/5LvNBmRfdJ4qktxHbHeWs03cUMwf6EXC1g8vP0Kc/lPgvlqLUp/ZudQ
	ZiSLw4w0mXnBqNZZEf+D98vRnwVyOpMHQcs6tOWlh0qOW5vh9vnB/swS+0Xee9YX
	UVcKpSBXyhYjM6bW/sL87Asol96Rg7vu8JFiwvqToahQUTlow6dBUJX0i6aT+7o4
	F3qXKcasnSps+ezsQ7CHGxyNcMcwjTnjhUZZR9v/m5xwYQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx0d5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 10:24:53 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5AOrcl011093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 10:24:53 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 02:24:49 -0800
Date: Tue, 5 Nov 2024 15:54:46 +0530
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] soc: qcom: llcc: Update configuration data for
 IPQ5424
Message-ID: <ZynybsCCp2uvggXA@hu-varada-blr.qualcomm.com>
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
 <20241104073840.3686674-3-quic_varada@quicinc.com>
 <b69a8d94-6607-4345-ad9e-16ffd5dc119b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b69a8d94-6607-4345-ad9e-16ffd5dc119b@oss.qualcomm.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GUrPwQVedjvwuaeUAI82m3WWHbRgZ9uP
X-Proofpoint-ORIG-GUID: GUrPwQVedjvwuaeUAI82m3WWHbRgZ9uP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=799
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050078

On Mon, Nov 04, 2024 at 12:04:52PM +0100, Konrad Dybcio wrote:
> On 4.11.2024 8:38 AM, Varadarajan Narayanan wrote:
> > The 'broadcast' register space is present only in chipsets that
> > have multiple instances of LLCC IP. Since IPQ5424 has only one
> > instance, both the LLCC and LLCC_BROADCAST points to the same
> > register space.
> >
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
>
> [...]
>
> > +static const struct llcc_slice_config ipq5424_data[] =  {
> > +	{
> > +		.usecase_id = LLCC_CPUSS,
> > +		.slice_id = 1,
> > +		.max_cap = 768,
> > +		.priority = 1,
> > +		.bonus_ways = 0xFFFF,
> > +		.retain_on_pc = 1,
> > +		.activate_on_init = 1,
> > +		.write_scid_cacheable_en = 1,
> > +		.stale_en = 1,
> > +		.stale_cap_en = 1,
> > +		.alloc_oneway_en = 1,
> > +		.ovcap_en = 1,
> > +		.ovcap_prio = 1,
> > +		.vict_prio = 1,
>
> Many of these are booleans, please use true/false values
>
> [...]
>
> >
> > -	drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
> > -	if (IS_ERR(drv_data->bcast_regmap)) {
> > -		ret = PTR_ERR(drv_data->bcast_regmap);
> > -		goto err;
> > +	if (num_banks == 1) {
> > +		drv_data->bcast_regmap = regmap;
> > +	} else {
> > +		drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
> > +		if (IS_ERR(drv_data->bcast_regmap)) {
> > +			ret = PTR_ERR(drv_data->bcast_regmap);
> > +			goto err;
> > +		}
> >  	}
>
> This won't work. See for example
>
> https://lore.kernel.org/linux-arm-msm/20241031-add_llcc_dts_node_for_qcs615-v2-1-205766a607ca@quicinc.com/
>
> Which has both just one bank and llcc_broadcase_base.
>
> You probably want to introduce a quirk like:
>
> if (IS_ERR(drv_data->bcast_regmap)) {
> 	if (cfg->no_broadcast_register)
> 		bcast_regmap = drv_data->regmaps[0];
> 	else {
> 		ret = PTR_ERR(drv_data->bcast_regmap);
> 		goto err;
> 	}
> }

Konrad,

Have posted v2 incorporating the above comments, please review.

Thanks
Varada

