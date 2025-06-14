Return-Path: <linux-arm-msm+bounces-61316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E41AD9FD0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 23:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D5571893B95
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED7A1F8BD6;
	Sat, 14 Jun 2025 21:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="PYpHPuW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from skyblue.cherry.relay.mailchannels.net (skyblue.cherry.relay.mailchannels.net [23.83.223.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCBB1DF754;
	Sat, 14 Jun 2025 21:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749935085; cv=pass; b=LE8w7cHuUzZ84DGpMKf8rZRLB+sI52BOZwMIwQm82S1nxYASaDM6GGvJ+vTWldaevI1bteTj9nPyKQCh1+mSgwkfRxuF8/bg3k0ZJbkqlE+ipL/kKsrZ7nwaY9IHl0Kx2rqYKOjawQY9eG3pprhAwHYKPy7AlTZ8EdCFOCjM2jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749935085; c=relaxed/simple;
	bh=aUUaE4NhMLfYjb5tlu3Ha6V9SwZlsMYGAgxjipHxw4I=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=EteY6xWBxQmsdimNW511OSIyzswRlmoVdY0VeabLuL/G8NCHJRREC8wtZWshuRSkh/e02XdduzMsWPMW5qrwwYcJYVF3mLhHh4+qALTk7Kjgy4hWC/nO8ytQ34moOkT/Vv6QWs6wsdASZU+f4EUWVBAT+16G69TZhQr6MtWPD8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=PYpHPuW+; arc=pass smtp.client-ip=23.83.223.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 24E638282C;
	Sat, 14 Jun 2025 20:46:49 +0000 (UTC)
Received: from nl-srv-smtpout9.hostinger.io (100-122-111-239.trex-nlb.outbound.svc.cluster.local [100.122.111.239])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7B43982738;
	Sat, 14 Jun 2025 20:46:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749934008; a=rsa-sha256;
	cv=none;
	b=Huqvw8ESWMB2oV0X2shpXR8AkhjB+YXFWFGRik0klXZio/pc9Bt3wz6fJtva+/Q/ivqlff
	nRClhpzZgxracJDDXhlOXic+BPc5uGATyURwGN4S4+XXZNaTt2XcVjXPw/2VcNaSk7nUXz
	5tX/1RiOKiKOlPuWEzADxmXFl258BHng+AzKDbW0DHCurB5TByL2ryQeSN7rki6vUIsfzz
	TSMZ1sqjErx+wt0iJ7kdFMenYcJkLFxcrn8ImRqNen6IOLGvhMHEHvrChOieQR6krugBDl
	HiRmfiex5cvIaAtcocNmpP2pdU55QSRn0d7w1ch4jslBsAo9binNwcw6yEOI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749934008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=nc9RQbA6Qr/3xcPmMSkDvEjfC4L5GrtayuofOPkowxk=;
	b=enkplhHldFoJZftwfAjNd0f8Ralw9Ft47qRPuZQ2zasLit/EDF+2IZBCpbyjb0jxpqs5wX
	H/xGdThc6i4hKQTka1o61pO5Cso9/BmTUHAV8YsJqZe934U8BUGNRMjSM6lkNj0bGEG3sI
	lHABvWFYla0Pji9gyokn2wjO+vGeFWOOP8FjjBG+rkGdw5MhXo00oCUglSBcg5JT12Nac6
	D30drPjKrduD6RWqxnP3KiUfoLI9h9CNK6NIXVJU+xFMlsXhSIKtgBI0sVrzQJOu81k1Vz
	duRQ3bwHWZN9Zb/oXPBtN5V/hteBA//1o7MJRiVphiVv7/z1bsLFym1wUG8UGQ==
ARC-Authentication-Results: i=1;
	rspamd-6c978647c4-jdf4g;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Troubled-Language: 2c94c34f46bc3083_1749934008892_1470621371
