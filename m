Return-Path: <linux-arm-msm+bounces-92790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKfIErIpj2kPKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:40:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 363241366CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2F4B30420BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 13:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C77D35FF6E;
	Fri, 13 Feb 2026 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PSxi9l6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE735F8A4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770989999; cv=none; b=XbL8dagAtEWsIiIZizEHaSH4d16yFFkbI9RW84yaQFNsrJ+u6MZqqhsgvyhGRG1T1+evjM1IWA5EA+RbgyWKIc1hAx+r+OqdFFWuZjb/xAekSGzCXU9WT07QpGMu1XZA/TOg5tEpXlSorXtmMKzc1NonSOCtxckklQNRP4y4LnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770989999; c=relaxed/simple;
	bh=jPiaB1cPnsBCSqPZwxa3BXmJi7Uws2py+99N50LH18Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=qKQLxd3nA36Cal1FutFfs9ke5g7fP/0EJtPS4ooZ3wXN5LdzKHPiXxXUOLWK4E8iDENvqqH+MyOM2ORQb2+JP2ywVHnIBXMG/4wAlXQ8zzE9/l6Mavg5lnCnfc8Z3LLBytEXrC4Wza0X/7zx0Crb8/OXDriUOx01qSoIgjo6Qc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PSxi9l6L; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3870c7479c0so7246291fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 05:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770989996; x=1771594796; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXlnwEJKyA8dB3NSxxIfARoyH/UHQbm9JUFGj4ufio8=;
        b=PSxi9l6LkEJAOVOlPHpxzcKwXw9Ng/H4CMm4Q+0aVOWZS/kFXgB7uogbNOgJv49qNn
         wIQxOtTd80i7EaI6H32i1TGJWGsu/bZbGBGbDQndY1OpZ0EoG0FimijhLv1Sw2GOBNGV
         dqcHeU5KYP5l7NVCbom51GpaLaaObUYPECDFMgGuyGKt5gA3u74efohZQ5LsPqJfYvDw
         csn8k9aS9GA/AwPfnCX249/w8TVOlwB1yechWcoSI4qjHo7XoTZZD6Kdi0q1eLdPsLSp
         dq2XTxR0LTntPxLkcJyFw1nq2vubuqttSsO9telMNG97apnxJCUaVovDji4JlX69vU36
         t1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770989996; x=1771594796;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gXlnwEJKyA8dB3NSxxIfARoyH/UHQbm9JUFGj4ufio8=;
        b=euVQaVCGgL8IoyzAP2bQT2N0kMtrwLmN1g705mdVutO5aQvK7QOcL0TAJFlgd7wG37
         OVeGNRJwSXLM63E8PpMEUuGRGC3IqSsSKbYHfF4DOhG11QkgNLGZbzIzmCAKzx/me50y
         DearEGRIiqMCKqKF71H+pFWPKAtSBOUZF0Cs2QPIY2oXfpz9mA83Q3Vppb/8cX47ix0M
         qTeMS4U7rg3zD1Rv7SYxl1oHJyDOMuSx4Mn5axujHlu8j9RIMH2CHN7lxAEJhBiP4FYd
         HrG5pWvBgxaxVMb+qnSVz01scQcNJwrNHcq/IGYEZw37qWuYaDUrgKXHTJwDoW0jIOaS
         FFDw==
X-Forwarded-Encrypted: i=1; AJvYcCVsagVdh9hUh0j46TuABv/D+Tqbs0QQZZI41Sn2NLBOJfljyrLS0WSedYv31BDtecf6vLpxKLltCt523Xq0@vger.kernel.org
X-Gm-Message-State: AOJu0YwsL0LMjnVSnEaDUVi9bzs1wMvg4R71QYhZrwFAad93yGrEUjoG
	sMRBBH3FRFcvsVbZk9+TT6uvyJncw8xL73MDd0lEBUFeGK7b7VKrggk+HwtIsQBNcjrCqN9v/9A
	sccEB
