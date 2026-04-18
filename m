Return-Path: <linux-arm-msm+bounces-103596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHnADqmk42nyJQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:35:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A992421797
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 17:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A18230209E5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 15:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4D13002D1;
	Sat, 18 Apr 2026 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2sPNMUH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB5C8CE
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776526483; cv=none; b=dTx7pfnqM0VtxUViOdjvC9p6HDGe9bLRZ547TKgzbskZ9dR8nwkwRIOvbPUTItDz7SiqlsJYO/EuSc4ysQm2gv5hwZL0DmD67+JwIK4OimFdtyoi4s9T2Qy9R2cctNN5QsioTP9dGRBUGcpLS/WhzoFMpinc68UD7uZYK24IXpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776526483; c=relaxed/simple;
	bh=TPzN5DMU8T/18hixWg+6FbE+3zhkzJJf8xccVhqSMfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t82vJEBEIJEIXssE5gHBNUjgONjd1HEyYSsNfItI379d8sHWiECi/8Cg6Dy1iclmLMXLE+Ig/jhZzcK86y8VV16yz4MSYqwaZI7fWzbvYNovGDqGt51vlgQdHxb2nLR2N1VCijPcuFntuwzUo196PyUUCWO1yZBV8VPr81fEpdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2sPNMUH; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-793fdbb8d3aso15665187b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776526480; x=1777131280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=e2sPNMUHwQKNFxBRt9bexCJ7KiZUbIjPEp2KZ0QTgLwoeUhdJAZDtlQ3wqLmm9ftq4
         9AYQRdBbeOKzg2VMOaxw4iNCTkrADpJAY16VodX/oxhSX1kyXVRpTXSxPAUd5BCPhuJg
         sAH8Ee24NG+6UJyXveWJywzJiyz22ktRBQsD98lLstJ1+yTdVXMZYuXRpHA++lp8mdK1
         TfcziVZqgAtU7Jd57bx46JWaW3FQxYl8LG6ywgiI+EN1jyzQAaaS2GQ4BHFxESFoLElc
         yaQiSwCXP/cqy3qlRAktz3Q+CuOx/uvso2i/HPRkQ8yh/a2auhOegn6U9ENP+FLKOvDQ
         GdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776526480; x=1777131280;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NhKODv+ebTXJdAnj2Ac0AlyQFoZRAIerJIUSEYuuE+s=;
        b=A0wIDMdXSHx8L0dyckS9ett8QFQy67oPSDf73YucSENEjTxAuHFklV/0MerJ4wQJ5G
         hNG9vWhIjzLPOn3W9hxOmAEot9o02S1Bgf77Cv43vIS34pxPl9VUcXxLIawdOtr/iCdh
         6qhXucA6CkOdt9m8DOPjbqq7ASRRLe6tyXo+Zqldzq20+yczEPd4Cv01qIb9TCfGFBwz
         KjnmOOvJ9jWkj8u1soOdJ2E5DuWndfGVIuNXS1CiaVrZPzziXPwQ8oN34JCdwLEyFJyR
         wiZhA2fXmlosDrFL4bCZQUfAYgGIMGbEdFrEIPHoH1BGYB0xH2m5BCDOXburCNxUQA7d
         xuyw==
X-Forwarded-Encrypted: i=1; AFNElJ9aiVr15C/AV/Rmzd5maeWgDJkuYUSToDgce2JCjzCwKXDhJ/XafmjlrBA5r/K14ExYTt6f88BGY/GKEtw7@vger.kernel.org
X-Gm-Message-State: AOJu0YxNh9ZEU1ktlQE1o/Yp3fiF83dYXEDt7YIqdlGpJRNdBr9d/G5r
	Rq+bFK6Fk8YbM1duAvY3FQCeixM2tSoVlfnPEDigRScjA1UdjWbkfzEF
