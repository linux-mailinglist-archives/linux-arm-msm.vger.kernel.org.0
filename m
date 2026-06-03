Return-Path: <linux-arm-msm+bounces-110986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oUULI6E1IGp6ygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:09:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA0D6386A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 16:09:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ddtl+jOx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J1HynlV9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110986-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110986-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 698FA3088B19
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 13:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E242F357A40;
	Wed,  3 Jun 2026 13:58:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8951A466B74
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 13:58:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495092; cv=none; b=QdNP2n+vGuxKSBv/DkilPUzxc//ejXgQuzxd6VxPZ1Mcxy21y38w0YdeWM7aA1Y7nZeuZRlNz2aD04nqXCkRSvVGBi6I9M3kja8+ivbn6b//RFhUQYaBbLDIzIPUP7yfvKUVgnmeaHYfJS5dqwslDgBhnGpZPFOHHGBTkj/XUFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495092; c=relaxed/simple;
	bh=0QQ6xsLG3C1qiiwbSDVAzvYc4d8IJJuDUwtCjU0aaxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gm8tQdBN9xVu8PiOSpY4jojwnCtt86wOr1/thhSStQq4GjX0/PF3VKDR38bnBnmlfK85Eh9oHE7cjKdeGjmCHtQAyl/ACt3yiGp8tgCn6bEVj70boX41i1eezwevFrbqX8/09AfvwDFQE7R9Kt13KdY29ox3HZ7ZVYUk0RgwrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddtl+jOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J1HynlV9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653CZg3i380649
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 13:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=04sBBkvYwcXhq/fsapj/4LEU
	21npBSlWyomjaSXyXqc=; b=ddtl+jOxnmre09fbhB4QhnK/St83ZsU+Zw2ynDbH
	Z1z5QJO/nbElu9Tq+FQ7tQPHnaKQ11gpuBQbsk+8VV+t641dRB2IEQsUu203iA5k
	q/Y2fueONc1y0Vq8l8y244PQjnYjLqYt6wiv2MY0z3sn/20+376hIWsWoavMMUSv
	y5xNW0lUWAqgl8FQmLBbxd57JGwYkGzJ6lc9J3Di+gHdGUVpmDvaE0D9m7PIDNaP
	w1WCwabBcNPNe4YCxWPhfO2vrSh+Gpq3VdLQpU4rTg0vsTOtlZH03dk6fOjzxhyu
	h+IfpKTQRI2nj5tO7m+kY1ubIopy3ImuIc2Jt4aBZTXlfA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejewhss56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 13:58:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c7b5cf8bceso1725552137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780495084; x=1781099884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=04sBBkvYwcXhq/fsapj/4LEU21npBSlWyomjaSXyXqc=;
        b=J1HynlV9p7D7pmVanMCsB76ouOY2I7vnWXEHsucydRqUArfe5p2IxHwMZMSJw9KjNa
         QThVx93WqrwJuDi3XCkpipOoEVzM40MbeK2xUNXcC7DOH3hQ192Ge6V4oH1aWp15zPz3
         wZfpWD3Q0O+XNSlsqyPs7YgGNjL0N/RxhAmxHB50eEiGJ7LsyyQ27ZA/VCPg8DRvG6kh
         jSKxSCXJsucEtFvILwBRs4FJhRnVDXLP30hoCpLCxge1GSAbREMyaMiZN8yiZPKarfS/
         cM1GM1rYXMCnEdRBgJxjzEF9zUlGGF4tq5Xj2xH5dxiIGztDhaCZ+kFfzzDIrVBUYItb
         m16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495084; x=1781099884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04sBBkvYwcXhq/fsapj/4LEU21npBSlWyomjaSXyXqc=;
        b=GMVsKK4+TKd48O8wdumHMersWhNUM16K8MoPRs9o9A3+gn/ZpH37EMNOKsPuFi293z
         lhWn3PguxcyMqc55JRHl2CEruaciKLQa6govdZ6aylgZM94X2oyZWeeTRGFHoLkdlRBq
         U5KhFCSUevzqJVK1QEzvYLgjCQ/8Ohdac4nh8qug7yz9rye10EBztmHHMxQSf3m0ixp8
         bRTQ1Zg7hXbTcIL91sKBwOsAl1yYxrit+DTi4WNpaYIivawIKXnp2o9/FBNS3ukWtxYq
         9duQy3nnP5h89+UGRir5XV7HxBeukewroBFSHLiJUxESjwEKtXrx9F1Chh0K4xDQlMBf
         ThzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8e2ylF4T561i2368sdH8ovJeDlkbzmylOTHgHEv1LicgXN86zEl4ZX2ykkFMdD/H7qprfQ5kXKsvHohH7E@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmKCFBgfdXAkhGKo7eTCVi5d1CVHfSJrEAfRymRuQ6hxmNf+j
	hH6LxPXwdQ8aC9Mzp5JFlAXUxerLK41i69Y8TjqtovJLgoGxS/AiuYG/93fEVWOD3UIZnOXEm+c
	1lbKOjSg6x6KcN7vmoLDtt7KfpkBtCsM3HPlLJs1Q18MKgFNxiRLDjSD89xcKXF09Z4Rl
