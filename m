Return-Path: <linux-arm-msm+bounces-115772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/tkNM1PRWrB+QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 19:35:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A16F0624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 19:35:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=minlexx.ru header.s=dkim header.b="wPKv/JO9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115772-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115772-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E31B3010CB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 17:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD8A38F230;
	Wed,  1 Jul 2026 17:25:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483073783BB;
	Wed,  1 Jul 2026 17:25:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926737; cv=none; b=PtiuIH7I3V0ARNHs3XkG878LLHIwUUM5JaVECqvo48A0uZklziMTN58MmfoLNdrquBWKMaVSXobdM5N1aG5UWiMscVq+XyjOtL5CFwUTN723XkLXe7oPil5mKBV8Wwl3MxGVObiCYM1q7I5pSLeapy5VlaDJUP3UpNp/C6leMD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926737; c=relaxed/simple;
	bh=fyf0et18Ak+1WNJ/SM7FwYaR7+j/tgOuZyhk+0BqUok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qelsj5+hnjiGzy5PF7OZ2V9EI8YDRbUlVZnAKUro3cb1JdGKX/sIeHglFsRtAQmlkYfBud52Qy+NfRLw3GRbnt018dyNFr3mYYgZQ5PvgtCiq8QvLaZYL/8aeVwI4zYo6/UdTtAEuJLVc7CVxXqL6SIlOCeP82URinfY2bcFsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=wPKv/JO9; arc=none smtp.client-ip=31.31.198.150
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TGGt91UsYTiqS1Elo4/qTSmCTRCpPxNHdDW4fXvC2rY=; b=wPKv/JO9OhTirG4J/wC6VNs8qs
	eT1via8JqfY1AfI8V0EbKm4WlrquMWRwPL8e55qNSRgJhfxJrjYU6u8LZy/xue1aZ+CGIH8FyN19k
	nKtxIqFVdEyfc8gXvsHzLIYuMWnPJW/Y/YFOPhwVc5EvdJ+PWpkz++bjMusqmH8vrYh4=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1wewup-00000009kKT-0VMb;
	Wed, 01 Jul 2026 18:31:55 +0300
Message-ID: <edf331e2-73a5-4afd-9a44-56cb786626c5@minlexx.ru>
Date: Wed, 1 Jul 2026 18:31:54 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Nickolay Goppen <setotau@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-3-274ba3715db0@mainlining.org>
 <337d362d-93de-4e81-8141-a51fa75d615c@oss.qualcomm.com>
 <e282acd6-dfcb-45a6-977d-eb71b2619b7d@mainlining.org>
 <976824fc-335a-4f47-a4b6-29966137f2bf@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <976824fc-335a-4f47-a4b6-29966137f2bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[minlexx.ru:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[minlexx.ru];
	TAGGED_FROM(0.00)[bounces-115772-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:setotau@mainlining.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[minlexx.ru:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,minlexx.ru:mid,minlexx.ru:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 183A16F0624

On 01.07.2026 15:48, Konrad Dybcio wrote:
> On 4/27/26 5:20 PM, Nickolay Goppen wrote:
>>
>> 27.04.2026 14:49, Konrad Dybcio wrote:
>>> Please make this = <0x0 0x80000000 0x0 0x80000000>; instead, since the RAM
>>> starts at 0x80000000
>>
>> +Alexey Min found out that on 3 GiB xiaomi-lavender RAM starts at 0x40000000
>>
>> 40000000-855fffff : System RAM
>>    40080000-41bfffff : Kernel code
>>    42600000-42fd0fff : Kernel data
>> 88f00000-8abfffff : System RAM
>> 95000000-feabffff : System RAM
> 
> My docs happen to be silent on this subject..
> Do you have a device that has more/less RAM to compare?
> 

I do have quite a bunch of devices based on sdm630/636/660.
Logs from UART including longs from stock bootloader are only
available for lavender,  though. For others I collected dumps
of /proc/iomem (and debug/memblock/memory):

* sdm630-sony-pioneer (3 Gb, phone):
   80000000-855fffff : System RAM
     80080000-81dfffff : Kernel code
     82600000-82e30fff : Kernel data
   88f00000-8abfffff : System RAM
   94b00000-ffafffff : System RAM
   ffc00000-ffcfffff : persistent_ram
   ffd00000-13eabffff : System RAM

   Similarly:
   H4113:/ # cat /sys/kernel/debug/memblock/memory 
  
  

    0: 0x0000000080000000..0x00000000855fffff
    1: 0x0000000088f00000..0x000000008abfffff
    2: 0x0000000094b00000..0x00000000ffafffff
    3: 0x00000000ffd00000..0x000000013eabffff

* sdm636-xiaomi-whyred (3 Gb, phone):
   40000000-855fffff : System RAM
     40080000-41dfffff : Kernel code
     42600000-42e46fff : Kernel data
   88f00000-8abfffff : System RAM
   94b00000-9fffffff : System RAM
   a0000000-a01fffff : persistent_ram
   a0200000-a03fffff : persistent_ram
   a0400000-feabffff : System RAM

   whyred:/ # cat /sys/kernel/debug/memblock/memory 
  
  

    0: 0x0000000040000000..0x00000000855fffff
    1: 0x0000000088f00000..0x000000008abfffff
    2: 0x0000000094b00000..0x000000009fffffff
    3: 0x00000000a0400000..0x00000000feabffff

* sdm636-asus-x00td (4Gb, phone)
   80000000-855fffff : System RAM
     80080000-815fffff : Kernel code
     81a00000-82057fff : Kernel data
   88f00000-8abfffff : System RAM
   94b00000-17e4bffff : System RAM

* sdm660-xiaomi-clover-plus (4 Gb, tablet)
   80000000-855fffff : System RAM
     80080000-81dfffff : Kernel code
     82600000-82e46fff : Kernel data
   88f00000-8abfffff : System RAM
   95100000-9fdfffff : System RAM
   9fe00000-9fefffff : persistent_ram
   9ff00000-17e4bffff : System RAM

* sdm660-xiaomi-jason (6 Gb, phone)
   80000000-855fffff : System RAM
     80080000-81dfffff : Kernel code
     82600000-82e41fff : Kernel data
   88f00000-8abfffff : System RAM
   95400000-afffffff : System RAM
   b0000000-b01fffff : persistent_ram
   b0200000-b03fffff : persistent_ram
   b0400000-1fd8bffff : System RAM

   jason:/ # cat /sys/kernel/debug/memblock/memory 
  
  

    0: 0x0000000080000000..0x00000000855fffff
    1: 0x0000000088f00000..0x000000008abfffff
    2: 0x0000000095400000..0x00000000afffffff
    3: 0x00000000b0400000..0x00000001fd8bffff

* sdm660-xiaomi-jasmine_sprout (6 Gb, phone)
   80000000-855fffff : System RAM
     80080000-81bfffff : Kernel code
     82400000-82c1afff : Kernel data
   88f00000-8abfffff : System RAM
   95000000-1fd8bffff : System RAM

* sdm660-xiaomi-lavender (3 Gb, phone), for completeness
   40000000-855fffff : System RAM
     40080000-41bfffff : Kernel code
     42600000-42fd0fff : Kernel data
   88f00000-8abfffff : System RAM
   95000000-feabffff : System RAM

   lavender:/ # cat /sys/kernel/debug/memblock/memory 
  
  

    0: 0x0000000040000000..0x00000000855fffff
    1: 0x0000000088f00000..0x000000008abfffff
    2: 0x0000000095000000..0x00000000feabffff

--
Regards,
Alexey Minnekhanov

