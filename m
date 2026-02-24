Return-Path: <linux-arm-msm+bounces-93933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO4GKeFenWmxOgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:18:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56F18383E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 09:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23F34313977B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9536636657D;
	Tue, 24 Feb 2026 08:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e/PLKYYK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F004366556
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 08:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771920902; cv=none; b=nAbIW+nKKQXmi/NYWRYZ9ljtl4/s2DP+iw5rzxk9Ln41H+o80oEQaJJwVmvew5wktuYEkRRi4zhbbhfLnEmxciE+DnFZMOl2weq0GrPjLTSsvdjCs5Qv4zAGh9pCEyEoVgsBntAs/B139oU+CQ6ZPASfEUG/EeBFmxT0zsZMDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771920902; c=relaxed/simple;
	bh=9BNqf2MxT2KB9V3RmWVoDEyDdtAfYIbH0M7+sdJqyF8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=QDAUNQr0+aoeIw0zI9olsrAq2TOz9VLHNNm0KjX7wRwHuBqLfmSx/BbwMVtZku9aBndMsPUMYROM0Onp00wzM/9kYp5MaiTduP8335UsdQBuQXc8Cv84U5a878wLh+0sgNayV2FqlR+HWW/pk+0A21z+Vte/dInf3lX39iW9HMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e/PLKYYK; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-65be78011c8so7151221a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 00:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771920899; x=1772525699; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKXXJGWnu9K3xWMW9HyaDVo1/D1y/DKuzi9/eiBk4qI=;
        b=e/PLKYYKTVwvOJC59T6f+2vp9KK35XkixfJUCi8jTKZP0yiHMyS6pfcomFjzHxfpbQ
         knxi8XFrWlEjfuXlgFAvgTkKZBq4gWLEfJMZD4+jfhKoN2q4G/bj9slSFvButfSgrN9Y
         YsNAVtK/Dq7GCFsgV7LuF1IlOrVmsv97R4MrP6FPstwdbxKns0TovrENx8qlxgrGl0fu
         UzJdPC0FT9ESwfqQ4Cog01EcdUEfyXd7qaWKbRYmgvymrA3s1U1XmEO6/OGrzUZxdfBo
         W3pqi3H33scQHyOm6TBC0uE/8w1ehNpixQ5vjnb4NXm8cRabSWM7CaxS+RUe3/3aVBCx
         xUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771920899; x=1772525699;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKXXJGWnu9K3xWMW9HyaDVo1/D1y/DKuzi9/eiBk4qI=;
        b=nKs2qoDOqpoRs9b/djZpHkGX4jHEN28pG8T/QDiqJGqOcX7ZWzDC1AhBWoKuw5qOGZ
         c4TyckaXJAI1/mkVXseBdMUOErHCr2KXgv12JxvTCSFUQP9MWpRE4AIIIH9VOsJ9P+a5
         lDyqwmTw87C89cIz0YfAkRG8lMDTRqhnPOyMS2xz136RrFkdYySDvjyHdsIH/rY3wB/s
         cHC33/8ko0Y2GpNALpEZS0eKvgofN88Sj9m6zgs1+h1s54TG81Jai9o1imD90og9f9KJ
         GmzE7vCAbHvIQgJzllF8oIQXCekolO1Aea973V4gs7XgcCIPPauM6KgKW8tkubcxptnJ
         yW8g==
X-Forwarded-Encrypted: i=1; AJvYcCX5Z6jk4uBOJdHnycwBDikGo7Ap6SnXRC9UK8I/Vrooh1BxFGCsThUOO8aJjP1V9pxvBqXA2Shc7SbrQrhT@vger.kernel.org
X-Gm-Message-State: AOJu0YybgUjErzM3nVOfqSgyQI9/GojNGgkCPeEe4E7EPAZU42xPtI3x
	IjBT0iioDNdvPn4V+TnkK3hdKMeQwILfWU7zwhisPqMQ9weD/SWwTcpGDPKTxdwW7mg=
X-Gm-Gg: AZuq6aJljLIafogn2dXaIWfx0R1mTQeV3596GriHjQq/YGbxnwkdEmIO4QQX0NWRthn
	jYd4w/ol9K0mnOfVOblLXmc0T9jpCfigcHsRhwXkh+JSqilN4Jvh7U+QowMsXDsW74LYzbwUHOp
	JRZT3DDbV0t3uCbS9KeRd+TBqdmFJS1LvnOMuxbJLBTP/Xduwmf4CkEAewhEOdC9Soymd8lHtoY
	rWDuYvXe975ERCOkFdeaaWqAmDIBr4BIuL2CtvI2LfSq9pQq/xyp1gGAvAbgAlB2QcT0i+UXj7j
	JUVjwTP5JC6UGwpjiIEUay3JlHn3fFHEEOliTR4gerfn4GepC8dT9oWoekH183C07x/6Dc18VHP
	IWe7bjZiDTAf4E2NZFtSyqIpDYZbYyriHFZTZQNreFUxTdLk/N4EH1590R4magSLJ6/w8Avd6xd
	aLBXI4pipHJtWgrlgUDai+PQlWjR6IFWlKryrZYO5Ep+NKs5Bx8q2nfoUjVHJS7B11+YN+CBb2S
	dTqdgo=
X-Received: by 2002:a17:907:e0d8:b0:b88:5957:2d65 with SMTP id a640c23a62f3a-b9081b40c12mr380726366b.37.1771920899412;
        Tue, 24 Feb 2026 00:14:59 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4bfe6sm399567166b.44.2026.02.24.00.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:14:58 +0100
Message-Id: <DGN1JB8J9YG5.JZDBJ9WBLDXC@fairphone.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: thermal: generic-adc: Document
 #io-channel-cells
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Rob Herring" <robh@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Daniel Lezcano" <daniel.lezcano@linaro.org>, "Zhang
 Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
 <20260220-bat-temp-adc-v2-2-fe34ed4ea851@fairphone.com>
 <20260223184815.GA144001-robh@kernel.org>
In-Reply-To: <20260223184815.GA144001-robh@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C56F18383E
X-Rspamd-Action: no action

On Mon Feb 23, 2026 at 7:48 PM CET, Rob Herring wrote:
> On Fri, Feb 20, 2026 at 10:19:06AM +0100, Luca Weiss wrote:
>> Document the property to allow using this sensor with io-channels.
>
> Why? On the surface, it looks like you are adding a provider property to=
=20
> a consumer. Maybe that's right?=20

Correct, commit 3762f5851ac5a65dcccadf73dbe853b1b346f561
("thermal/drivers/thermal-generic-adc: Add temperature sensor channel")
added support for this in the driver, this documents the dt parts of it.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml | 4 =
++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/thermal/generic-adc-therm=
al.yaml b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yam=
l
>> index 12e6418dc24d..317fc39ed46a 100644
>> --- a/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/generic-adc-thermal.yaml
>> @@ -24,6 +24,9 @@ properties:
>>    '#thermal-sensor-cells':
>>      const: 0
>> =20
>> +  "#io-channel-cells":
>> +    const: 0
>> +
>>    io-channels:
>>      maxItems: 1
>> =20
>> @@ -58,6 +61,7 @@ examples:
>>      thermal-sensor {
>>          compatible =3D "generic-adc-thermal";
>>          #thermal-sensor-cells =3D <0>;
>> +        #io-channel-cells =3D <0>;
>>          io-channels =3D <&ads1015 1>;
>>          io-channel-names =3D "sensor-channel";
>>          temperature-lookup-table =3D <
>>=20
>> --=20
>> 2.53.0
>>=20


