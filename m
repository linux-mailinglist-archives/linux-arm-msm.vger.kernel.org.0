Return-Path: <linux-arm-msm+bounces-107272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKZJIihqBGprIQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:10:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB64532CA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 14:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05FB8305D018
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C781E406270;
	Wed, 13 May 2026 12:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCYB+wO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A4A3FFAD4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 12:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778674209; cv=pass; b=jv8V2yBWZEc98r76imIptq09ffyuVrff32EWsGC5mkGpx/1HBLaRwmtwlYMHdPxfUQ2Xzv1uDWOkA3K+HPkChO6/8tslpwIybkUYEBQaRwzt9marsa9xlPlFUTHhfNgS5VSYglZ+bOvXVx5hGMY/cYr2pLUWHq/x/JRpQrQlTfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778674209; c=relaxed/simple;
	bh=n0zVUgor7lvWPciDrZ5fzZFpulIyyAJJoNWui7A5iR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGYVL8iV3hjr9XhJDwmTc37NRmZrpkUHI7QXPTs+fBYfFJyThOqOY5hmGa/jItjLtqFf7n7A2ERBWYRbXdbkIofZBdr4it/LEFl16olnv+Adzk0q4k31ArpzPl5VAxNXxGIBvLJ1E3saD2lToQUtL0fQo1M7w8d3QuQXcrrZguk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCYB+wO0; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95f2b0bd920so2804481241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778674205; cv=none;
        d=google.com; s=arc-20240605;
        b=UUMlM0Ks6HLn1o4VktpsZ26ltYaTCcRHPbCx3AxL0i1FGHnGWZlPP38ZQu2byOIt2k
         eDHHEFWs4y2LsQWUf63S4optyg/dTQqGGxuhMUlJ2GFURgohQp0rlN5VKHJFS3Z6978v
         nRR5/zK4U0pzVCIokqr/EuxkhNTwPMeU57j6s0d6HffbTWjBHkxHEF1cFZeAhV+tDqFF
         KJWk8JPqUldRVKywSWA2zEhufZuUZbainmPq7Sn7Nf5tgffGEQpdTI+R9cFFBTW2myOh
         2ZEFqrromC1Jv+1uOvr9PsK0iAAM+h2mlh/crczxxY1VupzVLSGqjBb7uEEA+TaW4E2c
         eKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        fh=YvqJwRDXVg/Hl7vzFtiK/EPKcckUWqaa4cMg2YWsecI=;
        b=jN0l5/Gkajd4vb5fe5YYrK6lvQekfXcwjl98Q7enULW7escuxmjPejIDJ1TWX2hNRr
         0i32DVfIHbkEuyj1y2CvYu9v7qbEp3DTS45ICCcxh4G3fbUR6PbMGYO62aI+LKwa4xul
         +vWA631Ssf5mIJSBpSZmWIKiUZdrNfMurBo1ffoE79uTRSZql8OyQph8QJePxrpTxVXv
         o7Rb4ijum9tKmle8PCwc3sC6mJQIpofj1a0DjIWjab2I3UXfXFXuuJIvnLuWntiieKUk
         Q8BJYv2EVxyFhzSeZAlWE+ln7LfVqYmr+hmMuMZ+3MfoB19CqKU0wkVjbX3r295syT0j
         1oBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778674205; x=1779279005; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        b=gCYB+wO0Vjk0gM8TRvgCzUZgfJeRk/rcSWpNtrbYbOOl8CDACWO7ncXQBg+A5Z/i48
         TIQjQTLUb+drdyNoBtGHfSksYjpHg9ms7bL2kZWl8hbPaHgGrGnEf6+gmM/gG9t7ZCKq
         0DCyJ887g/t27B8dIBXKH38oZZIbJI0XerGKxfiDSEuUMz9f9hyeryryr9KvWviMP9ct
         hH0uarD51tGgLBVaTwnb32e3DKyTBlGehJaJMq8oCLLPelPkJ+za++8wxxTThxy8saac
         ct2eduaZwU8lVlbhpXphBZfDM8LaNPDzMG7X0eynmOrqKwq+zznKcFZedrmKQnAIXjqT
         Qdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778674205; x=1779279005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJuK7DvHMj1EAy7tj/RVkf9fqNfoJVTMmH7EDF5zYKY=;
        b=GwYbOp1K0/DHGeyzLS+HwoRFLBqkwfDcxiQXlNWDmw+PzgNy2QW60EMLJ23kQ1+ehy
         vl6bJu4hrvMu+49Imf+HLxD6mDowUkq5VYRrQ8QJnh+YKX1oHd0AQ6r1OKb293U7hrQF
         uLcANIExXA/aILBLpYbhiO2eOw4CSIGBhgnzT6jdBl5TYRt3dHaqYh6VEAAk4c6Ubafj
         qB9D8+GB8NU0FJRAnrYS5led95wc1zyizhmN6zk+829fQoP4C5l2dmE9yUt2LxvFBvkT
         ek/as+hcHHBsVIocewctZ11b5d8YpXRgYW6fxGSxHsj8WbzWSa9NIyavmiRIexoJdQDQ
         YoxA==
