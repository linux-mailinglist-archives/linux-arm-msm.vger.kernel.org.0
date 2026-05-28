Return-Path: <linux-arm-msm+bounces-110124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLaZJutHGGr2iQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:49:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B590D5F2FF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FD18309133C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573D73F6C5A;
	Thu, 28 May 2026 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBr0uz1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928E3E00AE;
	Thu, 28 May 2026 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975834; cv=none; b=RhR8PBnkHbClE7HbNpTSyYKajasrtufXLDOYKFcu+ozuK8p7stqQWQdkxyih8D+hlj5hW/18c12xRGZ++xd3D2abQSzK6NQxVaYDauBAGeiCfEpz62X0RvbPPYVUEfgmtOm10Z07Bo1UaPzVyaEz5r/YUFg2tlCiAbAYRjX1eWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975834; c=relaxed/simple;
	bh=B9knKPDls7lXRzyYof36NmOAnIwrn9ZAQB+O892r8x0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r0GUOXUQm6l89eR1sL0xymvY8a2fNtac6RgunloAwaaQLB5g81KtBEKmqQBU49H9xJCg84V0iJ7gspbiHwNXAjutUtUSojrLzZFhTd3Yswd4gSkiaqk6pEkLEuZm39IajKRZG2XBtl7v6EP+Vqv7IYhAj97iar/eW7808cBOJlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBr0uz1J; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779975833; x=1811511833;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=B9knKPDls7lXRzyYof36NmOAnIwrn9ZAQB+O892r8x0=;
  b=VBr0uz1JSTO9mhlhYHqtNgjY5NjMePl6saABpCL5CxP/5XbkYP+nCDvo
   bSGtj/ETrrgUFdM2UTdPeTcDKVATVbdmshWcFpem/Aei1qDI2QZU81N+M
   r7yPXWINUkRA98PdPBv0VcNTNd6FfjrBIhJzqTOlSFKWbrEU33LbR37nd
   k36KZeCwOZVMPI5PjTE9gbyln/OuJmZXEczEzLeHnycKbbR/bu2UOej7Q
   WgxuVHfD2qcDK+2w2V9q0T9i3Q6z+lKWGbr8l/VSNEhE3CqxfSe0MfFuh
   rMudhQM0hJwLDBYQTs5N9qX0jl1taKK9dO5UlOykGV8tqm0FNIeoyr9tX
   w==;
X-CSE-ConnectionGUID: zCNesBORRHWh4EjhWCG7Rw==
X-CSE-MsgGUID: +jRH6ry5TpyrJnxxx5YH5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80878456"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80878456"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 06:43:52 -0700
X-CSE-ConnectionGUID: sLktg+TUTmWQiwwiBF8fYQ==
X-CSE-MsgGUID: IMb3xBN/SfC6lzLUChwI7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="266454894"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 06:43:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 16:43:40 +0300 (EEST)
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
cc: airlied@gmail.com, andersson@kernel.org, bentiss@kernel.org, 
    conor+dt@kernel.org, davem@davemloft.net, devicetree@vger.kernel.org, 
    dianders@chromium.org, dri-devel@lists.freedesktop.org, 
    Hans de Goede <hansg@kernel.org>, herbert@gondor.apana.org.au, 
    jesszhan0024@gmail.com, jikos@kernel.org, konradybcio@kernel.org, 
    krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
    linux-crypto@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, luzmaximilian@gmail.com, 
    maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
    neil.armstrong@linaro.org, platform-driver-x86@vger.kernel.org, 
    robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v2 3/7] platform/surface: SAM: Add support for Surface
 Pro 12in
In-Reply-To: <20260528133353.33312-1-harrison.vanderbyl@gmail.com>
Message-ID: <6d8be28e-1723-d529-103b-a4ba09277b41@linux.intel.com>
References: <6808166a-423c-c801-497a-ed95cccc8d0c@linux.intel.com> <20260528133353.33312-1-harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1771673666-1779975820=:1291"
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,davemloft.net,vger.kernel.org,chromium.org,lists.freedesktop.org,gondor.apana.org.au,linux.intel.com,linaro.org,ffwll.ch,suse.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	TAGGED_FROM(0.00)[bounces-110124-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux.intel.com:mid]
X-Rspamd-Queue-Id: B590D5F2FF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1771673666-1779975820=:1291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 28 May 2026, Harrison Vanderbyl wrote:

> On Thu, 28 May 2026, Ilpo J=C3=A4rvinen wrote:
> > Could you please confirm this penstash is correct (sam vs kip)?
> >
> > Sashiko suggested it might be wrong but take it's report with a grain o=
f
> > salt, it's AI after all and sometimes seems to extrapolate about HW to =
a
> > sibling HW without any real knowledge:
>=20
> Sam is correct here, unlike the surface pro 11,=20
> The pen stash is on the reverse of the screen,
> not on the detachable keyboard.
>=20
> An image of the pen stash in use is available here:
> https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/B04-Surface-P=
ro-12-inch-1Ed-Family-Rear?wid=3D1200&hei=3D900&qlt=3D90&bgc=3DF2F2F2F2&fmt=
=3Djpg
>=20
> When using the above config,
> pen stash events can be seen with evtest.

Thanks for confirming (not a big surprise AI couldn't know the spec but=20
it was worth checking if it would have been because of copy-paste).

I've applied this patch 3 now to the review-ilpo-next branch.

--=20
 i.

--8323328-1771673666-1779975820=:1291--

