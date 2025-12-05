Return-Path: <linux-arm-msm+bounces-84508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 12116CA941E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 173F3300CA06
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D932D2C028C;
	Fri,  5 Dec 2025 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFvJjX1K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g25i4o4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627CC28D8DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966402; cv=none; b=q4IhAPDw4ot4uhAlU1xyEgHRNWdUBzcGos0J4QrQkRUWj8dk75/u7i1a9EJ8twzj/LevHxuQQxY6YC9f/UZZSLSkdpuYNvZSiSQcMUiXOQ+bq1UWOuwLHRtyneO09GOrPy+5te+S3Oj2SkVcBRANWoUAMsVSQCuS8eeisSJZhts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966402; c=relaxed/simple;
	bh=iWhkpfDSSg6IvTqBOhnDgMTl4gC8DA1wYFBb9RFRAfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlA6+9c5PrlJ6qtpJ0C/XmER8cIN5zMFIHeNbqJewYSW/HokJlEhyYqo1lPiCWNUqSbvhn1Mqs1RPGZ2GUMYGrzMHGHBQUFdbSJm392bqg7oURagJef8GF7Vb36ajp2PSffEujzLNpn838GDP50l9kUKbHFz3qFwfKvAF9BEqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFvJjX1K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g25i4o4v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBM32673098
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ou5OTe6ItK50Xmy1KzAFGVvq
	CH5BTqwqPAu2c0Wd1Dw=; b=aFvJjX1KQ959FsseXfoL9ADfYv1LLhNAvbVHKYm9
	Aa3jwV/MZ2OD/AncIgIpgiulcsqvkJeFA2XDSBwjcMOhBaWcvK2toCXd2ABDywIG
	mkWOm6L+PoA1d04zh/Fr+lFnsKYOWz9jdMipEcxph6eUh5WP1ksfm3gZWYMarwon
	pOvPMrJM83+AwGnQf7/+UjP+SPFs2fwC1At2TlQxGZoVLRxY2jgYys9d0DmlDWm6
	BUSU4jfz03DAj5b/8LiuZbZzLuhs4hZ5T3Dbo4sOf/XIGec306TPms+hoEIIuHv/
	DSV/U5ng6m9olj7xN4/Pz+e3kOjhs3nuaRtwA4Tr1qh24Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm4hm3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:26:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b55a033a2aso644990385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764966399; x=1765571199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ou5OTe6ItK50Xmy1KzAFGVvqCH5BTqwqPAu2c0Wd1Dw=;
        b=g25i4o4vuIEHTDu0/mj4dPSB8t+uyAHTnquKEUmqODHJ2yHoEgA7nQZA5OjRV20+J5
         g5QXqviEO1wxRXKYpZSnt7lXvFyYA0iaZA8WJTQurs8uDkPhTBN5iVKLk1uiuHmzok4J
         JewCyx5MlL1CTu6tsWzQ2BAsnn9Lhsaw36YdcPEMLIb0Hf1MVI7jGyJbWyVXnAhgM45w
         tWhfiIhSs2OefyqvfJP3Tvc9cB3DJ+L+pgje8WkAe9qtpda6XoRE+v/m9wMtFlNeg0XO
         Yvx01DqzCIMbZo/I06e7C4cKQnenMfa0gOJ2G0dvcRGxWw1lvZfieALMu0PjQ3Ll3e7d
         nAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764966399; x=1765571199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ou5OTe6ItK50Xmy1KzAFGVvqCH5BTqwqPAu2c0Wd1Dw=;
        b=T7A6gwD92SiXN5G8cZO/lryjcu5d7Z05ZgQnLicZU48HtxPpiJwMCr0FQ8BzYdTvVC
         n25uvnsD/rucDEaLkYZFyGjKPD6EHS0cqk1Wphyn5s7y1NmG2DYLkyqvbkvW2YnAvk2h
         HTVERgOqez5qwW+azu4bcAfR9vOTpEx/Tp83rGnm5cTsZiVeoj9nz3H/K7i0k3qJ+y1u
         8KnaceKgKKnK87woXYeznVVwzihtpjE4WuxXGtiOIx8BLH1wNJckqzUGouZ3y95VApyu
         XsrRc60iD4Ey4g+mDvNBP/nI2umEptWwiQzbZdGzkLSAnyiH42lRL9GDqoFJsm+mOy07
         5e8A==
