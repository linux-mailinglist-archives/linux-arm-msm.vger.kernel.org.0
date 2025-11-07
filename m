Return-Path: <linux-arm-msm+bounces-80687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8946C3E549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 04:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2705A188794C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 03:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611D22D7DC3;
	Fri,  7 Nov 2025 03:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBHaAfNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZNjE/cKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCDD263F5E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762485580; cv=none; b=cF70UVDsHyQkDQHy9aK0Gm/MXyhzpa93YvG/TRrycd4E0+CwzF0aLwewMzu0xQX6NoDMShiuBtnbXURA66S3/pfZnzj4dI4yvQMgxxMk94rbEkcRfM2Kg7QoHZnWeitZ9UEdvdbvAbg2eCGww/SLQskyIylBtVnHMxnmtwOqriY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762485580; c=relaxed/simple;
	bh=fJDNuwwAh57qHVcxO80jNFIvDtORwu03rxT7N4ZqhUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW9uKcw5EMkVuXfOjnPtpgEdvIwV6Zz0QW/WTzkwIM8LjWNYqW7Dqdku3P01tX+Zo54aTELJfVMTCF9VInEgJLzcoWLI2i/k6AER6ab/If976wS8SSR7/Sn30huw/HBqlBrgsjqE4QngOZV7gU6aRQUnktXjIpq2nLuOZ66i3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBHaAfNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZNjE/cKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A71Dhfd1719992
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 03:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BrpjAWiwCyBIR4NqBN1fG3lV
	zpUvOEKnEsnydrbcid8=; b=jBHaAfNABCQzblEMPABGZ6Ayu8XrzJog5gBepCx+
	d6vBKxEi9ASrvsstFwGiM5jziNcsyNixWVSXOvvfTqT2ssIzJ1xMbg4B4uJU1J2l
	3rJlsUgyLpK7kqRPTn5mg3/au8PUDOZukxF49NQd8vt4crfiltFLpyghFZ5m+n+V
	bqAjxvVeLlzX3R9hah2xXNkbxy6+D9AMOOKf7J54dQABmhEYA9XOeTuCmzzh2Dx3
	d+iCR96epD5azDtJaj04sY+ClRIH5GN07VxSJ4AKVJYx2+7UOEX9y2nhXHxjyra9
	IkhtI9n40Lm6Gicu8VxJXaAdE2+gprK5qZZp+m/mZ/DFvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96x0gaxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:19:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e892f776d0so11575651cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762485577; x=1763090377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=ZNjE/cKFT/tY9GF+mNcDe1QDhPGFj106d3oVjEk/FGhGtQAchV6spvjWupULmlwfVm
         g0TesyFY7WBtchE3aP6Pz62mBsN/E2V2rnEUtAoP2yv8hi7AQYH8KppJAAkGJ84fbH6x
         FiXq/uc84TDaiHc12IQOwpgk9ooK4d2xMzoMF8VPXGJnm6zhmrJeLfvTz4ZYRQBPB3dB
         NCUeb6loNEAsx8EwPq3ZAQIny+eMQ0L2kuXRk+i4f41ThqldIWdqhezc27tMGvjOWe7Y
         unmrR51xqfOV4kc3xkwB6xV7f//QlFWaSFicamPGhj+nbG5hnJwakRCLJgWX8GJJOZ4a
         OF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762485577; x=1763090377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BrpjAWiwCyBIR4NqBN1fG3lVzpUvOEKnEsnydrbcid8=;
        b=V1gyY40ibJ9BtPD7cTWUGvZxJBo+KQyTWXVJr+iDxOWpas0HvTil5+wRDLsYbvUt4y
         J5ElR7vU2JKrNGzxVQbTpZZ4v+QO6poHv5CvOcLAUxwp5v4CMz6CgycjgkrhRXLMIbAL
         9zvuO6v9PEiy/cM9tpJBXV96yUqQbNwlJGt9MVY72hKJe38jZeXS9FwXcBVlapScNOG1
         F5pGCibF3VOVU3OkFKL2bB7Bk1wBa4jPmclaFNHIW/1X+7Uo/G1jZsBvpH6puSmqiuP4
         951415rrD+5W91EBiN/65i/vjuwyp4c76kUaw6ssmC3nlQVPGDe5WxW4E262idQpeggb
         l6tw==
X-Forwarded-Encrypted: i=1; AJvYcCUguc53HpzgwG1n3LV+Cnn1KJFN3iFNt2tRvlDwKI8rbQY3hIfaCHdI02byqRjgKtB7nYdIM3aslUQpU+mU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7qx6CsGzNFurXhCBDBMg5i//TmFqzhJfKMZCsKn9dsFcRvY2
	FALoZcrXHTC5JzTd+eIaV+mdNvvkdPURFa5W8yzUd6aiEKdwUfoeEShO951wI7MSi6iXhYW5PiH
	ta0Bz6YFtp3HlMjaDZSC9VuO3qgC/eaDI5T8ZMe08SlIhuLT03Lf31UzgSmiHap2x0knH
