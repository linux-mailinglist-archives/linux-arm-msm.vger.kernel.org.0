Return-Path: <linux-arm-msm+bounces-108897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NYBArtKDmoM9gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:58:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0D59D0A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B9D2301F16B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 23:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4483B27F1;
	Wed, 20 May 2026 23:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Is8k7vIz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cSYjkTbu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F63F373C12
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321528; cv=none; b=mbZZ/RiYWHk6CxsiRa7y8kAm93oh8dcXbGFzYKRZuZuNJhMaR6HtlEERytfK9BcMabGgTbHZADIgcJcI96CyvwceIIwLTSA6x3n+omTjp10XD281epFR8SExcCE23RMujf+0APEIarVYzpaIM+wWyIz+muG10HdrgF6CZ595Xl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321528; c=relaxed/simple;
	bh=uOOiRD/C+EHFgynyt39wxQXM82SqV00R2YSRUShCnmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCtTxcDwd1C5/mBnqIEGW17BBw+m+/AzFr2HLHqTBOkMVjZc+24iFwT3P0TXOGkRar8POOQH/AK8Ez9qHldZmVnYnlo+cBSq14PfuzwQG+WKOa9geA++UVracJFshh+70LTsjA9vjgiVpJAomWCiS/f7gxlOT2AaRSujyFeUOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Is8k7vIz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSYjkTbu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KL6N1h1798819
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xslQDtl6G93vlsd/+8QfWRHF
	e5YOMqqj6g8oprL6TDI=; b=Is8k7vIzj9HFkHlalVxgYbkv/a5RbqeQBDLxixxS
	M0KirKPoxqByptR3SK9JoyuI+zJ8TYOWwxAtvLbLWS33d3N5MN2KgvwIbllHv0Sb
	9AHE11oqwf4Uxg1JkTmJrwuatOoSAM0HdDTrfhD/Aphmm5w0dvprWgrU2QW8EOUe
	aitNdxcPW/8yI8rZ9W+Gu9PSB1Z7/L21kSvqDzQBJha/TiZs+G1KPW8v/XVkNH9V
	n2rsy2LJGeMeL94PRS8y4nGLGDrvCKgKopABUt9yEQkaTysXPRSiLNGddofYZvgo
	ClhKzBMBZAuMhvsjxOegOrKR214CUwAcjQNTYKlDpTMkYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu28xx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 23:58:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so159674201cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779321525; x=1779926325; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xslQDtl6G93vlsd/+8QfWRHFe5YOMqqj6g8oprL6TDI=;
        b=cSYjkTbuteBoT9NErIP5Tyf+SmYqiNEcENlA+LA6CtDs055xNEhRt/F3M5RK8ygVGb
         DObBxe+njEmgl6N13U37DutffX7+p1ggXGKzi8X9C4acUDoJbZuNdXKlwE4rFRLRT09B
         lpG71cnyhfIjBBHXQZhSDJbWzo8C4nwy6H0Xhl5d5HukEOuk+I9XrI0ZwBjIJ6p2gPDO
         SIIaT+Nc+bxNWJwSmvLmJwYoW578zxisL7bTdyJ3miNt7Gw0hXgnD+ouIjC57pvfsQDH
         qZNX5cVxr5bbvtqo/d/Tilbm0SS3U2Gg9/+T6BTbf+5ypQwSa2c6dvSTbLvTBDc0GOPx
         wahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321525; x=1779926325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xslQDtl6G93vlsd/+8QfWRHFe5YOMqqj6g8oprL6TDI=;
        b=s6rhQ5XrO0fuI2xtJvnHUUr8akY2moUtBCIsUnbK4zzsSmVP+4OKRnLynM4d4jpToS
         eOySa1O1oK2fIFo3C4JniCsOlIcO88IDgxEOmtrXdSdplfpRkFcRcYQhXT42q54Tutkn
         gqmiSatE/2rKoJe/glQWesCfa7c6kvGYNlyckhbJpB/XLp9+3aQb40UES4bWYfEDyY6+
         xNhxky+YprPuVgnpOUPiepirsU696CEd0L2zcyvGWQ8SHbxbfdjTlTXqVWnExedVLxK9
         T4mAbun80MEWlnXuHNK/CHIncdsWEd/KR9ghVKqFcv8PN2+wJ2CJCiq7xwja3E8rZESU
         TArg==
X-Forwarded-Encrypted: i=1; AFNElJ8Yac7/Lj7k2DuRiOE5K6pAHR2WxBjYwpJ389vsuCITR9I/I0n1VlwWeu4qCF1ENzfqM4pJ6V2oBbuMdD8N@vger.kernel.org
X-Gm-Message-State: AOJu0YxtY3XCMhwj+Vza/9gRZZaYKkN9KhzGOB3/MmI1s9XytJJaEKN6
	OTIbo4FaFNiJxPLu4IOx+I2O8iomJoxSNqD0+5hejaWbIcv5mEt1FuSDDkA4JasHRkEIMm71Dch
	N9dwm8okYQmykUoeVhli20hUuJmWZW/5VvtnbkgHeGpI4AHQitt/ZEETENHTAzRmeTjV/
