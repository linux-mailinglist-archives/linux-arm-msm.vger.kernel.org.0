Return-Path: <linux-arm-msm+bounces-94604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMyzLf3vomkX8QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:39:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB161C348B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 14:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11D2A3043D78
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 13:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C64C2D1907;
	Sat, 28 Feb 2026 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nt4qaery"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E236322689C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772285944; cv=pass; b=IbEXocTC9jgZtndeVICGICyanGKdgrRPYuJNX2tbTr2aX9orEfcieNYJOQVigHnKhisGGjzTWPLZRabLNP4lLjH9yylkoFEIVnLa7Zl9CU3wzu2jCyma0luUGv+YP6BZbcFO+mTPP+uqFE5qVyVBsE8NrK47gnmve+jdzvweBU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772285944; c=relaxed/simple;
	bh=2/mkzdfUtM5sKt5/jIrnmYiRivOOJwvLEA6tkiuRA5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u99ZmuJUVKMQG2p/gLZULKdrN6Rpa61XItkM6CIPw8tt2lNNRFEygThgCEEYR7gn8JjhKLXt7uM2bbBKfCvoB+h6bN5a5w5skTzu9W45NuHY/IJn0Xd3A6Ojse3FiD8v6IG54n9fUVISdolfpFs2Tip/LerH92LxjoZkM/XNzbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nt4qaery; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so1791999241.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 05:39:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772285941; cv=none;
        d=google.com; s=arc-20240605;
        b=Ty35fxI1z8zziDGT2SkZbIFrCftep0HKgULFKVyW2y6VcyqaVGgqiSZ+W6hFFioPer
         nsFOo9ovY0xktTsri/UpkDqqnSS6Emso3N0hrafCE4ZcNfYAYTqa6xAh3DhI5bawjfkr
         LFNSnAJOtxfy0qSe4VHhVi9BtQCL/pR6Eu4/qu8cUJFo1f2lnznaerwdAowd9Dt3wftR
         WsHQFNyP+Wi98loa5/ND3IcoLHvsMNazc/LoaT9q81Z29tgFtD/78P9R036qBq7jfgSp
         BMM3izfOAHblNFyNWtgMjYbDRDbCDkdiGCOl+1yHp+mscZNPFv5VODFBwUlTrQuqQSfQ
         sdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/mkzdfUtM5sKt5/jIrnmYiRivOOJwvLEA6tkiuRA5s=;
        fh=uzriqAUP+iPUpd+pIfXVdFflkrpXm/1HoclGnb9xf3Y=;
        b=bDuQX7oK5kBFCcFc+RsPw4hC9MwR39ZhtlD7EUTaYuXgZYMGU/FpzvpI/si/rH2FTL
         n8RD1Wv4G+JQ/2NWF5LzrRwDE9OJUvus+ylO4QjwX2ej3DFNWCMCdwd5oDF6zbSkFLV3
         /gbYCwbaj4l7O1aNNWrE4TK6d8ToPLsWvcXWNbhrJSE7vjnp7XJBTbhB+ItfsPThfynZ
         vTAP+6gHuTD7W31Jl3ugKb12Yjo7oFi9N28IN2j3hg+7ipfkYgdIF/GIn336hUELBwd8
         Jwu60ChX2tSMAn0QCQX8NjMPbZlfN2DOYDh9ELpYk6iT0NWW0ywxG3w4jvZzz1Xm4fGP
         +yNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772285941; x=1772890741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/mkzdfUtM5sKt5/jIrnmYiRivOOJwvLEA6tkiuRA5s=;
        b=Nt4qaeryReSDRZpCVnoZEE0QyPQVX/RAdQFRW2TI7VbI/g6bI4p7liaBWZD6aGQaQ+
         tapXI3GB/cYI9YXIrr1HWMjx1SKuWOuc22VY/CU28BwwouMM/te2RoAXz7ZshsN+DHBp
         V5f/q0a1evnRtPRGRLPLeBz9koQKv2+kb0RdVnD4B1nvFKHNdxlljzaAulho3+C/PTrL
         Ajmp5LhCZiJF5phbq1LJ7ZerbKRbGquPEFyjh3K7VOO17bOqUr9WEntOUoQN82S1KTKl
         /AjpfYxFA37wQ7nM3ZHxccT7/tDE21C2Sl21vQn+dzUE0HkpZjNrh9WH+3zzrlV25KDG
         6CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772285941; x=1772890741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/mkzdfUtM5sKt5/jIrnmYiRivOOJwvLEA6tkiuRA5s=;
        b=aomU7Y9UdeCEtVfWxXA0pFVU5wnJm3u0Vyx0TJpd5QJkIa7/tcaPfYbpiMvo6kKcOz
         X8BWutxI3u1bjMLIxYDaSH7UqY2Hf0RDSh9UqWrVjBz+UVUZ2VU7jjP2a6lEP82MYVYO
         H9DEsCpuF7hpwZCxKjnSfywN7k84zRQeBKAf5exMi1qhJKq0kxTMya62gIjUQEw0JFol
         tZCHAsJoNvsYnpmb/JqAw53Hm2Zkl3csQeSrl21ZPEkt72ZOwMifCfKbiXUyY94In5yD
         sJnxg+mQVYExOQDMNiAWBamFF5M/UbSgxN0gsIRIS1J81lIBZ8NwY2xnoCeBfR4vjTi6
         ET+w==