X-Gm-Gg: AeBDiety5t87XeyeDPAgwX+r+wKGUKvWAipnpMJgEZdoV1YLrLCvxfpIzoVClzODJby
	VQupWfumt5ASPlbYoaKnpNFeCzHr1a15BUNYWbezxMTtQR/00+t60Mv6NtPRyls+QMYByZpuMXD
	9PnzJc6/QSsdLopfs2dz0B9hCSkPpVJvFp+wNtypIxDoVr2EzaquIjAhSt6keBnbwvRyZvIpZUO
	fLGPfvpieRWCg+FsJ9npmSxyU4D4JIftad6ahQjoU5b+iV80KhB2jgrMGMhpfEYtf+GKofaBm10
	O6ZG5MCoYf+nJxjXiA0UFd/3xEXW7H1I8vJOuqfaCBKyrfWERtNvmmsF1xS0Ma91+Tljpj5xDsl
	QKyyxFlcJe3VywJw58+hVUN336dWkyQXfqVBOkE1NWOhnZAX36IV8njDnIPkvF1mKEvzOa84BtD
	RwGKe5vQoBvyPrquvo0ZuisHm3aU/RQ8tmOcAw
X-Received: by 2002:a05:690c:e3cb:b0:7b2:9347:7be1 with SMTP id 00721157ae682-7b9ecf86543mr73129417b3.29.1776526480099;
        Sat, 18 Apr 2026 08:34:40 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89aa91sm20380427b3.6.2026.04.18.08.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2026 08:34:39 -0700 (PDT)
Message-ID: <717459db-479a-4a68-84d1-a718c8ba5a54@gmail.com>
Date: Sat, 18 Apr 2026 18:34:33 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/10] arm64: dts: qcom: msm8939: Add venus node
To: Bryan O'Donoghue <bod@kernel.org>,
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
 <KV8KCGTrLcQnaBrdbcO-8yqIObRcqYTBQgEYv3TaeT9dT0e9phTPowW1fza6BV9LfqNc6ZORybdss4WGdvnUTA==@protonmail.internalid>
 <20260416-msm8939-venus-rfc-v1-4-a09fcf2c23df@gmail.com>
 <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <ac54d018-78e2-4f8d-97f5-3cfdb5151aa0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103596-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A992421797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/16/26 5:31 PM, Bryan O'Donoghue wrote:
> On 16/04/2026 14:43, Erikas Bitovtas wrote:
>> +            video-decoder {
>> +                compatible = "venus-decoder";
>> +                clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
>> +                     <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
>> +                clock-names = "core0", "core1";
>> +                power-domains = <&gcc VENUS_CORE0_GDSC>,
>> +                        <&gcc VENUS_CORE1_GDSC>;
> 
> This doesn't make sense.
> 
> You have two cores => assign one to encoder and the other to decoder.
> 

This way during decode only one of the cores gets powered up instead of
both, resulting in power collapse fails.
Core clocks and power domains can be moved into Venus node instead of
sub-nodes, like this:
venus: video-codec@1d00000 {
	compatible = "qcom,msm8939-venus";
	reg = <0x01d00000 0xff000>;
	interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
	clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_AHB_CLK>,
		 <&gcc GCC_VENUS0_AXI_CLK>,
		 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
		 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
	clock-names = "core",
		      "iface",
		      "bus",
		      "core0",
		      "core1";
	power-domains = <&gcc VENUS_GDSC>,
			<&gcc VENUS_C0RE0_GDSC>,
			<&gcc VENUS_CORE1_GDSC>;
	power-domain-names = "venus", "core0", "core1";
};

And then they can be powered up regardless if the session is for
encoding or decoding.
My first question was actually about this - whether these cores should
be powered up only decoding or for encoding as well. Bus configs
downstream signify they are only for decoding:
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/arch/arm/boot/dts/qcom/msm8939-common.dtsi#L1589
https://github.com/msm8916-mainline/linux-downstream/blob/b20608408caff817ec874f325127b07609fbaeb8/Documentation/devicetree/bindings/media/video/msm-vidc.txt#L35
Unfortunately, I couldn't test encoding on my device. It appears to be
broken.

