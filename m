Return-Path: <linux-arm-msm+bounces-112842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zhePJhaIK2qj/AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 33146676917
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 06:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="X9k/kSie";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112842-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112842-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 984273016CC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 04:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211EB2874E3;
	Fri, 12 Jun 2026 04:16:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEE92580F2
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 04:16:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781237779; cv=none; b=L7cvvEW8qJb1INGOJcjpPVSqvBdkW4aZios7R7vDzMaTFAj63VJeKdm/28flV5t2VrlK+Qk9eaSR/rrxSfD8OdpUhE6bpsZvIEHIzsMabig/clKyWpuJNScvgFKZGSR5Fk5lIGl37t68cmt2nFs5K6rIaSmVF/RtOkdT6PmXUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781237779; c=relaxed/simple;
	bh=S45NGb5nHnP1iFpxpFlQ0YTorvzPHiJtJltQczKK3kI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYyyiLuqKv5w8hLNAddvhxRAWinxtuJlMowmc2TFjKJFQNNaDvtGKtrTw41Aa7pwyCSa4IP77y2W5t3K3afbByar/tgrsrgBzWq3EiohiB92x9aw7VbkAf/h9ciMLyeaR59+1lOa0kBCXgRM6I/QMkVRLdSGzISti4TVbfnS4aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X9k/kSie; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf125989f2so4337075ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 21:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781237777; x=1781842577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tzOTMyOpfLnyNK+VGAde0WzU286Gd6+LpsOa0E/ts9o=;
        b=X9k/kSiezeARoKznaBGdd38vBsfyKloyopiJmHJ5dUxcfSHfvsQoxSELmmzj66bgLE
         LKleYIKPwF53ZVKx0IMjqTz9GdJZhC/DdY+PWucioiNisbqQnLH3vhhooOj8AOxtKEw3
         yWzGpzz8VaceEj0LFEvE6dGPOo1ruH1fncfxp2TDFiL9PQvBWCOqSbpjX6LNShs1K223
         gSSaZypcDchsr3JCW8tts4WZYrJ59Wdn1FOlgJt5mkYDqnkfWtattK+o6E0JLfvh2tBQ
         wCMoG/0gks9jz7jM5JVq/xC38oJ67BBqXrqE0swgbSm2mpL4d+1DJ8QXe3YaspYY4Q8Z
         4A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781237777; x=1781842577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzOTMyOpfLnyNK+VGAde0WzU286Gd6+LpsOa0E/ts9o=;
        b=M/4ae37a+dbx6LxaVDA/BqsEwje6XWNBj+ZvQBYlAl9L3OSnzyMZv3Y4vQjTv6BJjr
         FuW7gEEvmzWJjw0supTYR3qVRMquhden7h5phXeEkiWFpLQv78sua+4shgYYYOZJkOYy
         wkkx7S5j6tvQ/F7HvJgcDfAtgG7dmyTDxWMsLZJ+rbauOvVowqAywQqu8jGJP0PrX0a9
         U+NH/i71PRupHNcBCaP+d9Iy+QTXPqPyv2GCUpQh0C1C4FVO0QMGEsJneaJVNqTX2vI3
         X6XgkES3eYgKGCegmoN3+lBawqfMuvBCjP59AjqsOS+hMWI1D407qH3p9DIU7Fx6GPif
         +o2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+nvbRwB9vaTt2pd7uy7xJE9clCw5GjzYtBHMXu+Uw+t/jjQdNsjD4Zv5JiNjeGW1A+MjEuZUoNtAYAnB1c@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHtNoCHVjebq+Bpd9G7YS0o1nhMlix0C4QGwN4/FuIR7eEerJ
	YlwuIsNHjcD1fOI/VJ4ydNXkkf0mcuITqH6tzw9SHTkXFxsTq7HC4yIm
X-Gm-Gg: Acq92OHMEXwfqWdGJVbhvMbftde4K4/2vxJt5s11NL/5/ZJKDgIlA+wbQJfff21FcZz
	sFZw1hKbRJd4ySexWY2sjnTjCORYANnr9ETtg/FuVf3hUcOc4sctl9UX5CNQzz+TL0HSBL14dul
	dGfBWvRUJB5d/n0u0tOsVauAe0X+sZsVGKvZs0H/vovk64EsqbMYDul4IALVd5/75tsGSRF+n7X
	3HUrUwSpbUAd1xdH9nKc5PrI9IoauQm9DjuvUpQQRC0ToKeSd0p1D7n2KWR+1omzPLBo9qn9NrI
	FUfJ8V9IPs/z4f6RZwVHy/bClMa/YvfDjI0u4earXjOeriNippxrfPUn8193YR/+jYDjvyB4EQQ
	fts16HNbIIDlkxMUs+kRQB4irM/PDReZwzSwwZuX2NmEnPI/eNvSyN+GBAs0JnCVdJlTAtbxgXy
	O375Fdi9JbJy/1PJuMrfNC6WjvZNFPetHwZGA+4nlcG3M=
X-Received: by 2002:a17:903:247:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c413dbb942mr14852495ad.31.1781237777134;
        Thu, 11 Jun 2026 21:16:17 -0700 (PDT)
Received: from page.local ([2402:a00:163:2ce9:95bf:5776:9b95:85ee])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm5089475ad.6.2026.06.11.21.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 21:16:16 -0700 (PDT)
Date: Fri, 12 Jun 2026 09:46:10 +0530
From: Ajit Singh <blfizzyy@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
Message-ID: <aiuGjH4qeOIXXgqq@page.local>
References: <20260607113658.25117-1-blfizzyy@gmail.com>
 <20260607113658.25117-4-blfizzyy@gmail.com>
 <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <39228ace-9404-4ade-bcb1-28e763548b7f@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blfizzyy@gmail.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33146676917

On Wed, Jun 10, 2026 at 02:58:19PM +0530, Konrad Dybcio wrote:
> On 6/7/26 1:36 PM, Ajit Singh wrote:
> > Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> > QCS6490 SoC.
> > 
> > This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> > support along with regulators.
> > 
> > The UFS ICE block is kept disabled because enabling it currently causes
> > an SError during qcom_ice_create() on this board. UFS works without ICE.
> > 
> > Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> > ---
> 
> [...]
> 
> > +		vreg_l12c_1p8: ldo12 {
> > +			regulator-name = "vreg_l12c_1p8";
> > +			regulator-min-microvolt = <1800000>;
> > +			regulator-max-microvolt = <2000000>;
> > +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> > +
> > +			/*
> > +			 * VREG_L12C_1P8 supplies the Ampak WLAN/BT module
> > +			 * VDDIO and the external 32.768 kHz oscillator.
> > +			 */
> 
> Sorry for the long review timelines on the previous patch, many of us
> were out for conferences..
> 
> Is the oscillator used for that WLAN module? Would you ideally like to
> be able to turn it on/off?

yes, oscillator is used for WLAN modules. Oscillator is powered from the same
VREG_L12C rail as WLAN VDDIO, so there is no separate regulator control to put
in pwrseq. So I think this will work fine?

> 
> Perhaps you could get that with a simple pwrseq driver (+Bartosz)
> 
> Konrad

