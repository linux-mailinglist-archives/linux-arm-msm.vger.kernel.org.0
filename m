Return-Path: <linux-arm-msm+bounces-102234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLnREKRr1Wm96AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F83B49A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 22:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED44B301F2A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 20:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289B237AA63;
	Tue,  7 Apr 2026 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8mP/N7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B96937A498
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 20:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594399; cv=none; b=bn4TWVPF6UJmqMUxPhFasTQqd33gIjGJ/SRPtVOWBAuUEBudqXs2QTltUqLevgBM4gLcbUJplKwhOsOMrS6w9t8T34ADSsBMSGR2+zC+VpVN86dId2+gKynBx5cF0sngbhj12IqiFWujun8sVFSlqiroDH1YCqY8JDJOskG3KHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594399; c=relaxed/simple;
	bh=ZTYvc5QlApW8b7c7LQqpkgRmOrJ9zY7/hhMO3WZOYAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jv9sIGb5lgN72vcYbrFsas6lmpO9kYqj7bx8nBkWf9sSR294/B0rlSrQ0YYiz0KkFcs1LRdGcW0X3ze/AVqJ8psXRQpunXRJgT6QXZuEy8JuLWDskOh6h/vxm+XKlDSPzv9NwI6BYj+I+Xvc2KZm6I0NBztGpcBKqYJMlhFm/ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8mP/N7E; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c7d8bbad06so11592071eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775594396; x=1776199196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rG8uT7iFeLc6nzTWdSG+khDtXnia07K9+OVRfIk9nH4=;
        b=d8mP/N7E7yloPigwy6yVohOPrmIy1wlFLL5CffszTIPD6ONZmBWKdwJkplVITZe7n1
         eEVNzB58aqomZM/xrGu8Gy1xwqI3j+J8PmVmW4VLNBSv2OaXdA6TVPqLx7pWZcM3Z5I4
         3iFeLlo9bBjwGe1GyB4ELRvHI7KY7AauXFdHEsCduaV1DTtnv/ocnPm6WkbkFPfQE+zJ
         j4LE8QagayWyy5d35iN5s1uMfRrh5rwc9rEZQAlMd5KV+4RJz0nJC5RaktCChY5/gjgH
         JBqatH6jJ4zeWT3j2kLbW+qhb3qD+9N0RzRyFmsAhoYfnfLdXJ6W5F4WjQlJ8SuaWjZ4
         yY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775594396; x=1776199196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rG8uT7iFeLc6nzTWdSG+khDtXnia07K9+OVRfIk9nH4=;
        b=Hcj/hjBkMgzqLXHNoEiPE/saDT1NkMyboLo0f5GnSMmtASmXWT6gzlWJKOeHaedNfC
         sYM4EvGkRt3AH79FkAKypDyuMZ4exh4AihR2jc2066swycog6F4vgSx+1yhVQuxogPFB
         svLirBwxY4GO17uKi9Sry7lQpWzwBFNpGv2OzLhsMaG66ajiQlW0t7gPkE78HukrJYJs
         jQM/1eyg08a8HaHfcfD6bmpvJmiJ6zPGI5nKikX+KHiIVilTjH4gJWpJC2NPsGkSseKX
         0NkExkAWVBP7XFb98FZffZpOuABuiRKLNbWuZhQeItW/aVdsXM/fyFQRUo4Zumm2ouNz
         QGTw==
X-Gm-Message-State: AOJu0YwXmE4cy7l6iy30+dXTibGvv2W+5i3Dc+5IAPwR4ZMyT8Efwt4f
	305cZCAFyvm7kCh/509k7wyddYan0xpHAGC8KTqceYgkdwkO9XQrgbUA
X-Gm-Gg: AeBDievwcgXR7tilAmPlW1GXdRF1r5r0iVUqOZ+utkZpNfGFjTPgjk9i7muPE8gjYBg
	MoVB3gQQeK/y2N3DCHPNH3GsACb89SuKPYvKjQURvAidxiJPRfgIKtp8viOb5mEWbMw8UXPs+t8
	k2G9lYSxepdsOWdaKsEVoy/5Lw9DTlw9J8c+UqOnXgwACbk7NqmpyeHsxQ7wWpr6SkgN1TKHdHs
	8yeV2NOMHKvETdmipNkQF246/HVOHUMThaMtgeZs6miY/DzkHmAM2Q0MSMeTq5N1XoK9lnFUGi0
	wgyzQfdH2DivhekyPwqdTxOHri5jhlau/yCvpTspcwVdsm2JljIyTtnKaIhBlJNlJ5Jebea8p13
	xBLAsr3F+GVeROPCpOgnYZGufetLz8ZK3vkZ0pISOOqFH6B4yKqV1HM0y7BAuWgTjw1II7pmaKX
	Iuqiz/CoBpVpPsbZ9x6dQTrepD4IR9rC4O5dVJA0rm6JOsZOje5XWlg7hlPXkJ2zVGyeHKDS6J6
	DfKqFyfxv28rnug
X-Received: by 2002:a05:7300:748b:b0:2c7:2c0b:f33b with SMTP id 5a478bee46e88-2cbfba8e8eamr10121436eec.20.1775594396260;
        Tue, 07 Apr 2026 13:39:56 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cf1af62347sm10824910eec.22.2026.04.07.13.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 13:39:55 -0700 (PDT)
Message-ID: <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
Date: Tue, 7 Apr 2026 13:39:54 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
 <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
 <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <8e4ee378-113e-463d-8b21-eeef74b84120@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-102234-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D45F83B49A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/7/26 12:59, Krzysztof Kozlowski wrote:
> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>> From: Rudraksha Gupta <guptarud@gmail.com>
>>
>> Reorganize the DTS file for consistency with other msm8960 board files.
>>
>> Assisted-by: Claude:claude-opus-4.6
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 +++++++++++----------
>>   1 file changed, 207 insertions(+), 201 deletions(-)
>>
> Sorry, but no. We are not taking Claude as one determining coding style.
> Are we going to do the work again the moment we come with proper tool?

There is no tool currently to auto format DTS, and doesn't seem to be 
coming for a while:

https://www.youtube.com/watch?v=cvoIbTL_ZQA


Claude didn't determine the coding style. I did based on sony-huashan, 
which is already upstream:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts


I just used Claude to do the manual work for me. In v2, I made sure the 
diff before and after the change was nill. v3 included additional 
changes requested by Konrad and some comments that I remembered during 
prior attempts mainlining patch series for this device.

>
> Same comment as usually - this is highly invasive change which should be
> done with dts linter, not LLM, not manually.
>
> Best regards,
> Krzysztof

