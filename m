Return-Path: <linux-arm-msm+bounces-98363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P0tBHZzumkeWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:42:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3A2B9492
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73F9130D0142
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33D93A6F0D;
	Wed, 18 Mar 2026 09:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gl3b/WZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fqg2+7Fl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF13A6F09
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825735; cv=none; b=Vx63dJwIWt8ziUUguzkqygoSMnrvAOO4bOhrVisTxRoDdGqMEfL1IClGtZr1mRO2Zcmp+slq2p60lUG3LK0p03b76Nhj+f6qbus+kt2bPzQgjxSaAp4yyP3KaawarQKB+je68G+wwW1OcuTbc63odijTvVNIPbJZmofvIRr6OxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825735; c=relaxed/simple;
	bh=VRjHrbIL4vsZdAxlMskUttReSy3mI7GyIubU0jAER/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o3tiRB9Qbv4qgbRyLULhHROEChtN+M3kMGuyGsUOFHw45h7UeKYZFZX2Ly5Aj9JpBDMFR3gHJtUJXcWUfrfR2wgOobMzLH8Fu4wPekdYywOG2iQtaNK8CTWFXehKEKX+tgg9kMIekIHF6TqESXU9a03MPcdLNmqDQ32dfqgn0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gl3b/WZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fqg2+7Fl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8wZjN2730113
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15hK/7+IQg9d3rM1JPvTgxhytjFXh5CP/ZU9fW/iQ+g=; b=gl3b/WZrIIqNNONS
	i8sSEFpcBVkDOy6SpPfcvTrdYt+gINMsSAz+05T9sr4ykrE97g7DbiybuZ0n+OVq
	jQJArG66+IMrokCHORBhHx3adjgHMXVa/HcT1bACgr9KLyfAXOa/p42BZXa+FEtv
	zIcy9MYF7gZ2nhLkryC3Tc/9PLcZvCSR13X9UpTOemKezVzEfrvOiEs1RV+tLcST
	mn1OAQaDjTZz4U+KSBOKQNiwPteWCtgcwjt0whU/LFMCFZ4pBOxqrDZkUI61kQRU
	08uBskVmhQ2f0deKWXyXeAdacJqVjCH1Vw/eJcxAl+PO+zZUeONOuiEWP9YAeX+y
	Jj8ZxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjv4j0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:22:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091eadc373so48723201cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773825732; x=1774430532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15hK/7+IQg9d3rM1JPvTgxhytjFXh5CP/ZU9fW/iQ+g=;
        b=Fqg2+7FlY6OhpskGPqgL0lONDlPFHguv0+pYugrjvm3kL7KiFc8bAVFk5BMVWrS+OC
         nh+dzYDrRKrMXhqZ7L89XCeAM42xsqGi6AqMQQbVN/3uf/pYP57v07IhGwxySelyjsBS
         /L/csgluMMoAojWEH5eEyIO2gsmQGWzs/A+EiR0oUOCxWo63oltvwN8rYLZlWKXmxFHE
         DqkMOYqpvcBWq8yfXHvt+xYgptVMu00ni9eTCF7HG7z7kl85nUS0i6YPd6pgzpMTlmR0
         uNhQx1JRqxgZJf2S61eUka9UkPOetGEpjWMlw0NcMtl/sXM0gKMJ0N6Bp+KxpVY/xlHI
         PMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825732; x=1774430532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15hK/7+IQg9d3rM1JPvTgxhytjFXh5CP/ZU9fW/iQ+g=;
        b=ktI1k5AtFXWLt8k0Sx0IZuipPK4nRcvMdyLbyHGP8ByBTX7n/LKcMbK4dqtJmF6+ch
         mGLdQR7llRzBNyzLaEezIUrGpQpKNYHNY0K/QXjeNI/33N67uJYm8Wz4MVGHUR+t14am
         NE4F0ykonWnZW9iF48CsQn3h6SyBs+joNFFZw/iWByDgO1LygZbQ6HfEJwL1aEIpRxkc
         hR9uehpSs53IjbTfrlatHNEW0ocg8xS903ixu2QVNgNEvjOn7gDGwSEEqMEOS3CMjUIb
         b+RMnzB0cayh8CXLIsCG35sVdxGGyFGLstB78zg2i3lfjtRG4Z9KoOnk5PKMQksHKQSf
         ePew==
