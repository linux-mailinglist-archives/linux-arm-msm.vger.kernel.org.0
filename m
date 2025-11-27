Return-Path: <linux-arm-msm+bounces-83591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD450C8E4F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:46:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 352A84E7781
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 12:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35DEE21FF26;
	Thu, 27 Nov 2025 12:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XmkfNXxx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S+8P6TEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862416F265
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247584; cv=none; b=anKMAyVXejB8A8Vv7lQFqJoy6rJTnIwASGoeJ0mb4n9NtbqTXWrDJ+jzF+9m/dJRhvchyUO16my/fVu1aqBA0QUwckiEGZhuz7An9i8eBdgrbkIi2z1OqMOUyCuzTpyKHEZrdWUgWwz1aams6NJpx95wDC9mcbbVG3mNhOxR2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247584; c=relaxed/simple;
	bh=sbR8rj5HdwNUwTJf7rPxcnFUE8stUOVZpJasHjCHCzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkOyp30HrUAhCv+eZ6WbC1l2fK+7S9UwKSaFGD/aK19o/8rIGgfsvnJNhReFJH2aQzumz3t42qSTcDQ0LNuJz0J8PWpHxi76e74ao26Vwd63dEbu2iINnmJRTOZOeo/W5QIepMSIBtQCJHXm1ljhSSgU0Asgcr6cih628uYMGEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XmkfNXxx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S+8P6TEk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764247581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lU4Q69fwFr8kha5ORL2VucV6zKxUebFEBdC5v2fRfrc=;
	b=XmkfNXxxxWgFCkYi3Ft9rxZs5XoHmxeCG9lsSGcIKf812C6wMqPDCS/crENrT2yl2BWWv1
	7AcMW9o2xbfbhrZUZjPNl+uEyvUfGYEest+Snby68gIftyw2YTsaBhL+BO4Dw6BjoCsESV
	Zv9qVJyhs2AFvwLe2uXTsz6C1+OeZjU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-iQieLHDhPsWxUCHp4hUBaA-1; Thu, 27 Nov 2025 07:46:19 -0500
X-MC-Unique: iQieLHDhPsWxUCHp4hUBaA-1
X-Mimecast-MFC-AGG-ID: iQieLHDhPsWxUCHp4hUBaA_1764247578
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b2c8fb84fso491857f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 04:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764247578; x=1764852378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lU4Q69fwFr8kha5ORL2VucV6zKxUebFEBdC5v2fRfrc=;
        b=S+8P6TEkMeIs+7F2yiYJbnOYj+YuzYd78buBHXa7YJemsmZume7ntc50Ap/D36PaLt
         BvdJms7thPv08rgGqoqpdAJ3JUM5UwOlPR3mJTzsz8aSfv4iHPDyEtpNCZFKekOk+5nC
         oYXatcBy8c/Du8gHRJ8gT6sujRvNO6jfeY2PtLPleL1HVutRwkcW1dHaF/xk4M9RfLFb
         HzlB37M+JrXpzQ/3TT7H53yeXc6cSBHGGznga4YCYMdCsPG0Az1tXpRyeQ8UsGgnvExA
         JLFOmUXgFKjqeaUAM/q9X46r3KR/qRjkze6IACHEThqXWI2jn+f8XjwADjJDr7BIvca5
         5QEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247578; x=1764852378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lU4Q69fwFr8kha5ORL2VucV6zKxUebFEBdC5v2fRfrc=;
        b=r4ncmRDIpzrTy/P6dUgqA1e8+b3fk4nEuHqexGIKuPE+aCMPYKXmtUOzFQ6HYF9/cq
         K8pN39jh0+QBOzWfGTqoKMAtUjf4VNsqGyCTnDuRLH2/JLRsgk8JUcvwYVHOaynTjq+Z
         F/QVQYWb6RZbaTAaKACZBk7u5LdQLMgnr09iRKYg2lbRiBW1q6BJhZtOG24J7SywR9LN
         9krNuV6XEdCZZaIDBSLgCqTjaAUn1ssLO4G6VdSm5cTAJ0kqOZmK5YlzrzFYNNMn3fLK
         2Y+0d/y3rXBISNEvjJbNHVKivQ5qQFB7N+WH5bCoFSmBbWEUaxIL+kkjoLb+BW2ghNM9
         82GA==
