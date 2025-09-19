Return-Path: <linux-arm-msm+bounces-74239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D40B8AEF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 20:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA8D41C833D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 18:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708F92571BC;
	Fri, 19 Sep 2025 18:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOTSP/1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16192571B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758306962; cv=none; b=PFXnNEs6KJzxotrQEbaaFbK+OggSE3C9xLFVJk35GOYV7z+xXy+aZA3OlB0wKCn03VZRTyOO2t5pZSxz5kcgyysNXSoYy3t2ER1yikiJOFieZwWVgXFS7iwTGtbGjbUDI2oaPOh4ZOf2TngeYYCmBIJl4I7+kGqmXwFPzx9M4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758306962; c=relaxed/simple;
	bh=nsHDFCSLMbfUoLiMn5Yiz27+9m/uyIT+Ag5Qqg71p3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6CljcERq1ME3EuETJ5sVaJDq/0/E4kUul447Vj2EokMYq13XDKhQkK5J1hdOJQJz86EO7HPGEaFK8Yz4yDDf5yBdfRJF6D8S255YK2OBAguEVUWouAivIUEgxldym7WRZXDKqbVIsO3PeZLyHL7Hnh63+5XA3YvzgXjhPHs63Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOTSP/1S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JF8GC6010757
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hTmf9magk+DlWQu9tHn8bu4Z
	O0Ceo1+biZ46108Y4Yo=; b=cOTSP/1Si9D8QIE7AZqfda7fhE13dZtI1sZzIZFT
	zYGx41Ank5l8RvlgRoLsqWYTCbYrU3ZgYxixZS+G+qpL8MwRT/9hZEFEc30xNEo7
	Q2X4/XnGTfzqY+ajRCBlrf1/wN8EcUazYFJJBN9/FU+lUTsUX2VL81OqA3wAKcfb
	r4MYeljpxHsumH6XSPoZB0X6Zp86hU9T4+P8RHMwHG+nE67I7USju7p/BdWE89Oy
	JGuxTBlck+IhYwjo8ew7QJICsSmFG46x0BtVzpeqkEqwz/y87QUxDGcWU/r+1bVy
	hDizSpU/ePmsmeX4dHbh4MQEOQDcwqycD2hbIuWpsMexHw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy3e7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 18:35:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-792f273fd58so38701626d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 11:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306958; x=1758911758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTmf9magk+DlWQu9tHn8bu4ZO0Ceo1+biZ46108Y4Yo=;
        b=OW0XW3TDThLcDyZmP83z4oyEYfa5RAzt7+fYJpys8enIed5ceXzRpznnTdh/C1fW+8
         VUNT155USBwAzqBP4bYngfLNibbl81qtU9Rdp4Mzwk38mIhKUuEU+JSYV9SpVviK8G9L
         LXaO84FpBl4SE7SxhaGVedf4HrFNiGYK9vvd4hk4zXOUA0fLaqCqfCBgZU2wwzZJeHS5
         8ppS7DcdfOp23RTi+pnx4lcmEUptc55CCR/mWOacH5HKXIRZpiZZFi29jTQiSaAfi5g5
         Ooml0cTEcv3+OH+7pYobK41kU03yv/uy7jqu5Bmw0vJ4JCNnUsMOalnd6DwesPBKX2s4
         xfVA==
X-Forwarded-Encrypted: i=1; AJvYcCXIJhKYhsnaA5sIc/L48/x6BM0mBGMb1tAZqjip1IRQYw8yQ4hzrDsyMSjp4VP+0+bFKbAZ+HL/oKy84lP/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5OQz8tDFJoROcuNHYDJ+cepYnb0uLez0teYFxFR7zvSyHLgIT
	sxnPgYd2PWanr9Ie5f/s1jDScS0I4/1i4T094ptIJC6XzwGhcxyBvMH/1whs4pbewNdoDe62wl6
	UYudQpg/TCak/cmYmj2gtT19A/FPxtJc1fj9ORDEhmo93lgsKlpm9VCzc7JbKdASuwIk0
X-Gm-Gg: ASbGncvjAJOQ4Blob9yiaJU1lDOt+Gv1P8FJFb7mVJGYMffAZgUtGjPoRjPgDVR2fxI
	Rakz73vvk5lyO+eVi6HaC/NJznOAgoDqOXscPBcAkf31e8j/vxkaG5H9XKjkwW7pWDkD3oBWd45
	9u6MI69fXF3Jv9zLUF1W505oO6FRc76fXtGsciakj95Yzn+SI/YqVxr5mmkpjwPp0QKUmeAIkT5
	jGAVtQ/MUzbFBSHb4BL9I/c1sOyzniEx9565YuvJVngxG0F0Jzr+Er6soPxu0srjfrpzfnQ0vWe
	xKMdj4i1wHvgunllpG+ns4wIPUiqj6zlqNPFe1+AsHSe3kapF92wiOgOzh6on/D2oJUz23PsSBz
	tx6d+vC2qPYljvE9XNO9cudFcMXAGJGqHPpsVdYZuajTEYlpi49ef
