Return-Path: <linux-arm-msm+bounces-112953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GGJ1EQIqLGo9MgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:47:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8846667A9B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 17:47:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sTdOWnab;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8579D307513C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 15:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F123A5433;
	Fri, 12 Jun 2026 15:46:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D438F23D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 15:46:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279198; cv=pass; b=M9loxhJjKXnkEy6gagHjvUdpSaWiEM42AmpZrFvl9MfV+oKpPWlNbHi25RU7XNXZLBCRv3YlqyBKM3nqdKIf8jeHe/KG8wj3mFsCUUZC84yLTEEmKN8R4FFIIAgO4E8k+8ztQIRVYRSkYnGASphsqr0OWMpZ/7KNGWEqKtUQnx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279198; c=relaxed/simple;
	bh=XmooFYO7MJjwuHLWtjcDdWHx87YsWZvV+Cm4GZY+JDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWBNlilAX4l6vO+dmj89s8Y9b+MxQaR0Nie/zz2UcfmWYkELjuxaBlYhOMXVj103qQ4S+JQswmC5gk5Ew3pSKb8jcvzCUl5xYpn1NhlEOU3HlJuwNl1dUSMJhs2kwke6f2mOqI33aKvBC6TsaUT6PN8Uhz63c9v0aw53WSFCego=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTdOWnab; arc=pass smtp.client-ip=74.125.224.46
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6606d5900dbso620531d50.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jun 2026 08:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781279197; cv=none;
        d=google.com; s=arc-20240605;
        b=MpyMX+W6F2j/t8HyLMBhoYgpwlnZwUFH0YfAhv+hAHMSRW3RGeWivHzy9YjvDIju60
         TbQXALlkxK/xfSN01IhZ/zStt3UrZ68scPkYVwHvjMShPZIgg0+udXviUh7tPqK0WdUm
         RAOwSkPQJ8Ud2cLnDhx0sE9SHlK0Y+BYi2qmVCVansPkzZKpv2PQkH4ozsPh8APB76aZ
         G/3YJgEn5jITaIHdGSzHoPBkIwZrS+2FZfA5dkN0DoTkvFYn87PsZR7ArYuseNL4rUFO
         y3AusGTNmCZuQK8AWDvlFh9RpteQQbwHwLOXda+2dJzbnPxtUn8PXbn8bhSXUXNluVol
         o+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        fh=aLzLYPnXIYarsZHggsVgzx/zXyP146aCoXEH8xGmA4U=;
        b=PxYLJq7r4tIB3eEAz4M45KdioYe6kKLYVrcxTgIlz0rfEBeLwRCwoZ4qK27xEJ9nwn
         jD63+h38BwgHznspYWsiyrPVCp0HdEv4T5KdaFLoBcqOV+W6mjYF2+B5A+1FmxWzTHKJ
         5Ut7o0t/iadVcq88Drj0s6c2DnSj7OaWRpfQ35v3W/znPvK9PjdkFAqJu77xmP+j1n7w
         lJzK0BxS79ZNBKJROwlKXaoq348jEiYotbNcOM7aoriBRoWHrYdGnn+h7YK0UBgUqOyr
         bohPGNVR2HVJKi3G2VzdmMVqh59PtaLiuVB1Cea1gEniqVCs8gUgX/CQQ9DwsrC0QseC
         R+IA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781279197; x=1781883997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=sTdOWnab2g/nh1baVfJVf0+ExYOqQkbNl5HV6c6yysAx848lONEk7gji7UUw0eNKEW
         o7kps/V46c3oCV93vWiFfICAnW9P717fSvdTkhAIiAqS0Tp9xSymDxh3R5vJtXW1k1ay
         M0ysBRooR/T8j3ywyOmOKbMkXAQnqbTNvILRo5gaTS97d1skNh4u+qOK3d101FBtYkEw
         PjjRHvmHhcsN5pCWiNoikggYRCivOyYBtGmEFJC8ZeOSxlgGHQ7DfYFKPwjjUqcTaxhB
         GXKXJknq4PtqUkxAmcK4lZ+EqVwlXgNs2ST1uOj5ghTFA2W9fFbTNcXD5gga/3vRN3vD
         GLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781279197; x=1781883997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6+TDJXVkZEdcmhC7QL7gnqoMVbu8ebFypn+5HhBnCM=;
        b=oJRKixjiCk4TF7x4k4cuQ1GcfsLhunW9CTfi7ngetQQfkGYNv0odwrdvJEbA+PL5nF
         BxcRfo9PNNF9XOgPw/0KKfpWO0wv3OSf78ZDrlreLaBPWt0F5yUyl6okuoxPq/P79HGs
         mGPTmcixlMV5Y+rU74KHEQxrn/d0HJ+ZeAT9lsP9EEfDrhTI0M+V8UoJ+uxgPjH8Qax5
         s35kvXT8b56qJCAjWRfl901aixcFxHug/NIvzDrBDT9neVpY0pRx6IlM1LULee2zWUQ7
         bYVkdXLrBiFmivZc5TL5mlSwYtEmpDb1Tp36MZJNDbfpaSOqN44OkkiPdf07IuYvJxRi
         e7Jw==