X-Forwarded-Encrypted: i=1; AJvYcCUbEc38Le6paGGwORwlASSy1MWfkzmjB+nTxT9q+moVXYbrK9SZOk+M0fqu0qVUdLsuuGdY+BBfC4T1Q9P1@vger.kernel.org
X-Gm-Message-State: AOJu0YxzowSk6eyPQ/XAeWRP3/AhGBfciIKp1z2PrJdqPIcBDyoa311i
	pKCFqnZxm7WVsXBdQV8FSwCSRFED45Pg9Tv9sIIz+EqcokMujZYLTMfMDLTsls7CQwwerTXlmoC
	ZcRZyCK+Qd2aF74mkrZ670WJdYwA4AbS2rSHVXTHUTtbvJ5yiTkTkpo1Gh0f8P29Fiq/R
X-Gm-Gg: ASbGncsKgE7NfjqfxAAbElOEHQ/CVYYcXXXDIW5JoUtzPx/GvcPmh2QWZYLMxJhby4g
	xrcy0S1KkV7p0s9VDEaf9RdjXczNGMYBhv/rGy+FzgSMbWXzktJkKIi1VASrLkul8tcBPQQ2miQ
	aKFTwawGuQ+HjAQEj5NsaVsrlO7EdJhiYBBH5Q3mWlSYdyoSDkIJswcM5F+FCyjYLkL5gvhQOa2
	JUwpJNy1jNWIsUqLe9KviwFIwGSiyjteVPPgP5eOn3motV1SiNbSAwqDx75pAF4KX0t/QZzoCRA
	WYS5amqoe/NNfeyPbgH8WFW7FZEOYT3I4FdnlkGA6BhLeiyv8luKOx3xlUK28dq2YCQU1B+1gjO
	QozqczRu0mHaJPa5EGqIiAEi/mBMQ1vTpcWD+sY1UMjKlzWkoKBdt2VixyLSoM2PwtHpAmKeJsJ
	oU90yEmYH9BIMIFx1rdAP6A3g=
X-Received: by 2002:a05:620a:31a6:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8b61608be49mr1221983685a.39.1764966399308;
        Fri, 05 Dec 2025 12:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0jvyEJFspuJp301SRTQ4mBO8YxuNpLtruUmwrp/86yZNMUr3AiwHs6JfRoIZ4TBzKziqO7A==
X-Received: by 2002:a05:620a:31a6:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8b61608be49mr1221979085a.39.1764966398801;
        Fri, 05 Dec 2025 12:26:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27fc8sm1769634e87.77.2025.12.05.12.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:26:36 -0800 (PST)
Date: Fri, 5 Dec 2025 22:26:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v5 4/4] phy: qcom: edp: Add Glymur platform support
Message-ID: <q7iguwi6uxkzl3ogk2jidfncc3guuaqzszvemvqita6t3mlnvz@6e2vxnu4li46>
References: <20251205-phy-qcom-edp-add-glymur-support-v5-0-201773966f1f@oss.qualcomm.com>
 <20251205-phy-qcom-edp-add-glymur-support-v5-4-201773966f1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-phy-qcom-edp-add-glymur-support-v5-4-201773966f1f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=T92BjvKQ c=1 sm=1 tr=0 ts=69334000 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=rYCfnyAUmxxiaWWey-cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zEcc9gSV3FTb_JClT1wxPojZ6Yf5tlKU
