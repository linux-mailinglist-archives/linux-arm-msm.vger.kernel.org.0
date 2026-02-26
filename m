Return-Path: <linux-arm-msm+bounces-94270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOgDG5gboGmzfgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:08:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C029B1A3FFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DB3B306FCFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9163A1D08;
	Thu, 26 Feb 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUHNE/x9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F63A1E94
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100396; cv=none; b=EJyL5i2QZkk+k/hFRfLYAcxCMMymM1PghxHWKSD5wFOIADsnKafMrEMyUA2r/vJJZTILt3JaZ6dbnF3UhCED2+rHJ97U73/QgcKqDqN0uu87yWMbSu0LiXqnHccoWsF6GrRtN0/ChCbroottHHe99D6U6+elN6hutJgvXcxt5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100396; c=relaxed/simple;
	bh=Kb7Zr1q5fDprwOuIFKVHgYkCHY8BIbU86+n0nZmBXIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oo+CFIXhvEWuPXhaOT7BQXteW6ROQ3FElJfaqbGuu4E9c/Z0XU8qiFOAD2LeLm5Ojmy8yhId2l5j/E8d7UnXfSChlyoviaqZXrWqx7OCxdkOdqfEmtQrU1Dd07ufyXH54tJ45i4XyraumeXa2P5UGofTSxXCLHTr/zhu3okK6E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUHNE/x9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4398f9e3b40so622947f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772100391; x=1772705191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M45UmrhuMMqbMjpIjOb+glFVXPQnqnkmhvjio0VGfRA=;
        b=iUHNE/x9ZjIVYoKad9cyKQce52Pn9/sI+xFBh2jGnzYfiNWEuy3VdbDhyVJooyskQ6
         1ooeYtBVTp1D0RhPPeOexSksG6gT0F3MPGTVXSS1eIv3UpDIpWcpUL5Fk8HH3uzSAKJg
         FcEy26lUEKvPr9lkD+aLL5nxrx/mRgSxQCMjf6YNUIubhSvgxqnc+DIKE+1RmMAPQfip
         9bt9NCjRj0qa1nqAXRxxRiRPRAr7KfalY4+ABvhhl+ihib5CVYkANsCGVX3pYXRD5/7+
         k/FZS+3afVXBZsD6qEq4RKjnb2/vcYM0fmVL6xaPlcfXjGNfl5+aVHH6twZGaVifb4UX
         hfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100391; x=1772705191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M45UmrhuMMqbMjpIjOb+glFVXPQnqnkmhvjio0VGfRA=;
        b=XdIXFwJuXLDdpIY6ZAfh/9rZ7FxkzLwajqewZPRv6+wuuApKS9xcl5hxmCFHZ4Bt9p
         Ayz/UuVsA1tVU1TxJ1h6C9maD44iliUZeNSf16Hp10AYiab0CJZS5QuNnfB+zibDJRpw
         wbzIPCwSEl9WQhBYlZs+zMFIkeOba+3OJDbdrjC4S3OZdVuEakkIKAtukSc6zX2iJQcC
         MeQVnOw/73YKwL8XD4wsVQuHFf3vyxJyXmlB9/ZZ0zU+IHCfXPxazYUJnjvcjmsjDkDa
         sqmn5JHNZyTvM53ti+S7YHtx5aduJiKYhqixbFf5DCPG7Ue0iM5R7c4m4tQsjFsvU1tP
         LaOw==
X-Forwarded-Encrypted: i=1; AJvYcCXXeps6wUSRV7ynuJgCGXAu+cqIDBfbCA+hM2+gOCQfePnTh6LUaAvZ8kCehn1MTWuxheVb0BX5zWGApsx8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw97Sv7gqy0eGtdY3qLdq6PedSvXuneqs5d1VhQDzbVqhRWcmm
	9IXBO/R8tfA3zxrwSt4vDjcK33Pprmi8Pj5PPZpvp2Oq161LnRsOMG+DMkj9wRSerbU=
