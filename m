Return-Path: <linux-arm-msm+bounces-118556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F3QrHN5/U2qvbQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:51:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CE0744885
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 13:51:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=quora.org header.s=google header.b=URUmaZ9U;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118556-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118556-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 215683003815
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 11:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F003A4F4A;
	Sun, 12 Jul 2026 11:51:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0422571DA
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:51:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857116; cv=pass; b=GAYCrDtZXoAY/9vrigvCYFvz0Kmyy5T65jPpiUzl/uxcoFZhyCWnzJqM5v6xIlpQjiU1Mm9HaQgWq0QMJAfwhq6BY0TrobDrX6OJRP0eUG8255SAdxSttSIohJCCDRTjOyoIeVcdD2Xn0c6JN+gclWfhceH4ZdrHgUiYyTL6LHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857116; c=relaxed/simple;
	bh=Vq61pPu6R8RhFxhzO6MCMoN7B8JnjWnfrnKR8iKrLVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+1Ux35GZGQCYOjkZ3k9TJ/PslodU4DpjI3Q06W19kjvub1gCkZeJypF1dZdIUm0v5ATSjqoAdzzCQCFeHvkhUc2hxp759kG7rl0FRaHI9KBZPPla0rHkt5dCyFtE3cBedUMu1ggZ7v4CY5/H/ufVp4XIcWZYA7SUTd5wyqTDng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=URUmaZ9U; arc=pass smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8484a0b998fso3474660b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783857114; cv=none;
        d=google.com; s=arc-20260327;
        b=S9MJ2lKqotyzo9se7czKcZ3PMXUZTFwNX34rLfIRiBCgXCjKuxldK2FGkyOMdeEpBB
         bzygSqM8zHmoFsGm7r/SFea8FPfUeyGJOHBJgxOiVm/H0yioz0WAQV83Vjh5XFhjz9Uw
         /OtECHGc8Vw8MBMO4ig1/niaXui8UBBIcycG+d65ZG5KSFufog4rJvrC6IiAJjoJlwhn
         FDFO+v1CuzPsO45JnFRxU1tyy4MZcxYMNIYjahkxpnaYWbt2yvoVlZKTwpjlUUkYTNe4
         zdRpIecubY3byZwi++dq5lUAhpqGZfd+Rln32tIadTpkuaOUrHte3S1a9FxM1ew80unn
         OnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        fh=o8coPEgr2O3YHGeexMXOP466MnEE5d4s7/q3yzTYErI=;
        b=iAK3EGxqcwewYBOX68rAglEh9VNXQpUifUFCabnAfNyJnaOKITBXuma/69AYFUrk/1
         31l92bTASVHUwG6LXMhS9D/WR0/RNGCNcgslUKdXffNNV2S4jHCBjk78OPURHYgaqV27
         fEYRRJS/UJNwIhHu/Z2mc23fOUnl9IuKIrx4/jnFQkG/hVCsWUd7kxO+mI9eafOCnwx/
         Qj6zj/S8Nuq61lmMq6Opy8qFt3YdKJUF34TEKrKfh6dxMcSPPN1pd1LtDMp9CozhxjoE
         4FpdnJszykL2Vr96SawemD8cEKvax1d7AVDI/TtWoEKHOGomEu0O6FcdrRfXErIL5wZs
         QdOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1783857114; x=1784461914; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        b=URUmaZ9UW7ebsoLPmv2ZwO+NMA/F/cdUeLiUqXEHvG7svopSwPCAh2vYO8eKQx9+Uq
         qIHblZvsk0rX4E3NZ5TVXxD941gvWnFAmHodF0VYobDRHdLxLkftPV4gzn1z/DEbX8la
         WR0e3xpTmTybNyRCJN6NPBqgRiYhey1vgPKa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857114; x=1784461914;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsQpUC4iSbhz2nXUUh9/l1xqUNQEcKgCsyiqdbNE7Cc=;
        b=FtKVbQb2f7zT5ydWkf+BwGQfW+WrS5/xByAt4nLtVNb4F1gl6eFtMYcMVrl+bJOJno
         Y2kEy4Lf4Y/KlA+QaW1Oy11hPZTwydATkl+uu+ChAh/xpAglfDuUk/8nEJ5rBEyfqBBn
         LF1jnAO1GStFMFJTwA8RcUrAdZt9NK29QgVEjgh920yKhu2fWOa31LAdkej3IVyLGFwF
         Ep1fN1teugerMuFioEQQaFJPQRJmVWlzOoBQ5Ta1caOsePodvp69mpJ/2DSSNpjD7eB5
         +3UGZxALNcYthfiJZsR0SwJXVzrsqp82CilEOmEhtIrztS7s1eZBMYU6QYMiDWbS626/
         +6oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0p9Ko7140yzqZFRAI7dKK00S8l1mSlqP5q4NjK0tWe8J+q8JPMOja13X35FIbNqm76uoy9BhjJN0JKmF9@vger.kernel.org