X-Gm-Gg: AZuq6aKMBVUXfuNV9qq79qYxNIZr0cLNtVfqI8fzEfDx/P/zRGHW4vtRgcwZVM3xaNm
	dNvEFtfMvrI27sieGcPYo3oGdJ+8S9P84IcFJ2U+yD3bbU0J1OQY7Jt1eRdEYw4eCfCgZoC78jG
	8AWD+/+rRJ94q34gFLDQvx0rnclnNgoKf01PHWo7F5/xXGUgeNC5jBKV59HCi9b09ai+Q18r0Cm
	tpv8+ejiD1voF3r5rWZxjjcSzzDBJ03ByuwAa3qEDEKhXvL4oRK57IC3Lqh/py1fVozaFOb+Zkl
	RMqgy7jGzVtlUo4iKAB8l8KrZdtr5jWhzkQKXA6+JhPRV9KqNZ4yWbPmfQbeNYNVu+MnYPnLqTr
	jM22S2zMpiL9nQxcbRdoKPeiUhEVvVdTh6LwyvLHeVfPyJWnAqlQAy3QvqYwvAFiQ5SpmwWzzFz
	XW9fogmxfii14VG9/keg2sbGgrVVQYWhADvQhFpsLffnpYw2Ym4PQ/588AL4OmCSXTnmHn
X-Received: by 2002:a2e:bc23:0:b0:383:2074:ed34 with SMTP id 38308e7fff4ca-388104fb2a3mr6074671fa.2.1770989990120;
        Fri, 13 Feb 2026 05:39:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bfd3sm682707a12.2.2026.02.13.05.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 05:39:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 14:39:48 +0100
Message-Id: <DGDVK13XN7OO.3I398MMB95Z8U@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bartosz Golaszewski" <brgl@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Loic Poulain"
 <loic.poulain@oss.qualcomm.com>, "Robert Foss" <rfoss@kernel.org>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Add camera
 EEPROMs on CCI busses
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-cci-v1-0-28e01128da9c@fairphone.com>
 <20260116-milos-cci-v1-4-28e01128da9c@fairphone.com>
 <ae73eac1-4e27-404d-af73-88eed699db0b@oss.qualcomm.com>
 <DFQ3MBO2EAYF.1PRF2111N0U1I@fairphone.com>
 <44f65bb6-616c-4dd9-a7a1-ee62d5d217cb@oss.qualcomm.com>
In-Reply-To: <44f65bb6-616c-4dd9-a7a1-ee62d5d217cb@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92790-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.52:email,0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,ac16000:email,0.0.0.50:email]
X-Rspamd-Queue-Id: 363241366CD
X-Rspamd-Action: no action

