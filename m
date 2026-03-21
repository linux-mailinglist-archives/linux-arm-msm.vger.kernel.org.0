Return-Path: <linux-arm-msm+bounces-98978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IOWKQELvmk/FwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:05:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD952E3003
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 04:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DACC23010225
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 03:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820422E175F;
	Sat, 21 Mar 2026 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="fVBcEMd9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D32DE6E3
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 03:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774062326; cv=none; b=Hhqb/8AJDDc5isSG6agsKnebjwpkHZmQNOvd6xUqGZpW2eC4CIgJ02suf2rSYahNXFMYs/SeyJ+816ETQpRCC8rU4n04ArFivkaI1I/RmhmkDy5rstmpm4AV87undKqg11hOGPkPdcWxY1nfuXMh2OXRYEGkY8JDUKjirn+Bp+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774062326; c=relaxed/simple;
	bh=hkEbWHvoyfi4N2vi01N5wh/+M84rhTi8RB7e+26RNm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TOwiHR8JV+mH+ZTRRSMZApz5t5a+vWwykRdAXHiXDdjYOAx9p21ng3+j0jnFZmB0zirPnqP2W6Uq0mPXB1wflT1zkaEfQeHjRfFpefGXc8aR/bnK+SouNy3azqawm2LIym+Ik1yYJuZ80v6/HIE+iGvA63HWx0rIg8VOCARFf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=fVBcEMd9; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <2d0ca19b-9b8b-4cca-9679-56983ae75b99@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1774062312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXbJCxPsCXe3gsiN6EBXHO7z8maO4HKWRtMFfUGI4KM=;
	b=fVBcEMd9yEFI3jf8A/z7nxnlZMEmz4yTOmzHKogS4+FtOL7Ny0USYNvvotZHinWUAQKVg4
	gEOc7sRm9P36Qx903N8JR4Q3KZFe6CmPL+1mtUJ7p6tGK1iBVSqs9Xz0whu+QrPOmjswPk
	ogQhAbrqirF10XpeOJEpFUr//t2GM5xRnIo+6zSwl5S8HiDSDFom/6SO5z7eIKwR7TLcsu
	XXGzZ7vHFpj6Zsm16SXXtgTvWHADnNkC0PO1D/ipqUHnvqCvmqmhufN2PNV/XMfRjPCVuL
	r6KI/AWZR7Kz8U2wWl9mEwgeUtxhq5DsNypCzk8a7FGVL7YdtprBRjcF9iVWXQ==
Date: Sat, 21 Mar 2026 00:04:55 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] spi: geni-qcom: Fix CPHA and CPOL mode change
 detection
To: Jonathan Marek <jonathan@marek.ca>,
 Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, konrad.dybcio@oss.qualcomm.com
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 bjorande@quicinc.com, mukesh.savaliya@oss.qualcomm.com,
 praveen.talari@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260316-spi-geni-cpha-cpol-fix-v1-1-4cb44c176b79@oss.qualcomm.com>
 <4a7d89ef-0f63-a7c3-e996-ff9fc476a04e@marek.ca>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <4a7d89ef-0f63-a7c3-e996-ff9fc476a04e@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98978-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,marek.ca:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AAD952E3003
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/16/26 2:13 PM, Jonathan Marek wrote:
> Reviewed-by: Jonathan Marek <jonathan@marek.ca>
>
> at least it doesn't look like this stupid mistake breaks anything 
> upstream (no spi-cpha/spi-cpol in any qcom dts)

There might not have been any users upstream but you never know what 
people are working on :)

Looks like this might've unblocked my progress with one of the phones I 
have WIP for (sm6115-motorola-guamp) which has a Himax touchscreen 
(yuck[1]) that uses SPI mode 3. Only tested quickly but at least one 
reply in the early init sequence makes sense now!

Before:

hx83102j spi0.0: himax_spi_read: xfer_tx_data: f3 08 00
hx83102j spi0.0: himax_spi_read: xfer_rx_data: 08 00 00 00
hx83102j spi0.0: hx83102j_sense_off: Do not need wait FW, Status = 0x08!
[..]
hx83102j spi0.0: himax_spi_read: xfer_tx_data: f3 08 00
hx83102j spi0.0: himax_spi_read: xfer_rx_data: 18 00 00 00

After:

hx83102j spi0.0: himax_spi_read: xfer_tx_data: f3 08 00
hx83102j spi0.0: himax_spi_read: xfer_rx_data: 04 00 00 00
hx83102j spi0.0: hx83102j_sense_off: Do not need wait FW, Status = 0x04!
[..]
hx83102j spi0.0: himax_spi_read: xfer_tx_data: f3 08 00
hx83102j spi0.0: himax_spi_read: xfer_rx_data: 0c 00 00 00
hx83102j spi0.0: hx83102j_sense_off: Safe mode entered

So that's a very late

Tested-by: Val Packett <val@packett.cool>


BTW, spi-cpha/spi-cpol in DTS is not an entirely reliable indicator it 
seems? Loooots of drivers set SPI_MODE_x in code explicitly, my 
understanding is that that overrides dts.


[1]: 
https://lore.kernel.org/all/TY0PR06MB561105A3386E9D76F429110D9E0F2@TY0PR06MB5611.apcprd06.prod.outlook.com/

> On 3/16/26 9:23 AM, Maramaina Naresh wrote:
>> setup_fifo_params computes mode_changed from spi->mode flags but tests
>> it against SE_SPI_CPHA and SE_SPI_CPOL, which are register offsets,
>> not SPI mode bits. This causes CPHA and CPOL updates to be skipped
>> on mode switches, leaving the controller with stale clock phase
>> and polarity settings.
>>
>> Fix this by using SPI_CPHA and SPI_CPOL to detect mode changes before
>> updating the corresponding registers.
>>
>> Fixes: 781c3e71c94c ("spi: spi-geni-qcom: rework setup_fifo_params")
>> Signed-off-by: Maramaina Naresh <naresh.maramaina@oss.qualcomm.com>
>> ---
>> This patch fixes SPI mode change detection in the spi-geni-qcom driver.
>>
>> setup_fifo_params compared spi->mode against SE_SPI_CPHA/SE_SPI_CPOL,
>> which are register offsets instead of SPI_CPHA/SPI_CPOL mode bits.
>> This could skip CPHA/CPOL updates on mode switches and leave stale
>> clock configuration.
>> […]

Thanks a lot for finding this!!

~val


