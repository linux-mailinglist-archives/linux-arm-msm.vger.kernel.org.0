Return-Path: <linux-arm-msm+bounces-111108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0hhHJRD6IGpi+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 06:07:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE4763CC96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 06:07:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LgEB3lCl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LzxWolVw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111108-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111108-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EE1E3026F06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 04:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DC73AEB37;
	Thu,  4 Jun 2026 04:06:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A229388881
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 04:06:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780545995; cv=none; b=geRBljkNSah8AFrUDoKIfF8tGqgrmLxvy8RDOZ7fOUtF9stu1VEhxj8W9ITGloIiHCq0hrJKpmiv1nMJGQMRkiTd6Vp/tM3RLZkdGk8JFdjydry327jMRmFKpdZ8Zpd1onJc00YijqGtxbZ2DBfNxOQr/f1kh7MIwWb88p+70o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780545995; c=relaxed/simple;
	bh=cvU6PzPx7VvwUybXBHSGGcHgzrpcjC7wW3pJAtXFR5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqFCeg+6aK1rCx3OJnJBUISOEc5hfQpFa60Si4Lt0iiavLYiNUaEitYKtC42GAGiinnNe4+9LksvcpK6za27O0+CyQDsKNMjacGauSqVfH8HaaafaQT3jpIrJRQG60/aRo97pcVGdLC/9X9qT1PgN1vEvzZTn6IjCbWIk/kv6jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgEB3lCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzxWolVw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6540oDvt314080
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 04:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cvU6PzPx7VvwUybXBHSGGcHg
	zrpcjC7wW3pJAtXFR5c=; b=LgEB3lClk87m3qrLz2z/CRsoYUvYpNltEOkRxWCV
	QB1lL4AKeWWzrcQ3vmcQmaqbw41dkhYZoxPPC9I1k0FjRNboDR/leCjxThhRNRGV
	y0524tTHVvdtqN8lukUpOmykQwKifPPmuGVLZrnXf42U8uGgq0eDU5LVHNw9VaXd
	mzG8dm/BXwUJk82cI3oEYtD3WboCSiBSqCESxGRuHbgGScbuvtLnCPrUyjJ9RdPp
	NtoGCrjNl6MIuDHMnUXjNv0woG/2lERP/kGwFeD7azfiKVGdGXQsX1LjXFSpt9tG
	9q6JkCeYb/opHo/YNffvDQW2i1U1V8qwbCurvnnjPPFovA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejy5v0jvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 04:06:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b808bedfaso407163a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 21:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780545992; x=1781150792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cvU6PzPx7VvwUybXBHSGGcHgzrpcjC7wW3pJAtXFR5c=;
        b=LzxWolVw8mwbg/gpbdyVOCbwB2Sm7asqr3BzeMKzoZSsLqASy+66uKvClX9zFtbQuJ
         yhqLkr9N28Z3k6PshNdP8JS1lJkRWYrjYByRlGNvpmK15Ga4MJpgfX0+5bLreQMD7M7I
         HK+7J5YtUa+sdv9TC/eCqHN9XnamGAQQ/IqpADRL6yAmfiDL9yR/6xDDqxeuGKqCNwG+
         8QtYrUM19rVMTKbizh6cjV0lYX4NKHw/nKxijnF7SZE6ptGBQpXeC5mf9PAWUWKj9iTc
         R6yv+ZpAHp73JHV8P3hS6X5EtPrJPcFLjUKHHTfowUvF1lyBl4pc1ggwXCbJAGdm0KqI
         cVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780545992; x=1781150792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvU6PzPx7VvwUybXBHSGGcHgzrpcjC7wW3pJAtXFR5c=;
        b=KFhUV/ZXJngPs9ZCdUBrpK87gFXCYiOZzOd1iP+UbCrNfbd5OLlGdMQ15PS46IiQ3b
         Kvyo3jECFK8kJKNJ5eOm/3TqiZGRJrzEDU0974SLPMnMhE4XYNtiQ+39uWt5zofxWKSZ
         C+uK5vvc9bS7H5dVfrk+wAPlafIeVioI7ULotFKgwmfA7cpL8o+Q2HCfAr9FnHIQaASE
         +AXW3sx8RiLDKq36mCcl5T2u1D/u+uvD4MK59Fz+/QPsu2YJnlMM6OHx25SpSzrvlMVh
         1lW26skn8zNOAQ8ounMkFLsDlI/1PRRSu8MhjDrn+JYwPhszjHalTH3Cg6TiqX5hbDj5
         mJIg==
X-Forwarded-Encrypted: i=1; AFNElJ9iFjkMzobiHK8JibKtcY4/QiWdu32qzxDuvmQC/YW6n9H0puNFxPDR5qUYTn2Jky/b70Rw+tl45vOAonD2@vger.kernel.org
X-Gm-Message-State: AOJu0YydBNbCoYDWfUqvJ6vG/b8LtFt5U7aOQJF0BbZoyMkGnZIOiJU6
	85E0bBhttvBnw30YF0E2wbegvI9zSVWsMb91qwlnWkVGtkybZyCmw4rxblWCXGi7JCvvZOAKXMd
	9te+dG3I8xEGlHRoDelVNcoKcbP5P2ogqn+oh2o9QPGmqCbGH2aO7jqWXV6dzz8ta2b+h
