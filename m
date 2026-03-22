Return-Path: <linux-arm-msm+bounces-99064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ODCEHk3wGnxEwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:39:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D43582EA553
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 43B743014957
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C9E375F95;
	Sun, 22 Mar 2026 18:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpSSIkDv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZtRDPtWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B1373BF3
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204771; cv=none; b=kBVXqkzNQJMaWnjwagqYdP82QLG8m9ngcb9Xf1ctwx7ppmzCvwZJ8JRzwHfjGCY4CyTiWtHvy806OecH3nf0wFk8KFoB2p7osFB1ZUz3I4LMASgWA0Z611NEcxtUlZtZaOTpNi3kcnXV7gF/nDxR5VZZK3PWjeRUi0HXDYj5Gj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204771; c=relaxed/simple;
	bh=Zt+EaWqVvBtweXXGYKcTVsnrvleWheS0AakqN80P7Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3h4CtDBDpBaZKo/bCJHtIpPZy9DSz+1ZTJAMSq1dDi3uPpnMD+DoXdW9GsRUDsVpCsNqb/Ow1IuQ7M8Z6BXq7uL0v/kcOqFwbo2O+wYU88LwJN+mVYRNOkvDbCiC5kQqv7T1/H0dWuPYujHRZEMoaJvslBGqC2m9tU3Q+01yR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpSSIkDv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZtRDPtWQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MGlft1695323
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u4l8bm4SCHPACZhC9On8nznk
	CMspsybNEge5UBh4STo=; b=VpSSIkDvD/T8bLmdFCHOPu55plFR4vLSltz75bvK
	JLnnLdAsY0EKVViPRTJ79wd0SDgf5lBvT0rMDN27skJ3Nw4ifKaX/k1cD7qM38GV
	rbt7NxlsTFwv8Nfq/PsA7l3UU4zVv7I5ZjqfxjSmkSbiCIp2olkhzOUX5XkTws1g
	+yI/novJqpO615T0WodNi2n0LWDYKEBz0dUPPlx3AR9CCLKJ5Rt+vbq7vkSUE8IT
	Dup3HbfWxnWCEk+s0gu86jEVKsvv2KUx98obXabDiwepSFAor/SJ/UaSVqfa51K+
	Dxr6v+PrhGRA/n0F7suIQaCllbhvZIX1KtywVogl0kr19g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghap5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:39:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093b92f327so255317921cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774204767; x=1774809567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u4l8bm4SCHPACZhC9On8nznkCMspsybNEge5UBh4STo=;
        b=ZtRDPtWQaPXt4Pycp72ebyTugSUxG5A0GNForMXn74r5xwP4MgKf6cewDxudc/yAqz
         MXyrVRfuHRtBtykzKAEiqNV9ZCOXGapBOcPnhvmRqmSpqKV8qTh1E3cC93VhgHFbTbkf
         GmzzI4BfXlc8pGuKBzIaLRCTmdFR5X9sKLpKRlkjr6Tn/yfLCfEfOhzKsor7bWNj4o18
         LmEmgEtu7IGXCZUnhS1WfJQ84mPgkol3x+ukTz6ySIsW4Ibxb+RGokxnUn3+wSvVtEqq
         4RVsiduJYTPtvFctlENjKL9fLEEx5AmjCc2LaxrMQbFNo99oh12YJ+3mux/uWVGNooqG
         wf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204767; x=1774809567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4l8bm4SCHPACZhC9On8nznkCMspsybNEge5UBh4STo=;
        b=Bf4wVQS+1YQ8+HVSxoHYJDcQzkWTRGBTJ1as9QrHQpuLvPM2I3NVvkGOa/CmX4MtSA
         k8ccFuOB88vsfTXBjtJkxeQPN5ObbcsQ0h4dFC4bFuqfF0mi4TqkjrCyy2jJa4Jtzy1L
         DHOWCPs6DeYVJKEYgyFL2tmVuU+NFDQ/OKJJ9VyMhcPxCtWBJwj3YiDnBf1qLBf5PvAD
         gQZg2PbhRovTQ2NOj5YoBlpyxhAQcVGqxu/hPRvXUqbcP9E6Vh+pDIw0b2ehjwF1+zNq
         FmHccyrMRHM0Mpyvyaw/chwTSayknh2ktr/0Knh8E+/g89fuEd58wHAU+KtlxBzDXjbq
         tVow==
