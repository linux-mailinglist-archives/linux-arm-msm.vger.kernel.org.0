Return-Path: <linux-arm-msm+bounces-73307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C07BB54A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764561CC7914
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E732EBB9C;
	Fri, 12 Sep 2025 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GQjW8HmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774F2EC0A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673775; cv=none; b=fTffRXK33iGlNPgl0Pvnx6b7DjAQsenO28Borb4x1MdkS6kJzEjAPprJ9dI2hWvrWYP0nWm91qY3N6xxnw0WyD/jGguNWzcIS2Gd8Op4img1C2MyCFhbSm6KaENZSZQXEbkcaUR12dL61WcMt1qxSz20Luw+aQ8epXKDw6I0LgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673775; c=relaxed/simple;
	bh=IMLCJrcDQgvMvqR4DGILnlQl2UQFLswP3J/VhzhTtKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkSAlNPCaU6fHvAHmYOwVyDObeMSCy/PnLhve7Gft/UPhBlkYENCNEHU42RrG3R6CsncnCA15OMgqs+iYcOIab5cJ0nxI6dIZslazcMeTp0mpb8o9Dk5wS4gBVi4Bn93NKqdhDIyVtycR1kBXjhL+/B3js/SCIMNrFriPoh4sD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GQjW8HmI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJ0K009053
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tmYj8o/t1vex4Px+MD+gCX2U
	CvHxt1dgbQLo/nWIiZg=; b=GQjW8HmIki9icNT1gdLF4cGqZwRgsCl53xJuS9Yu
	9IbMPHlyD40imdDMbcw3uSHzdLk7F3WgcNYQUjtYYpkZccjxvcvi8uul3CNtWfhe
	DTW7SnSgqJLvD3FnvuDcm3lJIjgsG6mTVn0ZtT2ZUAfbKq8JOU+5owxZ2fMR1/mf
	fyxG57HDuUI0InyWg0+OrsdXe94iztWIJ64I6LeESBNenh1RSDbYGp6PNXFhEaaF
	w5zwcoOlcBY1NQwqM7U/A+Yg4r9Cjq9AR/EZT7x4QbOadsDi9bi0NcJwxPuoyM47
	7UlbLJMbYYrEZgLNA4mUtKtbeF1VfEl5x4cZtQ89DFgKLA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj136pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 10:42:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-718c2590e94so63267786d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 03:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757673771; x=1758278571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmYj8o/t1vex4Px+MD+gCX2UCvHxt1dgbQLo/nWIiZg=;
        b=QoK8rLnm7hhf5IfDu7YawzZh/Zy7tOasODskjIAWBO/g0SS1PWO82LJRA3ReI0dj2Q
         V9miIcEJbR/P/a3xmvunnNzk1Wo4TkE10W2P6EfhL8l91Fqk+lBGwff0vyB+es8iBX42
         zlAXMORgR04zP+gl5tlh/Z9FTca/+WB4Iv+z48zh7xW7tWuSRnYYgH/FSN1QwKT8EVyf
         nsvmn0PnKbR1DolQibc3qKkbHkao1XOFdGmkdhYAxQGjBziR4m/NzdQmR9/c3Drqpmc3
         +tVjRD+iQ+J0t0OuULyEbrBfi8OzG8O0ZH5YENJT0p7NKRC5KlEke0GTh9M/cE63zqLg
         N7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWIRtNA4xzC8qcdKJXfZGHGT1mgVHlwRcZH040EHbIkVYo3vpfCD+KhwVTD7qvga72XWddK38kgWXOK/FA3@vger.kernel.org
X-Gm-Message-State: AOJu0YwdgWkHhGWmC3VHqbGoes02cDNHVxsvtMOhI8MJbXaj2X/Cq9Ii
	fE+wUCH3kNZHa7maDMSE3rOCQD60IkvYTLZS2ANUdE9r3bXOirbl7hWhA6+tA6hXMTk7GYD5A/k
	+IUA4uR2PI0XrdBscJ/kBs1pQSMQu+auruPnLlC0yWyCOFSV6k4LHIUe/oZB/E0KGzsxc
X-Gm-Gg: ASbGncsKa+vn5ILRlnT4K7FX6iJoQ0g8O23gnQTqt6Vur7s9xD8jFz37qgOpPH3SH59
	fH1+c7+opj2AwokcibZkUvDqeDomKgeZKmEM4ecrQM8zdSUBRpFa/5mbZaG63d5pnX4g6BGgvkp
	iuKYuHAJu3ulJf/uZuN/jsWwKO8pCYDXFIGW5gSetXzfUc+gkMFnPWI13aTnqp9LpANul0BOa9l
	xBJbrCOdKrCFSJ3Otfl2YWeJdm9bHA+X1o9g6/3eEXgtKKilDuacYeV3ZXhBjTqyfEl1qn3BOch
	CA/YqQAcQQEp6t2KUHDPK6oh9rd/zpK4V+2iGYJx3c6gFlv+7OeeWCfDOei+y6om62qtf/FQjZ/
	zqVzTkIhlQt2pxnp4jNHHtJmRQ7Ku9o6oMhP+lAjoBUOEL6qIvwzZ
