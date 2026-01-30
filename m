Return-Path: <linux-arm-msm+bounces-91276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEHuHySMfGnvNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:47:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3F2B97F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A62A3006926
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86E2E54CC;
	Fri, 30 Jan 2026 10:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+eQEEtX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I968Etkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF256333453
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770008; cv=none; b=pzxmjejCr1PV2HDCvZMd7aMBate0tyvPNfRxxRhHuD65uRehZ89q3+SVKwe1wbFGo70OWEKhGHbe5T+udy0d9815c24OrcB4ydhJ1OTXmJ7paXaxxiwkFpa9mGRN32O0lgEPu4b4yJqhgtZJ4H2FD//fdPAngHVbJ9/3aCi5u48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770008; c=relaxed/simple;
	bh=Q6G4DEwQu2m5P1afAWHiI7kox4Y4H59hRcvGkimgfYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh5bso8lhUTBzad7YL2EDF2t/Qott89Wdpmm697ifHPaKpWfIeEEg6O2Cl9fEhyrJD7SW/bhSK0pYGL9Z2mTxl2wcOMUbClclBXwoPpTrRP1BeCjLscLkEBLWdNTXLWWSf8MJjVZ41MDG8OYsg/q2H0R8/Hd3aqDM9eNRQ7V8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+eQEEtX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I968Etkb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U4bRoh1485285
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rr9QiGGiWTw4PJaJOi5tnRSK
	O7seyqsjCDlJhZrGyVw=; b=Q+eQEEtXmX5CHrStHjZpHTWogkHf1YqYl+zSv7Ts
	eh1En3jWVK26aEEb9Kw7BrVeBN7HWAoDIgE9sHEOVs1bpYyojhMRTNxZMsVvZ26P
	nGbNepGSkct32JCxXhmhTuoyq5fFTx1H4cOGMyNR8ZSWl1MSE2VohuEjWGj3y+hJ
	4c/vOOFUJT6nfCeMsP08rqbNuUTD90cG4C8tpp9b4oOsePF+u3v1RPldB/NdRz4L
	cNZxMBwMwFLlVoEi3CMQ6mRy2i+WxRqg3rcRdlHG1iLih9HNYHcz2uhCogEgWHK5
	1Gfr8ztjdbzM6N4DqROAYMImLW3yUnVd+4fyqKkIWgQNpw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsf91w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:46:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9483db35badso2263991241.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769770005; x=1770374805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rr9QiGGiWTw4PJaJOi5tnRSKO7seyqsjCDlJhZrGyVw=;
        b=I968Etkbcr8wOJnyzG8MnKRhr0yt9fsCMgdWmLW8mOHXwxzcXejhqwHPtIp3QpPZbn
         bif8IKe5+/T1X0A2bwOYRh5f3ja5Fuu/G7BeRCYesT0jphfuplrD/+Hm0bTxl+hLm1a0
         ZquMjOiisgEcyYumBaqldUbTuuaJI3Dns4QsuHKLygXmK5ouJnZSrjecSmCHfOQa0/FF
         JKEAWZPhIzAI0zSqn7opcsF0chSTdZ8AvNG8ir8h+J8aBb5Gxc6iOorpXy1YuvgjSz9+
         xKxs98BzuMthJ0C3KRBqRZIDlb+wOnsGUhK1eIhHloRMqs4lrrZso5lSvbLJRo9U2T1k
         607w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769770005; x=1770374805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rr9QiGGiWTw4PJaJOi5tnRSKO7seyqsjCDlJhZrGyVw=;
        b=kB63Hcypha927VksCaRZ6sJFmrXuoJQN00qbZNxLoq1BsmpbRyRYSeHkDhBWpCessO
         BihPY8WSXS3NoKRp5yfX5eUtnCj6xiO8F/uLPrcH4S7qc5bfxOo8Q/yMLw5AqOZALgF0
         XMreYcnglzOWxpQ/+wP3mlaJFRjStkawBKBsuAWXGN7U5TtrBjQi4XX4wX/pRYZddv6p
         nDajiS40UIKCJF7M03viMKlu8RXZ1NrxLuvPQQp8aYsTVsAAk4OnZUTkQhu+RPUcyaTk
         sXoG63/1U5IyhdjG25gXWkSMBuanA/N7NUM5+/shC/MgM5eLcIa77mcmJCTV62SSIhn4
         ji7w==
X-Forwarded-Encrypted: i=1; AJvYcCUPk+QHRYLhrELc63RD8tMrycqDKyCNPdtuvV4jR2HPXBWGeBiAYxLo+Yabk1igIcwdStrSvbDn9g+4P/s9@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtqUVUdR2gLgwrwQPWu38nTx4GoXYV9+Jf/KjIyVsyKgKyjNo
	askxNTDSP1Pmrg0UJ3ioobmmeRlzIs4r7TsFYf7GKelToyQjCYsblaggHz+jp3FYMH4km68/8FD
	KWdTGbfBmIldN1U/Idieu+hAuF+2sh8NzHMVEapPnu7uf+fr7cOxDO4XVEhkYXyt4ZhZx
