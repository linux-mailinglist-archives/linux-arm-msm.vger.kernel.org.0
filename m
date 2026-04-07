Return-Path: <linux-arm-msm+bounces-102075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNYQLKy/1GmWwwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:26:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577B3AB46D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 10:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D925A307AA51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 08:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C76A3A3E81;
	Tue,  7 Apr 2026 08:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2p3KwyGA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BFA3A3E63
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550110; cv=none; b=lQl+hIUuyqX9LNxVmtsGeI3eoRD56EIAuzO4X5YOXzm/8MZADQk/hbFGF8kMlQsto6wZfJl661raGEXbZzIabv0PtSgkeY22A611ZX00lJe4QEcTiWRLGhIrkzusWHQi+LsPIIGeXLWNKXUkQKU8jUOiN6bVC2McJJNoCUupNWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550110; c=relaxed/simple;
	bh=GrX5EJt4t9cQ0y5PJf5xNnceKPLkSMXbMni6kC0vHEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dFkV4PxcpvUPtCT0FnLixJEebuaGPPBuSVPJamHch1cJWK0q454hhpazlRu5FasHDnaQbSRlS5tjj9dIPfAi2W6XM64epEFLYmJEMWOlGIiPHw+yFVVsE1mXIpgEiB/aaYESECa8QmW/5PdfYPFxpHI2Pp0UwHLq4Tx4p/FqoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2p3KwyGA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66e6f1d8237so1437946a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775550107; x=1776154907; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61qWV5sp3TCv0+h+N/I/PUI4iC1Lq3vzfWty1ImfKAk=;
        b=2p3KwyGA/dKlU1tpK/sdHOTXlcKnBJLR36sSHWBQUul6dl1xvxMzUz5qOMgHD48V2Y
         HYmsAtUUJt0GFdXiQ5B0reuR+2cJhahNvaUXbHPG3ZNUL0C/O7DpfGiwoNd6LSkM+hLz
         2wjhySye0BQOnm4wAejTHtFchMH4wWx268uAzqL6JTPKYRkTMvl4BNQqNrGfX0nszMU+
         xH9bL8pKJPTXllaTbI5q85ENnev7r3kTsSLhLvkWDnlKgMGMOzcMnsnTgz1avn1+ftxE
         jMOzUhnln7k1uCztmg0oSuxQ+xyFc4Xf2Y7JFDTtzruAo4kJ8nBOAFG7C0h7aF8O4nLZ
         wmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550107; x=1776154907;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61qWV5sp3TCv0+h+N/I/PUI4iC1Lq3vzfWty1ImfKAk=;
        b=RUcW9eA7YoXNRQaOzrtEV5fjYeZcTI8NfQ6kmDSJ/8SKTZUr+hb6gdK6YcTa37efFB
         z0SZFMcXme+ESfO8035cx+aY6K/8LqiiMbmahdgWpYEYuBy4QcU9ce2tV29LyHaQFlPo
         G6vaqrO/livsLZqgr+mlknls+yf0OKig6T2/j577cySTHmdz8wGq/vDYzhuTC4WijV2y
         HRy+ik+jwK1qIRf5BiVGjEFsA/dR11e9sorp236D+mJJcLl9lep4gjN+iZ+cBmnZwRs/
         Dg8oyi0V/YcFjq8L3zjhbdgO6ZTHAiDgXViUQxJreAijQS48vMCLIgD53aWAjwRwEdMw
         qMPg==
X-Forwarded-Encrypted: i=1; AJvYcCUQh5vXidRErlUdWP11JwYPhXNPv2avuLBkDrF2cwDKSZWi/KBltfJV+2I9+/rN9zsuJGqBx0NxFvEiyRMW@vger.kernel.org
X-Gm-Message-State: AOJu0YzoxduoJejtPQ54Fw5/zcBnxRqBQYX/1vGAWeywhSwy1YRugsKd
	QQSSeUB8DzEl7xBVeWy+g/C0dxKqbkK2SqBd0YN/gFx8rNnr7VLuibdC2dHUG6xm/Ow=
X-Gm-Gg: AeBDietcUlqy/+LrX/GcshctqeQaPk+KYKTGhRtWPJGS/oYwQghgm0h2womQl2HGkDC
	+egHSb35yY2w5J7F4EJYjsaUjLjSFkWJsUJL8TKR3NhXqGSkMH4h6Y+aMsRV8bZETmfRj4o3Sqr
	rqknTm5FwzqFPtApSMXR0GTQ2lGmLStiBRzfYg7svxuhnVE8ciiLe0CTd94ZncojfvNgsFEKqR5
	/98Okm4CGS1BVGjrSVMp4b3m2J0NREAcihzGEPCQSA4OWllYPnnisnWEYfW3Nf/2j14fCQxj/e2
	hgwvQSR8O309tHRbl2cRJF2T26Nt6pBS86XJmuUhHTEo1WhJ1gow+7SxiR98f+Q/8fFne4QLBsc
	dpN3FXyPtB+PeTKXnwdVPZ/AKz12Bnad/lMTrVa04WCeuyJxdP0ED9mSNJMNuR73zMQNSX3Pyw1
	iSvSGoJHT0wix5ijeEgMlD+okeaHRtH8Zw5IX9OV+gED3/XrVudjW6N18StL7EbUEncf9LE1Y2D
	kxVZtk=
X-Received: by 2002:a17:907:c002:b0:b9b:6869:bab0 with SMTP id a640c23a62f3a-b9c672f45b8mr892867266b.2.1775550106969;
        Tue, 07 Apr 2026 01:21:46 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028831sm525473666b.59.2026.04.07.01.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 10:21:46 +0200
Message-Id: <DHMRZE7498YA.2K983P59ETZ7S@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
 <20260405-rampant-green-harrier-eaf680@quoll>
In-Reply-To: <20260405-rampant-green-harrier-eaf680@quoll>
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102075-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 2577B3AB46D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun Apr 5, 2026 at 9:54 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Apr 03, 2026 at 05:00:23PM +0200, Luca Weiss wrote:
>> Add compatible for Milos SoC IMEM.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Doc=
umentation/devicetree/bindings/sram/qcom,imem.yaml
>> index c63026904061..38488e28a6b4 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -19,6 +19,7 @@ properties:
>>        - enum:
>>            - qcom,apq8064-imem
>>            - qcom,ipq5424-imem
>> +          - qcom,milos-imem
>
> Wasn't this imem binding supposed to stop growing and switch to a
> different style?

Then I missed the memo. Is this written anywhere (apart from LKML)?

Regards
Luca

