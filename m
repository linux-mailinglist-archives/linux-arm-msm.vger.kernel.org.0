Return-Path: <linux-arm-msm+bounces-110611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJ7IFM2QHWp2cQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:01:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A15C76206FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 16:01:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A3C13012E89
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 13:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F793AEF57;
	Mon,  1 Jun 2026 13:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sel3T2xA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvvAGFfL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90CE3AE18C
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322117; cv=none; b=QWNwMGAeIO+h0gTB1yEQxyXIM1itz4Gq4wwx/Pepv6j+8eqNfqDrbXjA7ZpkDZzJ4DOlc1wAJIcx7DepooOoy9rChBp4POH2IwkFTt7OGLHQ3fZDgveJe+vJhx54YPRh7ivDQ86aLXBzYg0MXXgTd/4lumxMibScfZs4U/Hy8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322117; c=relaxed/simple;
	bh=wK2kSrx/pkY4LtGToP9RGTEX/TwkRTf0yVVB5y4qHNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtAsYZXGdTDMT/OTkifxU7zBR0eWJbvr+RXlV1BMQlRgyGhwLYxCTBhHfwrP1eqpojJUOPzfB6JDUTy62ZZ3yxS2C122Ex1mDkowLBjr9f/90G8EDJyi0bFykEyiOTTHG3/wQWA27ZPRdUKn1Wb4d3ShMFY9mADWK4Gy0HS7ebs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sel3T2xA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvvAGFfL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651AxD3P334617
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 13:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uyAUjOxF0Tn2t9DeI7xkqKHi27Jd5OntW0Mgn/yPicU=; b=Sel3T2xAawdSe8J/
	uljNAH7MCAMyUYYXZWoLgU84EQUBUG3aAgqCqRdrl55n079YlNx4mvSMlOSjPR1b
	Itfvh0EL4KB1d0Qk64wzqKyOxCXZGWqA3pQX0cax8lMFHK8DSW3y952idKgXYqVU
	onDdZeHJZOv1hFalCfmb0CfoUXdgtHfGcWDF/Cu0wGnFFB9EAOXsLV83/AilL2Ew
	UFs5BRAh5Keu6WjDQexe4iAhUL3qGOLYHFv072Fub5igqNpEPfUKTpqaIQbuUuo5
	5zVTzUAwLAkf7bIl5qo/bSjb0msEeDHbnEJIGeicCDxYvQyd39KcK8UD06G3LgL5
	4TLNag==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh8tfrpjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 13:55:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6cfc66167c4so544613137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 06:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780322114; x=1780926914; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uyAUjOxF0Tn2t9DeI7xkqKHi27Jd5OntW0Mgn/yPicU=;
        b=FvvAGFfLct8FP1ihcBSawtpycOZTmruYVg04BjbnWedLjIN+egQJKik6AbInDmy16z
         oZid6+QSqylHBC0vp/AbHIOoMHWEiSVHEjrsbphnnaUYuCbPdhbiXoBJC/9NSRUKjUK1
         D4t1UOaT6tskHIFGfOX+Uh4qprEWa4VTwtcDHuA51hbXR0QQ7if+SW5moqnSDp7NB4c6
         lwcGnpWdZJeDQ926PhQEb5CSfMnj/EUcNPavSPOPD7WYB2qqpYN/M6EdeF47KGsS2YxD
         LZSBgyKDDA+GDQcCOWBUgKTO5O5cIegXhfefImeJhI7gi6kEa8GhioddIsUjJQEBIpI/
         HvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322114; x=1780926914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyAUjOxF0Tn2t9DeI7xkqKHi27Jd5OntW0Mgn/yPicU=;
        b=DpytqMxMwILdqNj/XEIwn2VXwdXTEozeKJ9A6OWUa75V0Uyddsk5ZB/b0uc0FrpoUM
         QY3AnwIXC4YryNXrXXsyfzztyYYyd1lXNUlOO///urjG/IJYSePqwcy6a7qQo39zYZat
         qcQeM32RrAyNeK+4bXnLtwy9fHZW/UnB5Upq/iJTek+C47FPgdr+yEfxbjzZGY0FgVdR
         /YsYIke3ft/614MKTiwmiJRSmk+5a2vJIXlX9HUwNZRxaa7u0w1o7i0U9uSs6V2Mcva1
         t9TyJjmuETYmAw2LxDCRdZLo7b66NHcG0Xe0+ilMzIg4G7iellKTwxxros/wkTR/Dei0
         IxlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9XwAqHbAkcn5ZKkxfa4+iYRcvXy/ttIcYUmsq0X6H1jjqIy2ofb+PPYC5sp2wHjtKNDr2LV0sU2ZJ3wWL+@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwd6XyLpVAIO5ao+7Pi3vC9M9u37555YzeANAARjAdUcaNRHw
	oI3ckzm4fXKvVxybf1mNyVzowFsWB8nC2OzYoH6Q73hCQa3XGtzxZvAoC10WgS77q9m2zoPiNlu
	U5ucVM0nLIwmAY7f3W4QjVdFRA/5cxd21lS+YAAvF5nnD0rWQY9AR2yoheza/X1j9mDE8F2MTgi
	SP
