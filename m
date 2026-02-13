Return-Path: <linux-arm-msm+bounces-92791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM1AIVQqj2kPKwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:42:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335B136716
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C2FB305DB14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 13:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115DB360735;
	Fri, 13 Feb 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="LNf6rBTy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4134D4F3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 13:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990144; cv=none; b=fM7I7rbgKalUHuEjJkbkYDgV2DpWieRICA9LVWOaGDIIr6RQP9TckixtFjZNi8TkERFcFGmMbwKm5kkatG+tc43IM6iF4lsgyIzjSLpq23RJokts1dAdx2yjsMsgCOH4T82ztNXR/wGkJBcOHcwL52qu3cHPzFs3qbYerOFai5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990144; c=relaxed/simple;
	bh=v21aUaRExic4asjKw5wpz45cMKkg6xm9+FuILH8upa8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=l9uKLdbjuREN+Xvy1hNjDYXpv5B6L8R0w0u2c8Jg8R4wRmjrrjRu05BDyy1FKgcdbuIoIbz2T94Everxy+URMaqvGG0pDXBVp0PjjTn+rS1jvmMr/FPzPnrLgUZWlOHkS01O+HXVZkCALo3ly8vhedExSj8Zij/aBt5fHpKexZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=LNf6rBTy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65941c07fb4so1194340a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 05:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770990140; x=1771594940; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjlPOi80qwfClu6vEE8PfXH4lJ/jNSkLMmn/VxZK4i8=;
        b=LNf6rBTygDqcP8xmNfi2pJ4S53exB9KaAmmL9qCOWSSTNqa0JBULJ0ysMpy8bcTH6z
         Jf4YbJcqqd5mGyDP7I61tYzppb/W0FG0q5flhnSMW0pXHpzarl/RsPZ2qVV5+JNAn/zX
         oP5TrbSRxCaswZsj+U4QPts7sIHHhFQXesGoqtp0JAIfOtwZzM/KoYFWjhTJTQTaqTTN
         MGomhUw2KqXlPAJwGqiNsn+iYV8vIApPYc+xB7bQSewig5t9EBJuUgfgzIDyFTHxcxCh
         YR/Dy4HEUlRmkafw8Xr0Rh3RnM/4z5jz77jXf/fXTm+axKs9pVJQYwVj/KerDEf6jqX2
         afiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990140; x=1771594940;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjlPOi80qwfClu6vEE8PfXH4lJ/jNSkLMmn/VxZK4i8=;
        b=KQmVeD5JCZPR+dr3XO1EXTo3gZbDgii1+HK9Ze068CmOBF/K2Mg4oLqbOeT5IXSqcK
         xKhu6g2/C56yyTrVBXVtBR+Jy9NIALX/OqHV4qhOdto3lp17eD9828ZIc3FSPXWYcWlh
         vWKvzISpxvvp/axHqwkzhTL5e+JK4cA6L0VvF9QPMvLcnvyOHsZFW/afV1s7BsBSnMB0
         KiQKk6Djx0PoGsuq47lDO5QnJj6raEcHlqeoX4SQUUXkM5gf4qwP2HnGMBWDFD3QatXe
         i9AYZoVHsoL9t10jxrzT1T55vh6bGYZt4A6CfT84RkHL6MGhu9E0nSyYqtUclQ+c9l9l
         azig==
X-Forwarded-Encrypted: i=1; AJvYcCWetVFHhx9VkDcg8a2r9tjljbqWfrLrXld5/h+Ki11z47KeNmR8HkjG81Cxw5eva1f6nSPPBJAIzf0DQKhI@vger.kernel.org
X-Gm-Message-State: AOJu0YyzepgxiTwe5x5HHS0lEp2YeC6TSp84FGFDlZg6DQxWBwCve7h5
	Hm9IHvJ6Hj0oUlOAoHGYPVx/xo2Z+9gW18PFmPh8cSZ6Ga6z/MayHn0aDOTy4fS4KMw=