X-Forwarded-Encrypted: i=1; AJvYcCWazuGp2r0rwfEdf6i79uzTM4l4/fnIvs+qZ1Yo3v3VMQLb2PXbs2ZyUuOmI9AwVU25rkbHqwQLBgVz+qAP@vger.kernel.org
X-Gm-Message-State: AOJu0YyqiQSovFcIhE2nY0PlmwpsCnWbYkVWixVh4REmGMWuvzhMcLWv
	4hMs1rLSOhyGIFtFA6btUbgUs/PPDXSVhtJWVy0drAhiwE7ZtbgajKrQKNVG8jBE9/VMzLDqUdY
	/9lErTsNCZnxZRLNhi/z9SHhhs3jY8wI=
X-Gm-Gg: ATEYQzzgPQgp2Ltg3E8f7aQ+V91frW6OhribfXk0mzZvtye+OB8bNUR84HX6Oi0wI0i
	Q46YZLAfE2tZMTOf9LAbf/ss+k+oHbB3kkOvQD38p1yWt8E9+v3nKx9MxVmBCrKoeiP3Hjqm+F0
	G5tj/lxuOFk/BwBK4WTWR7AzVub7XyzvWDvtC3m8hnKk8gjkTiihXUaOgg2uc+pJHnwxb5r+F9e
	hy1HwL/spC+SfBpeVkA7YD7/4bPFqMNNcmDU030QW7TVPjouqnh46qiukcxlDgfuigORrkPD1tM
	nxdCD+o=
X-Received: by 2002:a05:6102:510c:b0:5fd:ea66:92cf with SMTP id
 ada2fe7eead31-5ff32331fecmr3377154137.13.1772285940819; Sat, 28 Feb 2026
 05:39:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228125431.23098-1-mitltlatltl@gmail.com> <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
In-Reply-To: <awrfjdwsf4gyyg2s6ppw4jfmpzp5s2aavosmspsp26oqccco7y@csij6bpnfpu7>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Feb 2026 21:38:43 +0800
X-Gm-Features: AaiRm52sUtO_METgNFu756gB0XTAtSpZIFzTwMVreavJUvCIzU9icg72BbD00pE
Message-ID: <CAH2e8h75H5ZZ88pkFYTwr5xir_giW5DxV16Pvo1_DFQuqWGFKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: use refgen regulator for DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94604-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3AB161C348B
X-Rspamd-Action: no action

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

I had completely forgotten about it until I found the patch when I was
sorting these old day unverified patches. At that time, I just sent
DSI patches. I will put it into DSI patches.

Many platforms should work without refgen. Bootloder may have
initialized it and be untouched later? Once there was no refgen
regulator, my sdm845 phone worked.

Best wishes,
Pengyu

