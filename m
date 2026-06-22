Return-Path: <linux-arm-msm+bounces-113940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C9fYAbreOGqyjQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:05:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E26AD1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:05:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=RFX9AYCi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113940-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113940-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A494300753F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5148435E957;
	Mon, 22 Jun 2026 07:05:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860A352029
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:05:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111928; cv=none; b=Yn5K0rgVZggIP/Wsf6nuKbJL24PAtMl3bLDHNtsNMXrS7lS8yWaKnpH3otTjPyYU8zmC7nI8Vpz+tNz3v0FYVyu/zePqZbd3qMswHN4wYU5D6HlHH/1tRPmwmlPjtrMtyNxHiEOkYjix2y2RKOqtBNEKVxidpuVjC0OcRLD/Aww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111928; c=relaxed/simple;
	bh=/sPH/4yOVljlqRqNUbXxHIhT6Bka9y5KCIYoKxZjVgs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=I0GXxUvFZ9+tDzsN7RWG37MaXo2g+208ya/aUbPZDytJOUFa0LJW/3hOzPoCEgKnOhFK8pz8RCXUfOjZCnXCeGnyAoNRGZiMkZiPNyGOu71CKXduvw15nj3tcEXJZ14zUlMXZ43nvX5Z9dWbO3x1HOXBBKeYHhW04IsoSpvq77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=RFX9AYCi; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6977c0814d1so2516609a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782111924; x=1782716724; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2dGSrY6zQBJiyRE8tkOjBJN/7dRnPUdVyyrkCIBUgQ=;
        b=RFX9AYCig7Ub66hNakKuO+CUDa8Rph3pfR2X896WQDDtJThzBrIBLUurEFdkcfvqid
         wNj1iw3m9z4HVSRrbGI9crpkm7iQ1/YQbaTjReqsyw1aZOLoab+vJ+5ePH8n1uPXLglS
         eqDktRevvmv6VnkOryWKuhNJ6GEKvobqoIMykzgAWlGTQ/h2oTYKqYoWSYo/gVMlCrQs
         V25lVdDS6z+MpwnRGdIjM8esbrwAN3jREdnYWLp0GfSdkLqA9GHkNxSfaG9KJo967ynF
         n9MeEnDMERLJchiSZ19bnEW/h19sLkoehg0RS49UHa7RkcXzBxLCQUjewD7isxF7PuqP
         IxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782111924; x=1782716724;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A2dGSrY6zQBJiyRE8tkOjBJN/7dRnPUdVyyrkCIBUgQ=;
        b=CMpVzL0lFqmN+rrpjbFX3Em9l0A5omnrLwOjM4NvPAS1eWHNOl6kGq3sXg9b6hRojG
         AI4IxhdPFpt6It2DcEDcc38bZVqLz4ae6d+YUmglKBTVC1prdGZ8tDTA33ugzRmLxtvy
         JrRbqQQLqooKY5iQu7HKSO/LQ7Lk5JIcsEn225pzP/J0U+PBqLHYiP1B4HCtYcMNvUiU
         ArKLyUNVthFQe/StEW2gFMw/zT+umNTsvMTKW6fJSws2A04lZKuK2P7tbQ1IgCEHbd50
         JZcWOi0o5RMrHSjcuAfWDu489D71hTTP/eN3qrYibjVN1/lUa6Mq69TVREXUtqQ5oLxy
         9SQg==
X-Forwarded-Encrypted: i=1; AFNElJ9w0agqgwLtaAeN6LZ3hLXLg9mNvnqq7xTpZtkcZqgIWN3A6PVu5YBu1g2A+gVnlvALZ8Clym4mlRe9ruxL@vger.kernel.org
X-Gm-Message-State: AOJu0Yykb1wXtt5HlQBp8hF6EBjAxjtiV+zwQkuqiDCpQmK6Ab8ogptf
	o0xYep1OdR8bY3cSp6D2m05bWj5iMdZlnM65u4jUylOS5ohH6s4kY9ZdlUT95SW9HW4=
X-Gm-Gg: AfdE7cnssLqLou5DKaOgzO9BEL1iRBHCP+rmRUzFDAVgJEpMJFd0juyQvXhbJ+4Za3b
	frXt/wsGzETv8DDx4x7KuaTMcCGaAR/EU9lRbqvwpU3xztUdhK9CaSOsHjxnGnazMRsnldeJKcP
	n+I46wSbuglKV6APgcq9cqgcTkPHixobMrzceaX5RQAf46gA3CX6LlhgxgGWlT0m1AP54E2ItRK
	7hkXvMBD6012KAhcpPWxEIbpaDfIShvpAKK0imr7yx7Wf2SB1sWt2cLAojtPKD9+b6pxHJK3Yyf
	UpeF15cw9YM5O/r3y28yQXItnjNTaPRt9b7uOl3aWvQkI6YTOiW9wxRkqNDt+3seNDWJP3h5zCd
	wr6scRIMb69T6A2kMQDldPDigcF6S0WfjDp33rN/udtI8t27EcSAoW4/UB6Jep9sPcY/6P0eqn2
	cLZVT6LHahJY1ggXIINmLIW9an6l+8JTAbQadrf3QP1890B9F8S1ne1I/hYdzVxFJcU6l6RPFdU
	aDqFODRclUjPzkI5U5gXZuuw2Q=
