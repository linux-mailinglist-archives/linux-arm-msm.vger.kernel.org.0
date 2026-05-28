Return-Path: <linux-arm-msm+bounces-110051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJubGOa9F2qRPAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 06:00:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C195EC594
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 06:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2FBD3001F95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 04:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092EB31353C;
	Thu, 28 May 2026 04:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDv38uPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D2730FF1D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 04:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940824; cv=none; b=dT6m8WT39DQiWqt5/Zq32t/zwWVppOyMowqlLPTKFQn7+bMXVISUjIMYVMqx0EEMLq3XQma0fuXfY3CVJPoxdiUWBaxbW3dnBpORwQVScl2Ndy69IJhpfbIGAWnoicwqxzc/GwceLcVragxza1yDAGkVAYSSr66QuymbfYgLd3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940824; c=relaxed/simple;
	bh=OC2scjddsaFcqRZLFYVh3vgAxL5RdPt+CMo39s6dN84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwaO+5jTA+unsLoG86JxFmm3L5H+cn7nAZPd31oAsh0PUELJ6mDY+p4c7zk94tT7PuFv5JHNrEpIFod/ZtjZMG9UJoLg8w6K28/ELO+CQAgZ5ElSz1SMPPlQ8nLfitKNECihr8HRB2o53m/Ka6CW0mVyy1z8U+dPHFXrWELajQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDv38uPm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so5647488b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 21:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779940823; x=1780545623; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FPE05wilTfP4Nb+u1gX4DKgV/KvnwhazVOd9Rup8C8=;
        b=pDv38uPmI3B7ACFf/KOyfnYWeqY4NmSzy4ZVlqxX6ich/x/c8HN7YQVOPfC7wxG7CT
         XvOOR9rXl18T2n6MyUMflc5dM20Q7fhlzk7arkwRLDC3Xj/goL+nyFscSyby9+sO9Yhn
         p2mVjLFE5f1FKLNyU19VlgX+ukunUHPlaFxbyiNt3YI6Gy9LSAYsDNwHMHi0WTgqLq3m
         UDHNSch6IY/2TqfQ6DzRXV62GtJyP8LIWal9oE9xksg3t8TgoSimqBpviGx4LKXssOO4
         8Q4gYozLMHneGiCK5wI3H5hSA4yITj19FbZp7MIWWibytl+aqnQr6nTjb0SsKZYf/UjU
         LTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779940823; x=1780545623;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FPE05wilTfP4Nb+u1gX4DKgV/KvnwhazVOd9Rup8C8=;
        b=tGWBu8gcy84Z15EUkTZ3Aci5rpAFFie0Fx5bM04prXZ8AUhIAjooqhv4fR4c+px4wd
         lN4ul2MqrtZ5RdN65dgELwikT1VKVdQBW2C7IvO8PVkbSBwAWAH3fn3YNlJ3S67/moUb
         rwiNqN3BikpTiJIGxveA5EiN8PeMKVRs7Q+cWssYHcg8cQSfJdDJmVnuJmWQN/1GWdYb
         gFSQxXMeKBhhOzKqPY6G5Nte2HLYmMqMHv4h2GPdJIpqvzOells9BC3IiA6yupzpy2/c
         VWvHmpApHmUfwiF2Q4ERrBTeYcWJ5UEC+R8RvYM/CI7+v1nyljEN63mohA1P5dlZJeue
         7I/g==
X-Forwarded-Encrypted: i=1; AFNElJ/fNhRxm/mI10l/YrG8suVZQZSPmYS/AA1M4jY+0XajkawxZ8fWoLRrH0AQOCJFgS1Y5SQQCO5YuBgICtJm@vger.kernel.org
X-Gm-Message-State: AOJu0YwXhj4nRQNn+rKJvGh1jHKZAzgrSw4IAPwlT05ADkcAYV5g4nvg
	iTny5h0nOL9I5lp7uCuyl2jw74OVjn7Hq953C/rRIOgYI+CAVk0O8Z/H
