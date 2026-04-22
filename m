Return-Path: <linux-arm-msm+bounces-104169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM4IBHAU6WmtUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:33:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5A2449C3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD59F311EBBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83C43C9EE5;
	Wed, 22 Apr 2026 18:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpYX72sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VovqLkiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48423CF690
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776882488; cv=none; b=LEIko9+ZW6sipusf3haRA9p84338TJ9/kREWpmPi/eUkU4aiGO/uSlLtH/iyzLQLI6X3xT7aEeqFfvoDC/aQD22UOhyJ9MaTK2KUdJoP0yJl9u80eW6/H/iOk1VddtphSG35BmnSwdyMxIaVF039NcrEPOjAYP3GhazHP0Mb4UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776882488; c=relaxed/simple;
	bh=0VK6F2cnjKrumKWrTRfiBMBK9q18ZTISjl84hK2lzU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUbXyJpPjTCWL4PhUVaF37MXSnGOR9MRbO7fX0hZfixnzC7Mdy5qxHUPyvNkBXg4uboLvTZg6cgiXAq/f2hUyB2WzJJj9cKblW9v08U9xwvv1sOPPNUzIXi4uMw8hCP+2y1Mz26ewJXGdaD0lQKAz2BraMd3fkHZETST0XOZ+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpYX72sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VovqLkiv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG5A2U2185775
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FyFAwdzAgGw4hVRYizUayfah
	BbjNHuiU8cvL2S1mW4E=; b=IpYX72syyuXFUCcPxk3NqwptQCa8WDBXT8Kuu4c5
	s6O+P49+gqC/OZf9EG1aKPvxOIIip3Dz1Mc8TdP+ALFPBCT/dh2JDgqihrCGGmin
	zj9FDJP5AUm05UA9i5PeilEmHRmSUbwqm60/GJxdR54kfXCglrg6pwCnyIs14qFL
	gDJDXAR79Ok6D1DzCoj5K8fgLToZtwl/blcCiGBI29ivvY4Wg+xPer9Y+R0p2fNd
	w2nKaMaFU/aItVjw61eeSLNL3rrkVTDerl/mBWHN08w80uqDey3YmdVG2FYQW1/l
	65PNUpcq5bfhW7mAHAh8TteVrMyTUjUp2fihT5ycBl8IPQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1hvggwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:28:04 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9546466000cso2181450241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776882484; x=1777487284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FyFAwdzAgGw4hVRYizUayfahBbjNHuiU8cvL2S1mW4E=;
        b=VovqLkive1lqZFXLtlL8TGaR2WMj4LO9yyb1dYsWBMPX6NFgwVzRsqjyEm98Par/QG
         Wq7lkXpKCA4F0iW0Pu7kgInMdpf1q6tKqiGy1BKCU/K2YM1CeKjCaMeWsxWvxcFkMCv3
         rFf7bdGBmuJd4tNBuo3dAGPDEfKjCDNMbCf6gtRldKhUTwGfqBbHZG3u9t891DOOy7+X
         oE9vyuOwCUqJG6rNA0MDTZKR3uwwR17Q1umHQLzAeUyPI944WFUKkVgSivJpxifFR8Fy
         mKoJ5zVnQAOJRcNdiHAlq89TlblVDQLs+GYiU5QqZS5dUOMvhOWJRhgJe1IbpjbjxhnH
         ErbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776882484; x=1777487284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyFAwdzAgGw4hVRYizUayfahBbjNHuiU8cvL2S1mW4E=;
        b=YwIVZD3t6aalDKQHZjeDQvwNlzKqwdYO4Fy23b8pXjEndfrZKrA3jcw1U6cTs9hTPs
         l5ntfStU2tatXkM/KnBolvAW4zRbVGgFWs8KIdW6Td+zHhV930BE8R1tx82FJdlVY/Cg
         O6ZoX7PBkx3dZHLjtY/8yXHnOOsO/AlVSl9Zlt2saj+iumBv8ex0Jv3qKlCJiIkxyJDF
         9LiN4/MuviWW298H/pI6Rsc3JW+GpG2OvA88F/F0OQl12XsQhpNNF5LsZBh8lu4ON5xW
         +uA1v5ncBk5BEpoJpWQ+VlqTtJ2QT2cByoOhHRE4dixIP30lUsgGUv0HiEyKRHFP++5W
         jA8w==
