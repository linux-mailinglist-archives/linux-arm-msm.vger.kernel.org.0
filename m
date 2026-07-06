Return-Path: <linux-arm-msm+bounces-116901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C8aICo/PS2rYagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:53:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 97276712DAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:53:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=BMgJFb73;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DEED36599E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A723A7F41;
	Mon,  6 Jul 2026 14:35:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E5239891D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:35:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348518; cv=none; b=BTACCDD1jjqPm6Uw1WdJeZ+FZsTFucJFOK8QqLf789NOFkxwQg9qXwWT6Z5ZQH+NFzOlM37hA8dhinRUfXZdSwqTiEyfNoeUZOcTg0FQ1Tb/B/KSOEuoFBOK96Yk93C8Dgbh0y4Cnw1HTKZD/Ka3cIgLQHTSSOWAgpDBvASrTdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348518; c=relaxed/simple;
	bh=qbcykGapVHfJqKgmk81AzQE5m3FAmFj5hgBqq4G2K80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic5fnuTdzEWqjxfPnNM01vFhdEQxewGlEEejZ5h72Z7OkmNC7nL3uUPQGKavMU1T06esQDhSKMyH204b9XyZey0gKTvNMBufc9JiQSfy0te4M7lCwXrCF4RcRcy1g/23XODGjbpbvunIpq9JTKJiuCsJ8ltqT7Kh5mcM8RwDIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMgJFb73; arc=none smtp.client-ip=209.85.167.46
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aebd7da975so368142e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783348515; x=1783953315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4NvKO6c1aWnO7A3eGSV7QhwSsdTS9m/BEA8j1DxA8pU=;
        b=BMgJFb73KuX+uJomEoYRx3iLRbw4WlxBxrRGOWglEJuA6fP45IHv5VjKFT455Grvky
         rRY3imrwdYW0UfR/Zpu/kTLx6VXsHZ654QgxFAoMoBQ1glWOFneQ1UgjtT/5r15b/PxT
         pfOiiGbVaTjs/wZZvZaxOP+/eobY9RZ2OMB/boyRJQ8zXMGaaprWZMJd2gUExA8BM9FK
         O8Xl/EKQbhTtiFkALC0q6ocLTpdwqREw+xYP3ufkASX1/OKFbFOjmWHJkxxHp3arXohS
         GcRAnq3k9HBYLpEb1viDb7v1uU3cc6y1vAhxJxIxUcM6xHsmTUxargiN8ogPSZ9HFbzp
         o90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783348515; x=1783953315;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NvKO6c1aWnO7A3eGSV7QhwSsdTS9m/BEA8j1DxA8pU=;
        b=lmFoeLiQcmUQw7YnZfhBn0oWg2iHELeELzRqH84piTZp7/5rbMzM6d1LgiMf96bM2F
         u758kJC3JV7WWfX1U7vtkeLsIbpzqJSbDwOxdlT/+DRRP8Wbz1Zax3pHHzY6/CBAcpmj
         H/3ecdmPu3K8CUwZraFK1V3x6FBURJmKsu6ABDPMxs2gsAbse4GTxu1GIYLHXBZn8PAS
         UE6YEn5OcY33qoTvmBHCf18GF/B8t2Cj8UyYQWpKmASKlPf3PGma6e9BlvyjOGx+e57P
         AmWAMXj62ek2vjF5goKsOfUSp/KFnsdQGvrlZ43YZIqWX+64OynEQlnNbF/Bms9KQKp/
         f6Sg==
X-Forwarded-Encrypted: i=1; AHgh+RobqchEG1m3GcLrRXNGa8HCMVSB7I8FdNcMSKkBDkABviE18uMwZ0znSKyx8iZSbxibyA8SOcLDTo3OOWb1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wwtSZOc5oeRfTK6/ZrgsdP+d7pz2z1NhZWj/zisClJ6+0zXg
	A86lladxhOGuZzkGdNUSH03XMd+iUo2/5k7ZFpvkJHBtrgF38N70U+LS7sxaivWInMU=
