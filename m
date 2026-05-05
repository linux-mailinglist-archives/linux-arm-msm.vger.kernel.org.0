Return-Path: <linux-arm-msm+bounces-105982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I2zCKn9+WkqFwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 16:24:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A2A4CF563
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 16:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C333730AB2FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 14:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6179144BC93;
	Tue,  5 May 2026 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="esEJqhKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C894A361662
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777990580; cv=pass; b=epETZyMCzYdodjgagfjVKD9nIOcTPTEBKpTBgNoSR960535KB6fXJDIfeVWwjnrcftM/y6FWh2UVF3BSnPpi/tiswltDLTFI3vufvvyqn7b4tN/3w05h4PxwR5TVz+KgsLmp0MOoGyyywAL7J3zLtztPaC18HIhuF5sC8u/rNbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777990580; c=relaxed/simple;
	bh=EZrw+Ff5wgZp12c9wE92Aku4Sa+D6FECWmw9grbidJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0oSxe5P2XnrDDn1AtJSVU/uUMsiet0rGGvn8LKjV1vSpZUmJI8pcZP6WGvoHMHEHsOhmayJbLHmBVf4KepQXF/T6QOtEkgB+kvZf/Bjqu100Tzut4+W1kkXMi302Zs6G5gEXpT1V7Z+NHsN64/at+2LZkEpBTlfWz9FQw/ywwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=esEJqhKd; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a41099fa86so6382650e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777990577; cv=none;
        d=google.com; s=arc-20240605;
        b=MAiW9QTA8kEgXKA69UqYwcfVzqXVBWLQvvuU1B1IpN+OKnG8FfeYIADeXh71DgvYif
         pzlqqpjODCGMVjJoQW6gt7frJx85zvVTeifOgyJgzKfUqI4ehZrStxbfxP+SVYHYlMGr
         qqCniqaG+Z1ruev2wfuX3hLZPs3YtWAM7lJItjF/1ckwN1xihi4izwk4PKz9NHlXEB1B
         k+LTZ81v8e7yJOZKGA6cOvbwl0GNYiGrjp4yQEavdiw5SS8u9r68cJTrWdM8Uvw0LTtx
         D1OzRi1L54jyEVe+plMLsHujnvmmaoUy266Q7RzVoAI2Am2XQ3J7CeQfr7B/QnpvP3DH
         s4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        fh=z1p/oGL1D4iFXTe6FTcHe6sWyIKDKsz0PHk4ogrcRks=;
        b=LNhcIxQTE43ix3MJPCbtIEYaALGkhPPUTrzPc7z86KYSuo6izy/oVq1ahT0StiqwLW
         8C7ggdjADwn954uRtPVCKhjs4bt8XCXDW/hIL7Gu/yWJSecsvuT/Ymucc01wgNDool0H
         vrvWh+mXyTylCf/oTo9cHtoQ3IC6tzbB4h1vahDHaCDWUiYy4CIJWUMFo+GTgZsWlzs+
         FiB8Uaf80VrCaCmRmF3V4Xno1jEBgAtOIEE6a4NsrEqyJmCouPvMtLfk7hVOF8co19S9
         sp6OsVP0Wek9qbBPAvqqXHr0B5Mjz2xpd64L0+LFlqgew2imBHM1pQBCEt2i++AQAIl3
         3nGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777990577; x=1778595377; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        b=esEJqhKdToH7Sg5/UqrdOLMO0NIEy1FRIO5Q0fHx3A3ZjB1c1FZ1kff8vps7x5G7uG
         UdX1mQRv7ogr3fnSRi62rvt4qJTB4aJgDU4+lfOEMVpQBUb5y6BgHsxo8Ay8lsgi0lp3
         fWQZ6OCVhgf0oxq6geAdv8/Gv6XCWEkM/ifDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777990577; x=1778595377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFHux40IRBs1/yWZDcql5ry1rXvUTT6afmUx2GtPhjQ=;
        b=dsAcJ4x+VVMPY2+ABWRRZGG9/kDDzRr5knqpq9jcvAJDH24xIu+qBlnCr9M7bpgwfw
         eW2MKlJ/Nlj3Wr+coUEBs4Y2BNHlPk3sAC3NgVUZpCaA1bQuEIHoG4WrHzvK2Ij4ly4l
         nuZKaSQboNC98WNa0SbeU2hAjkdqS6eJgdl0LlqB5qhv++Ra4pQBSJa9AOtXfzLtYGVG
         zubbQ5mqYm0Llro4X5xJ8tL5HDKCXIxOVS+SHzv5PFK4hfp3R67vEw5BJ76qUItZHaSy
         PhS7/vt5ggKZJP4q+wj7YcbSCM4OTH+Xc4rNa8yn+HYA61Ltw+TrRZYN2eYUdyAVU1AG
         IRdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yX5lkxJFTpGB8Nmc6sfTPRUvKXTIO5rJlThw733kgs0YbgND5TEHIec6ZR9icCe/tdN6gtu1NqRGGs53j@vger.kernel.org
