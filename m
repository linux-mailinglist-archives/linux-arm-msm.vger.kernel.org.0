Return-Path: <linux-arm-msm+bounces-116796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pPxjN7y1S2r7YwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CEF711AF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:03:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="JmQ/2JrD";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116796-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116796-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCD5D30F2F66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A03142A142;
	Mon,  6 Jul 2026 12:27:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3225842A145
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:27:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340833; cv=none; b=pWTUeteHzUcx/4hkPxyyZFzpGF6J5/CSqVq+5KNn5B70o9AZBG6vxnM+LN//38+DDvZv3BLtYtd3OGAIRyaRbGhtAJS6HR7wGbQ4/LW5yFPEE628nVUKKyCfbawEWr6KQCbPMrF0JHTloaspp8dTuu9Lw9NIt28j61NT1LVf6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340833; c=relaxed/simple;
	bh=i3On1m+1xOP7BaqxdPfl0e+BIrUqtmSgKy1W2+LpuX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sYmPqhQBraEMo+5t8KXwuuQ8Lp6zEdr3w4Vyy97xexvkqBmNS82FU4Z2mrjrU9G8pK1DBD8ztTpC9K5BbQLRHgVDyi0nYvYB2ol5QCXey4HCb1J0RJbPWn3iINIlrW8I8zHshgODwBIq2g/k6PhzdMm+fDjsErf/baJb/tqH8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JmQ/2JrD; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so5502572a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783340827; x=1783945627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqZgOHmUP2WhlukFUJpUWMWTr9sro7DNP6QMMUzHrZc=;
        b=JmQ/2JrD+d2kvtqkaU22bC2mWFrRlJ4H2FnVSktcJN0erOtu29cej990y36xBDfl6g
         /5dlt3o4eb7siCqhl5dNTGgoUcrgr4O2VB43aUlpVik2gYDjiaotg7bh/M2n65kKV2Bz
         ugswnz83dkP2pLwsQsUK75XSMU8njWzBpUwYjTaGzDJ3vGtc7taG0QNSy9OI1QvxhPRT
         NYnNI5nu4eXrFC5s0qwVoy2eNsXrJWjeQ2FQE1vqg5nZIVJJ2x6KyaM8HoZSBiJAwrv1
         8t3bPIsKcPyMAcKEe9I1R4SDYOleMzEYa6J/P+3ouANVbyKF1rm6x85ihf0gl63zpi18
         mgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340827; x=1783945627;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqZgOHmUP2WhlukFUJpUWMWTr9sro7DNP6QMMUzHrZc=;
        b=BkFG80QzQ+b1VGRdJm4bstJ5teg02WDqEPPVcSzEZOXBmh4MlNwDBkQVkR8kZdE8y+
         ZcLO8SSI/LK35/IxoVv9RwmHwFapQmFtzJe7Nch9LZk8EjZSr6DxHOn012C3NLA7fYZt
         uWqXKJzcxu7eImCIhOiycq0M8BHrI2oHeLJew6b2WNJVvXxkLHlfbsIYuwspR7X5IvYi
         zNJPbxY6OigKPuUOvzt/bLwG4811Rq5SxZ3qBwLdPOrwMy1qUsgOQV7cV0XpMT3wdK6a
         VDjNoyPJPdIF5uNTuLCDjW4Ap5Y+4enROv/mPcRF3o1sbl/FLgAi+0d70t7FA/ofcyBw
         gr9g==
X-Forwarded-Encrypted: i=1; AHgh+RrorQGP4v9kGuiRzxIS6mq+yVZ3c2pNO9GflNvdDz/eoMC/lQmiRb8vgcOs5yXsDvLmpDGfxkPVPfYMjDNq@vger.kernel.org
X-Gm-Message-State: AOJu0YytMnO7tprPqTG7bZ2FoXfUNCoKu+fQZL9k+m6ZAs/gMTkRRdhg
	HilGdAaGAjKoGujDcYXMAvdQhfBUw968sJ74Oj2YDpnsx2tki2H7aqfgdypKUhDPNxk=
X-Gm-Gg: AfdE7cmLSN+VOjEihcIzheP+ufXtqWQW30mY7O2QnfIQNXvhUGQlWf1hVFYPIsyOMN5
	SJZJcniFIFjEBaIC/+38bVYFv9qy1BP5B20+D9rzN3ZVJdpMOtC+EJW2TNeqJtlhq4vcU7v/oPc
	X4ZKIXv28YURUGfy2GTHyet+8XPQrWdvH7phmd1EsB5ouy6SVK5VPsZrabV/y7Th5K8UuLVVj1O
	j5JDcJ0zNnjNAR5r1xmCbbWZYu/xIRo1JegMLOBB0NklJe22HiXCYd4veczJRGrynwdXGLc/mji
	BplLvwdrGjiqHhk9BxBCxCgz9p6LcFoVfzj6qCW+BmXFWccyjbZ4opDgaqeUuIqhMnf3o6ZDTrn
	9Xzp0HkCKgDzQAsFxQfrE8azSERuTryQFy+oqxBIsjsYv+xJUDqcRhBIqqNMygLte5v8jqDYgRY
	+SK0IQzARa62m/lmugcOteo2hZzQ==
X-Received: by 2002:a05:6402:2115:b0:697:8d48:7fa7 with SMTP id 4fb4d7f45d1cf-69a85ba021bmr238124a12.22.1783340827234;
        Mon, 06 Jul 2026 05:27:07 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.44.220])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4a60sm3946787a12.8.2026.07.06.05.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:27:06 -0700 (PDT)
Message-ID: <8871f6d6-6102-49bd-9758-faebbd9fa19c@linaro.org>
Date: Mon, 6 Jul 2026 13:27:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: qcom: camss: Populate CAMSS child devices
 via DT
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
 <20260706071113.383215-2-atanas.filipov@oss.qualcomm.com>
 <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <389ff33a-b319-4f2e-9410-8ae962f2e844@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-116796-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:atanas.filipov@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39CEF711AF5

On 06/07/2026 13:09, Krzysztof Kozlowski wrote:
> On 06/07/2026 09:11, Atanas Filipov wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> Use devm_of_platform_populate() so that child nodes declared under the
>> CAMSS device tree node (e.g. OPE) are automatically instantiated as
>> platform devices. This is required now that CAMSS is modelled as a
>> simple-bus and ISP blocks such as OPE are described as child nodes.
> 
> I do not understand this rationale. How is this required now? Are
> existing DTS broken and do not work? Then this needs to be explained.

Required is wrong, true. Existing DT is not broken no.

Should read something like:

"Use devm_of_platform_populate() so that child nodes declared under the 
CAMSS device tree node (e.g. OPE) are automatically instantiated as 
platform devices."

Why this patch ? We also discussed simple-mfd but then settled on this 
way instead.

https://lore.kernel.org/all/0f898ad3-156d-496c-b2c1-88646edc7ab6@kernel.org/

> Best regards,
> Krzysztof

Not withstanding this series, I'll fixup my version of this patch ;)

---
bod

