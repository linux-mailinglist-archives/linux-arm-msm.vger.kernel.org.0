Return-Path: <linux-arm-msm+bounces-99039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iErVFjBDv2mH0gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 02:17:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD372E7DAA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 02:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DD771300A583
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 01:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F273349B1C;
	Sun, 22 Mar 2026 01:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNt4FT1n";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqqzyYrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707F2224D6
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 01:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774142243; cv=none; b=sYbqqnRvvb/RFMf+m8tuIdfWMfqZtOtQTIrCsCw5JH+PDGGRI7Rem7FtwNUqLP7Mt5WPLMg4Wp7gPJFkcgmgecVR+kQS+yP6D9dfB49pjX9Mp/5C5TchBf0vbt5yk/hQjjXT0RLhYQBw+Nk78K47+ce5nCgQiccOCF6YPRvkkpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774142243; c=relaxed/simple;
	bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IjNAGQ8vyduyE5dEbSnAmZxCD1WjD5/qGFmm/9gQimeGrPw8COljGFUTf+5VJaGAl+Siu+S09rXM2o/IoBWQk1D+dh6uU5+TR6AjDovAOvgYxuF1IEnO2y6pdNKDmiHoaLua9L5fjTLAPha+taq3BDU4fScQNrTqvN+AEZAMlBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNt4FT1n; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqqzyYrw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774142240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
	b=cNt4FT1niMZdO4MawkiCdK7Tv06Od0IYliHIHdYq/gXEEV9ubnixRZmGb+CtNOKbfQ1BVs
	/+RxXIx0iN7QsmRl31LKGGfQUen0VQz14CMlGEUskWTrn9H63spco4TmIaduejxAoEUnuW
	N/QH83ku77X0+SKup6ol5O+DiGxzrH8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-C4TzzCVIO_S_tLyHX4GCXg-1; Sat, 21 Mar 2026 21:17:19 -0400
X-MC-Unique: C4TzzCVIO_S_tLyHX4GCXg-1
X-Mimecast-MFC-AGG-ID: C4TzzCVIO_S_tLyHX4GCXg_1774142238
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c56a7e610so278641416d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 18:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774142238; x=1774747038; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
        b=SqqzyYrwQm7sS80r20iv50mFrB0m+/Z6Icm+4449B8IL2A66yLzyMAOQk+kaXdZRjm
         5yau4fwvoK2PfX987RFVDM8nW9haV6Ti/EZs333Ux2pHAvYP1rOgzVeBYQeLUTRcKNkz
         q+nGmoTv5t4aFN0p2+a4FpGFygFogtWVQ7bvYUWGVdSBtoX6ua1smQ7a7Gxuzmjy8c9f
         8pmoDPxn05cDgai1nux5UKApBRAnk9o2RdjXBzMYvvYQJW+9k51+DnDgWf20c+MxiyVM
         R9I4IpyAD6NUim0DTmQNtW7WHxb33hNU6JfXsU0G7hoQ5xkIPQKQKf6KGGHXsfNbIy+3
         BXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774142238; x=1774747038;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Khg542xZjwhBQfwrlC4DnttM6oQdWtu+YFUdsG+urqA=;
        b=V26+cJV6EqgRTMG7i6UVPYN3fvb8ZPgsuNSs2ZkE8Rpi/N1JcCnyOSnj0mNiRPoptI
         7hXL1AGGlcmH/pJmFillMm8DbHomn/YWThwaCf3bWTxhTBOWKUnjotlY1tiSMHvnmeKW
         ZkWuH68uPrQpWZkTqaDry3E1XsMjVfv0T7J67lgRP8R+R3DhEW2d04DC2Hh3HR3W8WuC
         95QGI2l5T3Hx1iN6gOM7m/taPdfKS6bk2gPCIyy+AZpYCh+OOpS4+Y/UbOlKWJy2+4fF
         uKyfq5jVGZ2yBc2+Xm8/K5OJsVr9pAxSSn5xYWR4aSKy1PotNQv3ShU8lGXH575Wory/
         IHaA==
X-Forwarded-Encrypted: i=1; AJvYcCVs9xjUo/MluQZhNrArCMvP+Fx59D8GqyA9zlaNgu4pgDbHocTwKr0uGvF45teaC0Ft8bN0d6A9dVG4ZDXc@vger.kernel.org
X-Gm-Message-State: AOJu0YzMzAQ+MtKTSC/WWUh/VwUSjtBhbsaIj5XxzRYs6P41Qgmq05Ns
	e2f/5oL5qOSNJPzE9QrFBVfO6BmhdGthfGAqYOj3fQ0r8RD3hqBzzJAlAEEyfbFnpjXcVGsw7G5
	MEN/+9HW01l6YGi/1AictzXC2ydt730hy1rJeGmS3GMt3Ep7LwGyf66ArOg/2QxvglSw=
