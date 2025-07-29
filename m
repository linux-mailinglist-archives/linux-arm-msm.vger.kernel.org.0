Return-Path: <linux-arm-msm+bounces-66995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A499EB14D3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 13:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A580A7AD3C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 11:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8AA28F518;
	Tue, 29 Jul 2025 11:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b="Iu6mW30P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.atl.tools (mail.atl.tools [49.12.87.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30FF239E62;
	Tue, 29 Jul 2025 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.87.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753790172; cv=none; b=nkXHTBlU1gikAyMJWAG69ISNOBWz0kVparyFmS1fImi/1G8PJjYFptHYJAKuFGqrmpcsOw+V4o6ZzsnbkRG3dHtKpvdxAWPdu4ir4GMTTnSFFszCJdKcDkDVX8TWbZb6FYi9OkyZISzcBQAuIft/bgIiWOJnXCRzzwdYvFsQ3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753790172; c=relaxed/simple;
	bh=5I8dskIAWO6Qn9h2UFvt3u0In0c8qrDVN4C57QAqN+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gaA9tPOeUhvVrmwrYR11hn+T28CDw8r34rkYx5WuyF57SjMphP+A2YG2HxfDdxNmVx0jbkpE7TsbD2VmGUcJNEkW1nCx4OuHsKfhalewn/GeSn3+lfnyHxFlSFVQNrBoH3Ai5fLkfMYeGx36DBA196woKaXjOysWsyTdUrb7dDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools; spf=pass smtp.mailfrom=atl.tools; dkim=pass (2048-bit key) header.d=atl.tools header.i=@atl.tools header.b=Iu6mW30P; arc=none smtp.client-ip=49.12.87.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atl.tools
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atl.tools
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 128E5299B8;
	Tue, 29 Jul 2025 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atl.tools; s=dkim;
	t=1753789571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m1S8mDT7uN0ZA9A1JPkt54nsJiQufYiFmXjtDUqFtLA=;
	b=Iu6mW30P9u3mi6UEkXPS2LSQIVlgDDRzPCkLrYLrZHlhpkpBOAzPqMcJX4NDe64uqwA1nX
	mwcx0+kriZItTykAYIy2V/B/vT4g27JUCIK78VR67BHL4NisLBAmh+5m/6LQCwEtekzICg
	+ja89Opr7S7aalig8fGD3okyOjM1SoLczC416OkiaULqtAZhHqcOmCWo18YZTk7c6NcPWA
	h40NcGssk6rIRTNTq8a+IZCANejSeB7XZ+V30UeQBD9Yby98ESBk8lV7D1F46Ihi9mmNl8
	4F7lV08Pf9ujWndH2i/qFuvohbyNPwzMnCm6MO5yVvsCGdJkAhVZ2TI9IHyWYw==
Message-ID: <9d13d012-8b10-4094-bea0-b85e799ff0c5@atl.tools>
Date: Tue, 29 Jul 2025 11:46:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: add initial support for Samsung
 Galaxy S22
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250716231710.99983-1-violet@atl.tools>
 <20250716231710.99983-3-violet@atl.tools>
 <1ca25402-8f57-468c-b4d5-7b52f526ab28@oss.qualcomm.com>
Content-Language: en-US
From: Violet <violet@atl.tools>
In-Reply-To: <1ca25402-8f57-468c-b4d5-7b52f526ab28@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/17/25 20:19, Konrad Dybcio wrote:

> On 7/17/25 1:17 AM, Violet wrote:
>> Add new device support for the Samsung Galaxy S22 (SM-S901E) phone
>>
>> What works:
>> - SimpleFB
>> - USB
>>
>> Signed-off-by: Violet <violet@atl.tools>
>> ---
> [...]
>
>> +&tlmm {
>> +	gpio-reserved-ranges = <36 4>, <50 1>;
> Do you know what these are connected to?
>
> We tend to document it, see e.g. x1-crd.dtsi
>
>> +};
>> +
>> +&usb_1 {
>> +	/* USB 2.0 only */
>> +	qcom,select-utmi-as-pipe-clk;
> Is that a hardware limitation? I thought these phones had the necessary
> pins connected (for DeX)..
>
>> +	status = "okay";
> A newline before 'status' is good practice, file-wide
>
> Konrad

Thank you, I'll fix these issues on the next patchset. Indeed it is not a

hardware limitation, I just kept it USB 2.0 for now to avoid any

potential issues with 3.0.


