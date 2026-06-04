Return-Path: <linux-arm-msm+bounces-111211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id agzhCeJ3IWoDHAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:04:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2F66402A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 15:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nydNX8LJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Fk2UEK/G";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111211-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111211-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 289EE3001F92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 12:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FF047A0AB;
	Thu,  4 Jun 2026 12:54:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA8C477987
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 12:54:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577676; cv=none; b=ZcDPbbXdOHBIX3AnSDK0MIEUqlA9Ht3ngZ8z7t3Mn3IlO1kcSMYuj+/kEakVRInAQcn2iTMXpW0OgPxB5IhyYohe/ACM/FPPFzbzj2/yi4mlEqBGTZAheg0eVCziQ/M0U9KqBpRwypgaaT5ZDtTMkaHyLHA29p/Fe6upVbO3KgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577676; c=relaxed/simple;
	bh=OwWhwAotVQH3rsSdXQRsQBZTEa3eqgdHd5bY8AdLu44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du3V0yOit7ATdyehO/You8fN/PVCBEwZ7eNdO1owSpopgF8nSdZQA+ZuEv2FEPXexKltGLJm/NLAb9QoTJ3nZaXDKWK1ADTdIedwVcwCqi9rrQtnr+laPcbRu6sy62ce+ky6NXluuQLwnvGuQAvkZKyMg8mz4Mdjh3Si+C9q23w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nydNX8LJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fk2UEK/G; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6549v1ae3233931
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 12:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y1M+AD0HzgLHXiH1WXXCQCSg
	tLsSzH+qDPseKkIaoiE=; b=nydNX8LJLy0aABXqeGgQ/D/uwwN5k/oQ5EQpOyWA
	rHV0yg6xamAmp8Xiu7C/tWRX0AUPrPeVD5w2tzaJQ85lKH/jGZ3BOH4oD25DpxJU
	7xCkntxHLwbMQx0KDXdSeDVi6uPRq3ChwAzq3OAj8HcV7aNzQKipF/uFcHZt2um/
	1k5mguRhB2LaVYXGfhvv9jPK0C2Wi5L64R5wd/Bck+8FjsxCWT1wzjdi0MVF32SP
	dIvxb/7pLRmUjCZqOZKD56zUG9Y1IfTdVWUhSCcLh/lMf7d5Qo60Tu60lP6oH+st
	rmcwapviYznuh+b+4RgRwUU3uWEeszhkZHDtcFmMOza8DQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejs4s3stk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 12:54:34 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfc66167c4so248409137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 05:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780577673; x=1781182473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=;
        b=Fk2UEK/GxgNvkGauZwgKXUAp7+bJEEBwq1Hc4c9DJs+gpWpaL4LyaV23F0czhhMpNA
         sqHXOHtYrgRMyMOhpT846ZVBFkRnQl/vCF/kv+YMwidADYpQOggXNy3Wz7jSUXBf/7ju
         WY2F7gyxXbwrwYLzwn/WlLPIyeMzRwHdDHH2dxndNQuBpRRcW6x+wGpri6Q7XZK60XYa
         u0rVH+Pbh8KVw7FeMfm0oRL3xEsalEyYnes6CAyXkXTy0xWP2bgmKQGsvZVH446Oq8Fc
         /F7JV0weSptwxSCPGNX37dHqAlTVuQOV1eD1q9Bt+HeM6QQj3p2zYb4NswgdhO5Waozb
         a03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577673; x=1781182473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1M+AD0HzgLHXiH1WXXCQCSgtLsSzH+qDPseKkIaoiE=;
        b=LzxsoC6XuK3uibblWsRswCDN4siSLWjwywuWdKPhHS8n9j72xBebP9ZZd1TG3j5clA
         +56lY2LJ0zXEHrvQKqV5sJPoZJWhM8jaASaeT8/2pa5obQHX9mT1WNExYygL7WJVZ5W4
         llCQQ7P0OsbWyM/atW2q2PEfDsOzcoXSQuYdqHvFs74Qwz34PiU7e5rKCHtM5sNkajhv
         Au0EurYi8rd6RQ+NxrzOLVfrLxsfKKh3fVWJEOMJyPqEfYsHs4BYYCF+KfJtemroQdJO
         sz92xnhbPYknKi2lWSotjyPsaIh+PtoyRXItSOE+UQnbiD0Uy0zqPHisnrUeD6XKoDV/
         V2Kw==
