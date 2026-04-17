Return-Path: <linux-arm-msm+bounces-103526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKqHDmEm4mnt2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:24:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C1F41B2FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 14:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D60F6302CE0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 12:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C5C373C04;
	Fri, 17 Apr 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/2hXFtf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8418233970F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428637; cv=pass; b=fbolYSHucaIU17YjNl31bY2wN7S7UiuBi9T8lKHJPRoK8dQpxwInfW6FR2AT6bKRtMKrrOZrRWv8ARz0u37mD3QHtRVlCqv/PWqWcdmaBowgvlio2y9rksKrh4kC7jpcC5fRum297GplBGUgUTCEBlOLG8FhPsEDmrOZCTqNlks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428637; c=relaxed/simple;
	bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZzWWULS3SkfHlnU3GMR8sHiXtj9BFWsqHrp7H9VS9YhGnekQO1zdrPBs/H8eXUvKQpuT9D1JIV7oJ+KVeCoDFQBwgh6LXqkXqubaq/6KLEO568wwuT562MhTlWwhhB6cauNisbgUF8mGpvT4yFVSHAqbb+Oz0K7DTJr81dRtr5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/2hXFtf; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-605def5b807so180890137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 05:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776428635; cv=none;
        d=google.com; s=arc-20240605;
        b=P3vfYV0fNigP4JMJkfgPijv23G79EGD+ErF4VYGtclLiTVmeOEbgYXa1XV53ZKHbOH
         JUDidD9mpJgnTuhqSeIKY/mqpFPl/Bs18deNvlTRauSA0xqo8Lonmblm6QXmv28dCgxq
         GhyY5/T843wt9ftuMStWkcSTiTEbg/MtmudcsZRfIXkWhydweKKU9kp84trH8n3Mm5n+
         sQEI15N330vT28vXBPuJjv9jFUR+XYTTtVFlCG/1kVXo9KUzzPYhIWERu0AWhpYavP9m
         pg8fN9wAXHuFnrqZGHXXQLniBm9iRLJMpcz9Z1QhUSYlQmOPDU3/KM/hl3rWKp62Hm+D
         er8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
        fh=UpxqAnrxWCEkV4BHJJsizkSWwN2+LWGGUfWlp45t9gY=;
        b=Fi57CtSuv/uiIcmQ1DWTBomtwxFHNwVAp1oCcEXd93xrvheL5TBP8GnSdDc+zhyvMT
         dO43vnFuXK2YqrLBlFSUMQUeMcmHcIhBC1W5dKniA0FM5sQcUai8Yy5RUbXl1VfGTreQ
         mLroi+Jf6QrZNdSMWdxbH/ySfizchwTp07d6fottf+t2UkCuAC2i71ivlrIf0L+bvt1U
         RpKN2Cw3DY08XCPRoZD4yfNWFzT0XqkHqvYftjj/4P1QOI51eMbyp65txPOopYIxcajO
         Da6NcHa+XLPJ0qgCIDcYwdKZKYtP9GK9Q+4+5AX8ayNL6U/fg2g4QZAX0155S5QAPtxV
         0sOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428635; x=1777033435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
        b=h/2hXFtfEuO7HmwOj61+/Xbxk6NQ64StW8SU+GSJBeCR9uZL0UFK5ABD1XVqLkCY1L
         BVfh/iRGHkBo8SRKqvFXRgKdM8OxB35cgxU2PTUvIzzfxhkFrcWWCh/2gO3MIap8ppDh
         JGYji+UOdQ5hbSEkFsDnRkmL5XueYQkZ9porKWHCBX1SZ8BFcFhoSVasYUYGpspR3tSy
         r4iq7FyfIpIGueXaqeBmNGxYTn7uhx9KV09lxRhBuGvibpYMfuDeIBSBd+Lu6ijWOoZF
         KcquvbCj7lmv3SrUNq9gJSziaQZCD9ELZTl4ZcY5n1EOwcwx6dcCEoA1nWCypoBF5ZeQ
         DVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428635; x=1777033435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XpCq8Sf4SUf8hB4URITm6CXymy9bJ7uTQ5Arv6MXawk=;
        b=bdbcA8ytZURDKH90Dt47qZcLPt8oCLGa7peNVLB8nB70AK5GWt+tCrLSmmCuEd4Ghf
         nSOjcLSeJZkQM0vD3BW2c+eRIf7WYx4SQUF/cnZ2iTx1WUkI7b8j6VsdMNJJrg/u1/bt
         taXVv78gmlD719/uIYks0dACP18jQ/uneScacSiWcvXQ6F/AIjlg6ju+YA4cAhftmMhv
         fWFpHV9plNtNc2mjVV7rwp5VG6pdZUukA8QP1DTTjP24hAd799wqeDg6FImWc9BW3wiI
         4lYYlpi7zGs7KPd6vrRKNA6Ewhp3nugkOkuBt7K6vKhACGBTJ20eOoRH1FHI95LD6Lut
         EhNg==
