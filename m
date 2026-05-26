Return-Path: <linux-arm-msm+bounces-109907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJOkAnPbFWpzdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:42:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9018F5DADAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C9A83006507
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD7E413259;
	Tue, 26 May 2026 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS0VpoCP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6896F3DA7E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 17:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779817240; cv=pass; b=dkYXQU0XzoimBaAmnn8I/kAnkP0fE7eLavx2G6fz6d13dvp/MjQPUZP5odEvzkjMyPeqlUqq+7Ygrtj/TkBZU8hIUF2Sq+YHq/O/EMDxMemLagYakw6bvvFROGOWx/F9juLqMfAN1spxlD8X+Ao0cPJ8QAn9n/B4ednuJc9U7N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779817240; c=relaxed/simple;
	bh=udZh3A65xP+wRx38KDX318h/gMFA7EGwPUP/dtqNFGI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RPpnQ8ccgmD0fE+yLqEBoKu58bAo96C4xGgPfDNWgmK27gGsOQd3huYRHkXY6ZHWYjL1MW2rJ49RuO9p+5e7rej6mgRteznPKpNcJB5ccx1JJW/Gm1WE8XbNM63TjVtZZQfS6lOtswpA2Oax3nDfnUl5nnEA7HnhPJMMSo48kxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS0VpoCP; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dd73b7c757so5015425a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779817238; cv=none;
        d=google.com; s=arc-20240605;
        b=dWGT9LQlJJfKCoBCgV+Eea5ybkEEsvf+3aSsOW296UfQcDJZZp3jfiMHS0o8ft6bPE
         tCJidjYV8o5yZi4CSmNiXEARSsBPFeUtOh/h7J/GupQOr4sATOmCppUfM0MPQoNBGYR3
         Bll26ki0646hyVr4Ldrk9nxSLho2ZXzpYjJTKLaInPDBSp32aoBB8iJzGIz3I3nqlzSt
         9IEwfHGzASBLEWZQZCY5uyMEZ1tKi/z0pAADuC/T/qbfwOAu42px0up+i6rAJmorFCdO
         73cKLqjfm82nRT5XzXT6gUrKdUA06ssl9pPu74QgD3k4u3WND+Y5AREUlQK+7XPv7v3k
         jinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1zVWBLjX5wjr0s58XrPo52Toq3jsCtjGLn3p8NHm0zE=;
        fh=4DSx710/R75jCegsRZ6qHzUBAuib6L37GCW1qeOndFc=;
        b=dFuggF5IIbQ4clcUDOq/bcY88xWftLeuPHA6LCFTtEFnkbyxp8MCvApnZlQAK9Ep8d
         C+Wm6yDCKVK/qZw20NH1TfmbiGAqWrQat/6HJH2XyZ8Ztm6BjN5tbi/qWehm819tvCWv
         koVD2gFaSB5ZnF/90RuaUmc7QuSigNCVgv2ZklDlN06tw/cdsOiWA1GyXpGAVWDGjTUb
         Y0ICoW9f4TndAbuZPvL8zRzQ9jgJ08eptNf1KwHCLzjHkZdr91seGoYZA0l8RW9FsgqU
         tqM3NoWd64AOkrhWtWPSl1X9WQRzqAwNkFAtqsw5KujdTDZbBzk3O805mKe5fq4KKOPT
         YjmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779817238; x=1780422038; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1zVWBLjX5wjr0s58XrPo52Toq3jsCtjGLn3p8NHm0zE=;
        b=PS0VpoCPQPmRqQ8DQFZY/hX9tQZCjE2uN26yQRlFY+aIcqiXwFHFqWaH9EAbCWgnai
         A9m95d9UI/5ySLlBXk4S/wP0rSX/5J5OfDe8jeVy8Onaomx1VP4SAhURN5MFKvEJJndv
         UydhzFLYvwMjHw4F7eUduHY3QrGAsNvOG1WavChhtFj1hlv4eu5o5FCnfz5jPV10zWMA
         ROUBZfDEYbO5QGBTA/QEwnjGXGqg9B6m6pu9lsN6OiFhmKPBQjltg9eRENRgsE/y4xfU
         4QLzSfVy2lqpJyyW+LRM9ITwx9zVnVECneKGabrs/wKrrazdjeNhoqReZxYUMQQ9h3Uk
         ePMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779817238; x=1780422038;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zVWBLjX5wjr0s58XrPo52Toq3jsCtjGLn3p8NHm0zE=;
        b=Wv9coMktc84bIgCfBQpjFJo+oo90to21J4+zwirfcyddZLE6X2+buLcAsogmaxBqh+
         lj4q+6n5AqilPcjLJUbrNQG/QiWdvZWAxkbA/ZFGFTAKZD+QTEQpnN7FwvH+eunIPhnc
         yZ/miBANAzSiFmpz0BFPTMM70JRlZt0oSqkpIQgE99OPndHsLSnMJQf7OhYBcVIqnANT
         WjhWlcNodjDL4LlJia5/F1Pr9RWlCeRwbDTGSro2kiL8YK5cvbsyhqP8EGii/iNaQz60
         h++fyw7BRBGOpDBS9JTH2R+63K+YeESSyMm0T4wsNMvBW1aOOV9hUNX13t0PNmOAqy8Z
         75yQ==
