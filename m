Return-Path: <linux-arm-msm+bounces-114766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lby/F3YSQWoRkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C324E6D3C8A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N7ocLZcc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PHqj5lFx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114766-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114766-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A713C300A4D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396E13A1A58;
	Sun, 28 Jun 2026 12:24:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588F350A10
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:24:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782649459; cv=none; b=DxjwdW0pf+b2trR1rHWuiFWF1TJObl0EvyL1pwv025M42LVHrLOayA/40HxeBiE3C41+LK4o8pZcWhpraPALi/e438c9Djk5AC7bGcBq6keYsGLErBtVCFNTEa2ko1zqwZQsenSmg/HqHQ/Cphe7UOVL++C8zwmSt/S//yQzaIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782649459; c=relaxed/simple;
	bh=sbIkMcyBPUsyumhxcg1yG4ua3ww3bZD1a2AyBNbyC1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5Wunl6ObET79O2R6ZiWFgjA3Gq7c8UPPHu0w+5HfEEHQrBASJ/8tTqG8PG7UC//4DJvWOnsoT4c0hkRFK8YH6opjh42h9L5re1iNTHVbb2tjlm/z18I4+3D1xLPQqO0h8VCN3Tzh0vPDc3MAT2ZyJF1y4JR6wq6PFb2MhVkXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7ocLZcc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHqj5lFx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9P2jt3596728
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hB0D78KIovgBc2EIAjL61fKb
	7egf7gVyOgoHTC7m6SA=; b=N7ocLZccV1BBJHejEUysxxVozYVHrzaE1fwEN0+p
	sqYFnLUAzHMiPD/lZ1NaGCD+VhhJY5Ei2G86810lSkJ3BmhTgsIDOLuEktoMeHHX
	tlg0weIC8dUr7fGrRvgS1K5GYQuE4/Js7r1oICtGYp6RpIHq2XMDOq9NaK17qFZt
	lNQpoWms4aid7hKUXHPw7cMw6rx2SseSrgS2JFApDxXr0hVsFYhBebvI98YvGWxl
	R1PuZ0f9Yl9+A30LOS0IytfxbRiHwRNCccYS70DQnU0QnlN7QEW4qDn4b/lA5HN4
	/ZdeP99ONTCJ3n+HysXXgJlNScjMZMPN7PCdy0lHfePCXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27332uff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:24:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e45453c94so183080485a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782649456; x=1783254256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hB0D78KIovgBc2EIAjL61fKb7egf7gVyOgoHTC7m6SA=;
        b=PHqj5lFxL4WSi1wp+m8bYtzsWgC+j2Rl0oW4JyG6IlLqhu6+AaWbhmZOPJRrdTuLQW
         TJz3JVqC9TnemYKXManC/aLxN8XP8r7OmJg1PPFgCFEXiZwx5vzoQqsKGk0L92lzLNHz
         UxModnj9iz3KvU7w1Lm8keLjfPXnagDhuUvYxa/fkFCKc74fMBPvj+QZhKALs7Y6W9uG
         bmFP9FbuhEOQmuXE3lXJQrDvzhMjcTPjvl0eTmJ8iuesMgM4U8/eeXYp90yF2ygHrau7
         LiJOWq2O+gulcm6zVcFr4aUwa2esV+Dti3v3X8OAIwKrWTipN/ncDeHNgg/2MjMMNkUD
         buIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782649456; x=1783254256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hB0D78KIovgBc2EIAjL61fKb7egf7gVyOgoHTC7m6SA=;
        b=QIamKEuoc3TjNXsaWvOTNqLxPUJ1y4fTeAJPIOxr6S6Tr0WQpnHGMY9N3z+9y6ikAy
         sbw5Wt6aeLLkS4zTFBCl27a8Qp26t86CcZprSg7YjG6fuXCn31pjiDKhoaNI3nHbwN/K
         0c2mmYH7SyYbnKuz2IM0oOQrC/tvk0n3F+cspX7zP7MhMqSKZBtYUUat0xs/PTgumM7o
         AM/9ER0FV+tMoUNrOBW4L6duwHViikJCfZWo2WYAgeEoZdiIS+IJsC/WtIjAaJNOlQi8
         xEZ9CYxiw95zLDUSgn6uR9eOdgp1Btfn5AOBat/J4SEPYNU0V73H9aNA+aMbaipJwcuY
         fNUw==
X-Forwarded-Encrypted: i=1; AFNElJ/wNIIYvxutz5G4/Gxq43N3x8D9neN5ULzhta0cSXp8Qxx2XKHiG85HSt9oEqNekNalDsbjQ74OWZG8O1ej@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2LPEnKpPZJuFIXz2RYQD0fTzTFLgDL2769Et/iAcW7jkvoe1B
	7+q43Bu6a3D/tQBadS1IrjW8TKUC1MUFBa86zvOnL9MRgL4c4JvXROrFdjMZpmr3JDWlJhqU6hL
	gupncTydSvgDJj+gkPSSiD886goW5MWWt0rUrj5k0kvLkeATDlV7OhRqmcHVkoFmEnQnQ
