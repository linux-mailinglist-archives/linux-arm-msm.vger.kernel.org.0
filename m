Return-Path: <linux-arm-msm+bounces-95250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNUuA0e3p2mMjQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:38:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A243B1FAB4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 05:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 033F6303707B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 04:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23FDE37F73D;
	Wed,  4 Mar 2026 04:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a4PHeZ54"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD749364EB9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 04:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772599107; cv=pass; b=MFYMlj9/iYZSwhnT/dvC8aKdJqvEnc0wn2x+x4d01KkpHSZbEUcEq24n77yuKr4HOY1i2M97Wv8lCgZ8RpZrODMH+s8fZt+Wc/8GagxbYqUemOvOFCecq55AtXt1+TbtgwNek/xm6iUSL3aCol3ZR0XWYNoiuF2kXrMNkRjTOJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772599107; c=relaxed/simple;
	bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElLyxTWvkLnSmsY79vV+fQcZpPEWvUoFPEPTdGUO4sK75LOH6gHGJ+bUxgTbBnqCx4sDywGvoT4jCDJyIVpqDxPzP8yGSnJ9D2b2FT2I7zohkQ+BUkJahufdourq8VawcdsZ9Cx5idQ2ghNF2zzVPU8pBf/hDlaqvzaXOBcNpKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a4PHeZ54; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c5b40f60so475336f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 20:38:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772599104; cv=none;
        d=google.com; s=arc-20240605;
        b=AfsWkgRetGECfJ21MjqsyJytzOnwnhFmeTo8WdpNRXDKMr8Z7M+6uD5WfExohlc6P9
         HmY4g7ishSD/BBddFV2GMZ35/fgdJkYPU3xHcBIn59HheISKNnuuNYXH9t5lO/5uiTSS
         SV5yAJ7vxcC6G28BYbISuWDEP5b8N1fGqfEUZNiU8YeIAO1vz40HTEyEiJty6WuTn1DM
         vAgfV7UQJ5GHJNvEtgGoahLR/NZjKyVcLcqsfzrkIy90WkyWujk2YjJqEOsYtXi28WUZ
         nldKP8rE8tJ+19FxOJLyaPyJzKlD1hG0DMULMZ1Gm+wwbLIvQQr5MvQUZS3G5oQq0g/m
         NdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        fh=OksydBvkN1BC8DAm2gJjZa29WoTMWitrMCfReVoc2X4=;
        b=JUy4huOgiZSd5S/sRvmaf7y1cb6wYPuFUlU/x5NtO2+bkvBCB3OxSVKtLotL/ZlnRQ
         1KpQi/UCP8IMEiDGbKo12AZlsyQiXrO0l1+ECAfTIU5x1TjTx5U5hRBWTDmDxvqNsTU3
         0hD6y4iTfkuojgk8pKX2b1Rj4b4DXtshJwH7530I22pkClRa3RV3E/+2CkdtcBDL/FH9
         XAa0LAXfgCttPoaUf4dZWICnJryvhYXwO/VXNBWwNhfp9sUJOrOU9aQQ1ZUy5ZEO01Xr
         ulIlCLajhIpGc4XXYJmKMC5duY2D43KsAM/mjWv8dXkPlio1KUxry84DYSoau8tzyiah
         pIBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772599104; x=1773203904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        b=a4PHeZ54fqu9d5dVPFbZdcYJfKNZS+n8sza8UdDwvU8W4oplBUnUD/bOWYZp0p0nZ4
         u1LAKHQE79lkTqYphT2+t3/e49W1AS19x2WUd7+bHfgEe/E3B/ppmxlX+nZIX2XfPe/n
         b7+ojlG9jM0Ofo2VjunjkP5jdv8235577BTSXAhOqVXpLoUYs4X7f8+SIatthXA/6+Pf
         pMvaHpKvauMBQWkhefcxnwmYRGG7Qy4M3RNCZU0aTW+0NVtocJaJSmw8P8+aolqnwmzG
         mho1yrTjZREPRgcePSHNq5u1HbckRqF6Vl1e0NnKm6auw2GlJ2mUy3/fjou2iDus8S0f
         wdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772599104; x=1773203904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMq/66z83Cb1wYKbJHyMR5HqtqYIMKKZ69NE/x8vY1g=;
        b=uj/VxFHedI4w/Ml0oT5bIEFhl8B9Gj8c9mHr6xvjpotjFYxoor9tUI6EdHMjPglA3y
         ZhchNpO5/wk30TX4KaeBbYpBRh7N718VTnKs7FJ86ZFME8YyVg8OjxNZE4E+eMp58XzU
         rMaxfiKsjF/E60yDrmGOKxfYaAbE6wP4fb03G12jnN6qGkowfMLAXTLMAw1kzA7pipKM
         dlgSQtLY4RLWIIkZVnsla5olPdRoAq+8Gln4Niu9niUqmYNOuNMnHrqBfwoRO5rCXoqe
         V8RSH1MgjitD+T8OzyBfmyo6+5x5a2sekVVOIdN1HTx5yEx8VaADjtoo9XRgjTjSTw3R
         VaOg==
