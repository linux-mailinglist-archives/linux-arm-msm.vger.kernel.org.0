Return-Path: <linux-arm-msm+bounces-99910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAL8Bp8RxGkXwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:47:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9197329570
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 078FE303B01D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244693FA5DD;
	Wed, 25 Mar 2026 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgWQ9VuR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BCE3F9F42
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774457121; cv=pass; b=cYAQgpXn89/KPZ1oiOoS5NldxUGFrX58qcdldL12+kafNviHauLXnW+PKuAMyJ7L7oo3TBtO1dbIrVw1GRnOEy8lYeaLIz2beA6YXxNAZAQwkj1+LXQxZjUR48A82zq8BveE8CM2furjzwtiq0/gdmons8tWHWpZSUVgk5kuKbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774457121; c=relaxed/simple;
	bh=bXhKFbpYfRsNRVt7ICqpN4QU6L2WdsLw2xe7XFRwToc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q022N5g0YKXM4Ub8+r9s4JW5mwD5g6LGqWZ8/aSjOXIrKa8SZxSrdOV7npIiVXLgP0o4GbLr2GzdQ15A2CARpCHZpF6yZC0BmSOQTpPdAJcNkOOdsKBbmDuAy/rZjmFFKj8CyGBrarlXEnoOJEx7qQae4+hPlVtG9jlWzq6Rvy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgWQ9VuR; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a279ce9475so1053468e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 09:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774457117; cv=none;
        d=google.com; s=arc-20240605;
        b=Yg2r7PuZTZKK2Nn3r2aGZ1t5Jew9Eskl459dNnFociz2pdb02Jqb9XUYuzHKw5SW8i
         zqgUKCzmJUH68si0dmB6N/m3qy3EhVIzbBgdt3fNGOhXCYfaxEZ9k+Mmr2kCDfvu95sD
         Zia2W/cDGBuD8DDMQc/y05c2Xll2u3E/TJaRQqJ66KK+ybmr1jUSWobv47OFD1zfkLe9
         p5PFdYMKgISYEAFNNPjePUtqTQ89n3Hce27v+9ESDFBf0YZeqH7LIuhpkRGcLgKnrs/Q
         +w38QxskrQgWGTPXqiXQK3kErNj7KpAbxLEwaUfT0TMm+1rMcw2YJZVT7CUFZu2RntB2
         MuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w8/VbjDDHOiMARELyvArbMNY9dfsY5Wb54POTD3vDT0=;
        fh=z2xc1iX5v6yuSmFh+0/NbHtQ8rVV4gF0EitN1jxIPFo=;
        b=aeuNJ933KFmajaz/Y3bICxCxUG8tIUCj+2g9LRM4IvABCP05Eh/mcLfAgdlMkXW8Lt
         xa2ASOZsIK1mU8PSxbiTQTgyBFYaBR6wu4QkMxc/4hj2U7c3MsEhGQpPA3oRs+2bSt3Y
         M2LG4Lpmzi9ggSeP7fsqjZxXLimXV9jVJNPaUII6P1UENCzGkMf9PqgeA9rUix28dwGl
         kkr+mTzSs2NPB5Q4YOneE0r3+eNs2hhDISFtPE9xX+MlL41ZHlk4Oxoq7LgtcW5uXaqm
         lj2aVy1URkoszTpunzoV8GoLh8Rp7d+h7xL1dR3oqqStjr7ZL1VnLmJ8FW+y8fw8j6bB
         wWBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774457117; x=1775061917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8/VbjDDHOiMARELyvArbMNY9dfsY5Wb54POTD3vDT0=;
        b=WgWQ9VuREa7upRa+nBSxON9eFeSA52ulmspoKkrM4Hw1FVPiC6LFrqqxG43RM8pkp6
         gVG6qbdvJAOMS0dZzV1e1yYktwDb05lyvjFGIae87+HYtgyXxBRbxWyfNbq+hZ4OWwwM
         heEqg5hXbN+dc+14eZWKmsK2BDAnhzktREGmktmhH5DDoUAX2fw8qSfGxSmlSvayFhnb
         dt/eBlNazlei6jnwmA9V+ompi5EKSnzltjOvfsQXek+ZDyoxHIf4GQ3tm2NyxLIB84kA
         jFvWsetX9rV9bICFgZFrSHeafP1xwH+vVfaPjnCNscy93FkLgJek879fgnfrd6bMUuOS
         toGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774457117; x=1775061917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8/VbjDDHOiMARELyvArbMNY9dfsY5Wb54POTD3vDT0=;
        b=iHFtIrmbTQdxVUgKIAq+Cb6vH04Eq4BmKQfG/i3fxWSUnGR0CyUaWbK4C7991yVyV/
         WmPqHUYtDz8X6hPjnWLe8+w1dM8PEtQUoET3CkcSXPmjkh8vCVe04fQ3kdrrRxqPCRTt
         wcQbpX5uyplUBQH8iE5NxzWrEYrerufS/VlMCLautZxSf+qpJvqs/lTsAz+UTz/Si6Mb
         yVI5ssnLFUZYeBXRtuK3Pu/Qrjkqf4YL3OzP09egH8FWyPSRMLSTDNw9C6eZ4U8lSD9Q
         BV1BYoy/WPOVDbMKQCZIKqXdYgJtxCrK+4Rs92siEIQQxlZHE9MTq6lZz1JNDD6ckJ/h
         cZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWZUhRi/pvMpMK4H/2/tKueXkxBAfDxrUWD6Dlmvvi/OqXP39fqNM0fjS7p6Sn+QeHiNY46wFRpHqMYcu8z@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0nRUCf2xLeD/KeKGjSmhLj1KsQXVroCJiuj13D17mK0TkrGfQ
	fvMkeJ0p4wojPmUy5sG6grkFi8h2Mf+Xaa1AefUSK3GSeW5BDtSbte9uSk1eEvdkWxKidY3r0Hs
	9gFmodUcGoIW9gNN40qw3l8LDbJvKA9U=