X-Forwarded-Encrypted: i=1; AJvYcCXRfIFODM1BX+1A4zrOIs2sOre2uTgmUUSL+aUjiPatr4YdcyPyrzjnhxsd80wr/9H0ezF1xAhon+3Zhf81@vger.kernel.org
X-Gm-Message-State: AOJu0YxHxbJ1lyaJp1SsmKk6dJ+wk5BVe1Z/4ZdRsrB+ed2m4/RIv94y
	6xfPVb5Li46MFGtlpPv8yFosp9jbFt+6AZxEljd7MT6jeiiCRaoSlA4Xoa9XyVyLMkKXXiT9SPE
	h1C1WAIytiksmdGTvqGOccJNnfad28LnlymwSDRKEZ8xz1lweyoxVfDim01LfJ6zBTXG3st/Ghf
	gz
X-Gm-Gg: ATEYQzzR1M/2a+f8l/42zSnD2r0AA2w9q5XxzB1V+2swsZvXw2Z2oy9j1r7v/MgxCnT
	K+J0fvUqwSq8dHj39fd80kNCf+SknkSvPOhZ+BJDSeS8Awft2ACtPkCTL9HCwZ3YB5nrjb58zYM
	IAyAV0pLRi5VzD5KKDkY1Sr6/nkKJiOfZCGAjlsU1PINCv/AAgAOnKmJS862vGJbc+3Z7htiUEV
	Ow4Edz+RKSUJ2/FY+BMycc5KFcoiMW3BAtXwh0CfKt+8/56i6fBZjrCVjsnHIuckW9Zit0gIryB
	uGxYX3FI84I5ShYRprfhty7k0ToLymF4AKRb+DZ4LsLta03IBpM7ye9SxZuAhagKNTXNvOGZbda
	WAS+M0RwzLy6rlXg6Di99oQ8yKLh+EKUqjMz7G/Vvph7c0qxVVdRdW/JlzsTWf5L5CG9qRINgit
	pVYiQ=
X-Received: by 2002:ac8:7d4c:0:b0:509:24e8:ec48 with SMTP id d75a77b69052e-50b148afafcmr21250381cf.6.1773825732311;
        Wed, 18 Mar 2026 02:22:12 -0700 (PDT)
X-Received: by 2002:ac8:7d4c:0:b0:509:24e8:ec48 with SMTP id d75a77b69052e-50b148afafcmr21250121cf.6.1773825731860;
        Wed, 18 Mar 2026 02:22:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1689d2dsm161386366b.35.2026.03.18.02.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:22:11 -0700 (PDT)
Message-ID: <5a464fca-7be5-44a6-b124-7b80ea859a9e@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:22:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] phy: qualcomm: add MSM8974 HDMI PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20260314-fd-hdmi-phy-v5-0-58122ae96d3b@oss.qualcomm.com>
 <20260314-fd-hdmi-phy-v5-4-58122ae96d3b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260314-fd-hdmi-phy-v5-4-58122ae96d3b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3OSBTYWx0ZWRfX3UiYPeO3gJAr
 ee+hfPBE8szKajmC1xC/qmreTjXLy7kOtGwQ5aRVuaNimsKGLKB45z3KAhsuRt8f2BtvxnLYBnb
 sdXdtxndJeMrrQW15mXyCDt9NpA4Ri31ZkSwWU+KfiHxGn8l040GOzBx2yRrfY7rvmrguJzD/NY
 Wk1X6KmYhkZzv3H16PEraLbqvyGve1c8dtagRui1T3yxO+y5/0Q+2S7LAK+XtBTeT07C1Esh2rY
 1VcV9D2umm32+d6vCTt90J01msKsGx0fRcmqLiRiIwYUKn+Vz5IlXIbKpOIMpMf3fwBxnqNWMRp
 8NAPMHGukapOciic0qaN6REuxjR7wlbBf44Q5e9wgRfDZjmY73foGq9WdO399LcpBUUb6Lx9eux
 qARJSQydEssmMzMlgcXyPS3QxOgmgyd8U1u9BfwWGRBKdv7SW3BVGKsILgBH7L0TPPB0EzuItsW
 tewvMiV7TsfUg9klvXw==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba6ec5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z2itlUKkCiT7gnwI7HQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: eRm5UrV94SOSTuqcqh_wIdGi5J-TPn0i
