Return-Path: <linux-arm-msm+bounces-108642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Nh9ENtxDWpUxgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:33:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8BF589D6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 111FF3183D2A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 08:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A5C3AD53D;
	Wed, 20 May 2026 08:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sc2iZRXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F127C3AD503
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265214; cv=pass; b=uFUMQeOXVJ2AfN6Py8tl8f3zL/CgI4olOR3b28mKVsDmk7LdI8wq1P/CsPsuGk1hTb+pu+UF0p/z2HAiI13qcunPieolTKm81a5ms1k/9xdR1yUVIrkMI4ok58NLX3SYprIVibvrt33qReX1SqmAWyn2oEL0lNNV5OsbdW7/6JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265214; c=relaxed/simple;
	bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eohL32NTGHlrHlrufllSFlLDoCxlzgXUd8pirmcB2tgjhkAOK6qRZQw3SBWXfUkHmRJe6K7J0IKy2efgVj+77Ae1skt2aS/IHoZZ2VrovYc3UlyUHtx/QrBAE/OZ+wXyDCZ0b+1kaT6wpcJ/o3uAlWRkGoYEYzmaDlq5Q/Vjdlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sc2iZRXU; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c3ea2ebf7so5265743d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 01:20:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779265212; cv=none;
        d=google.com; s=arc-20240605;
        b=kzRCZlk9D21NwlncYLaepI8ADmpDvVObFOq9yngHLx6Yr7jMGnaLO0HhU0KlOJE38Q
         dt2KuVQ9wZmejXPuCGI0GZ39t6kF4wzk02CPOfzUDNbESJspNDZ3RKQ2vJ6NnIzHTob2
         KVwHKUy8M39UObTla0N6ELXtTT6QmI5XeEVEUxgJ13ZlmMpepfm4W3+PfyMyIIy5lcq4
         /JjhlUkBsM2b7bj+DW4nTSbPPf9f5gSvQjQUnfgFZHAi6PmobTEbH9HX8fqnEpMytJpo
         wbfHePQVuYrf/imWk4l4KV2Caoq1XdHfapekOs3nwzvN6V5Rd1UQgMuvHG4TLY7I19Q0
         lFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
        fh=FSKP5xk8Lk/YbQjGFIhAmyw4DA8z6nBbw0shGunqlMs=;
        b=lpHeEzhnFucoZtAHCJ3rD4ypMZoPRcvzdgf+GkVtcYsaEdgJlHLsddidOsmtcgce0D
         2BIpRKJ+FyQ2VIUxHz3/oZghFRXe/Q+1W5OhUxxa3ltYaXvrYBEe+CN8TzLcqHGthKM1
         DhuhxXwrlwQZTG9qXoCuLWsyQAoS6gFaEZYpCO31xQacdLcWomh+KixKEQcHAOam3z3w
         xtOawcX1kt7n6QV/SVItoW9tvUsu104WpRcDwyRq7C+bsUgrSWkBV/ZDf1iIvMS1bGOG
         GvmctEt4sUXRXDK/cxlmQ5G5vLURER5j94k9UWGY2K3P4GZVyq2J8yfW3ioLHSpeoBlA
         qfkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779265212; x=1779870012; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
        b=sc2iZRXUGF0QEh1Sbs2tp3AkCuds54mVp1EKF/lp9Cx86SpUoOV2CXO/r2h7pMYMM2
         VOLEJZINFzL6fSXqe41bdTUii6IEuu4li2WtCaQGASM8UuJryqRtBrirad73wJrmXVyO
         QtW0pXSQliWAeKOGGr1MDZNoqxPaNGecPZygGIIBkSyGQw8RDvrEXMY20hobmPsi2qY/
         0bvAbeXiI8Wbado3kzv31+jCJCnMg/E/Lx/lsa0FYLv0HHqu5VL5fsknqLHTUbok+9xn
         iTeTQMv/l+SNOPFiuEcPKobdh86kn9m9iI/INzUQxE6eBovCK5qqayfIJTt0sWks3TpX
         TBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265212; x=1779870012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OU37kWHpKnGebk33oJbZblP3VQCf6KgSSBs2dqQgkHI=;
        b=Cc2bDBC1u8FuUynuo6cwlBVfYC0NRjGBfqmPAcVkNqB4HpTZ8TC2vLQ66IhbpoHJhu
         I9tbpfgKweBqMDSDnZg5yQA/IEuVd0cpdLmWUWKznp3JAX6MZFtupzvv8A3TgYMDBMq8
         86/pDWyqd5g0cQMJFcxi+ZwbZjFWEsp4YHuygdPLSOhOmpBak1uXhy3fElyG2URIzVNC
         FeSrLwtJGqf4tlC5AKlhLCT/SMxEdGZtBLlViLmRcSfNM4+Mo+nbYWUYSWowY/jSOR/x
         u+SMq+mmyh8rM5FI9GsFVOwwhXT3OBIMCP9+o4mHZHQaJQZNXO8UAM2hANhkM7isJ+To
         u0wg==
