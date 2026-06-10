Return-Path: <linux-arm-msm+bounces-112457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vzf6M4ZfKWqqVwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:58:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D166980D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 14:58:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cmKBvOT3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gVl4nQX8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112457-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112457-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A110305BDD5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D4140800B;
	Wed, 10 Jun 2026 12:53:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB7E407CF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:53:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096025; cv=none; b=fCN5pXbKryr820lGNTcBhJWsTpjBgV4K3iMnRAfziHUSST0RNllFsF4Mxtd5cTpnkqJMCMrr591rwCWDx0rfNes88U2uA3w9R9bUDePbNEjTLzqoDKdCHIduInyJPzWR6j2yvMl6XrVepHbRqvoB9csSBHFYrauatAMYqO8hp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096025; c=relaxed/simple;
	bh=EeApxjdziYk+v1CqK9EjHXZ5g3LW6KqHkJgmLUNfrQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXuIkiPhJRWeWuGmZ+nuxdf2v79P3VBazxk0lwEppKfDWGbnc98cV+bwtSkYH5hDtcQMnQanW50doDNUxnPQMj7/dS+l5TpI8y4eDEHwANHPMcLoduWIwZIe+rkhCq3Uw5yDdD3yHOqu6FovLCau4lpjMw4AObhMB5m8A/wth+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmKBvOT3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVl4nQX8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBlY91072714
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bFcFkn5T+1Ccf0UcQnldD5+L
	2Dp6NWivFCPOAqO4D1c=; b=cmKBvOT3LrOh/GjnDhP4CI6pcl2PZbDuOMyk0tmS
	KPF9fqC0EF1b5y0oMOO+TZ5DcLk1WUnzFTWQwPRznAfeA4e/X4bWwjxmGRBgW2hW
	zLnVxJoUDhxL8UrhEP8VM8RPEGwMH4nROEscYxNJrUiBzLlfGR3lgyPRbEzKba+O
	DYHcWh/3P61e9Id3S28GaJewglDAeDLRvu30f+BYPaFDhLtJoYE2PLcXUW//Bj6u
	JBu8RMM5ONjdcJKBzPvc64QHD78786StE1cidR9kH6Nh865/mFxfCV0rLaoTqyeg
	diwwIQ5XfIQi6tfn2OlI/0oe6jvT5SuNSQRI845pNZaDJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epxuvj7ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 12:53:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so35358511cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 05:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781096023; x=1781700823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bFcFkn5T+1Ccf0UcQnldD5+L2Dp6NWivFCPOAqO4D1c=;
        b=gVl4nQX8VNzvz0tBMximjzSV8ykxub1WNr910/rFZP4cHni+JgfW5mJzheDzuVtjiQ
         X+ikm/cTdxUw9xZGBaF0HDM8PMJwDRaMDEGCpyz7ijCjRTtwP6tE8DbILdEgXBqmgKiQ
         Qku7dKC5Y0RJRP9p3tgjY0fiI45tdcwfJyTGoF3NJNZbpdn3s+IIrNNaMRA7c7TndTMX
         +2kVLdJ+Mj+LY0XOh470rU80O8tguqT0OPOTCSYWHMcvz6mzN8yZgX0i/xfZUbWWVa9p
         vjmPKpY8gv/ascAwpyh7oGUl9DimriZS+d6LhbqgaChxMT7mLd9mbTZ57GQj2c+M+27b
         qrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096023; x=1781700823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFcFkn5T+1Ccf0UcQnldD5+L2Dp6NWivFCPOAqO4D1c=;
        b=ihPWAp9hTbEiERKi06Gc1bd+SSBlk8Ep+g6SRTeYvG0PNDw8IuXdC6xVb8qwLqRCmE
         9IQJkI1OvXJgzGUUhbN87Vq6HSDrj1Cf+85V+xNv+4sN+xOpDQdPY3mCgmZYESOXNqUk
         GdMC2obJAjwJ2ZHZbcTI91xLRtNJBu63JZk7IX7fHvTJ5KSKri/5z5XmEuKSDdGLuDSC
         SGLsrtcg76ycfrai015cBZk9scXjUOI4UrreB1M83l5cyJOmwF+C4Bj8bV9SRkVyXpV2
         tyuDhdzZSRgVWv5usPzgTEVDHSZ86xhn86NFMBDEs8LtczLEIiSMZGY2zXpYU3Qk1xDx
         ojTg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZPw0NtkQaI0inTSDRmXgzXJ2RRHKIwlYhsiIIlFPowsiQIqnwFs0xmAAyE4jBYpawWcX/X6+mZFqL3Uzc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp9rlz6mM0dxqYpTdfjHkM6vUWYlhjiYmruRPMulQOXlNsZZgv
	WGArCU0wOcO1Lkv1HN/oApr3etYL+7ktX3FpbEo89CwiJzQHk4ozhiTUKZm3NOmbL26jUoTXIWR
	o5JFQNBUrA9vYaSTI8kuFKJ5O8SZLGp7CkbvIx5WuEegpboUI7IaDooErAeORilu+uBhW
