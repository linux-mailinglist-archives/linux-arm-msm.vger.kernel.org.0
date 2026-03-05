Return-Path: <linux-arm-msm+bounces-95476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rQdjE2jMqGm4xQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:20:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2B209620
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 01:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45239303B910
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 00:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E791ACED5;
	Thu,  5 Mar 2026 00:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WFX+GrVX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5l91Oew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A021B87C9
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 00:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670054; cv=none; b=tUtTiAwA0rRGjnLDkq1LY1hujdIkv2oitzv8ZoesKG9I+1TKqa8oFb5dqb42z9Z0uAWh5GGxRURthwQaDIPJe+XICCHFy2z5rxLJK4cp15jN9YpS0Ud+o75fJJRDppejlJSY2Q/IQ6GBXH8xm1lV5K2epsZLuNOAeCJt/qO8aZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670054; c=relaxed/simple;
	bh=dCXX9AibU0gsjaxJOA85Drwr15O0KZjW073w9KG/cB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQa5zddF6TCmhE2fCuEocJSOMoiv73M5u49yk/u4GFW4v4Q/7smLIsWJlkPomxlD2xYDb0MizWdUmF9ulCxqi17+KpAwM2XvBdH2LbbU+EDVY295pMwEVB7eHgrue6zsSZQsRxqKuQSyI+gKRtRAnq5SiIsl9B8ZyLzydAXBopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WFX+GrVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5l91Oew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624MOaTw1422295
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 00:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XMh9DNaYHEUy660uNbnfEzXS
	QhCYkpg18bP5w2A5jv0=; b=WFX+GrVXRZSdNPc3+uMG09NWUmFAzMVLIcaV9NLR
	FOiN0CWQ9ior2cSKmWKft403vf41yuWYgPJVfh4le3NLgctXYgmN7WKtm7cKEWnq
	V5K/icfkm6mFrfzHRxGiYzWdSkF1iXd5tSz7qpNTyQ33F26xNAU+w14sPpzqfbc5
	IXwPSXcZ8SpuIBvWf/PRiK2n2uL2YRt6DHXv4MvfYoJDqsy0GrCHrPNwtb/HigK4
	vbGguUFbkz9Fy6o4tzkbjZmasN2XQhQryBgnYLNotgz+RinZxJW8CCW3iQJKGKM5
	LM3UpOFNl1gpaHA1LL3Dj8MLLgigJ1pHF37kgqfzR9z6HQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpe8u3c1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 00:20:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-503915b0a88so79887021cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 16:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772670049; x=1773274849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMh9DNaYHEUy660uNbnfEzXSQhCYkpg18bP5w2A5jv0=;
        b=E5l91OewuRi9x5NytKH0fVbWaJi5hyZhh4DTWGCAXWXAcpb9CnDOEIiBUT8rOHUPSE
         QbI5+jwglABT7o3Mg2nZSMgaEfKEf0qsLqiqLTabk/EbUGSUhj675NAwhIlyD68Y4jjf
         rgFWMFpc/DNVeAfiIJyCkUeistNFaMkWHAapMiJu9Xtze4Dg9n+9A7aShalgEr6T70YI
         oyFfD5hqQPCoXRlcaqGyf01zxgRh7systw2/kryOCfbcI1/eRvCY+sh+EdK7VrG4xDSj
         mVjKhsYcZJrb9Ihk9Nmvj2GgTpR309Gmu/EXUb3e3AXty+biH/31MOorO8egKzk8APUc
         Ox0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670049; x=1773274849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMh9DNaYHEUy660uNbnfEzXSQhCYkpg18bP5w2A5jv0=;
        b=YkuUykv/YypfdZ3qamWd5IignxU81ThiMGIsHaMysiKClPOgrLGdfvwKx4uAL4x7cj
         cyvRlJplwkpQ/Fdj7YI/GsAMuTM6TiaK9/3m4YPqJRBifPWi6XZlWfUSoxX1ZBZFp+Oz
         QbyVnYSdLg5sqQKh+OYzxTXjUlKq3tr/LLjE/c55DPh2o7X4rdYcPyv2gkv5oNUXuSG8
         avYdhPAmnBsms7JauXyF18vznnrBxosgRvdoO2HxWVs3WZHyk1xU0ULq4m1q82LpdTJg
         xNr7itvZ2T63tqtuRvzJwtwhhByt8HycZUTWJa0tF1RHpVnxucBbrlF9VOxZkHSLNfkL
         BEaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx+8rCmwSNE+s1sv3AVgXp9gcP8hVxtxkLbRcirMLdYftEvxsWgukgOiFZnsWcnpnyhPwdoule2irSp0uY@vger.kernel.org