X-Gm-Gg: ATEYQzytR2iGWMBCxVGTYXoRESIehykgRDDrNZTirxiSnxqtG+ibXpsQ5fH/+1Wbe6O
	mq1/IgHKf3A+x3P8PjQTZhOyHJXEsCxjWFA9xiWLqNaxrS42jSu/kzVF9ET9iJ2x+t/i1xmV9XX
	m2D85EjOVPWRIF6NqYg2KNjC69HQFeKqamJGlnzaPrqwq2JAdBHWX4/hJKNV0RIqox3hFHUTJ5/
	RvIWk+FEZURS67Oa46xm8abrigHymaBWV5AoSMbDjkW0K/kapAPcwE1WVKjCvl2EByO0IZuaKCj
	/X2z+Yq4lKxi/QGSRUvVYHpoCd9hsCY8LBLI/IUpNLV2/9QCGnHysFHrgjuIBRxSrxNfgTVyfJq
	8J68Y2ZCtRaqAWiwzsGLKR1TcIqpsqJ8p0nUQOJqETIt0l8XsKAUc/LRNZypPQTrlYCV9zqcdrW
	qhqcELkMIVm/OC5Q==
X-Received: by 2002:ad4:5764:0:b0:899:f30a:6d9e with SMTP id 6a1803df08f44-89c85a55780mr150340066d6.30.1774142238442;
        Sat, 21 Mar 2026 18:17:18 -0700 (PDT)
X-Received: by 2002:ad4:5764:0:b0:899:f30a:6d9e with SMTP id 6a1803df08f44-89c85a55780mr150339776d6.30.1774142238104;
        Sat, 21 Mar 2026 18:17:18 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85256c47sm54343846d6.19.2026.03.21.18.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 18:17:17 -0700 (PDT)
Message-ID: <8e9aac020cd9fdedf0c0226fc2d6848b665d771c.camel@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SA8650P
From: Radu Rendec <rrendec@redhat.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Lei Wang <quic_leiwan@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>
Date: Sat, 21 Mar 2026 21:17:16 -0400
In-Reply-To: <f619fcbf-8d43-4606-94b2-61b52c24920c@kernel.org>
References: <20260320205933.992852-1-rrendec@redhat.com>
	 <20260320205933.992852-2-rrendec@redhat.com>
	 <d6176542-335e-4f35-8ab6-cb4d50546543@kernel.org>
	 <cff35ebb2a9bc94ed2381f4ddda7b62d82d4d561.camel@redhat.com>
	 <f619fcbf-8d43-4606-94b2-61b52c24920c@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99039-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rrendec@redhat.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codelinaro.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BD372E7DAA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 2026-03-21 at 20:32 +0100, Krzysztof Kozlowski wrote:
> On 21/03/2026 16:12, Radu Rendec wrote:
> > On Sat, 2026-03-21 at 11:03 +0100, Krzysztof Kozlowski wrote:
> > > On 20/03/2026 21:59, Radu Rendec wrote:
> > > > From: Lei wang <quic_leiwan@quicinc.com>
> > > >=20
> > > > Add unique ID for Qualcomm SA8650P SoC.
> > > >=20
> > > > Signed-off-by: Lei Wang <quic_leiwan@quicinc.com>
> > >=20
> > > Please keep consistent spelling of identities. Not sure where the
> > > mistake was done - either by Lei or you added his SoB?
> >=20
> > Yes, sorry, my bad! By the time I realized what I did, I had already
> > sent it. I'll send out v2 shortly.
>=20
> Does that mean there was no original Signed-off-by? If so, you should
> not add it, because you cannot certify for someone else.

It did have an original Signed-off-by tag, which I modified
accidentally.=20

> Please explain the origins of this patch.

This is the origin of the patch:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/cecaf4e3bec17fe4fb63=
c52e51a02065e60c87d0

And FWIW, the origin of patch 2 is this:
https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/8050aeaebdcb3ab120d8=
47658d831f20bd475315

Please let me know if there's anything else missing or unclear. Thanks!

--=20
Best regards,
Radu