On Mon Jan 19, 2026 at 11:42 AM CET, Konrad Dybcio wrote:
> On 1/16/26 3:54 PM, Luca Weiss wrote:
>> On Fri Jan 16, 2026 at 2:59 PM CET, Konrad Dybcio wrote:
>>> On 1/16/26 2:38 PM, Luca Weiss wrote:
>>>> Enable the CCI I2C busses and add nodes for the EEPROMs found on the
>>>> camera that are connected there.
>>>>
>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 50 +++++++++++++++=
+++++++++
>>>>  1 file changed, 50 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/a=
rm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> index 7629ceddde2a..c4a706e945ba 100644
>>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>>> @@ -529,6 +529,56 @@ vreg_l11f: ldo11 {
>>>>  	};
>>>>  };
>>>> =20
>>>> +&cci0 {
>>>> +	status =3D "okay";
>>>> +};
>>>> +
>>>> +&cci0_i2c0 {
>>>> +	/* Main cam: Sony IMX896 @ 0x1a */
>>>> +
>>>> +	eeprom@50 {
>>>> +		compatible =3D "puya,p24c128f", "atmel,24c128";
>>>> +		reg =3D <0x50>;
>>>> +		vcc-supply =3D <&vreg_l6p>;
>>>> +		read-only;
>>>> +	};
>>>> +
>>>> +	/* Dongwoon DW9784 VCM/OIS @ 0x72 */
>>>> +};
>>>> +
>>>> +
>>>> +&cci0_i2c1 {
>>>> +	/* Awinic AW86017 VCM @ 0x0c */
>>>> +	/* UW cam: OmniVision OV13B10 @ 0x36 */
>>>
>>> There's a driver for this one!
>>=20
>> Yep! Already got patches to add the required regulators & devicetree
>> support to the driver, but since I've got zero on CAMSS so far, I
>> couldn't test it more than reading chip ID.
>
> That means the digital part works.. I'd say it's a good enough
> indicator
>
>>>> +
>>>> +	eeprom@52 {
>>>> +		compatible =3D "puya,p24c128f", "atmel,24c128";
>>>> +		reg =3D <0x52>;
>>>> +		vcc-supply =3D <&vreg_l6p>;
>>>> +		read-only;
>>>> +	};
>>>> +};
>>>> +
>>>> +&cci1 {
>>>> +	/* cci1_i2c0 is not used for CCI */
>>>> +	pinctrl-0 =3D <&cci1_1_default>;
>>>> +	pinctrl-1 =3D <&cci1_1_sleep>;
>>>
>>> Let's keep them per-bus-subnode so we don't have to override it
>>=20
>> I don't see any upstream example of that, would the pinctrl work
>> correctly with that?
>
> Hmm.. I assumed it would.. and I assumed we do have examples but
> ma-a-aybe they got stuck somewhere in the review purgatory?
>
> If you'd be inclined to test that, you can add a pr_err() to e.g.
> msm_pinmux_set_mux() and observe whether that changes as you
> interact with the sensor over i2c

Yeah that doesn't work. With the following diff I just get some CCI
timeouts and at24 driver doesn't probe correctly. I'd prefer not to do
some yak shaving to get this patch upstream.

Regards
Luca

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/=
boot/dts/qcom/milos-fairphone-fp6.dts
index b6cd95fc294e..9f9410615aea 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -671,10 +671,6 @@ eeprom@52 {
 };
=20
 &cci1 {
-	/* cci1_i2c0 is not used for CCI */
-	pinctrl-0 =3D <&cci1_1_default>;
-	pinctrl-1 =3D <&cci1_1_sleep>;
-
 	status =3D "okay";
 };
=20
diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom=
/milos.dtsi
index adf050600a4e..a2438cf60271 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1755,9 +1755,6 @@ cci0: cci@ac15000 {
 			clock-names =3D "soc_ahb",
 				      "cpas_ahb",
 				      "cci";
-			pinctrl-0 =3D <&cci0_0_default &cci0_1_default>;
-			pinctrl-1 =3D <&cci0_0_sleep &cci0_1_sleep>;
-			pinctrl-names =3D "default", "sleep";
 			status =3D "disabled";
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
@@ -1765,6 +1762,9 @@ cci0: cci@ac15000 {
 			cci0_i2c0: i2c-bus@0 {
 				reg =3D <0>;
 				clock-frequency =3D <1000000>;
+				pinctrl-0 =3D <&cci0_0_default>;
+				pinctrl-1 =3D <&cci0_0_sleep>;
+				pinctrl-names =3D "default", "sleep";
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 			};
@@ -1772,6 +1772,9 @@ cci0_i2c0: i2c-bus@0 {
 			cci0_i2c1: i2c-bus@1 {
 				reg =3D <1>;
 				clock-frequency =3D <1000000>;
+				pinctrl-0 =3D <&cci0_1_default>;
+				pinctrl-1 =3D <&cci0_1_sleep>;
+				pinctrl-names =3D "default", "sleep";
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 			};
@@ -1788,9 +1791,6 @@ cci1: cci@ac16000 {
 			clock-names =3D "soc_ahb",
 				      "cpas_ahb",
 				      "cci";
-			pinctrl-0 =3D <&cci1_0_default &cci1_1_default>;
-			pinctrl-1 =3D <&cci1_0_sleep &cci1_1_sleep>;
-			pinctrl-names =3D "default", "sleep";
 			status =3D "disabled";
 			#address-cells =3D <1>;
 			#size-cells =3D <0>;
@@ -1798,6 +1798,9 @@ cci1: cci@ac16000 {
 			cci1_i2c0: i2c-bus@0 {
 				reg =3D <0>;
 				clock-frequency =3D <1000000>;
+				pinctrl-0 =3D <&cci1_0_default>;
+				pinctrl-1 =3D <&cci1_0_sleep>;
+				pinctrl-names =3D "default", "sleep";
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 			};
@@ -1805,6 +1808,9 @@ cci1_i2c0: i2c-bus@0 {
 			cci1_i2c1: i2c-bus@1 {
 				reg =3D <1>;
 				clock-frequency =3D <1000000>;
+				pinctrl-0 =3D <&cci1_1_default>;
+				pinctrl-1 =3D <&cci1_1_sleep>;
+				pinctrl-names =3D "default", "sleep";
 				#address-cells =3D <1>;
 				#size-cells =3D <0>;
 			};


