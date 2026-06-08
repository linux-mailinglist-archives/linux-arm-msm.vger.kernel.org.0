Return-Path: <linux-arm-msm+bounces-111681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A+RwO+ZbJmqgVQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:06:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61820653063
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 08:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UgQJPeKZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D6zT4IS3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111681-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111681-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F27E300651D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 06:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3258EEA8;
	Mon,  8 Jun 2026 06:06:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E083839A3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 06:06:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898787; cv=none; b=AYkdH37YU/a17HEerk3/5h3OsYUQeoXVuRIc3ZY9F9heJqBf5dNEwdW76KNudjd918DZU3qIAXc5OrTW22aRKmM1N5CWkFtDSmdqdJX11oy8UwD5+h7jadhHEX+WI0ExX1ICbG4oEz6L3S5EoZaeskQlD7ZsAGF1ZXGLW6WkhJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898787; c=relaxed/simple;
	bh=OBzwUfI9FrXBf14GDrvYNj5CVFKZslhi67YpMgQ5h5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV80dBJDbbCvUkdET05TqmfQZms55hc4eLz6/Obf4RQLEUQvdDt/8uZ8niAxKsCquLtg7HWvJg0tLiZvgCek3df/NdD5hzjX6WuMkERm3+7Q7itcIfqIz+xXLL6Kxo4eBOZSMGjT3xXyaFb03RlAKOWz+zZNvn88rBySW5khdio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgQJPeKZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D6zT4IS3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580HNI91935309
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 06:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oyxNnw8gCz5l4KgIAYmR/0X6
	QtgzggU4xD62oj4wLG8=; b=UgQJPeKZhVnyacVMlCzPWtIcYJPlWaTbjPA/9G1e
	E2lLV03qX1KmNg+m6qJes8lMDm8Dd3xRzIId2qjALUCAI3XNKD2bF1FIm/FLlBCF
	ZYF9C0ZV9nvkUrT9euKUpDiNwR4Fsqm9DmXbj66vWGcok5SaGU99ydchypgttaoO
	49GSouptWyFgIUE8tgSDdNgGQsxM479YaQ6bWicgSjDvAWRFuDL6ONnQAIs5BjEJ
	Fyljgii8jYOf5tw1Ojr2//Jk5tDElBIUow4Xt5d09Crkj75sUubNG/hgHObeam4f
	7/K6gZGI489z7mB8JENakXs4FXMIsF5bqbQRC8EYggjT6Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6a6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:06:19 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96395e5f46cso4159999241.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 23:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898779; x=1781503579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyxNnw8gCz5l4KgIAYmR/0X6QtgzggU4xD62oj4wLG8=;
        b=D6zT4IS3eamS2gQWB/zwPjESiYSLpv5MAo4mF0Y8CFRhuOkSRUb8JnRUV2LOYtah8K
         FfEAiIL+l7wOOptvuBbxbZdcG0U8DaKfQ5snRYk1it077qnHEuVqaGlWZPheg5InRH55
         iUIVb0GCr9DLJ09WmAAXF3rka51vc3H8Ip9w9W3szoMlFukzLnITaghEA5Wu5PJslC1D
         R3DawT/28rpz/xAwFbidsZYal7p3wc9Abzpaiqa3jEXDHPj/au++F3E1kDFDHr56ceYs
         JuIDXoJcxdjorg35ucUFxKE6GEALKEpAjqTFZrCoclnoht6Dyq9tG1RZRGmL9VT89TCs
         n0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898779; x=1781503579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oyxNnw8gCz5l4KgIAYmR/0X6QtgzggU4xD62oj4wLG8=;
        b=fhH6LB6sgLtT88MQA+RRr4sVgeKfHvNVm8vJxBM/tNbkDvWA/zMXJb9wHTHzZwiQjV
         mmihOw+G0hx+/GhTAd1SGvr+q5lBNnhznQxSYB/bk8C5DAtiaNQDxFTaml6103hmP+FE
         dOw6GNfrvXoW0eCq7FXhMs7BZqqkMuDy0BLXzrOkevmW9DcnDx+23cM1XB0KelLNTCW1
         bqmNDoAVkPmpLMo5s5JNt7a1k2ZhP0VeZV8wjt0aYugFXX98kDTbkIc82Kw+0D5OZbpY
         EJuHCZhj+tdbdWQfehFIn/zDlDlqgE1QF8MS3ZtUZKDxwY2TRt+K/jOI+2V+UmyXWoy8
         VV2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+3jIZZjLkYIefempNj1w9U87JEzkju3de9fjkCHXyhw0gy1cLcjO9F7O5v/EeY5fBbEAPrEy/O79ODGYzs@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/B33+oRMA6jZW5iF5veNuK3EivXA/FPfK2FX7FRlcCPUT0Zb
	UvnCdEgutRmcUtM31rtcxDggCTCopNjbd9IPhTNyQZd8WNxoQAI8qSQhVZ7314C5nf1UZUSbl+0
	HVcdryxSuOymJHBIp7JD4r1MQV0ooiCKe8k8oQtP87/ISjRJHMHKsgZHbnoiQuPR6Uyaf
