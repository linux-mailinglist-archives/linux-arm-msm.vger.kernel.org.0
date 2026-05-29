Return-Path: <linux-arm-msm+bounces-110326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0M8kLCPoGWpazwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 21:25:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B94EC607D0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 21:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E175030437B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DC43ACEEC;
	Fri, 29 May 2026 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIJs7jvy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519B43A7F79
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780082634; cv=pass; b=O21St4NX+k/gR1Ao7W+6vKjtH8kFwCP3svj/qeCv/gsaPxZJi6v/PgVVmQKzZU+bOyHFk/koeI9e11vlWxUn6sXQFPu0pzZdeKbQWGhTevdjGDGVS7Wg21Cfg5G/CHZwLHndERvIbr81Qn8rJlGIPrgcmQ2aeHPy7ckt7glu3N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780082634; c=relaxed/simple;
	bh=oxt8Q+W2WsDLa+wW/HdAmzz3vSh3SBOrxOS7ezVfgWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJVluJ1W9b1aZ5CNTqBu7egfnWKTr1vLba7C8EBGsbYqeaENxCN99qYYZRJy5O0gwEOc73mi7CqYP5JkMLOEmxLi0AimorLIG9dq7pqbqA5Qpjf7FlwH8loPEOkyZK80Sw1W98mMOJ7LzZ7M+KxubnAc3yoP2tselcZEbB2Qui8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bIJs7jvy; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-304d3d3d8f8so154974eec.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 12:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780082632; cv=none;
        d=google.com; s=arc-20240605;
        b=cdFVIMaBC/J0eShHAebFBSRNcgZDZ/us0byJaIrpU5N1uFUKQXiu0vkt7rI25K2g6D
         YvrpPXwov8+oodguppW3gtarUu8wap3prPLGrAUaD+dpuegO1AJTYU9g57I+p9T017C6
         hRSLvF5lXkhytOgmR/VEHaAHvpmR5IiRgQzq+UGnHjHPMit0p7vO6tvb/q03MP9IIyPH
         fvFZEtSFRJMTjFZ153F4ahmADAKQuwymtATtO87Tp5dnkDDHAWHeiLZdrLTUIfultWvn
         gy2keY/GfVaHiJgTCteAZJBm6kihy32dbc2DO1YyPk8Shqy1z97i2G96a7blvUobgcy2
         03ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oxt8Q+W2WsDLa+wW/HdAmzz3vSh3SBOrxOS7ezVfgWc=;
        fh=AsgPO8cLZih/ImmoWdwslICU9PAHOemp1RqelRcSuq4=;
        b=Ta+4jbwsQKfxq4ReSjAmYBdW/64YisqpQirEiWS5zUKJ52/RiVdz3mPSZp+pCr/pWP
         qzue5xGVt7PCEa4pUoFjR/JcINek2Cjrr+TOf6uzpJmKuyN3CgO6jI7YNTl8BlZMGgKJ
         KxtNJUvm4FaOBZ0DlgXfgTuaqRJ7BoM/3kzphXmq9PHu9+ItjY99GY6BXOUbh1u13ZPW
         spmQhSD+0GXfzpy+VKsjpR2nMpwjzmgFn5XjHKOS4CzXmpW8T/APid9NW2WHBg48e2fG
         5Wgfkq+Ns5RytJQAgFS2DRNN9RsH7PONd+JCPzlPFAsoE+cXNi9+r5eeOy7iDS/qTuSz
         njmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780082632; x=1780687432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxt8Q+W2WsDLa+wW/HdAmzz3vSh3SBOrxOS7ezVfgWc=;
        b=bIJs7jvy+SITLkKWxoW4D21D9hM8WH+hckPKqsrZ55c0yida+monRy2Ep76d4QDHqU
         rnNu494o3ZGrb7IL034ZvKkFsv5lLzKmIo5GjMv/UVAEY6zgA12YDIDKpb15pClSWJHY
         km8jatztw/IRpancTaYcgpmVGVWtLH4cg5ZssN0zEESPusv37Mz6Xn68EirBKJKmQAsJ
         idTfZ7LwQ7eZSjZ+l2SPYZt+3p8yhvNaPEiaj789P3+zPGD+m4OTnrsrZDcNUZr7GO//
         0EBbfLukPtJ1TEZCJ5fIyAijGQZlgdCcMfpvsqaKf6U24KL2XesQ6tanxn3XsWIz7E+L
         5igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780082632; x=1780687432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oxt8Q+W2WsDLa+wW/HdAmzz3vSh3SBOrxOS7ezVfgWc=;
        b=qhOeMM9xSbWJIIrYGOd/ypuUWvycJZHO2SqehCLnQQkfvuZ+roTSTFJmsahmzQJGaE
         NW1zw9e/3a4ElRsGVa7nkZGxC8piAJ8St5qmfB5sXypIvQNRMfGEV7R4TgM6CZKygHzd
         AZV1mCRTjHd9STK3lQcXR06FdGKmpEMZlEKhLWa+oQhyMM5rjpD+fgvbDVKLvxYzHOBr
         WHhwBIrhaA9iwLPqsMJgyFnJX0nEPSjkkcrQKM4+EnmXeCfwR52VWeSLiozLCo45kC9p
         SSMs5hKtCYrDNkY562Z5mNDHkGysDO9Foonn+f537l0VVC7WlhH3+sbFpFLKcZq5k1FS
         WWFA==
