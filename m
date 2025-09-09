Return-Path: <linux-arm-msm+bounces-72735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45762B4AB7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD04166B20
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF1A321459;
	Tue,  9 Sep 2025 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FRKv1ZB8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7AF321421
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 11:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416373; cv=none; b=uzWzOOdy9sNVObbBQn0zb2bslSnkCqgU8ufgtkqZyhLM1xIIMhKdOjXlCjHyrJHKAGn9kIjv3GVjNwlmjPR084+JWyJXWVD0GNuMVxkSlVauFAcJBh2zbArvX1E4rOo674qUf6RihlfzMjfQGC2dZFprQfCAgks1jD/dhFzncqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416373; c=relaxed/simple;
	bh=ABXOdEgAp3ROJMFWb1n6PCoDt2CzTceYi5y9YjH8iXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSOxDtAcvTjIW0TsI/h4t0V/Uyk81ItCkKIuBW8b9893bQg8pBKJ+Bk8CKY0OcjxYhnHlkadWdH4EgVzALptiBUN050Lr+4wyMYhVOY7vfDB51+V1pUN/2AIFO9fwFYMCBObLKmDu980bKYDGfGsuQWsq0NTZNGACvC0FW/eUs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FRKv1ZB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LZap029320
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 11:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M9znp73XyVo8U1TpZOW4OBtp
	RYA4woIw+OLOhqqO3cQ=; b=FRKv1ZB87y1M/oF4ZEp1XPRLMZuxo8qzDytkd9dc
	/oz57l4HCdW/kVw5UOgKmTPh/Z0uAzsypvRAQHfCx2FhrztGBQ/WGG8xs/TdEhIL
	pBpwzMVgJCcVM76s+cjyLDAA8hmSK3byPu3rvKHNAp6qpSNrSZukvXaOlPu4eLUz
	/OMCVTxOn59h0IHU1ZPCEVmrbyNlZsHei/7e4lqvthxAFx81WCsPkWxheQCifoMp
	ik8DA8L4BUQvAVOu4a+UqeSBGLxRPJsosrQIP+yx5nK6WKJ49CPac4y+2XTI/YIa
	Un6x3T6wxnescOS3NIPh4vjmzeey/yWuFajqsNporbml/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8g0r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 11:12:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3415ddb6aso140862851cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 04:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416370; x=1758021170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9znp73XyVo8U1TpZOW4OBtpRYA4woIw+OLOhqqO3cQ=;
        b=TaO7mfoFRh8I68R6B5TKkmr+QzoluWE/dypbwSTLiN2Hfwi5dkktLletMrH8HlM/6+
         LLTraJphwTJy+hmOMU4g0Zh65NswzfOd+PjDVa4AhwVP01J7MW7WqM4CZu+d9c/J4pFY
         aSMQDEW5WJJDJf07Jyjq0tfYnxMUHLq/mq+sc9gXeoKoCnPN6LG7jjbYhh+TedlWjIEn
         zdwRckynrspyO0SN0bP5Ms0Wd9BzADCT6NObiT5Uvxx/if15EjORmFCl+U+yl59Pydte
         k4BRhdhEfgAsdWEXoBANYHJuWpWQ5XYUonUV2w0OMR1wkvt8YrerM+FQaePLay1t6Soa
         NgCA==
X-Forwarded-Encrypted: i=1; AJvYcCXzWqiZyAeRu7Df9blDJPM7HC4uE5sWBUGs40v6xFaS2p2B3MJrEd/oWKRnpxVpCFFhBeHUNY94KR4LbXd2@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIY0dcaqZKZ9FmSjgO2vVd9CZv6zq7W3+mfrWVhpbjFeUUTi7
	MeWYI4TS5+FL6BKzT7UHW/sT4Ufk3613rMFYl0AHEs81OKxatoocz7k5qwiP3Nfb/QbORfZC1ow
	Yl2H2t5bNOj3TsGKr6HxaR55URlHiCEgxl//hywAmHRa5Y6qC5AXc/8k/GZ5IMKMW2NDx
X-Gm-Gg: ASbGncsgOYOJEJHLwBlNHEEwZdLlHwFPl7QSeAYEsZqYNi2ySzFxNU/KwNyYUVnsug7
	cZ9COV/HBDNYSRhkE4ESjy+Uib4YG53IWksASm00N40Qp7zo7YGrTldOSPxBEPurMd3vklblYZV
	XTu7Q63ou0I7k6cPMB6Ul0j27NOloNzT255Jp4m3GMAbwmT83B0aVX8Mc/vOtC8UEIcRaA0+UuC
	S3/KJ0h72fTHkJ/aeS+cao3nH8G4dAJ8qvPgFiTxK76OeWVTjKoKugnUUooCwptP+esnjSaIJFN
	7XS6UAA0ar25wmHIrSEvcNix90mdfMt2nBJL/tNNM/5VfP02PDZp703k+/yRDJsthYCk9VloZ5J
	o8CITremQC9EcRDXD/ZtfsGFiE7GHDsh5VW2rJG+PzDP8+9BmY8XH