X-Gm-Gg: AZuq6aJaKTbmLzra6NTKzTCw2z1V8gNIBSw6VVgLsUPv5mflrYtGNSWtQ6lva/uFC7s
	8wHyDiorJBU+PnWMCHQ/0kgay9//KsHTgW+JSwPwiyYJSfeElPj/56DqSJTiB+OTUqVa9AdsvjY
	ie+UIJXpz/+PbL+bMi4uCcvdURiG2snjHYsropCK3jJDqxc9hG+WIKHsobyG/UnjMy3aYutkhSY
	ulFJYsmgh5gSS6nugU90DKMBdfxtq6qgY9FimVhft1OrznmHg9x3abVHjJvoDl0azamgksMYNLq
	XLMu5fz1BjfH+VbCiwzg6q4DDNsC7k3FXEXjJ/hBb6q2u9v3foRy0CV+8/Tg4WMglEdCNazznoL
	GLsYQOkNk2Td7PC8ltgWagd2cXzgB/gAWo6hgZLeCKc42qviqRjSg0ReAcrZKduitm+xPWxscby
	qC1bM7pHvFczN1WVYrNjpVASs=
X-Received: by 2002:a05:6102:26d1:b0:5ef:2457:8015 with SMTP id ada2fe7eead31-5f8e259eb28mr708226137.29.1769770005339;
        Fri, 30 Jan 2026 02:46:45 -0800 (PST)
X-Received: by 2002:a05:6102:26d1:b0:5ef:2457:8015 with SMTP id ada2fe7eead31-5f8e259eb28mr708214137.29.1769770004915;
        Fri, 30 Jan 2026 02:46:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b6fcfsm1697127e87.69.2026.01.30.02.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 02:46:44 -0800 (PST)
Date: Fri, 30 Jan 2026 12:46:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        Yi Zhang <zhanyi@qti.qualcomm.com>
Subject: Re: [PATCH v2 2/2] arm64: configs: Update defconfig for DSI-LVDS
 bridge support
Message-ID: <cxpj2seziv5kgblf65yy36hsg2gq7abbp73gjhx6dyvlx2ipev@azfyp5ksf2s7>
References: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-0-a98714fa1531@oss.qualcomm.com>
 <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-2-a98714fa1531@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-add-lt9211c-bridge-for-rb3gen2-industrial-mezzanine-v2-2-a98714fa1531@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: KngG7zus7eLLS6o-zYwqtPod6cg1XWTO
X-Authority-Analysis: v=2.4 cv=EvjfbCcA c=1 sm=1 tr=0 ts=697c8c16 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vueofUzKTQJII_GiKD8A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: KngG7zus7eLLS6o-zYwqtPod6cg1XWTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NyBTYWx0ZWRfX04lVr2gpwLHB
 AgdgSomQN6xniEpUP0RJJ2ZlAooo0M2xKsG48yUjBS1Q/3DlSZ8Iox6xGrxKZsxkXPFtEB5ULTE
 ghEFP1jnOO6MJEiS7yX29lHeKjzA+F5UCCJIshiPsK5/CP6IwobLm8M76X8w5eOLBWyZb++ZVeN
 VUtSNOYDvl1Z+RL4ytglBG911C1tvIrb+GKLvVq344xYDv7V2J8T+J5/iWhCXIHc3dhQYo8SfTd
 zpq5NALAlDzBdZk93d+ZnZiM1ADvsh+e2ukoZLq7Af5NBO8OuW836rywT7elB00ZFKQQkykCkNa
 dEgBJNIJmEvQYIM9yQEvItMMrEX4Kc/EoFk3an6OV4fcTZlnUgx8sNvUg2hxEt3Gd4PXE1ioSb2
 xEhjTeJqTdyWMBc1mtsMcXFKNL6I7RMklMM5vUNZgqRntdmgxeWEbFl/Vi44Buk2Cz88ZomA3SL
 fPMNYTAUiO3Wm6I1nnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91276-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: AC3F2B97F1
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 03:57:26PM +0530, Gopi Botlagunta wrote:
> Enable the LT9211 bridge driver to support DSI-to-LVDS conversion
> on the Qualcomm RB3GEN2 Industrial Kit.
> 
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> Co-developed-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>

Two engineers for a single line?

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 00d15233a72b..b8a7d299acbb 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -959,6 +959,7 @@ CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
>  CONFIG_DRM_LONTIUM_LT8912B=m
> +CONFIG_DRM_LONTIUM_LT9211=m
>  CONFIG_DRM_LONTIUM_LT9611=m
>  CONFIG_DRM_LONTIUM_LT9611UXC=m
>  CONFIG_DRM_ITE_IT66121=m
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

