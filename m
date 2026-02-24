Return-Path: <linux-arm-msm+bounces-93854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN0vBTn4nGlxMQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:00:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 793E6180638
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 02:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4130B301981F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 01:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D8E23A99F;
	Tue, 24 Feb 2026 01:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYvRJe/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB0C1EBFE0
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 01:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771894836; cv=none; b=kb2MK6U0rCR7IG9Lfvxf8jIjYZs6b8+OEFuY8w/NnaXb067znVacBz+VkOzhJsjq1XTOKFPx/f2cGtF4OVzOU8K4/htj2cMF3ArRCL8rgUQ0+cyOXffUsSeSsPDjg17WJeyj5NOKzAYMA0CKw9cxAW0WD6g64tc9hj7+bBQicaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771894836; c=relaxed/simple;
	bh=5jN52IdsSbjm829LHP1blJIbKJN09jEu6RV1toJJOcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptzUV//GYu+CWC3lqK8nKGGKbvx5a47vSJ/oCX7GBbOX8aHYKn3PxKPOsovQC4fdnllgh15A2IX2pX3uWm5os2VwqCwC/fuNbOyBTx3WuUCE/n1OyS11yFS9ykBRH5gVFFE4AkEAEeIgjW9n4z7FKlHYZ/il6knoZf3Lxs1KxtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYvRJe/o; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1271195d2a7so1074621c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 17:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771894834; x=1772499634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2uvQ9O24I15o797RSwZq84+qdPgPwWIChdomW4o10c=;
        b=OYvRJe/o5qp4VM9VgjdIwytYM+B2K8qN6LQW7+63IMEiPl9qabHHmdh3Er3MlUXVrV
         /mRbtOeV0twfv6eU3LkFKGpfmUjZCEO06ImY0+csqXkUARrq4H7KvfbgqX7czmY4FDgB
         yf0Uj5GGvguOlOAOtyBk/YEgt+KFyHgBUEqbm9oN1CqAk+5wYT2hDN+9q3AbhF9+JyQV
         GVcz+rlmrC5mtxsOv6r+OmbmliE4LcmEffL5k0T726WCJhyaZ9oAmfSeezLviR4qr9dd
         yzq7i0Mu+t3/b5ULZ2IdVgFFBBzEgOH0eGz+vG74qJNQ8JlHez5KICHPIiUzOZ/VEVKK
         r9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771894834; x=1772499634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2uvQ9O24I15o797RSwZq84+qdPgPwWIChdomW4o10c=;
        b=wYGPK2voCKq6/OzTqWnrp5FWboLFfXxE6r6ism9j4Doln+XCwqnZaVRuidfIktTRAK
         XRmefh6+8LWUlhGmi04ojmAeh8Tp8oSS1A/UTRKuvmpnEF+zE2Ql/Hs23bPOTQNzUbBj
         ptC+TGbgymgh8F+d6I+jU2djGump26f6DLqk96teHAppCkCOVmx5aaqkFkrFHnScLErr
         w3iICpLRfBe1oPLFZW9b3tKQrmnJTjjext7X9Sf2C5m3XGk0KQpFTRLswF38bQ/rVGog
         659oh3zSVeLVd++0NX0a3PjcM1IPlae0pkpAE/AhU12gkyZuOzzy6WUtOG47zpFCgFz8
         bSGA==
X-Forwarded-Encrypted: i=1; AJvYcCUhukYu3Rq+6aPyGp1SujmGjKma659V6tuWpXYytBOUhwMzb7x4/MpDsMelhygw+N5F0uazdHlY4dTBuIaW@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8AjAUynELlzkUYhNEz8WQO0wdCTGeAcMbQgjcxpt5vyJF6+O
	mZ8OzTxMORyPpX/ZXt/DOpLZJbx3zfYz3paxXJbA296T7hC0Fuk+GDJu