X-Gm-Gg: AZuq6aLHo9HFv/WvVx2AtBFaZ7I577IeMWgi4elfW7z8ZluK+BS/NGK9n7tFTEKerM0
	iGKZHstMOUm100SnTcI86WyzInA7xR188wC603FXUkikDPO5d+HgMlfaCAVG9mHjs/BSkR5sQ8J
	EQ3XllW30S2TEiBSdXKa0Tkw1pwZgLxLUreR1is6VaomaOgxof/PGHF3QW9uvcd7NiFUo9gSyw/
	f3rjbLilFxTN7DpkDDnwqxAE/CM9HPcGacRHB1w00SkOh1U3mHg2pRzytFqQ/4SzzPy1rxYDKgo
	ccafuqEP/688+PpKdvAL+YNioLfJWrGphGA/eJsje/NO0LdUNKucH6TgbcyyUA8xZbf/+hTc0ji
	BU2HTuz05xlFgGkWog7aaX/7ByR0ctLqbpBBPdNUzNmUTQHRsCVzCBBDhzdG73362tH4aIbqyz8
	9OJmtuJcjFbnVb55VmM0F8aLnTwvvqFo1wkHuZGH0q5iaxV+GqPCwbqGQFoDvkLnzYktcSm8gwa
	m5TfCs=
X-Received: by 2002:a05:6402:4406:b0:659:4853:5382 with SMTP id 4fb4d7f45d1cf-65bb13c2f2cmr934664a12.32.1770990139691;
        Fri, 13 Feb 2026 05:42:19 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f137dsm653159a12.27.2026.02.13.05.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 05:42:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 14:42:18 +0100
Message-Id: <DGDVLY6M6E1N.12KFFYAGAD7H6@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>, "Jeff
 Johnson" <jeff.johnson@oss.qualcomm.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: milos: Add WCN6750 WiFi node
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-3-27b4fbb77e9c@fairphone.com>
 <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
In-Reply-To: <5fe80f4a-ef5c-4008-88e2-60ad1f8c2a18@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-92791-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1.5.20.24:email,quicinc.com:email,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,1.5.137.32:email]
X-Rspamd-Queue-Id: 0335B136716
X-Rspamd-Action: no action

Hi Konrad,

On Tue Jan 20, 2026 at 3:39 PM CET, Konrad Dybcio wrote:
> On 1/16/26 3:50 PM, Luca Weiss wrote:
>> Add a node for the WCN6750 WiFi found with the Milos SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 46 ++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 46 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 024e1c9992fe..80feb3e9d3e2 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -2043,6 +2043,52 @@ gic_its: msi-controller@17140000 {
>>  			};
>>  		};
>> =20
>> +		wifi: wifi@17110040 {
>> +			compatible =3D "qcom,wcn6750-wifi";
>> +			reg =3D <0x0 0x17110040 0x0 0x0>;
>
> This reg doesn't.. sound.. very.. good..
>
> The size being 0 is of course wrong, but perhaps more interestingly
> the base address is a register within the GIC..
>
>> +			iommus =3D <&apps_smmu 0x1400 0x1>;
>
> And this is a PCIe stream
>
> But I see kodiak has the exact same setup..
>
> After digging a little into the driver, that 'reg' is apparently
> indeed consumed, as a base for PCI MSIs.. I feel like there should be
> some better way to express this.. non-everyday setup
>
> There's this commit message:
>
> commit 00fd24089b8154ddf5b3e724e2c4c9974b9ba91e
> Author: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Date:   Fri Apr 29 22:34:54 2022 +0530
>
>     dt: bindings: net: add bindings of WCN6750 for ath11k
>    =20
>     WCN6750 is the WLAN chip on Qualcomm Snapdragon SoC SC7280;
>     Though being a PCIe based solution, it is not attached to
>     the APSS processor (Application Processor SubSystem), it is
>     instead attached to another tiny processor called WPSS Q6
>     processor (Wireless Processor SubSystem) on the SC7280 MSM,
>     where the WLAN firmware runs, and it is the WLAN firmware
>     running on the Q6 processor which enumerates WCN6750, as a
>     result APPS processor would never know such a device being
>     present in the system and would not detect the WCN6750
>     hardware unless and otherwise WCN6750 is registered as a
>     platform device. This is the reason behind adding WCN6750
>     WLAN node in the device tree.
>    =20
>     Add WCN6750 wireless driver support, its based on ath11k driver.
>
> Sorry to hijack this patch, but I am not comfortable with this binding
> as-is..
>
> Adding +Jeff in case he has any thoughts

To be honest I find it a bit discouraging to get this relatively simple
patch with existing bindings blocked. Yes, the bindings are probably bad
(not that I can really judge) but sc7280/kodiak already uses them and
it's functional, so I don't know what I would need to change.

Re-designing the bindings and driver seems a bit overkill to get milos
wifi upstream.

Regards
Luca

