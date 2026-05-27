Return-Path: <linux-arm-msm+bounces-109993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE47NI/fFmo9uQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:11:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9605E5E3EB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 14:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70E98304AC16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 12:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76A73D1A83;
	Wed, 27 May 2026 12:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="ntepB5uB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784CC3CF047
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 12:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779883813; cv=pass; b=NwvavzpAQcDSXKfrn3KuH5L+PciMtJv2HgxxgyyorrtzxDXKvb3Nu1p+a7X8IArpunIFjqWLBZJ3emPdKZzyXJGF0umlXq379bFwihPQ24eoJNC37PWLH+aOHrTVSir9FQFkiLqawdgXCAFa6AUOpslrqa0ndCSKi5cHG+rZ0nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779883813; c=relaxed/simple;
	bh=Ag/ppvZoyTkNd7TYh9ViBMAuPSf8VD0l9EAIvyylsXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zz8qleDfR6gfU7uepcuRJYeqi6UWULjuH9fp46QIcWw9M9u7vwIMlBSitWfKZRNpb/ijN9OX69WsOn2lctGHv/WYzm4KMftzLfpExpRGzX6f6yRMosDN67pM/YgJ2zq94r/Q3lvI4MalI3qfkLK/W+VSFB0LGEndt4ACSJyAbjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=ntepB5uB; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3698e34a567so10775456a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 05:10:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779883812; cv=none;
        d=google.com; s=arc-20240605;
        b=ip+PPDUTWP6y45quYKSPar27l3NhSNaHcUMSHPTKXf3G+hNZoYeaJy7errXlRZ+onk
         KGGs3btmvMk9xPeD78GRSlsyLURZT0oucdT9qrGxv+qi5mQtiJ+he7CQGi1MGd34oWof
         Hk9xpmF/1ZQmY+n5dQ2fbTaGI+RxQheE6WGM/U1sP1Um7pJDT2WadrShSuZda3I6hLPD
         Czq7kCIryq8AARXhbau3Tn+Bbf58PCQm4f/zPEuyaXNM8BHfr1b1NgJ2wKR9WhFbJTtO
         O+tmMtu+eTpXkKVMDgyLrskyFbZM6T/wdFmDWiebIX2XAjBJwTAedcQ7S6i7bu+pEdLm
         OwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UA7H1cJ2c1rnFku0SEtcNXK2Zu+NtLZlyk2G3W4GAZ0=;
        fh=onc85ASjG5cc7m/KOwHTz7a2x3oUJMqsfgmLFZuxF7c=;
        b=VAfxl+K8/3RyWky9eAcWQgaUCjwTRl/qxj2pO2iUby/2bncXaqTVwbDoWnB9qx6oyM
         bNeEnrDLodAs/7A8RqumVBGbwDQltY4TGFySlhE5yisC2iMV/q4Fxf4+RpO5Nre4nr3J
         1Vcs7t8KUqws7TLtOhNr+M18g+JBwPIyLM/Zn/em10TYJWq9mWIKNlC5g1F1JkTWYBIY
         DRiUAD3SmqBoLSrhX5CXiQaMbMbF0H4mswfX6kPKKrIj5VQislvZbmyx45fDX96kCyTo
         4leyVpgryl4Oy1c9KtsDEyFZbaHA6leClv7H3Z4B06cggYXlxSIMWSxMquepBAc08uzP
         Mszg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1779883812; x=1780488612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UA7H1cJ2c1rnFku0SEtcNXK2Zu+NtLZlyk2G3W4GAZ0=;
        b=ntepB5uBnTFqtKlqBqZLMO84ONMrfHhjDdA6UK3aCJjD8W7KNNsG3JkMZO1TfFETgl
         Sdzj5iP1rdrjaZrvImV4OnhiEuKKEaW96MGbd56Slxgrl280Cnco+u9Sn+5hPtKrOgP/
         yCboplChk56QZvQKATPOWmuRnRzLY8hcI1j98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779883812; x=1780488612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA7H1cJ2c1rnFku0SEtcNXK2Zu+NtLZlyk2G3W4GAZ0=;
        b=oiFNro1U2NuI+gHEcUl6CZXkxVpFsku48LK42I9E0MivaYOWZNWD40ZUTB+k/BcSmR
         mz/IsHghmDoon9jb83nVjL5mSn+4R9ACCWkwQ2IrefdDLLO/VB1gWxPJT4B+VLvhzExs
         f0Xr4We5IO5cc3C8coU0yReE9xVP2ao+jG1y0hVtSsmrYwoK78lYqQGNmpuKUj81WHJ0
         yqPKF0O7Et/lgcMkfqcqWggnX0KC6Vn0D141p5CHu9Q/RkVBzBx+7YIC5MZHjTe7IbXy
         D5pnBe5+QBW2jh8bDEgeQCKbEKUeCBMLjvvamnJet9fzybJJCWXiuK9M955q7nJK4+ex
         qNbw==