X-Gm-Gg: AfdE7ck8w7sJvWiM678/oFFdnWqrhjjZeS5dL046+lgv8FLfF4ED/rM0W75sYLH6d4i
	yBBDGQS4UirUNY8kS187ZfzH/eZ08yeH1l1TneaBnsM4lbjaVhM+OWZ5+x4PwJ6XUdTXek+68aw
	FSO7l/1p8Zd+hqLiTyvOhfY17apZ6xmyUyJlvaRkDfybLJmiQDyeMmpp6XYHuxE/JNhMvrJQySS
	3y7CDtceM8jgcBxZ5lFSaHYLtR2vsHqsxk1E/CtuwhUoF/xK+7oTPqk4e2xA0j0opU4AY4WOMMw
	J4k/81MJcE2X6ZcrW504cy10raqQR3gwrLWz5LPQgnQpSrZ9AwodbJyLOvsifVkTC84TD2vRjCB
	3WI+YrjLdJm7KTEOxnaiUbHUeaKMX1vixHKjeu4BDbys9366nrr7iJcS2nuTrLqW5gX9g1FqPtg
	0X6/KL1bxXp25EcyAONjZHNaG3h8PkESt7rGPmMAx/jU4bjmc+ssmC8KhXIekxu+/eKBQ=
X-Received: by 2002:a05:6512:8348:b0:5ae:ba8f:ad39 with SMTP id 2adb3069b0e04-5aed454f924mr837407e87.4.1783348514716;
        Mon, 06 Jul 2026 07:35:14 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bffcasm2971872e87.61.2026.07.06.07.35.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 07:35:14 -0700 (PDT)
Message-ID: <3b0f7a36-05d7-417f-8efe-d6ba06488406@linaro.org>
Date: Mon, 6 Jul 2026 17:35:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add Qualcomm JPEG V4L2 encoder for SM8250
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <68e59764-5a10-4abc-849c-14ea2d9ef76e@linaro.org>
 <d74d7839-d126-427a-b151-ca895a27a83e@linaro.org>
 <437d1eb0-4495-406a-9501-b0515cfa3151@linaro.org>
 <e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org>
 <8116c54e-4050-4e9d-b236-59d74846bd57@linaro.org>
 <48c3ce6b-1e2a-457c-93b2-8fbc0912dc20@linaro.org>
 <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f3d148cc-496d-4301-af45-51d8921d7798@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116901-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97276712DAE

On 7/6/26 17:12, Bryan O'Donoghue wrote:
> On 06/07/2026 14:57, Vladimir Zapolskiy wrote:
>>> This debate is going nowhere. Check the downstream you don't need the
>>> docs titan_top_gdsc is provided by CAMCC.
>>>
>>
>> There is no debate, since my arguments are not debated so far... Why?
> 
> An odd claim, since this is the fourth ? level of email reply.
> 
>> And at the same time you didn't provide any support to have N identical
>> spread hardware property descriptions instead of the single one.
>>
>> What is a good enough reason to prefer complexity over simplicity?
> 
> I'm not sure I parse your here. The core fact is there is no "thing" in
> the CAMSS block that can be modelled as a provider to JPEG in lieu of
> TITAN_TOP_GDSC.

That's fine, I have never said the opposite.

> That GDSC is provided by CAMCC not by any other silicon block. So

That's fine.

> omitting power-domains for individual nodes is incorrect. Best practice
> and in fact the _only_ practice that can work is to list power-domains,

Let's step back and discuss hardware description of CAMSS IPs, so far
there is no point to jump to the practice.

> interconnects in the individual nodes themselves as - I've pointed out
> multiple times now - those blocks have to ramp clocks and scale voltages
> dependent on their particular use cases.
> 

Right, you've pointed it a few times, no surprise a straw man fallacy
argument resembles as is, because it does not address or debate the
initial point of concern [1], when the absolutely excessive complexity
is proposed to be implemented for "CAMSS power island" and its IPs.

[1] https://lore.kernel.org/linux-media/e04cb9dc-76dd-4fa8-92f4-be002bf7ee8b@linaro.org

-- 
Best wishes,
Vladimir

