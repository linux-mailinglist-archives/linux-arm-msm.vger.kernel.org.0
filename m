Return-Path: <linux-arm-msm+bounces-107050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDobKOveAmoMyQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:03:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1777E51C5DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C976B302CD3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE74448B36E;
	Tue, 12 May 2026 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZWixS0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6504D481FC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778573019; cv=none; b=GFzG0fDma7uCjXWamSGA9rujBA02s473KExivrbE1l7e/eYD+GGDAutqiJIRXx1TgFFM0q5wVMYFVxHrO6XqGVTSzhFp4jQNSrQBI2bOvYSt/P9dPv9udTY9J+1iu6eM7YRJZ5wR5PDxsXnsS/Wj6Y7BQPm81SCOAFKkTdol+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778573019; c=relaxed/simple;
	bh=B49OARLB+JlsuiyiETK1O/s14mcjYAfXYTSjrpllbVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8OeFna7HZD+Fu/wDqK5sIUfHzrmR/WLcJU8FnYWkIwUAxGmyvH9cnyxpHSq6n1hvBTx8CnZtXb8GS2pzkyiFHlpKbAxLHQG5LMHX7M9XX+RfmkGK8WzXPVHQEpL8PAZUi+MTPAXDvWK0H2v2djRqPGS+Qr20oEqzvj+KOC3yJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZWixS0C; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-479f7e75a6bso2053838b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778573015; x=1779177815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hCt0KRjnxqzTDs+DhOS1UL4hmaB0RG4z+osI8Bk9y84=;
        b=bZWixS0CmQDuhv/be/dk1rsaL9z5QZGkHfdoI39bWG00Xrxo2kmOhgT37EQM5CjcNx
         ZIG6ybKtALI72r2Vzfj6FgNoHcSlYNBQQg5P3YEgFSPo4m1uCUbn/LEZEQYPstEnE8vT
         lPos1GBgMXosKd1KO9jo1MqjJ/6QSptbfgii1A+giHpEzM27ohFoAv98AGIySoV87Bzs
         ETEq0zDSv3OKjYiuFLG6YOucW9aXAAuwMmnZqO5tVY2G+giGvbJT2vCQNOEU0lhEsSY+
         xGPwe5RUdZZ+H6fsRWPlKxPLhub7z1BSJ5277lqOhsZQjMv0nB93gVvG2sxDCUyl9rHN
         bvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778573015; x=1779177815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCt0KRjnxqzTDs+DhOS1UL4hmaB0RG4z+osI8Bk9y84=;
        b=q0oeWtniMe+IhY5qb2HaolNxJ0v/vSxOOuGQVvzBVW+uhyawmGOhTvoF14Vt13PDVT
         3NQAdrT0tHD6kPk6xw7tPNUI6V3oWEBVJ+MpGnbzUEvHZmte917Rc2GAU0SaotBuGghO
         Xy31pdo+InHZ9TCahEgPfG1+nyPagf9vLlFpqugub1BpSIIuorjJ7O45uzvYwvQeTXFl
         f3kiy/WhlDx7Es7TChrpA1xuovDM+PoSwQbtcxMZeJP9ZfPoVSx1bhlwMst6+D4S6+Og
         Yd8Id3MhHRzqXskgUw/kZsgCQReWW5pA06p+3/plRLR6axykSR+PIPubpCM6HUic5fsZ
         kp1A==
X-Gm-Message-State: AOJu0YwLKZ3QkWF8Oqn20oDZLvUg2Ci9E2O+4iQUfvHWmEpLtEZiNaiQ
	6+nd4Z3Jeip5C38s99gJQHW7oeKrGju/xtuoqgelzuLlB2IqUQdgvy5sgXg/8WLB
X-Gm-Gg: Acq92OHZ5xiB199Dl9n8fEg4hfEjNB4rinZh9hn4xw8AOQ+UX0llkujoIyNvwJe/p0x
	dVvblVk3b+PgFsBc2d8JcvwhLPDliFapXBQvA5Ng4Q44cuzN19RveqzOP9Ic/RIW53NSVqBw5dP
	Ys687MsAvorGdeJ1jbWhMu/DZO0Tp0XMsWLEiwiFSZO1e6GEKvT7d+TSZmGwlUkNdAtQaABn8l6
	lrtT+FkCyonePxplH7ccFlpBaK7bXye1QGtiubppl/HGkedcJQP5YLUnnlrSS6QeAWYO0ooM6qt
	g2Wfspof/ewzjrTG751Gz9jF3HRjP/0qRQHqRzK19JiewnXSJqhV50D6tR46QBxw74Q8QxMeqiG
	OKRNrU9KUnolam/+Thin09SByacBkPCJqFPlo1H20dojFEtOQpZd16dizKMeJ5Ivw6/2kAEg1if
	rdQJ1h0NB+oO46+AjG4LItVFQMGds4ltM/EBqvW49JAEeS+a9RrhmYSBC5dA==
X-Received: by 2002:a05:6808:17a8:b0:479:ed26:fbca with SMTP id 5614622812f47-4824aaa3408mr7195696b6e.37.1778573014959;
        Tue, 12 May 2026 01:03:34 -0700 (PDT)
Received: from [192.168.1.31] (71-212-98-95.ftth.glasoperator.nl. [95.98.212.71])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76986404sm21762203b6e.15.2026.05.12.01.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:03:34 -0700 (PDT)
Message-ID: <a86d32be-1c02-46a7-9b29-a53d680b9e4c@gmail.com>
Date: Tue, 12 May 2026 10:03:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, val@packett.cool
References: <20260417084749.253242-1-zstaseg@gmail.com>
 <20260417084749.253242-3-zstaseg@gmail.com>
 <73cd6f96-07ea-46c3-8f6f-1cc8086a28fe@oss.qualcomm.com>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <73cd6f96-07ea-46c3-8f6f-1cc8086a28fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1777E51C5DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107050-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 4/24/26 1:47 PM, Konrad Dybcio wrote:
> On 4/17/26 10:47 AM, Stanislav Zaikin wrote:
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
> 
> [...]
> 
>> +	hst_bt_en: hst-bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		output-low;
> 
> You shouldn't need this property, since the driver will control the
> pin

Thanks, will fix in v6.

Best regards,
Stanislav