X-Proofpoint-ORIG-GUID: zEcc9gSV3FTb_JClT1wxPojZ6Yf5tlKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1MiBTYWx0ZWRfXwSPZko60unu1
 +9a+ERB3Y8GxkZfqjmu9MEniqMFWvWzuNg1TapP5Q7EZlov6B4fV1iTQdVEmkiixu6+32Ly9KwB
 J4bmz8UxidaTp0pY7z5JF+axVaeRqiWoLc2S+QyEylmnHpa+Sa7/Gilt2TL7TqWw/V8aX1DrJcx
 LqsAJvWgbkLZLA04UUmfCCnPRMV4Ly5YC2MJZ+ruYh5kz+eqPWv2g8+A1LQKsgfgdLD4AJsQSnX
 43XmeWg6vRnNJl5jWD+rfx9RFsBbMKF6SIz1uI+siDuX6HkDVUEu+506k1GvzrcsCma9U/bXysV
 Ua7QnqADxJ0Hfn2IyKfdBam+HDUT1j4Hq3IlwDfwTeEilmHBL1lrpYP1Wjy/ey4KzhpWMbgV6cY
 SjC6VHZMAjaIcFYhpsl4rWpu+SXUKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050152

On Fri, Dec 05, 2025 at 04:23:23PM +0200, Abel Vesa wrote:
> From: Abel Vesa <abel.vesa@linaro.org>
> 
> The Qualcomm Glymur platform has the new v8 version
> of the eDP/DP PHY. So rework the driver to support this
> new version and add the platform specific configuration data.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 230 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 224 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index f98fe83de42e..052b7782b3d4 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -26,6 +26,8 @@
>  #include "phy-qcom-qmp-qserdes-com-v4.h"
>  #include "phy-qcom-qmp-qserdes-com-v6.h"
>  
> +#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
> +
>  /* EDP_PHY registers */
>  #define DP_PHY_CFG                              0x0010
>  #define DP_PHY_CFG_1                            0x0014
> @@ -76,6 +78,7 @@ struct phy_ver_ops {
>  	int (*com_power_on)(const struct qcom_edp *edp);
>  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
>  	int (*com_bias_en_clkbuflr)(const struct qcom_edp *edp);
> +	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
>  	int (*com_configure_pll)(const struct qcom_edp *edp);
>  	int (*com_configure_ssc)(const struct qcom_edp *edp);
>  };
> @@ -83,6 +86,8 @@ struct phy_ver_ops {
>  struct qcom_edp_phy_cfg {
>  	bool is_edp;
>  	const u8 *aux_cfg;
> +	int aux_cfg_size;

Can we always write DP_AUX_CFG_SIZE values?

> +	const u8 *vco_div_cfg;
>  	const struct qcom_edp_swing_pre_emph_cfg *swing_pre_emph_cfg;
>  	const struct phy_ver_ops *ver_ops;
>  };
> @@ -185,6 +190,10 @@ static const u8 edp_phy_aux_cfg_v4[10] = {
>  	0x00, 0x13, 0x24, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>  };
>  
> +static const u8 edp_phy_vco_div_cfg_v4[4] = {
> +	0x1, 0x1, 0x2, 0x0,
> +};
> +
>  static const u8 edp_pre_emp_hbr_rbr_v5[4][4] = {
>  	{ 0x05, 0x11, 0x17, 0x1d },
>  	{ 0x05, 0x11, 0x18, 0xff },
> @@ -210,6 +219,14 @@ static const u8 edp_phy_aux_cfg_v5[10] = {
>  	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03
>  };
>  
> +static const u8 edp_phy_aux_cfg_v8[13] = {
> +	0x00, 0x00, 0xa0, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x4,
> +};
> +
> +static const u8 edp_phy_vco_div_cfg_v8[4] = {
> +	0x1, 0x1, 0x1, 0x1,
> +};

If it's always 0x01, where do handle the divisor?

> +
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>  	struct qcom_edp *edp = phy_get_drvdata(phy);

-- 
With best wishes
Dmitry

