Return-Path: <linux-arm-msm+bounces-119054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jFatBDREVmoC2gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:14:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40ED7559E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:14:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=YHuft3dZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119054-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119054-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C27334A62F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810E047ECF7;
	Tue, 14 Jul 2026 14:06:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0947DD73
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 14:06:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038005; cv=none; b=TKS9yq7u8CQKZGTJHkW98Usd9c+q1dghs/CTmT/PWEUReSn16jTRQwjUe4RP1eFkivI1x3zqqFl64CKXMoMVKLEt1gRvd45Lfua7yEZAQcbJ8Hk2N6Be5RS20G5zOY/IWwUtmUcgetfB3y8LjiekErfrGxfStKRhe+k5JwtfJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038005; c=relaxed/simple;
	bh=fwB1KSWDgCjz736/QRS02PHr1umKh6szh5Kc6lKbPTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nKxPsR3Dk0L0lVHRzvZDhs1pgm9asqc2lvpzAyzR/hEvVI2tLGaAfqJgP+4N8Ff4heFp6mNEmqG+5RLj8rSdajU60LBk9/01cGLafjKeeiQMqA1St82kLATKJQQfzG1cEIEWYch5D+s9+OCQXUgM+e0qTJ36PS/msmsX3egyY4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YHuft3dZ; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccdf36f63dso135835ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 07:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784038003; x=1784642803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNvFdxUOXW/A4axtOAxmsZVOINdFqW5S4fBoLOQeKM0=;
        b=YHuft3dZUEBQSl1oI6oXTuULGBpzez3KKGERXiJ+93HPODeKbS6xbOWrzqpfLpFJWq
         lCKIgd6P1BsVW8f9wQMKTh0Ay6MRaS+c7yAfKUt4DDD4IojuRxMKuhGOy8mTZycpi6Sb
         YFxU2YSJaN7fO+3kYxNwCM7zLxSX6gCDPtZjvt4c6EeTI9D90cA/77dc5ba1yQG84RsX
         8RehSlTWJi493V3YkAaFNziahFYkW739M+GqDZLLGk7ZRlxx0B3tuT7mnQezr3+zky4n
         ERw0UntsRZzAm1c0ARgyskIRg8l/OjnN8sOkqy9cvMtQK3DtWTuXEgiCgKudHudJ26B6
         bxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784038003; x=1784642803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNvFdxUOXW/A4axtOAxmsZVOINdFqW5S4fBoLOQeKM0=;
        b=U6xQ+YMkXfVVB/UzauLtAo9i7y5sl0EO662b6SRYXt5uVmIULGTUsONtFZZ8oWyLvy
         uJHrMciPMuaO9TRRuyUpJ4hDjtx6GVSDIrM419FIJVzqsnhKH17ACFD2VZlzkOzEAW2v
         fpjogAjCr+Glz2JMwPdlbsfbL8S3AIMMiP0vJi5wCearDp0JzLYxOwJ9Ilx5yuYrj8EP
         UjRcYK6Prv4owErpZe/N+xIBylfyz5rI16Irelfbo4mYyTVaQtM31uBe2MrMtYM2mHtA
         eoLMUGN9I651G7pACv45fmUGvl44BsbK+dIiC08a653oD7k9Nfnah/aivPJ626VYCVqt
         wMAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqOekl/2dum2ccMY/Mc/3OGL4ZWezDiA3lmZvJOwtniCIKobcsFosQLORNRQrmYHT+I791LaM+0ukqQ+lsh@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHP7t5ZZteRuRhTXeM4tb9y1FljW1SCoZeoSAm4btNRory7rF
	u/ZnAqv9alWkQweQRfudLS+nu02ctH1zvLRt5sKyKxobtlarP2vXei++v20UGtg6tWVoZ7oAoWA
	TM7HGZA==
X-Gm-Gg: AfdE7cmi4VvtYR+Tp+4G8JKn+vU3aIy+6BkIJJRymyK9CVyV4aVthVYunrQSctET+z7
	oQb2Hxpe2lkVagnT5NAL3/oN7GEm+7KY0NqP5hZ51ss41GDLmLfvxILMokvp2xvJbxjccPE98gN
	PPwcGsQo1yGjLoVOv+fJ/XSp1VxIW/eiM+iQ1izziDD8BU2xmr1eu0FojGzDbFh/Q9qQlDglxVZ
	SlTP+Tczd7luNQA8ZWXVhmy79W2xy/XF0AKVRL/j1KEIjBe9rMKe9pfUyqLAc4swBnGu2GlhYSE
	aUxNB5QlQU+UK3s53d0BJU/hEY7lMwA5Ere9reqSpLntz4mKCmAWhs5X1FeRuylax2UEJCQNyGF
	nlS29vCkPthKI9JPLMG9lHDyH95O/67ElK4fjEg8Rr8f1pnvj9gIew9bvRma76LHR6YmxjN+WyQ
	+AR0e3UnkcI+U07jBKbam+hjk+dkkqCBR3f807K3omfABRgxw=
X-Received: by 2002:a17:902:d4cd:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2cee1663632mr5888285ad.4.1784038002901;
        Tue, 14 Jul 2026 07:06:42 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e16e1d010sm1598056a91.0.2026.07.14.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:06:42 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:06:36 +0000
From: Pranjal Shrivastava <praan@google.com>
To: weimin xiong <xiongwm2026@163.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 0/4] iommu: Fix device lookup lifetime and probe
 cleanup
Message-ID: <alZCbIIuawpugaQe@google.com>
References: <20260714060930.220277-1-xiongwm2026@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714060930.220277-1-xiongwm2026@163.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119054-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiongwm2026@163.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:benjamin.gaignard@collabora.com,m:robin.clark@oss.qualcomm.com,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A40ED7559E7

On Tue, Jul 14, 2026 at 02:09:26PM +0800, weimin xiong wrote:
> Fix a few IOMMU driver lifetime and error-path issues found while
> auditing fwnode-based device lookup and probe cleanup paths.
> 
> The first three patches avoid deriving driver private data after
> dropping the device reference returned by bus_find_device_by_fwnode().
> They also make the ARM SMMU v2 and VSI probe paths fail cleanly when the
> IOMMU lookup fails.

I'm not sure if that's really needed? All these drivers are doing is
dropping the "extra" refcount (incremented by calling find_device)  back
to the state *before* the fwnode function call. If you find that this
put_device caused the count to drop to 0, I believe that's the real
problem/bug. These fwnode functions are usually called in probe and the
refcount shouldn't be 0 inside probe.

Could you share your observation / failing logs where this fails? Maybe
something else is wrong with the system?

Thanks,
Praan

