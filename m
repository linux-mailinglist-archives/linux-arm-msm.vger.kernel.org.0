Return-Path: <linux-arm-msm+bounces-96899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIemEOsisWkOrQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:08:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B825E9C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DF3D306DA60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 08:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B4C3B38A8;
	Wed, 11 Mar 2026 08:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="oUqoX8kq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB47A309F08
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216265; cv=none; b=P7a+l8v3UT19+0Ct8fT86nZluexb96leQtexFLswS//vhgzfyc9OWfUAqDDrXWHyIAXI3FIcLgGmjIY8/vVbkR1P/73S2wKFVZBDiqeeYwa2CQV2pCLoyceRqyNFdhrY0bN4XLwXADRT/N7rEed/GqdHFQjRyLA0oR9R+atdm50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216265; c=relaxed/simple;
	bh=khDVMinyRktjp81VmTv78vhuR5dfLwAEQX0dFp8erl4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Y+VTiKaGqg0iwp9I5//dFV4eaI9TrPwrHVO7ASDM8TODKyqN/DGaxi8R4LO4TZ+ZVVV6c7jSSHO0OfqeNG/XcWoov+aBFhCnc9xy6SY/Eol4/S39jf/hhFcuJO9ahJET76ifkscZFsrRvzkmpXRPfDaO3mwBxdlNOZ9uizMGZ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=oUqoX8kq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-660dcafc85aso13333174a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 01:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773216262; x=1773821062; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSG8jCrZgvSAYH3ST0w7E15BQnOuBJZtxXBK3xYNciI=;
        b=oUqoX8kqAP89jNayDviF3q4pftyP1lM14c5hxiJpdKaU9ScxErvL8+kNw/uZrRFBFJ
         HzZWhtoEzEu3bHw/CkOX29AXUMUO1dJGGdhJ+/gEG0D9QD4JA4IVLoV0EAz/uBCRnF7w
         svTFaOFM8EMKKb/8/n1dz5/xzHbzzY6OUm7cW2rGzrk+N6x8a2QIz76lDwjOjdjaPyFW
         16PqMotxrtSDONDngnDtikJRVJaIWvQhmeAC5w/Cga0nczajBEwibTIvtDNG8zn3PBbQ
         5mk5BGgwpMGzKWOOhZ8IZwg75OKNVGCbQBZcLFrtVfGGbNrxAFyNUDKb2JAAYT4nkPB1
         HXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773216262; x=1773821062;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSG8jCrZgvSAYH3ST0w7E15BQnOuBJZtxXBK3xYNciI=;
        b=JdxEPQcNBX9uWW7FKT2oHjBXYM5DRyYeLicS8URf6OQH5kGCKtW9OfhudQvd233t9X
         OR2vkHjfOMIdghOUjD5Y5NmR5juL8VLNcbYvHAf4bw2kz2JOj8oQXDHNrKVGEPjGSrrN
         u6XCGR3kZW34IuwMHD7/JXdSKXwe4A9nINgB65Uws0ogUEm2zFGkBj2xqe0TdgAOvGR6
         d6b4wv4wr1wHV3TnufyY3/iml/AiPwmaSOGIETIwTW9/tISfxALUDCX0A+WBYeQj2jO7
         vpzIa7YhCYrZPH0MfSTFwQIRBrR1g04FzFJuxpTjvdcOwWb2UiyCI1TjYwZJe0/XWnJ+
         qmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl688aHkIVkIV3Op9bvgORYi5cl++JNZnGOZ85gJhdPk9BGsUb11SUhWkVWO8mXlGYbkGBCKgfXhSFKP8v@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPKAwhewU9rcPClgUAXcb7ii9Ny//LAnK2F4rNgpjmq0pqXYb
	T5ofjqQpsAmgT4srHZKudG9lUW6iUMuCwv9PbbT8Tboxh6sudMlbAdZZZq527e42Ybw=