X-Forwarded-Encrypted: i=1; AFNElJ9hv6fkgzE6plJJFrbsGFsFFSiCFHqpygT8WoAF0/AEvw7YXl/4TRTKxzQjZeJBFh4ngCrEqn57PQwRBU8W@vger.kernel.org
X-Gm-Message-State: AOJu0YyOJ0U1YEzEG/xwmrgkPPDWzZiYM5wLC6/OFfWj5KKbiBuWggkx
	VYgsLZbRR0k8K4nubU+vBR3/aV5YdYYTvngrcRKXf6wuWwP7Pg8WTnAbo6EKiu/Mln+CLDtdjNL
	+7oK/nCX94032NCshsWQfquMH3LjASwle4soqjQ9l3XryzWgsP542ZW2k9LIaTUq6M2vS
X-Gm-Gg: Acq92OG+Lvx1tBqun/4vtJRA05GiDXIKM5d0AKUrCr4ndlBTXjY5CHx22xSCliVowYP
	+rrnaRvF2j9AO9ezlL2Iih7LGLSt6hJFjHofkhJ9NGpsN8CE4LB7vb1lSDSIG7rwCWIyDJEp++o
	lhICZS6Rg/3zjwfch0a9UmLtB+SbNm2ejJEnceqcBroFsfDav+T7eBsOzHyKdu3YILq0VsILkLt
	b/ZMaETYjl8YIwdcqgLLOqv+WKo3fv4ujnZ6Uh3Y1RM90V1JRrMnQBDDJbC1EZc1co58k7Q50PW
	6JqkG2zODJ6DWxKY8Yi8EiCt8X2oqG4Qn+tXwo6LY6Vcv7VndZsOLsK1KYzT7ma+QsZ8A+8jnU1
	2HmjEhd8mXOyzgSiNVh2qkebahGrLod309Ow0fENSoJu6y7ouVUH4ULMyfH09Wd30nWPdFolrNg
	fY6zqj73HxA02i0Yq3FyQuutjRpmHsKhVPpNWYdxOUvvIdeA==
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr4587378137.6.1780577673394;
        Thu, 04 Jun 2026 05:54:33 -0700 (PDT)
X-Received: by 2002:a05:6102:554c:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-6ec2a218ccemr4587359137.6.1780577672874;
        Thu, 04 Jun 2026 05:54:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed9eesm16343671fa.40.2026.06.04.05.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 05:54:31 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:54:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
Message-ID: <wn2tfhmskrlf6ewusqt3uv7xg62fl6h2qz4qz5dyf2az3vumxd@dhphx5seowr5>
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: e3HMP-ONd3plmxOl5n9N2a6shIPjT1lS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDEyNCBTYWx0ZWRfX/IBrly62Q+SE
 /HFD8DcAkvwSXNFHhXHDjraKdeMpyXMEOtqqPiiiwu1IbHYqOi04WHMAw+qz3AM9Y5AccgYKN+0
 tRLozI38cOsAwMiueiFmFVcci3NGe1UFLWuawa+ObW8j5vqtlSXwySumcpDKs+iKWG0mGtA+zbw
 CKibi+mz/ZlYXTwu1vwprHgDq9m6HiHuX3PLh/h6X3Qpg9DykxCo8+VPmMCmaxaJKaX4nPGBGWW
 Ike3a3MPWLaO8iQ/TX7uFuI/HtKMx9frUauA9ues3HF0VhT+ZHB+xMGdzBYNh8Wv2AuTIKQLXKd
 6D+YqZs8xVfOUX3zBRuhKfb5mROo2X58o5x04wsEinIqPnTeP5/KPfDPqcOu9hMfCuGC5pFf2pe
 m9TlG16FZ7g5vrcvufbTADf1+p2x9PfuEhbsU+aWVBHkVxumzJxN+R46jJdV5aGSjX+mqAGIzz4
 R4+xm7BXRAZEamVul8g==
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a21758a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oNl6jLlcSFQHEdJXP8oA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: e3HMP-ONd3plmxOl5n9N2a6shIPjT1lS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111211-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_mkrishn@quicinc.com,m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,arm.com,8bytes.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F2F66402A2

On Thu, Jun 04, 2026 at 06:00:48PM +0530, Nabige Aala wrote:
> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
> used on the Shikra CQM EVK board.
> 
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Move it to the series adding corresponding panel driver.

-- 
With best wishes
Dmitry

