Return-Path: <linux-arm-msm+bounces-101715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKOENZkU0GmV3AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:27:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A553979C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7411B301E964
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647113AEF37;
	Fri,  3 Apr 2026 19:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXSIPFJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zunm/znt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F0363083
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244436; cv=none; b=gIxV4Ek9CusMSlubo8NFHZ4B4Kd6KJSEWxeNqfXFgx2q2ffCkoOXEWBmUDZQDhB08vLCWJOx1TJdL2zUr80aVeZTnxsto/46U9jNroIuWU2Ef8Hwfk78cQ84/6gOuGHsozYgx8lo5CT4n6UnIHFxroJm1DZlCdaX8zTtAGEvh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244436; c=relaxed/simple;
	bh=OU3SFsCVwVCAtNYnROQaThuCZy/FsLCS9vTE9MUGr8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZu1Txx9mk6nsGvgol5ADYG8HVGvIZ2VxN9HOdIkBtLKXDuOPXelBWnd+6AZxlJigNVHD7qxiSOTxZvXEQOywk4aCvSCXxIFBwOogGipvOIlUCmF7xJOAgEt4eKWHQANDiKgkueGXu23ERglWij62nxpYOLTGk3rfQoZKlyIgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXSIPFJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zunm/znt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633AxVq93803971
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EeCH9MesYleZ440DjmzWy+Bf
	mTOxuDkYk/i+DHg42j8=; b=EXSIPFJyEMHuMoNIEscCihVLG+TT6JAnC8buXY/v
	mFHjcdfXBtXC+y6UqoCtQWrFAwwZxHygD+o+LQektSBsm37VZ6EgK+jV3WXP4QMQ
	WyYU4QgIJsNE+hPKZWEqf2bS/xVEcDltVpHk2wGGpgZgkvFf5zzmqHyoyePOXVpi
	6AU72sYWx2mNOOL8ki9EMdXYyj2CycU71pM/gmniluOAZXlLWbnqjnNlKuTeSVx4
	QIGDCgUHcGRQUv4mtLnnBUFNzrXXOcVkrlrXX1lDxS03eUyz9i0UzQGOu5aPlCC8
	BayyaSui3vxSjTn5S5cAETdIb4WtGCutIuU8rWpU7cgvqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dac9f9d0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:27:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4b81c632so39390001cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244433; x=1775849233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EeCH9MesYleZ440DjmzWy+BfmTOxuDkYk/i+DHg42j8=;
        b=Zunm/zntueM8AV7lkTvD3jJpxhUDIQOBVV1yLBz2qPFPRgQ+u9cMBMyVM2s2RZ+e1L
         nSpIju/KUighKNP7q7Xk8yguGzPyBWofHCSgamm8qJZuVo4gd5UkSla3EciXvvLasJK9
         O5hR3Pg/dgyEQsUmoPN7Xk4Mwquw7gUdUwfel3hZ2O6j/0oooXhb2ZnUov1HcAZd91mQ
         qjTTcFR8bgzB3+1YKV3iFp6ZIJvZd4DCUrNNADqMXXvh1APuLsdB/28i4K88Y19cbXaN
         YZJdruF3dFvL3h7A8az2YnVB6W+CnoIjPJp6wXJfcQ/vUQHZW8UokUwSHIstVY/hb18K
         SlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244433; x=1775849233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeCH9MesYleZ440DjmzWy+BfmTOxuDkYk/i+DHg42j8=;
        b=SN1JU3nqBjdwEDTJ4qGna3XbtSee79sbm33KOKzdKXDPx5hffL2bcoE0t4g1KypzLZ
         7RBLPo9RJoAcEXu9IvNR6zSyguNavVe8tOdknAsvvkpMBlsEiGm/mwE4dzb4VaPIFCVv
         nYApfD5BjZDFsRMHh3et3mzik7HbQLLnORqRtHCaiV6acm+mNkYy3ciI/YSM6DnJyW/v
         qtFkblbexqWbs+C4dBaTRCsaPeM4zz58E70wMO7GwBnKM63GNVuzyex+qIQ3opxiS7OI
         Q4zd82ShHo1fUaJUbS4FFe4N1hPQYatbUBTh05ct044Ynsv2D72Zijx/V1377pArQ0IJ
         vg3w==
