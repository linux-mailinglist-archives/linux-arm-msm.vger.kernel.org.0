Return-Path: <linux-arm-msm+bounces-81199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03246C4CC8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D7C189A2E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CEA2FDC41;
	Tue, 11 Nov 2025 09:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OvU9fWSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E6A2FB0AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 09:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854856; cv=none; b=S798oYL5Pb3G+4TKnrqz63/5X/eWk6ckrXNZ5OHsEkxjL070GjGYCXKSwsZUri1WkL27LtzeV6DqGP+ndDf2iXu1kA7fJs8YKLW84VbLGWO8tf6mPENdII8JD7s4e/z+/wNISFysF/C2b3oQnGo1rmHKqdi6hQNxdJdorab7/kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854856; c=relaxed/simple;
	bh=NmRrZd84HeJfVx5ulbp94fMcHAZINk/9ovlAxd4Q0nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWTOI4FZPGSRc3osBbi+++hbO+aGIAm9vgH1Sw/PcSoH46+dmQFkNvwRrF/HCDdO9y1aHg3y1a0wb0ayJIbT+NSFi0tI2Zjx/MdjrYSRCWvJeGPZFvUkA8nzx380kjC7ATv5Ujo9kcCsnpKnbDZ6GKf7SpdXdP87ysevqW0lYSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OvU9fWSG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477549b3082so35126005e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 01:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762854852; x=1763459652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1RcLpKAgVroVokPJ6qJZ8mFHk6ZFFVxhlD+S4Jv219I=;
        b=OvU9fWSGPM2xDQ8BNPYyQ4X8z/zuENPNx5/sJJv6aEIk+lQL+DEiTQj03RPS559a7H
         AqgY4dyY8GqdWZea6SvOQApjo6wwgoXqTouqB87E8ZdyI0ZfDXi2E+YMj1G8CpQEuAvr
         QIjBRpBfAQrCqEaLKY22ypGGoKLkkkXYaxppE7RW9uSqt1Rqu50iAzCFq84TSW+M9ifO
         +XKMDKVUfVKJRVKxSNM7Ydmc/MSOh2zR1o09OYfRPIZPYMpVci/SVlf7a72NSFri2bMc
         ydS3eirwYKAZZ77fiSj5a+n0qaYb6KvgYqKSPwrneMkpc5+aAQ2KqdonBsXZm2MRBHXT
         k97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854852; x=1763459652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RcLpKAgVroVokPJ6qJZ8mFHk6ZFFVxhlD+S4Jv219I=;
        b=Zsg9Re+K46YmrefUO+dpq7Kx4eOnuaUfcO6WDeFgfxkV87IiMxF5oSyy8cNGRbN2aO
         Wh0ZALSMS78mopZL9Bv1kNFAPyufXuKxbbzZht7DzQHhl79FxRZkKb5bzmr9vbCZDhDm
         k0DsbFVV2gD1kUm+goQnCV20Hst0OEwH6FzNe3g4gWdut1ZkxOm0yEHTiZDLVVEZVuxn
         sJ2f1Hm8t8kipEKIQWHtAozDQLMk7lws0bNLOYRi8C93YtfArNwopfUx7t8QVwNLBfyH
         IGcsb3fq6ZsBewEpW6LhAnBrnvQvmJUC+TqJzjehp8qveuNINxMT8gvi45470DqaKxVy
         4nAg==
X-Forwarded-Encrypted: i=1; AJvYcCXmvMpPp64vCZFoY9NejpDaKGrccyOBRZJzRsQnOdv6vjbEsLTw50oulzqGv+dIJJWEJ5v+EGA5KhNIHW3f@vger.kernel.org
X-Gm-Message-State: AOJu0YxjxlvfDX0Eq96TY3oVZzF/TakfuSc+527bEGnT7yyP7cQFP+UR
	A2BtXJGAI9VoX7NbYXMo9b+L1zF3NGxXnhHeE7VCgL1+fWqoy9S1u12n17aS532FsiQ=
X-Gm-Gg: ASbGncs5yIKf9b0i9SAmMqVnrwe+AbSK8N9PQLSJkmqd41qIdKyEqVIilSaavRgtejO
	9oxfRdQ9DkjaDwwLrR5b58ZJRa3bSRDMxGdcp7/tmKB+jVHO23fCrDO7tlwAMD6wbh+Qc7dEz1E
	INBGX/vQTNcyNm5WPLG+7fJJA4rn0bYy7A+Y9jnRt4eAkJ0DgdAlmU2Y6BoJUpExRTqi58JNzsX
	LBbyudzToBAb1HVm3igrw6fi9//4Kwb58QarEsGjH2Kl+qNo0LhcuMNIA7Kz5+HdcOxuKWrwUPV
	mn7P5l1SWM236sx7FnKXmG1WZdiTO0sOhrKQGMgSS5LMCTldE+/d9JjhpxkRB0TrBkehVvR2SAC
	6+3EpBIzSvCFF7k9kK6M9UVWm3xksyv7LoEAyHCB2k4TrsuCXqpIU7wtYNgRIHxFScfxCvDqTrS
	Gbb9sGlznJWFrW+ivWW+KAhDpDoWeqA5kmXw==
X-Google-Smtp-Source: AGHT+IFL9npt8OanU5c12NGRVwnOxSJ1VHU8qFzZB0+lZ0yamOH0/N3ycPmTghVrBE6IWk6zyD+evw==
X-Received: by 2002:a05:600c:4512:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4777327cb82mr105157595e9.21.1762854852310;
        Tue, 11 Nov 2025 01:54:12 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:b142:7c48:bde4:7b24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bccd35asm242845145e9.1.2025.11.11.01.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:54:11 -0800 (PST)
Date: Tue, 11 Nov 2025 10:54:06 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
	wse@tuxedocomputers.com, cs@tuxedo.de
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add device tree for TUXEDO
 Elite 14 Gen1
Message-ID: <aRMHvhf77BgRvuAp@linaro.org>
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-7-ggo@tuxedocomputers.com>
 <aRHre28Nbyv6ShbU@linaro.org>
 <r76wptwknylaxlkwmdkd4pinrzufnjiujrutj2q32lgt75x7ti@zibmax5uhwp5>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r76wptwknylaxlkwmdkd4pinrzufnjiujrutj2q32lgt75x7ti@zibmax5uhwp5>

On Mon, Nov 10, 2025 at 10:11:12PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 02:41:15PM +0100, Stephan Gerhold wrote:
> > On Wed, Nov 05, 2025 at 04:41:06PM +0100, Georg Gottleuber wrote:
> > > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> [..]
> > > +x1e80100-tuxedo-elite-14-gen1-el2-dtbs	:=  x1e80100-tuxedo-elite-14-gen1.dtb x1-el2.dtbo
> > > +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-tuxedo-elite-14-gen1.dtb
> > 
> > Please also add x1e80100-tuxedo-elite-14-gen1-el2.dtb here (similar to
> > the other lines), so that the EL2/KVM-specific DTB is automatically
> > built and included in the installed DTBs.
> > 
> 
> Please confirm that this works before adding it.
> 

Yes, I tested it on the TUXEDO laptop a few weeks ago and it works fine.

In general, I don't think we need to ask everyone submitting new X1E DTs
to test the -el2.dtb separately - the hardware/firmware situation is
similar enough on all the laptops that chances are very high that it
will just work. There are not much device-specific aspects involved.

Thanks,
Stephan

