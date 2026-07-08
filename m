Return-Path: <linux-arm-msm+bounces-117602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ja36CYs6TmqHJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:54:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27C7260E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 13:54:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lDyq7pFI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ATj1KmpR;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117602-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117602-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D75DC300DDD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 11:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF1F42B736;
	Wed,  8 Jul 2026 11:49:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6D37702A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 11:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783511341; cv=none; b=Mb9rILrblQMOvt9x2kKSedZJFyTslz2oCghdPaOndFVft1RgUea9GbN8JpFnqNzvfpecPoL7iit2L4EDAO0c5B1bRbRZHEQoFqU5+00tPr9PJGGGdbfJBL+eyr2CkYx6fmqEZ3SVwVC7iW3uWTfQrji99iQ4j5NPYcEsbFgWBPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783511341; c=relaxed/simple;
	bh=sHNn17aKVhqil9DBxff24B4FJq8xh7GOnkVsmOc7GHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCDeKttY8VrzkiZZiOzqn6wqeAv2l5QzS6jqH6tY6IDR8JezEdo0zV3FoduY9Nf4BDkC3/QXs0qDWFj/V/MKcBgFGka58NQeeDJi0u+dbZ7EOx/QZ2tjmLaGz/Qor7HNntoVq+JLECmPnEek4XlM4H1a3UFB+9dV388VXr7V6aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDyq7pFI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ATj1KmpR; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668BTSix2502480
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 11:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1mIY3etcMwovdUDflPI4vVznoNrhNzenJIiJ8YOsYw=; b=lDyq7pFIRKhDkYkB
	qWmasX+77IyGngeqrL9KIqj8Pd0+qD7Z8NInZ8paM0c7pIDY00KCxW2hOzmjGN0m
	f21C8RDpi+UhIfChkP/jZqRdZ+38h362bGs8+gEwuvn7+UnHOC8eUTdQI9smd1ra
	MMPyHh2cmCSIKnm8zd/73tAzPsjHdQfebWVoD3h6cUHNan2GFsG3u68b+IWhppt8
	YtsyiV4L+Lf6QJp2TvgQyfT8otg+OX1GfwzcGMjNCcJtYFWyQQJyu8q8wAY4Pgvj
	L/bqvHrCve/TRCHZ60usHNera/zE6InKJA8jp9XgCrFWnoyQCoRZDpYDAEynV2vA
	17bEZQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gaj72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:48:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-73850dfc198so148586137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783511338; x=1784116138; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1mIY3etcMwovdUDflPI4vVznoNrhNzenJIiJ8YOsYw=;
        b=ATj1KmpRvrX69VjHxrQm8U2ULhY1eYZMaf8lNzJbgAm/sIOXV9j1cZCEdhgchrlkdr
         rUnfLJP/oegK6NJLuLEzABGjDDlSraalB04IP+d/kPdx0nK5w9WA02eMHygUcGqfscp6
         vIKu65Yxu/wVhhA0dCi41zBUuAZ3ALzSzL1G3ZlqG4LgD+AOjZmkDoDz+0GoQ2gDctKz
         fTVjozaXGCumpSZIgrnpRwViSaw+1VxR7jFslptuUat7ADVKksyeI1TZ2OhZ+YcofaMs
         4kMQtg7pde3GhS7yJbUJNJWs1PD3RxzgdnR5ZjK+OGfjFPXWk8Yn8JudlUYMBYoSkUlq
         3GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783511338; x=1784116138;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X1mIY3etcMwovdUDflPI4vVznoNrhNzenJIiJ8YOsYw=;
        b=jpNl/JyvBNxYyMDA6Q4wQEl4v4usqzcfVMJvCnLi7mCozpV3mZdUnwT3Bcs2nsIlvG
         lgFFH6sWbgTzRT9Hv/SkJJVp6ndCJXSRSFicEN2+tQjSxTHkBMJyU9XhaO70yBz6btX4
         GBIY56Pz5/uTtqe6rtp1e7Sb/YfaaIJBA1AVhONWn1LRTFyujcUIKMNGKZPQnUgIZ46e
         ZW41zXBO+aHesby8nMSHdlO7k+V+mWoZn9DjLoZvyzKzSU0LWY5ObVFZU+xyT8rFc9rx
         LOrkWEpZInonlBAJKiDzZLgMGEvbmTQf1KHRV9+PEQ7zsWoJ6BgEk2umlLoZssE4tecm
         NzmQ==
