Return-Path: <linux-arm-msm+bounces-112498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HmgiHyxtKWqtWgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:57:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66766A012
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=IpY+qJTh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112498-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112498-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA7E4305FE30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DBF3FFAA8;
	Wed, 10 Jun 2026 13:54:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7133E1716
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:54:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781099698; cv=none; b=plqJj51bftngaRMgsdEquYqgb8BoPoVXYSN4JzETTiJTbD14JSuaQOjc/XEmz/I6Xh6Bfadu/pkekYZ+csKoA/6aEMy5ScdoRIfYwAmuxPsR0/ZGbnaO6ihWSAEP3dCKNTzS6Wxiti6N+NlYMxa0T29l8zrXxqp275mzd8Jmafw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781099698; c=relaxed/simple;
	bh=nPc7AzhItTqk4bLFJr6RbsgJt5JDwnD68y0mSQc8P9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i45BPRt8kniLQS2iknZkz80zmVbTA374zd8bRgDE3Q99Is8a8jMCvAqsIcOofHsq3DY3aKuqXJFCWbSjogBDWxHoPZXTrpxYHvmS/1f+3KhNAeUV/nA5CMRHsE4WCMSajz2pPV1EIqF4ip5SCPzGj0ucED3QukzmI3KZWhfwewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpY+qJTh; arc=none smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3405870f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781099695; x=1781704495; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=;
        b=IpY+qJThfWXaFqmNeRC927cnh8tv8qdQjgcFujMbVA73Ou7CXXYJL8TxbV+zLF5gtB
         C2vLYi9u725R/DHg43F68IJN4Pl2LPSNNkmb5lmfjApgcRLscghFXF2UZLOJ6nuWwesp
         MmyO7qSlXr2gN5lZESkEV1nM/TEbDuOL22l3n6eRVjNxlygfrQDg6iFH8peEaTUSuXyB
         QG5te0qr1KSY2WruOFyn5UYgM4ln8qNa+pJwbSW5CgJ6qeDKUN2lf7bl0Ox6cXb+Jev3
         0vb03QfPtBONlALEHxo0L3Y0f0Udj2aXTErqxe/0AoISkklhoiUbODdqmXlLNAapHxec
         1gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781099695; x=1781704495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m05e8ZK6LdKO8zCgzV0KxhPr/bGmY3Qs5lVi4T+Cols=;
        b=Ji8yXQCPg/zpssXQGTJq6aYqf2R4PVUHgHZnzJd54eolgWVdq51zyXzrcc6PguBGgy
         s+i6kjzrFE2l1eky84GkgJNsnQXo4MdfzNXQBAmQRe43EKubh7Nbn0vDlgSJpsII8bdW
         ZRmnrgk3tM3zknE7fjjG9C/935edWpHnMvx+ulQ+H7YrKNLoQfC43+HIKAAWjr0lMxGe
         vBQunNHFAwuBnoAiKO5AmLyUPnJQTZwGp+KDnlujqcVYbSond61szrIgPIAqSibu8qo9
         yZNsOwRVK3rL0lEmPvpxCwekrqbNeT1h1c+KL8SmtH55njBaC4VzCkCMXXs1QEV9UoRN
         zDeA==
X-Forwarded-Encrypted: i=1; AFNElJ9O/U/8FXpYpTYOKN/r1UuF2cWsoDaM4vW3NSgldWXVjqgHJVixHEJ86FfIczQgk/uvnaNZvgqbPS8yWSR+@vger.kernel.org
X-Gm-Message-State: AOJu0YzKKX5T/jKnan+YEq8VNqYZ0KWNxBZvnuO/t1HxNDxnmdc00FQo
	IEQWWTMe6TDY2bbTPilxsB8dbN+Tm6s32+cZCk8UG+Md7P8Y35VLXXF+7J6M6fshEbQ=
X-Gm-Gg: Acq92OE2t0kMNF2oHfwgaTW0uixxuhcJfCz+xKdJuSvvIkj3vvpfIKd7f/B486LfJ/z
	nE/KpFmMvw7eE7AAJIIZzS+iK7/i/AWsAYbRam0fZwhoieAY5Q0wt1cjK53478MuPyLsqSbm1e4
	4C22HFa704Jo2dTqfS4GYhipMhGgEYnSG0tS6wdkjgA6v5GXL5yzqRkSKqNOICk78zatQxZarxB
	heGPqu2TiNjSEwIvveU6jYjSgUK37YPhpB8/02PLXOjKXycAvH8CyB+fMSye6T6+BIn6vOAnuDD
	MJLVoHpqKKtuCG9uNQ+atcUy4152yzzhSxG+nOak3U/gL+hhMj0+nroKwuqh5M3tfzLoX1WRSUM
	WncYgn/OpYf7j4/4AuocFHR+Cb6TRV5WVhsyed30n7QOlwIJKto5A1euDdbYzeV48ZdzJt1IeWR
	qLX6NuTFqG2NjwBrhzlLSYDV0LUwtCJiGGUeJNwwDA7wIdyDyLrlbxOUnR7g==
X-Received: by 2002:a5d:6910:0:b0:45e:f073:d2fd with SMTP id ffacd0b85a97d-460302ec5b8mr28252555f8f.9.1781099695344;
        Wed, 10 Jun 2026 06:54:55 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4441:7c57:ff85:2733:9342])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm73006149f8f.2.2026.06.10.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 06:54:54 -0700 (PDT)
Date: Wed, 10 Jun 2026 15:54:43 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] clk: qcom: Add sane defaults and drop defconfig
Message-ID: <ailso2RrnKPUtwhI@linaro.org>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-112498-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB66766A012

On Tue, Jun 09, 2026 at 05:32:34PM +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Significant rework:
> - Add more commits, also for arm32 drivers
> - Split defconfig changes to separate commits, so clock can still go
>   this cycle and defconfig later. Also, less conflicts.
> - Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
> - Dropped most review tags, due to changes.
> 
> We should not be really asking whether to enable clock controller
> drivers. This is obvious choice.
> 
> And if it does not seem obvious, then consider [1].
> 
> [1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/
> 
> If the approach is fine, I will do similarly with inteconnect and
> pinctrl (and maybe others).
> 

Perhaps we could add some option that disables the defaults for users
who need to compile a minimal kernel for space-constrained systems? All
the clock drivers combined can take up quite a bit of space because of
all the clock definitions (a quick test suggests 2.6 MiB on ARM64 for
all gcc-*.o), which can be already quite problematic e.g. for MDM*/SDX*
systems with sometimes only 256 MiB RAM or less.

The defaults applied in this patch set can be individually disabled, but
this becomes quite a mess when you really just want to have a minimal
configuration for a single SoC. Whenever a new SoC is added, you need to
go through all the menus and disable all the new options that were
added because they are going to be enabled by default.

This could be easily solved with an additional option, e.g.

config ARCH_QCOM_DEFAULT
	bool "Select important Qualcomm SoC drivers by default"
	default ARCH_QCOM

config ..._GCC_...
	default ARCH_QCOM_DEFAULT

Then you just need to disable that one option once, and all future new
options won't get enabled by default. The media subsystem has something
similar (MEDIA_SUBDRV_AUTOSELECT).

Thanks,
Stephan

