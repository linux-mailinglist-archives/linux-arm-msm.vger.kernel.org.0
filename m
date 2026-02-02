Return-Path: <linux-arm-msm+bounces-91464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKg6KQh6gGne8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:18:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 614B2CAC48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D26A1305CA4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8B7357A34;
	Mon,  2 Feb 2026 10:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="V+K9Fu5D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1EF358D3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027283; cv=none; b=VPLsfUQHISMZAy7usUiC+fb+AcBFdYqiCJZdR8V46JAZPw39NwB5xM+26t4eWtmO41EEuxfBoiNYU02sHvyvG7X9wri3mDhLw6MDRtxT4ZtMgHdsuKBUaN+mT1WtAGiId4fD/7exJvApnJ+otxaWqLqEpAmUa+K+Eb2U4Br1RlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027283; c=relaxed/simple;
	bh=2auIHPqsiVDrUHz2mfGeHvAJ5QYC0LUiVSGItMyWde8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iusQWMx8weTQrkHqwJqELKU1s5NCs++/6pyR3k/y4VBI+7cKm8GpyEaDyhUWiaT32YdMGfM2UZeXYpJq10vFgwK8O+YuPtfPQekiHogTjQNQDXrkIIMtG2RpJRXdL5W0iW+NBNr4K0pAvDXTlJsWUmv5KhmHYjHDzJ8lq6UKDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=V+K9Fu5D; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4359108fd24so2574572f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770027280; x=1770632080; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jr6CwQYi+BmExRh3DhyFfDwqTiLalKND+P2i3zpKjwg=;
        b=V+K9Fu5DtNA+L2iWRTqq32SGjUjrf2gUTe7dEszqRc5zMLtA/ZUbesQXh/pUxwDXT0
         etprW+C+0LPRXiXyzEwFoDNGSHELadGytBozL9+GHtBz9rgZCLBE3YCN/bLCB2N6vsKb
         1QXiVuO9nny1QVLyh9KUTY2LqWvNG43gYaPFHNjwDGN9+Hjq3AypqpEh+Q1+Pg97MfG9
         fy7TYkhODBsAyJvgS8sBXo/2neLXKbVQDgvuclKIm77kErntEfpAO6rPt6lFjHFI8LhU
         ebrCpC58yN2ilv5mqIvgGokIu0IVL0IkV7aBEmcLc77VPv7ba1/K+EMskBxIbDxOnl9m
         rCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770027280; x=1770632080;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jr6CwQYi+BmExRh3DhyFfDwqTiLalKND+P2i3zpKjwg=;
        b=Z9SlTzGSbWafQt1JOuKHnawaOeSzzGYQhdSWDFuI/w5+yWitD2N2p1n8KI+CA1/kp1
         AKhRP+6s5zwFuzjugL1BpRqZaX0pR0ZLKm0esSFZCvFIPYOr9PEniWITh2wivapGbMyU
         IsDhxMPSwZF7/7iZl42oRiRWnQNpwRdLJ5Dc7CaE2CJZ+N8MObcyHhh6T6RFrYRuDjlA
         47sezRIkRkdTcTpo+Uo9xEF0aZnBBA5mYI9NbAE9o41ne2/4crXSFblL8We5uhaefkX9
         FXIjwN54mfdsvXKlq2+VgheX+sWxukHGw4gHc/zFsRGJoJy51BgPnnDqNIKNuQDJnWB5
         O7gA==
X-Forwarded-Encrypted: i=1; AJvYcCU4QL8VlE8D66h8JV9fNdyCjv4Ys2Y1PMJEM81wtfLqsGR3fgzIhnnIDWGuuXnisqny7i10t7dNrqCpz5BT@vger.kernel.org
X-Gm-Message-State: AOJu0YwlhOZGEwNO4zNPBi2q/YdEMmbNFpm3hqEK1zDilOuj9fMpxXJk
	lMwPoguLAp2cBzkyWalcQlObRVwDLC4YOhQyDhnQpBJ6vxsCDJznCTOpnfI+UeL7FyrCubb5TLc
	Z95CJ
X-Gm-Gg: AZuq6aIPBle5LXiGzOfbT+GvMF5jwvVY2OxfLS1OJAUGuSY54xtnfXkz4soUE/8bKiN
	ueiIMnSpj/GNBqE0qJ3y8fJdz4pZwlaQ/cDamKezNPK9lqQYmRLQWissiD74WAW+aTYeTOeggj1
	ij8xd5NFehl/A1mF914Ut2vfjfl2gQGVRuuO1oqCXwcacZGrB35cUps6uvJ1vg6CLfkritUJHmJ
	9TM5RHHF6g+eA21ugU02PSwesfnUCLRzAuLBun3LoH8434Re+f1SQqGysXVq+4hkDAMfZgXlGGy
	K+bzs+miCjYdy/NmGQiDXfaYTLAt1I4HfY0ZV+9uBCtBMOU/wsQEIGQYu2xYso0NHcB2U77pV2l
	LykzJO42F04OWheR4XrFt3gX1uMQ2VrpEqETMUVIve91iPIU0D8nC+W+cCge+1zLclJvb8SAlE8
	LBzNFltHXx02/U24DRdGXGGwX56i+fyQbDctV6dHNqLG8e1ZdQGBfqZK2e
X-Received: by 2002:a5d:5f51:0:b0:432:5c43:76 with SMTP id ffacd0b85a97d-435f3aafca9mr15610107f8f.39.1770027279835;
        Mon, 02 Feb 2026 02:14:39 -0800 (PST)
Received: from localhost (244.60-200-80.adsl-dyn.isp.belgacom.be. [80.200.60.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm46960096f8f.13.2026.02.02.02.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 11:14:38 +0100
Message-Id: <DG4EAYDXMGQS.2MKAJKDFQCFEG@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Griffin Kroah-Hartman"
 <griffin.kroah@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
 <aX6whqw7XyaKMd9m@google.com>
 <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
In-Reply-To: <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91464-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:mid,fairphone.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 614B2CAC48
X-Rspamd-Action: no action

Hi Konrad,

On Mon Feb 2, 2026 at 11:12 AM CET, Konrad Dybcio wrote:
> On 2/1/26 2:49 AM, Dmitry Torokhov wrote:
>> Hi Griffin,
>>=20
>> On Wed, Jan 28, 2026 at 04:51:14PM +0100, Griffin Kroah-Hartman wrote:
>>> @@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *hap=
tics)
>>> =20
>>>  	chip_id =3D be16_to_cpu(read_buf);
>>> =20
>>> -	if (chip_id !=3D AW86927_CHIPID) {
>>> -		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>>> -		return -ENODEV;
>>> +	switch (haptics->model) {
>>> +	case AW86927:
>>> +		if (chip_id !=3D AW86927_CHIPID) {
>>> +			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
>>> +			return -ENODEV;
>>> +		}
>>=20
>> If we are able to query chip ID why do we need to have separate
>> compatibles? I would define chip data structure with differences between
>> variants and assign and use it instead of having separate compatible.
>
> dt-bindings guidelines explicitly call for this, a chipid comparison
> then works as a safety net

Are you saying, that

1. we should enforce dt-bindings =3D=3D CHIP_ID (what's currently done)

or

2. we should have both compatibles with no handling based on compatible,
   but only use CHIP_ID at runtime to change behavior

Regards
Luca

