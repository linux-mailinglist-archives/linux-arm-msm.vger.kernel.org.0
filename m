Return-Path: <linux-arm-msm+bounces-88733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA607D17C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8893A30C5CBE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C8B341AB1;
	Tue, 13 Jan 2026 09:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="E484a46S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AAF1EB5FD;
	Tue, 13 Jan 2026 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768297063; cv=none; b=qUH+yFrvAo/KYhObhh4P+pdDRjt3p+v9x6glufoKW07cCEJgSmnuB46jx9qYH4/ysB7bbv1GzJ2GpkEJ+01Q/DLC/5DUGF8IkJC7Qrc4gaQVWdYAmW+bENuAsbebGuQsD5GFGpqnkZg/SS2dbJJ73Zsye9j07LyXVyNLt4nC1Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768297063; c=relaxed/simple;
	bh=olNAMn+G4iuCUvoLcnEj1L1oYP+Daz/mSqmRGxS5qtM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=QvwdcCJEsBgqYLEuf5l75kfIpDPiAVq60v10CtElR3jZlXbBZDjCQgZuJMaxC8TEFDgX3iWgbw8Ft0LVEMbdEqFu2UNPW5cvPCOngDqXpddKxxC9o3Wr4Ol2r1ArK0ZFXeDu38BhyLVbGyGi1AMlgOcodB+ALO/NvlxYF+1dvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=E484a46S; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1768296602; bh=olNAMn+G4iuCUvoLcnEj1L1oYP+Daz/mSqmRGxS5qtM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E484a46SeA5IrUzQFnBUh1hcuqByqySFUt9JSs4PiJ7ReKaAeKVx2YsqmcOdywT1W
	 QWBbqaYGMkeiGR0o8ikLm4n1FvAmr2g/BqqkkmOpePmoUIalLDjIQGilTTg1H9I0Qt
	 BNbgwRM01f7/m5f7YJxoh9ktDRYE0hgAgoUp3/Zj1pxm69+vAvwSNXOFw+SArPNtzD
	 TgoAgGVTKvCrDwBDww5pKsnLDz6V8C7s31GqvC3i0L8lgTH1zaa60cj/iWO1BgSH5j
	 Waf4gAUN5xCIQzRQ3q0+hde1haQ30PiSO1TvHZZpTv+T1Y3tJrqJihknedfKMCd9gl
	 vuIeEvGEPyz0w==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 1C90069155;
	Tue, 13 Jan 2026 14:30:02 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 13 Jan 2026 14:30:01 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Val Packett
 <val@packett.cool>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
In-Reply-To: <fcc6544f-b0dd-4f23-ade7-4d6f8b6a612f@oss.qualcomm.com>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
 <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
 <3dd54179-7a22-4596-a6ef-224530c4b2c6@packett.cool>
 <2f0d6bd9-0786-4445-94d2-5189f6b44d01@oss.qualcomm.com>
 <e7j3hctjlly44pjwe3jvjtpjuj33bdvpyo6pzc6o3q5tjjlyib@7evgyweq2deg>
 <fcc6544f-b0dd-4f23-ade7-4d6f8b6a612f@oss.qualcomm.com>
Message-ID: <e3530bff3d39bbb06b01364b30a5a21a@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Konrad Dybcio писал(а) 13.01.2026 13:30:
> On 1/13/26 2:31 AM, Dmitry Baryshkov wrote:
>> On Mon, Jan 12, 2026 at 11:50:25AM +0100, Konrad Dybcio wrote:
>>> On 1/12/26 1:31 AM, Val Packett wrote:
>>>> [resent for the lists as plaintext, oops]
>>>>
>>>> On 1/11/26 1:50 PM, Dmitry Baryshkov wrote:
>>>>
>>>>> On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
>>>>>> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
>>>>>> [..]
>>>>>> +&dpu_intf1_out {
>>>>>> +    /delete-property/ remote-endpoint;
>>>>> Why? It should not be necessary.
>>>>
>>>> It seemed to be implicated in annoying EPROBE_DEFER issues.. But you're right, it wasn't this after all.
>>>>
>>>>>> +
>>>>>> +&pm6150_pon {
>>>>>> +    status = "disabled";
>>>>> Do you know, how is Power-On routed?
>>>> I think it's handled by the EC. Keeping this enabled doesn't make power-off work, and doesn't make the power button deliver events either.
>>>>>> +};
>>>
>>> FYI I don't think a modern QC SoC can turn on without PON
>>>
>>> What do you mean by "doesn't make power-off work"?
>> 
>> It is basically a laptop SoM in the embedded case, so it has EC and PoN
>> generated via the EC.
> 
> I got that part, but this doesn't answer my question. Val mentioned that
> separately from the power button not generating keypress events.
> 

FWIW on Aspire1 the power key is routed to the ec, and ec is routed to
pmic pon/resin (as well as ps_hold etc etc). Pressing the power key,
obviously, boots the laptop but after that it has no effect in windows
or in firmware. In linux neither pon nor resin receive any input events
when pressed so my guess was that EC pokes PON once to boot the system
and maybe pokes resin if user presses it long to do a hard reset. Due
to that I've disabled the pon node in aspire1 so there is no bogus input
device. I'm guessing Val has inherited that from aspire1.

Nikita

> Konrad