X-Forwarded-Encrypted: i=1; AFNElJ9tex+EVCysr3oz66DFkf7EJQ4di4O4Yy6tyHdWZ2/+S6G1dCZKaYc0iot/6Ehs6R1hYwcNoXXJdVTrnyh7@vger.kernel.org
X-Gm-Message-State: AOJu0YxLuoT/LpXidGJeD51gK9mWM+DV42BEX+++8ln4LDm3YfU92A5D
	6Q6ZKVLKsooYGJ3FmtZJSoZ4c2ig3uv3F6zeyzcwgtOFKdSHLxD+FoG0Mgk0/iFFcRaWBxxL75/
	aTmgHM8MiS76YjvfbNbSy9iQE0Qpnz2Q=
X-Gm-Gg: Acq92OHhDLkwxnF4W+H6+UjeRSG7d5Hl8IJOjt2Gt6igl6gUjNaiHmNAf+usrBYXV2R
	VItlSXTys2CVEy+SMPiQMuZxYuJksyMFEXWqaIqCktdbhJFTzkQ+T9jMWoiMDz22kZFg6oJwrrb
	lK20z80Ah4QKxwTo6K/fay+3WmV+xW5LHd8YlNPwn18ev5rhTflIiduaX53MAFBgladZxitEYQS
	UY/FC/begLE071u90fYcIzF0vC0LZ7MZy1k6YpJhGaL1hLHGPUNO2aJZfh77xkW8upHVzmx7r7G
	Jmn7QVB6
X-Received: by 2002:a05:690e:151b:b0:652:53cc:dfb3 with SMTP id
 956f58d0204a3-65e228513e5mr20681922d50.52.1779265211742; Wed, 20 May 2026
 01:20:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xMdPPQAJ2BbtNwnxmf1CN7FGbdhSJM7NIXkRCxzFvXv0g01tuvNPvAacsFJaDyBc3cIkIAEfi44ewZ3OGGAcDg==@protonmail.internalid>
 <20260519090819.1041314-1-lgs201920130244@gmail.com> <8787ea87-aa75-4fb5-a729-cd2b54d2ff8a@kernel.org>
 <ihn1XgQJPFsYvuTtWPxpZWwaQBVXHDmJ6Kp6i4DmDowTcRQITZXJlaVsbtkW-bpWydiYGAyyh6c9QLs4Nsn6lA==@protonmail.internalid>
 <CANUHTR9g6vRkKfPeHBQ4_9YR-sZQ_UZBX3+8CiKPYp-XPcp1CQ@mail.gmail.com>
 <d7082ea8-3b3d-468d-ba27-4d3ba5103a3a@kernel.org> <ZdheLnLujnIRGAGLFiz1lwSwxaUCArec6sbk_VkixDGjsuPYnMT4_YCSMTbwBWI5-b62G90Qia9lQ90pyFvjBA==@protonmail.internalid>
 <CANUHTR99NHPRP3ooEXEBHf4Fksy0B96vdoV3=mzoMBawVgek+w@mail.gmail.com>
 <cfb76181-4d59-43b3-a45b-a344a71fdfbf@kernel.org> <CANUHTR9OX4KC6djn=wdkwAhiB0zqFEHFu3jtJ-+LdixgbB-OUw@mail.gmail.com>
 <28fac01c-2b52-47a7-9fb2-3b0f27d7e855@kernel.org>
In-Reply-To: <28fac01c-2b52-47a7-9fb2-3b0f27d7e855@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 20 May 2026 16:19:57 +0800
X-Gm-Features: AVHnY4JFYhDcboZ-txiN2rLdRZAg_DabCsavN5a2uQWoMBdLRxWXAdOi4lGbTvY
Message-ID: <CANUHTR-Ct2+3Q6DMVaOMn7bLYhEDUaF8s0Q_MHuQk5TnhXsZcQ@mail.gmail.com>
Subject: Re: [PATCH] media: venus: venc: avoid double free on video register failure
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108642-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: AF8BF589D6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans,


On Wed, 20 May 2026 at 14:10, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
>
> In patchwork I'm rejecting all your patches that change drivers to 'fix' this.
>
Thanks for the clarification, and thanks for rejecting those driver-specific
patches in patchwork.

> I'm looking forward to a patch fixing it properly in v4l2-dev.c.
>
> It's a real issue, but this shouldn't be done in drivers.
>

I agree that this should be fixed properly in v4l2-dev.c instead. I will
look into the __video_register_device() error path and try to prepare a
proper core fix.

Thanks,
Guangshuo

