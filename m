Return-Path: <linux-arm-msm+bounces-117761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SGT5MDx4TmqbNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:18:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266672896F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 18:18:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=itEaViqA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SivaWglh;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117761-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117761-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C190F327D2CD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C472E40928F;
	Wed,  8 Jul 2026 15:48:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F457409276
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:48:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525692; cv=none; b=n45cKgveBkcbk8qSctlhhwbGe1VSBULdxBalDARgLQHtnjqSfWgCs5nwSjZjGD81qsarNEkfrYSEoyIHcIg/FUNwZRhHjVf9VghBh8as1EF8Cq5lbMpiOyVhWJK4wqBi1QZqlB1glhJ3+GmjnDLvJkQjHf5L2TxwYWfy/hrYtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525692; c=relaxed/simple;
	bh=sS3qzw9xUKznsxErwsW7mmRnR3TRES89Ik871TJ3+CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OF4+MA/WbPk1OZBicRXJ/iHoTZh7i2VRCajYXfTVYhyr4qQKlUrPE25oXoDqMPDAXwqTLri3PvGVjD5dOHvwRkM5jkIiXTh8lafMsdDCi/hSVKTwphOxKWLrMNUUUhSqluk4r/Q64Q0rRpdP/Nl84+cqco5+FoS2hYDkEXxSS6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itEaViqA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SivaWglh; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3aS52727596
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A+PAvGZDJ6yETSyurP4IAMt+
	zY4ZyHmiL3Nfcgyr9TA=; b=itEaViqAkiNf3+YxcBVwePq/Z4YqB7zUEK/6Pg1p
	s4YPocLF7+Td0RFRuIWboY+U2OVdWtwXZeAxTWnTfS7Dfe3QESh8R0OTwMCdLI84
	9Q6bvAzKX/I/x7Z1tBecy0UNqrKkX+HQlvha2PZb8gNdwYoNojQgIiUJafqdoo3y
	D7mcagbRXPOBQpuc6/QHzxP10EvNOVR4SEDAr0gIqur5CQ+uoqrNquo6ZPEp5kyo
	lWOr7W8es+gwqylO2IQdKFe1QyPPYWJa8C+ArLBJr7X0vg87J6u60JslJsWDjbBV
	vB9UVch5EJmd69o73fM7OZg4YdWDZ8C/2dMljtV7uHufYA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9c6abesa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:48:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-744e7c40512so45442137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783525689; x=1784130489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A+PAvGZDJ6yETSyurP4IAMt+zY4ZyHmiL3Nfcgyr9TA=;
        b=SivaWglh5Z251iPTw1sWW5HPsZXTQMUwQuILc6Ij4dwzbP79W0R/V7i4/DtTxh7Vjn
         +4eRKpSsXFdqrTevr+G3aEYHkhrFEOF//oRrKsasaXYmY4+5BqRU0ieycIVeYDiNY20R
         pEEdRqCQwms0mdMXHtc3Cd6Esmyfl1nEMj1JguYWXmhLeATzsM2MfyRp2GTw1lf+bziR
         9G2nmr9tiRuUnO2Adu/f/ChEmWa9LHvxc3Q+d6Z+8VTuUsr8TUr4uOTAFPswFzttmcC9
         m35NUbO+j0dzpgoj/hpiMEjI3SOgNJdLo6Vq7bOOd/rzT/2obyAP1dZRnlrXP7rAhjVo
         G4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525689; x=1784130489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A+PAvGZDJ6yETSyurP4IAMt+zY4ZyHmiL3Nfcgyr9TA=;
        b=g42bOKPV2iJnKTJvDH7qXi7UVWVefY7tL8pbauKE4aejkaj9DxbPpdzz2HtJzZtyJK
         opH49oue3XTk9y3bJ3BBDaLiv53omeRjVqwQ5UuObsToBGEQeyWFySOe3SvP/Eqy0r+Q
         puxQulRxsuSFUl7/NtngUY/aqUfi8zCB0Jr+FgmfHJIm+fEFkNRlNExM6YVe5AK1vZ7A
         CU+ztrvMvgtZwNhGCD6cy7l3eqfh3qUiPfoI9cKLWaDUQXsdy/8VsIIyCtSM9PJOyi6R
         24YevjyaEHfoLEwwFXaCU/MBqWfdf5cIJxFOS7ALKbcYcaWMGugUKb+KUWBxPHN0BkSO
         217w==