X-Forwarded-Encrypted: i=1; AHgh+RofMmTIgn99n0MjXVXJlgb4j9Vpsnwp983zATQambXnSa3x/6F8FlzxWbMWymsDPks+dGFcgw+IRthGQ3Ln@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYLUcoVf+sSV7lv6UCG6h5BqSpXawb+tt8mm0ofPBNIoFeeuv
	O+4N/fAR6PnMUHzHejHqHrYG0fYYLanfTEZU1jXn41vDjXFnFsr9/PdKRxFzqdmpQ/eFIdbJh/j
	zr64Z80Uy2OEYN1Rjx/QJAww4/IEOfUs4dlTuhgKuoMBcaX5xVNzlpc/TZAdza0X+MlfD
X-Gm-Gg: AfdE7cn9kvXMJkaffoa8GRONjwYoB6FFYerjs5hoTjJJZy+dOPjhJ/TMzMJpvpw+xka
	k28hzAplDIkF+u7Gta5dKnylVfn+w+14nEFAgrQyELwPOSxTeBOwmZ8gjF5qMJaLsjEehEAEJ85
	z2nsvzPNowKFcJpB9nPac2s/WMUdS7mDhcyKcvP01j+kDKiN8Q3zBlA1reGr9+tCkU1cRmIHdGm
	uYCbw9+kUAdkXtve6mJLdyH8IskjB8tTH3KryoMw+FtVEUh6dy6Wqw7XmyW2zEh0yi7zvIZfwN+
	7BUUufjj3JMdFT+OY7xnfEfzy7f8idj259i7fr5WOBkXktTCy0xvHGYYsob1AvUQvkzHHuHoYRo
	pk9PgNXYCVfe8j7UYQwUgCuPNWNCH0X7nPmFC0gz8UxnsTXdnf0Zj4/fTYGhSbBIOgR0lPxZgZ4
	qASyWRWYGlTKOJvE3kyJNY1kCK
X-Received: by 2002:a05:6102:8001:b0:726:f965:722b with SMTP id ada2fe7eead31-744dfed3969mr959578137.21.1783511338216;
        Wed, 08 Jul 2026 04:48:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8001:b0:726:f965:722b with SMTP id ada2fe7eead31-744dfed3969mr959555137.21.1783511337746;
        Wed, 08 Jul 2026 04:48:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb685sm4422446e87.46.2026.07.08.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:48:56 -0700 (PDT)
Date: Wed, 8 Jul 2026 14:48:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, sre@kernel.org, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bryan.odonoghue@linaro.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, neil.armstrong@linaro.org,
        gaurav.kohli@oss.qualcomm.com, manaf.pallikunhi@oss.qualcomm.com,
        priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Message-ID: <cixdpxnnpzbicxx4a3q42hofofme3ifdfcmi5nocqa5nr3yxie@42jynw52dxb2>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
 <20260708-wakeful-cyan-caribou-35fd09@quoll>
 <bba69f4b-9a09-4e9e-98c7-3833924131eb@oss.qualcomm.com>
 <c2e5e168-bc94-4b17-87e6-8974bb83be3e@kernel.org>
 <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac9c6ace-31f1-4bd5-9d81-ec850179e85b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfX2dn9hEXZ98FQ
 LPD/0RbsaWvjXzKbekE61AG+LzpL9Atb06mWJcZ75j5RnKGSX1kvAN+diGTkdo5jTwdVDc83cY2
 ooFmdYzkGkeQOVo0w0VosI6yX/K0ueA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDExNSBTYWx0ZWRfXyLBSuBHGzBaa
 gOH3d0Db7dE6c4vq6lr1iyX3mNgwio91GsYDJHzc+29KipiDG27EQhsxPaY6bh0Ae/hsmGj32QX
 zL5jZA3IL7SXmICxJHxVyn7g20ZV+qeUu/QuaeHLd2s9B+hXd3Sj/R/YqFyjxxQiVFfSbnVq7Zw
 UHQch9FJ2z94vxX4uBuRXiLXRjbuSuLmjxoD824MxtEfJn7x4SUoTs9LOtm/NG2LPATj1cvJ56C
 F1MUxtHD73yJZ9sseEcMT8CcJwyjKAYNgRE6kJOkXeHQpLud5K+iR3n9/QwqwKr8EOChVY+Jnq6
 MZz78wsRHP2wsP7qH7s4LCiEnHldlWQD8k5O/e7qOe92HnbM5Tn0ebgl4gwWZcy1tNwxGp1Z9ZM
 XlvNQkVC1iTE+M7P+Pt9kA2ONePkUG4jHmxt3qMXga63+3ntjVxD+yuxHkY194B8ByYxOBhEukX
 KQchVSBC5N3It0TGF8Q==
