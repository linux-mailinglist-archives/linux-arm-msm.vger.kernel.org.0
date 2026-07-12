Return-Path: <linux-arm-msm+bounces-118604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYhNKs8TVGoYhwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 00:23:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D77E74628B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 00:23:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b="e/CQTj4H";
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118604-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118604-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E877301C58A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 22:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7EF37DAAE;
	Sun, 12 Jul 2026 22:22:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BBD374183
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 22:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894922; cv=none; b=bBT/IlZMLQNuS6bspchka2gG9pUjgj/S0KgQ5toruP6hwspsQjdvbgsvaVXV7BiJI5zmp8Hc7ynche7GEgBEtyOxb1+pS6TobjcJ0RECWXLoASotTdlhLGvuuUCIwGxwyRV7U9fa1a50mSWdiDBjZu4eT8Q0ERmR7y4iyZiMA40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894922; c=relaxed/simple;
	bh=fGfuu5GVufwu5Qg5o7fhFLMfDUxFownesqiCSdLkQJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK8GkGiHIYyEppMQjnSmkPjuu4xIfMg7zVCOVCrBNQLbTC1PEbfOKoebce3eNGOQUMdtFbh3EU7iD04VygOGSpemEG9Ic3OlQLN0Sx4qlRLyBwQQYDDs2WmQz79CbQzWsvn7pKKnYUYV6d97ViadViCDMldz0jfeshN/WwIkLrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e/CQTj4H; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so19364475e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 15:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894919; x=1784499719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGfuu5GVufwu5Qg5o7fhFLMfDUxFownesqiCSdLkQJU=;
        b=e/CQTj4HijBiyYwPhL6Rlh/ftWug8ND9BukBCL/FoXqQnHY9ECmwEop/QTqT89OaNm
         8JEx+z8Fl57/tioNaoVLx2b72OJdGcNPywiY4d1v+EkkWX3GqJZD2rFKy9G1zegFXat2
         YLj0T7PrAzc2HxAMq9wvgeI2SoNp19HJ3Lf2ImiN1DFeezkyNsmfZWPcqXed52N6Vv9H
         OcYXDtMEO0qGSrov/jaBlmVmTzkhpVec0PTQhDHZgWScQ6fdAo7WMPAjh6PTU6xLyQc4
         doVFfwvhAKM4oxMB2lfQ/VZOoyhO03nhceahrPCpwzUICdPVCvq/pZ6M4i4I4Z5FgN2Z
         Y8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894919; x=1784499719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGfuu5GVufwu5Qg5o7fhFLMfDUxFownesqiCSdLkQJU=;
        b=QMKHdRuRuuHl3qBc6whUdMdKS/Fdxk3m5zhLupDQC0pNSenEDoCV9uhGSRXUS5b2Sd
         APAwzGepSX2S+sexmaomsSFzMCyM9K8WvAWnjpip0GP5QzCAxDe7kHhztEheLlkM/czg
         aarRacFbjBp/BXFg+RgPCV0RdVpUr4erxwacNaFXLuP1aYVRelcYUSUUcJ/KLHBbDHGH
         ShXn/0Ho4XkLlkEcSydahey4/tKvB787yRoq9mfUT7fUOd5Bywj/mZ6ZSM9J2KpLiPGC
         W6Ec0uwZ9919uH9tIgeo4DR7sba9qXmx7ljtr9MAaPNJuWexvntfDvTOSJr49pPdJwOD
         SN/A==
X-Forwarded-Encrypted: i=1; AHgh+RrBsMp/TU5r4vvKnqusk9M794ktiyFtc/URnZBSdg6FYOdPw2AL0Zn/+WhUbaPNRNDLcA2WGmCe0QS40/f4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw76THhkxT7k0GVFD3FUBKoJTop4Qjl65O9lLDtT2UcyP2xOFNB
	1ixnNZDFvUe1Q8ujBB9wD+3qoskDWzfd2YbjeanjG3MnLmde8bb0N8hkYrPcD2Ytg8c=
X-Gm-Gg: AfdE7cn0fBGWUg/f+m/4CPzHBGv0HGTsQvXK5aN7qZaLXNRGV4gyQd6NV68iaG1NPIo
	2Qga+FBM8rw6FI94JznGNvzvRlovZ7yDRA49iTmuZpS2eb/xo6Chm1sUX3kPGz9SVqAETKvji2n
	V7gDe3R+PO3WvYIMmt6nrlO1qxmbVdnSzo9Y7NOdgJ8ZTMm+PHF4i7nC1rk7UhwJF/nCCEqzFXo
	oFQCmQCoThY8P8fnKuq7jgxCEtyrbF4Yi2PxhCOVpX5m7SnDz9al7T8xGEDzu3cJHa10YkrNE4m
	CmvdlTqMrmcL6TVYjkklYp7x2DBOuFNurHTVgBtYsUyfeIxQyWIqWUPbBI4itABhAeJ7kE+M359
	Bx7H9pQpdJ0vEKbIMcSSyhLyohtovP9H3ITN7NmxLqCyfdGA2iyUlk0URwA8dR01ZD3vHCKw2hT
	xPUYHlY6D1E5laAU+NwQ==
X-Received: by 2002:a05:600c:6387:b0:492:7142:f46e with SMTP id 5b1f17b1804b1-493f87d8583mr74199005e9.2.1783894919632;
        Sun, 12 Jul 2026 15:21:59 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493eb6df417sm335220295e9.8.2026.07.12.15.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:21:58 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:21:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
Message-ID: <alQTdqZO2DX4-OxB@monoceros>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hjdzayijalqv5rgt"
Content-Disposition: inline
In-Reply-To: <20260708-shikra-audiocorecc-v2-3-b320d822cdd0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118604-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,monoceros:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,baylibre.com:from_mime,baylibre.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D77E74628B


--hjdzayijalqv5rgt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/4] clk: qcom: Add Audio Core clock controller
 support on Qualcomm Shikra SoC
MIME-Version: 1.0

On Wed, Jul 08, 2026 at 11:55:07PM +0530, Imran Shaik wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--hjdzayijalqv5rgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUE4MACgkQj4D7WH0S
/k7tcgf/Ug2JeXlzQ2GNsny9qgnwyc0tjIz7D2Ou7jyDzNQ+M4GuuV6R0m2+RRYJ
Y2YzjYfymF/aFNCI39xtr4cD16kQKhGg3mDXhxtXhwSPfCmdzPWWkt+Tqd9pIfDL
MeDVbTzwp5uhX+7BRpJQfjUxehs1WC2uMCIMFr6eldJZwGqZvj9jH+bCfiCPc1XH
/j4KfS+JQgpYW5a1dHcePxn9TlrPsZAfp0DPLa9G0mmzaClQNDuaLE208xssgWrh
F21F5d2BmOX/xl+cHn6FyM4kx/DmAFnSPpkLBOWU5K6yBJ0LAjhOuX0VIkkGnOkU
6wHa4a6ws2eR8ZjED1u6QzcB7ocu2g==
=5+8b
-----END PGP SIGNATURE-----

--hjdzayijalqv5rgt--

