Return-Path: <linux-arm-msm+bounces-116259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s7NuIguER2q9ZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:42:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02677700BEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:42:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fairphone.com header.s=fair header.b=GQA4xqTn;
	dmarc=pass (policy=quarantine) header.from=fairphone.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116259-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116259-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 972AF3059186
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8F93B3BF5;
	Fri,  3 Jul 2026 09:40:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2B3B42C0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:40:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071640; cv=none; b=prSG2p6F87RIGqiroqp2r6GTMa1MApQhY7cF0QvlgRhuY/xIQK9uZYUCQkNfXpJPIl9bfzU0fwhOwK3HPDMxUPAg8nV8rZkNsk8aUr3Cg3HA0goMrRv11+p0sPGZ1tXvQDheM46KMRijxIvhbPV4+JEWxEAsMTQrX3Ht0b5xwvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071640; c=relaxed/simple;
	bh=Hspl+mbeRJE8hJkCAm/QgT5mMB+rSBNdrMJ0iv+GN7c=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BhuObDPjOaHJVYG19DHj3RorNKXYKYacx8NceVrPuZAC1gSO4cR4/JrY4x5H9Nl3yfWyqqdKnqBW6qT3CJ/QD15xMOmx7XBuQPJaLpW2irsWtKHwoKzYKhYdaCSviG+dSX6oiHacfIp6EWTL3+7IVvXfqVfnL1Pcf0Pq2umiGi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GQA4xqTn; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so693850a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783071637; x=1783676437; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNqqVjohsqY8yTYTK5W8wByaWx6IeZeY7y7Iq0rzlDE=;
        b=GQA4xqTnFkpzDPCIRgb5oRLjafe008dwoncaTQsxIF+qyGj2znNJ901FOsvrBYh13+
         j3Nch7FIIeIRSmxp1blPUr6thFcIf5UuxYUdoWN1Ktjye0R4uw9zcEaNvktd0pD88FEI
         Edqaz6fCsVMdyWwWxqzspR49fh7xrZi9NEtir8ehGVMl7XN33l70gN2s3bB81+FMHlR9
         BdUYvnfMgPOzbsd7jUm8+xZ+rT64N1C4mQYB3kMLHhgTe9NmRyhJJpztlDhlhtEAgZoa
         2zSVxupAias1Z/jzMc3XbFaQpMkD0D3ME+/OUnRLICdhshyqmJhtl3eWlMZkhbycz5M2
         u6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783071637; x=1783676437;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNqqVjohsqY8yTYTK5W8wByaWx6IeZeY7y7Iq0rzlDE=;
        b=GO3pTzeXPze8A+EhSyKMjhrpq1PyidNKBe2D7XNMukWOt1tqhPBtH4m3MRHM3hoh7Y
         OmHck2AK8IStc2hYlEjWR1dBtGYf5QQF/YAAyWzs4tM++PnQbQw05o0+f73uvLZyfS4e
         0TjIJWyjihWxmYTbF73L9UGPd7LncIeFT3jbq1NapHWioPb89LtlgILGHQ2kTBZWux8D
         trnp6zu9zxkobrhIRlhPdhSpdzQefxizZsSm90zqSnTV+f10Fqn37p9soBv5bFGoVqJb
         Xpq84pbdnMFcviJ3ZROvTSLr2h5c27xXxZeQtKjuX3Loej5U1YXNt2gX2HQZDX8TVArZ
         ULQA==
X-Forwarded-Encrypted: i=1; AHgh+RqqLCLxCyFfcEQmOG53D7rWPc3Nymsc5jr06JW13/XazWeZlTrBPBaVQfG4S97o2hxnfu6GDBko8Kg2I1t/@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYIlimDn0XzaowJAd7+3pJApzSTg0ujSKGZgm0KFErCY+VPBS
	HCPXU0bVnQ92bsll2aZOeooQ1KraoPym5PH4h89oCDcaDLEXK1FdYKYEE8zwEWX+cNo=
