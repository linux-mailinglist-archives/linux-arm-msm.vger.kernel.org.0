Return-Path: <linux-arm-msm+bounces-117346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P57fIWEPTWqSuQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:38:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 648BD71CB92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 16:38:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=Z1UxS7Pa;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117346-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117346-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF964305944D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 14:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA359426438;
	Tue,  7 Jul 2026 14:17:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F341A781
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 14:17:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783433847; cv=none; b=abKst07EhWzMzvQkvNIb87vnRlwRobqKbbw5QkCIbNddjIBOcl9AqurJWLUzxh/sNdXGOvZ5IPN/ByeFXpAHbhNi6iLC5A+jKOJK6lXUmmOiKxvi/E7luJXyWGDqosQoCxEKxVmVYETuweQ5IuPG2Q1Gb4Uk7VaPf54z3kvY2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783433847; c=relaxed/simple;
	bh=jm3Q89ETvzF3BJNtBW1Xhay9s9laR0o6hISDLguLBB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlm3TDMuZ68zK99AASKRzfE8aW4Os4V9pDmuRLaz6pzD8OIVzB/mis7JhIjPiJC4Lz9kzGkLSlQBX9nzYkQ3BLZmRAxDOdHHkO0ZeO/rzMTR1Di2Jfa4xMeYJoLJtKsOxw+jZBRsCEaaQ+xNigbI7sjpK4ZM7TSLDHTgXaNMsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Z1UxS7Pa; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so29671625e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783433838; x=1784038638; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jm3Q89ETvzF3BJNtBW1Xhay9s9laR0o6hISDLguLBB8=;
        b=Z1UxS7Pa82INkm3qovtHzJB9fTkcMedyqBiPw71I0vVNMIVmnLgzA99veEk/h84Bke
         /gSKzc6jUFSOq4qDjVnUfxThgNg7soiFq/n5/dULIqZVCuvoumoJwM2HdG9f0IvQQ18F
         yP3yGHT9c/oGIfkPc6iP25xiCqPTReSXj22wRluOXt3mxZy+UmAzcsmMYAO98KgFM7lB
         kikoC3++2mcTmx9MBdYKXQ9FvX4s9B4vrq4x7s1W4igqZ4UJkzG2B8I0pmH/d2JWnYyY
         WIMUGyFlm1e7IqoCDdExexSxOsA7/08NtjQz3qpYAUYS9bh+d4ehfnBjSvr3xP+sb8XV
         MIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783433838; x=1784038638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jm3Q89ETvzF3BJNtBW1Xhay9s9laR0o6hISDLguLBB8=;
        b=o8MxtJiNR1W8tV0P/toJpR9NS1AA3wSvXUhWiilmxS6p/tVXBwtA10zv0733DkGhyN
         /c4NrgjRQfmWSQyQLziS6Xe3t2HGRKkJwWlXBATaOq1sgAthPHb55oTyvnh/gIvv0/zD
         bJMtu7QrMtCPmEbY2LH5gORnkhmhh/uEsZ9Kki8Ji/JWDkYIHStWHTaatZ7BJb2q/M4j
         nXpG14Qt6yjoirEKejeo/p4mVzg1upSZm9YcnTg5O+1uvajH1hc4duw1q72sQkad6jkO
         yC31sKo1eHV2CcajHWB5Yw8sA+B3wpaCipMT+Y00d3yX9BvTpIQ4K7XfQ9JMTstfPiYE
         VprQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0evRzfdGhE/0tnyusUqMB5MLFI/MeAerLLsUpbHQpWIzQhznvmOJ9broyA6+8SLM40AH3vT2G6uA/Tu7Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZbE29uXwfy/THmGFMOkpO6Xt1DPeOgu+uwKKeCKy7bBegzyG
	z5IZDGCpYQtxRN3813k1A3BKs4SRUrwTYXTKc5rRDU+kPE8mT872NsvX7XXvbtwBQcI=
X-Gm-Gg: AfdE7cm2w7sDXd+zrUCGDhsxwJY3lcA0hVC+t5i3PH4bg7FoW3WxmIrRhbU7XIiOlde
	KxpKpYCgCJ9TThR6z1zzzy80oWG7sHXq04cAMeEqBGYmBLQmuma/JLPd3LtGq7Qc+nZJSYuKQCv
	qL/sK459NjcKuACEMOSLtWz/K8Hpy+c/48hDv99UVHeJpDDB5QidmoIDs5EsbFlNoVSCqSHA63l
	/3WJ1XJO8kfLzZfmZ4VvpVUdlkX7GL9+/xElBaTtQz5K06awzECcq9OEIj+g270UTyClpkinc8R
	dPxCrGIZy3R1H84y0VF5M5Vul2EWdlYtU9CMQFNOpb+8tqhtSENYOBkMqCkIGr/bk3eFAPpVHRF
	O8oNh86MfRdNTj8KGaSbYvkw4ZUoBuxCNAMAsXUnjMFo9u3QSllCsL8Eh7V1Z3j5Cxwg0+RBJML
	+0PV+MdXa+dsbMJYHMprx2pf9EX2+bDfA4EL5MadJxFivHorD/OHctZ/r0XCghwY1ll+to3B2uB
	LHB++jpagyXLic=
X-Received: by 2002:a05:600c:5297:b0:493:d1e0:a4f1 with SMTP id 5b1f17b1804b1-493deffbf21mr62810545e9.0.1783433837670;
        Tue, 07 Jul 2026 07:17:17 -0700 (PDT)
Received: from localhost (p200300f65f47db045364d369605955d5.dip0.t-ipconnect.de. [2003:f6:5f47:db04:5364:d369:6059:55d5])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493e4ece328sm1454885e9.1.2026.07.07.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:17:16 -0700 (PDT)
Date: Tue, 7 Jul 2026 16:17:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
Message-ID: <ak0J9enIwkxSCZqy@monoceros>
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="it4ah3j67tlrz7ah"
Content-Disposition: inline
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117346-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,baylibre.com:from_mime,baylibre.com:dkim,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 648BD71CB92


--it4ah3j67tlrz7ah
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
MIME-Version: 1.0

Hello,

On Thu, Jul 02, 2026 at 10:52:56PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Thanks
Uwe

--it4ah3j67tlrz7ah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpNCmgACgkQj4D7WH0S
/k6ebQgAqj6vA+XM2rEqVOYDBn8xem4ZERrerDT/s1o5DbAjXKSiNq8TSWSupaVR
kxH+C+z+g6ad529Q++GsHBZBrFDd7TtUVOk55PS+MSgL8dabDHpX1D/tB3J0IAKM
766n6r1Xl4f5A2Ub1TdAcNQeoTKslYlIIMSYbdFly2vFzSHUBjlKaAC++9V7qGOx
OW05sKc7v7ugnUblleS3RsYh6Q5ntCZ7eEmFcZbv9q7eSLRhLlbDW92gRCvircyl
d7JCaiQNKPiz3ByWdDwnRh52UZfhlShQLnd6aXlA7Tdida2LACin1+x7ADM5oKfC
YBiHpN8wPiN/xC08/qm1aFg30+/G6A==
=MTaX
-----END PGP SIGNATURE-----

--it4ah3j67tlrz7ah--

