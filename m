Return-Path: <linux-arm-msm+bounces-111228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yzBPCgCkIWrmKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:12:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B10E9641B99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 18:12:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="F/Ic9GRL";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D869A30022C4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 16:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0C6392C4B;
	Thu,  4 Jun 2026 16:04:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC453358B9
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 16:04:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780589094; cv=pass; b=Y0lMpK+CHF9e0369SncrS6lHx9QaUtdXp0pVXw1PikEbu2Pqebjs/dFzTcMqgTsfYFm/pqHYRAhddbtWRzxNlt6WtNijgo8HowiP+iFQlAWnk+4ZVq0LdlzXg/YTFDlYZ6+xGNtI14Wm7R52Kqgd8rsYNhJ37mgEHqHien1jXlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780589094; c=relaxed/simple;
	bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=P/xBBMAKZigGyBOrzlcSMeK8aO7YKYL79fY/T+nq+3KEwk8BHhAF+g8CUn+ruTxzS7miv2mlAEhyJUUaxI6Ze7CA6EYCAvIGRFPe1R6H3ImLdW3F3MuYZgxWO/yVDUir2CmRZZIJaE1lKteORfLmJB/RHC0Vhfc3lT2FzY5bnDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/Ic9GRL; arc=pass smtp.client-ip=209.85.222.54
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-96395a59ff6so339509241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780589092; cv=none;
        d=google.com; s=arc-20240605;
        b=Ls4R8n8CSARognCohU+7xG6NK4/OMIeXtuoH760rmJAvtxU+nLh1DuvtstYgGKg4VT
         aM7pgsaIyVDW07ipX6fvZJqjZ80KEa81rbrtz9Fg3MyIXLv8PMnWLq8mIVN0KESo/t1F
         vd3wZoIS3yuy/Rz8CmT5QWNz9D6mPvQHxiR10AeMzY8qfC8BKzBBk0dndX5mP7bWrX6p
         S8zyuJsnf97wBj1oBQP0qQYZZvTaFCc28O0rEjVvAAAE0PJyHJIccudx256NGsBdvLJQ
         mJGrzC3pqavX7JPrYBtlGE5DpyigAE1uVKSaSEzXbOB0p126xWhKXQ0xjF7AYi0TKfSN
         IP/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        fh=2cSXzbAG8KSgQGzO73gFfKsJodXbMcIAfG4RAMmrbdA=;
        b=GuYxQNrH3ya3nfOl28sGOfFlsJBTk0HMOghhfMxeoEZmoyaRqmrfZ3OkCRBICfhFah
         yQr68mKUiNJi8vpzEskqyZnyJLLgImq7aiIkqeMXUtFISYGunoZwPpDcIlhabIhsuiyp
         jab14mAcVg9/iqnUlgzDv24JLIr2x6FGMXiGy7UcwNHtrWuqjBiXV5SVORAbDUOVufnu
         QT/4ZC2pW0xZGaAzOMkj+l6JXsXmuFYuMyzTw6OrBRUJwUzj3D9A4anQh+42qlH/5Lhu
         Vz3WhEfZ2ynCWjo0+FWhvWaCWr3LCrRUvXTv48UeUgz+QP+im4tpE9tEYXI/eYmVnhLP
         zX0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780589092; x=1781193892; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        b=F/Ic9GRLw2ZiDd2BfCsHySJk5k3UegqtdFo4nB0vXjEFjTYFUk8bh2AAjTVYmSdfNV
         tHDXq3oix4wQtkVokOtmjsnb5uuDvZUGfr/Z7ERS3sRfKb0jYZk49LS9xT4m9UU0tL0H
         M7KFgvg3YM5WVKthS78b8O5iSpu4PBsOfcLShNEvAjp07ruXgIhYsl6s6wGsWGry9A/g
         P4dBaQ0iUuC1MMgodcYBFnmnaocFJPrritWvDWBWEiqSKERWLAt9iF3gOpz1k4c959FV
         4WRC1xwWJfbxpR/HwBw6tDMVuZTK2WV3X2M/GV1bbOq7xlW4+kwj/i1CE+WcoMdEWlxA
         CrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589092; x=1781193892;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruf7zIoOv3SUomYRTm6IZBJjqUF3kMs9qPFBCiopdGE=;
        b=s53WDOGyPVl6kFrsk0i5zM+OxwV1laqJAZnC5Gp7rzHhI0C4yhXOswyY5X8nK4H2O6
         nAwwRZJAglK821hG9t6liK15PBd9hKgCeD36AAu7d5R41EXZ5YWnvbNot/8gOG3+mch+
         bm2qupDTo50Ed5j5t3PSDEliqZjfZMe/oo1Rk+ouP9XmMF8xR4AP+h8kvZqbbZd8yRWr
         abAEyVp37KSg2bFkENJ4tJL5d+RnjC9NUGDnrDg9dx+A+6H8fPx8aLG9Fezld17RkEzJ
         VCjRefNfxymuoR9AiGoawTni1Heg0Z9vEXV/exPvHbXULA4XLR1J6gNi+qCV7hxKmkUY
         xhvw==
X-Forwarded-Encrypted: i=1; AFNElJ8AJao8QPR7Q9FEOjWwrNzxbduTVv7HelYHaoXovA/fA2i9TwHPQiKrLWBBy+OTqt8Whu/g4soIc/uX5w0N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6VkzFpzCSoXKWIaCynD5PiO7uOmn3m5B15V9SqOuJ84StTUci
	49LurWeij3sf/Ju2KjVUK9QSo908p/fVxnQccHNLHdP5jv82pC96YH/tcxZzl6UOeB7nlbJaaAx
	YLtKFMCf7pn/fMoV9GQX6coA+w4Ig/3A=
X-Gm-Gg: Acq92OFPM89zqMmjFEhiT40syVR8F5AOpaLhDBZ6TNaTeqhh87Uq/HdqUcdiS8l5WJ5
	ocMWNAuRB4fIrbhF2WjfYqRbVvJfGvwt4mS6wTLuOSv31n8ZjH5GKDh2XZP3TX6yiG5c6tGUH0o
	5BJh7aWIKmp4KH3g2nS3IaZ7uyxl2INup6YY3IdP3y6wSlBwSNW95+lgE4R5TcUnmDsa7BHkNcX
	GcSF3Sl2c53zAmLBs0mBw9J4Pokj/RBlfMDRLqY7zB3IfhF9LlSUl3bb57CQV2a7Rww1l/jb7g6
	jAtcZDdLRqYmQeyrng0=
X-Received: by 2002:a05:6122:829f:b0:575:44b3:300d with SMTP id
 71dfb90a1353d-5a6e8b0d0f6mr4956435e0c.10.1780589091435; Thu, 04 Jun 2026
 09:04:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 4 Jun 2026 19:04:39 +0300
X-Gm-Features: AVVi8CeP15rSUsk1XI2OXrVWneBp1BIu7jE_glXWnX0Ij_ztSucqY3e24-FT7Rs
Message-ID: <CAHuF_ZpTvYmARzx2_be1foM6XUVCdE0bNmb+YcHkH7tFhrYF8w@mail.gmail.com>
Subject: Old patch version was applied accidently
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-111228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B10E9641B99

Hello, an old version of a patch I sent was applied, presumably since the patch
series title changed between versions (learned for next time).
Can the newest version be picked up?
The patch that was picked up:
https://lore.kernel.org/all/20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com/
The up to date patch:
https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
The difference is only in the name of the compatible (O to zero), and
the updated
compatible in the driver is already applied in next.
I don't want a release to come out with a wrong compatible.

Thanks, Yedaya