X-Gm-Gg: AfdE7clueIlZPAItXOhlyuMvdPmVvf6VKl6u94OWaSp6OgqHnuPOuNQ5AaN4A859dx/
	SNK5WhIh+cIiTGr+EsY5XqZnaH+hELXBg7y7SW37QIdKBtc1AAcIgg3oSMEoB5H2RL926p2YWYZ
	g11Zc40hjeM1rRf00xB5TfYMjUQVX/b8xIKdtE/y4WhXeZbrAFY3TM97BY7qBGWMMDzFR+FLXe0
	e/VzbICi4N6h5poIXfsm/4SAnq4uOriyGK0M2wYx3NTDGC68g94OiA7TNCRrXKxLvp1dF4zuHJZ
	xP+NV1Uckktfx1se6ffcxN7M3cciieydjDabc5Fyz8loKqb+NVuJ0kNrV1dmEMy1zPYfvLGtgxM
	8D5sCu1tyx0g3Yf6OsnJUnlzh1GG6H+PJZC8uKfPnx1IfCMzkIf/YdjLX4bAS5gYYDGBaPaTFqW
	7dYnXBjh06/rdFQzoNIteopbPdb+Zv4DyoglOvIeHykEU33quNcPPwsNIiSg==
X-Received: by 2002:a05:6402:444a:b0:698:3b7c:7e42 with SMTP id 4fb4d7f45d1cf-6989f3ad97amr4246456a12.34.1783071636657;
        Fri, 03 Jul 2026 02:40:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad100004sm2179433a12.18.2026.07.03.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 11:40:35 +0200
Message-Id: <DJOU552LDYD1.96KUPV8JI0B5@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] Correctly use TX macro v9.4 for SC7280 / Kodiak
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116259-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,perex.cz,suse.com,chromium.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,fairphone.com:from_mime,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02677700BEC

Hi all,

On Tue May 26, 2026 at 5:29 PM CEST, Luca Weiss wrote:
> With the v9 data, that sc7280 is mistakenly using, the controls will
> have completely wrong names and using wrong code paths that do not apply
> to TX macro v9.4.
>
> This is an RFC to get some feedback how to continue.
>
> 1. We update the "qcom,sc7280-lpass-tx-macro" compatible to 9.4, break
>    unchanged dtbs (the sources are updated in this series) and break UCM
>    until it's updated.
>
> 2. We add a new compatible "qcom,sc7280-lpass-tx-macro-fixed" - name is
>    just a suggestion ;) - and make sure existing boards with audio keep
>    using the old "broken" compatible. This should be completely
>    backwards compatible, since we keep the existing compatible working
>    as-is.
>
> 3. We add some dt flag "qcom,use-correct-tx-macro-version;" and handle
>    the rest similar to option 2, by opting in boards to the updated
>    behavior.
>
> 4. We keep everything the same. We know it's wrong, both the
>    audio-routing in dtb and the controls in UCM have incorrect names,
>    but it's working apparently.
>
> Please let me know your thoughts.

Any feedback on this series? I'd appreciate it!

Regards
Luca

>
> As a bit of a note where I'm coming from, I'm working on microphone
> bringup for qcm6490-fairphone-fp5 where so far we've been using
> qcom,sm8450-lpass-tx-macro to get the correct control names. I've tried
> reverting to sc7280-lpass-tx-macro, updating audio-routing in dts and
> UCM to the v9.0 names and it does seem that microphone (AMIC1) is
> working with that, but I'm not particularly happy about leaving the
> wrong control names everywhere, so I'm happy to try and untangle this
> situation.
>
> I'm also not sure where this v9.x actually comes from, maybe I'm lacking
> some documentation, downstream kernel only refers to Bolero v1.x and
> v2.x so these seems to be a completely different versioning system.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (2):
>       ASoC: codecs: lpass-tx-macro: Use correct config for sc7280
>       arm64: dts: qcom: kodiak: Fix up LPASS TX macro v9.4 control names
>
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  2 +-
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  2 +-
>  arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts         | 22 +++++++++++-----=
------
>  .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 22 +++++++++++-----=
------
>  .../dts/qcom/sc7280-herobrine-villager-r1.dtsi     | 22 +++++++++++-----=
------
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 22 +++++++++++-----=
------
>  sound/soc/codecs/lpass-tx-macro.c                  |  9 ++-------
>  7 files changed, 48 insertions(+), 53 deletions(-)
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260526-sc7280-tx-macro-1179d786af1f
>
> Best regards,
> -- =20
> Luca Weiss <luca.weiss@fairphone.com>


