Return-Path: <linux-arm-msm+bounces-93284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULOnMaG+lWkfUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:29:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C4156A58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11FAD3024CAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 13:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B2A2D7DC8;
	Wed, 18 Feb 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltzkSItT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35B2D6E41
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771421256; cv=pass; b=snx4lmRZDQOLtLet1wYafktufhHDUD2bhN7FWVV6rxx9sKqgTM+xFpSTsBBpWwIt28o2ncgzc2/OJ0LlCUareDziNxvefDumzGLVuLH56f2oFvyULcXc3aqoQRxUGpu7egst6SPYGLWrDjgqAV3bmHTtZE8bc6MQHoeeNkhbW3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771421256; c=relaxed/simple;
	bh=6uKgX+FTM0Qddb34IIko45XF60fCsP88ocn5fLnGK6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i+LzeRLKkYrCkhQ0/PQLLDYaaVszL8LjG605zdKe8OzKA8bdby8TbhiuVKbbNXZ3VD20UNc1sPU32ScPyYoqQgkAIBZWnhZfu3Noymu3jU3Fk1UZn3ZUU9OrqGvVM2tPLX8gFbn10S9AjQNcYiqZPsvFwsRDVrJLfKDXLw6JyTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltzkSItT; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2baa098ffc6so4550094eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 05:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771421254; cv=none;
        d=google.com; s=arc-20240605;
        b=INY9dtOuraHl+rZnFCibMpzik2u/BHhcGChy04RtCVUDpfBnIHMK6qtzu6l7+SfOUQ
         lD1gcYJDmcOUlSIXFjOTN11rWyCt3rHGaIvC94cXeX8M+J4NPHCM6MfsBUmXxmysriT2
         9GECvZlTPhr/joh93QjggSrfWgke3cnjGBWeNpSyVKpWM3v/4QDLm7+zniidwEiGSqQa
         PxHDiK4MVQwJmX1iRRKf8YElNY1tVWlSxvwu2tmXrzng8Y53CnzP+rZET331mKZSljlD
         0yJ8k1Nn0hQZsQPYdb/X226L7mwWO0YPEc3VfpkjoxFg5yC2hJvZvu61GiN8VrPBu0gE
         dH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        fh=TnUHq84dsMC5+jZAaApGYJkcc6ZAKdWOKDs6IWpDEUA=;
        b=ilEc768Wh3hGjjOqcnRW/Z89/RlE4/tfrXET5uF+YBF2LmE6u2rjFSy/KfwJlOOQ57
         2HGlGxROsJMsbf2Q/OyYPb9dNnS/w5woYxcEb/rXHoFE/ov2SLRIc7vBN+cHj0Stcwrk
         lnO8yfkZQZEpl51gjE17ywVOM+Z6g1w+Jtm4Nd1fNbohEMl9LDFQgz/VCeX2Hp3BP1BM
         YtEccei5kuBfhDN7pm28Dxt6wI7l0PS7IW9fFv9TkESjvHDKya7fLEzCRZEH25ae77UZ
         dE+mGcP2eURhXUXb72wXSXSNEGnjzxjMRBfB2mjKuEHy0ua+2RmXeVl38KTEErS3Wrdj
         1Bfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771421254; x=1772026054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        b=ltzkSItT7wAmsf0b7r/yLVheQw+py8oHM8yGNywbF3/OKslGCTRxKg40Kv9Ads58AK
         ASTxvguu9gvupJGRlrJ/NJvX3FP8fI4moOab7E1iS4OOamS0MulmrdfniZhyHfTGGJiQ
         AU/00fa60cAg/keg5Jv49AOfQ2tQoLNq6bLv8Jkv0LqCxwnhWiD8dUCiLpKoj+zndtyq
         hcoNp3nWlOmpjS+fhm8Pv1p9sXtI4yJtRG2IFr5uUKSpHAY2tAO4lDTw0nqquu6LTxc7
         PriY1vQqIfHK+bUse/DNGztxuEBogiS/844rGetZwUwXlcMFzA/jrJ3Ntef/hr4xEDFb
         /sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421254; x=1772026054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDwK81uO6Grpntsjm+/j+2ujVIp4zE8opmsr/kEY3iU=;
        b=fBIbkMdeQxLHyTbnP9IOgGXB/1qIJOQ6uRPJeMdFzig0q+1XTWvdHnTFB0pB6proPQ
         krtZOUAvzxyKTikHjQZ6/ZNx8sOGZu4entsUvm4faNqBgke8AFuesp43uveHxVXoY2Oh
         CYma70/A9SN+nMTeUg8k0+YcHZGgXLQPl/m/a6Jg5lb0HYjG8f0qrjRIJxLTZ+sLT8hg
         Gfk9vYmW8emVdSgDhEO9QCVPsDvqhF8j5wucSdx0v0s/xz6P+KImmfzwO2IItHDDpwlV
         2oARbXw6s0BQlgJVANYVcbTQiFIf986r0u1kOrUZhyvTqF0eW1JQA3M7SaWBU/WQJfQH
         BrKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr4xD+IYofGj/8nVVyo7uZOG2WRZBJGwrwycyWc6JAYNiWb5XS0970JQOup4tAJFjRji+reGx0N2KKVNE4@vger.kernel.org