X-Forwarded-Encrypted: i=1; AFNElJ8UBrgSOJWvr66ye9sli8U48hID7oWE/MK5ga3LW9Rr3r047ngUBtdwUNTaseNR0Pzp6cKKInQS8i4SoTEr@vger.kernel.org
X-Gm-Message-State: AOJu0YxbvOqZOAlXbv1t3Zuae2aSiY0xqbaI8PYzgyVyGhLd+ePcmrwU
	b4q4OBQHt6T+KUwkq9VV7UmUkTKP87YpJ0YnM+6aM+d7kUT4Ddz+EmMnmKrxGwuXNqQw2mkWKlo
	ic6MCKQwBi/tf5BuAXO0Xabc8m8TtA+dOBh75La2olw==
X-Gm-Gg: Acq92OG5Dgc2UWn7Lg5C29zA2cK4ZGS/ZBsLa/nMurDSlho+XgZAM9a+g/E/mrqmRu5
	5FL2a/ZlAp+2eDzvTmO97+8IUqR3rMjf0ZObwO6ASQPTx8hBDQdte+lAgXnQd7SV/ArR0+6SQQs
	HCogOXVofG9nW8v8KvP38UCbIkM/inDh0Gs3NnoPLmZqE4cyv3ePdkULf77IFs5NdHHTUB7AytK
	0xE/BSkI9QZiIfMibJbpFkjSYDdQ2TSPsGlfjAZU8Dwoh4GOaDG8vQg6GhtsV6JhgsP2k7LjJWc
	D897v8/P9Z24YiZPiSDBt+bGnY5wfP1neR3nlejMYE45ZuPE6jivBvYk84y/11znC2K363naRPt
	I26XPu4co9Pb6mr6qpDcPSMKHfVLStZ/sGFss/vEX4fKif+8dthYpUlNxjLJ0MS1kDdxgnvJfXo
	Ua+4FgUYt8dXZfK7XmjWZS/XHgDytJb50DUW8WF6wEyRECLojBajtzp5LzkoQ=
X-Received: by 2002:a17:90b:2290:b0:36a:72d6:8cc0 with SMTP id
 98e67ed59e1d1-36a72d6a600mr13729265a91.13.1779883811814; Wed, 27 May 2026
 05:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526112409.66325-1-daniel@quora.org> <20260527-rousing-wren-from-valhalla-ff5a68@quoll>
In-Reply-To: <20260527-rousing-wren-from-valhalla-ff5a68@quoll>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 27 May 2026 20:10:00 +0800
X-Gm-Features: AVHnY4I6MCuY7kwpxbvMADrGNNhVz2EWiO-Pcx7pgD4XWv5SvMjg3RBQ3ipHkCg
Message-ID: <CAMVG2suh+7Vh_YpZwjWCK3=yxAP_aNro8==Vp9-sD9T7PUFexA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: embedded-controller:
 qcom,hamoa-crd-ec: add Lenovo Yoga Slim 7x
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Maya Matuszczyk <maccraft123mc@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[quora.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[quora.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109993-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[quora.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@quora.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,infradead.org,kernel.org,linaro.org,gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quora.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9605E5E3EB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 at 17:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, May 26, 2026 at 07:24:04PM +0800, Daniel J Blueman wrote:
> > The Lenovo Yoga Slim 7x uses the same Embedded Controller as the Qualcomm
>
> Are you sure it is the same?

Yes, this is validated on my Slim7x. Both devices use the IT8987 EC
and Maya's amazing work found similar firmware strings.

Thanks,
  Dan
-- 
Daniel J Blueman

