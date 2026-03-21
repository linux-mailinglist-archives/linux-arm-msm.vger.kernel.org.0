Return-Path: <linux-arm-msm+bounces-99013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKAOC3i1vmkrXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:12:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8664E2E5F98
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7E3B300F9FE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548AE155C87;
	Sat, 21 Mar 2026 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WJeqaY+O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pL91Aoer"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C55C17A586
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105936; cv=none; b=HddjIbULsFQd95yWZqvv6dmULKwbA2tDvCmrH3Pg7UVpRZrr3R6Yzs0m8EOLNXlC/263jLmTywMVa0MNh4FqJUplHEg3benmDXGvyPT54CzZB2WvquVAd3audQPC1Ztt5DjZsa2LZhrqTBO/7/2gkZhMSmg9PucADxLzJifrXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105936; c=relaxed/simple;
	bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWbXQs9cdc3l04QbVOPUZR2VHGGn2gf9GBUwQlB6YasXxxJpFwzZu3thhPulMg2pvE9jRmhSwpLIcj6Z5BFx873QcdC8WTCUJcqhRJvSiJA7eda9aErcNH/9K1HIsEdeDoQd0mckC4h2e3q9qWJnJSrCXJc9nYScWS+GOqZjYEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WJeqaY+O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pL91Aoer; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774105933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
	b=WJeqaY+OFSallVD9zfEz2eN+/IYloSyHNXj5EKABD42i4f1+GhOJWUButFoKEXrJtPmRRO
	5KeUprC6PuY60D0NXo691mXEmHgxN1li9e9W8VoAb7KdHPfKfXZt3s1GlIddmltlAy5q7R
	h6wBWoE4hnLyDDKg1lQkiQvTARRgjhg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-3_oXNDNOMZe8nWvFWFG6EA-1; Sat, 21 Mar 2026 11:12:12 -0400
X-MC-Unique: 3_oXNDNOMZe8nWvFWFG6EA-1
X-Mimecast-MFC-AGG-ID: 3_oXNDNOMZe8nWvFWFG6EA_1774105932
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfdc479f68so30071985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774105932; x=1774710732; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
        b=pL91AoeriMxo/wv61W8CTIAT5lf7f8JzjGkKKdbgwt6ngFKCLFNiQNiRUYOz+cR+JF
         nB8Z5Cjxquw22gRymcBj4ZfAhd72cGq3MxqknTsrIMsAdw/TH9GcrJIITKLPHYWHkqEj
         9ElnZBSWNbGK1/sPRugXSYnDt7lO8nrzBztGOvAQrE0yzghqpTLCuHz4RMo1DjelFX8P
         NtVaONmgLR+B9HK9JpHsr9kAT3bHm1qiks4JnwUTQr8OZ0ycr1bx39RKrrVH7mJGRRLb
         sRUjrE2FYhqF1M/O7E47UysK66FqLIRjYX/1hsCfXXmtkdiKyPsQHEZzk6SOwOYC8fNe
         ZgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774105932; x=1774710732;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/ZBIKYhY6oNwcEfu0m626QC/t3jxB7ZGsuvJZEPcnw=;
        b=QEX9HrInBn/LvEyuOp4G8ksutiJLfWY4MD09wppMcKZcRmM8B96PzP1hQhFMVQg1QR
         ISZEROCHVMF6hlmUl9YeGx+WL8zHaJ8WlPao8AOw/1z3HZf03BK/11RNUjSPsiypRqE8
         hn4m3rbszqUa331Ty0ELdB50nclsUiuk/L6Lv5Nsg+bmTGqceESOLkr6eeAbiNpaWGx4
         wtHfY8xpNmV5b1Zwg+683jn2ceDiU8OpfvwuoYOCYOt1D0oOB+Q967zB9nzBg9aiTlGU
         0KykPlKzlEFa0gb4Hnot3oTo6zxd3UQTsNE5se3LwHfS6crNzr89I+NaWmugqAz2sGsE
         +ejw==