X-Proofpoint-ORIG-GUID: nOdwxrLTNq3Qn1si-Wcj4ELSDeM1XcBb
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e392b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=HGVAMQCKqTvNkjEGtKcA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: nOdwxrLTNq3Qn1si-Wcj4ELSDeM1XcBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080115
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117602-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:krzk@kernel.org,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,42jynw52dxb2:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF27C7260E7

On Wed, Jul 08, 2026 at 10:38:49AM +0200, Daniel Lezcano wrote:
> 
> 
> Le 08/07/2026 à 10:24, Krzysztof Kozlowski a écrit :
> > On 08/07/2026 09:31, Daniel Lezcano wrote:
> > > On 7/8/26 08:30, Krzysztof Kozlowski wrote:
> > > > On Tue, Jul 07, 2026 at 09:22:27PM +0200, Daniel Lezcano wrote:
> > > > > +static const struct hwmon_ops t14s_ec_hwmon_ops = {
> > > > > +	.is_visible = t14s_ec_hwmon_is_visible,
> > > > > +	.read = t14s_ec_hwmon_read,
> > > > > +	.read_string = t14s_ec_hwmon_read_string,
> > > > > +};
> > > > > +
> > > > > +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> > > > > +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> > > > > +	HWMON_CHANNEL_INFO(temp,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL,
> > > > > +			   HWMON_T_INPUT | HWMON_T_LABEL),
> > > > > +	NULL
> > > > > +};
> > > > > +
> > > > > +static const struct hwmon_chip_info t14s_ec_chip_info = {
> > > > > +	.ops = &t14s_ec_hwmon_ops,
> > > > > +	.info = t14s_ec_hwmon_info,
> > > > > +};
> > > > > +
> > > > > +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> > > > > +{
> > > > > +	struct device *dev;
> > > > > +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> > > > > +		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> > > > > +		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> > > > > +		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> > > > > +		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> > > > > +		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> > > > > +		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> > > > > +	};
> > > > > +
> > > > > +	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
> > > > > +						     ARRAY_SIZE(sys_thermx),
> > > > > +						     sizeof(sys_thermx[0]), GFP_KERNEL);
> > > > > +	if (!ec->ec_hwmon.sys_thermx)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
> > > > > +						   &t14s_ec_chip_info, NULL);
> > > > 
> > > > Last time I commented this looks like actual ABI break. You did not respond to
> > > > that, so I assume my finding was right, thus:
> > > > 1. binding is not correct (although driver should be fixed, not binding)
> > > > 2. the code still breaks users
> > > 
> > > Sorry I misunderstood it was a question expecting an answer but an
> > > affirmation.
> > > 
> > > By ABI break do you mean:
> > 
> > Existing ABI contract is changed in an incompatible way, which has
> > observable effects as below:
> > > 
> > >    * new driver with old DT will fail ?
> > 
> > ^^^ this one.
> 
> When we are incrementally adding features to a platform and like here
> reverse engineering the device protocol of the EC. It is difficult to give a
> complete bindings as we are discovering things little by little. How to
> prevent handling all versions in the code when providing iterative
> completion in the bindings ?

Provide backwards compatibility. Here you can check for th property to
be present in DT.


-- 
With best wishes
Dmitry