X-Forwarded-Encrypted: i=1; AFNElJ+KHSasXRw/M7m0zfe6k9RQ/VZVyKu8zA8NHw58pRYMfY3cLFRTlICQtf03jVJ/o/YyDTKmwoMhIGetGtxR@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrPnU9k0moNoo0qLW0H2y7qlrRfSEzUjuvhJY+sQpyU5lpOuO
	6Es0WoUcXB56g8lSBvm7gk5Olxf590beeC8CUgQq26lpazgCBlWzu31qIQGZ/U8Nb0Ju9ntNUrZ
	z1IGKBTyydv42+bfN/xrXYMNn8CZ06Sw=
X-Gm-Gg: AeBDievc9SR7rx3E/IiBM9QhxRxPXCxY3szbCP0fkQnb6nLmr+aMJz6+1eVQg4ezYvZ
	U7BqYDgqHPkes+awFbce5D6Il0VSKqro2AS4PCTCfJn3GAU3KiEOyymoFCJURPWOGMdH6S/RU0C
	W6esdJk7Iqe+wKsOwOshw+n+NQCfI5uhdXX+v0K4d7lbYRlgV9mhvwuj4CCcejI1Yv1QK8YT4re
	QkTCZvTqcNtinzsxNX5x6H5T96JI9U+mokgymmSOxGvAMzy/ONe7Z8AiynmvmzDrlR+CUL6no6t
	c+cE2KWPlgE1Tk2GuQ==
X-Received: by 2002:a05:6102:3588:b0:5ff:2963:52dc with SMTP id
 ada2fe7eead31-616f474365amr846225137.4.1776428635433; Fri, 17 Apr 2026
 05:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228125431.23098-1-mitltlatltl@gmail.com> <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
In-Reply-To: <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 17 Apr 2026 20:23:11 +0800
X-Gm-Features: AQROBzAgHsr8AIpWiF4vnwp5PfaZ0TeyboP9_vrim6_Gnnej-q0JbDRhTZ3mCIQ
Message-ID: <CAH2e8h7W8Tng4v9Da9c7xg-oczHgNcMvz0OF6A27L9m+Pw7iZA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103526-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: D6C1F41B2FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Feb 28, 2026 at 9:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 08:54:30PM +0800, Pengyu Luo wrote:
> > Use it for the DSI controllers, since DSI nodes have been added.
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > ---
> > This patch depends on the below series:
> > https://lore.kernel.org/linux-arm-msm/20260228101907.18043-1-mitltlatlt=
l@gmail.com/
>
> Why was it not squashed into that series? I'd assume that DSI nodes are
> incomplete and are working "by luck" without the refgen supplies.
>

Today, I did a casual read. I found the register(0x8900000 + 0x80) to
enable refgen is always 0 on windows. The refgen driver may be not
compatible with sc8280xp or the DT configuration is wrong.

Best wishes,
Pengyu