X-Gm-Message-State: AOJu0YycWVnPPj9cV3cny7G3Rxees03TEV3Nap1pZp7MJaFYahjcYqPZ
	6rkxZ7ne0X8Ju+Peo7CDf9OBE6mRWXnDUyK5nwAkRhHStNiwEchbRGaax+bslD/wn7sLQbJkR24
	RL59meH7SZCOvitVRPqX4HE87HuuNTeP8lbleHOk=
X-Gm-Gg: Acq92OG+0ul4alZ0Ln/XKzckeK47tYLEARPF69Do1dsZDXKO7OU3pn2FuLfCUSg820u
	aPdJM5oFj1nvYJr7Mh+rv7c4mtac/A2MLY4xIk2WxS7FC4823KtBYO8c8ZGdwZOCPxA2PLsdA5V
	n9cORJzU/LRUY1c5PKEtOc3e+kkCsOe6XKXGN+Lt67KvWnSMT7fwrNVUSjMXY2JH1F0CC9MhNhl
	07xMfIteJELSAQVKTkWQ4hznZmr31Aj7iNZQcIHTOfs8w68SXec46FRzS+XxLQTCsoe+Fn/MvBo
	XU+TFxs=
X-Received: by 2002:a05:6820:824:b0:69b:8c61:796c with SMTP id
 006d021491bc7-69d7ecb7ad2mr10704402eaf.42.1779817238264; Tue, 26 May 2026
 10:40:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Angel Saucedo <anyeloxd13@gmail.com>
Date: Tue, 26 May 2026 11:43:30 -0600
X-Gm-Features: AVHnY4JORytsCrNFDVYc23h5q5F7AuJGPNwdLiQapf4ipv5tY28URvsWp3hyyW4
Message-ID: <CADi_M0x5BnGamkMZ4oZFZwj=m6Cw1s6vn74VqnSuk3nGqfhM_g@mail.gmail.com>
Subject: SM7225 (Snapdragon 750G) Mainline Bringup Status & Blockers -
 Motorola Kiev XT2113-3
To: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-109907-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anyeloxd13@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9018F5DADAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

I have been working on bringing up mainline Linux (kernel 7.0) on the
Motorola Kiev (Moto G 5G, SM7225). While basic boot, CPU (8 cores),
UART, and UFS storage are operational, the project is currently
blocked by two major issues.

Current repository: https://github.com/anyeloxd11/kiev-mainline.git


                                                          Key
Blockers:
1. USB (dwc3) Timeout:
The dwc3 controller times out (failed to enable ep0out) waiting for
utmi_clk. The QUSB2 PHY requires specific register overrides and LDOs
(LDO2/LDO3) to be set. However, forcing voltages on LDO2/LDO3 from the
DT causes the RPMh PMIC arbiter to abort  (error -131), crashing the
system.

2. Wi-Fi (ath10k_snoc) Crash:
The physical chip probes, but a fatal crash occurs during the WMI
handshake. The signed Motorola firmware (wlanmdsp.mbn) seems to depend
on the proprietary Android qcacld-3.0 implementation.

If anyone has experience with SM7225 clock/voltage sequencing in
mainline or firmware signatures on this target, any advice or pointers
would be highly appreciated.

This is my first time working on mobile SoC bringup, so some of my
assumptions or terminology might not be completely accurate.

Thanks, Angel Saucedo