X-MC-Loop-Signature: 1749934008892:2968209260
X-MC-Ingress-Time: 1749934008892
Received: from nl-srv-smtpout9.hostinger.io (nl-srv-smtpout9.hostinger.io
 [45.87.82.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.111.239 (trex/7.0.3);
	Sat, 14 Jun 2025 20:46:48 +0000
Received: from [IPV6:2001:448a:c020:61e:a05e:28b:9589:bb9c] (unknown [IPv6:2001:448a:c020:61e:a05e:28b:9589:bb9c])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bKSwy1JtvzGY3Xw;
	Sat, 14 Jun 2025 20:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749934004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nc9RQbA6Qr/3xcPmMSkDvEjfC4L5GrtayuofOPkowxk=;
	b=PYpHPuW+9Sy74tyWQZMtgmwyvh/06ORmI6hY7bqGM85zVMQMsPh0zSH3IrM27BcdQTCrp5
	cHxSvMzjrUsSquNoRamoif8Rh28HqwA1hoNtbPsaecLcrWvwd/NJ/7grLtENywaRNZUkGN
	BRKg5KQDi4Zte5WLz2fKJ/4/ZHIBRVJjVhCrAZSAgRG0PJSoqr7VifAJlKLR+12T+ry80w
	9GLgGSd9VCL0FnOaseJvkmYkh7o79qRMGpCHjh17Gqs/c3gnMSzxLssp/n5A4dB7aJ+VVO
	JeeemOwsjWxfM1lJ6H9C7YhKIYr/7TgewjaAZXYDmdFM6aNI3DBz2H+fI9PJGA==
Message-ID: <39a7153e-1a4f-4dfc-a190-3b3370646d47@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
 Rudraksha Gupta <guptarud@gmail.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
 <20250614-msm8960-sdcard-v1-5-ccce629428b6@smankusors.com>
 <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
Content-Language: en-US
From: Antony Kurniawan Soemardi <linux@smankusors.com>
In-Reply-To: <f1284637-7650-498a-b850-b5140c47e4e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 14 Jun 2025 20:46:41 +0000 (UTC)
X-CM-Envelope: MS4xfDeE0ELiuEu2M8UaCSNvCRotIlBz44mVrMfLIJV/xzL0WhtmdRREte1mo3Sx7wRF4/zI0iHcPkkpO9tX6JixlapXBSXzHNUPbITVtradTeFiXMKSH0MO 26G4+5tnqqUA3srLGWYPz6+A6zSu3D+rwQvKw94kw6XSEMuUC0ksxrsPrAVV3jquYs+d8XlOaH0CzxHXlFn3fQmn2HwZOg234qTeoHfpXtujfes7ZRSn4B7l +IMtpG8xj6bKIfCx07JfFw6MhgCmilP95Tn8zSRJhlsjE5gSHWD0Dk9SPXjbYfF2+xPHQDn8z0NgjAyH4yHwxViy1h40bLJabYJgtrYgwR3BULL28BClfl9k WE+895I6z/QgHBMDwEXKSTwdOv2p9WHn2kkE+Ms3O+q6nVTBBjJAjQEFIgrVCVXAFpl6Vq99H8mLKcannboLucYngMd8K13oRJQIiBeF1MXkhSnPD14TiCr3 tPohPvRoJ2nB0T7az0zymyjlY6UH/XhmmN0wxq2z5WVahKh8DdNbmqWofx/OEdvO2FhtYKS9PAPPr9+WdK0xGziMxE1MLA4D5Zmxbvpl/mNC0GjcSaXjBbxh HEcbHILtnxhtxB7u92/QZo2utpFUwzLIVFrAcTy05P5Mga9JK6zZa6UttfhzWqwUbdw=
X-CM-Analysis: v=2.4 cv=MNgym9Zl c=1 sm=1 tr=0 ts=684ddfb4 a=9ilccl3s0Xgo97xrQrTJyQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Gbw9aFdXAAAA:8 a=K4FVrWBemn9qIp-mdykA:9 a=QEXdDO2ut3YA:10 a=9vIz8raoGPyDa4jBFAYH:22
X-AuthUser: linux@smankusors.com

On 6/15/2025 1:36 AM, Konrad Dybcio wrote:
> IIUC (and that's a 10yo range memory), SP had some eyebrow-rising boot
> flow (some partitions were non-standard?) - could you please add a
> paragraph about it in the commit message if that's the case, and maybe
> include a short how-to on booting the thing?
Is it acceptable to provide the pmOS wiki link in the commit message 
instead?
https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)

Or should I include a paragraph explaining it? It might be lengthy since
I'd need to add download links for the mkelf and the RPM blob.

But in a nutshell, concatenate the kernel with the DTB, create a SonyELF
boot image, and then boot it.

> As for the code.. I don't really have comments other than please
> keep a \n before 'status', other things seem rather in order.. If
> the dt checker doesn't complain, I don't see any logical wrongs
>
> Konrad
Thanks for the review. Going to sent the second version later.

As for the other things... well in my opinion it's not kinda in order,
especially the nodes ordering at qcom-msm8960.dtsi. Welp that might be
a separate patch I think...


Thanks,
Antony K. S.

