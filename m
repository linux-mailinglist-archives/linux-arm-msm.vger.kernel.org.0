Return-Path: <linux-arm-msm+bounces-78221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52038BF9097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09C013B931D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 22:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782AC29A9FE;
	Tue, 21 Oct 2025 22:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jucQht9f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F42701DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761085415; cv=none; b=hGhrF/OmavciubYy1mVADCY5jmb+/MW3MWjGq6lANlpjkr8Un5fwnzE+lIBUS/fjoOgX4m1kb1mePED0q7Egss0syW0Jg68u5DzVNLqHeMA0sArjGRa8n4ULeMrZoa3A3LL551MuG3Lvz2m5XC8ArKp0fGxXLapc8N2AglqD308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761085415; c=relaxed/simple;
	bh=JG8VnzKAlVBeNewJNVx/R4Vpy6m514jw7etJwb/UZBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUM1aA0HkvjhwwQyT4ZAszot6xJfBjPEmbQQtgcF0dQOED6U9SRz6Mvc1BUKlM6h4hoF8YHkqLSQ8aT/ZhPgwX04IkWrOVQ+tCeX9J8zjICqk3xZL1mi3Us0c7Zp+cjvk0NwAq2A2jhWlUZwaTpy1vqmFOBldR0Uu4UEZVVTcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jucQht9f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LF8mNr027488
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wus8JmgsAXWjUXMzjJav1jMo11aQP1duPwm7k9b+OGk=; b=jucQht9fxH7TNG6l
	+JcPAynAkJjRiz6DaEvBRDm8BVHqUC4sB/R9yrfcQW7H1xrJRz/Ka6n0mC+DPdHL
	6GPCNnypF6/DZpbpFwqGUEJPIvKD7HQs7WCg+i1M4S/Y0QWetTXJRq7VO8qdVYc2
	hfIONCQIFA8O1pCK5t6JObseyfKWf0qKSJt1Q79Fog0LZMkUBSJ/aU0sexTra3++
	IM7iXNK11lZnNfH6LsHF6fg4pkgHi8mQMzeGZ1OwJyPskfxJZp7An1ItCdExa5Sn
	3JPgYBmLdPQHeQ/gV5pi01JaCXI+oszVZw4xmq6Pn6qR3LjHBulNZ9GcRkZvNjNx
	aBAk8A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j2djk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:23:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e892acc0b3so13533661cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 15:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761085411; x=1761690211;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wus8JmgsAXWjUXMzjJav1jMo11aQP1duPwm7k9b+OGk=;
        b=NVU+eqr2NPPGqaq/kCaAdvVJG1lkPg0nKlDURf88Dz9m1fwPQY1ryOAuYYLYuXedyj
         3GCD0WPeKFEDuhx37vIQl9g5Q+eVWsoICRaAzL6ZVuyxyKFJL+/fYajXDbEOh0cHcUd6
         +pQ3h54g7x9FoFL1/FOACBVtBahixNm6ZIDKm5I3IwKzyAxXlrN4gorimjphSUxhpyUt
         Al2t0nSzbblsOmI6zAVb5eHGzBGhlwm4WutZBGDD2H9pa2ArcjQp9M/wdKPa96BVtDyz
         K+QHCjpfJhaBR2pN9vUzgC3fGoqEnmDdbdzmiJ+sfoHmHQN6F9vUp/zX6ncnYuAbmYEm
         nOyA==
X-Forwarded-Encrypted: i=1; AJvYcCX0OWX8SNOJr5K7DdL6ykRqCqTFNwpF2DD2irOkBSblHFEOri3aDKsdp3CwrPXwCtVvllVi59yu9zUtF2QT@vger.kernel.org
X-Gm-Message-State: AOJu0YwT5g7TvLJobOX0EfHV6+6eVUtKOUy4rd85ffspcFwM+jACnjwt
	aBVppQyZjp5RYThjjkrxr7zrDfkmZDqY5pzNRCpjwDpQPqAKdAqNZSxmhkG2GNVdegKzyQV6Nko
	9TsPwWKlvnfsJrL0MXn1q6b9vNPW9glDdSFIZORl76ufaAZfOmPvE2IBkh5yDSVn0kQyJTsXbS8
	lE
X-Gm-Gg: ASbGncswOF4NF/k4M3B1RGApzM8uvHTLXbd6Im61AonSC+HJTSbblRMGyU1xWSPjU/7
	+Zkpd6LhxlzP27JBZ+AXaiVn1mB1ubiUx1qcmCFDy96exKJsVzTPoH/6kGYeljvi4uChiWCsN7o
	Ti9HusJd/cGsFwDTBCGn3x3kauEt7dvwjXo4hUINhpbtTQxJHuSACnNiEPRAfkcImr3SIdjMP60
	yLuVKxKJ5DtmwZAlOXvgDoU9eImPr+RzELB5OLXJHVJ/XuOUQTKip9Ux2SCa5o8j0ed3ZaGepx/
	Q0PG2xbSWi8qR0lLqhjl0HLz+zGHI0DmJOIsgYpHpHSqa0XVpiC31aWV1QnSfRPUIB+STFQvgWm
	L96smaxuMhf5xjx9dnoul8bh54WMN4UCMyCRI1fr2yd1/7Gf5mtrCyt0ViJ3c7XvZ0QYDz5RXrI
	5s1dVaXOy+t7Q=