X-Forwarded-Encrypted: i=1; AJvYcCXXKmftoiN6Nsz7wwiqX/CScAz/5pZ3n84ohlwhkPAC4exkzkXmFOGqqkiZpedksE95rLea8rynfajdN5+v@vger.kernel.org
X-Gm-Message-State: AOJu0YyQC4ps7o41ePKdt2LQuzdhqGRX2QVQfioDZuwPxHx2OQPG3OTp
	8L/T1OKFZyKPkkNUBKQwVNyWB29BfrzJgUutSyGAl9YCPEfrc1dvOn6qqqKOPYgt/fFUf416T9u
	fLyhYuaut5jwyMJdN5Uzi7cK/hGpYTIZreOKGz+pnUQ==
X-Gm-Gg: ATEYQzx1lVrdBTcJhKIQQfigVmXjWvqCbZdclBHp/fswP5Eb0K3INQ2QyR/J8oHhdzP
	OQoI8qPF5Zvyq7dP3sdoi3GAOQ45ssi9/Jf8x5vn4EsrG8AR2+bRMFkA4pHHJiyBO/Twp2PRSgc
	HI7UqcDC1s0Qik2bmzaIBViv4wDBFrYIG0+YYvHbbos5mzyjkYnKqw65vDP37JKuMiaN/IlNg32
	vi4vv8tQUpSSeLK/bWwutvIljwFTilsNptK515PsmWp0m96PctDbAY0Dvn68wur8y6doMG9XlWu
	FC+BNAqNkiFlVuyBsg==
X-Received: by 2002:a05:6000:26cc:b0:439:bae9:6151 with SMTP id
 ffacd0b85a97d-439c80100b5mr1233744f8f.48.1772599103909; Tue, 03 Mar 2026
 20:38:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-3-95517393bcb2@linaro.org>
 <06249a9b825de30d1fc19fac873840ab3cd7f6aa.camel@linaro.org> <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
In-Reply-To: <j46cw7ns2jvcojavsqw3f6se5zwjt6lfx7z5ahy56owtrwd27q@ufjrfwnfk453>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Wed, 4 Mar 2026 04:38:11 +0000
X-Gm-Features: AaiRm51B2RI4RVd1gpKraSUcwk1_GGIfzTP-w_kfBb8uww1EVsubpX8PXY_AI10
Message-ID: <CACr-zFAZELW8rL2ui96G4nPDnmtxQ4X5Q47Ha4n1dF7iHcPHYw@mail.gmail.com>
Subject: Re: [PATCH v8 03/18] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A243B1FAB4A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95250-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,baylibre.com,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christopher.obbard@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Dmitry,

On Sat, 28 Feb 2026 at 07:17, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Fri, Feb 27, 2026 at 10:01:43PM +0000, Christopher Obbard wrote:
> > Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
>
> Christopher, please trim your messages. There is no point in having the
> whole original patch to be quoted if you are replying with an R-B.

Thanks for the hint, I will make sure to trim my replies in future.

Chris

