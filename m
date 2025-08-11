Return-Path: <linux-arm-msm+bounces-68326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF3B205D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C3B37ACF8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C48D21D5AF;
	Mon, 11 Aug 2025 10:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+aF4Lu9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EC2253FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908750; cv=none; b=Gkc5+rL39dAPgE4g5bKtBJvTi+oCa+hF9uXBDXV3zaE555+NnkaZufC7ffrBP3LCMfUY+MJ8a8U1eOJEauXL5XaDyeE1GdhyHqeKxD+YETOlnVAw4VNxFeo22S638wOf3JucazGw69RJKBSCdJbmdsNycKCfPULGLDf4WvhPzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908750; c=relaxed/simple;
	bh=kdFYH1VYiSyu0VHOBK+SFNLLMYFqZVqZCDcvjsyo/Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4tCurQrv/cUGNoZ9ADtAK9QGclAdvQjExmjKC50z1u06rUKzvy8X/T1cg1Y8hTq4O2tMAhilHqfVsR6ejTCSmJY4H5sci/VrdBIgytvsHtgRzbC8MAAUkzTCElD45BdDedggV3pQqVuKs0yit1Q6j4E6abKxiXzBYMrVMerkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+aF4Lu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9ub000470
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8nAbwc3oA2Tcir9RuGi1mn2w
	n6rS+EOUE2odnraMql8=; b=c+aF4Lu9YR9hMl3bkVI8kdO0Ijf+TeNdiLOXcK82
	r6dwXmNds8EySKqC+OQ5+iTPrW7FioT63t1e6dq3DcJEsc0o83EdErJhDjE50WoS
	bKdl2P/S4IdhgAZokd7fZeMfUzkkYrgf49wdfPN6r7dvOnwZPV8oSOmpOpX8nyZ7
	aBpvT1hfYblJYzoRS2AigbHLtKYa2jJ2W05ze6cJS9NS0FfyXbqixk6wD01jLE1H
	pxwASbeP4pu4kcRBH4snHFrhykcNfIItJZtAsODFyltKDQJvP7dtiee/GFq2nPHr
	WxbkgW/M/V22qOO2B5999AV8mWb/1Cp18sa3wNZz8+0O0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dym9m06d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:39:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b0add6d192so61681271cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:39:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908746; x=1755513546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nAbwc3oA2Tcir9RuGi1mn2wn6rS+EOUE2odnraMql8=;
        b=uQc5NbkzcqWxs+SlUL2kbdeoOSWACeohZJcR6eu7jgLv2nYNfdjhVc0t4Gk4EJ0fgl
         LC5ZmebJOkUJUDYymk/mwWTH3SSrh2VX9d3TqgkFL/CZ7/s5FbVdqMU+mOSIMg1Sg2Kq
         TeEDVXXfmUr6vJ0pl6WCYm+P9Vav6yZ9WZMqwtsJJA+BYTqDjK9AXTaEZZ42wDOqqECK
         UWm/7RN1bjMJRR1EgkRGxIOR4k1LCH2JGn8D22WPCXVlN9ZTHx/SfTVM0aUFnfl+28z8
         Hqu6V9nJk3r6486nr61REffr6xxndVWucMfRKFn7xjDky29KwATDSKQzRwiqAZhDzQr5
         9VRw==
X-Forwarded-Encrypted: i=1; AJvYcCUAtzrz5dbCpiH5BjAfoLadXAYSMnciWhuXiMNgf2DwOpYWYGXcHPGR0uyuxhzOeCZYgaBi8rts/Z+rwV/w@vger.kernel.org
X-Gm-Message-State: AOJu0YzA9UFviSwwwpfa2k886TRLbwOCTBezYH051dh5JWZDhsSvtNef
	EU8g5x1SZXvFkpGRvB8IG/1u9pYSHLR0lsIB6E/QQIJ2OBb2+YU4BoHu3bEO6lL3+UkGChpLXua
	PGcg8IbcpHHpxFg489dohPit6/Z068ndK0WMg+ljPH3uJF/zljAlgvOi1m/RAoYVxoOed
X-Gm-Gg: ASbGnctQxsgvO+wvZhrsV4v3/eWHPlzYN7Z2uDqzg0XSOC/5+z95ecla8btCdJd/VRX
	lc53/cvzIybW8+KFW1+IXZElGc57yJtZHr/SZVf2leWOPwLh1hmahU8MVn2ab+qoyaSwLveI5t6
	oOhmSVmAb1EmFoJSd1QlYgXx7nO3Y5lC+317G6ctX43HmY7Z/HZ6sclFjr09Gwt4J5bPQ1xD/CB
	ErEyWzQTpecBhmhgsELr8B9R2lRIXyyyFy7q3iclU7O0iM1K4yy20E9ys96gdTwLof8uvmqQy7R
	gXjX74LTudIMVILc3mAkvbR/t1HteDHhRkZk81eizmF+EaHEkR0NGL/OG4dpsPm0zqY5uf4LErh
	HSlAJRza/92RR6QDJkQlJT/TpKj8WyJ1VdUOYeqQxbe66JWIpY2XO
