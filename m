Return-Path: <linux-arm-msm+bounces-111959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NYHnLx4RJ2pirAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:59:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC3C659ECB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:59:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RWOCw9PM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111959-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111959-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9E6630594E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 18:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3553E5593;
	Mon,  8 Jun 2026 18:57:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883723E51DB
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 18:57:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780945021; cv=none; b=PTAcCJPlRhkzoMvNcnAkfrvx8siW4lEOHsrRw0alWRwxP4KfNy8mOKEurKzyGEF+qAHvcx0v2l2MZZwuZ2YrzO4dFXkmIJyEkZNFXez79MR/d2T6uMlVkZJcZB2CrKTuzLc3EtCt5RmwFoAcY/a1/kvtTMTUV9z6QbKnAtU1FNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780945021; c=relaxed/simple;
	bh=sHRgZReIBWpW5NdfBaanZpgYqI1k260TPLXuy8TIblI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvChKtkQrheD9Cj36LgN7Z/PrpxJk3weB6XrSVx6n0Kbiacp2N/7PfuM4eGJH8P/jRCgxFvlfR6I7g7YRz58Ix3O+H5CEqpmeBPZmKXOXCWVFSjMeGpQDNoXA2zOlObs+rf4KX+BHbj1bLE0Iff73WtrH7ds98fn1CqDG8xtBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWOCw9PM; arc=none smtp.client-ip=209.85.210.172
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-842319576d5so2646767b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780945020; x=1781549820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhXTrIGzEozRTYZqrvuBs+osNbcorCKCcPcM0I49+xk=;
        b=RWOCw9PMyf2fTpkNnfFyd7t9MtV1t0B8XBlBx4F0mBFY4EIC61n5Niu6dHqvep+qFJ
         zgFANamEuV+RrdRLwP9kzX/1oiCiWSw6Pd7jMPdjckZ0CKCFY2JydUoaPaHbPyjtQRPr
         NHTsALLCfm0IP8G7Ui+S3hOS6UOzq7qHWwYlXccjPHcdVqd1t3mWvn3yKdBMb+e/uu36
         rw467FC9n0fr0wgYTkSmc7LngSzuxLM9SMyHarZYiJex5xGWRe9VhRz/4cqKB0ZGLjfE
         1CrDZl3HZvcVtMbQoKURlpYVecIx7Uo/HPsr4vlOnIdVlIEcY0MbLDxoqcCukOXOZ5mL
         Ko/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780945020; x=1781549820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KhXTrIGzEozRTYZqrvuBs+osNbcorCKCcPcM0I49+xk=;
        b=O6dKjZ3YwZFKG5lqmBS15Jh3Q6PJpbmhzXG2q2UZgSKOAxg95EqeUZBC7yQBg7uCFE
         C8WriwC7Z6Z8a96ENVzUQXuOD+Bl3MJL4XLzARz4bzpE76Uo6GH4mq480KhJWNGkhVcE
         wt/BgsVo7FlT6JQ62+uHaTit9rEUJ7pN8N+yQW0+TfrrlsKbSTrbKNtDXdOdojCJfApe
         +0H6XWK3s+v2CPt2JzbXnT/tZDrNgYBv2LGHIAduOBctPyJjkdHE0afxsYRYqU2DYyb2
         ZzGS66DMdD6lNMCwdC8aAitTCp8PTOwSt/qxD62GwHubi47z8YLDSBr97agekOBs4qB6
         Zc4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+txLkFLoPuHGt2G/yJRtIsl0DMXBV6EX+LypO3Ohzvw6d+7QuNMTNUAuQBOMNn1o9LRy0GFV8SfJYgznlS@vger.kernel.org
X-Gm-Message-State: AOJu0YzYbp+kCdTa+8TxX8iUSHiBMgU/+lhO7ffOeckjEKUPNxAF4mbm
	BrtyKxL/EnRVgkmZhhbDmZmI7Jq0D/bJG4eMGTW7NFl9BuoVUJYEA7Uh
X-Gm-Gg: Acq92OGGgn+oDjpntKw8f1bPTYGiS7P09rSAok6IwSjv8r8WdSWavMVKQBu0edrj6B/
	mpwAxCdk71lX5hW+HeXutsiQXYu75943KB7VagYssfi9AnLJR4MuJvIOgeuB9HwziE8jAilEGt+
	RNBhDwFnb4ZLUflvowtTSr2iVX30M0B8VZXKuueVgTVWS2PMqdrWh2TK4xvLC84DPdmptyA1S78
	kMh7RxYNHx9uBGzU6HKSJxRGZpws7LyPCZMELuAXyG1u8+O0WC6BNWQ4tkY08VYeAsQHHpRh/ei
	T1wgi0aUmGDbZbYgjn7DZ6PZiaRk/zIw9tkUk+1ludVhbptK453ra4THtFvDqvS54w5fo87IGIF
	hTVpdQ4/D5i9MNXR8yF2xoGUUm3hl8NGDoP4KvnWNUbJSIbk9nGTxrawVds8d1Y+Yqr/P/K7xeg
	B0jf/xy8obGrPIEk0G29xDIv47GF57CcZRbwYLUX92ya5qTwhM0m/jyCAM4w==
X-Received: by 2002:a05:6a00:94d6:b0:835:366f:5da2 with SMTP id d2e1a72fcca58-842b1051617mr15667359b3a.37.1780945019804;
        Mon, 08 Jun 2026 11:56:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm19476589b3a.59.2026.06.08.11.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 11:56:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 8 Jun 2026 11:56:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210
 watchdog
Message-ID: <31356c7a-6028-4901-a98b-5cb375d7742d@roeck-us.net>
References: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-111959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kathiravan.thirumoorthy@oss.qualcomm.com,m:wim@linux-watchdog.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_rjendra@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DC3C659ECB

On Mon, May 11, 2026 at 04:19:13PM +0530, Kathiravan Thirumoorthy wrote:
> Document the watchdog device found on the Qualcomm IPQ5210 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter

