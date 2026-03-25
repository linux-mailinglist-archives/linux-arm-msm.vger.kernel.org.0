Return-Path: <linux-arm-msm+bounces-99943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIwhFBFFxGm1xwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:26:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAD132BCBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 30BE230ACB54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C90A364E89;
	Wed, 25 Mar 2026 20:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="TxsrGjQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F144640DFB7;
	Wed, 25 Mar 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470268; cv=none; b=aCIEcWqOJAw7zTExbD5cEgkZvoJMMZaB+rYQ01HBs6su585B6bgLoITxhW2uePVmQ/QLM7QuflOnvWxfAwYxfwIhR2LCNxuw1YjvuQG4Tq2VbCauYfl3j69VO0sEMhoKKpRhYTTN2GxSTPHEfFiPYhXaKOjJodReDOH1XeIO0lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470268; c=relaxed/simple;
	bh=zU881+KYqJ2texOlCecdGNXSK2jjswW/VHW+Kr76Z1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pc7+K9AHmxGXQehq6nMRNsqwIZ/BMOXSXHPBjkLWQ0XvrYawHIv1tNijdZswiCvaEDzUoQD1bTJpNdSfHIDOho3S0z2El0ZOyMEVtHF6DxUNxY+AeuV0ugyQBS/i8pt8OTwtvqfq6A3R8pq/PJ96vhO7FaAHeIbdhCvgNawy3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=TxsrGjQi; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Received: from [192.168.1.197] (88-167-17-4.subs.proxad.net [88.167.17.4])
	by adishatz.org (Postfix) with ESMTPSA id AB3EE4C01F5;
	Wed, 25 Mar 2026 21:24:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1774470257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5gKYBO4fTmgruQ8a5PMivK7GbslUIKE49QDkqS/2uQ=;
	b=TxsrGjQiWd1WVnYFA0r13YJEH2u4S67I+5Y1oSM/DHZjXsYG8d0mEJjvzuZ7dx2RKHO7KI
	nAKaq9+XX2J1glP5bCfHGFdPgc942o5dGViyvq/yug0NJoyWd+tDCTPGjdTJIfRW8LsNes
	LT/EbLqHUOaJoGMvatdx5fbajQ5vxvn0R8czM9Jet8xb+6LQo1BF+J5JhZcxrEufOhb4nI
	kyzeqPTsuhN/AaSGPBUVwLcR0JAz3KRMi1bVdniTImhhWEOTq+N3Fu0yBWo4XxVT3l69S1
	wvP/c7qKrdXLC3v5gcP2ad8Ffg8wyVf0H3cyKFq1wzXlD35HTADDlU4sNvgWhw==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
Message-ID: <b6df67d6-5999-48d4-bb4d-46853ca0aeab@adishatz.org>
Date: Wed, 25 Mar 2026 21:24:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: fix race between cmd transfer and host power
 off
Content-Language: en-US, fr-FR
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, antomani103@gmail.com,
 mitltlatltl@gmail.com, krzk@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260318105635.270949-1-cedric.bellegarde@adishatz.org>
 <6wu7eezhtqyatbvoryprfpwkcmofdk4albr2zedfrbnrw37amf@rx4lslum3u6b>
From: =?UTF-8?Q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
In-Reply-To: <6wu7eezhtqyatbvoryprfpwkcmofdk4albr2zedfrbnrw37amf@rx4lslum3u6b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[adishatz.org,reject];
	R_DKIM_ALLOW(-0.20)[adishatz.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99943-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[adishatz.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cedric.bellegarde@adishatz.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BBAD132BCBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 18/03/2026 à 14:57, Dmitry Baryshkov a écrit :
> On Wed, Mar 18, 2026 at 11:56:35AM +0100, Cédric Bellegarde wrote:
>> The transfer function dsi_host_transfer() guards against the DSI host
>> being inactive by checking msm_host->power_on. However, power_on is
>> cleared at the end of msm_dsi_host_power_off(), after clocks have
>> already been disabled. This creates a window where a concurrent DCS
>> command (e.g. a brightness update from the backlight driver) can pass
>> the power_on check, call xfer_prepare()/xfer_restore(), and toggle
>> link clocks that are already being torn down, leaving
>> disp_cc_mdss_byte0_clk stuck in the 'on' state.
>>
>> Checking enabled instead of power_on closes the race by rejecting
>> transfers as soon as the bridge starts tearing down, before any clocks
>> are touched.
> 
> Thanks, but it is not correct. The transfer callback is documented as
> requiring to power up the host if it is not on at the time it is
> called. Could you please implement corresponding logic?
> 
>>
>>
>> Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 4d75529c0e85..f66f138cfba0 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1652,7 +1652,7 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host *host,
>>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>>   	int ret;
>>   
>> -	if (!msg || !msm_host->power_on)
>> +	if (!msg || !msm_host->enabled)
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&msm_host->cmd_mutex);
>> -- 
>> 2.53.0
>>
> 
After being able to boot linux 7.0.0 rc4, I can confirm that this issue 
is already fixed.

Regards,

-- 
Cédric Bellegarde

