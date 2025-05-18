Return-Path: <linux-arm-msm+bounces-58300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 829BDABAE8B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 09:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A9233A4EED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 07:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88752AD13;
	Sun, 18 May 2025 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSKAIqx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457120125F
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747554983; cv=none; b=oDeb5RtXmVeexsGZn57AdhibpvOBMFFoG3K+AC5T6qmpH1jFDdcvc2uIhEfpygZN2yc35zRgPYSZTQcoUdAo3sJDUW4lXc3tqw/h60MlTnK3FCU3WVI9nIs25Y78cCvHd0Dn8Qa5T8cgaeeZPCfNbnt4iJ+C3rU4p+FyDH4lsMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747554983; c=relaxed/simple;
	bh=TypqOtyFA8AbcPYkm1pEiww0iQ08v7Ub4LB3ElfD4JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2aDntDYdt9mQnpVIJghaK1cGY2enz/fkA6QpHNbP6tiA7cA0B2zBgNHeWTsBeB4VwgEchOY+cvow0lU8luQ/ZCbrvw0Ct9XPgy4LU7V8+9z2NKht2s5T13BWSusu5dXu1+ED07E7ZylzVUJz6W38X3ViFeAFOcfHps7/4BfUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSKAIqx6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3oJax015514
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 07:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Puhd7PmnW0WSgSmOeAsf8uMA
	ZRQ6dmvIBZQDY3wBh6g=; b=CSKAIqx61zUOYZ7ENbuO6hqwA62onT0OY1XdoEar
	5JyhphppQJzyfAVLmJEjw8FHvxViNrQKvGHgI586kYVRQprMDCrWl77rGL2nCSA8
	av2+sDPum0QrY8VxuC+Ty2T0onHQ9uS/oU07s/mZx+evrd8tgNV2oUwctxpxv0/z
	3Fuhvbd6LiG4gCFG4ETi5m40zAoxAVzBh/QhS8xjpPR4rNtmXLH29lSUOMHBD2At
	qI+UVTxhUjA1/tzLemRw4Lc2/ooFaCklh5ivblZCldUVk6eWSzBDH6wLfBf18VjS
	AYAvGJHV09YeJ8wjlf5CCUqkoDycAADCKopLriNOqCldzQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcspxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 07:56:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so60380116d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 00:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747554974; x=1748159774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Puhd7PmnW0WSgSmOeAsf8uMAZRQ6dmvIBZQDY3wBh6g=;
        b=oI6yP9etbBPIFwZRSiqFBGjtPf+zA+WEQ/7Sw9w9CdPtzy9dUVyGR7X6qWc0Z8uhsA
         /CYx4pArkhaxHVvF/Za/tM4YRF58Ev3iW/dOILhzbafoiNYklbe2nr+AwjNHNPeBJCjG
         ceITa3EnfxfSISa8RXpRTmRP2LfzMR0hCEbLbGEloIAVbyyzw0BuZZ/yYYWnUHe/rEj7
         xFk4gyyQUjZGKJSdkFrnHB/oXUr5Ab+sq9dUjJkrwWO35GNsbag1iNZey3TFgefVFR8H
         WCgHQgkwxg8HPd+XZXVVz+cBZ8wq0RMsWq1Z6we+AyzejfoKGKWDbON1qkIx9WI2bcMQ
         5DDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJVAsNavDDsE55ffWAE9fL+IMFfhpQyMql4vtb6JHuToid5CE2Tb0C/mQIgAJ65rn836bc4A2JBq7z7K5P@vger.kernel.org
X-Gm-Message-State: AOJu0YxE28C1GlDvWfqP0vbgDrAoQzyNl1S11QFYtFHj7k8wNLg8muPp
	6+Liu08kYmxJSfgF0rnQOP0pysGzFN0uhGKWEmn6evpK6Sq7eax1i6eavAZYAkaBaaBPTm63AEs
	PrTRPS5jn7rZduqKsjRvJTxCWJMABQhFbMCEwS6N2SKtp/xNaoMX1cQNOVl1E4XdNVTCT