X-Received: by 2002:a05:6214:509b:b0:70d:bcf0:7c12 with SMTP id 6a1803df08f44-72bbf21116emr132264906d6.10.1757416369951;
        Tue, 09 Sep 2025 04:12:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFihv061/0IeKHM/2H1vKgpbFBruOQN320dQw48xcHjkKFPI/ERP986jbIwJuh5jmZLJF3Log==
X-Received: by 2002:a05:6214:509b:b0:70d:bcf0:7c12 with SMTP id 6a1803df08f44-72bbf21116emr132264416d6.10.1757416369335;
        Tue, 09 Sep 2025 04:12:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681795eac6sm454789e87.92.2025.09.09.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:12:48 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:12:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] phy: qcom: edp: Add Glymur platform support
Message-ID: <3bo2xr3jb3hrzsetjzd62dmcif2biizvoanxwtyhr2dmkb4g7x@dgrcvzujcwgq>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
 <20250909-phy-qcom-edp-add-glymur-support-v2-3-02553381e47d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-phy-qcom-edp-add-glymur-support-v2-3-02553381e47d@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX4aIzNO8J77UZ
 nLopPj01ToSZbHCqHyx/oS82DBlDh90+LasmJYa5MUTMvQe24TM7hpQ0H4pXo+pDSpAGu6s/3zd
 bDmW3YDJxHL+Y+j6XPhJhRFqHlf1womkpbc6jypjgeLGRiRG7smehyIhgwOjjtQxWKBUOvd2Aih
 Yqv/gksfUoW816ujoHhnS5zKUMxOwTQuLO9Y3ZXhoOfkqY+LoeU4ZTn2NgICblhhfsRox43V22Z
 RraXazubycHCjtv7pCbvKWhmu52owhDbwWxjvlJ8HyF2dWaOypZgPLYXrwVd4a/19vzMrfwWYbz
 sCyFO4A8h2MEUER3pVgQZtIAPEsYSRssN7r7YKEp2SvUsH3uivRt8lT4bJwSU10qS6+3H2J3VCJ
 zWWrI2Wp
X-Proofpoint-ORIG-GUID: LO_gdmwcHVNsRD7k0lNsm8SWiiIL5jzB
X-Proofpoint-GUID: LO_gdmwcHVNsRD7k0lNsm8SWiiIL5jzB
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c00bb3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=r658mG_ugU-Z7oAIEg0A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Tue, Sep 09, 2025 at 01:07:28PM +0300, Abel Vesa wrote:
> The Qualcomm Glymur platform has the new v8 version
> of the eDP/DP PHY. So rework the driver to support this
> new version and add the platform specific configuration data.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 242 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 235 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index ca9bb9d70e29e1a132bd499fb9f74b5837acf45b..b670cda0fa066d3ff45c66b73cc67e165e55b79a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -26,13 +26,15 @@
>  #include "phy-qcom-qmp-qserdes-com-v4.h"
>  #include "phy-qcom-qmp-qserdes-com-v6.h"
>  
> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
> +
>  /* EDP_PHY registers */
>  #define DP_PHY_CFG                              0x0010
>  #define DP_PHY_CFG_1                            0x0014
>  #define DP_PHY_PD_CTL                           0x001c
>  #define DP_PHY_MODE                             0x0020
>  
> -#define DP_AUX_CFG_SIZE                         10
> +#define DP_AUX_CFG_SIZE                         13

If it differs from platform to platform, do we need to continue defining
it?

Also, if the AUX CFG size has increased, didn't it cause other registers
to shift too?

>  #define DP_PHY_AUX_CFG(n)                       (0x24 + (0x04 * (n)))
>  
>  #define DP_PHY_AUX_INTERRUPT_MASK		0x0058
> @@ -76,6 +78,7 @@ struct phy_ver_ops {
>  	int (*com_power_on)(const struct qcom_edp *edp);
>  	int (*com_resetsm_cntrl)(const struct qcom_edp *edp);
>  	int (*com_bias_en_clkbuflr)(const struct qcom_edp *edp);
> +	int (*com_clk_fwd_cfg)(const struct qcom_edp *edp);
>  	int (*com_configure_pll)(const struct qcom_edp *edp);
>  	int (*com_configure_ssc)(const struct qcom_edp *edp);
>  };

-- 
With best wishes
Dmitry

