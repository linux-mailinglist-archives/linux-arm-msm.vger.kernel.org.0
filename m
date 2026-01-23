Return-Path: <linux-arm-msm+bounces-90387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCuNIhnWc2kOzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:12:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B71CC7A825
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EBFC3003830
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669AD2C1586;
	Fri, 23 Jan 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="Pt45pOvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740503EBF06;
	Fri, 23 Jan 2026 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769199123; cv=none; b=l3C126TmVMqA5SuCPoVe4KXovPs5b328b2qAQbn/VxK8Oapgjjt3PN0C8qtPQPgmZ2/vLN+vWnWyEU54WP5WYKXqqq4AArSdG7Kao6mQgEXTQ/cHUnxrN8sdX2FKrg1uuu3GidFO5HgXtX/xogDW+UMaWuSDqptTj1Cpek+ZsUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769199123; c=relaxed/simple;
	bh=kImPD9cOGeBrKomeBUbq16s4ClupG8qLBuV0vVdn2PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZwsTYJv3GV+ZW4twCpEoRkH3RGckQuT9YTbdzD8cGKoqik1Pu3s00l2H34yNZnBGJjQVnFK9XjIEC0CdIqRby82CgXDUCXdTmb476RICR9exSTJOyBkJOdFKMFBUCl27Cn4HLN4+J7Q9myOqc1ss+7T3Akv1ScF9j3WhAv5Cuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=Pt45pOvS; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wJbrfP5RKBLUZZC+JSx2ULKrTQ79VQMq+bKfXPXS0oY=; b=Pt45pOvSmo+xQszsXEUPKfIMQX
	sUx8TqeoDlIUzVdlc/GrYcuJkL17KmGQRWd/fnipx/LCr0/wz3ux0hS9JD1ZABLoUfQXjoyq6m5dR
	pwNot0zvHqsO0v78kGAgtSuEBwZ/4FXOqBt4VTlLtHv0FMHreQz50j691yZt7wMRKlO4=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1vjNVX-000000085rx-2tXh;
	Fri, 23 Jan 2026 23:11:51 +0300
Message-ID: <e6bcf45e-9eef-4660-8630-a7be1cbca61d@minlexx.ru>
Date: Fri, 23 Jan 2026 23:11:50 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sdm660-xiaomi-lavender: fix
 regulator and SD settings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Gianluca Boiano <morf3089@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robh@kernel.org, david@ixit.cz
References: <20260120180052.1031231-1-morf3089@gmail.com>
 <20260120180052.1031231-4-morf3089@gmail.com>
 <afa20489-adaf-46bd-b3e7-c763aba5d7c9@oss.qualcomm.com>
 <ac83f41e-08ad-4ffe-9f0e-02f8256af65c@minlexx.ru>
 <f8097212-6388-4c4c-8f5d-a91df99a18c5@oss.qualcomm.com>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <f8097212-6388-4c4c-8f5d-a91df99a18c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[minlexx.ru:s=dkim];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[minlexx.ru : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90387-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[minlexx.ru:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[alexeymin@minlexx.ru,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B71CC7A825
X-Rspamd-Action: no action

On 23.01.2026 12:26, Konrad Dybcio wrote:
> On 1/22/26 5:44 PM, Alexey Minnekhanov wrote:
>> On 21.01.2026 14:27, Konrad Dybcio wrote:
>>> On 1/20/26 7:00 PM, Gianluca Boiano wrote:
>>>> Fix regulator configurations to ensure stable operation:
>>>> - vreg_l10a_1p8: Add regulator-system-load of 14000uA for proper USB PHY
>>>>     PLL operation
>>>
>>> The driver needs to be fixed instead, as it should perform a
>>> regulator_set_load()
>>
>>
>> Also change done by me in [1] with more detailed explanation:
>>
>> Since the commit f05ab10 ("arm64: dts: qcom: sdm660-lavender:
>> Add missing USB phy supply") previously untouched by Linux regulator
>> l10a is now used, but it exposed a bug from initial porting: when
>> booting with USB cable inserted, or booting without cable and
>> inserting it later, board reboots.
> 
> FYI this shouldn't be required with the upstream driver, I don't think
> the core calls .set_load(0) and RPM isn't notified of a current
> requirement change unless that happens (qcom_smd-regulator.c)
> 
> In the power grid, I see (current values representing the peak):
> 
> -- USB2
> VDDA (3.1 V - vdda-phy-dpdm-supply) - 60mA
> VDDA (1.8 V - vdda-pll-supply) - 30mA
> 
> VDD (?) - 11.4 mA
> VDDA_DVDD (?) - 35 mA
> 
> -- USB3
> VDDA (1.8 V) - 14 mA
> VDDA_CORE - 68.6 mA
> 
> +Dmitry poked at 660 in the past
> 
> Konrad
> 

This is not needed e.g on sdm630-sony-nile-pioneer, it's booting fine 
without system-load with USB cable inserted. Maybe IFC board doesn't
require this too. Seems to be xiaomi specific thing again?

Alternative is to not touch L10A regulator (comment out vdda-pll-supply
from qusb2phy0 node and face the "phy@c012000: 'vdda-pll-supply' is a
required property" dtbs-check error again. Which we don't want to do of
course. And schematics say that vreg_l10a_1p8 is connected to at least:
VDD_USB1_HS_1P8, VDD_USB2_HS_1P8, QFPROM_PRG, VDDA_APC1_CS_1P8, 
VDD_PLL2_1, VDD_PLL2_2.

--
Regards,
Alexey Minnekhanov

