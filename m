Return-Path: <linux-arm-msm+bounces-110025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKxyLRhZF2oPBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:50:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C895EA34E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 22:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A022B3049700
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 20:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A333BADB5;
	Wed, 27 May 2026 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d25owl9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019C2F1FFE
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915030; cv=none; b=h6M/AJkAtPFfJz7VTByoy/Yg7YNK2JpiulBBZpo6Rltnnu82pKQeboTc6Et1koigwh6ywO3LDE34UKcuh6JI8af0yhyVMo9ldeQAFGmeyi1QlQ7TV4LTpkz89sYkn6+1pH0BaPt1ROSMWJM5xys6KwinaOMzK3zjDA4KCII2JV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915030; c=relaxed/simple;
	bh=Ch8UhebV/5NRICmqkk0vKbCURGtEelPdnGUhUTkn1IU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LQnQzzKF2ciXMJTAF291etNhhbVn9X7uwMlMuUmbmt/Gmr9+856iAgc+YxCJ3F/FiCWZ4p9RW43IeWqRlH9AsQjgeNqbeDILWQqOWSrT6dp31bnLyEUzEPunLNdiCcKnPwSKQCsqWhHSZSrxtqDdYZaPa6gkvUPvYshwAeBLbi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d25owl9M; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8367df48711so5309428b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 13:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779915028; x=1780519828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgmT2PCf8Y8jhcdcmTfOPLMXO+NaMPZbn+px8TLtHg8=;
        b=d25owl9M9gAUzbprJP/KeN64nKRsHbaEPMext1UdfEZCzxThUz9sFsuYFcBxzdHuVI
         HYettf2/GhgNHafxo8p5mHfRuwBHQFHcKzq5z4uveVvyn+Ygp9XbT4NCGJY8KmWtJf6Y
         5ApaYWeXa0Q3CqMDzYEhzFPlljMqbW6rIscDfincsU/74Bui2tuxXk8NniwG1I1nEJnf
         7uOxGe6vw8Lp1tBwJWAmScxUUrqBDqAPoVeAFqRJesOjfq/QAd+C4IjOUB/VIChWKWxL
         5oHFadOFHK5BBvZDctpGvx9wmfLza3vS/FfpB79NjXuuA0FcOq3FYrtT+su/3IkYPBVu
         As0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779915028; x=1780519828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgmT2PCf8Y8jhcdcmTfOPLMXO+NaMPZbn+px8TLtHg8=;
        b=rCPh/M8SpSlUazZuGd2JaUbN8zMbRQMw66Dhw9YnvptMmlFUU8W4hXzoQwz5EHai2H
         LhycrCGKXwKCOCEOKDCMGMHFgjJKUa6FvY/oyZuLsWWrLhShnzAQTSTlN5M4StfiEh78
         i90QiqM3eP1XPDBEYdqG2DsfMvhmt2ui7IQ8w5eTbrd8/Kzb+1MCZQkcVuD83zxIfTMJ
         SYZ9zBDCtQmHwKLvfsPgkJF8sfrMC1aQKxeEgltjUuJtsnZ+rvolMxS6n9sWR/ulzQk9
         fPWANhfZ0Iwpb02GcOnnvyhN0+8khNVcKHb3ST0gRDHIOtq4HLwIFv17Vu2xhe1hhwG8
         6LzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RjLhAHVvSHsa3BfMX2WXEQSVXY4puHVKesDOgoMQiFvHtixnj+r2ic2P637v16bzpp9zOE+bbYM1Geyrp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6sshYeS7G98r5C8zYi86q5gB11Iux93ONVkTnXALi4FiUqsv5
	5ZDMJBj42XZTuaHF60oNj/vMVLG39g9RAqMtrliGaEEZNoYK9B13DeH0
X-Gm-Gg: Acq92OEG3qS7cNB3zLP/bW2dy6Z4c7gA2gSdKBhg02XriMrLFZCI3ZcwcRk9OSkw/Yn
	xmcimY0tC/G2s2ni4GAgOqEer6Q0/UGXwPzUnpqOlM/2fMKYbhKaBuSNIXF5wOJ4T+5AIaNvaC8
	rg9At1AxdTezkxQkbqfq917O8U/oU1Hi0a/3kiN7G6hsL+sUJENiNgs21Zc/iTWZs1A8So6twNj
	XaXg/jan5JtcqpCEdNBEJSm41ew7/AEphtp6KLWGHhuHSy5ZlA4nryQWB+tLRmpv/HxBJAmzfhx
	Vb6g4uIxe2KrP54JnqMQKU0cOIax8Y2yC+Q0sn16Bwn3GyJQpYDeyOXG0P0aYYSLjVs+n1o6q+X
	nEKOGOKWSzvax47q2kBAY6GwjmvXrwvLZHFpkB6r6cPsM2ZA48Q2pmdz7HPuafCiUc9fuEcH8iz
	NTJs5+IOW/1aXojjN6Ec/SIU0F89/+Uojg+YBk2MGGW6ncanU=
X-Received: by 2002:a05:6a00:f03:b0:82a:6f69:7f72 with SMTP id d2e1a72fcca58-8415f588372mr23987407b3a.47.1779915028339;
        Wed, 27 May 2026 13:50:28 -0700 (PDT)
Received: from [172.18.227.108] ([219.88.198.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6eae464sm4078935b3a.20.2026.05.27.13.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 13:50:27 -0700 (PDT)
Message-ID: <a727e1e9-777d-4372-a087-85a721f174ba@gmail.com>
Date: Thu, 28 May 2026 08:50:20 +1200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/dp: Limit voltage swing level to 2 for RA620
 bridge
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-4-graham.oconnor@gmail.com>
 <7e435e8c-ba0e-453a-b95c-450446dfc0ff@oss.qualcomm.com>
Content-Language: en-GB, en-US
From: Gekko <graham.oconnor@gmail.com>
In-Reply-To: <7e435e8c-ba0e-453a-b95c-450446dfc0ff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110025-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grahamoconnor@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 58C895EA34E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konrad

I completely agree.

This patch is a temporary hardware workaround for RA620 bridge support 
and should not have been submitted. Please disregard.

Graham

On 22/05/2026 21:28, Konrad Dybcio wrote:
> On 5/22/26 8:06 AM, Graham O'Connor wrote:
>> The RA620 DP-to-HDMI bridge used on the Radxa Dragon Q6A does not
>> acknowledge DP link training at voltage swing level 3. The bridge
>> requests maximum voltage swing but never completes link training
>> when the driver attempts level 3, causing HDMI output to fail.
>>
>> Cap DP_TRAIN_LEVEL_MAX at 2 to match the behaviour of the vendor
>> kernel, where link training completes successfully at level 2.
>> This allows the RA620 bridge to establish a stable HDMI connection.
>>
>> Tested on Radxa Dragon Q6A (QCS6490) with RA620 DP-to-HDMI bridge
>>
>> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_link.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
>> index 76125e9c0..ff0d8e99d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
>> @@ -24,7 +24,7 @@ struct msm_dp_link_info {
>>   	unsigned long capabilities;
>>   };
>>   
>> -#define DP_TRAIN_LEVEL_MAX	3
>> +#define DP_TRAIN_LEVEL_MAX	2
> 
> You're limiting this value for *all* devices featuring a Qualcomm
> SoC with a DP controller. Instead, if this is really an issue that
> results from the bridge's capabilities (which could potentially only
> be a symptom, not the cause), this should be somehow limited to the
> specific bridge itself
> 
> Konrad


