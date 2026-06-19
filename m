Return-Path: <linux-arm-msm+bounces-113871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOl1LfiMNWr1zQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:39:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B7C6A768C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 20:39:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CFHPlhpo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113871-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113871-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E01C30068DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 18:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062E734040C;
	Fri, 19 Jun 2026 18:39:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A42341AC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 18:39:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781894388; cv=pass; b=Z71owdgzfVS5bVAIvwROJuaVBPYpHP2Mht+LcgvvIC14BYMhTwUEWPF+gr2+pbJTXmvR5EO4H17tUh6/xaZQR/yVSOlsesUa80kputlWJ7cHAGjvOASwSIl36kJ+F6/u0IVEbko1SHHD1Dby9SOq5pOM/hvjrgGUOr1OqR5xbsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781894388; c=relaxed/simple;
	bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6mwPpNdMJD0/uyGTt7D382UzRL07Fg9As942d0OyAE0lFM4wc6hYDRGFQ6JqnHN51znpuYRC3d0HqgSa3Kq5iGHt/pCzt4kzVLKoVykUa8PaR1iVeGIV0WZm4vqXU1/9oY/9i1iSCCm8ICH9udZIQ9eLYYIYuVwbdVVhVWPMqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFHPlhpo; arc=pass smtp.client-ip=209.85.208.182
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39677242021so26688831fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 11:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781894385; cv=none;
        d=google.com; s=arc-20240605;
        b=F1UKQ9Wf/RudmQx0shg+TiovNqDgrhXPJL9+uxJi7MJ1EK0biUjRo2V3q2KPH3mPip
         /aerwH/9DRe+1kf0YwsQIyGVV4y+DPll6yFWmASInSuZGgNKP51sCuWX3Ey6WAwJYBtH
         BD8TSK6iqL/o9qKyczxi/Y5iCHH5BUZELhxjnORcE8sywb9SVx7Yi4paumE6qjTWzq61
         L6qc8IFf4oNNd3RgPxr4u384Q+f+I6SxtHYKVwJ5Qk/XD/rPUqFiKoKs2wY3jG+ChxhC
         xxtHI8Gs7qKV0y0o4X3qtI/c7+tZZz9mTU5Xxq1VIUMmijB4L4wfbsWOZ8jkQ7XR4hkm
         QFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        fh=hs3g3yfw2E4dCcsfb6qSG7oDOJP2IawZabK1Sa0kyAE=;
        b=ZH25Zrah/FSFnK1f16is5jZcQFhLSV85xw87eoVrysPjH/SeBXgWMH1JZfI3Jkhyk5
         zOtgXTM31Wsl5ixMXAMK1q/mqHbxwH3qHQDB9J2nGxy66HWhrAuqaa3sTmQ+QsBoGEK1
         qOVO/OLh/yd0a2OR0zdlnWLgQLFLorPJ+kStuIOZAf1fbTwvckRp/gdL7c1OD6Z7wXbr
         65Z/UKTB5qM8M83vhLvvjIlO69YBJIx7SiUE+rFEQxQtbgA+cxVEOzsbtTD4PJKHsBRI
         e/EKHgGwg+8G/i4OR0wYm7OfI6f1eGlipW2ws3X6nZRQj0aF0PelsopMRzU5upnhJEuY
         FfGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781894385; x=1782499185; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=CFHPlhpoK1o+i3VsObZnYeAPath7Gn7rzq+B7Ur+Vg2r4ql414Et+n5F/cHUALd1Ww
         r7NhvTqVfH3CuMqfr4HYvPmPUIDawPbYx8dME8x7g5YBJAF6OHLSH/6WRVXeGhD6hp3t
         ra/luC5CHBdQ4vIbdyZJYo6KuOz2OeZTxqBdRvGZhEw4UZsxzSCp/ofwSzgJ1Q6PfE9k
         Imk7BoePOX/eWtMLxaeu3sPMPoGcchWHLBWYxuqelwYmgIZ6iELGw0wOskwH2vnJpgxx
         SSZJ9Gnas+Gq8BJ5BuXyVgIdCLOaU2mJywbSXrl+M3NgB/prb+/5ezORDgSx0fAEY+X+
         f6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781894385; x=1782499185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=oHd7P1yAmCVTX0HFmf63X8rvEtFMKeHmTP1SK5eUSx60+d68XMPNfPQO2zX+ZsqGDn
         pwBHZQcBsDjDX4OZvfiU8NbxiBQ3Qo44Gfb5XLbh/bxGhEOtd8cW1mTiiRbONp4awzjU
         AuFw/h0H0TyDkDLUwTqBlek/aPRyNYcSwykNhgvP9pyS4n4SawJXAbB30AgViGl9gtBD
         kiIQ7bKqa1qt2x5V7rM753aZzwDGNLWvjOKhp7KApn62ewgKKFsJFZeHF9b2tnGNoEv2
         DBa5vPQV/Hm6sjmnlFltEBRG6Lzh6GTGKIJAQj6j38GyG7R1jG0NN9K84VeWbZ4KJEud
         S0Vw==
X-Forwarded-Encrypted: i=1; AFNElJ/A/X7o3HbPtXqHQA1GTuTiqVsIIFFhg+wlMgqPILxSW69mmbPbgs/UGRJE/AL6WTrzO90Y9tKloVBaROh0@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsgG7+NsRNzFgDNnXkt8oGS3tRST8cvmhXNp7W/wPYrWaVhHP
	eMw92xCyFSTof8tCQmEmSH8e0TyUab0Rj9GhigXmmLM1xr+aCgbRrCshYIjtYG6WQFORYeZokIN
	w9EP4BeQ3yKSVT9kUQcnopiI3DFfxcY25F8pu2DcKivsg
X-Gm-Gg: AfdE7cmDZ05iXhYedNEUmeFTYWDcFJHVN3JWoky2wH6t4lGyj9CDYG7cVE9q3urg0EA
	EaVncIeV2zvdsdBeSaeOMTWmdNF+qejmhSBas8ttHkfOz7EA+orOhRypOIHsjUeJnxcIP9kli4a
	ZabLM2arnXzKlr+4pWHJODlGXe1NlOn1LJtMGTPWxiFrluOnC5ZdBoPVpW8o8XLVsKjY2bi+m/M
	pHY7qwWJIoscxY8aGEZKsHvg9PW9wLKcgV0oHmicU98IcJ/XwDl3AO+1UlOEKsoJRDRRUskEAJV
	m6egPPqZ
X-Received: by 2002:a05:6512:2c04:b0:5aa:7779:803b with SMTP id
 2adb3069b0e04-5ad5627b383mr1490706e87.5.1781894384458; Fri, 19 Jun 2026
 11:39:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603195142.2189386-1-dbgh9129@gmail.com>
In-Reply-To: <20260603195142.2189386-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 19 Jun 2026 14:39:33 -0400
X-Gm-Features: AVVi8Cfiwwl8mEN3E3SQ88x5utayZx3_Rw_a-AtNERdcfPbetJlN_gm0OG7DevI
Message-ID: <CACrCO_U-ZVzMAxekDWaL-8Ps++qBLcFLenPA97eJfZajEyz7xw@mail.gmail.com>
Subject: Re: [PATCH v1] bus: mhi: ep: Fix device refcount leak on create failure
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Akhil Vinod <akhil.vinod@oss.qualcomm.com>, 
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-113871-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:kees@kernel.org,m:akhil.vinod@oss.qualcomm.com,m:sumit.kumar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:abarnas@google.com,m:u.kleine-koenig@baylibre.com,m:mhi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34B7C6A768C

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