X-Forwarded-Encrypted: i=1; AFNElJ8KcsPZr8mT55VaUxfL94J1TLTHwN/wNqK+RO2nW/jT30iyR9Mtz6uO4iXUOXRPcLwM71YgdrZel6EdmHhJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRZIWLTGJ1NWuBI0w5jdYlzK/G0ytvKaKW6/mJWkw9l7EtpEUc
	J0MlPptIekdyL6wlk+VIM73RoeC+MyumcLmhbM7VUD+gtzm9Wip1d317D0YaW/5AO/fgLmxOeDc
	Q0nNnGAzKk2VZINqBkHSxq2081YZwdco=
X-Gm-Gg: Acq92OHqwdl+gTZ42wqzJlehRYlSORsy7iQhT7qqbVL4sq496EeCnrc23M2zjl19Y7o
	zB4yiqmX9MP1BD3olZLCDohnfqb0XBE3LNtsq5WjXHCCC8tBRFBmMnvnMoxWOowIXsYmIGkuY4A
	lBd4ujHyjC1pk2btTe56BPh4oIwVqHmjqusNB1+bNhbnbdo6l+pwg+Bi6cLirIjuIn0Np9DhvPk
	XjXUmalPP01x9pcgvln6iE3iiCyWfkhKjw6hbPS5pxkwE/Hz59WvApDFk1vQD1XtcKows0VK8s5
	m4dG76xyJ0983m5MsS6YpdM4ic3qFkyzgybwwBfBsfq2YvNN0G/j5xHmse4+YMXtP7cMUg==
X-Received: by 2002:a05:690e:419b:b0:65c:7129:5c66 with SMTP id
 956f58d0204a3-662782d4c92mr2935747d50.41.1781279196694; Fri, 12 Jun 2026
 08:46:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-2-393322b27c5f@fairphone.com> <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
In-Reply-To: <DJ757RE8OYHO.2XEXNTLVIJ497@fairphone.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 12 Jun 2026 12:46:24 -0300
X-Gm-Features: AVVi8Cc-RlrekTPykssUtkucAEzJ495V9LRVQKNsNE6WJFZ19JGNTXkFLsVH6_4
Message-ID: <CABBYNZL_FmgjOKP-rNzc6e=m8oHdzN=7cLbvLqcHi1Otpa8puQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: bluetooth: qcom,wcn6750-bt: Document
 WCN6755 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Koskovich <AKoskovich@pm.me>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <jjohnson@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:AKoskovich@pm.me,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath11k@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112953-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,fairphone.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8846667A9B2

Hi Luca,

On Fri, Jun 12, 2026 at 11:33=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> Hi Luiz,
>
> On Fri Apr 3, 2026 at 3:52 PM CEST, Luca Weiss wrote:
> > Document the WCN6755 Bluetooth using a fallback to WCN6750 since the tw=
o
> > chips seem to be completely pin and software compatible. In fact the
> > original downstream kernel just pretends the WCN6755 is a WCN6750.
>
> Could you please pick up this patch (or provide an Ack if you want Bjorn
> to pick this up with the rest of the series).
>
> Regards
> Luca
>
> >
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  .../devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.yaml     | 10 ++=
++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn67=
50-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-b=
t.yaml
> > index 8606a45ac9b9..79522409d709 100644
> > --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6750-bt.y=
aml
> > @@ -12,8 +12,14 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - qcom,wcn6750-bt
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - qcom,wcn6755-bt
> > +          - const: qcom,wcn6750-bt
> > +
> > +      - enum:
> > +          - qcom,wcn6750-bt
> >
> >    enable-gpios:
> >      maxItems: 1
>

Acked-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

--=20
Luiz Augusto von Dentz

