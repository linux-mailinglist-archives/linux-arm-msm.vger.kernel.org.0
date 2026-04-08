Return-Path: <linux-arm-msm+bounces-102273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ7FKdoO1mmxAwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 10:16:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECAB3B8E03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 10:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9388D303DAE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 08:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3A39D6D5;
	Wed,  8 Apr 2026 08:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IFV1Uasy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC6439D6E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 08:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635886; cv=none; b=HbbjzUyVIpWocWvccnJDHIVUZIi1tepSv5TqhGxsNk3NF7jvQFAD7EgCMNZwuVf7Jk614s+MOxEmfKspfiC6cTN4F0yMoRZyeMTwWOk1ljiUB4KG0VYiPPpZ1mUzpIhURX+/Ht20ovVXQXfcMyD2nCBEvuJ3KGg8U2xTefocGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635886; c=relaxed/simple;
	bh=qK0XOhdUp8ewL5EwkKLZy+s840v+LEgMIWvVBSzPG1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dlEvHCjPBmic/KPihdHAHsOqfZ6w366PH9cz+yo7Ofk6P3cmN89UAUGUsdOxUTYBu/K+Y6DwX6NacXQcKYrEXF8xLSgv+arUz+pz2nwu9dOCAlpWGgLJvtDt9/rd8ZuQgYCl25VS+0757St0TJikT5QUC2zpltWOcoT5w2BOUJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IFV1Uasy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso663771166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 01:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775635883; x=1776240683; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS7jjiupqdwNkh5OVoHcVKRKm0KpURxAwvyTzn+V6qk=;
        b=IFV1Uasyu5dKvZ/kbi3oSrrcuNBV6c44rIuZRFJHMQkeu3DzNZYMlWd1tHOJeD9Y2n
         oWmvlk+kJVL803bJIcsYduQI/QIgfPM4U+AcfrIMdI/35hufJeVF79Il5OnPQqDVzWrC
         vt6gQTn7rM5T9Ev0DDbS9m/dI8Hkol+OEt46FFQ8S4WpUDEQ/XSbS8Swg3fdes9KMLfz
         0g7tq57LWUbmk21doLWlDjGd0IKr/RmgzY8/NcpQwoRrOy6Pe00I3bzdC9A/Fjc1v9VD
         3xhL5b4EDtx3CeUBDTF6gMkcaDxHDTseL4Ch6Ab9Xfsk0668G7yvin1SimYIsFu2BSmW
         BS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635883; x=1776240683;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XS7jjiupqdwNkh5OVoHcVKRKm0KpURxAwvyTzn+V6qk=;
        b=SV3YdauVWqeMaf5TuxGHvCyOsvlf+ZV1t5V2DZWLiSVeYyyIq8VDOOwdaeMJX0ZzPP
         Pmvler+OqcVzmzJ732D4L0BkZTx8AVbgo/W2ZCFUqXQEDM7cb4Nd1Krmx8A8ssywHa4a
         yQxCqmrF+4/ZkRsW7hwnj9xudbwpFRiOaTGDGmry+Kxe0rygGo2RlM+QwsOVlNas8oC7
         v3ZNRX1YIR487UoE6x8gHC1jiW1cnrm3qtv0d6etSxkHKbZENBeTlSVZeA3pa4Z/oCOP
         zfAtJjWJ9HqnJNHAlchMW+CyMctD9g4cByemIbKLT9a7/zW8nD3zjustwSv/dtQL4F0t
         2y2g==
X-Forwarded-Encrypted: i=1; AJvYcCWpVtSN8kLO+A+ifkvmta5Wqs/k0Rdq6xOiMrAjItrEkySxzoSzPlazyexVdy35N5aq/1l0fnmGlS2BeBO/@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcyscR9/6J7zJt+TYCm6DgwTxnUFEEmmc/czkmNjg/2I/gM5G
	uKXkqr3uEvdbvyt6bNrCFUq94BLM/3XV4p9TiCU8a5F8NCBAm5a+qcjY2sCxL7xTVKlTSb7ZgJC
	4pMIHPv4=
X-Gm-Gg: AeBDievIJtBOtACCULDPVi5Qw4whhacLUspbZswceI3x5TVmhFOAuEC7NZYPVM8RAm5
	T/6iHNEp8pOBbl7Kp0NJqpcrdzEtt9FpY+gRu1HSbbHJo59YmgHleheSs4Uz+QF92uM0oCylLE3
	1VbQKlOOvjOFTNnw5S2ldrbDGbFFEwBTCyiXUhorXHdmVx7OYdJhmd3izMi06o9Eu2Ov/Ckq7Ul
	e55D0mO+4OlX16Co+UYoXqrn+NumGi0TvEG8bjo71tpEWmoFlUbXbH1xDSpqof4cwSFCylVF9r6
	djubNXJmIMcbRjacePjIQzeR5ktHHKZsP/g7CeL3vx57dKoTWbiTLAjSGYjrHuwaCxiBSQzdTKg
	b9kS/zsXWH2Mz29dq9aI3cxsqp7UB++sorZqLczGW/C3IKVRnppSMtUgF8AnG+k/5UrQ2I7ofzr
	Dy2fZPbiHg5kQd+AInnnTgNVwGuInDpoQDVjqYxokfJZ51NE/twewa8kpB+WrOrFgOE33G
X-Received: by 2002:a17:907:9302:b0:b9d:14e9:8416 with SMTP id a640c23a62f3a-b9d14e99155mr231127466b.37.1775635883060;
        Wed, 08 Apr 2026 01:11:23 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c574041sm634897066b.0.2026.04.08.01.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 10:11:22 +0200
Message-Id: <DHNMDZ7M0BVS.36Z923XKNXPEC@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: milos: Add IMEM node
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
 <20260407-milos-imem-v2-2-5084a490340c@fairphone.com>
 <20260408-adamant-hairy-galago-61deed@quoll>
In-Reply-To: <20260408-adamant-hairy-galago-61deed@quoll>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.223.255.192:email,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,94c:email]
X-Rspamd-Queue-Id: 0ECAB3B8E03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Wed Apr 8, 2026 at 9:34 AM CEST, Krzysztof Kozlowski wrote:
> On Tue, Apr 07, 2026 at 05:11:11PM +0200, Luca Weiss wrote:
>> Add a node for the IMEM found on Milos, which contains pil-reloc-info
>> and the modem tables for IPA, among others.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Not happy about the names of the subnodes. pil-reloc-sram is not allowed
>> it seems. Glymur calls it "pil-sram@94c", not sure this is wanted?
>>=20
>> Please advice.
>> ---
>>  arch/arm64/boot/dts/qcom/milos.dtsi | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/q=
com/milos.dtsi
>> index 4a64a98a434b..0c69d5810f5e 100644
>> --- a/arch/arm64/boot/dts/qcom/milos.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/milos.dtsi
>> @@ -2289,6 +2289,26 @@ scl-pins {
>>  			};
>>  		};
>> =20
>> +		sram@14680000 {
>> +			compatible =3D "qcom,milos-imem", "mmio-sram";
>> +			reg =3D <0x0 0x14680000 0x0 0x2c000>;
>> +			ranges =3D <0 0 0x14680000 0x2c000>;
>
> Use hex here as well.

Will do: ranges =3D <0x0 0x0 0x14680000 0x2c000>;

Do you also have a comment around the name of the subnodes? Do you think
they're okay as-is, or should they be changed?

Regards
Luca