X-Gm-Message-State: AOJu0YwRxlCnaCSvuCcI5zd0uU/zu+xXJH6z5+Ns2dVPNJ7rY9Nidosm
	6x2z2kz346p0aX1ll7b8D7ZGfSBFsd/fCMTMkIMWm/Q8M2aQO99gUfeB51tHZSePU5OUN/tAhys
	hClsLOL5PEEP0zpVO4k5sjrYOe3+gb8I=
X-Gm-Gg: AZuq6aKRpJB3hc98Wm9Pece5qFQSxuhySwKar0Zx8oLswRkUNSkE1Uzv1jA8GK87eud
	ukflj2dqxqTP4scUsXNa7hS9yiCbBztgJsOlrDvUxzZe6LkxiOwGKGtJBVeFmVVIRRgstf42vhN
	dx1LDIh+z4x8icUixuB96w2zs+IMNKqcKxC8i8JCvuLTIGsrjYiglbvXovDVU6nXNJz2sAHK2nc
	mTtuQ8wcUy98Kj5a0CGDxbd+93LL+Vzm3kYNJLnI2YM899paCrbTLG3so5xs6SJPEXps7zjn069
	0PsXDw==
X-Received: by 2002:a05:7301:d19:b0:2ba:6d87:cf68 with SMTP id
 5a478bee46e88-2baba05b5c2mr8036941eec.16.1771421254003; Wed, 18 Feb 2026
 05:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHuF_ZqWTb5Z7J10WQaBR2adVi1rU-ZFFTCBkHh6nNtuuCdJDQ@mail.gmail.com>
 <975930a0-1ad6-4b3f-ba3f-13f6f79322e6@kernel.org>
In-Reply-To: <975930a0-1ad6-4b3f-ba3f-13f6f79322e6@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 18 Feb 2026 15:27:22 +0200
X-Gm-Features: AaiRm506tq3L5Z3tHq7u7PFOBpp3iK-Ike8T0d94DU02cYJ-d0FeBWZ88LSnJGc
Message-ID: <CAHuF_Zr7r-x_ov=PMf7KmKEuApis5+eQamxGkcKSh7Y=onr=gA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: val@packett.cool, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, martin.botka@somainline.org, 
	mturquette@baylibre.com, phone-devel@vger.kernel.org, robh@kernel.org, 
	sboyd@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93284-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,packett.cool:email]
X-Rspamd-Queue-Id: 2E0C4156A58
X-Rspamd-Action: no action

On Tue, 17 Feb 2026 at 21:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 17/02/2026 19:51, Yedaya Katsman wrote:
> > On Mon, Feb 16, 2026 at 08:25:20PM -0300, Val Packett wrote:
> >> Add the missing defines for MDSS resets.
> >> While here, align comment style with other SoCs.
> >>
> >> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> >> Signed-off-by: Val Packett <val@packett.cool>
> >> ---
> >>  include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > Tested-By: Yedaya Katsman <yedaya.ka@gmail.com>
>
> Thanks for the efforts, but unfortunately you cannot test a header. It
> is not possible. Testing means you try given code on a REAL device and
> you cannot do that for the header or bindings.
>
> Please do not add tags which are not representing actual action.

OK, yeah that makes sense. I will send a tag for the last patch, which
only with it applied actually fixed my issue (although presumably it
depends on some of the previous ones in the series).

> Best regards,
> Krzysztof

Thanks, Yedaya

