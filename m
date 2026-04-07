Return-Path: <linux-arm-msm+bounces-102240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SF8eOlF31WlC6gcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C403B50D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 23:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA20030117C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 21:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B17E37C91E;
	Tue,  7 Apr 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxDpTPiu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F52C0307
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 21:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775597391; cv=none; b=cp4eAAUMGxTbYC7l/Px8PYHeDJ+nyzcSGIiGQPzfo5zV03GeYrqkOochweoZTvJaaq1St48B3R2C5EQ8W65WBDTrPDtE+qtrLSwZHVEx7xDl5QSwHsQxeo6ZyVoqcIycyGpeMtQUAsS3oP/BEpxGzQM9nUOscvYqqIl/k76OtIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775597391; c=relaxed/simple;
	bh=LUzfOZ9YwviR8BFAgvfFpjUtsgdASt+x7nUVSfVWXho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ckA9joJ1ksaOkj9x1X5dcBc9S1FcAExpfolNMobOiXd4Dvl8PR0Tt3wIuHndX2eaV297RDdnAjCapTng1WaxJMFZZz6MtVa8/jv/CXEDGzrIgVdnWYASlqu600dSd5k8/p0jGo8uaq9eBRg6r4+9ZVOBbTANEWAtWpwLZ+1zooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxDpTPiu; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12732165d1eso7774626c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775597389; x=1776202189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAsUgyG9UbQQ9jLOZH8SPojAcuCKJ8oZlGopHdK8NOY=;
        b=cxDpTPiuMFC4Jdp6Ap6ifTxYxdF8tKsDiDaqU6zlNLnKwAPRpLA4kvX4AVoLHw7YDQ
         cUAOAHIxmc0r78meBe6nXLBh81nauevq/PqineDbkvSQmWvmIJgjHBux7Ri8B8YKQeWI
         gBCsK6nywhMnDmPPOrzdu1ozAUYgA6d2YyQ6bQkw05WbzX/+UHDIlxvV+koMMGUVuMa4
         YxR++eDNoQ06wQGvm/lAEawl2R9mrEZFP3BWwa1AZpWFG0OTNFiakoxlJZOP7UYI04H/
         JKFUEjVzT84YCiIzZWXpXAy5qVH4K3Q11HH35TPVEWL54HmMDkfvukIpiqcQhEfhh7yN
         ILrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775597389; x=1776202189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAsUgyG9UbQQ9jLOZH8SPojAcuCKJ8oZlGopHdK8NOY=;
        b=iN1COKOD1VZi87iJM3Rvz9jjwFf6KFs7tYrz0xx5PBkRigHY9BMI2WNGtohmm/RSwg
         gG5/YNqJRuVmBoyIUtIzn9K83kGDDaMIrfYH+Qe6Sn5ihNrK22xTpBl+6LIU78xzyMzh
         qR20+2GnCOqWMh3TdMQgILcdL/M3NEVoLtuC3hgCX2mgGEz3Fa6xBrhdv/SXrt8rsUuv
         vHFPODWvee/4JxLNHB+5ExmCdVBNEdx5yZ7AJhDC3QM/E1CjFutn7njvMn5xXbLRiYqp
         V14GDzjJdCJbnmRS9QYAJ+cFpMZdK0CNjFwf38HmOxLycwXyrpP7FZ6jy1MsAQ920NRa
         YEaw==
X-Gm-Message-State: AOJu0Yw4nZq0ZBJZNBM8WGlyRe6AnY4MB80jOJXW5VVIS7E+xD4cQxtN
	pIpEPrKCkDildPd5+547vy8VEUZKVosHwTE2Ptg0EIyJFbezdomwY92FZSjgGJ62
X-Gm-Gg: AeBDieuDX6eXfhDouD0J3LpkdDvUs/Kxe9GpQp+RcbuwTl3HglmqPoMN2Bp5lZLFlMD
	prg8Wggl6N1jRJi7MLh+yf26v+GTkTKGw26t7kJlbP3TgnGc4xjTtfJ+TLsHC7+0Rnt5610hb84
	A89amDf7XlwWOKEAPEzZH0QIjME6c1mkA0OV3PWqxyC+xvTxFvbiRZRcvPHBtiVIDmSbi5VLh5r
	W6PndS/zBTYk+rcCNPKfTTOpa8RsSSjfwItqxiB9qLcn2UZmzdXZ20mA9d0MZf57laPFZac7QLK
	oAqF6e/m8ag2cDEw8GKgTk7qQBnGubCEVMutnflUkuDNqAI9Vn+DiVdC5wPYKPmXVKUw7kFDPH4
	IRpWTQaToDVySfWGxtMlpllvltJVC8zUgf7WoBZBXs57imCJV+0UJ6MuKIxBjCJhESNqTgTzthV
	EdAoz2h102f1Pj/gRFo46MGG+P7lvOV8nIw2AUtpEOhT6ypyznkc+8FqiaGYuNs6qQAxdSjgTEB
	uMAPg==
X-Received: by 2002:a05:7023:b0c:b0:119:e56b:98a4 with SMTP id a92af1059eb24-12bfb700b66mr9474420c88.11.1775597389162;
        Tue, 07 Apr 2026 14:29:49 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm22255462c88.0.2026.04.07.14.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 14:29:48 -0700 (PDT)
Message-ID: <ca3f183c-4237-4620-8738-6700d5a68146@gmail.com>
Date: Tue, 7 Apr 2026 14:29:48 -0700
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
 <b8b04f36-2f4d-4d0e-b0af-a01d129a5199@gmail.com>
 <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <a27ee109-0716-45e9-9aa2-b58a57cbbd46@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-102240-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91C403B50D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 14:04, Krzysztof Kozlowski wrote:
> On 07/04/2026 22:39, Rudraksha Gupta wrote:
>> On 4/7/26 12:59, Krzysztof Kozlowski wrote:
>>> On 01/04/2026 22:32, Rudraksha Gupta via B4 Relay wrote:
>>>> From: Rudraksha Gupta <guptarud@gmail.com>
>>>>
>>>> Reorganize the DTS file for consistency with other msm8960 board files.
>>>>
>>>> Assisted-by: Claude:claude-opus-4.6
>>>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>>>> ---
>>>>    .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 +++++++++++----------
>>>>    1 file changed, 207 insertions(+), 201 deletions(-)
>>>>
>>> Sorry, but no. We are not taking Claude as one determining coding style.
>>> Are we going to do the work again the moment we come with proper tool?
>> There is no tool currently to auto format DTS, and doesn't seem to be
>> coming for a while:
>>
>> https://www.youtube.com/watch?v=cvoIbTL_ZQA
>>
>>
>> Claude didn't determine the coding style. I did based on sony-huashan,
>> which is already upstream:
>>
>> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
>>
>>
>> I just used Claude to do the manual work for me. In v2, I made sure the
>> diff before and after the change was nill. v3 included additional
>> changes requested by Konrad and some comments that I remembered during
>> prior attempts mainlining patch series for this device.
> IMO, it is just too risky to let Claude reorganize the nodes, but I
> assume reviewers of your code did run dtx_diff.
>
> If they did not, then it is on them :(

That's fair. I also re-ran my tests after DTS reorganization and they 
all work:

https://wiki.postmarketos.org/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt)#Testing


Also, I think I'm the only oddball using this device too, so minimal 
impact. Someone listed the I8730 model in the wiki page, but I believe 
that's a MSM8930 device.


Hopefully that reassures you. :)


Thanks,

Rudraksha


> Best regards,
> Krzysztof

