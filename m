Return-Path: <linux-arm-msm+bounces-100035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJB4LfPMxGnb3wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 07:06:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96032F91D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 07:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C2CE30416CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 06:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80EF83AEF4F;
	Thu, 26 Mar 2026 06:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBvfFiws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609173AE6E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774505112; cv=none; b=T5dKYOKME8kuPUIVRXHwQIkuG83yUUxt2wvaWZLCO4X5cNWKrECm+oi+bzaRL993unPPDqxGom1cAjK4ofDX/pPKUvSIwyXqK8ov1LMIFvBeLWd6Gi50/Ojywdn0cuU/ThVLbFteEzPPxrrD1gCBMyK6r4YzfPJQVYNosbcNUvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774505112; c=relaxed/simple;
	bh=qNFpsTzbZWFFsE9iGPhAqreCH10Wgsp1S3A+JKsN4UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHiJyuCqUUbNg63b3GQVT4AxXzw3qH7z5dNqhM3P+jCstir5Wb86v3SQSmLptwYkYZVjHRe5GNdzXJxoi0Es1ag2NoZnfwdZNlq/vl+EPa24APX1F4cIqS820/E8SKpoLtG23fAgBaC3hGEtuBFUy/+v3dWMHqUCQNy2nX2M/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBvfFiws; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7358a7a8d1so462537a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774505111; x=1775109911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=gBvfFiws1D7nrr0969LU2ttOkRDtgN0BXXAg7NjMb1jnWTiv7SwpdNrVptgI4QHkeh
         fgXQGXYgQVfLMCCRhsLdAiuvxtTmShQcFv4+owmBUkMnsEGItbmc/mkaquLahDJRLVxr
         dtoMNXsr2B0gDHbUDBbfUDN0mpW1+EbSMOwz0IPY4uxEoOT6VfbhS2r2Q2oP5QuTjy/d
         mwCqrhgFCg/bEpBlYpQqBqIQodsTnZk26HO+gvj4rpKqSanmg8wWJI0Dm9xL0I+hnkEd
         VL2NVdMiPuNiK87ljI1RcbEaJLQP9eBZf8G1Ly5ndrbLtjw0cEY8D9fwsXlwrGHEF861
         atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774505111; x=1775109911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slX6PVa4cy3hgS68Dza9/DJkjU5Sh4E3O/3Ms43H/6g=;
        b=s4K3a96mxmwWXMDkAbTfxZ34VI+qGVObVdgwZQIioAi8RJjuzkWNf46xRyc76GAGB7
         Cst/88ZXKboCkul5ze/b3e3Dtc6z3PPAgfQJ2h2qWgDGk+n22+sQLixLUtGqdUBGIpKy
         NLjdCNY/v+3Cx4fx77ygbHqT8OmseBxO7B8KXRgDaIDx3S9P8D71c3q2thq8NyzHowkL
         iAbWTxg19vLL9N2joshzmzpBc2g/B9WZHkV1UpW44vPObGRlr+Vn2VWhRFTy474R5aK0
         h1yEPL7YTylDtGrLcQpr9dudSbffvjdmvcrkHhBmVlK7Og9FV2AOmK4smT+eSd7bvTM5
         pVBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVO+u+abhmHLJ5zxgAZe5wx6cJb0NV2POQfpvPbooUhFoJzHHEt22oRH5x/MHcL5o99xYZ4ya3Gh0XMH2Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLYuo2t/9w6e8SszPOm2vFfOppUlQiQLHPTcQIDpQQOLGdJEB
	KexACSLQWh3JLn9Gd1K94SCmVekKM3KmPN/LcGwMe71DF34RDPmVQAZe
X-Gm-Gg: ATEYQzzdsRzuzO0We9P5LoOEpYwXdSqgRZm/2n6QAFgIEHYjYmmPkkezfAY73cYrrqL
	ACjfRwcIu9l066UF7d71Cu+FxHKrVmVNu5MKLLpdmV+jV1m9YlzZpCGYvdKKZJOFtTLWB+3JGql
	IAW250fcb/wLumutKhS1ACTvtPddK1TGPDPSOOSKugRuea6ycrpQcsmWFiUWlgBBQPHHtrrJ6L/
	yfyqFX6FamDnrF1n5uiAyYcx8pOyypcoaaLek/M3IRxcRVpBfmTHJ7vWBLWd/HSztvdo1InpADz
	rYTTXyr0HhWB4snzxnsYs/iOqAJsjonrwSopIqtP4cltQhB1uNdjPDpA21rZtoIDwH46qC/mgAe
	WTIr6QAZOWIAqGrptLF9n2mrnA2jVYvjULWgQgQnR7rXlHXORyLLBYiELh2VtPqlpKOtaxrCwto
	+OJJXTBdt13B5E0WOmVnW4
X-Received: by 2002:a17:903:2f4f:b0:2b0:41eb:165e with SMTP id d9443c01a7336-2b0b0ac5e1cmr75649075ad.38.1774505110564;
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
Received: from ArchLinux ([43.226.30.138])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b0bc7afad1sm21051385ad.31.2026.03.25.23.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 23:05:10 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Sean Young <sean@mess.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Thu, 26 Mar 2026 06:03:58 +0000
Message-ID: <20260326060402.16021-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acRdOmHKQmBp-RSd@gofer.mess.org>
References: 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht,intel.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-100035-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathbappai@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:email]
X-Rspamd-Queue-Id: 1A96032F91D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 22:10:02 +0000 Sean Young <sean@mess.org> wrote:

> On Wed, Mar 25, 2026 at 06:07:23PM +0000, Biswapriyo Nath wrote:
> > This patch series add support for various components in Xiaomi Redmi
> > Note 8.
> > 
> > Most notably:
> > - IR transmitter
> 
> For the IR stuff:
> 
> Signed-off-by: Sean Young <sean@mess.org>

Hi, thank you for the review. Could you please add the trailer to the
specific patch. Otherwise, b4 adds the trailer to all patches. Also,
do you mean Reviewed-by or Acked-by tag instead of SoB?

Thanks.