X-Received: by 2002:a05:6214:e6a:b0:794:518e:b176 with SMTP id 6a1803df08f44-799129826ddmr46888826d6.21.1758306958348;
        Fri, 19 Sep 2025 11:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOqy99Klf3VfxARITMXbbN0KY4DghVg+miJJ/vqzrCYCaw3nxehJtISCH41+5KegCo/Yw3Jw==
X-Received: by 2002:a05:6214:e6a:b0:794:518e:b176 with SMTP id 6a1803df08f44-799129826ddmr46888316d6.21.1758306957787;
        Fri, 19 Sep 2025 11:35:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b3528c49dsm84989e87.134.2025.09.19.11.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:35:56 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXzKgZa5UI86h0
 SM8ekeAJg+FBb0BylFIyeAYe2FQUIFpLEwMMmF6nn4s5bQN/NhT1e9VZQ7TOd5Hez3NTIDF8/2W
 Vii1PqYmgNxtohs8/rumdnlLlM/vpnJzBZwQMj3UX6W5mM/V7imKqz5rkDHUMayxVqFMbJ7ctGZ
 cQg0f4i0Vv8IeV0Sevvgz6USSj64C9wSk7cgvYDFf4VlXrjg3xK3BQv6gdtayOlG1fY81MNlxv0
 bOtLZILOPqvxyFGQR0SEBrcymQXXO8nhUYNwFecXdq1TWz/Yk+0X+WtqJK8HWDdEgZ/myNiIw97
 7qb7WBtom3M7Eiv6IfDUW04SPs/8+1nnZVnbXThXv59hrVOGHbmxg75u3muwAIft3zNvuXNCwpr
 8kBJHbHT
X-Proofpoint-ORIG-GUID: -v_MNRSdkg_paPkUXJMSrfUTm8TWUbfa
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cda28f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QVMBky1v5tPz4CN-K1AA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: -v_MNRSdkg_paPkUXJMSrfUTm8TWUbfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
> QCS615 platform requires non-default logical-to-physical lane mapping due
> to its unique hardware routing. Unlike the standard mapping sequence
> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> configuration via the data-lanes property in the device tree. This ensures
> correct signal routing between the DP controller and PHY.
> 
> For partial definitions, fill remaining lanes with unused physical lanes
> in ascending order.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>  3 files changed, 66 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>  	return frequency;
>  }
>  
> +/*
> + * Always populate msm_dp_link->lane_map with 4 lanes.
> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
> + * - For partial definitions, fill remaining entries with unused lanes in
> + *   ascending order.
> + */
> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
> +{
> +	struct device_node *of_node = dev->of_node;
> +	struct device_node *endpoint;
> +	int cnt = msm_dp_link->max_dp_lanes;
> +	u32 tmp[DP_MAX_NUM_DP_LANES];
> +	u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
> +	bool used[DP_MAX_NUM_DP_LANES] = {false};
> +	int i, j = 0, ret = -EINVAL;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> +	if (endpoint) {
> +		ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
> +		if (ret)
> +			dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
> +	}
> +
> +	if (ret) {
> +		ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
> +		if (ret) {
> +			dev_info(dev, "data-lanes not defined, set to default\n");
> +			goto out;
> +		}
> +	}
> +
> +	for (i = 0; i < cnt; i++) {
> +		if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
> +			dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
> +			return -EINVAL;
> +		}
> +		used[tmp[i]] = true;
> +		map[i] = tmp[i];
> +	}
> +
> +	/* Fill the remaining entries with unused physical lanes (ascending) */
> +	for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {

Nit: i = cnt, j = 0; Don't init loop variables at the top of the
function.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +		if (!used[j])
> +			map[i++] = j;
> +	}
> +
> +out:
> +	if (endpoint)
> +		of_node_put(endpoint);
> +
> +	dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], map[1], map[2], map[3]);
> +	memcpy(msm_dp_link->lane_map, map, sizeof(map));
> +	return 0;
> +}
> +
>  static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
>  {
>  	struct device_node *of_node = dev->of_node;

-- 
With best wishes
Dmitry

