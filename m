Return-Path: <linux-arm-msm+bounces-107049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC6qCbXeAmosyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DE751C596
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF19E305C636
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AACF481675;
	Tue, 12 May 2026 08:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFXf4nJ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9343F481658
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778572805; cv=none; b=pXr7yaKBOB9arUwijmCUABQuYjUGkyZHOXI1SFrdL3luIEd8dLbr/JBtE/XEdg/zUcLzhJOKoDB+qgvOCmNs/d22RukZMAXXyouBqPp6fq4BHmoz5VfnB/EFcYjBJY/cvrjQr/+vckBied84/V6I/ZEouPfh0eS30yY9PB72ijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778572805; c=relaxed/simple;
	bh=2fv5A4e1dB9zVQIntVwLfiUySYvcdprvcXazBhueM1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YXPOZyg8dpKWRIYuGlQTF9UHzy7D+RUr9/3DNVrbewqrVqNFhJJ98qWFJZ8I5lkGYJUrUdxtqRsiyL8PWvFQlyLfYIFbUYesmFpKBxMgpugVsTttRXs9Chi0z64orjTigrgNIaP/9+/e8xubIBrFHe5DTwUoyvy7Cn3UwvDOITg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFXf4nJ5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso9909421a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778572802; x=1779177602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3vQQvfbzTBQxob4QAR66E1utIi23oX37LhpyEU1L8A=;
        b=AFXf4nJ5CkeeIikBG3N73Yg/D9d5wNtwORMTovs2xB0jwYyjZu9/idVoEsv09+9pbf
         2hvD43nCBOrVaKI0ST8LS71l8XpN6NcoEq+Uf8t11f0ihX4LPE8JgUNgMCtFbsTzTnP0
         gu7b8b2X4rj2CRPJYo/US7AijhYx+6LeHk/mF8XdAxvPEpIjSQdxAMSwqS4TeuLCH/Fg
         2qn9WayOmstRckvJj6tTpNUT1fRX95s4po0hcf0DbD5uQf9W3qzqtx52haLpCoW+/XXm
         tq+EMwfN25zN5GtMvkWcTS11oQn6ed3qjoypuVQTiSnfCydi34jNVq2JP3Z28t2Xh6YG
         T2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778572802; x=1779177602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3vQQvfbzTBQxob4QAR66E1utIi23oX37LhpyEU1L8A=;
        b=e8rHwwMidxkYwD/W+ZKBfDqV6jcplneWAE0Lu7IGzf7TSXoJaWVb7UFfg55nKONn+V
         2CP0H8SBE5lnmuIrzZPLGWBae1VhDJNrjwgR1hf2sazzm3m3WCGXdlX6AmDDfwMXwmbU
         J9cSby7xjS+PjMXZryZ2Cg/ZmFTJcZBV3Tffy3MMxC1ZqwHlRXDGWwiTfWWnni60KXCY
         ZcRzkTo96qUU74m3zL6b/SgqBPedLNKH5OokU/elRZi/BpnOtyIjsDbeTJSnmBRBI7pg
         rN5/dQeEWTBC63648r1G7cJUspgGVcC1M7yKHuyvicyhMeKAAWhRU7dacHNSRL5a1qAv
         VMxg==
X-Forwarded-Encrypted: i=1; AFNElJ/pHtuIw3PZWfb41EWASPNZIQTKXvbpECMw8Jqx6sjtYST5jbedWkwAWOUNp65C0zCg8ZazE6DVLuECZj16@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmb4ggls81ROwl7rKjAei7pcOJFqVR3eHP3IylxVkwU0M2Yd9F
	lf/OLBVN16tjyw4voZ+R5zlRhpl0rUkzaIy3KrDi5MQE84x98Sr73wCO
X-Gm-Gg: Acq92OGmNYsWefGJz4isU89DFGeo76ocqpPSfuBSz/v0VDHg9yYVrjX8N/Hyp/B0BGw
	Oz7w950XPpghZu9OX9EcjVaoMDkDJT+kRpWWDKeY+AVkJ7kmUtTEAAUwawYXooG2LQHIDWOr2Ls
	Ek7gQqnLpXAqLf7LQ5yxpi3+DGIdtBp1Rhg7ueHw0vGHbzvuO8TfzUSaZ12F7K7D6dyRBpZIP1n
	OfincQON6gEfsG9rGxpV4NKKzt59MUK6/PmI8R2Yaevv7UcAibFKpNvF7bOEe9tCdvmnrQZ3S4H
	lRoMoqLJandNeeQh0wjfymmUwUCYs2H2wfoblGH5d+tLoY8u0ZE6pClYzoHyFnGZUgG+h8j+pv8
	MawYHGGV45gbKJgwHS6EhZBILr6exJAn9dfwCa+JEr90s61jvgxamK4G+Xp18wURADnOqr8ydQw
	maYfUgcEUsxb/vCUl67qabdBWh705JpGDpRA0+Sv8vkmAdhlJG7PZvYbcJGg==
X-Received: by 2002:a17:906:d542:b0:bae:c57e:d192 with SMTP id a640c23a62f3a-bcc14d99e30mr657180366b.41.1778572801449;
        Tue, 12 May 2026 01:00:01 -0700 (PDT)
Received: from [192.168.1.31] (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0e0d455sm4768266a12.21.2026.05.12.00.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:00:00 -0700 (PDT)
Message-ID: <8216541f-3615-473f-b9de-139e6d32a7f1@gmail.com>
Date: Tue, 12 May 2026 09:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 val@packett.cool
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
 <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <pxldv7v6iymoa7oyg5xs5d76atl7fliol4oty3urudvnkoaynj@4xhovegebszz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 78DE751C596
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107049-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On 4/19/26 1:47 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 17, 2026 at 10:47:49AM +0200, Stanislav Zaikin wrote:
>> Xiaomi 12 Lite 5G is a handset released in 2022
>>
>> This commit has the following features working:
>> - Display (with simple fb)
>> - Touchscreen
>> - UFS
>> - Power and volume buttons
>> - Pinctrl
>> - RPM Regulators
>> - Remoteprocs - wifi, bluetooth
>> - USB (Device Mode)
>>
>> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>   .../boot/dts/qcom/sm7325-xiaomi-taoyao.dts    | 907 ++++++++++++++++++
>>   2 files changed, 908 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
>>
>> +
>> +&ipa {
>> +	qcom,gsi-loader = "self";
>> +	memory-region = <&ipa_fw_mem>;
> 
> Could you please move these properties to SoC dtsi (as a separate
> commit).
> 

Sure will do in v6.

>> +	firmware-name = "qcom/sm7325/xiaomi/taoyao/ipa_fws.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +
>> +&tlmm {
>> +	gpio-reserved-ranges = <48 4>, <56 4>;
> 
> Could you please add a comment why they are reserved? I _assume_ that 48
> is NFC SE and 56 is fingerprint reader

I can add a comment like this (or you can suggest different wording):

/*
  * 48-51: presumably NFC SE
  * 56-59: presumably fingerprint reader
  */

If that works, I will add in v6.

Thanks for the review,

Best regards,
Stanislav