X-Received: by 2002:a05:6214:c66:b0:729:1a8e:bbc3 with SMTP id 6a1803df08f44-76224bd0051mr77315756d6.16.1757673771394;
        Fri, 12 Sep 2025 03:42:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ2QmS8xdGEbDL2t/HPuGI8RfYY86H09ePtFLONg3tM736xe3yZrmy2xCP1EXPL4YyRv692Q==
X-Received: by 2002:a05:6214:c66:b0:729:1a8e:bbc3 with SMTP id 6a1803df08f44-76224bd0051mr77315476d6.16.1757673770919;
        Fri, 12 Sep 2025 03:42:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460ded0sm1080496e87.105.2025.09.12.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:42:50 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:42:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 13/13] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <oex5463riqvvyfyntxcyissaznnfsd6xogcniqouqcn6yokgwu@dwhje4i5inj6>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G56m3NCluWQBpQomIAS0FVRoR03nQ3j3
X-Proofpoint-GUID: G56m3NCluWQBpQomIAS0FVRoR03nQ3j3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXyTVmJF1d8WeF
 H4tuC+XLcS1Wn4vuYU+U3Tgww1iTgbI6Vghvik0bXBJ5fUcj2Zce85/eafFxMPQ1/Fj2z6GKznX
 Yy6VHwmliYQhfyCk9Goq4FqLuBjgHJ6UeevH0HkJ2hhMucKcAUv7x9CBMLXArBWJHL/k4TGaoNG
 NzcKXg8o8HzYxve87KVlAyixG6kQO35BJHspUPnpVOhihEqeWsIshHtYGEKMBUNcZ+I0Cjntpf/
 p4X/6mhoA5dv/1WYHnmxPorsId91NL37gqrO8nF/uJdnXJqKKxhqPzsljqp0jE8TEV7vc9rXjH6
 Oo/JBaqc8/7uCu6LNlcSJO4jl8w+scFSj65F1aOpQ7O9Fyjv+/xa9eq+cqokzXpnlGKZRYgdU4M
 GobD4j3D
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c3f92c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7XclI0hbOSOr8FJszFwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

On Thu, Sep 11, 2025 at 10:55:10PM +0800, Xiangxu Yin wrote:
> QCS615 platform requires non-default logical-to-physical lane mapping due
> to its unique hardware routing. Unlike the standard mapping sequence
> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> configuration via the data-lanes property in the device tree. This ensures
> correct signal routing between the DP controller and PHY.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++-----
>  drivers/gpu/drm/msm/dp/dp_link.c | 12 ++++++++++--
>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>  3 files changed, 16 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index c42fd2c17a328f6deae211c9cd57cc7416a9365a..cbcc7c2f0ffc4696749b6c43818d20853ddec069 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -423,13 +423,13 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
>  
>  static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
>  {
> -	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
> +	u32 *lane_map = ctrl->link->lane_map;
>  	u32 ln_mapping;
>  
> -	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
> -	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
> -	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
> -	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
> +	ln_mapping = lane_map[0] << LANE0_MAPPING_SHIFT;
> +	ln_mapping |= lane_map[1] << LANE1_MAPPING_SHIFT;
> +	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
> +	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
>  
>  	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
>  			ln_mapping);
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index caca947122c60abb2a01e295f3e254cf02e34502..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1242,6 +1242,7 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>  	struct msm_dp_link_private *link;
>  	struct device_node *of_node;
>  	int cnt;
> +	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
>  
>  	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
>  	of_node = link->dev->of_node;
> @@ -1255,10 +1256,17 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
>  		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
>  	}
>  
> -	if (cnt > 0)
> +	if (cnt > 0) {
> +		struct device_node *endpoint;
> +
>  		msm_dp_link->max_dp_lanes = cnt;
> -	else
> +		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> +		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> +	} else {
>  		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +	}
> +
> +	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));

This will break all the cases when data-lanes is not present in DT: you
are storing the empty lane map instead of the 1:1 lane mapping that was
in place beforehand.

>  
>  	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
>  	if (!msm_dp_link->max_dp_link_rate)

-- 
With best wishes
Dmitry