X-Gm-Gg: ATEYQzz6E013Gm8799qreafWV0Cp/GGsgImU8mCyPsoRE2cztPYGg8F3SRUtTHkE1Fd
	93p0WFJ4uuPAsJb7s2oi3n8bdqoIQosGRV/EJNyaswTXVG3hhxSb77pl34axu3v5pFtwH0rWt1Q
	4CoNQGAZFSVLdOAMdNnL1UO6HO9/wMHpgLvZliPz7gQgHMTXHZ/Y3dV7SBsECUrNC+dMgcQZLOG
	nNlzwYcxq3HkEFiWiTu+Dt21j8o31MvRs1Elu+pLaufgyyBPGBecjcKbTw0kla0L8VWnH9J//Vm
	Ar7CfyNgRZqevVKOOBvWHIEOdrHRyApgyeMbLOpFGpZvMBQeiQqc165A0BNMH5WRT9yk
X-Received: by 2002:a05:6512:3d29:b0:5a2:7b8b:8a80 with SMTP id
 2adb3069b0e04-5a29b4ef8a9mr1784091e87.3.1774457116829; Wed, 25 Mar 2026
 09:45:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323-ayn-qcs8550-v4-0-33a8ac3d53fa@gmail.com>
 <20260323-ayn-qcs8550-v4-6-33a8ac3d53fa@gmail.com> <919a157e-84cd-4588-8557-64542fd08e7e@oss.qualcomm.com>
In-Reply-To: <919a157e-84cd-4588-8557-64542fd08e7e@oss.qualcomm.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 25 Mar 2026 11:45:05 -0500
X-Gm-Features: AaiRm53bjqDbFTUcGFnKfbzKfzKSDPwXT1T1vWRH26ZyUIlh2rF-Fh8Y6mZcsr0
Message-ID: <CALHNRZ8xX8BVKHFkHXhB9AWXAi0KfWoJmBEa_STznUnOZKiK4A@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: Add AYN Thor
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99910-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[webgeek1234@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sobir.in:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9197329570
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 6:09=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/23/26 5:27 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > The AYN Thor is a high-performance Android-based handheld gaming consol=
e
> > powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> > AMOLED touchscreens.
> >
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
>
> [...]
>
> > +&{/} {
> > +     model =3D "AYN Thor";
> > +     compatible =3D "ayntec,thor", "qcom,qcs8550", "qcom,sm8550";
> > +
> > +     gpio-keys {
>
> Please override gpio-keys from common by label reference

Ack

> [...]
>
> > +&mdss_dsi0_phy {
> > +     vdds-supply =3D <&vreg_l1e_0p88>;
> > +     status =3D "okay";
>
> nit: Please uniformly keep a \n before status

Ack. Tried to get all of these last revision, but looks like I missed one.

> > +};
> > +
> > +&mdss_dsi1_out {
> > +     qcom,te-source =3D "mdp_vsync_s";
> > +};
> > +
> > +&pm8550_pwm {
> > +     multi-led {
> > +             status =3D "disabled";
> > +     };
>
> Please override the multi-led node by label directly

Ack.

Aaron