X-Gm-Gg: Acq92OF2ION45HEeUk2eu45KzeBqi1xl8bUQ9FAP76Q3y5+UVt2goRakxGEUBFrLhdV
	k0PAcZqcRF794vkg3NkoOWqa9Np0G+XaxTrSkbw59kuO+YkQ7dTdDR6GtfKy02ZziPBwHI/5upg
	d/5L8BEz6Sg+JPzReEPxrWD8xXyiM+gwozWsFJ1ISy6MoKmcYVYVpuX+0BMbL6y2g+Caas/1kox
	F4ANWAOAS9LB8x8hLMG3AG7hLUu3qOSgfUy4nP3km17D8ke6To/lbVbMRLlxZcjDb0p4rdcPwpt
	h+N0wz0tDzd/yuHgwhptKRjkogcpK0iMoKJx58VUq9e/iL5lq+A03hVuPq6I5nTZomBHyDoEdM2
	1bcfSwkMOg4xulyF8xWwUyrBkcMGRitAivgW8K6/3q9n4JM5JLUuZFkpf93AdI66g6jVyaIo4Eb
	C7lznioqJlaPS/yIayyWUoWgDTcU+cW480vwQQK0pL50xGzw==
X-Received: by 2002:a05:622a:c86:b0:516:d803:af03 with SMTP id d75a77b69052e-5179888396amr279529151cf.40.1781096022913;
        Wed, 10 Jun 2026 05:53:42 -0700 (PDT)
X-Received: by 2002:a05:622a:c86:b0:516:d803:af03 with SMTP id d75a77b69052e-5179888396amr279528671cf.40.1781096022323;
        Wed, 10 Jun 2026 05:53:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97a714sm5438040e87.43.2026.06.10.05.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:53:41 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:53:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm6125: Fix QUSB2 compatible
Message-ID: <h77lj4jdhvqi3pqsnl2lhhjo2g2ffmlam6vlcn75t4dogboju6@2lhpsexbd2tn>
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <20260610-topic-8996_61x5_qusb2phy-v1-4-d7135980e78f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-topic-8996_61x5_qusb2phy-v1-4-d7135980e78f@oss.qualcomm.com>
X-Proofpoint-GUID: gNEwt6Tg_WzEW_as5axPxlAp8Clz49I6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyMyBTYWx0ZWRfX7WxaJuAm6Tg8
 NH5Ng7MTJMYdAqZv4waSLj40yWFZnj19stcuwntpGZ0xn7y+a8wUCWOYAxz8sR34Qwa+rCuvAOL
 7V1w7pEX1yN4N6g0i355h74qSubvjXwqUIc6DDuSVfRf8CyhsJkFryxmEsg47cR8WbsBQ/Ucfza
 cTuyPEWF+1KtkDyquHPWZMSOL1/jh2zstJvepjV1suk0+kjhm1MMY+QhoaV/yKIs9ohpo7Y0CiY
 IhmR0mH6jHtzNLK5AHEtgLmxR6Uw8RTZYe/79DtwObLvJTvhH7ShLpYAxyH3H9XZ48hfZOMAGWR
 K0Pms7GHnS/KGNIqWnj+VMfcbLzilV6LnH5FDH0brbgKkLgfcVN+qs/EEVL3ghbkC36tonATkM1
 hTtxZnZvz2d+OM7x8N/vh4bqmYDx0P7eYc8A6LsBSbIlIfuoOmv1kJgohD+iqI5r1sO+iJVyoLL
 HPML7QJj0M0LOgEoxMw==
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a295e58 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LZHrLB2tbJw_R4RbR5EA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: gNEwt6Tg_WzEW_as5axPxlAp8Clz49I6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112457-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,2lhpsexbd2tn:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D1D166980D

On Wed, Jun 10, 2026 at 02:04:17PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are a couple issues with the current description:
> 
> 1) The msm8996 compatible is wholly reused, without a SM6125-specific
>    primary compatible
> 2) MSM8996 has a different power setup (VDD powered through a RPMPD
>    power-domain vs a regulator)
> 3) MSM8996 uses a different init sequence
> 
> As part of fixing all of them, use a SM6125-specific compatible with a
> SM6115 fallback.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