X-Gm-Gg: Acq92OGQYYypK9tDwJfDxM7XzAjPwrhA0X881qilbpC6xwE8ZQXjvDpHqNe1cQGuc6q
	xmFM13EpQVPM9iaL9UOy+dwJEDkWpv7akj210KyEOPUx845Y0KOV19pVA5A/QEDBhQpIvAdqflv
	4sclCzvoBs3ZcoI+g4aFveFtZpG0S5VLEn6cD7uYxPTbqX3mLWi/+xuY1Bc/i+NnUCAWZAOxYrh
	60gB8prz2lE5rkYvrJm/YydLUoW/FtkrkMocaEbZroNWmuQC70BBKc9fymTsyI0qKp6gIBGl39K
	1EkDwbe7mIfRGr6khrkJAyVX5FVuDPoBpB/dMHpGLAgsHN3w4/HdOHxebI2U2w3/d51hEdS8pOl
	Iqcafksj3nizHDgbCKHCKx2bIgyT04zi+wHwfGBRnnyOc6jKGodzU6M8VaEsNt5adhucJLGXxUe
	OagrtJ5NO4ZoHmZDk210rfMujVBPNnd6Df4lxKfWW9XvJH2w==
X-Received: by 2002:a05:6102:26c7:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6c690fc77e8mr3840412137.12.1780322114077;
        Mon, 01 Jun 2026 06:55:14 -0700 (PDT)
X-Received: by 2002:a05:6102:26c7:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-6c690fc77e8mr3840396137.12.1780322113673;
        Mon, 01 Jun 2026 06:55:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596664sm2042866e87.39.2026.06.01.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:55:12 -0700 (PDT)
Date: Mon, 1 Jun 2026 16:55:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
Message-ID: <lepv7cgykrylficddcnnbii3kzxsiei3itcwc4ibq53s33rogi@ndnf7zrtu5ex>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
 <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
X-Proofpoint-GUID: WcE9x0wiNm2Gf8XFEvSGfA194jUoM6TV
X-Proofpoint-ORIG-GUID: WcE9x0wiNm2Gf8XFEvSGfA194jUoM6TV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzOSBTYWx0ZWRfX2OatAiQVvjeC
 H+4HvZQH2YP0HoS+TRWUDgDyy11lFwxNQVx9O7YBRrKnpIehASTUA0vpM/gSnIAmnK4V+t/3v1U
 flJfjxQH0zt2lKPIHQ/nVb+z5ZYdtqOIt6McvAmDcFjuQKUuXBtvkEewtA1Ci7ARwqnExprvlDy
 Egku5rXBjg2eU4KSMxBaeox1w5vR33owvlDfL0R7P/IpYJChdGofMDTlGS6YsYZt3tco+uQK+5e
 uPJiaTtdBq5D8EdPPK6+W0KufcFyzKnAqrBEjwj8Av5huNyRfdj4IVJ6WGJCwjqtJv1q2vPfZJf
 mrHz8vpapJ5oJsEAwOvAYLyUNJknxcEYQCKFKnxLJFHT4wfWyG3hR7yHcK+a1ySftaYxrTBd8ga
 2cuUPL5hUkyHN4obsS53qaFTshkjpZ5sPS8xTzEwV06YEEkDbaC2gWGN+GL/3mH4gBc0Xhd5C+z
 C0uFk60yXTEGXF7gzkw==
X-Authority-Analysis: v=2.4 cv=P4YKQCAu c=1 sm=1 tr=0 ts=6a1d8f42 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=kmbsWd4-S-67eBYOI4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010139
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110611-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A15C76206FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 06:31:08PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 01-06-2026 17:01, Dmitry Baryshkov wrote:
> > Is it completely compatible? If so, we can drop the driver parts and
> > make Glymur fallback to Hamoa.
> 
> Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
> probe a non-existent CSIPHY2 register region.
> 
> All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
> to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.

We have all the resources in DT. Can we not use DT to determine whether
the host has CSIPHY2 or not?

-- 
With best wishes
Dmitry