X-Forwarded-Encrypted: i=1; AHgh+RrKHhls9neSPI7YBzq9Z7Lhfsa232m1MJ8IxyNxHPBz3RpXtuJ5/20bA8xTEZjjuWm5jGB16tlkT9EVGvx6@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXCUDHNnUAYMyTer3dJKcNUyYZWpqMCrp5YyIviOwajOu93Dk
	OzBF0LxdrJC5pNfu+17ly8IYVNAQp3pkS+H2f6ySIyq+Qmn165Fb8q7Y18Nq/ocDIFn5GjjNUPR
	OrzviAh2D0xelcTG5TGloK5M065dvH/jstEr65zxdsZJIpWUeAzy0zpeVH4/Ji2qmveho
X-Gm-Gg: AfdE7cnBOK9zAYIOLDN/qXhkgkAVeoYh9QGP4rN8r8A2SBy12M4SJnYiDjz6wO/mpSV
	TYFF2Hmq5gPPLKVkQsGbK/rbaWAWtPKoVOMrXj60yBtsmY88N1HHoI6YygUHvcjV7GGyobacrMW
	HTEVDV8F1a6pyC4mPVLytvvcS1D5oNrmhGd1sSNEoqacBQF6jxatEGUyI+vVsH8QY0NSG/uHxbV
	lSEuQnGFb0GzXpuewI8HXdmEMGGm94aEO2fi57ky/CJwqaAp4cPIxI0lVSU7h55M/fl79KToACD
	7jphdUl2GP54aDY22YIv6boytd02etVvRxZv14Kg+lFRCuhVhh2WLTPpI9MxEmU//0u/5GMSj+d
	GSTC8asROuU4A8mXOvv6C4BZt5gA5S2C6QhKwz3YNj64Nq9k3MQIu2pPnutgCuY2ecQDGkizY7e
	UeInq8a0P9HIt4jpnYp9KtYsgQ
X-Received: by 2002:a05:6102:e0d:b0:738:9c30:2ba3 with SMTP id ada2fe7eead31-744dff0b224mr1584515137.1.1783525689246;
        Wed, 08 Jul 2026 08:48:09 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:738:9c30:2ba3 with SMTP id ada2fe7eead31-744dff0b224mr1584493137.1.1783525688728;
        Wed, 08 Jul 2026 08:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b012e19bc1sm388228e87.26.2026.07.08.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:48:07 -0700 (PDT)
Date: Wed, 8 Jul 2026 18:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
Message-ID: <2buu6nb2oxk5r3okzc53yyu6f5que5mqjbwiwxctypwzrpqmma@q65jf2hzr4bn>
References: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX4Z0i5OdA0hwV
 PZl1eCSdxc4S+5XnD+Uj713a8Xq9M4jwtK8c+g2wAxxKh/rIN36WHLwP3CXwxnKLnWzWD2LwsIx
 uJ8YpuFTjqfSSw93+RezVAl0EIDBfU1kaJ/L00kX7IBnG5ymk30TnNqyReH/Lo6l1vcpVfPmGzb
 9JrB0L6sjVZ9nedICPoXnLlcF8l80DZNbS5cgVf+whgWGNESv0wKTmxsHknZ/1CXht4uQGJjuMD
 R/SXm4D0JW48I+s77FK8NwNHBcQbxQhuZor1pKLUMyAAvjcbyTZ/TjmE6ogg6F9pI7FSAQXKumo
 nmU31GGDZXhTg67M7Uk1WJoGg2VKsLKnndSoBVVsPAVDnvCYrqyvMUvYCOX6dyou5km0sgAYANL
 JTm6PwHriIwVeCVLtTjIcDGUOjKoJiHCNyzcDdFZPv8yH8LZ67kQPKoqeniT748nGlUy0EZ/m+t
 idYEYs7ad7JMqM/kEHg==
X-Proofpoint-ORIG-GUID: RpUqe8uJ1QdgDCBkd8at8VG_1mPHE0UY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1NSBTYWx0ZWRfX4l/GB6DLOOFH
 sjGRw4sBNexghCsAUIhXYqStHHxYIupPstwxzbiS4b/yQsbEqtUre0MJ7FzK5t2nOk/08THhfbT
 BBXEHHt9gXT8uXKDtwd3byL3WwZfhu0=
X-Authority-Analysis: v=2.4 cv=UehhjqSN c=1 sm=1 tr=0 ts=6a4e713a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: RpUqe8uJ1QdgDCBkd8at8VG_1mPHE0UY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080155
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117761-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2266672896F

On Wed, Jul 08, 2026 at 05:30:13PM +0200, Loic Poulain wrote:
> Add the board's horizontal button connected to GPIO69 as a gpio-keys input.

What is horizontal button?

> The button generates KEY_SLEEP events and is configured as a wakeup source.
> 
> Note: The button is actually connected to the onboard MCU, and forwarded
> to the SoC via an active-high GPIO.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

