Return-Path: <linux-arm-msm+bounces-112809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jwGDHcsYK2pv2gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:21:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B84675186
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 22:21:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dNoJbT6c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=d6cP32vl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112809-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112809-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 010CA306D3F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CBE376496;
	Thu, 11 Jun 2026 20:17:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AD368D77
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:17:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209047; cv=none; b=ApKIsJv37hBOYmUh+7D/CVEJI+9RnZwJCBc8GLJ3vi7R8WA6p19zw8j0TsJp7sx8jGntAW+tjJSOVfiMbaMGphD07Uf723R8CvsiFfo2EkHsDhJTzoMdEyW3hO/1A2QkND68rM4y390nwRR5GGkwhMooCN+euGPmadHxPIQsRnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209047; c=relaxed/simple;
	bh=Fq0Q/DDsjNcDFSjfHAH1n5aCPkGZos0PsXXjLEEFLMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPMqRkox5+IpRe5LCP6Qj3tUz1xGWp85eHf1iTDnqu/0cNoDg2MW5TpQdGIamkhP8jQ26QFiutmGe31Gjj4DRbzaIdq4bbRneeYFeWmXWmBqsODdVco2rXrXZPLUQKLX2fz4cbyWZg9Mln6rb8QkLhxs+WMbpJpsK9zuFMn9VBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dNoJbT6c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d6cP32vl; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3ICB1388721
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W9wdom+aRQF7jsN+TuBvQ4aM
	HYM7LB4K4EuWK4s72GQ=; b=dNoJbT6c4YJCUHvSUJcSwLyni0Ks1N4MiOmotQ54
	5XoF514zeCD+ViI9mrpvqaAioJdXmzMu4i1AbbA6S3qxIeVvlImB0TUG32s/jDcV
	COtmZ4Vo48TWNlE3OtzShOP4IFdkunRl4Uyrct7HTuuVke0agG0eA9XSf/mrPMb0
	gPFMgPTNjwFJBUtN6E8mHV6+hRZEp01cttRIA2gy6nZNzdjxMG+O0LEEA0vLwYam
	rp11DYNZe++mcIo6HJz33SGSju/lgZOsJPxfgZdJSiJPxCLiPEtIbZ2Z0+Rm9DAy
	RuESzTgEPeYjHPIH0qulI+0nmk1a9fpta/cmYVIWbQtwHg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1658t59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 20:17:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso98803137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781209045; x=1781813845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9wdom+aRQF7jsN+TuBvQ4aMHYM7LB4K4EuWK4s72GQ=;
        b=d6cP32vljT/HA/JEfqCNCw1mz4ohivoDxh9UOKI29K3+pFk9hV2B732AlbegqlTTfy
         APwA64LDT2iDBi2H6CmtlcS1vocb85VWrmmYYF3H6AP4aoHXQBbXzE8AaYB7WfPhiFyV
         RyjPpV+MZ2uFPWIrHYFue1QDgGh5HGB24p2DzYLuig7C5pXyyTVfR4yt0rt3zdqjkxaS
         6Xcrlz4oLuUOkz0FvCfyFA2kDlYLrR5Nm92vAKYNI02ii5QxzRlBYHrtX86puoUDvVZt
         LEjViunmVa+zVP9Lj917lGRYzFzBjvzGIMaG5APd+2JcNQEpezPhfANepu3uzjOXCiDp
         6bMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781209045; x=1781813845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9wdom+aRQF7jsN+TuBvQ4aMHYM7LB4K4EuWK4s72GQ=;
        b=q6LXoEh5x9Wy8fYTQR2wA/+PyRisobOimhBz2CpxCVH9bRDwVWvWHWSW8xwIiF5F89
         G7KP1oG8XcMxLjA4AW7CfYkvXRgitUKuwUs2/GuTSPKDC08q/Dke0TqUzk3Oz5vgI1Vu
         dxBzYeoSyTU2p5sB7ErMTh/zfneUHBnROb7p5Nfl6FEBqmSObuM9o0+6Rihhua7wjovt
         8wgKZ4NWxoBuJEkH9cOxDS34xzQN5ieHiMvJx8OZQhC//EgTrM1QTBC8wzyB2LHn+V7m
         K6qHPom8FChRo5PizHsJa8xGwa+jeVnNCrdzIl0Q7hWXjf5evKbTS0W9Lgf7aNIa2Iy8
         tiyA==
