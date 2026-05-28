Return-Path: <linux-arm-msm+bounces-110123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACX1JvhHGGr2iQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:49:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4E5F300F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A92F31B9ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD853F6C28;
	Thu, 28 May 2026 13:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgEcujT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVd4yQ9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A203EFFDF
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975771; cv=none; b=EZr31a+Qm5Eup01AaZmUqAfTZ2MKuLktMe2Jwi5YxrlwiVIn240r1d3fBl4FXl814TBq4eZQMqnxR/DdTP/U3dgjX6XhRDlJNicacYeXGojHtTqAz3fRCqW4fN3GGWD+KJK3wkwnMkUZDAFquig4AjR2e8xTgRlINYRLKYDLVds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975771; c=relaxed/simple;
	bh=X1yvQOHHcKIqW+0JMUmRIDNrnij+vlvJkT6jzIaN93U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANz8LGd1DRYWoNk8qwtHfVb0nk4hxwoXRgtZk177mF0ofGXq8RHuVmlB6p6Ne0nTqtsFGXUVU0E2KmiBJXc7HswyYgBZi2+/InpXjIINj0CS3lTlRt0NZApsr1In45HxyLS5vge+ywU7UEW299gC/2l5RQoUWMIYDrjlKWziGSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgEcujT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVd4yQ9U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vb1H566553
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uw7ADZQk/DeDxbVXK+KsE/yp
	H8Hb1Yi8tUS3qSN/21s=; b=pgEcujT9E/TW2UD1bidW6DPcQuGBi9hU/OTQiNjV
	c2higF5Or3wquesgxePN80VUrGE1TKAaCbFCDuBWO0LGgSOuayJmPBh/Yc0QBp2i
	BYDvjBntKGVU446Ddwxk56f+6sQTxkB4dH0SodVcp3Xym5ZzLql6A3hsl4gLNd68
	ZZ9PQSfCifrFEoy9JVsssM0cjf6OM2RJfbnYX5xs+llJZAuhFAJZJ+Cn3UNO73h2
	Mz7Y3hGe/vLgjsJL/FwnNv9bLz4x9NCAnnCH5FH5jzrHzzbRqPSDvvICHIjBbHQo
	Xv0+enoCcYmG/1NH37LAUhoOxKucdTDggV2t4kFtm+px3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynjwmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:42:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5165d10e036so226622721cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779975767; x=1780580567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw7ADZQk/DeDxbVXK+KsE/ypH8Hb1Yi8tUS3qSN/21s=;
        b=QVd4yQ9U0mPIaRJq5PQsaio/tcwlTvlpVDHa5L8DMefakMeVcXPiZsuP1JYyLVTcDE
         WUdAyj0wv3YQU+n66fsccF6c0POZrsjKsRrcOrsXU5LpVoHmQtmkVcnkeuZOnDGOXO3/
         pj1Hq/V4iyNPFg8kW+CELrU66SqpiiRYQJC4Kx6VaU71wnLRFZ5ZXRsaav9qnqs0Qha5
         4mE1ooVOFidOVG8++MqE4cZkTUt01ze1OH/TFUwn9vHsE9DTTpxd0ojO4STaUmmYtNCB
         Pru0eW6aevv6hx18bDXmv1XtWB/SXoxZQPeI4pzaGWFxvPW6uMiDAHI7ehm8n2N0/De3
         XJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975767; x=1780580567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw7ADZQk/DeDxbVXK+KsE/ypH8Hb1Yi8tUS3qSN/21s=;
        b=sc9D1I5qHsJEPxAL+lZN5ZEnVZbk1lhk7ef0kIFOcb5HoWz8rauK4X9swjpYp2Yr9S
         U+kModlQQSuYZ3pTrIj5sZKLgsH235DIbTby/X6hg6dHisCosYmpoukhvWR/rRuw7GmJ
         XWf/gisd1qTNNk19klQDevnqq4LzY3+zceeVqTVlWge1Wn7Bg73vwHvCuIaPtlVIik1h
         lD0wk+uLoI4pNg4/b9tVfusomvlgqtI6jLYNw+Y3LZRYzlHfJGMgZ28YoDAouLB+SNte
         mRgNpF74iogga1OTxAYQgvQTuU8HGPXBz/2zeDAtbu/L8fbLGNPJ7dFKdGkPRZkuDiA1
         pPOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IKYj0qm6a7XObxGYP1QZvq99A8aGHpMTmV3DpLIv3vWQjpxU3CLyJDsDkMdm4H65Aa8zrbAFNwfn2Dojs@vger.kernel.org
X-Gm-Message-State: AOJu0YystMVlXvhcIwibrjVdnoX9BKbQd8CGUelsZ07IMa/XkHsQTRH0
	I3SlEbe45+FqLfy2V75MCx6yIFlzUP6IoXR29lbExTGJcciQk+u4ZgS09Cg56KrKQfc2L04ffqu
	fh0g0siKoeIkXdB4hmb3frDMAh54YxRw5iWLuu4U+dMwahT7hVF0nn+dCa0E554erAYWW
