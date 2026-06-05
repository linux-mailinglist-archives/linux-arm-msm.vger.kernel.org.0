Return-Path: <linux-arm-msm+bounces-111344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1FcoMw2RImoiaQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:04:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 24053646ABD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:04:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=eOegX9iR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111344-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111344-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AEFA3084477
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 08:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1A344D014;
	Fri,  5 Jun 2026 08:50:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8C63CF679
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 08:50:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649418; cv=none; b=rkXhN4MEhnxvLg8yg9DUCaTNogLWt0THYDQuTU7ZjzlRUjOVbErHSefhJRgRuzRAddsT1aMAqpi85p89gO4AxQBOD1kHa+8ri+e9fA0W2+wbgN93rWazsZaL4V9GdxJyaNEzNBPGTv919G2+txG8FLobp9jbynva1OZ6sCJ/CP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649418; c=relaxed/simple;
	bh=oiRMhyrxK1V2pzVWG4kwnbDDdDHtak7KOQmTPXZkRPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQdCetXRa4PaC4Ue3WoFb9zFYCGJHJEtJcOrzhMxYCLF9nwq4GZ1mL1JiE256nzmMNOm6Fon8zlGS6vax0bL5Gu9mURTTwvU5mYpqP6/7rM77Zmos+pA5NCeFP6PJOJy2VZCC21e+jVXzcHdcOw/R5+ANLKt0+i+ajZVmwIAMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOegX9iR; arc=none smtp.client-ip=209.85.208.47
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-68c32f3c6d6so1718201a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780649415; x=1781254215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZl60tcPzHqp6fX1KDjQJ9/5UBp9fAzatRkPhgk+Y04=;
        b=eOegX9iRXSYRza0VjOMOoGMs9D7De2Acg9J9qjTS8jA0cNET2ICEXXyeCiPfa9v2+t
         g5mvGd/cyDes0BB0+Vusj3uK1tb24BvO2TWiJRYIzbKbGl4YTRefWi67YvrFoNhAVWbi
         geU19o1fsC1+gLLP9PEe8LOx5RQF7qVr+npMcLRjKpFasrnqZrUzpehJTGMW6CdursSY
         6RHQqspG5i3KEqzB+3YRdjssH3vtQZHtdOkzQp0fnfdNtR3z1cGA9QK5Cg0s97dlw6n+
         POKnPa+GIbFBq6YT+jM9IXqfzLBTWK5/WnaPNpms9SSRKjoweiGvg2bmOSb8YKiC9NL+
         tEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649415; x=1781254215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZl60tcPzHqp6fX1KDjQJ9/5UBp9fAzatRkPhgk+Y04=;
        b=jJ4iIO22ClfteXkoPBb2V+5ewKdEdSl/JeuUjQ5WonsiqJpiCrDGX/G1bGuz52fje9
         56lcdjCvGQXawKhfRsndoZRtJ2HK7T8OGPA/VuBzhbqPDTuAlShnV8bsuuDTdogfxrhQ
         fPGkRVDpvV96IzNPFMbfUKownZ5l9lsciSzI8buPdKJED8jQWkaLxLed619ISwjNta0Z
         yNOk0z6n/5BTsQghMYfz4bT2nAu98JBvC8XUgohp3QK1uqSjLEfhbJXBVfAdYzjia6Wb
         u25k5H07oAcwVnFlyXmGcUSpjC1OoGQZ+Qt0oXMvn4VyfKKuy57eNolv09ugqV2Vj4QQ
         feHg==
X-Forwarded-Encrypted: i=1; AFNElJ/+N8CgcZEUNrSywT9n4WnFLJOX0fTgXrtNCmHDQYEtGLb1RnSneRUJPcoH6jJqWQRRiFfpMSHBwEYAMK2b@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOVWv+DyIGgIVrNN1HKq1CE0aFmCT/glHoJI6+hG39cCW0O+/
	M6fkUF2XiSGdt4qOW04pSA/D1GWTjsDOllq9K5JSktDa9UDjxkZjQXslEAGkZREdXmRWXZ6s7DR
	BRbOkSG4=
X-Gm-Gg: Acq92OFnvblUq7zegwWp3aRElcOfR3wXifcuztzeuD1QSBaSJtjgwSuPrq4tLhR4flx
	IaNzhYkq+FHPrzh/y7GGK/7VeD4mQnNuQxXPKPzg0zLyTAoYZRJBoBwUDRr93wPVaPdsBXHWkd4
	9srIqD8xpQQgX3uogp3+mI5vx2+gn64pwRJ89ZkvYQt9Will9o01ZLDYFqOhytIy1f/R6ZKQOx6
	chWGyqNA+VD5X2tktPXO3UrQkEo+Sg7sKsUQrscAaXqugIXTLOVe9wImGX93yRAB9iA71FnVwH6
	n2nwgLs9kzjY98HKpDcn1TsrlApQ8Jw0XQTyKOOas345kai6MbMFmSdWj8S7DPj6Rb1rZis0qAJ
	QSW1sxIGD/vFcD3sS7c+ngNl4CI/bdlXKekV8mhp1t2FsZ7j59NxVSr1kz7Y0LCgOPO+o1SK32i
	41fJB10PQJJaGUAF69sA6/Q/fDaRqYTGvkjWzgWGSEx1oHvQ==
X-Received: by 2002:a05:6402:4595:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68fa5147360mr1211380a12.16.1780649415420;
        Fri, 05 Jun 2026 01:50:15 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.11.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm3320961a12.21.2026.06.05.01.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 01:50:15 -0700 (PDT)
Message-ID: <43395467-42e8-4737-ba5d-23e31b5518eb@linaro.org>
Date: Fri, 5 Jun 2026 09:50:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
 <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
 <43b7da84-3390-4094-a61f-9e887660eb10@ixit.cz>
 <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-111344-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:david@ixit.cz,m:bod@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,linux.intel.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:from_mime,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24053646ABD

On 04/06/2026 20:07, Frank Li wrote:
>> -       bool cphy;
>> +       enum csid_phy_sel phy_sel;
>>   };
>>
>> Frank, Bryan, snds good?
> good for me
> 
> Frank

I think I've been fairly consistent in asking for this to be !bool so 
yeah, ACK.

---
bod

