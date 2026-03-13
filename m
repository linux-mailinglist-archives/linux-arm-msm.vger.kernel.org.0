Return-Path: <linux-arm-msm+bounces-97432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH0cIOnps2l6dAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:41:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897C281A07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 49BF7302DABD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD97387344;
	Fri, 13 Mar 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="cP6+zoD1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804B3783AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773398422; cv=none; b=McGulLGFT3GQYYKdPxpWBWJePQKTzYcOMNJeRPCQ/7azNzPf4ygC7isevUkVhFJT6w6Wzad5YhDkW14vWH3tdUM6Wk/M1APTU2YqhJ2dNTNuirE/9nCzyXKC1kkMOCXp3pGSrF0e3ZO/RB+J6L5YoDZgZP8AzIlS2lw2SsyNEXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773398422; c=relaxed/simple;
	bh=hy2V46Yj7werNEnar5xCstGATIYnGcBGHz9kvOo8w6w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VAs/9PyGheRIMATXWJNr+18YlzDFqZsM9YPPHBPh5xkOnHQYp6L2aKJ3b/V5gWwzB1/87A1yN4Hy7XLKx7zEVc3944r/mF9fKQymsm49Q8uCYOyF1mUvHSVfaVRD49bt31CdfRau1JX9nTYQcQGC1rhM2Zni50ANdRHt6M6gOJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=cP6+zoD1; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b940a00415cso257038966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773398419; x=1774003219; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/LSQW+rdHG/cjFYWltT+w8Nh8WDkZ/yQlRQR1OIp6g=;
        b=cP6+zoD1nbRidnx1IcGbF97XkDpa0NSCbeP++fOzrxof10N0nBORMvdnqme6MGl71N
         aYv5OoRyCuHL0RHq2PCclakimd5H0YY1Mu9Tpux8BCW/cRfLGEZ13xr128PoZJtMP4jW
         1jzkJ9LQaYRsBWYUVPd3ipUq846bBKzlZi0dx80tgX2cn3J4T9VMRXLQgRcDuTcOIKwo
         1m3n97EOP8lNJWhPI4QgAHM3cWZjwD5Gd0g51PeHsb6aebO+y57YYhqoYfEg0tQHFSu9
         GHvKlPMUvCDRNOkZD076rZBbES0waLUTL4kexLcc2G+QCij9MAR9JH1PK0Zk17e7Dfqg
         9Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773398419; x=1774003219;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v/LSQW+rdHG/cjFYWltT+w8Nh8WDkZ/yQlRQR1OIp6g=;
        b=jYJ4HHFNU9CWhf9V/w0Eh8OvAISrWe1f/ePsI2ekIJQ/jlSJT5uqcsLT1ShyR68UkA
         V7V8PNNHW2Yxs+LiOqqRcAuPSH0qrMOJHTi06sTectWmSQKHBwOuuEAwgwXGH0JQzCMe
         91fdHkVSsWSxhz9lDi2qeVUB/cGVxGJwqmQekrRpaAeGv+K4j9cFCymFM888uAqgBtFE
         67zP787Hwr12/mOnuKhQXiHIo2CF6atcvSNnNDOS4XoaapwIN186sEa6GS82Klab3lVA
         vrvOcsSadL+vVeEk5Y/NaiTbpiRS+jTnfPnyRJ7PUAVIm89sKEagJZXi4zgXNZHixgfx
         V4gw==
X-Forwarded-Encrypted: i=1; AJvYcCVMmXoBXsSp60u+fAKfR7HKsVv/pCx9t2b8u0EvhMbwwPIHe/oGUfW6slpQ/+osT4GrxpQyKGInn8vL8B9O@vger.kernel.org
X-Gm-Message-State: AOJu0YyyX0bdLRnktxzwpVf+nBUdQ9+m+Ezd64KjMERvdqTHLkurLuxs
	rU3K7mGDh4j4NcdT73Ci9DU1N6GD3Ft3oMX/gOxANzlllqZ8Gv6T24QGOfObNnHhlXs=
