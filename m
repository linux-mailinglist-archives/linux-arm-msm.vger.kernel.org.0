Return-Path: <linux-arm-msm+bounces-101736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEQ0LRs00Gnm4gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:41:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B643987EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D99F30177B5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B4538AC91;
	Fri,  3 Apr 2026 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiaUNzmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111237881A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252504; cv=none; b=TIbbbJ3SxOqlAAdubTkql2VVwXO05taSTgd7ylNkuCwbtM5ZtOh/oFk4WwCq8MpTrIRzdJ0EhIPMSfKjYUmG/oLqU7XHnhHOJVYTpxpuv46eJdkGxt4c0Z33vtZA0kG7Ta+A7gBUQjWx0ADT4AvlKdvM3KcM421jIm/dn+SWOyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252504; c=relaxed/simple;
	bh=aNqo3VMozaVfeBSUz7AnkpMWki798TmNnJ8/9zzdduE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5isEXjbXHPuL1omk2Bne7BvCr/Q6OjYvRGb3iFJ4iOLVoD/UNMgmirQU6Cjae3FAY1jrUbgw/IzGTy+6YlPlak8E/z9pvu0WXtrHBQeqjSXkmGF7whTBc1G9bkNR8WILvOOIIgTxomR+9k+oXM6NOxslMG+7Hb117q/OUlutp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiaUNzmM; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-68207984e66so696443eaf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775252502; x=1775857302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVNcwvGWChEYY43mjLuxLc5r/Yw+nmvsqVmyVp0sV/4=;
        b=UiaUNzmM5opWIzreUxi8kKeI0EQbHvFnUCZpS6Gll9SbV5DskLdlqOc/oBizh6NKza
         OFQSDo2Nf4SLG+8YVtM0mzQ2vX8/4DI0IjZZo1d4yjCMJ5gclETo5PIhnIYDmD1k4UGk
         6A1Zo1S2jvTcLD9F7kSHlQAqJsWTVDsA/SYOD2RXwrT6hmNoAggbcfcPinyxom6L4oi9
         aGDhf5c/S7xpK4ZzKi0/Z82TjRJ6lOuL5VXyYLoG71rfBnpT6TPjv2r3tV+zi10y8LND
         fPEt1+M8JJYUixHifQPSqBD9x/PF7iVVlL9FxqhCHLIDiX4YFuquo/LUmhoxygmoSx3M
         DjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252502; x=1775857302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVNcwvGWChEYY43mjLuxLc5r/Yw+nmvsqVmyVp0sV/4=;
        b=aPcWNK5GovwjacQhhh8ozVg/1mf5SGV+XQQ6UQjtVjO49orMX9unKJNAURsbXDCFBB
         DjKEUm5PsBO83nmVXAvqv8NrVRkqnqePtR/0tUFsx8gI5dCnuCk4YMiqryQwaf0MkVWJ
         Y/SF/WLULZVtuIDCmqb1d1YJBDbIYnxdVCzrCKpz3ey94h+IWfZTOkeHw5uYLrNMXjsm
         Y+LS0krDoZwIFvpWOmdbNcwLBte9ANZEuqbx0/WrqUVeMrWQI5AZS8tyPxEwCvoFAxZa
         S0tCMzV8WdY9ExMfBvg5eSG/DJZ22LYWK9HvoquRhf2SKcY5pdvb3gwvw4k37hkYq4VD
         GMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXnqzlQJYEo9BX4sCsF65lO7X4B6CoVICKh18MTsH3Uk6UbJFvn7r5GcOvbIljmtjs51w3pUFaJ6Sqw6go@vger.kernel.org
X-Gm-Message-State: AOJu0YzJykkEWzxCOftRazlUgztZrOonLKFS0Z7BmeTMPwZNcMC00AVM
	gjLjNGI5uPTXo+VYSkQdgeMrlOadREruewWpTs6UgDVc1I1a0GR0AhlJ
X-Gm-Gg: ATEYQzwPTVTZL/xixjYUQW/IeDZCsnZClQQVEpSbRd8qLbGd+Jo/XmFoCYYkeGFqX/N
	0HBjiIkF2oIUwEpl+QZZQTmC22nzVWyYLKmEAseJO9a6Rk0wctbw+t7lOjyLm4iOcaIC0Cgv4lZ
	WopBExlanlfpnkkre2kXVulDL9LuSusmUVUWmysitFVMaUp3W1ugqphGqruGiKah3XcV3jm/3xY
	4EuvBSfBKLMAts7eSWnKTGGqBzubGQCd6URSCwBNEogYBEjGArY1Y4k7ncrfOYWSbDhnT6omzWe
	uelfjEkPshBHChMbuwvxdcUV5noOhZxIAyGhsAGzN0Lqa9Abq5wlAK4rmqbNh9Ixe9WniF7tebY
	J/Q62FvCHGPrkUjajbga9EBtz6p7I9DKR/aYkLZe1nS1WR7yr5prot74Y8LN+xarurNSlwEBB4y
	IpdP1jOJq5W/ZWdQTb2JIoEKcqTdfKFzhcPxcmErtz0LFSdIR9BrBCVIGTPZtXZS4rekRTHlM=
X-Received: by 2002:a05:6820:8c3:b0:67e:d8c:9f87 with SMTP id 006d021491bc7-6821d23dad7mr2348863eaf.5.1775252501679;
        Fri, 03 Apr 2026 14:41:41 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-682ba3cbe72sm1309071eaf.11.2026.04.03.14.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:41:41 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: vikash.garodia@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	andersson@kernel.org,
	bod@kernel.org,
	bryan.odonoghue@linaro.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	johan+linaro@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	stanimir.varbanov@linaro.org,
	threeway@gmail.com