X-Received: by 2002:a05:6402:3886:b0:691:b5aa:5a5b with SMTP id 4fb4d7f45d1cf-696e5211752mr5971797a12.17.1782111922988;
        Mon, 22 Jun 2026 00:05:22 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697b8780d08sm701001a12.0.2026.06.22.00.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 00:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 09:05:21 +0200
Message-Id: <DJFDYAS1AY8Z.3GD4A5UMWLAUC@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Sort pinctrl subnodes by
 pins
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <f05ad4ae-140a-40a7-a6ef-9ac2ddb0a939@linaro.org>
 <DJ747VLQEHIN.Q3SS1FFC9I3L@fairphone.com>
 <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
In-Reply-To: <ba0e9f93-fd2b-4895-b8a7-8e38eeff9bcb@oss.qualcomm.com>
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113940-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,fairphone.com:server fail,vger.kernel.org:server fail];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,fairphone.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 898E26AD1FD

On Mon Jun 15, 2026 at 2:09 PM CEST, Konrad Dybcio wrote:
> On 6/12/26 3:46 PM, Luca Weiss wrote:
>> On Fri Jun 12, 2026 at 2:59 PM CEST, Vladimir Zapolskiy wrote:
>>> As documented in the "Devicetree Sources (DTS) Coding Style" document,
>>> pinctrl subnodes should be sorted by the pins property. Do this once fo=
r
>>> kodiak.dtsi so that future additions can be added at the right places.
>>>
>>> No functional change intended, verified with dtx_diff.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 1382 +++++++++++++++++--------=
---------
>>>   1 file changed, 691 insertions(+), 691 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts=
/qcom/kodiak.dtsi
>>> index fa540d8c2615..62daef726d32 100644
>>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>>=20
>> <snip>
>>=20
>>> +			qup_uart12_cts: qup-uart12-cts-state {
>>> +				pins =3D "gpio48";
>>> +				function =3D "qup14";
>>> +			};
>>> +
>>> +			qup_uart12_rts: qup-uart12-rts-state {
>>> +				pins =3D "gpio49";
>>> +				function =3D "qup14";
>>> +			};
>>> +
>>> +			qup_uart12_tx: qup-uart12-tx-state {
>>> +				pins =3D "gpio50";
>>> +				function =3D "qup14";
>>> +			};
>>>
>>> I understand and support the intention to keep this change non-function=
al,
>>> but this pad "gpio50" is for qup16 also, right?
>>=20
>> According to my QCM6490 data sheet, GPIO_50 has these functions:
>> * UART for qup14 (OK)
>> * SPI for qup14 (OK)
>> * SPI for qup16 (no pinctrl)
>
> "no pinctrl" meaning "not defined in the upstream dt as of today"?

Correct.

>>> Similarly pads "gpio54"/"gpio55" for qup14 function, "gpio62"/"gpio63"
>>> for qup16 function, I find all of these are missing on the original lis=
t.
>>=20
>> GPIO_54:
>> * UART qup15 (OK)
>> * SPI qup15 (OK)
>> * SPI qup14 (no pinctrl)
>>=20
>> GPIO_55:
>> * UART qup15 (OK)
>> * SPI qup15 (OK)
>> * SPI qup14 (no pinctrl)
>>=20
>> GPIO_62:
>> * UART qup17 (OK)
>> * SPI qup17 (OK)
>> * SPI qup16 (no pinctrl)
>>=20
>> GPIO_63:
>> * UART qup16 (?)
>> * SPI qup16 (lane 3) (?)
>> * SPI qup16 (lane 5) (?)
>>=20
>> But the GPIO_63 looks weird, is the data sheet wrong?! Where would
>> UART_RX of QUP1 SE7 go? Maybe it should be UART qup17 and SPI qup17 and
>> then SPI qup16 ??
>
> GPIO63:
>
> QUP1_SE6 SPI_CS2
> QUP1_SE7 UART_RX/SPI_CS0

That matches pinctrl driver and kodiak.dtsi at least. Still, the data
sheet is just wrong there. If you have any contact to relevant people
there, please let them know!

Regards
Luca

