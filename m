Return-Path: <linux-arm-msm+bounces-91098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEchFx6uemnv9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:47:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8CBAA5C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DE0F302BE22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8781C1F02;
	Thu, 29 Jan 2026 00:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7K2Dy2G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSBSKRYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B63E1FF7C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647589; cv=none; b=pjyil0KxFTVuMQgNj1g81fCVEF3brnoS5u2ORfKAfupqtnG+R9tBtK7iLy0ONOgfeYUlApGb/ouJR8vw/CNQ5J/4G7Wjk6J/Tn9Jt3w5WUDZ+MrnSw7nerkt9MNqQKNJGHeEyn+NI3woGRrKor42DHU6yU/wgZYtH07e5vRMTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647589; c=relaxed/simple;
	bh=tJl8AmnkxVmtzONaPOUMaRuyfFa+3zLHTQjBIOt0jsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4rGWp5a3MJ8SUdgJPTPmIVhcdmzHtfXfbGJxX2yKFgvhwZeAhBvUl8Q+bFQcHuehbSXmgOOvB79pJgBHBoAVTXCzmoNFKxDybjH7Rzt2XkUikprh7qY4p7rwys/qBrkhi9YrjzFjxffBp0VEVQf0m5j/m60Adgib/fp8Pp7ZN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7K2Dy2G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSBSKRYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SH7Zoe1129528
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AtIWJ2oqLHCj7NU8VYbYUvp0
	nuWKS9o2KY3yqQqtkfY=; b=K7K2Dy2G36aDYEkBEnUzco8YhItDhLxt5MDMCjvT
	k0hChKdVfKZxZMGUNlzpmsdXLsRc8e1zrGBCmQGU/5pXTm/38ho5U07Cf3aEEo6F
	RzWGoHHUiau5Fv0pHhUHLnXhezs6VIhQK0dS4ZKLtp4RRvBsj14oVk3oHZGeU3Xc
	rKli40BaUekCHwWSnfjPa1krYTOVZcvSDMatfCuWb94UmksRKOUQ1DndZWu/asYA
	85OwbQVNJ+utqM6G9MEuM8aQf9QeBIve8ROxuZRJTlReQWk8Qw0mi6ehsgZ5Y3do
	DlBXFE8uS7dhJEwTCfm6i731t+ZpVtDW5k0mhq2Jp75OSg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bypk219up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:46:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5f58f90f83aso1405507137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647585; x=1770252385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AtIWJ2oqLHCj7NU8VYbYUvp0nuWKS9o2KY3yqQqtkfY=;
        b=iSBSKRYUzS/k8ccUqgG+Xh7Wh9H9HFbKDZxo5ztnU+Gyoko8072RYz7pmLWczL+XQU
         uSNcKOjko98m4EEg0nSlerJk1O59yZ6h8q5CvSTFYlg78BCMtRcqjBveUfGuOZFWK0tN
         WTZqUhmfu7/4GnluXMeW4Q9PrFijbTYKtYO4XK9KCQ5JgDOY1d/drn1a/53tIixTLV/P
         p75Q8tpJJwXrWHKbn0K6wQoukH/O+O5V+QTrYYZ5KfWYy+YT7zSVvFxIh9abWj8EYREw
         2uJd/P6x7zw6UWp0hU7r0xFfv7nvxm+c6PwhBswu5CkKEm7LMswbowXGbISsevuV5mz4
         2GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647585; x=1770252385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AtIWJ2oqLHCj7NU8VYbYUvp0nuWKS9o2KY3yqQqtkfY=;
        b=xU3ZwTSSfAwnPD5m/Wk+OLhoRDr9szDwA2jlUbjlLw9jDK15TiLlJ8flVrT/3cIEwO
         rTzKXnfxaehRvzM3OWrEuKQzATPOlGJL38SZWYu1pbETHzxaTah5BiiwoMWBkaB5hp3q
         Si3/SM++enhf8rlo0UBVzhwRvLzNtgl1STY1o+NzVQgprQYX+zuEoZeD1Xtk0Oz+2sOQ
         dy5Wcm3dLQ49rjrWSOBPlCBhjRZBbRJd2YOo9TTyeWoyVU6cBNcMQNnFfKM2LYQFZr3h
         UN1uLy7Vd+S/MWR2i6MN7W/2hFGxh6JfmCTkkqeoM/WUc2BpYrExau5Ad0qVn0aftbf7
         PPXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+0ZwJ5V/AVPI9DyNR9dUr7p7NLatcxJFhKuDhx3UGk8lFZuEa/pgZBoCCAmH4nVRrG96bu8Ki0AT4SEHg@vger.kernel.org