X-Forwarded-Encrypted: i=1; AJvYcCWnWTuaulOYvEjBc9HgbDuvlAz9y/L/Wvl1yZu2VbyI3VacAjOO8VbnuHV3HF5BfeB0m2Q7YebPzPr5Lo45@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz90hWhu1EtbuS768+sMBsORWyhEgWA+k0BMFrR1zMhJlatau+
	ZObTFlzh4PE2FucS12MWmK0Z5B4HJ+9expbAZ9WJtjfboIxSOZ661GHMJ/DxdCXIEWoCc2GrW2c
	cq6+E5awaOzgN1oB915ZwtQtdRWJTwg9L098276zbPrLkO2lgPaxYCcttsYB2RIF4zUo=
X-Gm-Gg: ASbGncvoWO7MvcxLrxxYU5R7OOgSxNqJDnZ1+HSfuXYP60g8BP8q6dnsC4RYJNoBPSQ
	1v1utdJHF7xrnCZzgCvt87c6fmxhkMhskZwZp54V3HsVfomtb4DORMTTBoaZq402LU6MRdUCwoe
	WUjahbk2RWQdHlmg+QqSB1mZ4sZnUWESmiJYLaEQ0MJZa8PyylKmImLfHHLQhGzV4elkNuNHO5y
	L7ZSiZSeVJgKscCTJPe62x9z25Ii+cm2mdUUM6rb/xm7xdiYFmCobvM/ckJDtuF4wDA27A7fgew
	/czYs+2h+xn0e+77u/KUXQ9S6bnBLc+vQPWbiC0sKP0NK6xqyZm/Cnm7ZONScRPLoQ+cI9W4Q7N
	UMxTu1VuB5To1eA==
X-Received: by 2002:a5d:588c:0:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42e0f1e3428mr10930147f8f.4.1764247578249;
        Thu, 27 Nov 2025 04:46:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxtcXT2mGT29Cj2YqBl/we77yTx8kGjUHM5RCqeOMm5jzSp7i0tYkAfQYuvbu+j+zndDkpzg==
X-Received: by 2002:a5d:588c:0:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-42e0f1e3428mr10930122f8f.4.1764247577824;
        Thu, 27 Nov 2025 04:46:17 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm3525667f8f.10.2025.11.27.04.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 04:46:16 -0800 (PST)
Message-ID: <9c88eec2-0985-4e05-8f0b-8ce525ddca94@redhat.com>
Date: Thu, 27 Nov 2025 13:46:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
 <966bb724-59bd-4f45-a2a6-89a1967a851e@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <966bb724-59bd-4f45-a2a6-89a1967a851e@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/25 11:10 AM, Maxime Chevallier wrote:
> On 27/11/2025 04:00, Jakub Kicinski wrote:
>> On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
>>> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
>>>
>>> This v19 has no changes compared to v18, but patch 2 was rebased on top
>>> of the recent 1.6T linkmodes.
>>>
>>> Thanks for everyone's patience and reviews on that work ! Now, the
>>> usual blurb for the series description.
>>
>> Hopefully we can still make v6.19, but we hooked up Claude Code review
>> to patchwork this week, and it points out some legit issues here :(
>> Some look transient but others are definitely legit, please look thru
>> this:
>>
>> https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574
> 
> Is there a canonical way to reply to these reviews ? Some are good, some
> aren't.

AFAIK there isn't yet a formalized process for that.

> I'll summarize what I've done in the changelog, but it skips any
> potential discussions that could've been triggered by these reviews. I
> guess this is a matter of letting this process stabilize :)

If you have time it would be great if you could send an email to Chris
Mason (clm@meta.com) detailing the bad parts and why are incorrect.

Thanks,

Paolo