X-Gm-Gg: Acq92OFlEgjB4pWXQzqavvs2zbHauUEPi1C1LET84wk/7IAlqzcpcdetCuD57Yhy89J
	f/BpGIzDzttxpjBezddOUmGcMw2YNzzAZk8yxKLv39McZJVsQaUgg6piI/ogqPYsD7XJeHml9o8
	NdxSz6podVd9mbT0lWizw7AphtCrZRCDeiPei95RUNcIYfuw8LCcYYCuhXn6FnZXTe95mDHTRGJ
	7t7XkTrN0bhcRI6H5UJPTrBcHXPcd2rRLt/hlwW82HzLWiKTxfd+XWeh9w8Wclm2jUHwcnyU58X
	k/jRoYw05qIE45WWSClLlgm25ZoKZ/Sli9UhZ4QEuNv4xNeI3WNFSMDk7KPfXm8RY+Mol0MEMsd
	zOK5kBJGuxWOzFfQx1RpSquQiC8/e9Y7Wm5VZAR85xqX5O9yb2VdQUosluNPq+bCWGkEMrK45vL
	GcHlGPPqfZ6M2udgwwjZiA+rKwKKNmoMf0K3SWVviYaFY5aQ==
X-Received: by 2002:ac8:594d:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-516e0622067mr306191831cf.51.1779975766918;
        Thu, 28 May 2026 06:42:46 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-516e0622067mr306191291cf.51.1779975766442;
        Thu, 28 May 2026 06:42:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d967sm1962643e87.83.2026.05.28.06.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:42:45 -0700 (PDT)
Date: Thu, 28 May 2026 16:42:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for
 Qualcomm Shikra DISPCC
Message-ID: <qumelrcom3wxzgcibou6vmw2jc5tushr4z2tvmudflgpiqin7w@raf436u5gksb>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
X-Proofpoint-GUID: 4pcOOKQUJojZkgHOY51R34xSE9L6HWMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEzOCBTYWx0ZWRfX4xg/MQpJ2zmy
 s03dl4tCc5VFa43SZsww7r8sJHDs/Oz9hhkGRpYT+AOMo49zSWpdrUDoRQYH4YVCJCTvznqLxJm
 DJBUExz3Z+MJktTq7s12cVvIWBrYXF7pyXyXyHgCTkpP6xpC3v3WdWry5ZQM5s8DS9ghHTkD7nm
 pjp99PSfIGEQAgdvO10J5tBi8a29K5mL/1FtzeUNa4kYc4PmZ41pjfYsIrrnmTJRPJvSjzn0PQz
 1Qg2iiPd2LnwLBAhbGXzrc1MZMjIsbkCjx5abmu4qA+ayZZWpzwWuyUl4+KofoMPiS3mgvg7+p/
 mO76ldEy50HXv2Rz87C4c4JKku3MdOBHIu/nNP1fCIKQpN9npn5WAiroFePJmCxVEWMB6b7aUhy
 aLUe5xLpJ5RrZb1tf+zmIhmQgV3mPfQxyNzQG83JeT5yEwBnjlTU17A25d0czPv+XC/tXPYKoxa
 qLueIbJg4Poj/oCh5HA==
X-Proofpoint-ORIG-GUID: 4pcOOKQUJojZkgHOY51R34xSE9L6HWMz
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a184658 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wzTQxFFrBE7TaT9E-pwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110123-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39E4E5F300F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 03:37:05PM +0530, Imran Shaik wrote:
> The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
> but has minor differences. Update the parent data of mdss ahb/mdp clocks
> accordingly to the hardware clock plan and correct the GDSC *_wait_val and
> flags which are applicable for both QCM2290 and Shikra SoC, and add the
> support for DSI1 PHY source.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   * Copyright (c) 2021, Linaro Ltd.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #include <linux/clk-provider.h>
> @@ -32,6 +33,8 @@ enum {
>  	P_GPLL0_OUT_DIV,
>  	P_GPLL0_OUT_MAIN,
>  	P_SLEEP_CLK,
> +	P_DSI1_PHY_PLL_OUT_BYTECLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
>  };
>  
>  static const struct pll_vco spark_vco[] = {
> @@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
>  
>  static const struct parent_map disp_cc_parent_map_2[] = {
>  	{ P_BI_TCXO_AO, 0 },
> -	{ P_GPLL0_OUT_DIV, 4 },
> +	{ P_GPLL0_OUT_MAIN, 4 },

Why?

>  };
>  
>  static const struct clk_parent_data disp_cc_parent_data_2[] = {
> @@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
>  static const struct clk_parent_data disp_cc_parent_data_3[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .hw = &disp_cc_pll0.clkr.hw },
> -	{ .fw_name = "gcc_disp_gpll0_clk_src" },
> +	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },

Do you realize that this is an undocumented ABI chance?

>  };
>  
>  static const struct parent_map disp_cc_parent_map_4[] = {
>  	{ P_BI_TCXO, 0 },
>  	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> +	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
>  };
>  
>  static const struct clk_parent_data disp_cc_parent_data_4[] = {
>  	{ .fw_name = "bi_tcxo" },
>  	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
> +	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
>  };
>  
>  static const struct parent_map disp_cc_parent_map_5[] = {
> @@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>  
>  static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
>  	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
> -	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
> -	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
> +	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),

Why? It's not mentioned in the commit message.

>  	{ }
>  };
>  
> @@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
>  
>  static struct gdsc mdss_gdsc = {
>  	.gdscr = 0x3000,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
>  	.pd = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,

And this also needs explanation. 

>  };

-- 
With best wishes
Dmitry

