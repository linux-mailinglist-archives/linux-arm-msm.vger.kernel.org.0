Return-Path: <linux-arm-msm+bounces-87118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2534CEC1F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 15:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DA93300DCB4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 14:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989B31E1A3D;
	Wed, 31 Dec 2025 14:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CDThrQwk";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="THMVB/VT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618562BD11;
	Wed, 31 Dec 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767192626; cv=none; b=BlRWzcUnrIfV2rMQI4B/isyWPxGvsn6ikmCCbyOg1XW+6rr/VL6+M+Oud9KSj8Boj2DHxXFVPDH2BUDvZ8lbp6SfVBwPZy24CZybSGdGfcEz3OCzpVNl6amAXbJtesgM+UznqfSnvWqMHzqsadS4o5W9ubhbbnQf4BrYRwI3lnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767192626; c=relaxed/simple;
	bh=zLKowv1tnpfQY+IZcks1H6VbNm0706LX1BKfLq+Nseo=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pe9oL+tCJkHIZig3O9ePX++SRB+jv9oIzIjBCJnRtx76tBlhfX6iH+7jKhiuAzGM8OHWkQHvIxrMjCO/n/Uaf273BVGETbqP34P1ekXcMdcmOOaCXJU/uSABwE83XRCgGOJyc1VvjlDULq53RcLHoBPUWemXsZx0S5cUGcYww9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CDThrQwk; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=THMVB/VT; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767192613; bh=Wnek6org21mAx+Fsck5FhQB
	7SG91dB7R4ICYogw7qvc=; b=CDThrQwkbksfLAv43xBbTpnv3ScnDpFYjHn8oX45sRrWE6QSmg
	qXzlbNk5Dj4+SgnFoD90dYLcwjyn7JkMAOIxU++OAZ1BNowoPpZ9AIVhVizg15IpaQWmKqi/bVL
	FILWGqYRNjXE7uuDktDAsBqZ9Ksr4lhKVYrwps3R5FCn+OPDT+VCDmtolhXBfAV43tmFKh0QH+y
	VwfRgiZEv1TkGGMT0kc+eUv4bCkOvfDMmDRMKRQm23FaW1faF5vsQu1bSZxnLrUWAExi5Wn4j2m
	L4BURDkxLrAmahjDIDVr9quJ01ibOkSS86ZhbuKUJyEZVFGkwTPNZpxiH/ggGHAwaJw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1767192613; bh=Wnek6org21mAx+Fsck5FhQB
	7SG91dB7R4ICYogw7qvc=; b=THMVB/VTItT6h7vdJrMNbUqABhTv4NklLL6CJh9DDAJXUkBHLz
	ApUtWDd/bBdl1KUhphvUONtrZVMl/cDVIpBQ==;
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 31 Dec 2025 15:50:13 +0100
From: barnabas.czeman@mainlining.org
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephan
 Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/9] remoteproc: qcom_q6v5_mss: Add MDM9607
In-Reply-To: <e4e94f2c-98f3-414f-bad4-d23f7cce8047@oss.qualcomm.com>
References: <20251231-mss-v2-0-ae5eafd835c4@mainlining.org>
 <20251231-mss-v2-3-ae5eafd835c4@mainlining.org>
 <e4e94f2c-98f3-414f-bad4-d23f7cce8047@oss.qualcomm.com>
Message-ID: <12650361d3a0e0444e9e10e26c5d5597@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-12-31 13:27, Konrad Dybcio wrote:
> On 12/31/25 3:29 AM, Barnabás Czémán wrote:
>> From: Stephan Gerhold <stephan@gerhold.net>
>> 
>> Add support for MDM9607 MSS it have different ACC settings
>> and it needs mitigation for inrush current issue.
>> 
>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>> [Reword the commit, add has_ext_bhs_reg]
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
> 
> [...]
> 
>>  			val = readl(qproc->reg_base + mem_pwr_ctl);
>> -			for (; i >= 0; i--) {
>> +			for (; i >= reverse; i--) {
>>  				val |= BIT(i);
>>  				writel(val, qproc->reg_base + mem_pwr_ctl);
>>  				/*
>> @@ -833,6 +847,12 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>  				val |= readl(qproc->reg_base + mem_pwr_ctl);
>>  				udelay(1);
>>  			}
>> +			for (i = 0; i < reverse; i++) {
>> +				val |= BIT(i);
>> +				writel(val, qproc->reg_base + mem_pwr_ctl);
>> +				val |= readl(qproc->reg_base + mem_pwr_ctl);
> 
> Downstream doesn't do val |= readl() in the inrush-current-mitigation
> case
I have checked you are right, thanks. 1_8 reset sequence have it but 
1_8_inrush_current have not.
As i understanding from downstream it should be handled in both for 
loop, i could add an if for
handle this or implement 1_8_inrush_current reset separately. Which one 
would be the preferred?
> 
> Konrad

