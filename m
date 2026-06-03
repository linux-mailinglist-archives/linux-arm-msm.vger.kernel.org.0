Return-Path: <linux-arm-msm+bounces-111069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /SA3IXazIGqE6wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:06:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D23D763BBBE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JUsHQt0D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ub2GfWei;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111069-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111069-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C990F30670A9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 22:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F32E4D90A4;
	Wed,  3 Jun 2026 22:59:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D864D2EE8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 22:59:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527554; cv=none; b=lVjD0kUcTwdxjVlUtmaY41f7vRNVxDvzhjwBQFH4PCgERMJXXl/X4FpCExmMAskiP1ImA9o5uvC9eEE9srpyiJkkIOwbmEVVCWo1mWzvPQB1IEeabl1jrhlSgSNQPmnzW/uZ+Bjb0f2iZZjC4V2w3I7MQokjbHehCq72b+UGTYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527554; c=relaxed/simple;
	bh=RoiQDo2vHkOIYi8QYhXjdnc885eNLNOiDk6hnbsmcV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXMyrojT1mqNH8nm9jKiPZN4JHhRYKShUpoMwfgUcXXABHd48HX6Y4PQlLFeJ0AsVpY9trT6PyB5omyeMlnxfczQZ+RdI6ZQoEzsZRwoEK2/rppyFJ7oQisFOZoSNvfgwrDbgZrz3kEgoiWq0muSZ4xrcfu24HjpR0kIe8s8szg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUsHQt0D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub2GfWei; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Gu3MF3552309
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 22:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ONnM8cPGqCvQUEArvOdVRHLA
	7AjrNnYCfdYyBl3uu6Q=; b=JUsHQt0DxYLPJKgSTR9tREQC+/92i/jaL10JeZka
	jx+w7LeQXnnmF1WukUK+kcEWnvuxt/l+kFvuthhHCI4AaDnS76xdU7CZe4PJzwyz
	K4pbBszfCfx+alv7S7iFmtT9ExLdFXbo7XeJLWvND6VGIKR9I6rEOyaIC7iQ90Xg
	9iCkzFtDeVSeFE9jXjV05X+B3ZHU8eGLF3uNdxHjQ9Y5yb4DSJt1nRiG8no/6vX1
	96gpOiH9tdw6cUja413gftwtc/vaKQ+VyGGi+jsd9T/Go18S/qq31wYXJCMNU+uF
	jhitbT5yARcAW7GDcsEOVJ2x/bh93aalFtYzYhWqyr/g6Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mu2f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 22:59:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963b0a0b727so54501241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 15:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780527552; x=1781132352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=Ub2GfWei3yzVNpw5q0on8mOpXQn9Ro7onLdc5uE0xrcb05St7nBIJe5tz8cx+KP4NQ
         432lKORy6YYbfI541ZE4cnABBx2LHLkZWI4Ru3apfNAEAFdWPinb6ipPDjsw1deMjS0x
         nFqTF8TDAFrXLS8CDQtw+JmzbzS4XUIBt/StOWP1z/FjRg/bD4A8oHC1mvoWmCYvEakD
         H7JWa9p5vX+E9fBL+VOIH9jG92D4fGX4eSbpBNolkZA1ByC/8xWOxq17DEJAXSAuSE5S
         2n1240kjl4IC3I9ogQsii0M/JIgM9csy8UgwXG6SjNvsa+at2KjE5XD/TEOuJYRjpkak
         h1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527552; x=1781132352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONnM8cPGqCvQUEArvOdVRHLA7AjrNnYCfdYyBl3uu6Q=;
        b=Z32u7OBtXZxH08Z+5UnM9T2gh/Mq3CMR+D0agkTdwmSRYBZTMZEzE/SXlQrCXd7s0u
         hhbffnvpoO7Aw+buft8pHLTilKBtXTTQVxPXhaESdENMdAm6DTgs6GR811zYggSt1kiz
         pkWQmY5zQG0G7dOhydM5JWGw2KIEfKWacA11trBoW7D2Rk4LiRxliPhZMnLqoSjxYn0k
         Sm0q9/7rB/HFev/crkvj2VsYdxIsEu10ep05/WYItt3mdXZ2KARav1euY82kuy0/47TN
         tffnX2eBQEugfOgHQSiDuRNRveIsZ449caaieRE+4DeL1EvfOXHVoJKRETmTZaZozX2z
         VoXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sxXyU5g3WTMDEZpQs1KXTxSWClGYgBCa+Z6a7kY38hHNHfgcy4J6lX/cCqr3rQUxOoA8rZtdYu/EjdniY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhv8rA1d9bP6TLNU2r1DDvvLH+D8zZjwNFWfETjf7Lad3BB+DR
	O1PHKOliF0XnxJQxcR92HJmW4ZQyZjPwYbYp+wnzaBxvPiHx7bc/u0KvQdYSbl8IFHSEou/J9Ew
	hmDyO0jCjp5NawW+f95OXOdmuc5gtCTxdMkCePX21Oc+cIezpqVOZaMwG/6Yk/4F0XVt0
