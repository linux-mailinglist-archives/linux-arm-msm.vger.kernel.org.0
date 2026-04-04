Return-Path: <linux-arm-msm+bounces-101748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM1MA0yG0Glz8gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 05:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A04CC399C10
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 05:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED351303638A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 03:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF0E329E47;
	Sat,  4 Apr 2026 03:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb/Kuj2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8B3246EB
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775273509; cv=none; b=e6CuQfWM1zBSDcC4iMOmMVlzThY2/1YlDMVUwfhkJJM6K5k377E+GIq/cKQhydQq7g2/30lOa6CO62bEN1kgP56dST1zJ0rrAGrviXKbqeCwLgraL2z/rCORKiSqniFJyvppDOY7GeXKDthfu+HBSYG4ZjCsKsjNMP/ILRppNEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775273509; c=relaxed/simple;
	bh=myvzOKJS1/6TEZHDz+FEt5uniMoDvWvsRV444R4b1j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSRxBqbUL7td4nl0p6jxQxaKRLA8Bq1U7w8mGn15HtbyoG2QqEuXrjSvnfqkj5AIM53bx/fBYYR81t4RkzryOf2Rn9iihXQtDzYv3PyuUydalrkTRS0xPylphdQfJDfpXCJZ4xOj85N9uRldj8fA1ICsiZ1CUdOxS0bWzZb9Feo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb/Kuj2y; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-464bba3a9easo1427764b6e.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775273507; x=1775878307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX07zznhycTuQQH6RFzBjYERCchLRChoAhRkTbUlVg0=;
        b=nb/Kuj2yCWkT74txP7r85wmHhJWBMiPmEvkIh3WfF0TQytQu5QdHhn8sZlouiNEQbD
         KFi6Ou7fzr5BU7kTgxzDrEiazNSBneednr8m4WpmCsb9JnJscQMxyyC7J8JxkdbtByEB
         hsKkWzw5wBHFUd4dB+nd0AKqJ3p5NKWgX61gXsjPwrOB/cWFZwrj2un0AfvqQtXw52dL
         MNpH2yFFLIQkd2DtsksjEMoM1YH1agGnUSnVRjXkuFiXU++pccR6Lm23Re5R6pdslBIn
         579vh1kffRyJxJNSDPlQR6la3HWXVujE89hjApec3qy26CGmLrWLvC1kg43v9AyWsGca
         7J+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775273507; x=1775878307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EX07zznhycTuQQH6RFzBjYERCchLRChoAhRkTbUlVg0=;
        b=NM+ATte7hsOTjTAd48Jd39ZXVwwxWvJnn+9qNH4vVrwb4MTaRK8Tb0oLPGT2w5oL7J
         TiUDA27MOrOp6Rnr+8B83HcLGJd4agLtmfkaDSyEH6poJOe3CUaP7/3RNP5QSlQywiUM
         7jr9ZL9nmaPqty9bFu628+pS6i3bJGCwiW1lvLpVGcb83kv4/YB9yTiiLlFHXLldP+4O
         tox/Y96B1Aln5BK8uNkCZt8VnY5GFnUD9Xal0lK/NQDcXmaMeQ3PaXB1+CPD8p/QWv9r
         LV9Lr8HXKwq2z/Z0bDZDP/1ArpmddawplHGQolx5D242R2WVzv2lWEzp2z61/IlY8I17
         qaXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuAiHTBoWnEsU78vh/cl18e3jMJjUDd8BlSYFZA64YFbBP2bdYA+M/HO6YTB4KveckZD8L6Uqdr7To1S+F@vger.kernel.org
X-Gm-Message-State: AOJu0YxXP9rOVH+WQ/L/Pj6zBCvFmDdGkcaVxkMGNjuPMZteWYrrcpxT
	ZrQ2HaNpv1xE+mr/nekrdKWB5qTxQr03zUh18Xta9vWIuSWlPktXc1Zx
X-Gm-Gg: ATEYQzyG0LTc3/0C6wRfOXqr9JAiaRLHajP9qj+myjAHlpUikw0hdz7eXmnkgqwkHOS
	x4atMS+iUNqgM/YIXdWuDzZ65xbtFn4IVqNtZga5g+5UTXpgtq4OltaoeA6s6ruFdKw3KgAUlmc
	Ro9f4xQr5xYzYBoPxIWvhr/wNHU2wcJJ9Z2qiEZiSf3R6JId6kE8GDOvbMnU5WyT5+ItZHWNZ3I
	SkfNc2kKEWynMqDd8NXE/95yVIcSPFaRNVTHLxHd5sF0pAZT+MFwL5Z3rNnkwENJ3Eo68+y8jt2
	21VvY8HxPCJpXxLO+4z6SmLOUHzO11EbvPHue1ED/+n+/9AdfXppdUGOtRPczOgD2qq8rxK9AUn
	UPzWELpTRTe8gjB2bCajCn0BjvDvsTS4dCzz/60G379R6gQvo2PZN0/6GQL8MnN0xn/gtkm/Kud
	NydhRtnfxWsQPGa/C+dLKMkVjVHxPOeQ8EcK+gk0PFNSdJHSSdaqXc52BgfON6arKfXHcOLpk=
X-Received: by 2002:a05:6808:320f:b0:460:f435:2a70 with SMTP id 5614622812f47-46ef8845559mr3005591b6e.47.1775273507365;
        Fri, 03 Apr 2026 20:31:47 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d90447177sm4485675b6e.7.2026.04.03.20.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 20:31:46 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	threeway@gmail.com,
	vikash.garodia@oss.qualcomm.com
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Date: Fri,  3 Apr 2026 22:31:45 -0500
Message-ID: <20260404033145.10625-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
References: <CAO9ioeUjYrR6fWSxm2DP-AhEMa8ZxSKE5CfQq=s9BhAqWA-5=A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,linaro.org,ixit.cz,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101748-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A04CC399C10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan, Dmitry, Vikash,

> > > But these logs don't capture, which buffers are causing the IOMMU error.
> >
> > I'd be interested to see if we can run this test on venus - instead of iris.

> At least when I tried testing it, venus wouldn't even boot the
> firmware on SC8280XP, citing UC_REGION error:

> 2026-04-03T01:51:05.376407+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: non legacy binding
> 2026-04-03T01:51:05.437232+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: invalid setting for UC_REGION
> 2026-04-03T01:51:05.437838+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: failed to reset venus core
> 2026-04-03T01:51:05.437850+03:00 rohan kernel: qcom-venus
> aa00000.video-codec: probe with driver qcom-venus failed with error
> -22

The same is observed on the X13s, so venus doesn't load.

>  I think it was captured by Steev:

> > This is much better than the previous venus patchset where accessing the
> > hardware decoding would cause the machine to hard reset at least!

Indeed, the older venus patches would simply force the system to hard reset in
EL1, and in EL2 there is a fault (but the system recovers without the hard
reset.)

I do have a further question, isn't the information we need somewhere inside a
TZ managed context bank?  Can we even see in there from userspace?  I really am
out of my league here, but I'm willing to do any testing needed on the hardware
and I can use b4 with the best of them ;)

-- steev