X-Gm-Message-State: AOJu0YxgPafzHMUxbgeDzDvjlib5M6bGznD0qwA6ruxZrZSYy11PSkl+
	lH6b5kKsv9j2Z8G2hEDLio+6Ned1r+FPR3P+XLUCAth9NnLYYUEpzgUBuurtonEeAAjJR6ES/SF
	U/SzL1JPKLwfp429AEkujxhEkEydkGzLiZgN1XT4MsQ==
X-Gm-Gg: AeBDievffKkdXSYVtbkPJEq2F45JOF+ord4SR4hb7YESYYZHB7bEg1a32arQYvYRLGw
	YxRN3XcubYSXyxKVka93ArWH+RMiKZkA//CuAscz8csEOcTyXhI1oPA9uzaZ568OZp8ChNnkRFA
	0NaJNoWcoivwnqYXQa4DYQXbETcAL3acZIEYrXM9epapazq+ZhiTR1p5WKTug2Cj/A2NYHkUgnD
	RfVnWWsk1JZVrVSW51e4fNZuovWS2cxLnLFZqW3h175tnpoL5Xj4GheysVHnrH53El2gZeuFQG+
	nFW/EGzNK0kj8Ugsmrk=
X-Received: by 2002:a05:6512:238e:b0:5a8:64a4:2bb8 with SMTP id
 2adb3069b0e04-5a87f1e9f56mr1369841e87.23.1777990576919; Tue, 05 May 2026
 07:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc> <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
In-Reply-To: <db701e8b-a405-4105-9b5e-b2add3827d83@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Tue, 5 May 2026 16:16:04 +0200
X-Gm-Features: AVHnY4JUaPaP1Nq1wsangmykEfeEzNjOrLYJgeSdNs9jlx43Fmpe3DuNJWlc_mY
Message-ID: <CAKA1JhbaB8NjHE-Ez98d1b2QaBkrvpndA0d+GfbZ+uHW1BXruQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, 
	linux@roeck-us.net, Jonathan.Cameron@huawei.com, wenswang@yeah.net, 
	naresh.solanki@9elements.com, michal.simek@amd.com, nuno.sa@analog.com, 
	chou.cosmo@gmail.com, grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	loic.poulain@oss.qualcomm.com, Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 84A2A4CF563
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arduino.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arduino.cc:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105982-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,huawei.com,yeah.net,9elements.com,amd.com,analog.com,gmail.com,linux.ibm.com,vger.kernel.org,lists.linux.dev,arduino.cc,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r.mereu.kernel@arduino.cc,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[arduino.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,arduino.cc:dkim,arduino.cc:email]

On Thu, Apr 30, 2026 at 4:10=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/30/26 3:21 PM, Riccardo Mereu wrote:
> > From: Riccardo Mereu <r.mereu@arduino.cc>
> >
> > This is done in order to support different video output over DSI.
> > Since audio part is linked to Analogix USB-C controller it is moved to
> > the same DTSO.
> >
> > Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> > ---
>
> [...]
>
> > +     sound: sound {
> > +             compatible =3D "qcom,qrb2210-sndcard";
> > +             model =3D "Arduino-Imola-HPH-LOUT";
> > +             audio-routing =3D "IN1_HPHL", "HPHL_OUT",
> > +                             "IN2_HPHR", "HPHR_OUT",
> > +                             "AMIC2", "MIC BIAS2";
>
> The commit message doesn't mention wiring this up, please split adding
> new features

Sorry for that, part of this is in a series that I was sure was added.
I'll make the dependence explicit in V2 cover letter.

> some of these have a double-space, please fix them up
[...]
> Let's keep a \n between the last property and the following subnode, file=
-wide
[...]
> 'co'dec < 'cp'u < 'p'latform, please

Thanks for the feedback, will fix this in V2

Best regards,
Riccardo