X-Gm-Gg: Acq92OHf9ga40Az/PmZotENK8dStQK0JCP0CXaZYpNC/VYs6YX0gZK5PBWqHDuCCdky
	KzMX1bzvEZy7TVDKR3yfId8qMgTaFkjC882V5zJoFGb4SwTWeRh5nIN/ipxYD4zKdhj/Fi8C+7C
	lNpf2R+xRn7uMEblEh/Q88n9OfZYbmqC9vbgb5IizbSC4Qnp6SOOVpokqwQw750nCj6hll3CSAb
	bqxERwOeSq5wyVT7j4H8jSIdsREbxbbr/cq/TiesA939zuksupQwSbFm9i74PIpQ6Mej6iK5OIA
	EajailwZ8IQizH95x6CEh8Kx5+2GMzow4cAL2+ivc+QmJEWKdxpueblZnhh5B1W+RXmHRS+EnKn
	ybQn0BT4r3XETwNkpFVK5DnfCstRBcXZWac+uNX2KSg6po2TTGSt4pvqeyh+73c4sgfSZI4fkF1
	6OJkwDRWydfXq1kotIbR8/2jVUKxEJsNJl9v+fzH9zN0yFaw==
X-Received: by 2002:a05:6102:5129:b0:6dd:405b:26d0 with SMTP id ada2fe7eead31-6ec48fce1d6mr1437492137.23.1780495084618;
        Wed, 03 Jun 2026 06:58:04 -0700 (PDT)
X-Received: by 2002:a05:6102:5129:b0:6dd:405b:26d0 with SMTP id ada2fe7eead31-6ec48fce1d6mr1437482137.23.1780495084168;
        Wed, 03 Jun 2026 06:58:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396abf674a7sm9436301fa.3.2026.06.03.06.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:58:03 -0700 (PDT)
Date: Wed, 3 Jun 2026 16:58:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH 2/2] phy: qcom: usb-hs: honour qcom,vendor-init-seq raw
 ULPI writes
Message-ID: <rmlkstzpfukootrpfh4l5pgtwra4dnwbynvteztvuugl4udtx7@a4xacrg7ealc>
References: <20260603054809.565723-1-github.com@herrie.org>
 <20260603054809.565723-3-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603054809.565723-3-github.com@herrie.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDEzNCBTYWx0ZWRfX+Ef/AgH6xxdY
 nHgRRiX8jsQdHgZvWgcMg+J7XP+Fza+oNiFAjpQyUmC+Wj9Xbn7XjItdpvd6OVUYwY8VZ5yWad5
 75+7kHmSj1l2fTY5UEQ9MoflAxPiQhSbpgmGd72YyX5wj/BqS7buehriQkrlWoZi15zfBQlYb3B
 yKZ3wDEps44r7cT3c/Md1ImjMp8UCdkS/FHXenGd5nZrpszzIufMWI8K2b9J6GM5OL+w+GSG2Vy
 KqTUNafkQzRSrmHYY9xyMs7uzVcakKqlv5BEk2WP9UTBrGaAbveJx6gwO7DptvA4jbAA3ZG2JKF
 W9jmf3hUuY9D7mpJfn9YqTjKezdBCCVGu3B4G3HjPzvsxPYYJRuezIdXkwEukred2y1tFIDFeXm
 ztKXCRY0UzJe+t+xbrMRHtboTIhxG6tMpIV+FaPvZrfqSChxB9KNPXQWPjVe9ai59mLfp3ZPk4N
 jL+E0+LFSkxNknhFasA==
X-Authority-Analysis: v=2.4 cv=Zewt8MVA c=1 sm=1 tr=0 ts=6a2032ed cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Bm0pR8FC1pe31243yBgA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: F-zwAdBrNb1xfDjHUDbwcYHRFYn8mED0
X-Proofpoint-ORIG-GUID: F-zwAdBrNb1xfDjHUDbwcYHRFYn8mED0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110986-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,a4xacrg7ealc:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BA0D6386A2

On Wed, Jun 03, 2026 at 07:48:09AM +0200, Herman van Hazendonk wrote:
> Add support for the optional qcom,vendor-init-seq DT property: a
> list of u8 (addr, val) pairs written verbatim to raw ULPI register
> addresses, rather than to ULPI_EXT_VENDOR_SPECIFIC + addr like the
> existing qcom,init-seq sequence reaches. This lets boards reach the
> standard vendor register range 0x30-0x3F where MSM8x60-era hardware
> keeps pre-emphasis level / HS driver slope / CDR auto-reset, etc.

I commented on the bindings. Platform-specific values should be defined
in the driver. Device-specific valeus should use values rather than raw
register data.


-- 
With best wishes
Dmitry