X-Forwarded-Encrypted: i=1; AFNElJ9oyJyux4yiLCBflDNAF+GqRURhkgMfDoJ+UYFzZEbRnS/SmGFxnREGIseREHFJIvysJOSYzxukZToqP7uC@vger.kernel.org
X-Gm-Message-State: AOJu0YzFil4CA5Ct2LtztE/DVSin5VfJgnLddOkuyCACrTyUAd25XRPU
	mTeCjUY2Q3joEI+tNpKPEmq2vPnKPrhF6wBAfVJp+KraboDekF8xwLdDz4wNdImVQVOpoDCqqhP
	UXzGL0gl5h3zaZDEulgyed5GcYSwh4TWrxn2nEKMjzpTg1R/flidTbufvij1e3J1HZCKw
X-Gm-Gg: AeBDiesrAPpL3+lhGOkPOzdFs4YWJoL09sbYghqerKBO2tl1spvLTbsEpd2ExsXa6BO
	aa35JaMFzuQGZ1EwpBrsqqqipIkmT0RPDy7RohYPpMWmwZkSyveiWrmZfunbAR9lUCMWjQMihtJ
	mqlHILzm8od690btr9/F8obdTJd16gSsxfhXu73mD9c2ubfvLX3cfcv4e81k0ezKi/iW+HoJ9Sq
	8vMxac4zBXZJIZMeEYCpk86BHrp9I01/6XMPKcTKNfb9z9YVyQIod5GBrSyrBv0Z+HzOtnfmqJ1
	MHnM6kejjPn7bhW0JorBt4gF0Lny7x7tA8X/1ucpsa9K34HdqbYHdMEr4R2leAovgRVQlx++6JX
	rop3TYj574YcKltZbvMwjBYWbAEN5ZJ5FUq8iIlmzoxpkmlXz8kqP87BMF0A6BfdJNzJfbKYXoj
	W3Rk7ECRPBaelV1a+7n+Ne1vQOb1/a/x2OLsK7zTcq60BYGQ==
X-Received: by 2002:a05:6102:5987:b0:613:95c8:d941 with SMTP id ada2fe7eead31-616f4f6f185mr11415940137.10.1776882483822;
        Wed, 22 Apr 2026 11:28:03 -0700 (PDT)
X-Received: by 2002:a05:6102:5987:b0:613:95c8:d941 with SMTP id ada2fe7eead31-616f4f6f185mr11415921137.10.1776882483347;
        Wed, 22 Apr 2026 11:28:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185c8a33sm4688227e87.36.2026.04.22.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:28:02 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:28:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
Message-ID: <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3OCBTYWx0ZWRfX7idG31q7HwQi
 2wvEn+jDtXrdVpFJgbNweVmT2+7Yrxcwoyr8qQanK51uieLjd5kReFlVyPWgiA9PcyvdVG1aznk
 j6/7Wcqo4fsvNYckRvsuN+NX2Gn7n9n9/G/I7Ogcj9i4116dTcuXgLVEusJzV0CyPkMjhFrpeC2
 ek0BoJY9i633e0i77pZTF3KazWg2MqWcvJ7YNpPgT8X+tnc/5CL2k9WWHLbRhshO05IlP+8W0dZ
 dYMq8KLFHZmy8uXTCpcw8890VWab6ohGKqmoXZOyCrAe7nfM27WtIAwQmS3FpveRMB+wIuffI2e
 CBxiyvC390X4t4ezm8MeoKtB8a+ex77haEIjAjhGnfYCaX5dkWTcTJ/y0BJZawObBEPPAHFvaQC
 do/pm5Q11zwZakxhliDa02GKEUKAKEMfqHSX11pSV2kz1PAlPyruIp8f9W0gCA/11Y9hcKkggas
 vuM5mWi4x87CRioSekw==
X-Proofpoint-GUID: ScUuBAszKEqZl9KNX63kqPRsDDeBYrZD
X-Proofpoint-ORIG-GUID: ScUuBAszKEqZl9KNX63kqPRsDDeBYrZD
X-Authority-Analysis: v=2.4 cv=HJvz0Itv c=1 sm=1 tr=0 ts=69e91334 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Z207rsgFrGoaJHP3IqQA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220178
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104169-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E5A2449C3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
> Some PLLs are already configured as part of CRM(CESTA Resource
> manager) initialization. Add support to skip PLL reconfiguration
> for such PLLs that are already configured.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  				 const struct alpha_pll_config *config)
>  {
> -	u32 lval = config->l;
> +	u32 lval = config->l, regval;
>  
>  	/*
>  	 * If the bootloader left the PLL enabled it's likely that there are
> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>  		return;
>  	}
>  
> +	/* Return early if PLL is already configured */
> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
> +	if (regval)
> +		return;
> +

Why is it being applied only to Lucid EVO PLLs?

>  	if (config->cal_l)
>  		lval |= config->cal_l << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
>  	else
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