X-Gm-Gg: Acq92OEvlT0smPtZX4qOQIhthJOBwl8PnZebZBHtvTIhYlMvW4PHewG1UMB9Ai2h9IC
	NBhTF1JGYh3Jtjm+q7QqGNMlpVGsLR7qwXnxvdkqmov3mB1kVDrVruuopGs5h9kVGCKcZppAGJa
	8ELLHM8TqkIXy9syhRG2s9Z7WG9fWZthCNJRjv8hvyKL1e8wlULYcnCZb/FVRPtB4JvUHZ6AcFb
	L+WfJwujbOWmgw22ZgEk4rDYr42jiOeVIhvaJE37oRI7OPEv0nzf8HK17v1OMH1Bs98KN+2Z9TM
	OsvyjUe3A2DLMyE57ITOK8hqKTTRwbtQN4/A149fsJaLsNis3sGo+YPQbjVoam3AwHvSjmWgZKP
	tCD+D6/HTO/BeJMJrdX/Q1mx+6TnPFhL7EI2mRMYapnlOesZZ2PMWvHH5a4vJfbAsnN4VZzIqLm
	U8lSD0fpmvqh6XkuzUKRi38xry/4xrEuUeOb5URsFskV/RqEI=
X-Received: by 2002:a05:6a00:1944:b0:835:36e6:72b5 with SMTP id d2e1a72fcca58-8415f0e8804mr23044450b3a.6.1779940822418;
        Wed, 27 May 2026 21:00:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e81781sm3885517b3a.9.2026.05.27.21.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 21:00:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 May 2026 21:00:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: watchdog: qcom-wdt: Document IPQ5210
 watchdog
Message-ID: <3d285a40-b371-4e61-9648-44c2fbdcb3e5@roeck-us.net>
References: <20260511-ipq5210_wdt_binding-v1-1-859003d48274@oss.qualcomm.com>
 <51fb3abd-998c-45a8-a058-ab9185d6fd7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51fb3abd-998c-45a8-a058-ab9185d6fd7f@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110051-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email,b017000:email,roeck-us.net:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 33C195EC594
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 09:40:53AM +0530, Kathiravan Thirumoorthy wrote:
> 
> On 5/11/2026 4:19 PM, Kathiravan Thirumoorthy wrote:
> > Document the watchdog device found on the Qualcomm IPQ5210 SoC.
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> > index 9f861045b71e..21f6f7db7f96 100644
> > --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> > @@ -20,6 +20,7 @@ properties:
> >                 - qcom,apss-wdt-glymur
> >                 - qcom,kpss-wdt-ipq4019
> >                 - qcom,apss-wdt-ipq5018
> > +              - qcom,apss-wdt-ipq5210
> >                 - qcom,apss-wdt-ipq5332
> >                 - qcom,apss-wdt-ipq5424
> >                 - qcom,apss-wdt-ipq9574
> 
> 
> Guenter,
> 
> Could you please pick up this change? The watchdog device node addition
> merged in linux-next[1] is triggering the DT binding error below.
> 

Not yet. It may sound trivial, but I will need a Reviewed-by: tag from
a devicetree maintainer. Patchwork does not show one, and I don't recall
seeing one either.

Guenter

>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC [C] arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb
> /local/mnt/workspace/kathirav/upstream/linux-next/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb:
> watchdog@b017000 (qcom,apss-wdt-ipq5210): compatible: 'oneOf' conditional
> failed, one must be fixed:
>         ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too long
>         ['qcom,apss-wdt-ipq5210', 'qcom,kpss-wdt'] is too short
>         'qcom,apss-wdt-ipq5210' is not one of ['qcom,apss-wdt-glymur',
> 'qcom,apss-wdt-hawi', 'qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018',
> 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq5424', 'qcom,apss-wdt-ipq9574',
> 'qcom,apss-wdt-ipq9650', 'qcom,apss-wdt-kaanapali', 'qcom,apss-wdt-msm8226',
> 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-nord',
> 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-qcs615',
> 'qcom,apss-wdt-qcs8300', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p',
> 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x',
> 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55',
> 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-shikra', 'qcom,apss-wdt-sm6115',
> 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250',
> 'qcom,apss-wdt-x1e80100']
>         'qcom,kpss-wdt' was expected
>         'qcom,scss-timer' was expected
>         'qcom,apss-wdt-ipq5210' is not one of ['qcom,kpss-wdt-apq8064',
> 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
>         'qcom,msm-timer' was expected
>         'qcom,kpss-timer' was expected
>         from schema $id:
> http://devicetree.org/schemas/watchdog/qcom-wdt.yaml
> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dtb: /soc@0/watchdog@b017000: failed
> to match any schema with compatible: ['qcom,apss-wdt-ipq5210',
> 'qcom,kpss-wdt']
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/qcom/ipq5210.dtsi?id=7a473107f9785700a5c57cee69f60c19a9703f95
> 
> > 
> > ---
> > base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > change-id: 20260511-ipq5210_wdt_binding-9f77d959a28b
> > 
> > Best regards,
> > --
> > Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > 