X-Forwarded-Encrypted: i=1; AJvYcCXHkWTSVX/0RgMancTBpg2LBvZXcJVYBG5vg9g9jKQTPPS1egATwhXd2Jh4nMVpX7qWdzMITVgiJJd4+5pv@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRtfbqPOBVDipaN8vREYctwxpF8yvDqx9QbHoJ608THQ1mYau
	9ic7MXTPJapza5rrKbiVxEkzppV5kinOn2j0Y1tm+t+x8yWmIbmHObjRPj9B5VPNOyUATCjO776
	JXMOHItLnyh2htgxkbTgzKeHq/QpGnj02j41J4rUZ/nFof5h5kPzv1ehw9QAMhOT/f/M=
X-Gm-Gg: ATEYQzzcotVBU2i5n5kzETlcKKU5FZ89aS7qVd7zxOn5FfaCdULfnf9J6ViCyNoizMv
	sQ0qDEDGvrXzccIWwY1kh/PQBIGp8yYKN6264nBt6iqMzSvU2NXEJ8SLqMwsfYDYyPKrTxjUFyD
	KChk4KUxCQPA2nJ/jUYZba/mau3iv9ASWDH2huLrVuk+Uy7jGtZS8+I2jDo3dh+FJoAQB1VuujU
	tBqlM1fIL9rID36emybCFGTLgf+crr0iSGL/AEyt+yZaA/vU5wPgDnGlqObSvFqjJQMJOX8EWXd
	lmjs49IeeSF23yfoXdAVHrdXIqdVSEDdnI1wV71Lqcq1gfk3pPTlI+l6I2mxYNSbTP/YWNsgbBy
	3BGaFuUoYNFWhPNjLsZldmnjc7M1mTUMYp9QbbCJvNSneXTNKXN4lNVwz6XGYZ0Kk2uTyYPb927
	qSaAesLtoqGnUWtg==
X-Received: by 2002:a05:6214:4613:b0:89c:4d3e:fa41 with SMTP id 6a1803df08f44-89c859f9842mr109600946d6.12.1774105932232;
        Sat, 21 Mar 2026 08:12:12 -0700 (PDT)
X-Received: by 2002:a05:6214:4613:b0:89c:4d3e:fa41 with SMTP id 6a1803df08f44-89c859f9842mr109600576d6.12.1774105931821;
        Sat, 21 Mar 2026 08:12:11 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c8534cc4asm54518066d6.36.2026.03.21.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:12:11 -0700 (PDT)
Message-ID: <cff35ebb2a9bc94ed2381f4ddda7b62d82d4d561.camel@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
From: Radu Rendec <rrendec@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lei Wang <quic_leiwan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>
Date: Sat, 21 Mar 2026 11:12:09 -0400
In-Reply-To: <d6176542-335e-4f35-8ab6-cb4d50546543@kernel.org>
References: <20260320205933.992852-1-rrendec@redhat.com>
	 <20260320205933.992852-2-rrendec@redhat.com>
	 <d6176542-335e-4f35-8ab6-cb4d50546543@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99013-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email]
X-Rspamd-Queue-Id: 8664E2E5F98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 2026-03-21 at 11:03 +0100, Krzysztof Kozlowski wrote:
> On 20/03/2026 21:59, Radu Rendec wrote:
> > From: Lei wang <quic_leiwan@quicinc.com>
> >=20
> > Add unique ID for Qualcomm SA8650P SoC.
> >=20
> > Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
>=20
> Please keep consistent spelling of identities. Not sure where the
> mistake was done - either by Lei or you added his SoB?

Yes, sorry, my bad! By the time I realized what I did, I had already
sent it. I'll send out v2 shortly.

> > Signed-off-by: Radu Rendec <rrendec@redhat.com>
> > ---
> > =C2=A0include/dt-bindings/arm/qcom,ids.h | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20