X-Gm-Message-State: AOJu0YzVP1EXYxJBKOuKqsqoHp1pFAIIHcqAmp/YzhoCGglmNb+xZ6Wf
	YJX5aeVs2Oayj5j2oQnzsvCGrEOn6sujdIpQz1Z5fFgiRACI08+Hc+rt+T7yzTMzIfm0i9+OzJK
	/R745tnnx8qUqZUX1L/XeQOaZnzg556Knx17mMNi8LLE5L6GHjEgQMJTKTtvi+UiPT7nF
X-Gm-Gg: AZuq6aKaWEbMOvvkdt/wwprO7/5rf168heFHxSNsTau3W2abrahKBYAInNYgMaoUDA8
	x3Q959dnv9bJuXPE35AHZPwwqrc8wZPqiim65Dks9FCG9U9/lFuCe6AfQg1OpFHGU1M0vbUIJDY
	vvdzMrM2ifszCbBTs6dqkciAnYGF+3IAmuSfUkOHf31DmCVcsS4hLkeweMzR4TJNZjAnU/4mpSD
	rLtZ0XvAMTza1OXGWfgFZUis17Ig22SxtwSJ5tBln+ErH7zCsSj8QnUZGwOTL88rjELCmXAua8X
	b2RWdIq3/mX460I/P7E8LPVj2rAvrQ3sSS2OUZOqyj9d78h315BOI192jv9/+OzIns66UswcbK+
	97/EL0eDmxrFbA9ff52s8DGtYktIc0fZ0Oema77OMFB3WN5JSvT2adcnNu6rurYjgFXsiiwdAB5
	FEJL+MfjyB9CO6n8uidOChC+c=
X-Received: by 2002:a05:6102:1686:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5f7243053a4mr2194501137.21.1769647585509;
        Wed, 28 Jan 2026 16:46:25 -0800 (PST)
X-Received: by 2002:a05:6102:1686:b0:5f7:2430:5340 with SMTP id ada2fe7eead31-5f7243053a4mr2194497137.21.1769647585118;
        Wed, 28 Jan 2026 16:46:25 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7033sm821873e87.68.2026.01.28.16.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:46:24 -0800 (PST)
Date: Thu, 29 Jan 2026 02:46:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
 definition
Message-ID: <imqu7bovwwqycci3w5myjgdbdnsz5ol3meavdu6tgfixpr7hvz@hhwobvjxqoqb>
References: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-sm8250-lpass-lpi-fix-v1-1-8e68f47dfeb4@fairphone.com>
X-Authority-Analysis: v=2.4 cv=PfvyRyhd c=1 sm=1 tr=0 ts=697aade2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=KqVGvLWFIAZGjLrJOEQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Db3xOFzoN3fCXJFUVRe94OOV9RLds6Z9
X-Proofpoint-ORIG-GUID: Db3xOFzoN3fCXJFUVRe94OOV9RLds6Z9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMyBTYWx0ZWRfX/PBX9GMCHG3L
 1cH+HqZqDy9hVrqAXfupBoFQtr2k7LOgfSNTm+Jnc4YhcaZLboiySgrD3dra4ZgAhCyxm6j+9Hw
 JH/VBVDo5DJ0VWViSBpzDDH4HblVgfWAr7vHZ+tyFnKIS78UY+c1gXs7U9EkzJ7/ZIYc0QZQ1Se
 bfR7hITU6cdYD6Z52nwfjl58yIUMgJ8dOeOvHqPQPuGY8hnu8mDDqfVF+688rbeaqhCDCEbB5EC
 qNW4WQVx8hrVI536arLIPBxHN6zCRSnAWcdjLuBhTmDsZR73aLTXcGDbU5Rbz/PcjkmwUySRWUi
 5oOfPY/qVDNew8J0u9dEKJitDMz3Fk380Dj4l4p07nglGmVC8Qohkjb73wkOGKsq4U7SjRNOacZ
 Nrf5SQhnR7OGfo909p9Skl/gzSZ5iOfzf/GpffaxbGlE7TwR/JE7dPE2e7vImWbamFRRCDqPR8+
 nxckeMmDtZPJpYXFlHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91098-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF8CBAA5C2
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:22:28PM +0100, Luca Weiss wrote:
> The i2s2_data function is available on both gpio12 and gpio13. Fix the
> groups definition.
> 
> Fixes: 6e261d1090d6 ("pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

