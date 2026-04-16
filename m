Return-Path: <linux-arm-msm+bounces-103451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMC0KwYV4WnoogAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 18:57:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5543D4122C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 18:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A35883019074
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 16:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59949318BA8;
	Thu, 16 Apr 2026 16:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/MrKT6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8C430B535
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 16:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358658; cv=none; b=Xg1xdnmtbl4rEXd0zWw7kKl/iQ+Y1lDJHncOmjYCPVA1ozR1CWoU7OlwJI516KzemCfDdJ7xW278w2duh8I+qr9xOdiEKXsPUi1sUHdKAZBhCMufuErXHunHCOqHGQ+lkDdy/BaeKgXzo2i0Vn92jtc4mpN/M6Aa2SIFdjs82xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358658; c=relaxed/simple;
	bh=ZQzEC9KPPF/hi8gDo0hur4Qe56bygpOXxw15KXDnxAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df+8v7BJITrmnmMTG5MFhwhC0rj9vYm5bDv3nZhXRG01xt+gMIXdyMh4Eqt4YmHPqswlC+C3LrbtxcGwG9BRa3P9IdCF9HnS/RXqeEwmEjS01J/FYDJ+dpQljlB64iuXYAG+csmvoAVYIhCjlhwxv9NZ1XQtYbJ/Apypm1uBeuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/MrKT6O; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3878de20527so65208431fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358655; x=1776963455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=A/MrKT6O9oD6Gfu2xmuZDFlnBZTe9Jk/sv7bT4sc+7K4ZbAgwuGa56iA95WpWk8z/Y
         E+v2A/H73A1sI0mubI0GSwIcVMuBIZMtaUT/l+FHqTR+g51zKNqsWM4oUriPaUtzNB1a
         2PCDLQnOpAQbDbBiacp3laaM0SHVGtMUPhPosJWmuN5Z3s6CzLSAM2cQ4t6i9VdWqKoN
         IikH+pcAqGOKGLZOPVqs7U2kZ6WVzyQb8rVJF4EDMKOAF4j5XOp6zYwQj75u0LZFRwMm
         PbhdwrTPJZAsuYiq76tTuuj28EInyGiKeNwbr022Kae5Nd+0NIYQBP8gjE6eav+5FgtK
         ehUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358655; x=1776963455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GwdYD3XnjJtBgOU3arfJQiqPM7dBusbX3FMwNNhUQFc=;
        b=Ja1rkoTCJmXC04/ZfQ7PDOSjCJ3Anw1rMv5TOihzMm2iiM50y/FVwG6DJc8ix/jwzP
         S55/79VP6EYTihVZoCsnnUruR8/vWuoGa1tMr++/ILAcoVLSFQjAyuoad182nYcVXREQ
         qoWGaV5rszS39A5v4X8cX9ITElzj8hMePaW1llYSxge7l5RgBElCWwvzR1AjQqZM2Psp
         Z7ziA8dVJIzH3l5Z8hfCF4vuiilfe12UJvNDavb6RhtbiBomr1X0dUVUmu176ST/tkz7
         X/RxxlfwvI00BUyPSlO2szixDkf0ksBFrNdSmHQ//OWlr0WYayxP0SsAExG14PEVV9cT
         jcMA==
X-Forwarded-Encrypted: i=1; AFNElJ8u/4NU8rYOKaBcC04BrwS0/nBET+gU5zfsiFqFtnrdZKpipN8WT61bYGscJ9E/3/Vj0ro2VzrWwIMj66Ew@vger.kernel.org
X-Gm-Message-State: AOJu0YxNlUh+WzCo54g6jRFScP+RocHPMOU5MGvDNnqhFLZQyujl/ygi
	kUFQMyFCzjG0OWlQ7svOlOH56KT4vGgElpAqVbvhyjDugLSSKLZFy66V
X-Gm-Gg: AeBDiethVWj1zSkqDJM1j40+EgP4iFzXXMCix9xhLYuP2hY/+rcGXEHpg1QsOSTi9XF
	rMZxiUxZDVW6bHp6t0tGQ82hQzrK5VCzY096e+y2JpWuRjp1h9freWnsrsjjd5IU5K9kirSjJSW
	UlxEAFN71tZmLAJ2x1mcwFmw19vEWA4myulCZnMJ1Y3vMbFSaRg71xz73Anqxe8nqpeaVRmi6Yo
	O70gmqQYSRVvSr6EVtWlwhYHpCaRZfJVEQTzNzJ/tySlu69u/HC+6oZfT6N61kGawMQD8hIXtgT
	SuGG5h/LAdC4e4vjS1EamuB+BoYJ0Wt1p9W1skHyDVeSvz3GOjRouOW6HNtM9uln9rDQaoly9ZU
	8X3VG2zYWdsiMfTVrylle2mjReZRUI7QIk9bwKt5wsF7vB8kU1pbEX5YgkPnSo77IHhCU+QJs7Z
	mnF9GNGpy2KCjp1/R4LuCfPyXOC5anmHWJUtmoOozzmGCGfuBcq/l6CRJoAr8CNL+K
X-Received: by 2002:a05:651c:985:b0:38e:21bb:b2dc with SMTP id 38308e7fff4ca-38e4bf67cd6mr84783971fa.32.1776358654514;
        Thu, 16 Apr 2026 09:57:34 -0700 (PDT)
Received: from [10.29.244.82] (m-37-0-167-201.cust.tele2.lt. [37.0.167.201])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec6b35dsm12269011fa.37.2026.04.16.09.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 09:57:33 -0700 (PDT)
Message-ID: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Date: Thu, 16 Apr 2026 19:57:30 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103451-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5543D4122C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
>> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> index 90e966242720..231a3e9c1929 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
>> @@ -267,6 +267,14 @@ &usb_hs_phy {
>>  	extcon = <&usb_id>;
>>  };
>>  
>> +&venus {
>> +	status = "okay";
> 
> You need a firmware path here

When I tested Venus on my device, it loaded without one specified -
msm-firmware-loader creates a symbolic link from modem partition for
firmware. Additionally, none of the MSM8916 devices seem to include a
firmware name. Has something changed since then?

> Konrad


