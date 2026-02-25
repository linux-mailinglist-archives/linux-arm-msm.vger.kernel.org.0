Return-Path: <linux-arm-msm+bounces-94187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGrfDJdVn2mIaQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 21:03:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E97C19D034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 21:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B945301379D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 20:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41B82D7D27;
	Wed, 25 Feb 2026 20:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wxarhj9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40802D5940
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772049810; cv=pass; b=ZguN0jp8idOR8ZKPE6vyQfzn8nMtiPQjvv5zhVyiQbqgnDR4gqffgZisk+quzpWQXoe4YWnZbB2LlSZRXqQRxtCvwjXN65wsn1r51lWEPAAQmTaGnQ8dBbrlQOmbk74JtqstTRfDv5ftdnL3KJyAZUKWxkWSJYNvNGu+pEI7Joc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772049810; c=relaxed/simple;
	bh=YjjeQPKHwsysO3aIz1xIueVPmWB/NR0iZT6palKwRdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtDRpjNxgNmYWlr9XpHlLqJqKUZoxsz9d4DkPyc/EbKM/0fXaURxogHePYGJkThLjusyu9GycIo5fF3QQXg6U4zBPV14LGJ+4RcuGC+EYC6CwTUaBz12aQZJCV5Q8fCbSI94uTwbBkXQgi0EPM7Wwkhra8akxiMKCN1m11CCkPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wxarhj9A; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so48638eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:03:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772049809; cv=none;
        d=google.com; s=arc-20240605;
        b=d+IuslQN3bCR+sNox8kSXP8lcq61wKK4RZYJHTW1Rv4ZUMNB23Cdg+FeAd0tvSFb6U
         /XxciMRgt6TscsmjqYJgelWNPb3U4D9w6YkNrJRzDsXYAxxdXsWuUytsDOSaSjHP2Miu
         vJNMZT0+4GuQH8l3ESGC4yfY5tSvJizsV6C11/+Y4alKLH/KFvyUrF45t8MrMsCLHhdO
         FDoZeswyY7sMd2LpzumJjAz6cbfXZ3Kw96T2I91LZBnoVaWW40qIdPsrQNfR2o8H2gIc
         kI731X/6FFS00kfoVtBFbYkY9MXsXjHZgNDZBwvp6PIcjO7Dxj+IB+A3U9az+wjbSYMC
         YkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4kIyGmBg5HXoWLsRB0pfFO9jGQNi7KILjq28N7CKS3w=;
        fh=yIHY88VZRrqOsUX/QW52wd9dUIjW2TBR31FtiKdCuM4=;
        b=TYB9U2IGVSTtCkQpsR7e/WaHNFLGwZ9HdwFKWOeyjR2hQXp6YGRCkZTIbcmrl0btxT
         eB9TkNexb/GCUdSesy8KgNSTrmhq0W/pxyXQ4XvEPYqyuRcHFet9msyVqijZ8KaQVT0u
         3uN+/sMqNtOeqwAZMBXROQGQO0zsxYDbW8I3fxDRgmaZCveUJmgbYAs6v7dD3Tr9Kh8b
         tZRR+jJh6dyP2bQaV6r3OVCRodjQ6suXe4XMAgy/KLkT86JQ1B22KFoNFoBHbvunEc/Z
         Pxo+NOi5QYHoG4FTG3g41scKpROm4LS+u7/284THYH5tzIsdDzFuT+Q44FQYG+vbFIKu
         gx3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772049809; x=1772654609; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4kIyGmBg5HXoWLsRB0pfFO9jGQNi7KILjq28N7CKS3w=;
        b=Wxarhj9AuiGfLjxdCWtb7DkG+DBoTP306zQBq10XAgCKWNh7IzqKckblYeIDd3brs9
         /WAR+Dm14wjNp+Yoi9lenXRwq8/JtrAAyeKUEctkQuPu3bR5Gh9y0lJasz9vaNnr8FQI
         qZJr2Z0u1p0JpzrdNG+t+ulf9yu2ers11thXuWTsHI4wjtHGodgZKJo/YeSTUa2EF69S
         Xx8xa+aaYftSn2t9xkMiNMi4idAxAkuQ+CDTkqjOi9Ef82HKD0IaJ9WeHLNi34jXG8X7
         5a4uVIuQgiyQky1CmsCaugbfCiBqGH8CJGnEB2DXEzkMQPbUDSSVUrwdgdbD8W0toKud
         4j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772049809; x=1772654609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4kIyGmBg5HXoWLsRB0pfFO9jGQNi7KILjq28N7CKS3w=;
        b=J0zDtue/O0HgW7c0HJLaIN/sCrv01V3fa4JI0IuqA15eGgmmpfEo2yRffYnxgQaCzP
         Pw7cn+c/hW8PwKMU/qTVmaNhkFSZphqkrqf/nLdQPlLZkgxuYdo1dWLJgjyVoxwJ8iHe
         6C25xQA4qtrP8Mr6pi8qMaRdfytVVWsq4H0v97Ph/veVvB0c1hKUMIDpiZCAp/gL53Wy
         PpXU3DkUpXXRGYUivsvWKdznXavOHk2BcFTqH88M+t4y21RvJzusvcka0yVgdKhrN9XJ
         pArohRyVDqYqwnWugR3SLudOvjgBMW7b0Y9TdmIYH4NAfwgHnioF9M9VWbpSbiXnZSyx
         0pKw==
