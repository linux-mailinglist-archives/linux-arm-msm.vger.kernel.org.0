Return-Path: <linux-arm-msm+bounces-92750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qcSNI5fajmkiFgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:02:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B3133C4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F76D301FFB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 08:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC7F23191D5;
	Fri, 13 Feb 2026 08:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zjKjcdwd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF63191BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969748; cv=none; b=k5GSA7HQgCFLfUZt6bEyjqK/ju1zq1GduYiZuD82rOn8yXBZfqH8Xh5kRlsjgdfwTUASS2pVX03SnwneYOKbq8GBT3lhKfgSliDaWkM9/5/ZPDGn3xEU5LbABGgOG/fR3thehjbg8LxM8vQp66dMDZHEq+mFEqwjBmBT4vNWZNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969748; c=relaxed/simple;
	bh=YuUImcaHV7Y1d4T5vAe0F0a09U37V8B1PbdWpCRJ28k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y+Kx74aXhgPlZJje3X9fInkEmheMwuO3fQFFUXgv+BVQnfWozUwXYqGXUWQ5VvGMyniLLJdeIwuYs4Iw4/gas4JsEw1x2h0Fh1D6iQMzE22baX2WSeqX8Ji91MZRr7TXeduW9V05IFwsJoKIhDqEOOoqU+Q85MTAwJVpEaIr338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zjKjcdwd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so78296266b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 00:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770969745; x=1771574545; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuUImcaHV7Y1d4T5vAe0F0a09U37V8B1PbdWpCRJ28k=;
        b=zjKjcdwdWtGzi4G3h2O7QBvlOBYfzGGuC6EAVCixrH2GMmErXvcPxUKLOnZH6Z0xnq
         K+dJVltop84bt7KdX0TZZIZSjWitYHogW6vJblRNzLiYfvPBrIma2U0VvxOaoKrqBNy3
         j2ovIK8AQxL/uh4Cmcy3swy03YbAhUBsZvccXYFTzdRKGisLHslhI97KhCwy9IsCGa5W
         Ew4YQNxEp248xa7Rr1LQumuaekqO9IYS8RFdlTDrjdPm9Y0EmTTc7k8JSh2uBJbVEh4/
         NwqAV6lMZgJ7lC35KiQv+XuXdfQQFkXixr5tZb9X71wVQc33aGjRd/zHmrPL1iAeoFEQ
         Lsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770969745; x=1771574545;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YuUImcaHV7Y1d4T5vAe0F0a09U37V8B1PbdWpCRJ28k=;
        b=Ir6bk0AXxPIwpF1e+6gApktvOE08fRhqnCUtGE3Zs5nGZlFsr7XA6foCMqu7GbPnJu
         QO3zaV+KLFhdwhQDGUm6LCqAwNv9p2VLYYYqf8tsJlrVTsdtnZwYyPlnsfGmd9c39Vcz
         79nikVWVqrBoLNcZHNGiFHiclcm1t13SAgV+JAqfnlcxRJFerK1alP2uxf0Ev/pJgHgm
         VLzx7QWeiDHQcfQ4aiFMJaMCOqTobRmqRqzn1vfzL+vSUtWWB8B/8ry1VFICXySI1MkU
         LQkxbc6CpMsuKH4GB5N4lqj2dsCxVjqmXr+whLiNKDCN0vcg2A9JAVB1NPY8/ciBxYw+
         KwrA==
X-Forwarded-Encrypted: i=1; AJvYcCUc4aanboLTzSizqGIUSKpG8IIbqGqDA4hjH9gjqHIl1hZVwBpyuCbYgiLq7KxnK4eXS8l30V8mUlhW7sRC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6tAMOLmZx/GD+EASxt4sG88qWzxkvCHeJEZi3tpoihVxzWeiD
	od9Sc6aXODe65xZaqQclWDwYnkTeI7xK9fGvxjf5eTZDNgseT1hrZUxZ2L1xPjHVTMA=
X-Gm-Gg: AZuq6aISUdUVAHBCOC9IEecU11ccU+xV+6VKg757qGMx9NFLJVS7e0BcKWbm5IClJan
	BjcP+Ul7j6gASvhrvoNLjYgZRBbiq1jCYHVvhXP534gEl1VKD9NuoijrUFFSWfKRcckegug+gDp
	6FXeBY7CdOKJmUA911/RoqIS8pyWdd2eS9pnt/IvJal0hpFDKzC4L3zpvGKaR3lrLN0EnJ7jT/o
	BGmFHbsh2TE/6nFpEShPOLIxLKbSUfZVSnToJ7BLLJf6CkfTDx/jawKu9kKFQ1YcPKOEPmXydLE
	rGKNW/XN3cLPZZwU63epXYpGzrf+bKJxPDK7qWEfG4VhCgObGh5huTdPhtTb+fCSY1ZUxqneOoA
	MS6tIrzWJ4ULHeIkavJ1+Cv8QFifnWFcvnsBGKITToXuNw00gjv/PDbghRkyGGE8DR/RbfD7e7P
	XhyCSlEV61qeC6+OfszAc6bAUyJ+9ElsqPVHRsD7yB6YQATNmYXaA/MubSSk8HFImg0AGD
X-Received: by 2002:a17:907:3e2a:b0:b83:95ca:23e7 with SMTP id a640c23a62f3a-b8fb4176f79mr42051366b.4.1770969745217;
        Fri, 13 Feb 2026 00:02:25 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec35688sm234531566b.51.2026.02.13.00.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 00:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 09:02:23 +0100
Message-Id: <DGDODOW5NS9N.AS3NWJ3VOID7@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Bryan O'Donoghue" <bod@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Todor Tomov" <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Taniya Das" <taniya.das@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid> <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com> <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org> <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com> <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org> <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com> <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org> <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com> <0a114896-ffca-427a-8761-977dafa73ea5@linaro.org> <0392b41d-3a95-4c77-9267-bfa3e207013a@oss.qualcomm.com>
In-Reply-To: <0392b41d-3a95-4c77-9267-bfa3e207013a@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92750-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,fairphone.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD5B3133C4A
X-Rspamd-Action: no action

On Tue Nov 18, 2025 at 12:50 PM CET, Konrad Dybcio wrote:
> On 11/18/25 12:08 PM, Bryan O'Donoghue wrote:
>> On 18/11/2025 10:06, Konrad Dybcio wrote:
>>>>> Konrad
>>>> vfe170 is what we have on sdm845
>>>>
>>>> So I'm just asking Luca to try the sdm845 method of waggling this cloc=
k since what we have doesn't work.
>>> It's of course going to work because this way you're not calling the
>>> code that throws this error
>>>
>>> I was curious whether you know the actual reason why this is being
>>> done in some other GCC drivers
>>>
>>> Konrad
>>=20
>> No notion at all, perhaps as a workaround to this very problem.
>
> I tried digging it up, but only managed to find that there is a signal
> between titan and gcc to request it being enabled (perhaps that's a
> fancy description of hwcg)
>
> Maybe +Taniya would know? (context: sm6350 gcc_camera_axi_clk stuck at
> 'on' when disabling)

Coming back on this again, anybody got an idea about this clock issue?

Regards
Luca

>
> Konrad