X-Gm-Gg: Acq92OGQ3qlCSg14qkgBQ18ei5kmZLqa1dyDAaxInhc/RJkg3a52PJLJw/ALPGUOjRP
	ioPWcFkrApDrwG5oeEI1kflT2yed+bB4v7XzGh5EYaw2iv9Hb1n/lDqBBiBWC5bQODvAXAkNhEL
	p7JC5n5bfotZYx/2CI+m0Y5q4Ywx4liVMlIr8YGFND3sWLjpGPnxXgrG3pXvwPZyKwbwAWHhFXM
	kgw7zOxG8RR1zQt+yfJBEH5sGbUfoVUzc4VLT2F1aLtzI9gssR7RBN+Lh/9sq9JyaA6lnVAmTTw
	Xb5ZR35GnA1GKFMgVQ1K6WxTUkWAtYgR0sCQyvgHpQ2Zu1T0zeyq4QfXkUVCXUsRwp/DhW/UjMY
	/9MS46AyJEtdyZjt/RZmqU8oF31vHCqtVP07TSHCANdi/fmS3TOzq8Pjgn199cn5yCwjaskmH+e
	yWt0za13VtZpSZQXLpO0xTqTX/Q0WM7YGjJWY=
X-Received: by 2002:a05:622a:1b90:b0:50f:b17d:7e57 with SMTP id d75a77b69052e-516c54d32ffmr9945291cf.24.1779321525359;
        Wed, 20 May 2026 16:58:45 -0700 (PDT)
X-Received: by 2002:a05:622a:1b90:b0:50f:b17d:7e57 with SMTP id d75a77b69052e-516c54d32ffmr9944971cf.24.1779321524875;
        Wed, 20 May 2026 16:58:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc20fsm5302758e87.43.2026.05.20.16.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:58:42 -0700 (PDT)
Date: Thu, 21 May 2026 02:58:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Fix resource leak in case
 of missing QoS clocks
Message-ID: <vhpgkyasgtckugbf75vkidzacda2tg5qbqrgvg6rwcsjfqzy4w@pwf6wkoze327>
References: <20260520191953.190564-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520191953.190564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDIzNSBTYWx0ZWRfXw7CzjLYVSnoA
 zTVsY5jTSelJuPulhEDVebnBzijqlZubYc8pv6iASpu4iIX18/6Ipjfh0u5nnRINxOAg7cQZ6I+
 ixCN97mL3X6HtZ4LbINkL6Bgwnf4yyjA5t9aLRbcogkQcHY6ScGVay7LkT3CZxTVVlzz5anXoYq
 5Dt2lgUtOB1G3TMoXKq9YtCk5mrywuRpEzFEaxSkz9FyrBfiIgkgfSNI8i/hNjR16q5ST3KaQk7
 f8Red4Y12MJ5rpBkHedP0wMMo93zLJYGW/2WZLtxwwFBosjNxrEttClG7ui8gBakqcE2VpcurKo
 tNUfmOFOUWynbgJsPNghgixGBoxdIwi7Ey/v4Fbi7beOe1GEupqsOC7xP+K19hJY8iE7mHGXsxJ
 Cr5htVzpOf0WPeJIMfH3rk7nr5brIDhEpF+bdlU6GFeKnL63z0JbA9AgBSKj+DCa+Taxrw5pj9J
 vIQ6s4bD4Pn/G5wbk/Q==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0e4ab6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=efQzfd3GQAiEoQBuJ0gA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: YmqOnqDp9j-jwSmqDM1kv1DG-45YGfz8
X-Proofpoint-ORIG-GUID: YmqOnqDp9j-jwSmqDM1kv1DG-45YGfz8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200235
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108897-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76F0D59D0A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 09:19:54PM +0200, Krzysztof Kozlowski wrote:
> Driver defers probe if getting clocks for interconnect providers with
> QoS returns -EPROBE_DEFER, but it fails to cleanup in such case leading
> to both resource leak and potential use-after-free, since the ICC nodes
> are stored in static driver data.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 05123e3299dd ("interconnect: qcom: icc-rpmh: probe defer incase of missing QoS clock dependency")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260520190807.509871F000E9@smtp.kernel.org/
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpmh.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
> index 3b445acefece..56512989d1af 100644
> --- a/drivers/interconnect/qcom/icc-rpmh.c
> +++ b/drivers/interconnect/qcom/icc-rpmh.c
> @@ -324,8 +324,10 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
>  		}
>  
>  		qp->num_clks = devm_clk_bulk_get_all(qp->dev, &qp->clks);
> -		if (qp->num_clks == -EPROBE_DEFER)
> -			return dev_err_probe(dev, qp->num_clks, "Failed to get QoS clocks\n");
> +		if (qp->num_clks == -EPROBE_DEFER) {
> +			ret = dev_err_probe(dev, qp->num_clks, "Failed to get QoS clocks\n");
> +			goto err_remove_nodes;

Well... this can race with another driver probing at the same time and
using the nodes which will be removed. 

> +		}
>  
>  		if (qp->num_clks < 0 || (!qp->num_clks && desc->qos_requires_clocks)) {
>  			dev_info(dev, "Skipping QoS, failed to get clk: %d\n", qp->num_clks);
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry

