Return-Path: <linux-arm-msm+bounces-94703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKTqMU+3o2mLKgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 04:49:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 448FC1CE73D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 04:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D03301A163
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 03:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8E5312825;
	Sun,  1 Mar 2026 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7f6BYp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6BB311C2D
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 03:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772336969; cv=pass; b=MB15zbMw/fsXZEm3tfo8FFlr+5ZRhUaKlI0chaX18a57nPdhRxPjSa1x8QK2IBjvXIwM4sbsQmaiJ/mGtSwaQ0xSlQH9U9VohIhNTmc1PUT6nzdq/uKV+1QyogAGP0cFp8raXIzdgcgVvZ/5Y474eEjZOK6E+GfSK5dLE5JrQMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772336969; c=relaxed/simple;
	bh=1TL0svUqlQ8WjbyQXv4ZQ6ctPtDBgRE126ERAHh4Yqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdRGrggew1e0LZGiO8wsXjoBcKPp9GF/b3lfvmsRnV616A304Ycx9XVGFff5gd+u7co7E71ZR/LsudDuW5yYzxisXXCYt+YDw1vSCTMGqYtMC9Gmbgt5OyOx6OyRw1UrgTCXs+mHCWiY9f9xALTJar2HTuVlVZVebNV7+AMrPDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7f6BYp3; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-94dd06a96easo2332170241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 19:49:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772336967; cv=none;
        d=google.com; s=arc-20240605;
        b=I+zFSfR5xdLsAsKcpeVXbklzZybWpu31jRfkEg477sEQwGxaoDSFS4OQm6zqztVQVq
         WgTwO4uuKpYj6UCPfv9X0ZorOlWqTfJvPRTVb+/TCAcFZGHeBE/jqsy/f71Auy6iIXWr
         LY62QgImHqQxEryTEg5KDS134eOrsEnqH/R2Y5fMq3z8yPS3TckNL5Pu4xPfodPB8pDm
         gAuEjc5y3cqBEQrUADGL9D1gZXiUmHxnF4o4zJrNplDz/ocL57N1Ii1mP5GE/SrO3C/+
         Wi0iW9VWUSzB5HucBEkPPBHNOxCWecCw05y26vUZA2gdIuVyfJepW+Un0Yf/+tQk3Nak
         Z0FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lnU1mLxbjn2+cl02vzRP4sy51RqCquCiXAgj5a19P8=;
        fh=QxUJgkOruOX2UCsFksKGvytVHNtzdVLjuzoX6+v9SVA=;
        b=jzmzkcVioepPkcv0QrON7SrBcXnF5cKFeTK2HFF+eqaFUxg35b2RFNhP17oY8oXd8n
         zOsXiA0Pz3AYUfFoJlXn7ZrX+CJ774PsCPutKr3DpUsm+TRb9mGzNq4kgRqCBtRJuDbT
         4bbLHLGOZoFrskkL9k2Vs2Z9pSLfq/c5BTCKYSyZiINnObZMJExRHIEEe+DgkgUx17E6
         R1oMadiGxGp57kSJizqvk2+3HYntLxTG6sphhtFrMobqLW9LeXt9B6KDUER1eGodQiUg
         NWBpLEHXJgEDAu51mww+CxnKB5EhvidPpTDNxJ6Ca51jhUAtZYfgHXAiNN3/KxgQNeNe
         nlhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772336967; x=1772941767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lnU1mLxbjn2+cl02vzRP4sy51RqCquCiXAgj5a19P8=;
        b=W7f6BYp3l5OwMJpxm4O2NAKOnba+ZLRKHl8acoyXRrHLpziCh3hDBKp9NwUjVNebvp
         Q91986QPnJxFkFKyYV5mWDSSgV83QDlxYlGzWREtCxf0cpnuvbNfphrA0/ycJ+vGwcqA
         J6cc/NZ1qtAjQdKYpVAbEOJMWT3mo388KgqYVuHTBZQRbHo5L8OMRa8y6HmwGvoeWm9D
         9d4zGtCVldCAhX+6UWIB2WjGrpoHZ7Xs4fsKCvd2y0hFmRzxPBJ+suBL4758tsTa9/iL
         KuZfMns3XDCIIppFNgHkpXqt8c4EHt88nNR1+uTqYx/B/robQsdSeW1t0f331QUbg1SP
         K4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772336967; x=1772941767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lnU1mLxbjn2+cl02vzRP4sy51RqCquCiXAgj5a19P8=;
        b=OQ2X/mDX9WdjukHn44gFgdgJsMASpMCd566fmJi83RjctWyQCbKxWNj42wM7IsFRMX
         0lqOaeRiWqw3OAQGUD0pYnTX95TOWd2FZs6mBCSW8gd8z5VXB3MVJsASf6xoLQUepDPc
         QP8HG8Xt/4RrI4RPbOAL7PS+obj5RcoLr6gh6CyM2i4/r8jtrPnUaZF5TcqrRS9XkXHh
         F7VS1G8g4wWpro9KMjbU/hemnnV7k6bDr7fEjrTRSiNzRiu4p1dfL2oRC9uJtF2JFiq9
         OROkGgp2VOit71aSNbkenTA0Ei1aPJ3bQ/7BVCoQ7kltAzUp9OlzjJMy6+fisWRpVyIz
         f6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqa+yzMXWF6u4YQOd8dVJLW15grc4oY2/ejb9JuOvP6HLGV467brWZNehOWaW6EbSPQvSsMOx2VGM51o0E@vger.kernel.org
X-Gm-Message-State: AOJu0YwLugGpJaSvAsFV+Aky057k17TNVHVtn5Naa6+LUPoPSqUescal
	XtkmsZcoalH45jHRcJET6a7uiXg3rZySpAox+FfwKqwoHr1pfg1LhdSP0RtKeu2O2kZG9NBi4On
	93pbxlNTzYIMwXQOAtbV25CpYP6Ojgrc=
X-Gm-Gg: ATEYQzwZ3pjojqL+cQDxJSqoP8W6tLzX2pPfrPq8hnaRVimE21h162AKB3XrTbamPGq
	IkuIXCBVInG9ohpywOgz/8/w87TbCJiZR+ALn4dkjrT0tLec4kqklLVPOozIr5X7OKFeNyajDLm
	q6+FOxSQRmTgUArgU36GpzahJu4JF4yeLxVu3rQAnmVX4ronK/6EdYWz9Ua+9PZIJQgEaVexhPQ
	O5dg5QBQSeqCQljFfp5tRBJJOaQhmsY8kfyTxiQE8KZ7EJP8xDTobdt7l40qrNnA6Rqp334ZwBU
	IUMIx20=
X-Received: by 2002:a05:6102:3ec7:b0:5ef:8ae:85a5 with SMTP id
 ada2fe7eead31-5ff32324fa6mr4498357137.16.1772336967571; Sat, 28 Feb 2026
 19:49:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260228101907.18043-1-mitltlatltl@gmail.com> <20260228101907.18043-5-mitltlatltl@gmail.com>
 <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
 <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com> <sb54l554woevgaetb54zwyn6fdrz4bqi7vnsavdy4czqzbcwjn@qf5wckbfzt2z>
In-Reply-To: <sb54l554woevgaetb54zwyn6fdrz4bqi7vnsavdy4czqzbcwjn@qf5wckbfzt2z>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 1 Mar 2026 11:49:10 +0800
X-Gm-Features: AaiRm53oZLI3cEOC6H1iwG89lbfTLYxPepZoGTGf8tU72v7-R0PVDG9WPFt8CG4
Message-ID: <CAH2e8h48wG92D20Mq8P=8qcur1FWTvwU4R5PEN3LRNE+D1es-w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
	White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94703-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 448FC1CE73D
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:23=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 09:57:19PM +0800, Pengyu Luo wrote:
> > On Sat, Feb 28, 2026 at 9:32=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> > > > The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> > > > utilizing the same register layouts and clock structures.
> > > >
> > > > However, DSI won't work properly for now until we submit dispcc fix=
es.
> > > > And some DSC enabled panels require DPU timing calculation fixes to=
o.
> > > > (hdisplay / width timing round errors cause the fifo error)
> > >
> > > - Please squash refgen patch into this one.
> >
> > Ack
> >
> > > - Please post at least the dispcc fixes.
> > >
> >
> > Yes, it will come later with the panel driver. Lewis provided the
> > patch but it was generated by Claude AI. The patch itself is not
> > complicated, it only removes CLK_SET_RATE_PARENT from
> > byte_div_clk_src dividers. But I need to find some time to analyze the
> > dsi phy clock diagram and reword the commit log.
>
> Krzysztof wrote a perfect description in the commit  b8501febdc51 ("clk:
> qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf
> parent").
>

Thanks, that is very helpful. It's indeed the same problem.I'll post
it in the next two or three days.

Best wishes,
Pengyu

