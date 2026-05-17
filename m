Return-Path: <linux-arm-msm+bounces-108064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WO4tBA0GCmqzwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:16:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B6562FA5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 20:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC593007AFD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 18:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F163CC306;
	Sun, 17 May 2026 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fibiNalo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B7hY+iqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B03CBE95
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041560; cv=none; b=Tu/eTcRyRgnkvWTppHSoEjjuzzQqEQ2j2CFe1jpf1kn3mAYuSim2OxvZweDyvvwZrUhuz42ePb0SXM1Wo2roa+rgO6K0CvoHrmr74l5SaZm20bOOMklzg0mZ5mzZEwdm/ZppedOKhyLyZHuWIvhsRJVYjje3GLZBUYmAlufomMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041560; c=relaxed/simple;
	bh=Xp5Ixk/UrdXHcKamwm4bzOPo9EV535L7yyFC9Vwqp6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyQFnx5GE73rdm+xuu0Qihfz4aUkQ8PDYJARPqvGPyCBxNJkHBRhjaO3BtR9vK5W3n61J2WnEU65bb81pvDh7SlEoHMSxBaTYGXKvgh07axxUxB+eVvP0e04IoXmDkoMk71J4vDETlZNQuRz0RczThekZFNnrBInyWw7j6tG6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fibiNalo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B7hY+iqV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1B2vo2067447
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+84c86+BTqUsmbfvYyoIFFXp
	0JFmH796Nm7BJ6t7KWM=; b=fibiNaloGlav2yQbI8Vhd3ypyF1GgAmwx86qdW0K
	qIBRJOf8g2LIfiPWKdU5ZS5qnM6gMNL8dzGmExzJ6/375sHinzPSRMOyMYmO8CqS
	zYyNfmR6yqxw0RHLHwpb5EEl6SKoLDSejHOr5PSw1YlJitxFkFx8I1IREh9rteDQ
	7LxDqechJkaxr0nEWcVOLMlUjKOr2txvuvjY7ofy8gsB2WPgrV5sRmnTvrWwDzKV
	6lOjRxfsyZ+sTLvrIx70KYzhQIHNvLEjceVID+0TyPZafkX2udbxwR4wOYXMQy98
	Dz8PrySb/9VP31hb/7maAK+O2BXzY62ssWqiJrvw79w93Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvquay9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 18:12:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb6d713ddso20047861cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 11:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779041558; x=1779646358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+84c86+BTqUsmbfvYyoIFFXp0JFmH796Nm7BJ6t7KWM=;
        b=B7hY+iqVSjKA6sKeXzMBJZSKMC59CpXz9Te+wZU68k/GRLuZqVpHj22WJ5U0V7Oxny
         oBgYDvjSTfubbftaFcji85bd4JJBuYpfgb7Cdu3qMzbLGug/pYxhnees3KL4SLdsctYN
         /PcCGUcBXFl9yzEAT4s5aWjlXVFn6zdH6xtx4xkz13CV2hOMnV+UIqcIgaAZpJC5B/Nm
         t2HPz22w1I0vw21WLzaDJoShV11azkcuK8JZmkfM3aMMXrfBSzbGwKKXD6YAIJUBwSoV
         Ve28W/ywsBPNzZkIFsWjf43ETZ8xe6k+SgyKTpK8IGJHc4FqFNmFedkk4Hjm9iPjSgAT
         pPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041558; x=1779646358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+84c86+BTqUsmbfvYyoIFFXp0JFmH796Nm7BJ6t7KWM=;
        b=HhcNLRav5rjVeIaVIL/CKdbCEp59zRUtoRRxEcxasBcP/LUX3U/O4n1LIp7oD4KH7+
         oWhctAAQsA8k/kFiV9B3k3xsstifWQErG6xSZi8oLSjhG1bx7qU+KPQbX1EEok4l3krd
         YjiVOm6eD45/ZdnNegH+aMvvo4fOtieLJvReelleaRCW8A/FtbYEZOaX9bgoujaf+B/y
         U/mFm3jvHh9cJ28n0iLMm4CNoybxJwSBakMO1Pd/eb33rVIENK0d2i5mD1cNHx6iNeBT
         sPNX+y6pCkbM0p+QJDHNbGd3eMoEQNlGRm0ievVfIvMNklg4++zwmVR8WxlMmPZGoEWq
         hHsA==