X-Gm-Message-State: AOJu0YxXm8E6d/V7UXA+o5PVwiCf6AFoxHyI32H0KbWyfpybWVK0+h/c
	ZQGA0dZ8l+UWIbaUWOcW2rt/yp4gpYDDyz/5oKtZswRXUZVY26XY8F+DHTw0qap//0WvJfd89Tq
	SgkHH6ekYVpIMzzJ5cwgqfWtMZTXcp4jaiWwPsiNGIw==
X-Gm-Gg: AfdE7cniJTYjjOdqxGXzw6AvU6hdbuvO+S4icCoFpRQkTtLS8KMZn9STee5QdIMB4D7
	+toy/6bV+KC3G0/WPlKwD7J97nr36CyyHTXgDS1DAA9ZMytsZYdXb+pyoPHPVo6mRbIJbBCeefu
	U/SG6dpq4PZonBAPfuAOYQzjkNLMeXFWAyx4v05jRAe6PiiBaDuoMnbj/TeUrWyhCs4J5x3/2kC
	QwE5SPCin29nAolfQcJQkH1wmg4fngG3JRtbORG31tmivYKt9CwF2LBdYfu3v/W1xdQjifeXspF
	q6fsnbNPvnpS637jAFe2p9e05BA5LLf2CDnufxuDU9Ol43sjazjPIyT0z1HihB28vy+NiWCnQT0
	jodQ3J25k1q2Dl6MPByHRYKDnTfh+xTT6PwgIhw9x6CRuEnE/lHBESgA0vlmZUDOGiNtrIGM0wG
	Lh7pvC8hJMdHNuzWaCf7BE25IyMsYNiMfbyn6TK4oZCMqrnBaqltTedEXLkOy3W/k/FCxyllk=
X-Received: by 2002:a05:6a00:c88:b0:848:2f77:e2dd with SMTP id
 d2e1a72fcca58-848897a7553mr5221254b3a.70.1783857114306; Sun, 12 Jul 2026
 04:51:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 12 Jul 2026 19:51:43 +0800
X-Gm-Features: AVVi8CfIxi4WIpFkevKCP00_7Hn3fE6sIEYaOzLrzMtk6xLs3rWmXH2GtZ7E-hM
Message-ID: <CAMVG2stqOscN2CB5Uq4qVvb3vXOze35-JzqH4GpS8z4R2dr+Mw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] : media: iris: Migrate iommus to iris sub nodes
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[quora.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118556-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[quora.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F3CE0744885

On Thu, 9 Jul 2026 at 20:35, Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
> VPU hardwares have a limitation where VPU streams are associated with
> dedicated addressable address range, as illustrated below
...
> Mapping a stream outside its expected range can cause unintended
> behavior, including device crashes, as reported at:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
...
> To address this limitation, the subset of stream/s are now represented as
> sub nodes, so that they can be associated to the respective addressable
> range.

Amazing work Vikash and team! This patch series applied on 7.2-rc2
resolves spontaneous rebooting with parallel streams eg when opening
https://ui.com in one or more browser tabs, resolving this platform
usability blocker. As such, this is absolutely relevant for -stable.

Tested-by: Daniel J Blueman <daniel@quora.org>

Thanks again,
  Dan
-- 
Daniel J Blueman