X-Forwarded-Encrypted: i=1; AFNElJ/aCnsHtAsq6iO1XF2kMpLElPPSTDq4tcG4W3xzpKSRuDMvVi0rWak2ZZkNSn268TjNJ8XyjpNv9jtNYxLt@vger.kernel.org
X-Gm-Message-State: AOJu0YxNGIuwk32tBWCuPPnjobHPpEMr0FjXiBhLNi2NrFrnmRIadPxZ
	glW+xsRg2LmbBuANCTCiSKnMRTzPa1NNhX+yCV9zn/urcKuMBkiwdO0RL6nL89HQrVbga6ouSLk
	OwOcQkUhfhi34fY5kf0sivWYtbGslNf7DSy3hAQiOTr9W6wa8Whw9Vlj/uoGhSg/JIByp
X-Gm-Gg: Acq92OF77jiJtOwXMnjVwcAFUGNtdnPcF1ooDxyPh5qhQW+scLETEQJg+Zlz82EWI4b
	6aAhMew+4lkaELIqXXK5mBA5nVdFbk1Ltz4SbBujiA6FM9oB5NW3eGZOMDwiJqWIcw++kmEWhZe
	WIKnylU7sM3/1ZgGiTCpjG2K2EKR8RE6YhhXvyeRnomosf3ViUJaAemqKznrKSd8On52BeuhbTL
	f/Ufx4FApHAsLXA89IOMKrhfYVBFhX3tJBPb4FMtxHvos6bvljJGnejGSEnaOtXxnm/ARUDXGJh
	6HWsvNSzMb1qXgH2hbH5VTLRo/mqncQN/Jv0BXxAEBsd0+tT9eALBjOIFtEGTeikDTm8BuDH3wo
	GWs9KXDVh9RDAtQn1YWNQAfbEQRYHLCD9gU69x4cJugnjvJwKGl2kmemIitIprXi3nk5h4AUrLR
	h6QerC6zkxsVb3LBXvG+ausLZAqxSH+37MFNQ=
X-Received: by 2002:a05:6102:3e8d:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-71d5d99fa42mr3015693137.9.1781209044797;
        Thu, 11 Jun 2026 13:17:24 -0700 (PDT)
X-Received: by 2002:a05:6102:3e8d:b0:659:3ae:e6d1 with SMTP id ada2fe7eead31-71d5d99fa42mr3015674137.9.1781209044310;
        Thu, 11 Jun 2026 13:17:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2cd966f0sm114597e87.71.2026.06.11.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:17:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:17:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Message-ID: <u5uvhewvzkbqto7wk3g3iaxnjijcgelifhlan4shbkopjul4qf@7fzwcygqq47f>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-3-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-3-103ed26a8529@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX0WaUDoqsBxBQ
 u+wLcE43fb4tGTy00FXfX6Ib32wWJzK3IISxIOiVfhYy1bchf3RH79poPjBrGtywZQ6q2JCnOB3
 mbElQdTfFRs1K28TeTrdDUGelY2LoUhcIX4h5A7Ixhe8BKaD+0Lp6fUSyMun3GIuNfCywjiAxhU
 Pk+Zu2UhUaz2Fzd8/1XPfdFZlcVkBFv6THaa25ATn2Pe/TwPKsILzSwujDr8iEwXxWFmwNiJsLj
 P+lKGFsTvohCiX7JWRP+Cs65poxxMpnZ5UfYiNrDS7zNycoZx+29BYoVRKZ9Dy4MRjtvbbLMiOC
 JIhrKdZqa4PU69rDSkxSk413M1AHMI2Iu3Ue2XRE8XQ/zbOhoMjav44TR8OY3umKE1qW7LHNXx2
 khpHfs7WN3lR/ZB0D3E6KrdXXPfckekD+hW6Y1qGGw0yUJPvCoxZy5N66RPenSfN/0BPUMy2up5
 sdlFJwJ5Rh2QX/FuWEg==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2b17d5 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=djcwQD5uGQ3GNs8by1sA:9 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: eSHcs3LMQCQzoBjk_S35PFsBoWO3poFi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwMyBTYWx0ZWRfX9JflAU6yEE3b
 o0aQJo6auDuZq0Ogd3pixUGc4TUxzjVuwsc8u5VLHd+f9uCx+AvzbpDfsAhUCatoX7NBJiJPFvX
 4qw42Wmqr9CeAJWRIz8ORi4s+Icgi5I=
X-Proofpoint-GUID: eSHcs3LMQCQzoBjk_S35PFsBoWO3poFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112809-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,7fzwcygqq47f:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0B84675186

On Thu, Jun 11, 2026 at 03:40:10PM +0530, Komal Bajaj wrote:
> Add device tree include for the CQ2390M variant of the Shikra
> System-on-Module, a compact compute module integrating the Shikra SoC
> and PMIC for IoT applications, designed to mount on carrier boards.
> 
>   - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)
> 
> The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
> peripheral definitions specific to this variant. Since PM8005 regulators
> are controlled by rpmpd, so disabling the pm8005 regulators.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