X-Forwarded-Encrypted: i=1; AFNElJ9RYIjy08V7Ohzi87rK1z5Pb+r0y3jAUCToASVw3BclZTbIdghVKx1BKb/L0j8Pco+LWS7/LH8owxcW4jAw@vger.kernel.org
X-Gm-Message-State: AOJu0YxH70UIK3aEx2itb4Q5aQC6HBKdIz5TFqRgH+s73ezTww266yLq
	O9P+Yf60yeN8uabNxLyfuuavLuuJPx4R7EHV/Gak5sVi3XQ9oy5uKwbEtSMwp+9ONj2FmEWs5zp
	SHQjW+vp94yYkJNouJu6mHhg1R4KNU78=
X-Gm-Gg: Acq92OExYKMPc3w9NmuJodsoD3Xo0n7w4CzmnnW7IYtZ4iiszXbS1d3zQwVIJZQk5U/
	2ACUGZCELPPu8ZxtO6qI3Guhb8bxlHb0DjR9RSdSs7y3zSYtOLsQt71uN1aaj8NKYxK7N3/XeNI
	6XeNtWIJAajMSn0j9FWfQojm2gvcLJ5/ACJj/DbBV+Of48QhUF2HPLriMaC1L+9akwaQ2FoQjTk
	nen4vD1FArBvRJCBRLC3Bd5AqnWKa+628pceEFW5Zl89nzrhulaXFoC0J1rf5zfcFCkBQUI/qIg
	9SfN7fkP
X-Received: by 2002:a05:6102:38c7:b0:631:d445:171f with SMTP id
 ada2fe7eead31-6376463539amr1094442137.15.1778674204715; Wed, 13 May 2026
 05:10:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com> <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
In-Reply-To: <177818605997.73000.9692910497119100760.b4-ty@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 13 May 2026 15:09:53 +0300
X-Gm-Features: AVHnY4LglPfFc_nbVIjyAIVKXzzO_CSHQSJk1Zv3noSm1yMcp9X7Hz7jaJLq39s
Message-ID: <CAHuF_Zr0Z+rP72fLts5Ar56XyY8VMROzE0wQ_S5iyO+A4YoMSw@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for the Samsung S6E8FCO DSI
 and M1906F9 display panel
To: Bjorn Andersson <andersson@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EAB64532CA8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107272-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org,lists.sr.ht,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 7 May 2026 at 23:35, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Sat, 14 Mar 2026 23:46:20 +0200, Yedaya Katsman wrote:
> > This adds a driver to support the Samsung S6E8FCO DSI controller with the
> > M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> > generated using linux-mdss-dsi-panel-driver-generator[0].
> >
> > The mdss reset dependency makes the screen work more reliably.
> >
> > [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> > Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> >
> > [...]
>
> Applied, thanks!
>
> [3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel
>       commit: 493cb869874cd301c370adf9a3f9577942c4f0f1

Thanks for applying, but notice that this is an old version, the last
version is v7:
https://lore.kernel.org/all/20260320-panel-patches-v7-3-3eaefc4b3878@gmail.com/
The compatible string was fixed in v5, and other patches in the series
were applied with the new version.

The difference is in the compatible, 's6e8fc0' with a zero instead of an O.

> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