X-Gm-Gg: ASbGncsJFEjHFtF/Xou3YDP15jNWwJjqk0DPS7dGW6U4hUwcrQfbX1++nNx9UvUUSpF
	8hhVVXipMPGscd6yFtb2SnnviJBu+4gZoM4BLS8nYsce5bz6Q/zw+r/lfYsVYyADaIBlDaZmmjH
	kBM+qywlyO+woIm51H/EK3Mo6PT5PITtacpKgE8E13itztm19BvRQL5mmdzvNnLMpbIGRbpciHz
	+/SpJO0J0+DETAbPsUPTGCxQZ+7C6caNrDsUiAdUwqLJefRNPvcG1kdIXdzSWWO6LEM6C23+eN5
	ID8ZXdbbN8mmLth7dWQupVRL2LzgVz2It8ewAzZxQumZfb4KRI8dy2ibQJZXqAzKodbvpgvUEdI
	=
X-Received: by 2002:ad4:5748:0:b0:6f8:d14a:f793 with SMTP id 6a1803df08f44-6f8d14af9demr20836156d6.21.1747554974249;
        Sun, 18 May 2025 00:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO9KW1Szyg2ZNSjl+g7NrsOk0wUp6Z9zSHUEFCyc3cVLmsoQFZn/Qng43s08yf0QasbtkRAQ==
X-Received: by 2002:ad4:5748:0:b0:6f8:d14a:f793 with SMTP id 6a1803df08f44-6f8d14af9demr20835996d6.21.1747554973918;
        Sun, 18 May 2025 00:56:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b8823sm13563781fa.65.2025.05.18.00.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 00:56:13 -0700 (PDT)
Date: Sun, 18 May 2025 10:56:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: qcom: camss: csiphy: Add 14nm CSIPHY 2ph DPHY
 v2.0.0 init sequence
Message-ID: <kbslqkoqvzt44jnbendevub7qjxwa3sjazemomcvyafyxa5fqv@ytwnmvl4qb7g>
References: <20250518-qcs615_camss-v1-0-12723e26ea3e@quicinc.com>
 <20250518-qcs615_camss-v1-2-12723e26ea3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518-qcs615_camss-v1-2-12723e26ea3e@quicinc.com>
X-Proofpoint-GUID: xzqOJE01C0U__rwoxsoxHqwHhffLWrJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA3MyBTYWx0ZWRfX3BGRhLMnsiNN
 h9OLHyW9S+sOVDdPEmHnzxaDuq2JH7OQuy5rTvQSYnnQsnycPKqFIazLLIfyRf89j620HcQMTC3
 LOfY0rSvUW7jIkX3VSWZYjJ0JmeZqameeBCNFrxdz4SwGCY+jMkrqQg1xNA/zzghv84RlNfOSFd
 qy6xQ0wbqU8f3ErqKZnOUFvhysyEYllKsHFWHbp/Z2ms2Y1iOyWAtVmC5V9BM0wAl5lahwY39+D
 3234SVrmO/gGk52OMib6+XdetXXjdUDogsbMyra+U/syDp3w9hKM+h/IysuNx43hCOZLUZeEaDm
 RHNrGcD3pZv68Jd/TmOUmfslReYqhKytSfV6Nsa8BmqricK87N80Qj5/cElp3RKBI8r6ZwufLgz
 vXKGv8kk1vQUOKw+zpUvlMSXnpmZvRjy6O6fc0xvHskpeNzarbZz9hmst2mHeBxyabuoHmSP
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829929f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=HcpNNPQB8qcH3S7Z6I0A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xzqOJE01C0U__rwoxsoxHqwHhffLWrJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180073

On Sun, May 18, 2025 at 02:33:08PM +0800, Wenmeng Liu wrote:
> Add a PHY configuration sequence and PHY resource for the qcs615 which
> uses a Qualcomm Gen 2 version 2.0.0 CSI-2 PHY.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index f732a76de93e3e7b787d9553bf7f31e6c0596c58..3f3d875b8a74ee8f6585bebd29629bdb16eadb28 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -64,6 +64,86 @@ struct csiphy_lane_regs {
>  	u32 csiphy_param_type;
>  };
>  
> +/* GEN2 2.0 2PH DPHY mode */
> +static const struct
> +csiphy_lane_regs lane_regs_qcs615[] = {

You are adding an object without no references. Most likely it will
trigger "unused" warning. Please also reference it from csiphy_init() in
the same commit.

> +	{0x0030, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},

Lowercase hex.

> +	{0x0034, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
> +	{0x0028, 0x04, 0x00, CSIPHY_DNP_PARAMS},

-- 
With best wishes
Dmitry