X-Forwarded-Encrypted: i=1; AFNElJ/b8bYl89aLhCVvVIFiS4k3ssbLch5pkFY2s5xtXv1C9wz5BgXQANgF7Fy7uczO01c37BYYxpjK3IqIZ/iE@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOMrtQ5ichdo1mBPEn/KE/SzvGNbondOz8EsGEAmsX7qZOT7E
	rQuiRyQ6EseQg0aRywUiaOHeFDYvaAoQCAquX+W/bYs16+DjSQfQ3YV7XUnyWxfypANdik5C1Ou
	ugz0ydc9LqETJa3VHwqaKNhSMeyE3GWkiMj0ajlejj9HhKTvRXpViwZyRDrG5nBJ9rpnw
X-Gm-Gg: Acq92OEk3nX/6aCHeT7VnfAogb1ohb6/36UnpptexMkEKD8uUaLqsebIZ6Em1RzxAGe
	19XhXZVioNiR3RneCfay5EoQwfA40BerTfaoqGRpbPCv8ydiLwDQdvkQoHup3fPruaD4sYG6mIg
	r3178V2QB/YIEErJTgnYR7HvpzAFG7tJ+8yjwMdU8w4+nDOvPS3Um/KH69lJmJtxY8HGCpstMcR
	0p7jdLitbl954qtVeuRlJLWPit1QdW1XinjN+RMvXx7M4xSGhnfxpBQm/byf3pLMtvAql7JQrkM
	QMW+S3hLMMsVzETTm+1HAtP+uNtKyA3+lsZkvkT5bbbQjqZdVZBoi/tcW2OjRSf80r78iI2KILx
	wsCpGOwfp9X28/bTZ6F9GfooIwK3RzlwYTSN6CPSZXzLgZflmz2DLCn4R57C0KIHW+DDebtIAJ6
	xj7QbWuHXXOUPCMPp9yamXkl6g3auOhNWw/dg=
X-Received: by 2002:ac8:7dc2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-5165a2c8c00mr167619211cf.45.1779041557750;
        Sun, 17 May 2026 11:12:37 -0700 (PDT)
X-Received: by 2002:ac8:7dc2:0:b0:50b:3831:417f with SMTP id d75a77b69052e-5165a2c8c00mr167618911cf.45.1779041557200;
        Sun, 17 May 2026 11:12:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395882c0c67sm6568821fa.10.2026.05.17.11.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 11:12:36 -0700 (PDT)
Date: Sun, 17 May 2026 21:12:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 14/14] arm64: dts: qcom: glymur-crd: Enable iris video
 codec node
Message-ID: <pockc2vpoobmhk6pwy5wluekbdgon5ndtltbs7lmq2s2hxwhxs@qp6bhwl5de7w>
References: <20260515-glymur-v6-0-f6a99cb43a24@oss.qualcomm.com>
 <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-glymur-v6-14-f6a99cb43a24@oss.qualcomm.com>
X-Proofpoint-GUID: sNjv12qVjUb1tADABmcIUPwG9lh071Z5
X-Proofpoint-ORIG-GUID: sNjv12qVjUb1tADABmcIUPwG9lh071Z5
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0a0516 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1OBNivUE3TbfJcvUgGMA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE5NyBTYWx0ZWRfX8b6+o1TieKTD
 Oh0gWYrncfen4a7zcvqXJ3oEJkN5TI+uQKtlr67jqqx7aLCGDW4BMVHRCv8uCq6u6YZI4by9apT
 31+x17LBTv/oVUbq40vDdlQt10Kf2KCgoxA6kG5SWAYlYedq390TqaopZ/EwpQdEdvkn4Gx4vFD
 WUPaqDZY89Aq2BYQy4d7sHZYFMY7QFTICTyTj46w5YTqQ2bE5lDbdlWS2+8fLOfvnfCB2R/uKsu
 Vp6Q8tiE9ThH3h9BM6v1/9EZe9MEhu6XpG3sD+mrPRYTFAYzHKZB6xMQXu/NxSKwc5T30VwEN9L
 yQiA5Mpl0UAES25nTF6ZM0E+i+ZOmhaWSR60lnw35ppZ+jYEqCRRzjUuvhnnx8vsrEUz+JGQS+v
 OQadcja13C1bc2D9+88MrEuilvQQ49E3p8J6pQQ5NcRjSNcf6gnM0Oolan4vs5hvw7ak1f9MmVS
 mmziNE5BzzV9JbX2G9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170197
X-Rspamd-Queue-Id: 650B6562FA5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108064-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,linaro.org,gmail.com,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.47:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:51:29PM +0530, Vishnu Reddy wrote:
> The iris hardware block is described in the glymur SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> index 35aaf09e4e2b..8d6ea857634b 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> @@ -198,6 +198,10 @@ ptn3222_1: redriver@47 {
>  	};
>  };
>  
> +&iris {
> +	status = "okay";

Could you please make life of distributions easier and include
firmware-name here?

> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