X-Received: by 2002:a05:622a:52:b0:4af:3b7:7011 with SMTP id d75a77b69052e-4b0aedce1f4mr140012541cf.35.1754908745926;
        Mon, 11 Aug 2025 03:39:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiBFLWSXP9zPRYzgdj7IXxfYgyXaalDNulEs8SfPCYgfuywaH3NXBNE/AI22m/3gcN9RIVqQ==
X-Received: by 2002:a05:622a:52:b0:4af:3b7:7011 with SMTP id d75a77b69052e-4b0aedce1f4mr140012231cf.35.1754908745375;
        Mon, 11 Aug 2025 03:39:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272944sm38386241fa.13.2025.08.11.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:39:04 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:39:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wenmeng Liu <quic_wenmliu@quicinc.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: qcom: camss: Add support for regulator
 init_load_uA in CSIPHY
Message-ID: <d32cbtfzhwpzsvxpb7esvndpqxooergkzhlx2jp4ikuc3bsaop@gyxnlusuptg3>
References: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-camss_csiphy_current-v2-1-da3c72a2055c@quicinc.com>
X-Proofpoint-GUID: V23VQbLp64AI1wmpUz2--O9mZ6Vl7bQ7
X-Proofpoint-ORIG-GUID: V23VQbLp64AI1wmpUz2--O9mZ6Vl7bQ7
X-Authority-Analysis: v=2.4 cv=YZ+95xRf c=1 sm=1 tr=0 ts=6899c84b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wkYRGT_rTjh0G9-bfQYA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNiBTYWx0ZWRfX9BI7U8ye1hL8
 8jXbGGb4TXWYxYMQct8l3BOB5WaHcrUyWgy8w9Rizb4xUp4eDp7/dVnmoYymPobd2VfhxPmt7dJ
 xF+9xUcoS12LT9R+Fiwqw4rRHU6TwNl8VCMAC54PQbaTImO9WPgd+UXpThiqRpAJAofTyNvms8z
 jmj2jQwKMSr2oEeflrBevbJQCIybcblPDeKDueLcCEAJsLSMtdLi8g9HC2mk7GRUlMoYQva+czh
 eP2fLzC0piO2NOO7IvegtzD+pjEt0G1fqPiXxcit7/hBUOS7VB3OP45Mnv3ECkIcLH4F819UbTK
 jA8a4E4kH9tulrMsJmDK5DKX7UYdOHj65b4ek2s/AH7bWzLK7AQmHv2pZdWXXdJ2YqK4aDP/wiH
 SPRupl0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508090036

On Tue, Jul 29, 2025 at 03:24:55PM +0800, Wenmeng Liu wrote:
> Some Qualcomm regulators are configured with initial mode as
> HPM (High Power Mode), which may lead to higher power consumption.
> To reduce power usage, it's preferable to set the initial mode
> to LPM (Low Power Mode).
> 
> To ensure the regulator can switch from LPM to HPM when needed,
> this patch adds current load configuration for CAMSS CSIPHY.
> This allows the regulator framework to scale the mode dynamically
> based on the load requirement.
> 
> The current default value for current is uninitialized or random.
> To address this, initial current values are added for the
> following platforms:
> SDM670, SM8250, SC7280, SM8550, and X1E80100.
> 
> For SDM670, the value is set to -1, indicating that no default
> current value is configured, the other values are derived
> from the power grid.
> 
> ---
> Changes in v2:
> - Change the source of the current value from DTS to CAMSS resource
> - Link to v1: https://lore.kernel.org/all/20250620040736.3032667-1-quic_wenmliu@quicinc.com/
> ---
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c |  4 +++-
>  drivers/media/platform/qcom/camss/camss.c        | 26 ++++++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss.h        |  1 +
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..7a2d80a03dbd0884b614451b55cd27dce94af637 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -707,8 +707,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
>  			return -ENOMEM;
>  	}
>  
> -	for (i = 0; i < csiphy->num_supplies; i++)
> +	for (i = 0; i < csiphy->num_supplies; i++) {
>  		csiphy->supplies[i].supply = res->regulators[i];
> +		csiphy->supplies[i].init_load_uA = res->regulators_current[i];

Could you possibly refactor to use devm_regulator_bulk_get_const()? It
would save you from this data moving.

> +	}
>  
>  	ret = devm_regulator_bulk_get(camss->dev, csiphy->num_supplies,
>  				      csiphy->supplies);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e08e70b93824baa5714b3a736bc1d05405253aaa..daf21c944c2b4818b1656efc255e817551788658 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -750,6 +750,7 @@ static const struct camss_subdev_resources csiphy_res_670[] = {
>  	/* CSIPHY0 */
>  	{
>  		.regulators = { "vdda-phy", "vdda-pll" },
> +		.regulators_current = { -1, -1 },

If it's unset, it should be 0, not -1.

>  		.clock = { "soc_ahb", "cpas_ahb",
>  			   "csiphy0", "csiphy0_timer" },
>  		.clock_rate = { { 0 },

-- 
With best wishes
Dmitry