X-Gm-Gg: ASbGncvMFLcXpzgc2Ad4oZbFWsnk1xl27LuCFGfDe/XlegzQjZ+XcD0Q5Ybf/gKAE4x
	Gm6L2XwPaKjXwxnFzN01Wpy9/8zqF2Qu6nvM9kYHX2PpbTOzUnx+l4iKS0pQx8E+9Dj2SY+oQhZ
	SQ3A9TK0lmk4h6RgCl33h9iDzrqx8AvLgd7i3orOv5g/qjUSeCuDNLgxCwS8k+gGQDmIwXX58k4
	vBHOA5DPZFM99nznprBsP3pVZus33oeNkCOSAOdPTl2InpOVCoofaSBAyeYnKkVMyL0HGtWRdw9
	tdM3pyFmNq3Sft6y6ITworU39ybmh22odL6jnHjK0NlvoUFSFOQ8OuFaAwZdWdE5e3jViL3J/PA
	HZeZFCvJjmBUFbWYPfkAorJma+C/5M9gZgjWOOz5jNN1nNSfXS4707atohQm/OXtka/6+lDjMyU
	Ojhk19lS71pK0w
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756801cf.16.1762485576951;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/3FjNRKucfvNXkDZbeGXLag2dCvNMAIUYAMoAD/S9Y8MWbIoOna+co2re+tgJ+a1VvKEhZA==
X-Received: by 2002:a05:622a:11c7:b0:4ed:6746:5c3d with SMTP id d75a77b69052e-4ed949432cemr23756521cf.16.1762485576496;
        Thu, 06 Nov 2025 19:19:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a019f09sm1147166e87.31.2025.11.06.19.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 19:19:35 -0800 (PST)
Date: Fri, 7 Nov 2025 05:19:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
Message-ID: <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
X-Proofpoint-ORIG-GUID: bWSPnQXdjiBwutMHId4H8rlmH1bT8f0s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAyNCBTYWx0ZWRfX+KgGMPakcNBb
 2TSKZj62iI9gn5ky0XkbMD1ccbqKdU/gUp4++ob3BrnPS/sgVitlYVPfzswrceyW68nm15/Hk4n
 rNregEFw1oC1fx3xl6EYukoBBF5IwqgR4ND+jxVtzmGZ+UwN7GZ+Ot3n8eECX79fZtHLJYRT8oO
 2/YxAURgTVdDQWX8hJRygW3kBv8yS+hB8zFwKX23vOpMbZX1MZKzDqKIhHXmOanxJawNd9XsgYn
 58/9ikcfgsSf3blqvGGNTApzJOaJiZvVRY3tZpBq5xZrTQXLQ2kP2z481v65XoIBS8vcy0qxIN9
 rdSsDhaYPL373vs4wpnWn2b/+vqcpLzy+7iJyPibsIqS1t48UZ0iWLM4vUPYwixZFTSdHdmFTqZ
 xxkiiqG9nLthciKW4E8HVbEkJ0dQ/w==
X-Proofpoint-GUID: bWSPnQXdjiBwutMHId4H8rlmH1bT8f0s
X-Authority-Analysis: v=2.4 cv=Q7PfIo2a c=1 sm=1 tr=0 ts=690d6549 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=e-unOtBAnIuy2i46bukA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070024

On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on the first OF patch.
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe69688d2..07198d44b559 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>  static struct qcom_pdm_data *qcom_pdm_start(void)
>  {
>  	const struct qcom_pdm_domain_data * const *domains;
> -	const struct of_device_id *match;
>  	struct qcom_pdm_data *data;
> -	struct device_node *root;
>  	int ret, i;
>  
> -	root = of_find_node_by_path("/");
> -	if (!root)
> -		return ERR_PTR(-ENODEV);
> -
> -	match = of_match_node(qcom_pdm_domains, root);
> -	of_node_put(root);
> -	if (!match) {
> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
> -		return ERR_PTR(-ENODEV);
> -	}
> -
> -	domains = match->data;
> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>  	if (!domains) {
> -		pr_debug("PDM: no domains\n");
> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>  		return ERR_PTR(-ENODEV);
>  	}

Here you are mixing two cases:
- There is not match in the table (in which case the driver should print
  a notice)

- There is a match in the table, but the data is NULL (the platform
  doesn't have PDM domains). In this case there should be no notice.

-- 
With best wishes
Dmitry

