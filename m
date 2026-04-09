Return-Path: <linux-arm-msm+bounces-102434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPzKKsFi12nvNQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:26:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF13C7BD2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A2A2C30078B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C913A255A;
	Thu,  9 Apr 2026 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="F8YKfrx0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC68C38C419
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 08:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775723197; cv=none; b=mk51+tT/TZ1q1VM4pHSvWTKgpoLEwWIo+U9tXxGXpg8ATaLW/HmbaCvAgMATGzTiTNuNd93lZqvovnBR0gvejk0GoTs/EvdToV/lPC7yi/PLHTAvsUrzA81fvd/2R5zuV047OVPRavT+KUGp0uwU48HRhPcSLW3cDHB95cJiYKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775723197; c=relaxed/simple;
	bh=EuhRbZ6NpCilnQOmXdYdPa2U1G2yQC2oX9aabqLBekk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Rc3gIIDaTbxUs9cw/iF3S7yqAu/FFmsmKJXtH8VPt0VNzgY2kaR5V5BEJPiv9HiiGNXTjvxaBgxa9TKVdAMH/1hL9frSZM36IjMvUQzBhgzUociJqnbSY3kkNSts2ATNiH5uulpyYc83f4qVkjTaej0LyZ/TnMB+BuwVd38Qx5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=F8YKfrx0; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b980785a0bfso77111066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 01:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775723194; x=1776327994; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZivT/Wgfja7s2ciPCKX2XjEYiV4fDrABVz+SXmA49Y=;
        b=F8YKfrx09xf3HEsEiLZPCjzfK56Ui0QSCWfc9Flpn/p/jP6pYv05lq8A8hbWqaNgZB
         4ifa1kEXSx5cDhQkHOquIMTKYAlSzms8Qzz9q1TMumEv/J8mtlPgiFX3Ki1uBvF+q4UC
         6zpBvniAWWbTuwdDolDdXHEIc9S/HwDzUJFYypzV/4DMXjnPouO+dMciqqCdvsjp0Sjd
         V8gigTd/kAe4Gl1JgmLq7Dz7bGP7lYKV8W+b2oAYzrkw3WvPCDdrro+yzHEuWCMVM6Uk
         RhBKaXKYs2tF5oC2D0DB3ukawNrgWeDEOmAyuICU+wW7EmDaebvIGK2bQy+KUdl4J7uB
         3pbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775723194; x=1776327994;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZivT/Wgfja7s2ciPCKX2XjEYiV4fDrABVz+SXmA49Y=;
        b=YnTkmcysl3n0CjamBfraWR5e0Z8mooNNQRWYmNHaywPkdM2idnIJi3Glan1aVfAQL1
         7ctWpULQC6M2EMjgJgAbdIz0N6ckG5Svq2fkUV9Xkk9+jQHKpZoIBwRAFN82jlri1LU0
         ulSI5aI6Nwd68AphHFk+ugdhQVmRsGm0IVGhBKv88Q/12SnGb+b7YA1oAknmtVytQU2z
         IrWqMCo2ZZnZPTi2CqmeDRAuxakLRWn4hVop06HXO9CkVUS58pkPvSYk8tsuwnPnvXOf
         dgPBgTyvvUAwZdxSS9v31uiyGKNBcTaMDeaidJ743D5feFbeDJQOeD2ijA31RP2/qrNj
         t+/g==
X-Forwarded-Encrypted: i=1; AJvYcCUOIwRAuMxtOjUz/NExYmdbOP2SlACYfSmz1UJNJC1Qblivff2DD5MdmazVQr2mna5cV3/NQcXkTJgRlHLx@vger.kernel.org
X-Gm-Message-State: AOJu0Yya7cujcgjP8OCZbBW9O7F3/+Y5kR5uISoQYDFwrO4x1pxP5byq
	02Z/P7wx6o2j4qTx9EtjjgWs5Q3G1jTvFFRWVo54uu8hOl0aiSo2efo2cat8qh7Oeqo=
X-Gm-Gg: AeBDievdMtGSwSkuVHPGavfJe1kO/li9BJ5ijWdyz1EWe55TgfP/fVvTVY58Zk+pSNf
	fMf6smmVzIOdsdAqoq4lXKKCx4D8W24WxXWq5YNiMhp15wZfbhinbinGji0MWqoAeZ9psxo9QQa
	s6QEHnFo47vhSGGcfC7lh74UlVoCumw2BQfvrsIzzbyt3CAozqlT1FIkg5yDbxpdYOPVeF2gyko
	JLRuFSkulRcLz5kRE9WZEJndcEaxHKcXklHXf63jTulNCixjmJdwO+N/hLabyIFcZhlHcPVObai
	N9lk0SdXCsMV1Y39Y53kW/Fe0YI3jvKcqJPbmRmNj0YZlBUNjMB0LCepXZkBuGvr3EWZuYFDLZy
	hvRNelShRQ0VBJcfgHcnrwsFpD4BbCnO+OnIR3qhLGk3v8g2V/jn/hvT44tam1+ySomfaRH/TEj
	VGmF8HDol8nSx/pui7yh1FWTNXNx5tAZe/5nimdxguI9H0eCQ9wz5EKvzOQRRfALrYkn8aFSjgL
	G7jAi4=
X-Received: by 2002:a17:907:1903:b0:b97:1d24:c004 with SMTP id a640c23a62f3a-b9c6742f6b4mr1299851566b.21.1775723194150;
        Thu, 09 Apr 2026 01:26:34 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972293sm715510466b.11.2026.04.09.01.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 01:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 10:26:32 +0200
Message-Id: <DHOHC560BPB4.F35KB93S9D97@fairphone.com>
Cc: "Alex Elder" <elder@kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Alexander Koskovich" <akoskovich@pm.me>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-6-01e9e4e03d3e@fairphone.com>
 <ku4w5dbfk4ihxfslyf7lcxtxnbzabim5mmtm7xlhqbnmav36iv@zt3dky3vbfbo>
In-Reply-To: <ku4w5dbfk4ihxfslyf7lcxtxnbzabim5mmtm7xlhqbnmav36iv@zt3dky3vbfbo>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102434-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 47FF13C7BD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On Fri Apr 3, 2026 at 9:27 PM CEST, Dmitry Baryshkov wrote:
> On Fri, Apr 03, 2026 at 06:43:52PM +0200, Luca Weiss wrote:
>> Configure and enable the node for IPA which enables mobile data on this
>> device.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index c1899db46e71..31c6d6627619 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -690,6 +690,15 @@ vreg_l7p: ldo7 {
>>  	/* AW86938FCR vibrator @ 0x5a */
>>  };
>> =20
>> +&ipa {
>> +	firmware-name =3D "qcom/milos/fairphone/fp6/ipa_fws.mbn";
>> +	memory-region =3D <&ipa_fw_mem>;
>> +
>> +	qcom,gsi-loader =3D "self";
>
> Are these two common to all Milos devices? Should they be a part of the
> milos.dtsi?

All qcom,gsi-loader properties are in device .dts (or device-common
.dtsi) files, never in SoC .dtsi files. Based on this, I guess it would
mostly differ based on the boot firmware used. If Linux is booted in
EL2, then probably it needs to be changed?

Regards
Luca

