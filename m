Return-Path: <linux-arm-msm+bounces-60846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FAAD4003
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 19:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DEEC175B80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 17:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB62A243371;
	Tue, 10 Jun 2025 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="I0Xs/87x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A61242D97;
	Tue, 10 Jun 2025 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575114; cv=none; b=Xuz23TFF+8R/Uky8rZMXtkHxSvdht0RtIa4Nxp9CH+TXCYq7kIs9Aowyvv0MDpwhX0o7M9Osr96YRF55HzI1ZHvuKy1nHfsW99Gk3lpeSHF7QG8KXKGg0mwJFg3+CUaAikrbpnDYOAAZDMepv0zV4hJ+irYHE4IJtln5NLHNxDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575114; c=relaxed/simple;
	bh=PzeAzduunYZau5o/6CmFk/6Cqsgz/Cuzms58X9YsVig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dqd3pRa/LHBKMSdVMaM2RerpbrJeyOObivKt3K21ON75RcX3MRUn36VKo3iS8oUJ+FYTqU8W9VMVzLzNA1W3TnMKXodyhw+/ExXh6mBwt1nx+SjoT3KjiB5lK+s0uJ61W6d90PAflrQdNKrAt4dvQRG5CUc20ToIfz2QlfouuuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=I0Xs/87x; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749575111; bh=PzeAzduunYZau5o/6CmFk/6Cqsgz/Cuzms58X9YsVig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I0Xs/87xVuuPN9B5QIwPjx+/ESoBx4wnxwFFHw5puHX6aT9mSeG0nTVHFHHBSQruG
	 QkFe9PdO8ghZa/cpK3uE8N/8+Ct/CEuP1dOqqGejo3uHVO16XWHDIqOrKEBxlWCqsn
	 dyBK+JDddpBHDf2HKMetWpqJW0whZ7FNQpldiRAE=
Message-ID: <97a76eee-1c06-49bc-a572-809c6e8de4aa@lucaweiss.eu>
Date: Tue, 10 Jun 2025 19:05:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] Add support for Sony Xperia Z Ultra (togari)
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <8c0c0740-3f75-47dd-8f11-c03fbf8b1583@oss.qualcomm.com>
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <8c0c0740-3f75-47dd-8f11-c03fbf8b1583@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-04-2025 1:55 a.m., Konrad Dybcio wrote:
> On 4/19/25 11:00 AM, Luca Weiss wrote:
>> Do some tweaks to the common file for the devices in the 'rhine' family
>> of Sony devices, and add a dts for togari.
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
> 
> I don't really know for sure, but maybe this driver could be suitable
> for its touchscreen
> 
> drivers/input/touchscreen/atmel_mxt_ts.c

I don't have this device myself, but maybe Kevin plans on continuing 
work on this device. Thanks!

Regards
Luca

> 
> Konrad


