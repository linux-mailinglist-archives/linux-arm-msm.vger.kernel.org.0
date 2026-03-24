Return-Path: <linux-arm-msm+bounces-99733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIyXGJP7wmlXngQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:01:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0723F31CA23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 22:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44A9730C8144
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2256735295C;
	Tue, 24 Mar 2026 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1isZc05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d9Wan+Ut"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7158B34C989
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774385685; cv=none; b=dqUhBqE5Dp3iEqQFkWBBZumNzQH0mQ2Oo+Zz3g3VaxhH+ARXYNlMcElSoE/5C2mjGBwaIWl44C4GnaX753P21tnYdwXHWT7ZyGuIaCJE16MFwOe5jPRsOMLGY7uaU0Bzf7flbTXqEj0ImPa/gQVaPWYLWn/q0ezPtPB5/GZ1sX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774385685; c=relaxed/simple;
	bh=EZuQ/8g6YWZCoKUpzFC9a5Nb+hr4OHN1aUvcb/qL3TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAIWEJT3IQxSiV2TkZgtLVaJwdOfOjtVPUEAFmOZUiHBg3ITfOGUiFlSWOPFacGKho0hXl3UyHofydmlORL2kO2GZPS4ik7irLBl4inLby8+EOqOa8NqrF3itIIGk77puerO7DubOXsRHQ+YHg0jtUagJXnKGQGHVWUB5A1TVj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1isZc05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d9Wan+Ut; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD76A3731423
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=50VLUiL9bVtwtrIh3VSsHw5X
	io8fks16aePcdvBS9IQ=; b=d1isZc05NQzc/kOyrP79Yc9iOEZSejZ2aQ7DaKIK
	uu+YzC5FkeiwoyZrFg2ngHl24WKc/66i1MXJ7O05UhJ23XRPL8UXZjVGZNS539ZO
	hOKxRjfcgog1/v3Dk4+fusd3ISw1ppGd2ZLXxu7tn15jOR3A8bvRruBp8FdYpEfO
	w1N7oXrDDMYdfo6orwQollQu7Xt/oamX/uZq3qWpXmK48NDuzOuzjRtG6bnvcZTT
	Nt8uoAiWlV71C5xb9zk2wVN/M/8qb2cjX5koAug0eUlIZWCIp5Pmyk006v2QnfkB
	AIg5Ss1PnLt/mqNd4m9HvpUaxKoMSip4lsCi6tXcFyz6uw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkets6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509070bda13so9752811cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774385681; x=1774990481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=50VLUiL9bVtwtrIh3VSsHw5Xio8fks16aePcdvBS9IQ=;
        b=d9Wan+UtUzVcjPlJHcqU63rkXSqDugz8p0fyLB9ekdhgDCdAUKiUYT5nA/+Doc7kUs
         vZaejeWb5gR9X+6qMRjQFStdPpegVQEP9Ba76pDL7m1zM0Ynb4OggkKWkl6aUb/hq1EM
         WF0mIKjamh+oBcmTYJb6yLAP7TutUBrxTiAFUqX9yQ0p4v6QOgfjj3rbIWOIzACvGxrc
         rqXPFy+BdtKOtPhDgSIIk8II/79dOxYJJ3eQr9J+lHKf6s/YiBmrd2Dj/S1i4edNmIMu
         PRe1vbuVA78+c1QhRqmIJD4fab9a8zvoHEQh8dj0Q6TvLVpHErIxPRTkMNz6GOU7b/5e
         h+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774385681; x=1774990481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50VLUiL9bVtwtrIh3VSsHw5Xio8fks16aePcdvBS9IQ=;
        b=bol7DBNYi/sbNTN/wPRw083QI82gxswJcdEWJf8zVcvN+1xVJ2ugS5rDepeAaZeQkY
         gPwuvXSICsyl9nBmnpgi8OhTjnwBRs00T88Rs8QcMWuS7XEhbU2xIDCFDknqeGIfi71R
         GM4mWWzmuQd2j1mCJScImPZRJs3R+Z8OvY7d0mkf0BmtwalZPtJANJyChseYdOE/N+Wp
         Qdwsjah3DZetAxxYbuZdna+Yu0uLMwf+BKDB3XoKB6rNS8WQmRWz2GT9rpAS8L6vCwrq
         Kl1bHFgcPvBYzGbcRj74XuQ7QtcFzKSIDK+YQpxVxrN9z/WVzE6pmZC/Yh3Lm2cVHUYU
         fNzA==
X-Forwarded-Encrypted: i=1; AJvYcCU9+5WQeIJg8U4LX8beckL0Hpnx3OXZkVZf1DJ7CeUKapOUtFr3eYbTtM8/o+kS6HhZ3ZbLOWlStYLuP16A@vger.kernel.org
X-Gm-Message-State: AOJu0Yyny39IafSScA2lyTe4WAjCvmFVb/V54x1YW6tomksmk5emz3eo
	ZuYnOOqYaQpOVCtBUaW5pLzV79lfkhsX9bSgg4z+A2k/vVtxZO4gcsbdXvYvdiFxPKSZD2J2jgb
	rsV0B+IHFwy13JWKd12/lmqUFOHQju+zJS8uAxnP2hM6LvwiDXpOywlmniMBvtuTD7uKn
