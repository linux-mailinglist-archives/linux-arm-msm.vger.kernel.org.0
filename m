Return-Path: <linux-arm-msm+bounces-90027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OF7HQvdcGnCaQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:04:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FB581DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 15:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 40FFC70A8A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6ED748B365;
	Wed, 21 Jan 2026 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b="SJXvnc89"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD547CC8A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003641; cv=pass; b=T/DGsABrUoquOnayw1Y/EVEc46g2d2y1rJ6+FsGA6BN/DPg82VRd+8V04+lw4cvCl5V0tc1RmvFiWhrtd4HQeIyVzzEceJT8MJhH1YWwKMyQOJgEjHAxT3ee9I5oi9ExmJgJq5NwrMhWeA2ZwpTqWd6RCQQJ4LOClK4RqEN0imY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003641; c=relaxed/simple;
	bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek880acGMjDR0eiiJJA9GPb9EakednRsJ+NwIRvUJ4Zgzzrs4wd3NLPLU1by2P91AyEMfpQiwsKmvJhGEJwGIzFzRP5R98nFgYrrNHHweoS1poR3nYtwUJ56ae8REAj7Ufw6OTYgc0pcxid715OpVXfmw5mLeNNuWbWYRqBUDf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=SJXvnc89; arc=pass smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-89478e429afso2921576d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 05:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769003638; cv=none;
        d=google.com; s=arc-20240605;
        b=ByFsUTkjdpmX2ZySPNT9fTtcidU5yKfv+G0kzC+0s4LLTAKm5Dxlx0ZbuZxb36qtkc
         GyBTx61BbLpGN7h5pBxfhcruVCGViM07Oh/9sTy5EgKqNPrNTlRiwyIjP/eeWHVS4tNE
         3ctlifHtSjxFxmO54f+wpzBd083+J+f4G/uRHQDj+Y+vQt8SN0lAnijnGMaraM01GXqD
         FBA+ELDszfU1kzlAGeYmDs7hbvpaMQ2NnLwLeEh5ll9GQ83so0m9QqZlqeeAAkAasN6l
         BLzRzNz8q99ex7JsEEk3drJeqBVVt8WPapRV99JaMojgnND6kZPoRE/FzuePiAM5TGlf
         CqPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
        fh=QkCpYHpF5s87ORfTmLV4oph58dDzXhNpaYehzb9K10M=;
        b=GzKkyRoyUuytOKoXUH8Np9UX8x8XUdREu5++a7kdPf1/aZBXWj8n4XQzrYvYv3tneH
         5f7S8gJ9RejocC314rEO0x3D0Bq0iU5yeOg3urVFJ+61HJwMYiimJtwB90/N7ipymuHr
         6ZfN/2rQWiZAeyvD/m4Bl7d9mejavSe+blmPzfDHripkaCsdKOdXf1WOMLKGKGq3SQDx
         LYAntwN9/kt5pLwozSYF1EiSHPEGOrFo2qg6DQ7+lgzZtbxa7N+rIbhbn8jOpPVfypIy
         my74+nvMzqIFo/Y3mOi4PKumrsePxHJNAlwEynlaav2sww+lsveqg0O4IoAQBedpeMfs
         8jYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1769003638; x=1769608438; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
        b=SJXvnc89Oiq4jL5LQ60IExAIoNwGgSDQAKfSkVYCFBtjtZxI57F44cOIbFZrkoBvRV
         4Ozssb/oiP/wuVxqpUIuqTQxhm7varMxBkYwu4wMBx0Wtu3Q2XFM7Mjmbnt8dGHx/pTN
         +N9ns+P20t28pvPmiDo7RaeImEKdW2wlANXM77vNnbxgtaXHliLW2gEiVHLJMp8jftbP
         0djjbKDtwkFvcnfkVBhm8MenK5EqNie0UE8hrG+73TCYc+a1WU6nzIzZzoqi5AQQG6HW
         mEy8+RTUn2hmnRfscO3c/11+XvH0XHKvtnappeII57m+KpYN4HoV6aPyK07zvzg35wcZ
         zbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769003638; x=1769608438;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
        b=XBzyuMeHSURjaENbw/7k2vcgXOCXnmPCwoDZxmGrPRdQDjVxoRgcCV6dq+OhjBHySy
         FBjD7b1e17sroyaMIKWSdJgMqfniZY+GOm6OlGjs9TlXmhvA9w1EqQF1ndHAMuRXnoVK
         Rn23Y7rl5IupOqQ5N2Qzk4NGfsZVzGavuNzEONnSJ+YWrvAElDz8ZJBDOOjV3hthu4hC
         8T5jeHDtQ64mYyL6VvcurE58gyWGAg83DHbt6/IVeuD1HNzUDhSPvmMZMkC2wawvb3FY
         yzfFD0tx7YWj/heegG+2Oma7o6bmBfOOOELSAmcLtWSlhycAys3zdVzE5gZuGVBFRMiE
         OVuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyVMyxjIC05F6YTmtAUlu3aGUYWgvoUXrfuCyuKnW3tFfQ95urxdQYytGslONch1SCwO40bRLJRLVDvGx7@vger.kernel.org
X-Gm-Message-State: AOJu0YxPilusiOLBV6E4rF9QyqpF6R2oYawfOab7nLOv5rs+gSUr+Tp9
	jSwplJ4AUQYXNnPgQzZ/0xDa0J+wn/5RSodJqvFMfiGidLRWeKr+EkBxkT67uvoIxvr+Eh3qXVc
	HOgkpK/4+PlOojv0NmOdd7TcuB/iNtbrAdq2PPR4idGFcIqXPwToiOTmTNw==
X-Gm-Gg: AZuq6aLX37r0grIZbGi1v4YcI6pHIldch6rkzuR226ZFgt0+ZKWyESpgER2K0F3p49c
	5Al9fhxISzJx5p7+XPmO8XwjbP3NNZoFa9CWjLHiEwH2eQvMSXvCKIelTga6NmHobGYGUphaqI7
	NbPaVA5QlqDg3k3DlNaBB9ruZYkEHRHOpR5NbRIIwIvHqOsItw/vDMn/01wNyGWZ2wa2R9COUBq
	OHdqMEcSeFxkVeJNYPgKuwMf0XZqx9N3FDnQfj2pYMpalrTA3xOSRzwLEa5XEt2DJACTkk=
X-Received: by 2002:a05:6214:20c7:b0:88a:2d3d:7c30 with SMTP id
 6a1803df08f44-8946391a3b4mr81353256d6.55.1769003638378; Wed, 21 Jan 2026
 05:53:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Jan 2026 13:53:46 +0000
X-Gm-Features: AZwV_QjWvOm4jhP_1MnP0BOpEkMXmJHcaqwrd7h9g8bJmPr6DwH6VeirzSgZgdA
Message-ID: <CAPj87rPFGLSO5cecUstZHEYdjjihK2Yx4d8PGCYirNixxKEt=g@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Helen Koike <helen.fornazier@gmail.com>, Vignesh Raman <vignesh.raman@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Federico Amedeo Izzo <federico@izzo.pro>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[fooishbar.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90027-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro,vger.kernel.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,fooishbar.org:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,collabora.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 108FB581DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 08:41, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.

Ouch. Thanks for tracking this down!

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