X-Gm-Gg: Acq92OGdu82tJO2uyhVMopJpihEk9oNaD7Rx07CqTRkbxtykvjLap4g7O9m67ZwCHvC
	C2fd61u9QcloN1vgK/yRthnXR7WGwtZYEzPOI+T2T7McZEtGdkAXedxQMceoXhmYcgSsMYzwyxW
	RJiTLMxGP1uo3ARV91XThQ7wSa4kuIMb6jaeMUpJCITqQ+kXMaTTM5IMqJAMSIDKCO0owbXRJZf
	G7WN3nseJjHn+zn/7vDPTmuTF14lTnhznWjeQPJz1cmFonVGILcoFdKq6ahZLn4tmcrN3Am3Kto
	W6gLrXwdlBWVG41IHHdmFL9vYh6qHXETMnOPmSvKaZ8Xb58vbRKapNzPa1AvJE4jm0nMRA5qhNv
	1X+Di44OtrbMDLQomGnn+rEoTJVWVgXMPUmXfcjQMJ4VuA4vtHto6NbOt+S3XnhNwbLtrSulAue
	L47XKmC/3I8Slcv3SXgVgdTOZ2h2lZXnELWb5FUpwoskD2QInYEuXWKgfWKC8znw==
X-Received: by 2002:a17:90a:d406:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-36e318c0424mr6180730a91.21.1780545992481;
        Wed, 03 Jun 2026 21:06:32 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36b:a2cc:485b with SMTP id 98e67ed59e1d1-36e318c0424mr6180702a91.21.1780545992029;
        Wed, 03 Jun 2026 21:06:32 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b26bbsm3566591a12.23.2026.06.03.21.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 21:06:31 -0700 (PDT)
Date: Thu, 4 Jun 2026 09:36:25 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-ID: <aiD5wRww9sxClQ86@hu-varada-blr.qualcomm.com>
References: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
 <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
 <aiAQ4lzRoRIzAXT4@hu-varada-blr.qualcomm.com>
 <d46a7c9c-ef20-434e-a373-c7f519335230@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d46a7c9c-ef20-434e-a373-c7f519335230@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAzNyBTYWx0ZWRfX8tFjEmMAdJIg
 513+qVWzJetj8UvAaAzcM4mdhCm1sKpDnlGLC5n0HzKWzjcjMvVRv314T3FZ84FAzhvUah31Gog
 8QDGwn0stRcTZl4LJl/XFhFsKK9Ywgo/A+fI4B7tjVs9+B6qSFDkTLwrg/KX4I10VvWUhESfFOH
 GRh7c3TJhxqxVZ+ASgUK4yyqrB0YWsXlSrgRBBcf/A024ggpwLZQlWQ1dCPgsvXlr82lCjnyZJg
 Wn1X8EQDZL38xrE9pNkISw+hxK3KmuftEU8xPJUU1l6VFiXxBu+susfZ8zNCHqaDguiI/Q1sfWQ
 wCHXcjSCGkhNyfrC3/QeEFtC2gavIDFn7NKP17G/Y55FcqX52KRIayuVYPqRREwhhjPBn7oxJ0o
 ELdVYK48t1/Omu7k7bwMdRpJXsOk9LP6dhYAZMWWJVcSU0JH44m96uw+Qbh8evjmVYBA/l4LIq5
 kCCTsRx3NmTG+kNurTg==
X-Proofpoint-ORIG-GUID: 1Biu4zvnNZkyEWcpCftz8EzE1msdfh0D
X-Authority-Analysis: v=2.4 cv=afRRWxot c=1 sm=1 tr=0 ts=6a20f9c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=P-IC7800AAAA:8 a=wzrz7JlyjnULdPGyGyoA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 1Biu4zvnNZkyEWcpCftz8EzE1msdfh0D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-111108-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,hu-varada-blr.qualcomm.com:mid,vger.kernel.org:from_smtp,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBE4763CC96

On Wed, Jun 03, 2026 at 04:04:43PM +0200, Krzysztof Kozlowski wrote:
> On 03/06/2026 13:32, Varadarajan Narayanan wrote:
> > On Sat, May 16, 2026 at 11:55:35AM +0200, Krzysztof Kozlowski wrote:
> >> On Fri, May 15, 2026 at 02:54:34PM +0530, Varadarajan Narayanan wrote:
> >>> Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.
> >>
> >> Please wrap commit message according to Linux coding style / submission
> >> process (neither too early nor over the limit):
> >> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> >>
> >> This applies to all your patches, not only to this one.
> >
> > I had incorrectly wrapped to 72 columns instead of 75. Will fix that.
> >
> > However, in this commit log there is only one line, not sure what to change.
> > Am I missing something? Please let me know.
>
> Hm, that was two weeks ago, so I don't know what I had in mind that time
> but I imagine it was too long. If you checked and it is fine, then
> disregard the comment.

Thanks for the clarification. Would you consider reviewing this patch, or
should I re-post as v2?

-Varada