X-Gm-Gg: AZuq6aLeCFYgudiM12WGTLd152zdiKHHUl+g9CMY4QsRQgrskHgu9aqKF7IZkGH8aS1
	h4bqscgKs920u8+Mconepl02EqElLecm7IB1UCUugimxjWqkf4C26K7i+bsD2bkvfZ+vSZPlWVc
	taW+nlKfMRdHY5j/jWCTG9UcMziyos+I8hl1xJMH+vrH02OwoFW67QT8FUq1k8BorgNDDmrhlab
	WiKkNHKULtCQbeVvkK/HDPJbyeP96ZENFNwxYLn7fGY48f65grxMI+/JjAAjmKdESBdGWmqXoP7
	DB3B2H2q7YN4LM14sz/b9G2ogrPMjTP+Efh86s3xr5uPziDHFkRIN7xfvtj2Cit9GLuhyXeO6cG
	f9HFwQolLfFFec5qs7bBvEg/4q/33E8F4e5kNkQ5IgJ2+aX6Mfh9OupATdCDPdLUaKLJ3V1Msyn
	LqQPx7R93dKP0ZS/DXS4CZm7r7VVW4JDZeRBnXBcTOdq7WMgeZcQ7YYgopegIHvLqDx6vDcYsgm
	TefWw==
X-Received: by 2002:a05:7022:a91:b0:123:3bba:fc4c with SMTP id a92af1059eb24-1276ad50e28mr4383416c88.38.1771894834231;
        Mon, 23 Feb 2026 17:00:34 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276afa0bedsm9107517c88.16.2026.02.23.17.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:00:33 -0800 (PST)
Message-ID: <41b4f4c1-f0c3-4ce7-8267-039bb77ea953@gmail.com>
Date: Mon, 23 Feb 2026 17:00:32 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: expressatt: Add
 coreriver,tc360-touchkey
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 beomho.seo@samsung.com, jcsing.lee@samsung.com, linux-input@vger.kernel.org,
 nick.reitemeyer@web.de
References: <20251205-expressatt-touchkey-v1-1-1444b927c9f3@gmail.com>
 <532531d2-8f26-4ffa-9355-7821a4d64200@oss.qualcomm.com>
 <1e74b956-a45a-4d3e-b7fa-e4d5dc0390db@gmail.com>
 <97d9d942-236c-4f8a-902e-0ad2ab684a76@oss.qualcomm.com>
 <1ebc2e1b-f1aa-4559-90a0-feb628d5bfe1@gmail.com>
 <aZvPUn2RxUHDahfO@google.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <aZvPUn2RxUHDahfO@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93854-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,vger.kernel.org,samsung.com,web.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 793E6180638
X-Rspamd-Action: no action


On 2/22/26 19:54, Dmitry Torokhov wrote:
> Hi Rudraksha,
>
> On Thu, Feb 19, 2026 at 08:33:43PM -0800, Rudraksha Gupta wrote:
>> Hello all,
>>
>>
>> Top posting for once (context below).
>>
>> Not too sure what the next steps are to get the tm2 touchkey in. Should I
>> resend the patch, contact someone else that can help provide guidance, or
>> something else?
>>
>>
>> Adding Dmitry Torokhov (official maintainer) and Nick Reitemeyer (person who
>> introduced this variant).
> Sorry, I am not sure what the question is... It seems that you made the
> driver work without any additional changes?

I believe this patch is blocked on Konrad's comment:

 > This driver mentions a register called CYPRESS_MODULE_VER - maybe
it could help confirm the model?


This was in response to me saying that the "coreriver,tc360-touchkey" 
tm2 variant works as is on my device, but I can't tell for sure if this 
is actually the variant that is on my device. There isn't really any 
documentation for how this peripheral works and I was primarily relying 
on others in this thread to provide details to confirm that this is the 
actual variant being used.

If I'm mistaken that this is a blocker, please let me know.


Thanks,
Rudraksha