X-Gm-Message-State: AOJu0YytBJGI/RElcCXenEIDWftr1JZH/XmXj2Swu9ks4Kx5GzBgpv28
	/4Q6Q34TOyjuoiXxspMKMmNCrn//kXjY4jrBLru24HVPLQ2MteVuIJG0mFiB7aeQVjxJJcQg3a6
	hj4tvmt4sOl8t+hWnmdysfvsub2Sg6eEVARkK30OP4J64+y8Jso3jtc0EfiGJSDlDrHSc
X-Gm-Gg: ATEYQzy41OH5UiUzDD0XVG8F+F4EiP8flqjD0+7MojhGZitNDcBPPt8DnCGmflBVllA
	EjKG/FBjzdm9WGW+/HQIGO3ciGNvLb6I71GAGwnzCfX/cJmpwUSEUTTSIITREByJC6HcfugpV5J
	ktj3+9W8ifsY8WFDDxizUL6JDc4vRE81cIdkWFl1YjfhrOjec2mDO+1wwJdX4OoTrTK5Yu3PlwF
	v6TM1D1F77eU6Z5zoLQUmbedslZcgTEi9unqBbH9r7Mu4oKIrb8nXDYeo23fVwHIA3QXZCohw2C
	T4pDFQdWfVo7E9UV6WLxlYBf/ICPAQalFJYK23wQYiYxb6oqoXIjtJH/f4qVl8axsEP/FjPwepO
	sVmn/Ew5coNGnY+KYn8IzBJNg/rS2BxVJqGhjgCSb83WMkdEkB3AWVx+h7/+mnXdSsomn4RrYD9
	yQBuqVChM+Ka6h33ToZ+xTCC3JpwivoHjAAos=
X-Received: by 2002:a05:620a:298f:b0:8c6:e1ff:8cfa with SMTP id af79cd13be357-8cd5afa6510mr462896285a.60.1772670048957;
        Wed, 04 Mar 2026 16:20:48 -0800 (PST)
X-Received: by 2002:a05:620a:298f:b0:8c6:e1ff:8cfa with SMTP id af79cd13be357-8cd5afa6510mr462890885a.60.1772670048177;
        Wed, 04 Mar 2026 16:20:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573c42sm1626891e87.72.2026.03.04.16.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:20:47 -0800 (PST)
Date: Thu, 5 Mar 2026 02:20:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/7] clk: qcom: videocc-x1p42100: Add support for
 video clock controller
Message-ID: <tz7njmffqixqn7554dqllqjridi6uksjcd4rq33lx5b3bj354k@bldalfcu5xyq>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-purwa-videocc-camcc-v2-3-dbbd2d258bd6@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jMRD72_3IQbPtYDIK0osgr9QSIZJTBUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwMSBTYWx0ZWRfX1goiBXtZSs2z
 puniPFk9QdXFqYdIvG/HO/Y7ON4qa+s5IYLXZCF6Fa18sk9LwoklhK6auOnchyRCHlElL9p3i+2
 ibJoi8zp2eVWkkbu4leSsJKrK0PVBLN9SHAaySVGRRCXTEAMzxtp8TCRjm7l5bWo2ywi70JZkZT
 qVuuz4LiutIfyIyFF3pSJfMVh6fTJIK1NC8Jbev23Nz+YhyhOnVMOoSbYuG3FFSZwx6VTpbiuB4
 Pmig4NJqebiUjhJcpnB198oHGvRoalMrUwOpcJThWuffpDfCnsXnsLL1GuG7Z9uEZkqN2HQGY4a
 QYKgtWsQpLClNwL8wWYxcLC6nu8jcgk2ndtpn/v8BCo0K+bbaIeEz56SljaYDQY0IZxEf+C0iSj
 o0ilwrztD5L+Ko+dKNUtidbdO99fcfXVf8YWWtvfafCROectVsZSYo4CBDwTgef2StUQAH/sJwf
 wofKRFRf33pcQcEUzZA==
