Return-Path: <linux-arm-msm+bounces-113947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c2amAWLyOGrCkQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:29:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6E6ADB63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 10:29:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=tJlpr39N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113947-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113947-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2923305E1B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 08:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E43B390222;
	Mon, 22 Jun 2026 08:23:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066438F93B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:23:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116628; cv=none; b=Oe3AyAB4VddYXc6gNOZn4yEoqN2IZzhcRZHLi1IGyI7TlK/fkehg3e5LOya1+cA3OEzmZ4H/rjtTiCX28oqcZU9ey68/qyPUiCtGu/imZaJ/5Y5F5JnCThJIZ5OGojFkpf65xM47FNJIm3m5ZUszInVA/x3MrnamwQe0ix8Td6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116628; c=relaxed/simple;
	bh=QayaNVYMdk0y95PRvg6tdQ2LISbdzw2ou3QRiLXOzkc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ndSZarN13RFpFFoSUc4kd9tCqH/o3w5fyS5rKuW77GyuHmWG+xSTsuM9fUkg2m5rR5TmN1dlOnyZYcks3A1fuwbqug7iJk1Mz0FS8hQKa60U5HV9B60FmVRqGNFbAkHeWf7vbDToTvd5QgUURDl0m0TUDDJv9E+xXvhlyGqGguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tJlpr39N; arc=none smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c0c41ff84a6so257616166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782116626; x=1782721426; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QayaNVYMdk0y95PRvg6tdQ2LISbdzw2ou3QRiLXOzkc=;
        b=tJlpr39NE7yGwJMaIA+4fM/aUP1Hj/FhwSsW4fmioS66ZE3OOwUcuWDkxxKVorhLis
         ZMgOkPIMXJQe+NTG5ZYUFKC1TkiBSBqKtGC7VCVYnihn2NP+AObCyhcwr0k99YRahxiN
         Ut8EEBIEMisEfVkXJO51acgdZVEq5FvPCJIR11zF6xQfdRy6LBjqUIw6qH2RoIglLiIF
         FqgRTlmv6E9iS5OQu8dskQDGJ+6Gp4luIohKuR30FITZCi48YwX3TgPH/IQ2nMW2uXcJ
         1DfMYK0YHbESilAQa+voh/KPbAutCuxeBgfUBsg9UNj/I5+5DrwJvBlGwqm7pL/rbVom
         oesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116626; x=1782721426;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QayaNVYMdk0y95PRvg6tdQ2LISbdzw2ou3QRiLXOzkc=;
        b=MxftwUbd0nsJzOgMO6B1yAttryHc5EW2Eb2mp8+63JjxJvu8Ip+Agp9ZBsEzIF6MEg
         T443sb+PNfitnkHmDa+rRFsucaGrZVMrBPXF0KMb44VyNFZx45hLr8R3I/0fcJ3w5lCR
         Uvlxwe2LMHS3TbHPXgpAwkhWr+zJlzLdcQ2tX3TaOV40bHT5eCfukD+qvwRruVgTmGdB
         9wuXNohDC1iJhCplqV4sWqeRHJl2hBzLvk0FXdjKZd6p1DWt5YZfTm+Yt/49wiMCVA17
         AGGq3kkjxGNTur5y9Ckbsr3BzBPoQq/Cx/HHzu1ZN1ka5arRSOu5llEhp2otvO+qlqIR
         lbwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9PgdvdADUcXX8PHIPFvtyuD77h2JG4vRo8VyroCnu2IDLwlDS2qjJiPvfZSQRRg+meRpi1/LQLU3kYPvT1@vger.kernel.org
X-Gm-Message-State: AOJu0YxleRuzuleDelu6YvSeZOd9eExWP3f7tFgVO27SgndXrAoRd3ct
	R4u0rNdrpEpWia8olPH2vmtm/JwpZNOEVzkIb9EKy5ZGseUtxmbTwphbXPXm8ZlVOKU=
X-Gm-Gg: AfdE7cnPd8fSul8TOquZdSMStNzIE/btkvEelPA29cDB8AvUNYfQzF8Nxa8nwzyZBlT
	chX2GDJeSox2kqCXLOOmb+tqpGf8yCQpVrn3DYQMKC/oK0n6iTMs9GbYNQv+J1MhMsvc6W1NtBJ
	XBLnJwkulGD4pG1XTswg7jbMdd1tYSkxaWd745pMXRPaQHVVk7xGof0EACI4oWTTpmKY1ESNxDj
	+ZVWDhx29EecA7e5tswZCQH8LDH40GVG+yj6yPWeT44NeHMXgmZFkl5aA8MxtQJdt8eDzzs8wBY
	gSXo/bwGtpsTpBpjftfwZzfkZn8GnTqqZehcFJ2HT2mf0v2Kc2TGYYV8MHTj2xHBMwxiKAKH2Lt
	qUowaiVj/1nst9ldu33NF7X6sKt5/MQX0M3M5dvsC7FjNAoKRjJp2y9AlaGMw4NFYB2PZO0PygL
	PkrDdwJXxi8mRzcsMPQhRuSL4Mrae4ZdKjunQ2aZCEjMfgKn4mGHXWEQQcmHKax64UqQoxSdaEf
	GL0q6/NDjBOst2PTCcy/wmfJcM=
X-Received: by 2002:a17:907:3e9a:b0:bfe:ed74:524 with SMTP id a640c23a62f3a-c098f33a0f1mr679421766b.51.1782116625717;
        Mon, 22 Jun 2026 01:23:45 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac97aesm310087666b.30.2026.06.22.01.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 01:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:23:44 +0200
Message-Id: <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
In-Reply-To: <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-113947-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,fairphone.com:dkim,fairphone.com:mid,fairphone.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CB6E6ADB63

On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
> On 5/22/26 4:46 PM, Luca Weiss wrote:
>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>=20
>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>> equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
>> deletion of power-domains properties then.
>>=20
>> This follows previous commits moving Chrome-specific configuration to
>> the correct file, leaving kodiak.dtsi for Elite and
>> qcs6490-audioreach.dtsi for AudioReach.
>>=20
>> No functional change intended. The clock-output-names property will now
>> exist for both Chrome and AudioReach devices but this shouldn't have any
>> relevant effect. And WSA macro clocks weren't added to Chrome because I
>> don't believe this would've ever worked given it already referenced
>> q6afecc and the nodes were originally added during AudioReach bringup.
>
> I think it's better to keep them, if only to make sure that the result
> of dtx_diff isn't outside the expectation of a commit that claims to
> only reshuffle data for these platforms

I documented this in the commit message for this purpose.

But I'd argue not putting (likely incorrect) wsa_macro overrides there
is the better thing to do. Probably somebody should've taken care of the
Chrome platforms when adding the wsa nodes in the first place.

>
> It looks OK as-is for Elite and Audioreach platforms (for the record, I
> checked rb3gen2 and FP5)

Thanks!

Regards
Luca

