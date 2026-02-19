Return-Path: <linux-arm-msm+bounces-93336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULSTHJSylmmRjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:49:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FCD15C7AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 07:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EAE33013736
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 06:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C6C3090DE;
	Thu, 19 Feb 2026 06:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckwVtfOM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSHuX1TT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA93054EF
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771483792; cv=none; b=fGcmo544ZmLnOQDO96LHMN5BdUMRxtpdgfZcOZuGDrnTrwq3OVtiA3PXYvAazSbVc3u0nvUBkzM9WnEYySC9VAHMVy3l6nhMmrnmBafIhLmMfYll5CwO6lPD0KTxGG3X+zlSHPrMzkN+zcpu2phs7kCFvBIXOSDtpPgc043ahRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771483792; c=relaxed/simple;
	bh=dr6VxkvEg9hSxWAjmfumV5UnqGRaz1nVI6ESP4NNj70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7KN3t1ACiPYelfIKtIwo7lhwjBNYppL4kuLE5a6Bvkw/BIZZf67+lh1FtCiPt7wrOKQ75AlhBen8/Y10QN1S7KLzPbKEIw1xohxTc08qvZeLo+ydC0RqOWIn3nooYKcGyp2EJwbnyLbeCUmayg5WqFXodqB7AAOdnYdNwjCUJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckwVtfOM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSHuX1TT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J17w1E3077768
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0HWh+N4WiR3PWFLachClnwFs
	NcwdDKFFahQfFNbu/nQ=; b=ckwVtfOMv+5tZzxhvRhsTPagi96uQc4ESnAHE74m
	L+7qdAH2zXy2FMR9aHvi8xbZhqd6w4RcyBOlyyJ9MtexHNPWuXffoBw7o5ZsDgTh
	YsBil22MyzmZwzcwecDbbiqFJnGrovLHZtVm5uhoSBYr8K7iC1QElE/6iqjrU1GD
	SK7a/c/TYuIxs92ZYwJpyGmRyO79+PFw2/ZGqSLFUJvPgT39M8p3BF6LttP22fb2
	mqopCOO2N9aysAmJn0zXLHT0bDHe7HhtL0ck350MHI7ZB2X/YhbgoN8xoFxPekYM
	LbdrGkhnkMle+ppPULcUnvgfJOh1jfcu4FhG0Fi15InsEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdrk80k8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:49:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so358044285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 22:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771483790; x=1772088590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0HWh+N4WiR3PWFLachClnwFsNcwdDKFFahQfFNbu/nQ=;
        b=ZSHuX1TTABuE0vpVYumOsMTrF/Repyzc4lTd0Eqck4TC4r2Q3n773m1a1nXKjmIXtm
         xL+X9oI2qSDZ/9kBujKWULlNSa/15lYnwJL7e5q9kKMjQYdzXpiHyujVYbNH/kpoM3/v
         kFvNk3gZ3WpdmRZHOBfErFuLUhfYAcrxkiOG9YqYuwl9N2nSRB5G8gpzrN6jwrR0BeDk
         0ygPBnQbkm9aOO9cwpb0s4o1uWFZHBq8DF9iSq0/ijYABGutH/LA0oIEkUk2VPnE/8vx
         3jpvA/mis83wPHsOZUt3wLyXJJ/lWKWJvhxo9sBE3+C5+7xLnGTsLVvo6fRgQ8O7dy8g
         UhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771483790; x=1772088590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HWh+N4WiR3PWFLachClnwFsNcwdDKFFahQfFNbu/nQ=;
        b=kkZTsxZa0LwgQbbFnxJVK2TeBVeQFM206ouniohaskYMVWzOa2MFP0YWxBrlqZQFs5
         iINOy+IdVMYQN78stWqQMn+Tnf6EffCwueygxke2vrntWfH2/d7Sf0wxGN1286O3uu3X
         QG5CDs5Mo9A3Ci6AXSJrmg+VGpbleQ4BsURSkK9XErEk52K5kesUn2he5D7r4SO5Q4kv
         3oOrSPj3Gf61Da83hUbF5tylD1m8xGGyxyvrZlDkf6H9dVrd1D637gycWaCHyFu2X2TI
         e3MZxG2Jl9u/ImwAtzUtPR2K0GjGAus0sUHCQaTpkrQvu+35vitH8FwpYb1882asJNOr
         KoCg==
X-Forwarded-Encrypted: i=1; AJvYcCWGl1xTVzGFywJqoSdt2TfE9ql6f77w8jZibcswARNJV/4dMgsqg09P1cQZeXZ3bAYgCgDwYWKw+EAWi2WC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5cwLBSfTJ2DWkNNkPlFnYrqsZH1dZN6SRT023lDy9anitX7Mb
	9ksDe3wM+fA8xd13NJommfW1R0DmnJRNFjHgyewRJpIn60mGGaMYFuto7G4fGWLXIlVKOmzOQUK
	pZ72rD0ePjI2o0D9aJHgKyKEHBQD+BuEDSvutC+dK2mMHcDqE/4/b3fJUgirVuv94Njfk