X-Forwarded-Encrypted: i=1; AJvYcCVDt119di7fq7btFDcRWoUcQa02P/d7ujxRVkEM9CNhOKfmupgsuIZ5162jwKXV8/vQ+BRvv9aLyKxmcjG9@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjS6v8JCrr1lVatS4awV1m6EbTFLW7pWfh9Ww9Y0w/5MmqfMe
	kCbJfH+lQOkj/iywoLNnFnCeCD1nvhZN23fVxk4QUE4emP6iFx7F2Bw4yPxt7VadiuUWNWypcvs
	d/D4sKNXoOQVxmESuJJCd66kOelBUlEHVmNZcUacjRJ31q2+k1SQn/bDWbGGEZyKUiZjlqEebUy
	2r
X-Gm-Gg: ATEYQzyNHcWkt5tEMOqYUvB8EnlWvKw1qrhUq0nQcBuO9w53skxHB9otWg64WKr26t/
	xLB3MDzJEeEikruD/gdUMsI+bItF8rOH3apZ6THcxY+XdyfmQ5Dh7dW76D9xWc//yQpbJIji7He
	Iepv0zYj9ljtIitxZdWp3zHNRoyZ9wMmW41R2FUr7V8sfwGaLJan0Ti4xCNLPr5iY2Y5DAPFG0s
	51A83aPnqpMoEgWXbPYAiVVSc0Pk1xIE+iao8xahRK7guuPooBAh3aSnOTUpJdcwPkAGbel4WQH
	CcHtlGWqNiISh4/RvD3YMG/cH4EAlJ9Fa+clHfruhJoVkiy3DrVsYVw6Z6BHZy7c4wnQz0IuObt
	A42gEVm4SD19u4djIY3ZzU9jzS4Jc4jm5ab0CwfR8Abpd+B4nqElQo5x/C0Q3dSP0npK364FLtJ
	BsX1OaHlH2u2iUK6wdCaAHHFHLwIPTtg+wuYE=
X-Received: by 2002:a05:622a:2448:b0:50b:4dcf:4e23 with SMTP id d75a77b69052e-50b4dcf500amr68016261cf.1.1774204767092;
        Sun, 22 Mar 2026 11:39:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:50b:4dcf:4e23 with SMTP id d75a77b69052e-50b4dcf500amr68015941cf.1.1774204766613;
        Sun, 22 Mar 2026 11:39:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192db3sm1917430e87.3.2026.03.22.11.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:39:24 -0700 (PDT)
Date: Sun, 22 Mar 2026 20:39:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <rdi7toq2eldu7jylyaihdizf3beu7s3vk7bm5tzuqjnc6fogsz@l6e2cnujllgu>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c03760 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ac7HRrgMY6L2oGsqopwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: p8cv0ZLsiJr_FvxuBE9Mwn-tRsiYb3v1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE2MiBTYWx0ZWRfXzNhuuq4P1xfY
 SbxROSlQ6nWl40Ki7mo7VArnb3Dl/SqVqy0q6k0aVVZxUgGeBAA2b1wJ5bV8vJ5X1FfLmEj0qhu
 /d22feaSdwslhP3AQ5793iBvDBdJnWFkWVusJwblrv6F/rEcc4oWuH78FVyXmkdxb7H4JOQp5+i
 fNMXVwol8aGUy3ULE794YgXg6VGttR7DBLvHPflQ3UTzQutoD5/1KyxYR2J+nz8DKMCw22/EuS+
 xFULDy9a4L8BDL8cYnr/MRZMea6wRgTZGlrjr+vHiEgzCyfDUqF58l98zlZcl98b9fz96b7MLTP
 xwlY5+X2qvg6gkUhHWH9bKzQgiD+afEfJN5V3EHE5VTIHVrY6PEON/HYk+er2PEXWrK8fXCkL7v
 nX5H6i1Kqx3n+GDqOeB2wxYUCCNLO/6M7yVfee9KOKch3bAreJptBbZNBBEgVK37U79x6X0HR08
 XhtPSzdmZ5JlICPahBQ==
X-Proofpoint-GUID: p8cv0ZLsiJr_FvxuBE9Mwn-tRsiYb3v1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220162
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99064-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D43582EA553
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> Recent discussions off-list highlighted that the GCC should vote for the
> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> aggregate the correct load for the CX rail, potentially leading to voltage
> drops and system instability.
> 
> Add the missing power-domains property to associate GCC with RPMHPD_CX.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