X-Gm-Gg: ATEYQzzvpby/41aKymr6UjuE59Xub81RoIw9kmamKdxsh/PHdfqPjqpzy7fRuO2G2oN
	tPgFO0YdzYnoxaun/IRDt/GsQNA8ZKJAzfdZwlqQHKdpapE+JWYsQxjQKWADo4gEHov1grNoVFu
	sBLV0ix99vC1+TONjfZ0xQfbs3L9sBLSuKnN5zPJBDN4LtctJwE+l2SCdeZMlAMUQwqLylDG3nV
	u8ijv5vWl0ss/RQaFY2IjBrMK3DCeAu9hCjHEo8H/DTn9ZH2LaNTqlCIBVum/zKSitMFXSkfIVl
	z3jQsG9D5QKMvloULoHb2PWPkSVQyduz0OtwRpnk10O99qpIK/aDxmobfeuuOhU2hA9b21o9re8
	IwUy1zGbKEllimHFerVRmLBTrtHJnQo2MTR2Cmu6bpWcu88wIcFQDLZw9XA/+vI1fnlre6jB0rA
	d6497xVgukWwdmVCEd4dUqy9k7+tIxFKwJOS1HqX0Z71kFijKmXN20LEddolCcnyUO4TW+
X-Received: by 2002:a17:906:7db:b0:b96:fa3d:c8b3 with SMTP id a640c23a62f3a-b9764fc9c64mr125909366b.9.1773398418844;
        Fri, 13 Mar 2026 03:40:18 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba6e8bsm36432466b.6.2026.03.13.03.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 11:40:18 +0100
Message-Id: <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
In-Reply-To: <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97432-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 2897C281A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>> parts.
>>=20
>> Thanks to Alexander Koskovich for helping with the bringup, adding
>> 'clocks' to the PMU node to make Bluetooth work.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 ++++++++++++++++=
+++++++
>>  1 file changed, 174 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm=
64/boot/dts/qcom/milos-fairphone-fp6.dts
>> index 52895dd9e4fa..cbe1507b0aaa 100644
>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>> @@ -24,6 +24,7 @@ / {
>> =20
>>  	aliases {
>>  		serial0 =3D &uart5;
>> +		serial1 =3D &uart11;
>>  	};
>> =20
>>  	gpio-keys {
>> @@ -215,6 +216,67 @@ trip1 {
>>  			};
>>  		};
>>  	};
>> +
>> +	wcn6750-pmu {
>> +		compatible =3D "qcom,wcn6750-pmu"; /* WCN6755 */
>
> I think a fallback compatible would be in order, if the data matches
> exactly

That'd give us these changes

milos.dtsi:

    -+                  compatible =3D "qcom,wcn6750-wifi";
    ++                  compatible =3D "qcom,wcn6755-wifi", "qcom,wcn6750-w=
ifi";

milos-fairphone-fp6.dts:

    -+          compatible =3D "qcom,wcn6750-pmu"; /* WCN6755 */
    ++          compatible =3D "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";

    -+          compatible =3D "qcom,wcn6750-bt"; /* WCN6755 */
    ++          compatible =3D "qcom,wcn6755-bt", "qcom,wcn6750-bt";

Plus 3 new patches for dt-bindings, with commit message something like

Document the WCN6755 WiFi using a fallback to WCN6750 since the two
chips seem to be completely pin and software compatible. In fact the
original downstream kernel just pretends the WCN6755 is a WCN6750.

Does this sound okay?

>
>> +	bluetooth_enable_default: bluetooth-enable-default-state {
>> +		pins =3D "gpio53";
>> +		function =3D "gpio";
>> +		output-low;
>> +		bias-disable;
>> +	};
>
> Not sure if we need to drive that pin.. perhaps a pull-down would
> suffice?

I'll give it a shot, this pinctrl is coming from downstream but perhaps
the downstream btpower.c driver is differing in behavior to the upstream
PMU driver.

Regards
Luca

>
> [...]
>
>> +	bluetooth {
>> +		compatible =3D "qcom,wcn6750-bt"; /* WCN6755 */
>
> Likewise
>
> Konrad