X-Forwarded-Encrypted: i=1; AFNElJ/Kxwtr66wJGzR1FIKjlimnF0jmGzShHoKzATUxLyNPA3+EJTsT2Pp8ZnodfZAcyd/K1q7f88AuP43Udry2@vger.kernel.org
X-Gm-Message-State: AOJu0YyEXX5jXszAQYY7VDXHvd1U91dJ3NkTpR8yKrp7M3e9xIwuMDsK
	/fgM89V5l0klVrSiCFYnUqtaeSdsqh4zSIxk7lklEHKkZsSEPHKvO0lFclV2LVpn+HGFo+bgCvs
	R7V2pn7gdbw9TCPzVWqGFWxN19MAjTEI=
X-Gm-Gg: Acq92OGet1RCZRyy0YnrYuf8q/MldzdA/7okjSZjPIB2hjLLEDlb5voTlc9W+w+2S6w
	XNVVeec9ZH5Z6pd+wZCN9z3LUy/gh53o/S8i+O/+P3mCl0jxSjawwJIEvndlly0exG95e7ncpXl
	NCUUAz/I4Av5GgI8NAgdTHWsQxWaaU0kt0ginJg/2deS/53zMWe/GUxUCB5flkGSEO0pclTcPrt
	lbkSCgjp1GxGMfLUKc1yOyu1mvVqJSdOnorcAv2s/mPLf4Bq0C+sPL/LFQCmM8hQJMxXiGYN4L5
	VaLl+YpGzRyPE/PFpbtATLUTW/6AP+iy3uXc0YFQYo2Rr7iSnL7mfz5jlpUfxglLruAQDareslR
	h+5JazY/GG851EwBY3wxpMR7kbJxp584l3Q==
X-Received: by 2002:a05:7300:fd02:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-304fa65935fmr269421eec.3.1780082632355; Fri, 29 May 2026
 12:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528194646.819809818@linuxfoundation.org> <20260529054139.120182-1-ojeda@kernel.org>
 <20260529185046.rc-reply-001@kernel.org>
In-Reply-To: <20260529185046.rc-reply-001@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 May 2026 21:23:39 +0200
X-Gm-Features: AVHnY4JA7t_ZnbW45aaa6F6ZMDmDXu8KTbZJaiGNMmTmWANvKuJkOpXJv3srhGY
Message-ID: <CANiq72k=M7bvd0ne8thLQFOOYACM5dRoDdNkTbeyTXaeL7qndw@mail.gmail.com>
Subject: Re: [PATCH 7.0 000/461] 7.0.11-rc1 review
To: Sasha Levin <sashal@kernel.org>
Cc: gregkh@linuxfoundation.org, achill@achill.org, akpm@linux-foundation.org, 
	broonie@kernel.org, conor@kernel.org, f.fainelli@gmail.com, 
	hargar@microsoft.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux@roeck-us.net, lkft-triage@lists.linaro.org, patches@kernelci.org, 
	patches@lists.linux.dev, pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, 
	sr@sladewatkins.com, stable@vger.kernel.org, sudipm.mukherjee@gmail.com, 
	torvalds@linux-foundation.org, Miguel Ojeda <ojeda@kernel.org>, 
	Daniel J Blueman <daniel@quora.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110326-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[linuxfoundation.org,achill.org,linux-foundation.org,kernel.org,gmail.com,microsoft.com,nvidia.com,vger.kernel.org,roeck-us.net,lists.linaro.org,kernelci.org,lists.linux.dev,nabladev.com,gmx.de,sladewatkins.com,quora.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B94EC607D0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 9:17=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Thanks Miguel!

You're welcome, happy it helped! :)

> Right. Rather than dropping the deadlock fix, I'm queuing the upstream
> follow-up 53676e4d44d6 ("drm/msm: Restore second parameter name in purge(=
) and
> evict()" for both 7.0 and 6.18.

Sounds good, thanks.

Cheers,
Miguel