X-Gm-Gg: ATEYQzyE4/MRIV9FHrg24P6KoWw+u3CCiH3R2pjFj+VLIfHx8WwQ8Pn+JGBpVEzgIoR
	R4+xdOjKCXmAfAKVblgzzVfd+6mMCWbttwtMLBfbjs41LdwdRUXKyTZvQjQ//o47HRHdDesG/4E
	FjMn+hChtHBR3X3yEA0B3i3y2tOklr1yip875Nq/t2UtWvZRkaf5A1le3Rs7nQAee6UX5WNW9IC
	9JuU/pn5KhYSXAOQGYg716zwms5BwimEJPtrs4grAEEiuez8l29cOj6NDlVOyD4LY7at7ChnfqP
	GOotuqFZ+APttAdd1R9dIu1c0kH3awKsCpBNCZJCVH9ac7ORT6fcI/6hocmF0bE08DEWhCFwVs/
	upzbv656GGh4Qai2O1fBMX9dA9cGsLGAUxzMTt+RjrbfrhZZfUOCIKdD+fiNLshibJRSkLDfk2T
	kk9r7FtgQglCeMceFOlLQzu6eVfI5GPtP7bwUn8w1vWx5br5udJTt9j7gUGbQ8yoGGslPpfhtlD
	5c=
X-Received: by 2002:a05:6000:288e:b0:439:8d73:58c4 with SMTP id ffacd0b85a97d-43997ee07efmr3050767f8f.18.1772100390701;
        Thu, 26 Feb 2026 02:06:30 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm38109724f8f.29.2026.02.26.02.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 02:06:30 -0800 (PST)
Message-ID: <d1ddaa7f-cfba-4e71-8a9f-70014c57de74@linaro.org>
Date: Thu, 26 Feb 2026 10:06:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
 <CuJMpimPBtwHGAd5-YHUArL6FkU2HQeY4SjbxeMwf0ToQ7LKO3zWSTn86L-HKxC1KfarWc4rRbZqnCMQsv0pcw==@protonmail.internalid>
 <20260226-fluffy-complex-malamute-7ecec6@quoll>
 <35b1ba2a-e156-4542-b33a-d4e53f6a62cb@kernel.org>
 <tVxcOw7tqTRGXAoW06WPM_voMVBY3SO7Mm_MTMWp6OuotVmgmyi0DOgVHdDavO2V6o3iRH7ax0NosgHuzGkHgw==@protonmail.internalid>
 <4ebe2f26-29fa-4104-bc90-3f5aa7009ec3@kernel.org>
 <c2d9742c-3d82-4340-a11b-16370bcad5ea@kernel.org>
 <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <72f0ed74-ac86-4571-8a72-d41282349718@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94270-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: C029B1A3FFE
X-Rspamd-Action: no action

On 26/02/2026 09:50, Krzysztof Kozlowski wrote:
> On 26/02/2026 10:40, Bryan O'Donoghue wrote:
>> On 26/02/2026 09:33, Krzysztof Kozlowski wrote:
>>> On 26/02/2026 10:27, Bryan O'Donoghue wrote:
>>>> On 26/02/2026 07:07, Krzysztof Kozlowski wrote:
>>>>> No, it does not allow that. You cannto change the ABI.
>>>>>
>>>>> That's why I reminded multiple times before reviewing new CAMSS bindings
>>>>> for Milos and something more. Because once it gets accepted, you cannot
>>>>> change it anymore without valid reason. And there is no valid reason
>>>>> here provided. I kept these patches in staging/waiting for long
>>>>> enough...
>>>>
>>>> I thought your policy was - a dtsi had to have it, which we don't yet have.
>>>
>>> And from where did you take that policy? I am pretty sure my each
>>> comment is about ABI. Heh, I even commented few times about implied ABI
>>> purely based on kernel, without DTS.
>>
>> Correct me if I'm wrong. I thought we had discussed either @ the Linaro
>> Dublin meet or the Linaro Amsterdam meet that changing upstream YAML
>> would be feasible _if_ you could show there was no dependency on it -
>> say u-boot, FreeBSD etc.
> 
> And I mentioned multiple caveats and restrictions. Do you quote them
> here or just took the first part of sentence before ", but only ..."?
> 
> Anyway, whatever spoken is improvable and I am sure I did not give such
> permissions, maybe except that Dublin meeting was in 2024 thus before
> the release of previous user, so before v6.16, so of course you can
> still reshape unreleased ABI. And then you released it closing the
> discussion.
Well, is there a way to support both then ?

Right now I have csiphy and their registers listed in the camss block.

I could add phys = <> as optional in the schema. Is there any reason to 
stop adding adjacent csiphy nodes ?

isp@addr {
	regs = 0xCSID0,
	       0xCSIPH1;
	reg-names = "csidX",
		    "csiphy0";
};

csiphy@CSIPHY1 {}

I'm not sure if this is against DT rules.

The iommu items _should_ be fine as its maxItems so I can just set that 
to five instead of eight in the dtsi.

---
bod

