Return-Path: <linux-arm-msm+bounces-93081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIbCKMQjlGnXAAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:16:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7AC149D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E09AD30333FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B742E62B3;
	Tue, 17 Feb 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FK5vTtgA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJsQl9B+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D390218ADD
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316127; cv=none; b=opS5IqzNhD2hJ3C2VMnnag4R3pkGPleeAMxrtrh1RwSJuRW+CxbI+8Cw260MNIF3Y+i1D77ixPHFEhiM4XaR5d4bnGgB78thQQQ8XllGviF6bvj9nDreHq5pLmE1vJfpmM+NdhopK2cpogcLEiVqB12yXSObT7gNVQh2HaoIVqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316127; c=relaxed/simple;
	bh=5khXPLVdkq0IO6WXh6GmJmqkZhaRTsBQfl7fhgZArME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcL8qEB/ZxS2JQ0lUVdu332wpTYbKEZEEEWZSRt1F3gr3ZyGToSVhv3LjVO4fU1pLPpZkBeHHifb1lktTaiA3SL4jpNUhbXHQdOeCl6rq1pMMZt7GV1l7meYsxQrg5r0LpZ9ZEWbRQ0s5a57zUuZrzE1wuOlWcNYek7Oe49EZQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FK5vTtgA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJsQl9B+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7uw5850240
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HXkpE4ti9wEwLN5yuVPblSTE
	tVh9MlNvuKA5qEsWOmM=; b=FK5vTtgAsTYvTWEH2F5hkKnYOybf5YjoZcu3do2G
	A+JxmzahGO5sWYjXSoLjFOT7DEgn3eNbNnTBnIwaO+yA2BFloYLrq8afjxkoMRmE
	tWe2dQhAn+990MyZy9UbesWjmXwq/klwQPQTA7l2rvZ6G3/pLqWk2Cs5HoHZhsfX
	Jr4DewLYSe0yNf9mjjTlrs1IY1VQ5FWaw0i7lWhf7K7X4HBz9qExDKuQFM15YdG3
	6Ax3Qj0IdsggtRFQjQpRn0B9UmEZHeoZutN3hoY+WdCQzmMplMQxx3toeHbhD/Do
	Bw/vsYrFx46Ux+1TQ2iMTNgOgwI2Wwrab7aqdiCazKn3nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrsjt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 08:15:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b6b37d8so2424151585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771316125; x=1771920925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXkpE4ti9wEwLN5yuVPblSTEtVh9MlNvuKA5qEsWOmM=;
        b=BJsQl9B+woWqETpi1ZrMAylbsnKr8iIDP6JVOwQoEYJgtCITLIo+1GgPnWJxB2hmY6
         bxEIABHmGdFAWByzKEm4SpPplu7T1PUyiH6DPV3sSyX1wW6Q1xsYxAXnqjaosr+9Ud+o
         0ww2Slxph/mJXE6iA9K6asbN+j950IB8X8XPvjGZyPO+meFNKCmYg6B9cyXzecF1DNjM
         xTdjOwHA6N3Jiz2dP4EAbajZPNTOmvGT+v6NO/uTvyvMj9XPJDbhs8cgyCV+JXluOL9m
         1fl9Kv2F44HN5YXhn6pLQszbD+HM+nYWfKN6c60VCh6s54px5uuCMb6yiYEDs5F3YkSx
         0JkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771316125; x=1771920925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXkpE4ti9wEwLN5yuVPblSTEtVh9MlNvuKA5qEsWOmM=;
        b=g12bnJgulxW3l5MU+WBOcelJMZVg/aAldCVQ05r//AmB8S2NVy3UxR/AvINh1O2Dlx
         InBXM4eLF96heBiV4/XeXwaCGkI8xpsVdARnBxQzLH9lqZ6BVwVE8VyR3pFnKhBtjAxD
         nzKwNQsaC6ytiOmo0MLXNnYEzTad4vIS1EL1ZFu2qPudacV8uRtn/yYesVrG8GhkNXgP
         MECEbqCPLLV3aMkI7IKggTdT2b+61hNvO0jPitSFqGrQwD7ERgijtlSTuhsGW0zNiVuo
         ghgUtg9jatZPUjCOYADHjpBzI/5uUi6Vqp6yh/PXVzuX383sxDN5dS/j7fJMA+vV75tB
         voEg==
X-Forwarded-Encrypted: i=1; AJvYcCXUAgQPWErvHBr+RV1XASXR0iF6i1WqN/OWEYXVa/BiTPBZk2ZYSqXdASTftOByTrYo80gzZJKb+PAzzqGQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJ32xVib5dd2DLAUBi3QajVr7CiFRQplNDgLc5z/X1LvYiYmP
	E0pas4+Rugk3jrQAKmb7fOJbexg3krv1ekVo211yAT0Rk1okz343nOD9ecVJ1RkUZt4hBtX/71q
	nhdVuu5jKRoHnSacAbnhc9ny3m1mqZSGqBVWGiBatPl6P/lkIpbLmq2IGXdbS3zLaU9rt
