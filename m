Return-Path: <linux-arm-msm+bounces-94527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MH9RDpb5oWlkyAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:07:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F61BD376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 21:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E6BD301E6CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 20:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A184E44E055;
	Fri, 27 Feb 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clctQl9T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hzesj0Xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0FA3559C0
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772222859; cv=none; b=FPyBj/JfMR8QcPNQDjpUcjEkFdQccWltkA9HsC9P+tQIEw6/nKlRTeFqMJ5alwWQXV0siGFmRzasaz386OrCVDtXKsoIYDxTGDoHfu8/LwWLxnqTFGQcHgC6vvOApnyZWsJneJ65DmXZZBkzHdy/NgYRVqbxxQSxuYmpvFyUpys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772222859; c=relaxed/simple;
	bh=txZgcVst+V0JsJDhnBFFCtLGMricTLlMWXC+mOAUYbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgM6jnecQEP6Yn9TrJbt+K2oNgusAzKG5pJ0F0H9RMLoyHKv6fUF0wSntcroqPATOSDXo0ibMxzDM12cE6VBEuCW4ZfOfZredB+X+043OWbi1MEBALP5Olhcb5/bw4AJ4+6GArEOw4nF2pqcq2VE5ByFm0Rjz2EmbrwklDIX4YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clctQl9T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hzesj0Xh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RH0GsD2167373
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PKCkZOk7ucOWcT0UjrNRzRST
	kJjJvgL61ainDgN9SCc=; b=clctQl9TbsvQXzLlHxmG1LzgjTx011DiSbbW8O0r
	qmbaiV2kUvoAxIbSZ1CE2q8xbsEuWeksXOGmqic5BNuuSUe91azuOBnB9riaKzWk
	PMncGqqhkq9308V3EK9z3wbpxIhAR81sJbutXajioiJfl5G0XqMbqrZQ88LKdc3j
	ZyAo7kGVGhdN2NIo6FceFTPxU6n6TplMSvO65SHOF1o+kRoPLswXoIZyYmTJKM1k
	V2+rgPv6N1OVsU4cjay15g2HRt88t8VbgNdM5xsJHcNYsDID7YRelF2qCiXvjNNH
	MhjYE56m+DRfquSUKZA5kNwuNCeXuKattZAQEOEuc8yrJQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xv2x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 20:07:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb52a9c0eeso214550885a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 12:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772222857; x=1772827657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PKCkZOk7ucOWcT0UjrNRzRSTkJjJvgL61ainDgN9SCc=;
        b=Hzesj0Xhg8IwKSkPBITUBGJZf6XP8ucWrYLxoAGxxliY0n20+F11FtEz7fCjpsJJkI
         O25qGurW9DDpDbNiHZdMbG+Vs0z0mjnMQojLi+5kKsO/50cTCZ7BIE2O70niqkAKCLfn
         QAbVpklhHdHmkS03femcAIHD0bl/hgHc0cfInJBvnwqUdax8+pryp8xhNVS5zInMLKx/
         AL83IPMmvDamiWu8QqN9ga22d+m1kV4ZDcmQvvBzYshBbqLKreWF3PjgChPTiEyT/h51
         1USOIwgYOosEszp0jRtU5HTL67juUv0E6kt5dbGkglXWOXMaVxghwu6VgLHF/nzosbFW
         JjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772222857; x=1772827657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKCkZOk7ucOWcT0UjrNRzRSTkJjJvgL61ainDgN9SCc=;
        b=jJkTkVXyU1TyKcoWWrjyOgfhYe7/trkWH7rq0i9N4QzOCBq7P4QmeKeQfIOtu6XbNt
         q+jXpW7B2mMEKNr1vxolsRUt0tatAoFuLLQ3CoaW9eNuuFxvopwJT8UVxFcSoDQDCVzB
         O72utmZMqIvT5OEF03fUtzjET4jjLaJcMmMQfP6Pza6Spma2Ih2Y5BdxnkVhlJBEPd0Y
         IVyxIx0QUv0IgUoCFAG+ppjAmW8SaaTOA78wbEjL2OF5b10NXo/WwCf/wGSt8o9jC4ZU
         3/YDBI/n+CVsoMXO0NVcnMtlojfNsM2i3fa0b/Ugb08xGEkrutfQUXp11hISPCxctZcv
         noQA==
X-Forwarded-Encrypted: i=1; AJvYcCWI5ublV9Y3LvDyYvudCGZqySW3y+RfXCmsmIuTq/SXZcippB1LLnXLo5UIE/kmzG4eYKrTdrddmFo239rU@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDN5JqbvcZvK5t6+4hu8xg+MPyVvoLbBR0pwjzvYJ+mJx4vDH
	R9q88nqvs0qKACYP9YO7ukwFLBLxXWP+uG4KMACN3TrUciiquKOL1H7OoP2qEqFolwcIlwGgBSz
	m3FAwOOMald8M0tqmaeZ66Z4lkQo2TXmbqWfUwRYPYhRqPppNFoQsDpecWB2B5RV1GMuy
