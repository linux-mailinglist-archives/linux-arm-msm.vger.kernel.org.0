Return-Path: <linux-arm-msm+bounces-113450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SancBiF5MWrzkAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:26:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78069211F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 18:26:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Atz5OOMX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113450-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113450-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49C3C30A6008
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F2E466B65;
	Tue, 16 Jun 2026 15:58:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF0D4657F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 15:58:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781625490; cv=none; b=ubfi/i46IkPMvyu48HW1J5lAdOCZp197CiG8TFAv7u7QmfXV7DHrBxROH47gNjrk0p+50u/Poq4KnPHlTlom5BHsN9FmMgkDJiS+fUBB+eE+z7fiiP1HS/IA70RIn0Lik0ipIM1AfGgTq7D0c84tVM5RmmZIfc2LZY8laLUcnEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781625490; c=relaxed/simple;
	bh=UPUTkSUeFk9JQeZdN+9Z3ErwNhCOF6+E9sYhpJYC5LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNnynMIfd+eN4qDFdD23wOS1SWLj4LYOvN15sMsdToRwrC3BwT4Jt7fbYcdhCAS+7nio9U4xf7suKtU5H5FSF9gPv4I5ziAzzJd+ftWZUDKKiVc27BY2Gz9ThIO5zlXaGKg/BY1YXsh2csEccKYIjn0IiLsr8RodmkdyMClcy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Atz5OOMX; arc=none smtp.client-ip=209.85.210.175
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8423efad617so2981491b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 08:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781625488; x=1782230288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNzZT7KE4X5nEh+XCCxZ3PI0TIseL8zd9TDLpDj5TUw=;
        b=Atz5OOMXxdAcx6Bx7uPbVhhss2EraRqLAnHXCN+OD0n5pEVdctLOntmcvc5Wu3WNew
         0/P2VsDIgz3qAf2MWG7/a0aZmqGC7XAGwolE4iLI3g7L9u7syA/6O9GOnmNsRgs4avuP
         aeQhipJjiTDxf7vvkOk0c4iWmvFXTChJMhU8Qdi66XTDKcVskXO/xtBSLnZgojARw8w9
         PuPx2emfZlOHse9kQCdXi4hZTtwXMeuFcGyJ8LAm5TcNNKdzFlYnmE1sIG1ohtYM5RDL
         bJBnmp2o4qXcbqevWvGm/wK/8KtOBfSwDHJ8MbM9BKd2U69MJq+526lgThdiZlbFMF7C
         DS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781625488; x=1782230288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNzZT7KE4X5nEh+XCCxZ3PI0TIseL8zd9TDLpDj5TUw=;
        b=ru0EBgS/3Hq+DjspuxSTOApBxRQhkAypS0WgFOrWUEZRJyFKYZRd2J7CYJCDcduf1k
         JWf1E3gRxiQKpbxLUBMwrEa7YkI5MG5msDIlwhtobczkk5ojtVSDTV0RrvMyBJsrL8MC
         0oTE2aWzQEhUWyrVFkhcxl3EU5SXptNVpQxyGjeLHUYOD+EaOAd9yYul88S3DuBgMKqa
         zgCq3arHAIvlCsEx6lzeJ2lAme/5k4HsvbuT00evrTnRxrrsU//sqpVLu1BUivuJiODB
         jkq+QozvCbdCujsEAlsXW1L30/LtrhyJuo0JKVks25laRRbMsecmW8CJIORu9CyQ2y4f
         iOwA==
X-Forwarded-Encrypted: i=1; AFNElJ86BdREmoJ11OvjKZJGk1Hjw7aw7fKhZM3+e2c1Kpvf5nDfWqfLnYo2GdVAL1m8CeGDyj59tFt9aig816i+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7R9RVS/ZjT7S/ky3FXGWvWYeQ10Lx6IFRns1yI/CT9sxk44hu
	oCqFmvSON8vpeWgbrTN+aQ2l4MH5vcLLbq/GOmkdJ2+uadwrQDAQjYkQ
X-Gm-Gg: Acq92OHTWsJV4jyIeMdoevlpI2aHIkqoLC71l0A5fh7uBdrIsgxzywrPp2rc0FxEFLh
	jIfgJP44KtzT2Dl3woKZva4HLMye+k6uahHbLg3IAnq7BE0cUAToOff/eGzGtCVGAtfp3xutz8W
	iBSeMNzau9jsoriXdI4eoDApuUjJ3ud3RegGZTAOY0FLtKivnsTge1CME3QdXVbfUvuGw3KW7s0
	OZeLF6A7hoBtCKpikY4UbgkvwKnfkmY63YCXYxnufq6ss/T2G7TEDwNtDj+XCghR1U9j9j5fV9U
	pHLsPSHhvGhq/h/Bh6XhDnwzLcQezhOnTj7SJntBne1iVfMJXoVvg7ERt4dBSwn6mR7HCiNS21M
	M8+hlzyp4glEocZ1O3h5vk+EgjOMUv5j55eCLGdiCZ4aUXUqXuN0wOLcCc9a4Gp15LbAdpUIhEN
	8NSBfLjUbcwb19wgg7jZk16wGYk0bYKnVqG9Yj
X-Received: by 2002:a05:6a00:1c86:b0:839:9ad:ee31 with SMTP id d2e1a72fcca58-8451539cb35mr4267441b3a.8.1781625488374;
        Tue, 16 Jun 2026 08:58:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9c474sm12423557b3a.2.2026.06.16.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 08:58:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 08:58:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Martino Facchin <m.facchin@arduino.cc>
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Message-ID: <eda65f40-5f62-4719-a4b4-63fc7e462fff@roeck-us.net>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-monza-ina232-v2-1-e4375ce652d0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113450-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arduino.cc:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C78069211F

On Thu, Jun 11, 2026 at 04:05:24PM +0200, Loic Poulain wrote:
> From: Martino Facchin <m.facchin@arduino.cc>
> 
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
> 
> Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to hwmon-next. The branch will be updated after the commit window
closes.

Thanks,
Guenter