X-Gm-Gg: AZuq6aI8+Qo0VyyIcN8RLq/WMofDzuaekJAfOAxxfy22zIJK3WbCKwa8NzylIxRrNg7
	+U3O9cd6LxxK+pHjuiKNZmSgE93kkJkRYPiJ9BVSayXs7Z1fXUA0A8gKvoHTMqN+2S+LomdTnA+
	WXiWsDzwaczRsEzGeUoj7G4hX4PA3T7bR/KbfEJoRoY0V9ARec8ic21MStJ/gciGmeYl3/8x+/U
	MjMG9QixOWwvwLJFL7yN9/FRozBtv2tx56RZnZjSxCHTVzjf/OxOahN9NT4XhApIEN2kMMfvA/0
	AAGL9pYvbepKvXzw4LbT+hZZsYi4m8H7kywRu2VPxsnbJL+g/jY8R4ctUkU8pmoUSFFLk5J+53v
	SQeYLCsnfklhaXuHlq2X2bWIFIywuVVKWpRvBtzezVCMxyALQos2d3iaYNyHOWIQcA1OurtUo2U
	Vr+2oHhsnwrNEpNWCjrK2xaX3W7PLa/JISa/o=
X-Received: by 2002:a05:620a:25d3:b0:8c9:eb6a:1659 with SMTP id af79cd13be357-8cb4226cc2amr1312468885a.9.1771316124963;
        Tue, 17 Feb 2026 00:15:24 -0800 (PST)
X-Received: by 2002:a05:620a:25d3:b0:8c9:eb6a:1659 with SMTP id af79cd13be357-8cb4226cc2amr1312466485a.9.1771316124551;
        Tue, 17 Feb 2026 00:15:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3870689e107sm32368771fa.14.2026.02.17.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:15:23 -0800 (PST)
Date: Tue, 17 Feb 2026 10:15:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add Eliza RPMh Power Domains
Message-ID: <vl4v6mrd3vcbrurrsb3ak5wxjk73e6sfxfayoneup4q7jjl7g5@47wjjuf5ifev>
References: <20260216-eliza-pmdomain-v1-0-c51260a47d6d@oss.qualcomm.com>
 <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216-eliza-pmdomain-v1-2-c51260a47d6d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994239d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=xe-OtUFJ1rZIwnTt7KYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NyBTYWx0ZWRfX4KCuJ3aQPP2v
 ABsQtrLnffWfvlEL2R71TOtPZaWmuYQMKwuNMtLQwQWPzV2mVz5XXnFEPTcMSh9CR9al6bVpvRd
 6zXbheHb4xis6TKHRN7AOa9ieAlcNVq7TRtDAkg5fxfMpxgXTmCP8/tYHDrAcSqO5F/zJfLvlgh
 aN3Quau7SjcR+ZtUXVeCjvk4VTWlmochM79ww3LIzzZoEhdsSFdKOvgZbfyQHiLNZl4LABzIL+g
 uhkNeTP9cckwiOtpTu3kE6Rqz+5gKTssJ+CmjfulxSVLgxoydIx6K90ol2frK+SizncBzPvmP1p
 /87ICvZ10wwcTlMUUNay2EuWf68oZVzDwnU4TuSX19/yfpvqXxvK4CwCeJSl4mh/HbfU88GO5KK
 3kNudNxxXvtUMJZbz6dFuYc37+cQPGiSjnyX6HSo68qaBUXlhssEzDV/7n2V7VHMA1yTYKI08LL
 LxIAHd3+JBYqEMY8CQw==
X-Proofpoint-ORIG-GUID: aQDALub5fM_aL7DuZPtw9rznDSofSlmT
X-Proofpoint-GUID: aQDALub5fM_aL7DuZPtw9rznDSofSlmT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93081-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE7AC149D06
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 04:23:19PM +0200, Abel Vesa wrote:
> Add RPMh Power Domains support for the Eliza platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 19849703be4a..0c9a3995e06e 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -217,6 +217,31 @@ static struct rpmhpd gmxc = {
>  	.res_name = "gmxc.lvl",
>  };
>  
> +/* Eliza RPMH powerdomains */
> +static struct rpmhpd *eliza_rpmhpds[] = {
> +	[RPMHPD_CX] = &cx,
> +	[RPMHPD_CX_AO] = &cx_ao,
> +	[RPMHPD_EBI] = &ebi,
> +	[RPMHPD_GFX] = &gfx,
> +	[RPMHPD_GMXC] = &gmxc,
> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,
> +	[RPMHPD_MMCX] = &mmcx,

Should it be mmcx or mmcx_w_cx_parent?

> +	[RPMHPD_MMCX_AO] = &mmcx_ao,
> +	[RPMHPD_MSS] = &mss,
> +	[RPMHPD_MXC] = &mxc,
> +	[RPMHPD_MXC_AO] = &mxc_ao,
> +	[RPMHPD_NSP] = &nsp,
> +	[RPMHPD_NSP2] = &nsp2,
> +};
> +

-- 
With best wishes
Dmitry