Subject: Re: media: iris: enable SM8350 and SC8280XP support
Date: Fri,  3 Apr 2026 16:41:39 -0500
Message-ID: <20260403214140.7307-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
References: <a1dcd0e3-db1c-4752-9473-7934e69198a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,linaro.org,ixit.cz,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101736-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[threeway@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 09B643987EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Vikash,

>> This is not just with totem, showtime shows the same issue.  If I let the video
>> play, it plays just fine, however, if I attempt to skip forward, back, or even
>> play *after* the video has played, then I see the smmu fault
>>
>>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd51e3e00, fsynr=0x600002, cbfrsynra=0x2a00, cb=6

> please log the info about which "iova=0xd51e3e00" buffer is faulting in
> this case

I will include the diff that I applied against my kernel, in case this isn't the
correct information, but I get the following output in EL2:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd516d400, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:11, data2:deadbead)
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:79756000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4

And the following output in EL2:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xd516d400, fsynr=0x600002, cbfrsynra=0x2a00, cb=6
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x2a00
arm-smmu 15000000.iommu: FSYNR0 = 00600002 [S1CBNDX=96 PLVL=2]
qcom-iris aa00000.video-codec: sys error (type: 1, session id:ff, data1:1, data2:deadbead)
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: session error for command: 0, event id:1004, session id:28644000
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000dd000000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=3 idx=0 iova=0x00000000d7800000 size=5652480 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=0 iova=0x00000000d8c00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=1 iova=0x00000000d8a00000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=2 iova=0x00000000d8800000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=3 iova=0x00000000d8600000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=8 idx=4 iova=0x00000000d8400000 size=1445888 attr=0x4
qcom-iris aa00000.video-codec: buf_type=9 idx=0 iova=0x00000000dd780000 size=498176 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000da000000 size=19472128 attr=0x4
qcom-iris aa00000.video-codec: buf_type=10 idx=0 iova=0x00000000d6000000 size=19472128 attr=0x4



And the diff I had to come up with to get this output is:



diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index 8e864c239e29..a57a0e4971c8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -214,7 +214,7 @@ static void iris_hfi_gen1_event_seq_changed(struct iris_inst *inst,
        iris_inst_sub_state_change_drc_last(inst);
 }

-static void
+static noinline void
 iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
 {
        struct hfi_msg_event_notify_pkt *pkt = packet;
@@ -235,7 +235,25 @@ iris_hfi_gen1_sys_event_notify(struct iris_core *core, void *packet)
        schedule_delayed_work(&core->sys_error_handler, msecs_to_jiffies(10));
 }

-static void
+static noinline void iris_dump_inst_buffers(struct iris_inst *inst)
+{
+       struct iris_buffer *buf;
+       int i;
+
+       for (i = 0; i < BUF_TYPE_MAX; i++) {
+               list_for_each_entry(buf, &inst->buffers[i].list, list) {
+                       if (!buf->device_addr)
+                               continue;
+                       dev_err(inst->core->dev,
+                               "buf_type=%d idx=%u iova=%pad size=%zu attr=0x%x\n",
+                               i, buf->index,
+                               &buf->device_addr, buf->buffer_size,
+                               buf->attr);
+               }
+       }
+}
+
+static noinline void
 iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_notify_pkt *pkt)
 {
        switch (pkt->event_data1) {
@@ -263,7 +281,7 @@ iris_hfi_gen1_event_session_error(struct iris_inst *inst, struct hfi_msg_event_n
        }
 }

-static void iris_hfi_gen1_session_event_notify(struct iris_inst *inst, void *packet)
+static noinline void iris_hfi_gen1_session_event_notify(struct iris_inst *inst, void *packet)
 {
        struct hfi_msg_event_notify_pkt *pkt = packet;

@@ -593,7 +611,7 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos= {
        },
 };

-static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
+static noinline void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
 {
        struct hfi_pkt_hdr *hdr = (struct hfi_pkt_hdr *)response;
        const struct iris_hfi_gen1_response_pkt_info *pkt_info;
@@ -631,6 +649,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
                if (inst) {
                        mutex_lock(&inst->lock);
                        iris_hfi_gen1_session_event_notify(inst, hdr);
+                       if (inst->state == IRIS_INST_ERROR)
+                               iris_dump_inst_buffers(inst);
                        mutex_unlock(&inst->lock);
                } else {
                        iris_hfi_gen1_sys_event_notify(core, hdr);
diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
index cfc5b576ec56..45f349bd8b71 100644
--- a/drivers/media/platform/qcom/iris/iris_utils.c
+++ b/drivers/media/platform/qcom/iris/iris_utils.c
@@ -74,9 +74,9 @@ int iris_wait_for_session_response(struct iris_inst *inst, bool is_flush)
        return 0;
 }

-struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
+noinline struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
 {
-       struct iris_inst *inst;
+       struct iris_inst *inst = NULL;

        mutex_lock(&core->lock);
        list_for_each_entry(inst, &core->instances, list) {
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index bd38d84c9cc7..5cc47e900c83 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -168,17 +168,8 @@ int iris_open(struct file *filp)
        mutex_init(&inst->lock);
        mutex_init(&inst->ctx_q_lock);

-       INIT_LIST_HEAD(&inst->buffers[BUF_BIN].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_ARP].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_COMV].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_NON_COMV].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_LINE].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_DPB].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_PERSIST].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
-       INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+       for (int i = 0; i < BUF_TYPE_MAX; i++)
+               INIT_LIST_HEAD(&inst->buffers[i].list);
        init_completion(&inst->completion);
        init_completion(&inst->flush_completion);


Please let me know if this is the information you are after, and if not, could
you provide a patch to help me get it?  I had to noinline a lot of things, as
you can see, otherwise I was just getting null dereferences when trying to get
the buffers.

> Regards,
> Vikash

-- steev

