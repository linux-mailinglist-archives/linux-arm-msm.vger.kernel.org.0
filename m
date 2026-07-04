Return-Path: <linux-arm-msm+bounces-116489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /KqxBsTKSGqAtwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 10:56:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CEF707280
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 10:56:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RIgLsoGT;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116489-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116489-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C2C83014BEB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 08:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAD953A1A3F;
	Sat,  4 Jul 2026 08:56:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DAB3A0EB8
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 08:56:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783155393; cv=none; b=PUjfw5I+mnvY/FUlolWtYHHF+bGcxNDlNYki9/oOcJ+2XDCuyF8PxMRYAR37hM/kJIV75qP3+JnzKpeArpsNmH+/oXNZCTIV3Eu/5QrQVaMjTcDVVS0XSySHUop7ezZbh9zVBARblT2dHuCgDfEoFsXXOxcQHzIT11iFt3zI20U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783155393; c=relaxed/simple;
	bh=rw7/9OzqfRsTbCam+3oyxvlooacrsew7P34zffYaA1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OF5pDHw29ECLVElZl7VvriPLWQl+GEXWlJQzKkOCP62qjHGl85SuFxgDj89fbOUmOXRD3qcXDVwLdPVMf0V1Q6Nr3lGgSBUTyfh/XwwxPFO1/xSn2onmSmHgX1zFNsXEhgnTORMO43SwmeJrOrYl3O3/0dE2c15u+iCk8KC/akQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIgLsoGT; arc=none smtp.client-ip=74.125.224.45
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66657275684so469012d50.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783155391; x=1783760191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qu6q77m7w9BayCGazNEgunJD/MBAGV9RI5qqhQj4Q+8=;
        b=RIgLsoGTsK11TvKbesAz617bZ99ittPVQN6SeCwaf2+1TIc8ccGnTllRrrxYmIhwIq
         Ppzk4J8LnRfTN4hmUeDY1WhV2H027iraQRs3cOyM8kg6XKUcd9JaWo6KAD5o9GPQgB55
         NB65r3gDQ0kE4uOQqqWFCvm12cZPbNQkbsmPzXDNDvol3Z7rrMM6u9HpE1zsjkBPl/BT
         /SbkFuda1ZBqH95LLfXbRI1ecU53G/rq9Oeq/jvDfvFQcHFYtv4Wnhxefsl6h1C7iLLE
         4pbVq7SRSNKXRlA88snhqciUqkERwYmELb7laV/W0qBnaKE9E9z8WwMTTkZJN+tZJuBX
         ltBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783155391; x=1783760191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qu6q77m7w9BayCGazNEgunJD/MBAGV9RI5qqhQj4Q+8=;
        b=NzCzvniYcprQ4dS1/UeBT8LY+1xkuaOyIUw/AgL2GhqJSdvwSvX/EbhgbzQ9ZKFOvf
         lJVvwEKjzcrzNnH2PKd0yVvmG9rWJo/s4j0AXTsfJrXhSaaUh8jOcO9lujapCTcUU4pn
         sWXFGk7LKDRbPy5TRJ5B38wdyPH8tLryCLtLiNch/LjnGrr3TWbuavTV7dh1wfu+OPRm
         NLXfbNxFCRXIfS8wKG870z/S+Z5DOYZRO8SoPLOwyd+QK5cfhY64CkQvVv2zL6MCNRy9
         ChMbXpdNwC/pp0Ks2rZDEGgxjuCV1narrAbv+2kPa247hAL2VIIcC/0snuVcAD9eN01X
         8mMw==
X-Gm-Message-State: AOJu0YzBDNy3ssTlgyw5zf/R4iqAbxe6ho/cnuO+pwRfIoymERrUdxry
	ZpR2UdBBtS+mxKnyO4AlYDGw0owYQaT2NGdU8hj0bWQB9GvNsskm90EV
X-Gm-Gg: AfdE7cn1DbSHi8q55Wag7kG/QnNFEKWDJ5Bs2Sw1eH+Vyp05vPqH6YCVQFdoHEmamtH
	giK8UrK/suE0Odr0Fuw0MYl442hJA4mMSc+8wuZ1vbMNVEkjnuRVUZ+RQoAx7eypheDvmctv5gq
	lb+T9FDJZuZdbQ6viYQ2E3xWBHUkyWtqy0+78tmJo+dcxNywOjUBYlhgRKs8ohHFOLvHYRgp4At
	Q2vOWjDLPe4/mYMqJ2YxnxRFCx25zyd46n0K2frCfQjG4vNfMge/abqD5fw3v/aJpiGmqDjj54H
	1Acbx1JclfhONgadco8//cubBDeSw5Q3uUonyDj6hEapW9l2AiwFmNOvq5heEc6ukAPF2422sTk
	QRx8fs8zYba0xem8DlA3y7kzWc/kjsgFVb1WpS89jWtmpKrIYdersX5hUZ9QQ46kUOmOwc3XiYE
	2akQalfjWbf1E4A68=
X-Received: by 2002:a05:690e:484f:b0:664:e430:cb76 with SMTP id 956f58d0204a3-6665306b95emr1287023d50.59.1783155391641;
        Sat, 04 Jul 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144840568esm33528307b3.17.2026.07.04.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 01:56:30 -0700 (PDT)
Message-ID: <569ca937-205b-42e6-9842-a51a9de16b26@gmail.com>
Date: Sat, 4 Jul 2026 11:55:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Hansson <newbyte@postmarketos.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-3-3e5f752048c1@gmail.com>
 <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <c55742bb-b25d-4ac4-a3ca-4782edacd5d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-116489-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:newbyte@postmarketos.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68CEF707280

>> +&usb_1_dwc3 {
>> +	dr_mode = "peripheral";
>> +	maximum-speed = "high-speed";
> 
> Does super-speed not work (if you also remove the qcom,select... above)?
> 
> Konrad

I can make a file transfer over scp, but the speed is inconsistent and
slower than with high-speed. Must be because this device does not
support USB 3.0 (super-speed).