X-Gm-Gg: AZuq6aISbw6oNZ8dVZQNgF/JClNCorRg8QLMGL2TrwKow0ljJwknalvHGEcqLEJhVfC
	op4ooGHW8vQv/kEInZC7lyVg9Rc0Rk3xev/p65f63G1Itk4VPF3tdLnaVcdLJkgBUlbFZxKc/Gd
	zUr1t3SqAI5Txps0vT3xeu2xMMD3yonsGi4QxqxXUbb/NKrZ7FB84w8RNRYi914y677LVGvTwSF
	5Hh92LqBSe7Ve60V0s55SE8oB65w2m3agzC2aRpPpQa4NBfQ+yPoWT74WX8n5ZHJ4JwUTmxhy1m
	3kYGJ8fqfB0farNLh3mahDnGqfiwlB8d3vqgBcJZsydngzgYuM9YJ6v6+DfXCOvGqIRkXxVYiyY
	lo80uQkM0fY8PcmpK+2y6H5Z8Ge4kl/irvzKLKXvQEEOkPfn98hhibquSlzneYswu/8WMIFV8sd
	8adOwaNbAlffqjtxWr9BJGSmR08nB9g1eqmfs=
X-Received: by 2002:a05:620a:460e:b0:8c0:dc64:bb9f with SMTP id af79cd13be357-8cb4225fe11mr2400002185a.18.1771483789786;
        Wed, 18 Feb 2026 22:49:49 -0800 (PST)
X-Received: by 2002:a05:620a:460e:b0:8c0:dc64:bb9f with SMTP id af79cd13be357-8cb4225fe11mr2400001485a.18.1771483789262;
        Wed, 18 Feb 2026 22:49:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5ac5fasm5184588e87.64.2026.02.18.22.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 22:49:48 -0800 (PST)
Date: Thu, 19 Feb 2026 08:49:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop redundant VSYNC pin
 state
Message-ID: <cq7bdo3l4w7fi2aymo4ovafrj2y52k33dspeii2lvv75viujet@anvldr26j7to>
References: <20260218-qcom-dts-redundant-pins-v1-0-2799b8a4184e@oss.qualcomm.com>
 <20260218-qcom-dts-redundant-pins-v1-1-2799b8a4184e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-qcom-dts-redundant-pins-v1-1-2799b8a4184e@oss.qualcomm.com>
X-Proofpoint-GUID: NiE0y1jPPtNlT54ONQgqgZARrR4cPDSF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2MCBTYWx0ZWRfX+92pzf7kQaHz
 EKI/inZNfbXOA6cBQMElBrpb9+/SIcZroAdPU5nsAYoSh5f+4diQjohBOdHAOKfpQPuUI0C98pD
 qsBeYwPtb/L3pfPq+AMyrztLEQDq41VwHt1glHM9x61GNbNnH1VJ0y4oQJs42WHWJJLxWEys/lv
 mxRxPgM2UAVP2kx7/CrU58UHQHTijsSpGv8zIdAUn53Cb8032okf9Sm233yYYkJ9uCYtc6swJqW
 rSsCe/2QFyRJfFZPRlf1yjaiJZD8gyTztZ5s+xR0vd5+xVodF2tml+8X+5m/HUk8Tx2kuGuYR/6
 UW51kOraf+H+6jYx/45JAts2Losg1QchYKg1NjLxnkzrfTEHeGVMWL/vbaZ3PZD53NJJcYLX1Fu
 Bxyz2fUR7veeMnjfZtV3WTzK3OVjT6Tihx+4Of5ENeKqYFfOj6aMujxSb7bjWpJHQJHZzjS07HS
 2U9I5nZDDYpLTDlhItQ==
X-Authority-Analysis: v=2.4 cv=MJBtWcZl c=1 sm=1 tr=0 ts=6996b28e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=ShtdDeiuQy05pCu-yTQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NiE0y1jPPtNlT54ONQgqgZARrR4cPDSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190060
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93336-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3FCD15C7AD
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:24:23PM +0100, Krzysztof Kozlowski wrote:
> The active and suspend pin state of VSYNC is exactly the same, so just
> use one node for both states.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi   |  9 +--------
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi    | 11 ++---------
>  arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts     |  2 +-
>  arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dts |  2 +-
>  4 files changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> index 63ab564655bc..a4dcc88bb01f 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi
> @@ -745,14 +745,7 @@ mdss_dsi_suspend: mdss-dsi-suspend-state {
>  		bias-pull-down;
>  	};
>  
> -	mdss_te_active: mdss-te-active-state {
> -		pins = "gpio10";
> -		function = "mdp_vsync";
> -		drive-strength = <2>;
> -		bias-pull-down;
> -	};
> -
> -	mdss_te_suspend: mdss-te-suspend-state {
> +	mdss_te: mdss-te-state {

This is not used and probably can be dropped.

>  		pins = "gpio10";
>  		function = "mdp_vsync";
>  		drive-strength = <2>;

The rest LGTM.

-- 
With best wishes
Dmitry