X-Gm-Gg: Acq92OGzd+AeU9/rArfLV8oo5a8pJLFnh3wsKz1tn2BEFTq/YFLeRSWfMSw6jNAJKAY
	HudG44Bljc7Y+owcXdN7U9HOgQd7PTsiLOgI4hPcL8YRU9nSQuUEEACPOzkbnU5KeOoyeELAu3T
	f5mW7bcojWuywwhc8XVhnzgX4EpO062VzlGmFhkShn8ZB4BTVsunag4/xpcf5U3yQXJ/GBRx3NI
	rrUUVSX36e1yRFVw/uEci/jF2Z9+f+8t+Ev7Go4F6VAI3QChd48mZeeuAkdpETQROmqqI04ApSz
	PlVuN2CMWkW29sJ1F23d8EJ7DnUqnaDwYFarLK9Q+2AR5pKJCm8grPuPkhUAT4UX1pVUrc6Ha8w
	V3+ae3XBJtMLrMETcV00u558Bo/OYxFfuJtdNckbxsK8bTeJF4BY0uWzYMzDRHE4D5oRkcyAJhQ
	e3bRkOC3vD4xLdXoeuhth34xZSQsogo7MEFxJeBr4mueflaw==
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216888137.18.1780527551680;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
X-Received: by 2002:a05:6102:644b:b0:6d8:89a0:4ae4 with SMTP id ada2fe7eead31-6ec43376b39mr3216884137.18.1780527551258;
        Wed, 03 Jun 2026 15:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac29sm880386e87.52.2026.06.03.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:59:08 -0700 (PDT)
Date: Thu, 4 Jun 2026 01:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
        linux-rockchip@lists.infradead.org,
        Julius Werner <jwerner@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add #{address,size}-cells to
 Chromium-based /firmware
Message-ID: <pfo7vpd3ooiyfuo3wjom7qzknnnkiyel2kdu5fjqqrq5nccysq@e63rs7lgdfl4>
References: <20260428200712.2660635-1-briannorris@chromium.org>
 <20260428200712.2660635-8-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428200712.2660635-8-briannorris@chromium.org>
X-Proofpoint-GUID: 08V4y0z0gjJk3wS3r0928eJcZvFzpslR
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a20b1c1 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=MUleZ9s-AAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=iD_vE5mCeOLV2fS3_3cA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=f0F4d6ZXEnSYrzQLsEx4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDIyNCBTYWx0ZWRfX2e6UYHljKAKD
 KJeROCb6EB/+LgI0NTd9V9RAVoZndOPlTO/V5XYW9/h72F56djwp5969DbCaxfa/2VhdY413Wfx
 WHIvXVgXnQSVdXveSic7ktsjoLbVmCXjvy1JC3YUO2AYKSQhAxrmCQKTiduURz5BiVnro40DFyn
 P/Fp7P57LiHVibyIscrIZHw01g7vDJC8MCG+mR6aerLCsKH9WfACoxNP4+74wwfaVM0mugpOD6k
 PdkmvDmUXiQe5ELmU4Fbx6VYKn3lZKN12ZDQBV+S/9m/lS8bsErgHIfwoSkKlqG0rY3MGPKTGXd
 g+2v6EuTklRQliKhsAurqoTotQ9VLWQ5uJotxUWU2NWfnbuSmYKC68VySl6Gd9D8PlBqOrashro
 U34Axq9ebv7fE694AE5yWXcwq9pqIL9+H2S3S8xLSLCsfD4PbMUhmj69xLRyfFyKSF+gFgyElup
 k7y6u309hW4tgTLnYng==
X-Proofpoint-ORIG-GUID: 08V4y0z0gjJk3wS3r0928eJcZvFzpslR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030224
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111069-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:briannorris@chromium.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:heiko@sntech.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:dianders@chromium.org,m:linux-arm-kernel@lists.infradead.org,m:tzungbi@kernel.org,m:chrome-platform@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:jwerner@chromium.org,m:alim.akhtar@samsung.com,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,chromium.org,lists.infradead.org,lists.linux.dev,samsung.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e63rs7lgdfl4:mid,chromium.org:email,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D23D763BBBE

On Tue, Apr 28, 2026 at 01:06:59PM -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
>                 coreboot {
>                         compatible = "coreboot";
>                         reg = <...>;
>                         ...;
>                 };
>         };
> };
> 
> Notably, the /firmware node has an empty 'ranges', but does not have
> address/size-cells.
> 
> Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
> non-translatable addresses") started requiring #address-cells for a
> device's parent if we want to use the reg resource in a device node.
> This leads to errors like the following:
> 
> [    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22
> 
> Add appropriate #{address,size}-cells to work around the problem.
> 
> Note that Google has also patched the Depthcharge bootloader source to
> add {address,size}-cells [1], but bootloader updates are typically
> delivered only via Google OS updates. Not all users install Google
> software updates, and even if they do, Google may not produce updated
> binaries for all/older devices.
> 
> [1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
>     https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
>     #size-cells for firmware node")
> 
> Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
> Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