X-Proofpoint-GUID: eRm5UrV94SOSTuqcqh_wIdGi5J-TPn0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18B3A2B9492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/14/26 6:06 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for HDMI PHY on Qualcomm MSM8974 / APQ8074 platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +	sdm_freq_seed = mult_frac(remain, 0x10000, int_ref_freq);
> +
> +	val = (ref_freq_mult_2 ? BIT(0) : 0) |
> +		((refclk_div - 1) << 2);
> +	writel(val, base + UNIPHY_PLL_REFCLK_CFG);
> +
> +	writel(sdm_mode ? 0 : 0x40 + dc_offset, base + UNIPHY_PLL_SDM_CFG0);
> +
> +	writel(dither ? 0x40 + dc_offset : 0, base + UNIPHY_PLL_SDM_CFG1);
> +
> +	writel(sdm_freq_seed & 0xff, base + UNIPHY_PLL_SDM_CFG2);

Some beautification (BIT(), FIELD_..(), defined magic values) would be
really nice to see.. although I'm not sure how much you can do with the
PLL registers..

[...]

> +	ref_freq = ref_freq * 5 / 1000;

mult_frac()

[...]

> +	rate = (dc_offset + 1) * parent_rate;
> +	rate += mult_frac(fraq_n, parent_rate, 0x10000);
> +
> +	rate *= (refclk_cfg >> 2) * 0x3 + 1;

Really strange calculation, but in the end this is (n * 0.75)+1 -
mult_frac()?

> +
> +	return rate;
> +}
> +
> +static const unsigned int qcom_hdmi_8974_divs[] = {1, 2, 4, 6};
> +
> +static unsigned long qcom_hdmi_8974_pll_recalc_rate(struct clk_hw *hw,
> +						    unsigned long parent_rate)
> +{
> +	struct qcom_hdmi_preqmp_phy *hdmi_phy = hw_clk_to_phy(hw);
> +	u32 div_idx = hdmi_pll_read(hdmi_phy, UNIPHY_PLL_POSTDIV1_CFG);
> +	unsigned long rate = qcom_uniphy_recalc(hdmi_phy->pll_reg, parent_rate);
> +
> +	return  rate / HDMI_8974_COMMON_DIV / qcom_hdmi_8974_divs[div_idx & 0x3];

nit: double space


> +}
> +
> +static int qcom_hdmi_8974_pll_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	req->rate = clamp(req->rate,
> +			  HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV / 6,
> +			  HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV / 1);

I don't know if it's a good direction, but maybe:

const unsigned long max_rate = HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV;

clamp(req->rate, max_rate / 6, max_rate)

?

[...]

> +static int qcom_hdmi_msm8974_phy_find_div(unsigned long long pixclk)
> +{
> +	int i;
> +	unsigned long long min_freq = HDMI_8974_VCO_MIN_FREQ / HDMI_8974_COMMON_DIV;

reverse-Christmas-tree?

> +
> +	if (pixclk > HDMI_8974_VCO_MAX_FREQ / HDMI_8974_COMMON_DIV)
> +		return -E2BIG;

include/uapi/asm-generic/errno-base.h
11:#define      E2BIG            7      /* Argument list too long */

-EINVAL?

Konrad