X-Gm-Gg: AfdE7clmbKr3I/pG8JOpI5DsK6X6AuEPPktXjHkOtG7zOjy+ZplFQYy6JXEefbl31OD
	SluTZOXwrXWAty/4NFO+piBC9008Nx10+6rkvwmo03U78M82GcU9eL2f503nwjCTs1hjtey6h5s
	kMdTan9E1nERRl1X8hoNwLznJMI5RPGXX/2Pt/AbrXIQsO/BsTDdLrJn7PmgMOaopGitWzCgweK
	HuZMP0XIG0HL7TIOKvTLkTsJYPBC1VRxNS7RECZaVcaHMVFg8Bd9GRD7ELzmSVCgp0ivWvaqDjP
	tzvO1JmUmezmUTCBoNGngtDQH/1UWEfJVjBqkyyrAbOBjYoc/xPVDX/CnruIIfg9HN/mpIvkf30
	VfAX8oZjaD2KKXjLPABTQjQ6r3rl2ATEJ4k+LzWPCEDXgnIkdj3pjB4sxFRcl3MCSVkQP9367wz
	djkF/PhrEL+MMVPpRO+I40kKdr
X-Received: by 2002:a05:620a:2684:b0:920:798b:e2aa with SMTP id af79cd13be357-9293d5b26admr2140615885a.26.1782649455966;
        Sun, 28 Jun 2026 05:24:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:920:798b:e2aa with SMTP id af79cd13be357-9293d5b26admr2140612985a.26.1782649455451;
        Sun, 28 Jun 2026 05:24:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb139201esm923603e87.37.2026.06.28.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:24:14 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:24:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Subject: Re: [PATCH 0/5] arm64: qcom: dts: Add display support for Shikra
Message-ID: <pm44eparuibjnei5okhvfmbbeonq3rssyic4yjmhqx54ahk73w@2x7k2vgmtujo>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a411270 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=V1VsDmVQltbkEKSUdJkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lj3-b3PtQYMqqnNc_w6vAPGypBB9EzvQ
X-Proofpoint-ORIG-GUID: lj3-b3PtQYMqqnNc_w6vAPGypBB9EzvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX0quHzWls4SIw
 rG7Z0WOdnN1Lz2EkJDS7gI37jdAYgUYRvQbO6xVyQw/hPTbiouZh4OHpLZKqo8i3AFyZWQ9Be2h
 l+5qF0AUd1sQcPDoHCurbcGHz7zMs0p0tCOBVhNHUZvbuSGC00YDiFjsRkimZOg/dQo27+lAJd5
 atqpKdMbmUaOMarAkz5LSeujKC7JnCIVsEpqvBsJT/8aVCgQCqFgKpy10ueagQdaDmNM3jUIfVz
 WnWOtMmNZ9tcIE4Uk9+jiUUkv2cTzH0+JaXBbCmsUbnnkE7Mydhy6GnULpoGAe/2GuEODqAfI6y
 rWm8cdevCtNy4dQrnQL1l9SGQsfh6UpXa0U0beKGrNVnnFvc9AdY+o2YYoGREovk3o+MxwgLxy5
 gnlEJXr9ci1Pxt2+iQNWDSYtWyWJTqNy4xsk89cUly69Cr5WpUnoTFZZCYQbX8H4IyT+SLajEAg
 CHQpBuuCfykRYZtHyVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDEwOSBTYWx0ZWRfX3a3kQhzpK0hT
 NvSBlOu3LCO5YqNBJOBIwMHjKB/Zsn1siheMcLFjff6kWo5lL9kjgvho9A5RxQDzrEngohf6f63
 e0R0s7uFoD1bZvCLZ9YeMXjKJW/Yy7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114766-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C324E6D3C8A

On Sat, Jun 27, 2026 at 03:31:34PM +0530, Nabige Aala wrote:
> This series adds display support for the Qualcomm Shikra platform.
> 
> It introduces the Shikra MDSS display subsystem support at the SoC
> level, and enables display on the Shikra CQS EVK, CQM EVK and IQS
> EVK  boards with the required DSI panel nodes. It also adds LT9611UXD
> support for HDMI output.
> 
> Nabige Aala (5):
>     arm64: dts: qcom: shikra: Add MDSS display subsystem
>     arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>     arm64: defconfig: Enable ILI7807S DSI panel driver
>     arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
>     arm64: dts: qcom: Shikra LT9611UXD support
> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts 		| 104 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts 		| 124 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        		| 203 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  arch/arm64/configs/defconfig                		| 1 +
>  5 files changed, 534 insertions(+), 2 deletions(-)
> 
> 
> Signed-off-by: arpit.saini@oss.qualcomm.com
> Signed-off-by: mohit.dsor@oss.qualcomm.com

Unnamed people? This is not a valid SoB tag, FWIW.

> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
> Arpit Saini (3):
>       arm64: dts: qcom: shikra-cqm-evk: Enable display and add ili7807s panel
>       arm64: defconfig: Enable ILI7807S DSI panel driver
>       arm64: dts: qcom: shikra-cqs-evk: Enable display and add ili7807s panel
> 
> Mohit Dsor (1):
>       arm64: dts: qcom: Shikra LT9611UXD support
> 
> Nabige Aala (1):
>       arm64: dts: qcom: shikra: Add MDSS display subsystem

Huh? Suddently a different set of authors for the patches. Please clean
up your cover letter.

> 
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 104 ++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 122 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra.dtsi        | 203 +++++++++++++++++++++++++++-
>  arch/arm64/configs/defconfig                |   1 +
>  5 files changed, 532 insertions(+), 2 deletions(-)
> ---
> base-commit: f28fb4ff0d25819c58341fec6e3953f1ebb1fc2e
> change-id: 20260626-shikra-dt-changes-8d127be951d5
> 
> Best regards,
> --  
> Nabige Aala <nabige.aala@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

