Return-Path: <linux-arm-msm+bounces-111722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W0uqCtJzJmrXWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:48:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18B653B07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:48:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d62xLF5c;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kTNVZMmx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111722-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111722-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D8653051D5C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700D938644F;
	Mon,  8 Jun 2026 07:43:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFAD391E55
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:43:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780904601; cv=none; b=rHRkNDOFGbXcGQUFVXV7EebNxNIMYcNjpaIezmvbSSgb/LgmmUmTCJfvuEv6TIMamQOjKh1J6twWUPEmU41cXbQLXtQF60FvVzaXYdO2eW997mqtzKaBN2+uU3nWpTH3D50H8CnYm5bCrWzLUhSVc/sH+glfQ2Mz0Xf5yUqpZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780904601; c=relaxed/simple;
	bh=4hQUxTtMRcASgxQhEdcLXjPeAqB6RoJLxe5yRk6Qw+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYAVGvKWVh8AGPWkGLqDYbmDt6HXQhMISV7Hi1EmE4wuYJRd6xO/XKVcXKv9h/5cXMRD1rpzxSk84eu8ALvoPUiT0g8j1rmLZWop6RdNmpKcE/o71uuqhqTtn/wq/x+0Wg7Y5u6Xal9rGnvfyvrhv8hI4x2OjdTeCh6/JMKaBqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d62xLF5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTNVZMmx; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586OscQ2384423
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzanvTcCh0q8doYOmhmHVp3T
	dYAexlh2DgB3z98skOs=; b=d62xLF5cNy8WAZ7WLfq5wVmjiqiCbtbDs+eidYJl
	2J4J/+UG9Mbmk01dDZN6NtnTTY9T2jZS4U/GSWltm9e2nELKfn5cPixVibV3jjWl
	6tdNbw6duhx7yRgBA7g2G6kdJOq8zUCkBfS1FxrsRuwoI6LUpaDxnDTS8h8Oxc0G
	11z0AgUMa47/0o0yv+X3KqcS5eaMx0e2ZvdyZkcXMPDihfKTOlvKxIQbu7nfRDyR
	WP0zXDu20HHXe+PfsslOssJ5h4UfqFDUS+NnjVZQKxDzHfU4khcZW+1GPy+11WBX
	hhP5ImhzP/IHyneaR/qKyyT0s7t/UhtyuH2Dk9X5B9yNAg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1efvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:43:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9638fe9399dso1666039241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780904598; x=1781509398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lzanvTcCh0q8doYOmhmHVp3TdYAexlh2DgB3z98skOs=;
        b=kTNVZMmxCSRbRQsHOatKRqmc50aO4c2jeAnMjPiyjo8fQvYyypJ+DngmfGJhTUfFDt
         sA1Sxma7qwhr24EY7HlzNksnfRp/S+z1mMMW9RdlQzVKJwMTxXu9gi5qYRVYjp1gLEmC
         A+rWjYlXsGOq3teHn4rkqpV9syL+7UrdEYGJObzsucAMth3Dzu3T4nRzsUnVolKY1mc/
         stMwQ6rQSHPWIW5dQyx7E7RwfHTG7y190BJ0Y2SOWELEIU/EnK2HF6vJObW6Nmdd5XwX
         rqEMF4ubHtoKnbcGV628fUftU+zi2ycZrg/FFMjDD2dmk4OhShrHu/oM83/hAPgYgug9
         AQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780904598; x=1781509398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzanvTcCh0q8doYOmhmHVp3TdYAexlh2DgB3z98skOs=;
        b=hOEamQOeddad5HqMV/noVz++PukLPtIQgqn8xb6c/yMnUmi2SwWoRIHpgWPigObtpK
         gNJ3iOpunrhJj1RfhMQyM1UCQQ8ltYyy2YboyyFmD0OsFjndcNlbFnfwoP+U5ZhmrO7Q
         3+I7Dp12pSVToDFw23ppiEQb4UvEvtA8ek25fFzSQseyeGmApkwmcpu11JjI4IXQTI1w
         O5Mdx2/Hbq2y9vOqG0mvDWdBVYgbU4vm4OI3wXeLPCXsk0fPwlyle5dhJz42UDUlI1PX
         AdbXXBtx5mRLF0QhIctN4D1nn5SaP+UK72ZUYjAxy2Cy/JLIEmsDjqCwMK5zZXIXfRNT
         R2Dg==
X-Forwarded-Encrypted: i=1; AFNElJ8BULSnW/DkW3JifekYR3zuDowWFyDoRAZlJh09+qIkLZD2IE31eSAcQvyyPx63jfcvBomYj46W26K4bI6o@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxao3VaILdyKlxb/5la1h1+iHXJoUop/PhiZOBQudj6jqYo1T5
	rxO+wxtGmK+zlBTjg2YM5Lj6r7hL56qvixxwWD67zQJdD9Mhillo6g4uZsy+W7f4idP8clAh+6V
	ZKu/o6Bc+OlNrZH0HYZZmrlUjuYuwA7gnQXdc4ctuKFsFs/baYFeTcypv3JNfRyg8qVWK
