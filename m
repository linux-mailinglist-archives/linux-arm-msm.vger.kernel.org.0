Return-Path: <linux-arm-msm+bounces-83910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FCC95775
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 01:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 623554E02D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 00:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA523A1C9;
	Mon,  1 Dec 2025 00:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMAyTRDk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12DC2A1AA
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 00:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764549860; cv=none; b=BB/Vg6i1k3omwHu9leI3BcGDiEVeNa2onQZX19zjEOGMD+bdIOkA6OmSF5o685KKEkLZEGge+mwpKILuOl93h6NAePHWDuJPf/65hIS2YElzjCqmPJ9Z/oSfZvvFD5Sna9V20+l8Rqbp42AnK/A+CUdissQowaO/LTasmOLhanc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764549860; c=relaxed/simple;
	bh=WXei8faNKFRbZg/5TRBpJIVvZ5EV4z9whv3No2ypEdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQXpblebqQqk67x68FmrzgcNCe2z9vKmWBr2l9kjW5CZIgE7DzsgQA/fYF6jY7iw8cE4Jz6GYzhBzOZ6fY4zqZsrjbiImnh09FRH6cFAXJLV5iFsTXJBWmA1WqGQWrrj1nABnL466W8XD2zSpK2XZqz8cG8iQz+oz7oVbEEdnVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMAyTRDk; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2735869b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 16:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764549858; x=1765154658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=loQBrjsHTLWumic5XUfpbVeTUpVIR2+yqTrDotKERHY=;
        b=VMAyTRDkTdDDHtdDk4RvIQACnLWow6xl7MH2H36dKK8KcRjs26CRPye1lumSZgwL6I
         VTGz6RF0+FwxHBWWnMyBZKWSunE8wq9En8b9ot93uu9/STnPO6UwczSJRctdtAXTX9vL
         F8dWH8TkVQaWcnzBr1YeTYFeH8VECBVKZv1Hm129yd51Xep35Fm1zBzqnfWrEJ0G6dIe
         PGvs8ZECyoOFielqaC/LHyxhfDz4taMfYHaBCqf2/lNBCom6jLSiT1Zv3QJxaIlRJ57O
         V/0kqyo+zZBI9VK6axYWmMW4w2YYQJaIh14U8RcTcINsxYJl2imec5EAAn0TTocBbcqE
         +H9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764549858; x=1765154658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loQBrjsHTLWumic5XUfpbVeTUpVIR2+yqTrDotKERHY=;
        b=tZsDjy55YCcJKkTU5BATW7i1QPfiwPxR+vKbK7nSX2DFU013bwJ89QyXGYeAk22egh
         z8soh3BrP9kIeNR38l7FTu9wwrdmnTeMkOrZZ5mYoRl7LmwZkdWiH0Y1t3xv4sGVeFQ2
         gslvRZD1uKB2brc2s40mxpJalM7X0/c61Wg6a0GTfjJPK3poZy38ZZxd2O5z7X44oJlT
         TjadpJkzIHbYKmaivfTqVpr76JuqtvuTi5QO0lUoV1GufqRHvA0u1DWMtOwmMs57OrqA
         MUjM+ucY84f/4VEBKj3EdaklDzQ3OPEgIXntwnlw6HZTyquhUvHNOTcWSAls764R3SMd
         kzGw==
X-Forwarded-Encrypted: i=1; AJvYcCX/L4bshXNZQG+1V+/NX82HsTcRJPbBZEi6dh41oRWiPAqm90fUskeawsnsVxuMzPtlCSd1W3V7BfrXjiHE@vger.kernel.org
X-Gm-Message-State: AOJu0YxhyzIjHaSlxu0C3r3zO3gRjRsgAoQ+A5mSGR4h4mbUbGCaEV5P
	PgsUdb/u80o3ytCdo2g32HObUbW4wiYScYz2iTpRAxWZ2OyJDitTEpFd
X-Gm-Gg: ASbGncsM9zNsvrIaUfem7mFlKUvMZkjyLNQAFkK8afmPrZVLMTJ0HEn+S0JovpjxfvH
	qPCjZpd1I3B3z+i++ouNpY3U/0XaL2AN1411sOvtmRjHO2LeC4iLp9gqPmwWtER0SLILyODgZEo
	jujlEfOSYFZTPmVyJgvviRKPp60JP0f9QOwZRKisrI/BqPBW9zcEBSyyA1BH1CsjdsoqHJH6lKv
	oFHRimcEmqbu6fj7UWbsEd9NfIDMoARJDwQfHSIpXzWRn3uhrl1hdyFpQYyjFTeaSEAdsXQCuGv
	k0lI433QRnfIS5x2Fp2AgJ6dSWxHzuNPAv35Ex3W/mSqBiUYK/yFGcd2qlFaTr/e06leZRp8Kgl
	rU6E3L8g52KpMPX01sblOg4kWRoQMRzGk9zXEBVy9mp9m6CUdFk6UJSO8PAjftQlHvbLov8TtBf
	E/GGQJQbdykA8JuLkRNXkIpYEzvHiIW70mWn/QOQ2XuA32GYg4+ZY1EVOnL3ffkK2r
X-Google-Smtp-Source: AGHT+IFgJVWGW8YwKUU9Iny4M1dxzau1tG3wPCluSngGPGy5qUbx1lrl2uJNSMdXKWMj7Ocp4T1S4A==
X-Received: by 2002:a05:7022:20f:b0:11b:c2fd:3960 with SMTP id a92af1059eb24-11c9d85ff19mr19455932c88.28.1764549857774;
        Sun, 30 Nov 2025 16:44:17 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb03c232sm51936663c88.6.2025.11.30.16.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 16:44:17 -0800 (PST)
Message-ID: <ff66f890-b405-4a81-9d8d-7d94fee68680@gmail.com>
Date: Sun, 30 Nov 2025 16:44:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] iio: accel: Prevent NULL pointer dereference in
 interrupt setup
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20251124-expressatt_nfc_accel_magn_light-v4-0-9c5686ad67e2@gmail.com>
 <20251124-expressatt_nfc_accel_magn_light-v4-5-9c5686ad67e2@gmail.com>
 <d3318386-2646-4f1c-ab4b-6ae3bc71e9bb@oss.qualcomm.com>
 <aSWPnRBRdPS8vnir@smile.fi.intel.com>
 <61e860e7-fc3b-49ad-bf6a-9745f205d52b@gmail.com>
 <c627fc05-6980-44bd-bdde-4750b3bafe2d@oss.qualcomm.com>
 <aSieijZt117wOh-6@smile.fi.intel.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <aSieijZt117wOh-6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,


Seems like Linus Walleij encountered this as well, and the fix seems to 
have landed upstream:

https://lore.kernel.org/all/20251103-fix-bmc150-v2-1-0811592259df@linaro.org/


This patch no longer applies.


Thanks,

Rudraksha