X-Authority-Analysis: v=2.4 cv=FpAIPmrq c=1 sm=1 tr=0 ts=69a8cc63 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=38CP8QUe7I1FTJ89_pcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: jMRD72_3IQbPtYDIK0osgr9QSIZJTBUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050001
X-Rspamd-Queue-Id: D6A2B209620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95476-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 11:10:53PM +0530, Jagadeesh Kona wrote:
> Add support for the video clock controller for video clients to be
> able to request for videocc clocks on X1P42100 platform. Although
> X1P42100 is derived from X1E80100, the video clock controller differs
> significantly. The BSE clocks are newly added, several cdiv clocks have
> been removed, and most RCG frequency tables have been updated. Initial
> PLL configurations also require changes, hence introduce a separate
> videocc driver for X1P42100 platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig            |  10 +
>  drivers/clk/qcom/Makefile           |   1 +
>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 596 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a8a86ea6bb7445e396048a5bba23fce8d719281f..b1b1ed70871c1b348985d6f5149152e57637d904 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -155,6 +155,16 @@ config CLK_X1P42100_GPUCC
>  	  Say Y if you want to support graphics controller devices and
>  	  functionality such as 3D graphics.
>  
> +config CLK_X1P42100_VIDEOCC
> +	tristate "X1P42100 Video Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_X1E80100_GCC
> +	help
> +	  Support for the video clock controller on Qualcomm Technologies, Inc.
> +	  X1P42100 devices.
> +	  Say Y if you want to support video devices and functionality such as
> +	  video encode/decode.
> +
>  config CLK_QCM2290_GPUCC
>  	tristate "QCM2290 Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 6b0ad8832b55f1914079f15323b8cdd1608ad4c0..b746e5046774259cebe3da8dad1f226561268a8b 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GPUCC) += gpucc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_TCSRCC) += tcsrcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1P42100_GPUCC) += gpucc-x1p42100.o
> +obj-$(CONFIG_CLK_X1P42100_VIDEOCC) += videocc-x1p42100.o
>  obj-$(CONFIG_CLK_QCM2290_GPUCC) += gpucc-qcm2290.o
>  obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
>  obj-$(CONFIG_IPQ_APSS_5424) += apss-ipq5424.o
> diff --git a/drivers/clk/qcom/videocc-x1p42100.c b/drivers/clk/qcom/videocc-x1p42100.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..4e92f0ab7e4016724af1f31aa4896655b1dc8308
> --- /dev/null
> +++ b/drivers/clk/qcom/videocc-x1p42100.c
> @@ -0,0 +1,585 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8650-videocc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_VIDEO_CC_PLL0_OUT_MAIN,
> +	P_VIDEO_CC_PLL1_OUT_MAIN,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +/* 420.0 MHz Configuration */
> +static const struct alpha_pll_config video_cc_pll0_config = {
> +	.l = 0x15,
> +	.alpha = 0xe000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll video_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &video_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +/* 1050.0 MHz Configuration */
> +static const struct alpha_pll_config video_cc_pll1_config = {
> +	.l = 0x36,
> +	.alpha = 0xb000,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00000005,
> +};
> +
> +static struct clk_alpha_pll video_cc_pll1 = {
> +	.offset = 0x1000,
> +	.config = &video_cc_pll1_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map video_cc_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +};
> +
> +static const struct parent_map video_cc_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_VIDEO_CC_PLL0_OUT_MAIN, 1 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &video_cc_pll0.clkr.hw },
> +};
> +
> +static const struct parent_map video_cc_parent_map_2[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_VIDEO_CC_PLL1_OUT_MAIN, 1 },
> +};
> +
> +static const struct clk_parent_data video_cc_parent_data_2[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &video_cc_pll1.clkr.hw },
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs0_bse_clk_src[] = {
> +	F(420000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(600000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(670000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(848000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	F(920000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs0_bse_clk_src = {
> +	.cmd_rcgr = 0x8154,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_1,
> +	.freq_tbl = ftbl_video_cc_mvs0_bse_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_bse_clk_src",
> +		.parent_data = video_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs0_clk_src[] = {
> +	F(210000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(300000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(335000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(424000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(460000000, P_VIDEO_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs0_clk_src = {
> +	.cmd_rcgr = 0x8000,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_1,
> +	.freq_tbl = ftbl_video_cc_mvs0_clk_src,
> +	.hw_clk_ctrl = true,

sm8550/x1e don't enable hw_clk_ctrl here. Is this an expected
difference?

> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_clk_src",
> +		.parent_data = video_cc_parent_data_1,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_mvs1_clk_src[] = {
> +	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_mvs1_clk_src = {
> +	.cmd_rcgr = 0x8018,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_2,
> +	.freq_tbl = ftbl_video_cc_mvs1_clk_src,
> +	.hw_clk_ctrl = true,

sm8550/x1e don't enable hw_clk_ctrl here. Is this an expected
difference?

> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs1_clk_src",
> +		.parent_data = video_cc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_video_cc_xo_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 video_cc_xo_clk_src = {
> +	.cmd_rcgr = 0x810c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = video_cc_parent_map_0,
> +	.freq_tbl = ftbl_video_cc_xo_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_xo_clk_src",
> +		.parent_data = video_cc_parent_data_0,
> +		.num_parents = ARRAY_SIZE(video_cc_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs0_bse_div4_div_clk_src = {
> +	.reg = 0x817c,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs0_bse_div4_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs0_bse_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs1_div_clk_src = {
> +	.reg = 0x80ec,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs1_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs1_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div video_cc_mvs1c_div2_div_clk_src = {
> +	.reg = 0x809c,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "video_cc_mvs1c_div2_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&video_cc_mvs1_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_bse_clk = {
> +	.halt_reg = 0x8170,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8170,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_bse_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_bse_div4_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_clk = {
> +	.halt_reg = 0x80b8,
> +	.halt_check = BRANCH_HALT_VOTED,

x1e has BRANCH_HALT_SKIP here. Is there a reason for the difference?

> +	.hwcg_reg = 0x80b8,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80b8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0_shift_clk = {
> +	.halt_reg = 0x8128,
> +	.halt_check = BRANCH_HALT_VOTED,

No .hwcg_reg?

> +	.clkr = {
> +		.enable_reg = 0x8128,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_clk = {
> +	.halt_reg = 0x8064,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8064,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs0c_shift_clk = {
> +	.halt_reg = 0x812c,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x812c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs0c_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1_clk = {
> +	.halt_reg = 0x80e0,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80e0,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80e0,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs1_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1_shift_clk = {
> +	.halt_reg = 0x8130,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x8130,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1c_clk = {
> +	.halt_reg = 0x8090,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x8090,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1c_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_mvs1c_div2_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch video_cc_mvs1c_shift_clk = {
> +	.halt_reg = 0x8134,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x8134,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "video_cc_mvs1c_shift_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&video_cc_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct gdsc video_cc_mvs0c_gdsc = {
> +	.gdscr = 0x804c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0c_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs0_gdsc = {
> +	.gdscr = 0x80a4,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x6,
> +	.pd = {
> +		.name = "video_cc_mvs0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &video_cc_mvs0c_gdsc.pd,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs1c_gdsc = {
> +	.gdscr = 0x8078,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,

x1e has 0x6 here. Is this one correct?

> +	.pd = {
> +		.name = "video_cc_mvs1c_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc video_cc_mvs1_gdsc = {
> +	.gdscr = 0x80cc,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,

And here.

> +	.pd = {
> +		.name = "video_cc_mvs1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.parent = &video_cc_mvs1c_gdsc.pd,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct clk_regmap *video_cc_x1p42100_clocks[] = {
> +	[VIDEO_CC_MVS0_BSE_CLK] = &video_cc_mvs0_bse_clk.clkr,
> +	[VIDEO_CC_MVS0_BSE_CLK_SRC] = &video_cc_mvs0_bse_clk_src.clkr,
> +	[VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC] = &video_cc_mvs0_bse_div4_div_clk_src.clkr,
> +	[VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
> +	[VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
> +	[VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
> +	[VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
> +	[VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
> +	[VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
> +	[VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
> +	[VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
> +	[VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
> +	[VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
> +	[VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
> +	[VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
> +	[VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
> +	[VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
> +	[VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
> +};
> +
> +static struct gdsc *video_cc_x1p42100_gdscs[] = {
> +	[VIDEO_CC_MVS0_GDSC] = &video_cc_mvs0_gdsc,
> +	[VIDEO_CC_MVS0C_GDSC] = &video_cc_mvs0c_gdsc,
> +	[VIDEO_CC_MVS1_GDSC] = &video_cc_mvs1_gdsc,
> +	[VIDEO_CC_MVS1C_GDSC] = &video_cc_mvs1c_gdsc,
> +};
> +
> +static const struct qcom_reset_map video_cc_x1p42100_resets[] = {
> +	[CVP_VIDEO_CC_INTERFACE_BCR] = { 0x80f0 },
> +	[CVP_VIDEO_CC_MVS0_BCR] = { 0x80a0 },
> +	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
> +	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
> +	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
> +	[VIDEO_CC_MVS0_BSE_BCR] = { 0x816c },
> +	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
> +	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
> +	[VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },

C99 for non-single-reg entries, please. SM8550 also hase udelay here, is
there a reason for not having it here?

> +};
> +
> +static struct clk_alpha_pll *video_cc_x1p42100_plls[] = {
> +	&video_cc_pll0,
> +	&video_cc_pll1,
> +};
> +
> +static u32 video_cc_x1p42100_critical_cbcrs[] = {
> +	0x80f4, /* VIDEO_CC_AHB_CLK */
> +	0x8150, /* VIDEO_CC_SLEEP_CLK */
> +	0x8124, /* VIDEO_CC_XO_CLK */
> +};
> +
> +static const struct regmap_config video_cc_x1p42100_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x9f54,
> +	.fast_io = true,
> +};
> +
> +static struct qcom_cc_driver_data video_cc_x1p42100_driver_data = {
> +	.alpha_plls = video_cc_x1p42100_plls,
> +	.num_alpha_plls = ARRAY_SIZE(video_cc_x1p42100_plls),
> +	.clk_cbcrs = video_cc_x1p42100_critical_cbcrs,
> +	.num_clk_cbcrs = ARRAY_SIZE(video_cc_x1p42100_critical_cbcrs),
> +};
> +
> +static const struct qcom_cc_desc video_cc_x1p42100_desc = {
> +	.config = &video_cc_x1p42100_regmap_config,
> +	.clks = video_cc_x1p42100_clocks,
> +	.num_clks = ARRAY_SIZE(video_cc_x1p42100_clocks),
> +	.resets = video_cc_x1p42100_resets,
> +	.num_resets = ARRAY_SIZE(video_cc_x1p42100_resets),
> +	.gdscs = video_cc_x1p42100_gdscs,
> +	.num_gdscs = ARRAY_SIZE(video_cc_x1p42100_gdscs),
> +	.use_rpm = true,
> +	.driver_data = &video_cc_x1p42100_driver_data,
> +};
> +
> +static const struct of_device_id video_cc_x1p42100_match_table[] = {
> +	{ .compatible = "qcom,x1p42100-videocc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, video_cc_x1p42100_match_table);
> +
> +static int video_cc_x1p42100_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &video_cc_x1p42100_desc);
> +}
> +
> +static struct platform_driver video_cc_x1p42100_driver = {
> +	.probe = video_cc_x1p42100_probe,
> +	.driver = {
> +		.name = "videocc-x1p42100",
> +		.of_match_table = video_cc_x1p42100_match_table,
> +	},
> +};
> +
> +module_platform_driver(video_cc_x1p42100_driver);
> +
> +MODULE_DESCRIPTION("QTI VIDEOCC X1P42100 Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