X-Forwarded-Encrypted: i=1; AJvYcCWP6pf7qHujVh3gEbHLxu4PCmXiBEhbnX0kcKyRNRI6lZL26LQ7cl9mtQsD/Y5OCCxEwSgEbEUMjl07stHz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2MDTachpZcCgDYylMehxaDlxyRw59bXBvRG1yRYbcfOavc4MH
	oJ4cuytrsSnRW1OiBNZNnNrQCWVqCeUuI3vObKF6MsQiPITyYCC5MmSA961ni5oHmyM0+09QmMu
	Mm5SGcLaF+72rvnMjUxV8fw/ZNLj54POvxNhRpe1YvdZsn/MUxz793joooA4rbpYUMv6p
X-Gm-Gg: ATEYQzxFlyulh0qwPXA4IXi0P9z4uPy4WT8yL6pO/IUdmzyCXeZI+ms1iG/vA3C25K0
	mUOB6L2a+mKDXmUQopRpfaoIgG+wwTRuOoujC5THEHHDyi1TTg8/DBllBgfwDEaU6QxMoVMa7q5
	GKBB7p1VJdfBCasHVfSVuloFGiBfnUqVXrlKhn27oJGNXbpo7+0ldXDIRnYVbO+/M+lWMs945uB
	mGK/ot0nWpcBVWeZVRTYZIbBDGZnpeqic12YNyn+rcfQ3obltdlCP9xRsSidC3kE2m9RmegqsUc
	4dMvsvygqCM9bnFu0CRIBbjsN/D1cigqwlHc/Qio21UOpehmqE5+RFltQO9ibYzL9ySE5iT31G1
	0WIcfMSNOAf4FpsFN7Fx5mqcje2BOa9MQdMO0++Y2KeObmvykhOVY/5woNMFW2hOVl9M+Xoo9qX
	Icwj/KSulkN28TDG5t1Xz7xbsne8rG+qbYeHQ=
X-Received: by 2002:a05:622a:5598:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d62773eb1mr67413221cf.21.1775244433481;
        Fri, 03 Apr 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:5598:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d62773eb1mr67412801cf.21.1775244433039;
        Fri, 03 Apr 2026 12:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6089sm1638171e87.50.2026.04.03.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:27:11 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:27:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
Message-ID: <qt4hktac7i2nwuoenlbu4mujmlp3v54ak7glbzu2roxvz5otr4@ehkqawyhiqu2>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
X-Proofpoint-GUID: Bme29e2oENTug0y6FqWT3_3wzUqe3Xrx
X-Proofpoint-ORIG-GUID: Bme29e2oENTug0y6FqWT3_3wzUqe3Xrx
X-Authority-Analysis: v=2.4 cv=BO++bVQG c=1 sm=1 tr=0 ts=69d01492 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Z1Ti3UXaT223yONGORYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfX5vo79vDUj/75
 lK0Veol6S4Aohz7xNa3q/VH3y81Vwc8JcMInwJL7NlnC9Znr0aNuasNP17HTwv5C8Kns/IkuYHS
 RJY3Xy89SsL4adocxjMvXgcrFUVThf4xfpxkp5K++CGJaUoosrKLBIml34eH0t/XMP9VCRJR345
 N6WLXJlp/KRiLn6+wwjTLpvrGyaqgVcnIW+ZdPaN0r/yujwRe+iIbtagCodRhKymXy9+qV/AP/W
 o8ccCjSwSW7RRkCpRYEU2gAYrPoYo3yjyVORd8hX574a5/wEn7zZr40UZiTyN7/8oT3eXxcOHfh
 1CYOEx5FnekMYF2bM1lrNF34H43llPcJdP7TKgfOgMXi9YVbQ4KlbYaZDIIVlHiBhRh/SyIEuBc
 MJ0MRqiAMeV5lJ/XtHZhi83wj+oUepbfEL8oetQHvqYgF212MwkF2VJ6eWOr8lG6ZMQe8vLedQU
 /MbI5v1XB6Ot4Ewvwsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030173
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
	TAGGED_FROM(0.00)[bounces-101715-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34A553979C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 06:43:51PM +0200, Luca Weiss wrote:
> Add the description of the IPA block in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