X-Gm-Gg: ATEYQzwkuP0a9yueKyYCIMeLjqWMUtGtHF94hGxvugxl2z4Txf8c5EYe5ZQ29w7vIGW
	PFTDsWA9PLxvvyJSzS1mOAjGA9S46hAl6XtP9AM0LLtlR/XRUhp7TcNjY8V18xaURqYx7M7mE+5
	vw+jDLQbY1li6Es+os2SmU/0gR7KNAgp61KaPStt5KkBynRCQCHbFFlWFBuxyHVzPgt4MPwIxj4
	5D1iIG1QjDf5236F38A6R679RIrMJUYYi2v+jk1ey3wsyBqCtK96f0DLp4v5jd9bvm4pMI0qzKd
	o9ytRipXpe37BK4LGRBNTO8rm6/FxXe9DQSwfDE8wg92idqqcsNzr2aO+QspLwTGfuPXqwYjJMA
	X/+CKiGakVzq+MpVYJc2dReZvOgWih7o8a9GdxQk7DOIWPobSLU4dBSjMsZXUp3WRJp29rkeQ3r
	J6TVBjvow9CDsX3OzEJGNErijJ8D2aadMlr1c=
X-Received: by 2002:a05:622a:aa4f:10b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b7fb0bf7fmr17687181cf.23.1774385680832;
        Tue, 24 Mar 2026 13:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:aa4f:10b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b7fb0bf7fmr17686871cf.23.1774385680334;
        Tue, 24 Mar 2026 13:54:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2853055bbsm3400086e87.60.2026.03.24.13.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:54:39 -0700 (PDT)
Date: Tue, 24 Mar 2026 22:54:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] arm64: dts: qcom: sc7180: Add QSPI memory
 interconnect path
Message-ID: <xxylp75rlr2r62ehqxs5x7f2gy6gezbkuil3scrql6x5o5uowm@myb3riehntmu>
References: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
 <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-spi-nor-v1-6-3efe59c1c119@oss.qualcomm.com>
X-Proofpoint-GUID: NDV_aqWExuIXdAWmAUSK4-HhZZ6OgF1L
X-Proofpoint-ORIG-GUID: NDV_aqWExuIXdAWmAUSK4-HhZZ6OgF1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE2MSBTYWx0ZWRfX6jeh6SkuVl5n
 0eEkk6G/sUAL46XOYUuIzeooNX7h/hrgAI3uJI3Iw/DiUm0AoJnz+z8oMvY1SLsHK1eki8z6L3p
 Ly8oh7ZKcQh/8Xsxk8+py4arWp+8yFhrgQbwttOp6fZGFMZPluvwa5W9yjIIzY0xWRB4Fpxq6jH
 NkjSYaDb68FhG83HpoVl4EfcVMFFizMZCWKtxxMz4YnsxHaewA8GCjdZPw5xVoBy53/HWcMgBgJ
 JdUtj6YimlZrl5MmGidS76a62bIVmtTuCJx6QdgyWxqeY9q8yS8zo73fcpyKUj8Q41zf3a5ap7k
 ZcqYg3FEl5GhXJwzsB6YfbG/SHPIixt/12R6uzSK8DEDQ6V68B6yf95dL5p66dpoTLpI4Wan/71
 L/zCUkDYO5JGcHtJNkpIvIXqgSmAJjaHAeSm0f8Fuwg9hTo/SQmSX2qQXVai87tA7Z+j8S1w591
 mURuDntD8A6yMJ3tUKg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2fa11 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=OTc-gr1R00hQmjQXdA8A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99733-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0723F31CA23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:43:23PM +0530, Viken Dadhaniya wrote:
> Add the missing QSPI-to-memory interconnect path alongside the existing
> configuration path. Without this path, the interconnect framework cannot
> correctly vote for the bandwidth required by QSPI DMA data transfers.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 45b9864e3304..7093b39e1509 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2864,9 +2864,10 @@ qspi: spi@88dc000 {
>  			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
>  				 <&gcc GCC_QSPI_CORE_CLK>;
>  			clock-names = "iface", "core";
> -			interconnects = <&gem_noc MASTER_APPSS_PROC 0
> -					&config_noc SLAVE_QSPI_0 0>;
> -			interconnect-names = "qspi-config";
> +			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QSPI_0 0>,
> +					<&aggre1_noc MASTER_QSPI 0 &mc_virt SLAVE_EBI1 0>;

The same, please use QCOM_ICC_TAGs

> +			interconnect-names = "qspi-config",
> +					     "qspi-memory";
>  			power-domains = <&rpmhpd SC7180_CX>;
>  			operating-points-v2 = <&qspi_opp_table>;
>  			status = "disabled";
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