X-Forwarded-Encrypted: i=1; AJvYcCVvl7mctM89v8kSi+GgCtMIVzGe99cr8IGlTbJhHDraqDq48+yS2+k8/H50cj01JnDKBP2UfjlcNUHjh/c2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Y0m6rOrs6kyyJFORnnEZS19eLakW+dXxw/CzGKnoDEXW4Vd9
	/47YgIP9gfpfwNTS4DsdrRmZg2AhSNec6pdVfDq+h4/3pche2sqNqOlzSMJIu75xZsBNWjQ/zyd
	uGY+AoK3pTiHv6z/XhgvhVMtkZ70J2K0=
X-Gm-Gg: ATEYQzx7R5Atx8lnd/UuAYURXSzsbLD8ENUnhqnbP5YH9oBABM+aT2qbrCt6U/67Y3R
	onP0WUZgoR9ZbU9VzogS1Sqbl4RRb62FsthMh3sEj7FMEtSNeJG53cOmlSSJvxNZ+XhG+7DS4Ys
	J7eTbuM12NCkRAjEzxyxMszK15BurWkGaD/lzgh63tau9gJLG9S7X2LQZ9p5KlWXkH93p1TuREy
	x8ngZrLAVRDJ+ICEwhgdRbZlNrYKcD1q7DsVsVWtDm0YmDR/aet99kZ1vwxCbue8hxEK0or2DC+
	Tf/T3FU=
X-Received: by 2002:a05:7301:1297:b0:2ba:a661:8512 with SMTP id
 5a478bee46e88-2bd7bb55164mr6154017eec.17.1772049808589; Wed, 25 Feb 2026
 12:03:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
 <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com> <20260224-bulky-rabbit-of-courtesy-83fabc@quoll>
 <CAHuF_Zq=Rpg0HoRJv-BSREEhT8tYH4r+BCbZ7obrG36vSmwMQA@mail.gmail.com> <54abd390-113a-4c99-b024-2029c4d68099@kernel.org>
In-Reply-To: <54abd390-113a-4c99-b024-2029c4d68099@kernel.org>
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Wed, 25 Feb 2026 22:03:16 +0200
X-Gm-Features: AaiRm50pGQkXh7eSkSuu6niLp3TuwxMtUDhrOf8ElhHJQnJMvsWEsPN00BEN06E
Message-ID: <CAHuF_ZoEAT+91trLabyo8rc8afXW=Wd0Q9yxu_v53nXoRFJMTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?S2FtaWwgR2/FgmRh?= <kamil.golda@protonmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94187-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 7E97C19D034
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 at 17:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/02/2026 16:29, Yedaya Katsman wrote:
> >>> +  vddio-supply: true
> >>> +  ldo-supply: true
> >>
> >> LDO is the name of the type of regulator. Why is it called as name of
> >> the supply?
> > Can you explain more what you mean? Do you mean to change the name of
> > the property? It seems that all the regulator properties are named
> > foo-supply.
>
> I just have doubts that the device has supplied called LDO, considering
> what LDO means.
OK. I don't really have a way to verify if it's true, all I have is
the downstream dts
which calls it LDO [0]

[0] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/d3766fc8cda2d96de2850faa9ce58e5a37ea9f9c/arch/arm64/boot/dts/qcom/trinket-sde-display.dtsi#L24-L36

> >
> >> Isn't this binding exactly the same as s6e3ha8, s6e8aa5x01, sofef00 or
> >> any others?
> > Yeah they follow the same pattern. Is there something missing in this
> > one? I will add descriptions to foo-supply properties
>
> No, was rather thinking that this should be combined into other binding,
> assuming the actual pins and supplies are the same.
Got it. I don't see any bindings that have the exact same set of supply
regulators, at least according to their names.
I guess I could add the regulators for this one to one of them and make the
not-common regulators non-required, but I don't know if that's what you had
in mind.
> Best regards,
> Krzysztof

Thanks,
Yedaya