X-Received: by 2002:a05:622a:143:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4e89d3a34aamr229968931cf.56.1761085411226;
        Tue, 21 Oct 2025 15:23:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOGuRhdenAEHOiCX30SHoTS/93sxx8PeGMSCJmiucdiQyyxiccNMJ5ybqVzLO5AnNLs2GDBQ==
X-Received: by 2002:a05:622a:143:b0:4e8:9ca2:b9ea with SMTP id d75a77b69052e-4e89d3a34aamr229968691cf.56.1761085410769;
        Tue, 21 Oct 2025 15:23:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def167fesm4034740e87.74.2025.10.21.15.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 15:23:28 -0700 (PDT)
Date: Wed, 22 Oct 2025 01:23:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] regulator: rpmh-regulator: Fix PMIC5 BOB bypass
 mode handling
Message-ID: <on4zcfs5qdaekc7teo2iq6vpw7o2mp6yiqjkbznxo7wcxgutj3@nb35f55fkugv>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251022-add-rpmh-read-support-v2-1-5c7a8e4df601@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX3oqlITlAV7aP
 Em4udHYvKi7dIxGqycSFv0K4Jkku14WDkSIsX2fCKqr/samuZ6TbdVwGd5vruMKnHOw51yLjo4U
 +akcQzmMmutPGfGE0n0IUYjvkltO0DIO4X9LLCTMpM79l5t8h4JjwoHKBWCJ6P7tITB+J+pc5yY
 P4RDUdBn3ptrI1g/zijB32jIHVKlpvxTq8iPOP5DKdTJAe+KU8QckTsAeW5VN2WhW+P0JqkLJEz
 VRQHQ3KooZPWgjw7XHiMpmyvgvsAScYIn8GvoLfh7XVibAOpLgtK3uSGmO4ziU6QExV3xRteyeC
 yKx62qtSVCqdEbJ/F2taqXG70IfRk6GHm5wfu66vDAlAlzSlddlZTgmSSmlIvBM5CvggUAX+s0z
 spS6pF7xfQNi6uX9pK6qRl144Fko9g==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f807e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=vkhBuKkrFEIrFZnKDE8A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: hcFpdZEGzDyUVuKueWsPZgU0G4-FtFQ0
X-Proofpoint-ORIG-GUID: hcFpdZEGzDyUVuKueWsPZgU0G4-FtFQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Wed, Oct 22, 2025 at 02:38:53AM +0530, Kamal Wadhwa wrote:
> Currently, when `rpmh_regulator_set_mode_bypass()` helper function
> is called to set bypass mode, it sends PMIC4's BOB bypass mode
> value for even if its a PMIC5 BOB.

The universe will end, the Sun will explode and Ragnarök will be upon
us. Please describe the issue, why sending bypass value is bad.

> 
> To fix this, introduce new hw_data parameters:
>  - `bypass_supported` to check if bypass is supported.
>  - `pmic_bypass_mode` to store bypass mode value.
> 
> Use these 2 parameters to send correct PMIC bypass mode that
> corresponds to PMIC4/5 BOB regulators from the helper function.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 0a561f1d94523bf479f48e8c2062f79cf64f5b5f..947fb5241233c92eaeda974b1b64d227d5946a59 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -111,6 +111,9 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
>   * @hpm_min_load_uA:		Minimum load current in microamps that requires
>   *				high power mode (HPM) operation.  This is used
>   *				for LDO hardware type regulators only.
> + * @pmic_bypass_mode:		The PMIC bypass mode value. This is only
> + *				used if bypass_supported == true.
> + * @bypass_supported:		Indicates if bypass mode is supported
>   * @pmic_mode_map:		Array indexed by regulator framework mode
>   *				containing PMIC hardware modes.  Must be large
>   *				enough to index all framework modes supported
> @@ -125,6 +128,8 @@ struct rpmh_vreg_hw_data {
>  	int					n_linear_ranges;
>  	int					n_voltages;
>  	int					hpm_min_load_uA;
> +	int					pmic_bypass_mode;
> +	bool					bypass_supported;
>  	const int				*pmic_mode_map;
>  	unsigned int			      (*of_map_mode)(unsigned int mode);
>  };
> @@ -310,10 +315,13 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
>  	if (pmic_mode < 0)
>  		return pmic_mode;
>  
> -	if (bypassed)
> -		cmd.data = PMIC4_BOB_MODE_PASS;
> -	else
> +	if (bypassed) {
> +		if(!vreg->hw_data->bypass_supported)
> +			return -EINVAL;

This is redundant, the regulators which don't support bypass should not
be using rpmh_regulator_vrm_bypass_ops.

> +		cmd.data = vreg->hw_data->pmic_bypass_mode;
> +	} else {
>  		cmd.data = pmic_mode;
> +	}

Can we extend pmic_mode_map to include the value for bypass?

>  
>  	return rpmh_regulator_send_request(vreg, &cmd, true);
>  }
> @@ -767,6 +775,8 @@ static const struct rpmh_vreg_hw_data pmic4_bob = {
>  	},
>  	.n_linear_ranges = 1,
>  	.n_voltages = 84,
> +	.bypass_supported = true,
> +	.pmic_bypass_mode = PMIC4_BOB_MODE_PASS,
>  	.pmic_mode_map = pmic_mode_map_pmic4_bob,
>  	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
>  };
> @@ -975,6 +985,8 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
>  	},
>  	.n_linear_ranges = 1,
>  	.n_voltages = 32,
> +	.bypass_supported = true,
> +	.pmic_bypass_mode = PMIC5_BOB_MODE_PASS,
>  	.pmic_mode_map = pmic_mode_map_pmic5_bob,
>  	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
>  };
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

