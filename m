Return-Path: <linux-arm-msm+bounces-96811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDKrEA3UsGmLnQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:31:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9747B25AF9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 03:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E8263064BF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 02:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7502B274B23;
	Wed, 11 Mar 2026 02:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdmMt3LB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E051DF72C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 02:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773196298; cv=none; b=V6/7R9HOhDy4YRYrUj8gMc8Ptn0xg7QmW9xtm7Et3T77pWQArEGJ6roYVDjYmGbkfr2pKUrOoKcEf3YJXYWeqQnEKKyOjzjSK2qijuZvoU0j0Tk80wOCjlXtkM+1IoDtmdXvrP3YMxN/TqV5kY7OBpjVzEY0poQpnXlrReVpx1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773196298; c=relaxed/simple;
	bh=Z03M98zWigFP+44qUkERvggDlIvToobmoebeK/UHstM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so5l4pxlYGFrQBoPYIpjZKLqlM+IkKRn4CeZiquw93wDTbZ7afu0g+31Mxs2baLl9bOIILFLcd/CvrVtuxHFVPsxJUw7yGPiHeL7UWadE1jCRdlrwSU9gohgrNKhh4VBev/m8IcKCRLtTck1/5Kw5lJAARnFkQ5eE1pTyMRBzBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdmMt3LB; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cd830404c2so319877485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 19:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773196296; x=1773801096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RYASA5o0ARek5BWoJ2TGPTOQANHoirb3AbtC/R8tQuA=;
        b=mdmMt3LBunPA/MJJTZlNIXogCk95vnBkSpC1MeDsk2Gtb3dcrPiOjE7LyhWC0u4VYA
         OdCI3i+G3QjclEPWhLHl/a0M6O01BXDyfz+ogybhweuB/dWJDWwFBmkMnCQ1UIAdLMny
         wVGTD29n99ueGHDXsLh3m7Eo/U756kPPlpE3xgidbqW/EAip9Wa+o1V9tG+AteMfJxfh
         MUCdLLP5Ay+m+uXwny9cO039rXNzRGAHtrap1RJdLZ7jPRUm90PR/0i0IU9RJv7QF99n
         GrAHU6zzJO2lZjsQKvZdtEDcosXsuHT++77k8sCq36R/3WtG1Z2zn845stYL6ezeYcqP
         xYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773196296; x=1773801096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RYASA5o0ARek5BWoJ2TGPTOQANHoirb3AbtC/R8tQuA=;
        b=ocWZuj468PdFDwWhec5YWWNxjV/9sdfT9wSYkV+gFKLSP8lftbi7BrJfcfBto4+zlp
         kqhc+IqHECeqnkqI88RZvGcdW5aI5xZ1nMuOEV3Cvxq+5eF7HamrUYDEjZrpikvZ0gxv
         SL+bYP5wRtkjp058jeQ9RMgg9aQGdfljCq6KRVsVDnjL11B3gZ9nc7toQcrEuwGBXprq
         GmV2a2JJ/yOitQH47L3R4LsuoKA4TMFKTpa84smkvSjDkqdn8YCKBBxFsvIZO+HllDAx
         v0qRFTJ7cU+9Wa8RJmHQbUc/KwRrG8B1p5bkRJ9dx37C1jS/O01/LAI6m2bV1K4TQDEU
         tyMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnT9+spmbj7hxJVQ2czGS8/PQ3YngUarcGmAt64KmJRnHrGcE3fJ32l/UZbZhXPjDky2fXUhZk8EASKDXs@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVB5Oa8JV4VBojNPxS2GqFkZRgU2UOj79cvkcgeEqSKTjiPGM
	7FuUCdCrp0hDtOqAHumxANo8vJSefcnq+hrNm+vcrUa0YeF6eEnN61wEQK9bTg==
X-Gm-Gg: ATEYQzwDWx92k8VEu3LihLce55ekSs0MPr4waysW/1NyqEZ22vtRm26QUOfaHCGkGXE
	Iuz4g7l69hKe246Fo8guz14rcRik34gZF7bzbvwW26gGXSu+o62KhVFCgHbTgR0Y7lPxouqhG4o
	Gj/SVMAadbG31PNuZDyOCZ+w8o2mSNGl06oaZPawDgUxfqauSbM4pjhzH4e+0YdfQb2ZbwwoHaM
	2z0gN4im8fmixLuBcsasbehQp/N30h5rfM90TkSO2yt4IXRPGs/AgujqfNhtgawRVgsb/nIoifQ
	DF9oCprxghiHRXK5m4sYsVF3gyCCKJUeawelUCSzUKFII5jsTo8jBZs5vI+ihdPQszkXGiLiS9R
	B/2kzmpjnflWQbplfBPo0Y9tN0MX9YPK6hb14tDWp0wtX3M0bJ178I0slFoamMBjHM5/ocrrU+e
	KWnYGaasUgfsrunroyT676ixu7LQ==
X-Received: by 2002:a05:620a:4153:b0:8ca:305b:748e with SMTP id af79cd13be357-8cda1a5595fmr128197685a.57.1773196296096;
        Tue, 10 Mar 2026 19:31:36 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda2166a79sm45713885a.49.2026.03.10.19.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 19:31:35 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:32:07 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm670: add thermal zones and
 thermal devices
Message-ID: <abDUJ4ymu-Pv7qnD@rdacayan>
References: <20260310002037.1863-1-mailingradian@gmail.com>
 <20260310002037.1863-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310002037.1863-4-mailingradian@gmail.com>
X-Rspamd-Queue-Id: 9747B25AF9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96811-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,17d43000:email]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:20:37PM -0400, Richard Acayan wrote:
> Add thermal zones to safeguard from overheating to high temperatures,
> along with the thermal sensors (TSENS) and CPU frequency limits (LMh).
> The temperatures are very high, but should still be safeguard for
> devices that do not specify their own thermal zones.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
(snip)
> @@ -2289,5 +2322,372 @@ cpufreq_hw: cpufreq@17d43000 {
>  
>  			#freq-domain-cells = <1>;
>  		};
> +
> +		lmh_cluster1: lmh@17d70800 {
> +			compatible = "qcom,sdm670-lmh", "qcom,sdm845-lmh";
> +			reg = <0 0x17d70800 0 0x400>;
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +			cpus = <&cpu6>;

This is not supported.

> +			qcom,lmh-temp-arm-millicelsius = <65000>;
> +			qcom,lmh-temp-low-millicelsius = <94500>;
> +			qcom,lmh-temp-high-millicelsius = <95000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};
> +
> +		lmh_cluster0: lmh@17d78800 {
> +			compatible = "qcom,sdm670-lmh", "qcom,sdm845-lmh";
> +			reg = <0 0x17d78800 0 0x400>;
> +			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +			cpus = <&cpu0>;
> +			qcom,lmh-temp-arm-millicelsius = <65000>;
> +			qcom,lmh-temp-low-millicelsius = <94500>;
> +			qcom,lmh-temp-high-millicelsius = <95000>;
> +			interrupt-controller;
> +			#interrupt-cells = <1>;
> +		};