X-Gm-Gg: ATEYQzyhPiGHGFydyP4oi9vCvS58ydcSp1jxiGFfUl6yNg46r+Q9tOaEp+c73fFMxMo
	4zCnSMOBlSbzkvONXvAlhaBjku4Lx30egARdDju3kkp7nv4AbeL7mDX4AOovawJGuYnMjI6FLcD
	frWDmQAKycXUctl54R+sOMc73tjNfniTXXBS/rN1XbwD2bfWZRysl09pIvTGWIG15Tg8HYQX192
	TICboEyxFr4YeW2zOP46IKNIO+wMRNH6Hut4/2FklGnux3uiyGgnQ7hCIyrxeoKfAdUN0x9DbEu
	CqvMmRRVaAazbxrLQFRmujTeqXyuHTWsG9sp+U3+ufNMGwgoEipxtFrKe88OgbkoG9uH1Zy/6vZ
	XwmqVgbriVYjHlWEbp1Mm3qsWqNLVc6hAw95pHqJWMCuAPfsXIcbNrPWh0Cu1cInhjn6wKbCFbb
	FHXkKsq72c1rFiU5Sd//i7GtuWku64dYo+pSA=
X-Received: by 2002:a05:620a:4454:b0:8c7:3ff0:d484 with SMTP id af79cd13be357-8cbc8e2641cmr595421385a.75.1772222856733;
        Fri, 27 Feb 2026 12:07:36 -0800 (PST)
X-Received: by 2002:a05:620a:4454:b0:8c7:3ff0:d484 with SMTP id af79cd13be357-8cbc8e2641cmr595415285a.75.1772222856178;
        Fri, 27 Feb 2026 12:07:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11721cbc1sm6844e87.84.2026.02.27.12.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 12:07:35 -0800 (PST)
Date: Fri, 27 Feb 2026 22:07:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com
Subject: Re: [PATCH V1 0/2] arm64: dts: qcom: lemans-evk: Update SDHC storage
 support via overlays
Message-ID: <fg4lxixp4fekhxbvisohgxoiaqya6gvuw5czflkk54kvr75xs4@nnze5nvbk2ix>
References: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227102405.2339544-1-monish.chunara@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G1lAdcEA1TTxM-tNJkmxacVc4vS7jWz6
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a1f989 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=Xq9aKHyif9_oXKuhy5kA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE3NSBTYWx0ZWRfXzv3tqrr4Si0G
 /aDgNMeuhXFn0rLRKWWuSCXkboQl2L0BXkK3BzjmqU9mGkfwcS5ecf1HkOsd+WKfXzBhbFNO5AU
 ywq4hPoKUrI9w/d1frQdT+/DsMYo0HA3eqUC+XzUkPG8vXRipU/zt23L71ABDJhT4V+wNbE/LlT
 qjqyVgAOhZ7YmWEUj3ePYJXZhn9G78R1BIYn1IyTrc2Zb56YmMfCqK69f16EPc/qfbOsVCuT2fX
 wPjPu3SoHxVF9PSNAYVd4bQ2DB5h+mZqJ8getBxoWjpKFL8LqeeaAujn8WNqFrNDAcjX+sKkIKw
 d76ITmntJNWDFyfJv44oT3DUimBe2MIzYnbqkvwGyK4gLOysAKfJSWe5ZtxIiO1We7KcuEz+9pB
 AWWPdc5xv95dowcunTHrmtPzhC1USJeU1rAoyQNd9to6YQAl053tgJox5MHDLYqP8eY4fMnuauY
 c4cXYRtMXemDsqgHJSw==
X-Proofpoint-GUID: G1lAdcEA1TTxM-tNJkmxacVc4vS7jWz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270175
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94527-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: A86F61BD376
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:54:03PM +0530, Monish Chunara wrote:
> This series updates the device tree configuration for the LeMans EVK
> board to support dynamic selection between SD card and eMMC storage.
> 
> The LeMans EVK hardware supports either an SD card or eMMC, but the
> interfaces are mutually exclusive as they share the same controller and
> resources. Previously, SD card support was hardcoded in the main device
> tree, preventing easy switching to eMMC.
> 
> This series refactors the SDHC configuration by:
> 
> 1. Moving the existing SD card configuration into a dedicated overlay.
> 2. Adding a new overlay to support eMMC.
> 3. Updating the common SDHC node in the SoC dtsi to include necessary
> resources (clocks, register ranges) required by the eMMC configuration.
> 
> This allows the bootloader to apply the appropriate overlay based on the
> desired storage medium.

Is there a default mode of operation / extension? If there is one,
please define it in the base DT and override it in a single overlay
rather than having two mutually exclusive overlays.

> 
> Monish Chunara (2):
>   arm64: dts: qcom: lemans-evk: Move SD card support to overlay
>   arm64: dts: qcom: lemans-evk: Add SDHCI support for eMMC via overlay
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  6 ++
>  arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso | 64 +++++++++++++++++++
>  .../boot/dts/qcom/lemans-evk-sd-card.dtso     | 25 ++++++++
>  arch/arm64/boot/dts/qcom/lemans-evk.dts       | 16 -----
>  arch/arm64/boot/dts/qcom/lemans.dtsi          | 10 ++-
>  5 files changed, 102 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-emmc.dtso
>  create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-sd-card.dtso
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