X-Gm-Gg: ATEYQzx0tJOpfP7S9CZxxRUu74/qb4QR1U2C3VCeRh8NSbel8h3SXoTdl+/0RU5jWRQ
	Oc1ZmnvoHdWFuJ3RvFSK8B3wp+mZRJxm0PyPTWmncCdrhSsUtcQa66h8g0/havtps9QJczwHDMV
	W/kPS7Nbr7S/Zemu0MNTbdGfxwC0QYU85w1E/IQ0Dm1fnU1y6gq/mcTmzl+gvUU4mdOlqVsxH0p
	FVRQYx5hWx0xS/nlRFU5TD952iWBfLC+uLbHppRx64u9BrEITjbAr4M3MmMUsNrwExBVQ0XKQ3D
	LDmgQ44ZMZK+Sej07h9X2MZVnrEjbujZlTbrNhWv9Mg88vo3cFGQxttsgGJ5seYgNCcpIylkJIw
	WJpvxkd9jmHm7eCDLwVfrwo3IpcGCA9adX/6c52IRP+cufQe7j0w42ZidhJXK1j6k6Mn9aLAPw0
	fsNaPKIckYekpSxZmrQj7qiqRbajJjW72eSFEp7u+IEZbSB7oPclnl1QgIad0OrX0BqIAB
X-Received: by 2002:a17:906:7314:b0:b97:23c7:2b54 with SMTP id a640c23a62f3a-b972e61897bmr85765466b.49.1773216261981;
        Wed, 11 Mar 2026 01:04:21 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de0bd42sm37527166b.9.2026.03.11.01.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 01:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 09:04:20 +0100
Message-Id: <DGZSPC64B8K5.3HBPHWMWXR482@fairphone.com>
To: "Conor Dooley" <conor@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Eric Dumazet"
 <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Marcel Holtmann"
 <marcel@holtmann.org>, "Johan Hedberg" <johan.hedberg@gmail.com>, "Luiz
 Augusto von Dentz" <luiz.dentz@gmail.com>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-bluetooth@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add
 Bluetooth
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20230421-fp4-bluetooth-v2-0-3de840d5483e@fairphone.com>
 <20230421-fp4-bluetooth-v2-4-3de840d5483e@fairphone.com>
 <20260310-maritime-silly-05e7b7e03aa6@spud>
In-Reply-To: <20260310-maritime-silly-05e7b7e03aa6@spud>
X-Rspamd-Queue-Id: D84B825E9C2
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-96899-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,google.com,kernel.org,redhat.com,linaro.org,holtmann.org,gmail.com,lists.sr.ht,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[fairphone.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 7:02 PM CET, Conor Dooley wrote:
> On Fri, May 12, 2023 at 03:58:26PM +0200, Luca Weiss wrote:
>
>> +&qup_uart1_cts {
>> +	/*
>> +	 * Configure a bias-bus-hold on CTS to lower power
>> +	 * usage when Bluetooth is turned off. Bus hold will
>> +	 * maintain a low power state regardless of whether
>> +	 * the Bluetooth module drives the pin in either
>> +	 * direction or leaves the pin fully unpowered.
>> +	 */
>> +	bias-bus-hold;
>> +};
>> +
>> +&qup_uart1_rts {
>> +	/* We'll drive RTS, so no pull */
>> +	drive-strength =3D <2>;
>> +	bias-disable;
>> +};
>> +
>> +&qup_uart1_rx {
>> +	/*
>> +	 * Configure a pull-up on RX. This is needed to avoid
>> +	 * garbage data when the TX pin of the Bluetooth module is
>> +	 * in tri-state (module powered off or not driving the
>> +	 * signal yet).
>> +	 */
>> +	bias-pull-up;
>> +};
>> +
>> +&qup_uart1_tx {
>> +	/* We'll drive TX, so no pull */
>> +	drive-strength =3D <2>;
>> +	bias-disable;
>> +};
>
> I recently made some changes to pincfg-node.yaml to detect if there's
> conflicting properties used, and these got detected. Should these not
> do what has been done on the msm8998-xiaomi-sagit, and delete the
> inherited bias-foo from the dtsi?
> &blsp1_i2c5_sleep {
> 	/delete-property/ bias-pull-up;
> 	bias-disable;
> };

Yes, you're completely right.

In the final dtb qup-uart1-{cts,rts,rx,tx}-default-state contain two
bias-* properties, this must be wrong.

Thanks for pointing this out, I'll prepare a patch soon!

Regards
Luca