X-Gm-Gg: Acq92OG4AgLYVwcs7wKLSZu1ezRs7xzdeLZ2XMx6nW9AbIu0fQeyuVfY57l2i2Bv5uz
	DQZWYj6B6nMptG44Zklpx4conXP1f+jE2Yy62wlJtUS8vN2YhceV65MEY8DduiJyRfcizRawzT7
	JhrqDWszFZwoI/JNiy0p+r4diJlyQVEXWHixEiq6vV7RuK0suMCQ8P2L9bKEtCf7jnnwQOvc3qt
	BVTv+nPzK4Aw8s3v00PKe2EMeleQewd4NTJ0V+Nszrf9icww+NGu23XEBdaT/ls81HvD7LXLMx7
	XB8p4zc0vNgFvJTsEtxHT4nYALL47IGKA4hyjGjm3Ya7TtbkQ8qtFWEgO56lqzy0tmOBaSa+XoT
	Hcj5EYC+xSXOSU+310sGCbdJsBe4SqV1ChAskZH71KPqwptlk8isDanlYNsHvWrPQU4bQVgH1VO
	MQuMBA2hqGXIqmmQrpzJP43icfasQxB/f/Y/gWMnsBrlSiSg==
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr6473035137.24.1780904598403;
        Mon, 08 Jun 2026 00:43:18 -0700 (PDT)
X-Received: by 2002:a05:6102:c03:b0:6ef:dd26:e2c3 with SMTP id ada2fe7eead31-6feffcf11e1mr6473031137.24.1780904597902;
        Mon, 08 Jun 2026 00:43:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fbcd3sm3580175e87.25.2026.06.08.00.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:43:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:43:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: add LEGACY_FOOTSWITCH support for
 MSM8x60
Message-ID: <une6qztpfyfelwxetf5bupbbqs5da2zrkzv6sexiy27yqdafb6@q5bdqtdyl4ag>
References: <20260602050840.435933-1-github.com@herrie.org>
 <20260602050840.435933-2-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602050840.435933-2-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA3MCBTYWx0ZWRfX/kxga4fFNRLB
 wUy7298s7vXud+tQ79e74k8wO9jZlMWxiZV6LimUyfGBVX2firClFh4yA/B2K4QmH5R07yv1Cx2
 KS5NO+Sj0fc41vgC3w1lnCzZs1N7/MU1rqGO7bbWu1PQFxtb6aIwWbvkwmTSNd6CsqRHU36JXzt
 fHcQe0xSSmfBSpm5yzT+hvF5iyAGw8xqpE4Kud1Io/ITMVB8lyBlnMhT9fMZZYT9EGYHdKnQ3UN
 dpHmkVTpGJwLwrTo13bDxpj2auf3lyV8GzP0VnTtrw0xrSL5tY4d9lRu6jky/FyrmSRyJOX2T3j
 7TLPjK1F4NiHIlVKj+8FG/UbkQwgWhsta9nvaN1LmBG4QbkMhrTHZSZJ8XKYo1fdCVfYeOKD5q3
 1Ni4E3cYfC/t+boaMbYA1O1HjrgTd85nggu5oGSHUVvbxZB3UqRxLhi9Nve9hPkPi42RYod254z
 PaJs4VYDXqXnBL+m75w==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a267297 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=e_rwawtQEMkb99PG9scA:9
 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: p3Xu2A4pKUD0hWm3qLypi9XVxNqWaddD
X-Proofpoint-GUID: p3Xu2A4pKUD0hWm3qLypi9XVxNqWaddD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111722-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A18B653B07

On Tue, Jun 02, 2026 at 07:08:37AM +0200, Herman van Hazendonk wrote:
> The MSM8x60 family (MSM8260, MSM8660, APQ8060) ships an older
> footswitch (FS / "GFS") block that pre-dates the GDSC programming
> model the existing driver was designed around. Adding GDSC entries
> for that family's MMCC power domains needs the driver to understand
> the legacy register layout:
> 

I think I've seen already this series. But this one doesn't have a cover
letter.

I'd kindly ask to do the following:
- Try using the b4 tool. It automates a lot of things for you, including
  some of the checks, cover letters, versioning, etc. You should be able
  to import your current series.

- Wait for a few more days, collect review comments and review-by's,
  then start sending the next iteration of the series. Don't rush, send
  them one by one, checking that the cover letters, versions are fine.

- Make sure that all changes are reflected in the bindings. If the
  binding is already in place and you are just sending the missing
  headers, mention it in the commit message.

- Comments are nice, but don't put too much into them. There is no need
  to explain everything again and again.

- Think from the reviewers point of view. Footswitch can go together
  with the mmcc patches. Or in one of the patches you were mentioning
  the apcs which doesn't (yet) exist for MSM8x60.

- Again, don't rush. You did a great job for a very nice hardware (I
  will even dig the APQ8060 out of my closet at some point), now let's
  get those merged.

-- 
With best wishes
Dmitry

