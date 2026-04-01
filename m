Return-Path: <linux-arm-msm+bounces-101366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI2MNqoyzWn0agYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:58:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6982E37C942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C119302D5DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A1F477992;
	Wed,  1 Apr 2026 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1sXwq8NL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0512B477983
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054692; cv=none; b=p8Ece9xio/UFE9poW7aBNgAAVlqJRVB1WIXT/0YlvBAHJ501hTKVgzMbSHFRlqtzkrB7pDfNQ3tZiP2JioVJuYTFxR+8lul7wGwh3fwAyunXgWRZNxJ0xJoK3mwVaAfIJE/qG2dg5QY9KcfF8n2yHKpchO+sWpBxke1S1pRtSeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054692; c=relaxed/simple;
	bh=eCtz8uzC3ZyJhfgNc4nb8F31dhwu97gqPpF2HvCCt2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=PkLsr17XsTa5GLx7Q9SWxeoXHcOGnXNQPOSxUQIpA1hC/dXRZh4B66YqR50e8GmvG6oOX/egzoD3qnu8WZR8AWFB/zVzzCyoHlx+xaBlFTty/tlDPR6HfTckw9lhusYYqENeXrksqsBGszEDg64oMX+fCsD652gr/Xr3hHFqrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1sXwq8NL; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso7391433a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775054689; x=1775659489; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCtz8uzC3ZyJhfgNc4nb8F31dhwu97gqPpF2HvCCt2s=;
        b=1sXwq8NLtGdu7z6wbHuWIWyUwu/5yButIFiqdCXoUK8dS+HqT0cW9HZen+TJFo24Ny
         L8+15BoEum2NVrcrquJ7scAQPBtdnPQqZyh8pyZW42E5vPez6PxzlZWHnydLJEgxm3M9
         vTO3/WDspo0LQg/TytROkih1KmnuprcqS92TP2t0p2LxVdPi48V7Uo/vxCDanx6E4SpM
         NywT1I8Xa4yxvU3uRlUf8NfYOZSNT+cQwi2e4sLpaMukapsxG8Gnz2hrVX36cFDHdt19
         ty2aTjEfoptx5PUiuVcOVWM93GsLHLTXagjVw5sFVMzIfL/6xHIdpNkQS+ZkXooL/F/9
         NChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054689; x=1775659489;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eCtz8uzC3ZyJhfgNc4nb8F31dhwu97gqPpF2HvCCt2s=;
        b=p+NAxL5jS5bvNJ/BVv14ZkSlyV/TNlAIWsYKUB9gHoduVw+09V2RaTCTqzQmmh/qFZ
         lLxk5EogqSMbEkXHyUyCf1gKxu2RP4Crz3dqJnzmANBd3ZPNjFr4/oFyVf5jYAxiUTNW
         TskjQLinTweScpz1Mujp1iEdtqkIA/rqwjUcsrBjzbWDUbrbpRcOv+u0GH+o8XwDUmcG
         CYEx0blS+o6PIZTSBYXNLuOffFppMqZXDb0O3qgQ52Lqqfr+g5kheEFKEx7Z4Qa+WTxR
         IeB6iDWTvULN1C17HuW7arHOTb0NT1gXOuphDXkhlETVgxW3UoX5r5FqBIZxaPVNvXdW
         z9qA==
X-Forwarded-Encrypted: i=1; AJvYcCUjWRZkOqd6fMVUTFGAhq4ATWbT0T9vUwNekzBOoUyZ7Gn+mPt6JgIVeOckqAcWcMSFezCNMIjYsLiZ8K5/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bBJk7qXGzHfbNiW7XfWs1S8/3TOqBHSqFdl6T+6L5dthSUpK
	x/9IiR2HYXeGgxOy74tS4BNrHoeV61OpigbsQCA8V4eNgwPy3kdH2mnw6KZG1nHn2EM=
X-Gm-Gg: ATEYQzxrVVF3KLAS/oMRjWyoWDyTF1FUL5XXPk6yA32vcwZ+BLsA38ZNN95XHBH+iPF
	waPhNRszd7gUHYOi8cOwz4yqpfmlFTFIz3cZnoeWPq1qh7K5nOxorzo2HAonAU4NyunMHQMzvgv
	ewMQODq5VN9BmVbUKaKPeGf7qyLDJSyM+Ld4zUBwH7JwUCC+nmZctvlBcRACwuR462jd5HR4x9W
	oN3M4TGkw8wliGTCPy0zX2UTSsTM0/PiDKB0ZOPbwK1f5mKTDyypts4oZ5MbOqvgllqY6bTVdCc
	JnO3Qn1zj7h6jE8DIyUm4N0dGnT4pytA3nkuGtSK1m2PlyFqcKeQZrHVWJ0U5n+jfqgOiszLvZj
	TuxHZogJqH+vkNOoIu7/XWUI4DT+NwbXfJFAcscSP4ofMk2x9C0lAF+NlCp0+JYt2G0IYmvrtHy
	yGn4pE2zkMLPOso25lS9KU0YPlaPfUAGDViXR65rZibxz0r8TScFLdRt+iNIoReOpifO+Dhrerq
	39Qb+o/+mbzZP+EQ5SDtpbhA8xc/nXvmf7P
X-Received: by 2002:a17:906:3750:b0:b9c:1a5:acb4 with SMTP id a640c23a62f3a-b9c13ca82fcmr213347166b.45.1775054689211;
        Wed, 01 Apr 2026 07:44:49 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm538720866b.31.2026.04.01.07.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 07:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:44:47 +0200
Message-Id: <DHHWDE7QEOTO.1AQ85UBLO8IQG@fairphone.com>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Griffin Kroah-Hartman"
 <griffin.kroah@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] Input: aw86938 - add driver for Awinic AW86938
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260302-aw86938-driver-v4-0-92c865df9cca@fairphone.com>
 <20260302-aw86938-driver-v4-3-92c865df9cca@fairphone.com>
 <aae7fRYaoDHMptyu@google.com>
In-Reply-To: <aae7fRYaoDHMptyu@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101366-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 6982E37C942
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

On Wed Mar 4, 2026 at 5:56 AM CET, Dmitry Torokhov wrote:
> On Mon, Mar 02, 2026 at 11:50:27AM +0100, Griffin Kroah-Hartman wrote:
>> Add support for the I2C-connected Awinic AW86938 LRA haptic driver.
>>=20
>> The AW86938 has a similar but slightly different register layout. In
>> particular, the boost mode register values.
>> The AW86938 also has some extra features that aren't implemented
>> in this driver yet.
>>=20
>> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
>
> Applied, thank you.

I'm curious, where did you apply these patches? linux-next doesn't have
it and I don't see it in your kernel.org repo either.
https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/

Did this slip through the cracks or will these patches still appear
there?

Regards
Luca

