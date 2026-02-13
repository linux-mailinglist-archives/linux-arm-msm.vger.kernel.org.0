Return-Path: <linux-arm-msm+bounces-92795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8h7kKQ00j2lGMgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:24:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA91370A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAB163007282
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1840356A08;
	Fri, 13 Feb 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xftAIikl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924BA225413
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770992647; cv=none; b=TjLoVpjCJbW8NsMM4EuV3lr7KvtUM4+uy4wjQu22NPVsyy07GFh1IDOgWvI6DgxPVgkmEphSQxCLPfAsWUMLwZ4WpLdl6GdnI+r4B+EM3FBkl3GZjMY7cSxZuV06DAVRjA9Uv/+GQgFAdXmjapLHHo52KejUG+15BpubclhXl1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770992647; c=relaxed/simple;
	bh=Ay0D6GdAPXygldsOGoBiVkahDJKNp328gQFQGPJ+sIk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bdKq5IJW6SGI3NPWzijuPBsb2P/7KHnEJcnMOmEqUYG2bVCde5z+PGv/FTBId2ID2OGBEHDURyFUYkgVR9A97EPp+u+AlvxoFgli1FYVXQKv3+Kr/HOmTQ/OweMAT4uoEzdyCYGQ3VlvY6E40hkiRlyQ69vL0/lg4+f0jHUjZ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xftAIikl; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-65940221f7eso1653396a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770992645; x=1771597445; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCFtFmCjsibDMDkl0GJojw688jZoMr8VtFLUcg2+jq0=;
        b=xftAIiklNZuYwEWU0UTU3mMdZIrTjE4TbK0BPVpFAkIGgxNBlFSygBdquMhOz00BcL
         VWjf9Jwe+bjnVZPCPRTXLtEbKnhT13yT/oDxVHz8tfzKuF74IGmt6N/am2w4oWVHs77V
         3tuj8VObvPWIRdxFrmHnQ6/TMALkOjXMueusHqGH1H+iKzj+xPamRv7TiVs/2vHhVx/i
         qFtKUKmNaI/BuzJWLzslrGv3e4xalerF1m1oxVVLuETqC8DGPcGU6Eg7VTD0s2sW0sYQ
         blgBk5ReFAQdv5pw6Hh3PajMzx4C9xyFn/DXJyD5YNoZwsK2EuMMq4UyJyOf70otoXfh
         83QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770992645; x=1771597445;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCFtFmCjsibDMDkl0GJojw688jZoMr8VtFLUcg2+jq0=;
        b=u1+qEc7eebJ3Z++sUSrFSXku+gKZas6VzoVPuoSpIUMzb1YrXeHCkm7zEgi353X93d
         fij1lCXZY9xJGZUE9CsECLD1xI+KQHuWwCvJNBn8Mrs1w4nFkk11jWvPmEZ8+K8PAkH8
         fhdBP+Wik8Co67IHwTuR3ewu/9lAXjbY3+LRUgCnafdiKGukjPT9Ro4HyDZEeU1KCtWk
         22mQt8UFYCeBvl6OzSkm86H0wmX3AwJYVJXGLu4WBc62EpwM7gLnsJJutarLHB4MBXbi
         PjPr28xT0Kq0Tew2bJVHV2vueTBsYkC0ibfVuwHQOn9aZuCXP2VT5FCQ7aEv2QqUYNsK
         qb1w==
X-Forwarded-Encrypted: i=1; AJvYcCXrKqA7v5gIKWFBVzkHaZsrGLP1lBiHFcg/+yRXeuTrzUwPAy2KyUOJ4Ls470XFnaIdt7ZsgNQ1vByPKIzc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kyC4Hk/C4G5+k6TXM1xDrmjYOEv1kKdedzoTd2+DUmexJceM
	7huNuXGnZFJXNUT2YZ+3RfjhQDrqyI07DaBUWCB8zfcC8Pbpd3YDKVQyw508HDpCmt4=
X-Gm-Gg: AZuq6aIwVjQyeCUgOWMQP+gLvWls1dbrHl+n9NWLtqB2wAPuvshLocNLtNZ7rqAhXFe
	DH5dEhMOhXDfgF2EprHi1jJsLs1ztLdpjD4AWUDB+MPdUWq2KYBdUseMF2TnTEu0MFFY4ti4VTt
	o43AlxuQvocboRgjtqdeBBVrN6egbZFGtWAeR9SGS7F65fnF87O6lGcfxSmHlleaRNRzcU/I39J
	Rc3XV+k5G+E3Nf14yr8r2GKYarmsSYtNYZ80uZjVHpNV5ywWly5nbRwDyMV2f1SShaeY5MdtYKg
	Sn6yhHj6pyTyA+poS4tRtYRpdv7dqpWKrDhuA7jQUB2rRNRrvxpYEErcYEymykx9d8j7HM360jI
	2qlxE4FVowD653nlYpp63z0p1lIP18rY2J3JqsYUbeJAT2lXj8oxVD+8rNNXj3Wl+a7QaCLPvIe
	9JGiIcL5h65NyU1hIKtf0tAY4+0K8jIWhn9Mpv4YxSuXhJlS0Yc4LR5XWDRqCVxKYrZ9QN
X-Received: by 2002:a17:907:1c83:b0:b88:21cd:5fcc with SMTP id a640c23a62f3a-b8face2b48cmr150515366b.36.1770992644795;
        Fri, 13 Feb 2026 06:24:04 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ebd60edsm256019766b.41.2026.02.13.06.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 06:24:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:24:04 +0100
Message-Id: <DGDWHX20052Z.C8JH4RXIPJCK@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
 <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
In-Reply-To: <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92795-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8DA91370A6
X-Rspamd-Action: no action

On Wed Jan 21, 2026 at 12:50 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
>> Configure and enable the WiFi node, and add the required pinctrl to
>> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
>>=20
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> the missing pinctrl to make the WPSS stop crashing.
>>=20
>> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fa=
irphone.com/
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 +++++++++++++++++=
+-
>>  1 file changed, 18 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index cbe1507b0aaa..75f2b3a3e572 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -232,7 +232,7 @@ wcn6750-pmu {
>> =20
>>  		clocks =3D <&rpmhcc RPMH_RF_CLK1>;
>> =20
>> -		pinctrl-0 =3D <&bluetooth_enable_default>;
>> +		pinctrl-0 =3D <&bluetooth_enable_default>, <&pmk8550_sleep_clk_defaul=
t>;
>>  		pinctrl-names =3D "default";
>> =20
>>  		regulators {
>> @@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
>>  	qcom,tune-usb2-preem =3D /bits/ 8 <0x6>;
>>  };
>> =20
>> +&pmk8550_gpios {
>> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
>> +		pins =3D "gpio5";
>
> I'm thinking how to best reflect that. Perhaps gpio-gate-clock which
> would be consumed by the PMU?

This way of doing it already has a precedent with sm8550-hdk.dts and
sm8550-qrd.dts at least.

Regards
Luca

>
> FWIW PMK8550 can reportedly output this clock from GPIO3 and GPIO5
> (not sure if at once) if set to FUNC1
>
> Konrad