X-Gm-Gg: Acq92OH8HW33j2gFGvxg7NqJIux4S2KIQGsLoJhoh4UIABL2KqlqBA9W2B3QikZLfcj
	DCmTdMMxersLF+4yEVfWh2CN94ReAe5KHDq1iYFrtr7Zx8ntJT0YjCEiArOCr6UY8ma7tm+5e3p
	ESIIIBe7av2FABmToYtCJavCL7CrpBeAK5PNXL9PKd89Mh2EP6flAa15gQ3nP7Kx78CLmQio500
	TOGad86SQRPf0IieWjPmhuMaD4YbJjz17j8so8/FEmAguZcPo29CVmFy0DiIenUM7DhP44uc9oU
	D6k9lLtstJKeSxok2Gjf4WVBI7HFU0YgKSjZx8nwQcsNUE2EMcI21zPqIK9ahsIDf5mGOZC3tCI
	P5MOQkKHq6+XWjghoa0aZGwSEavplmGeYLYHeLTAoyMFd4u9G6mwCKkyDDb2qJJogFX7D3RJo9x
	exQuIU9bdJxDkNzVZePlikniUOhvc08ZNaqO1T1Iyz3gnAFw==
X-Received: by 2002:a05:6102:3591:b0:632:1e2f:3a6f with SMTP id ada2fe7eead31-6fefb852cd4mr6708418137.24.1780898779021;
        Sun, 07 Jun 2026 23:06:19 -0700 (PDT)
X-Received: by 2002:a05:6102:3591:b0:632:1e2f:3a6f with SMTP id ada2fe7eead31-6fefb852cd4mr6708407137.24.1780898778664;
        Sun, 07 Jun 2026 23:06:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990486sm3503733e87.68.2026.06.07.23.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:06:17 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:06:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, abelvesa@kernel.org,
        jorge.ramirez@oss.qualcomm.com,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
Subject: Re: [PATCH v7 1/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
Message-ID: <bhn7gsvbdlm62trxfnmtmclujcc3cnod7pnhhf7pr6n5wbwlas@kgoadnui2hx6>
References: <20260602071750.526-1-jianping.li@oss.qualcomm.com>
 <20260602071750.526-2-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602071750.526-2-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a265bdf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=gKdS22MHRqfbWWTX0SsA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: l373fu8nt98GFQ0PSHpY3-9O8O3VEJJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MyBTYWx0ZWRfX0xckeOFxbUvX
 WI5ghqke9TyAYMHEWPfjTD1tIBxXuoyNKzQjLplh3QP6DrARb0Kb1jTWthWfAnpmYP5GNmLGCLG
 SqGSVtOjT8id/we5sf1wAgC8D2fp7Hq9FHxNUWtAdX8ZzZrPk7HJQJVb6BNr2ZQ0fS6PAs/Xq2R
 odrL5SOb5fdFhS5YuU3jQi+hiqsWYQ7VCtEU+ODfl6cXVeOh5Wf7qJNHZduPOOa83WW5aLrIbxy
 baMppmxsLGG0AYQuJv6w2KpT3NPVch9ZgZ5a7GYW3SpgjX7lh/E0PkvLtf2B06UasM0WQ4N4h9g
 3HPsoPU+twI6of3sxXyXmX8a2kVpED60ycSzMZh9K9797LUwt1oRW8LUzEcs9Ai2TCZuAG7cKgC
 u4d5aSky7gNudXKAGNTVthh+5/fi5enemixs2Is+qN9AsonvTaebcdKEWw5k1czv0qQrpkYN56O
 r1VHgtKv20p00P3Yi4w==
X-Proofpoint-GUID: l373fu8nt98GFQ0PSHpY3-9O8O3VEJJU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111681-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jianping.li@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:jorge.ramirez@oss.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61820653063

On Tue, Jun 02, 2026 at 03:17:46PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The initial buffer allocated for the Audio PD memory pool is never added
> to the pool because pageslen is set to 0. As a result, the buffer is not
> registered with Audio PD and is never used, causing a memory leak. Audio
> PD immediately falls back to allocating memory from the remote heap since
> the pool starts out empty.
> 
> Fix this by setting pageslen to 1 so that the initially allocated buffer
> is correctly registered and becomes part of the Audio PD memory pool.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

