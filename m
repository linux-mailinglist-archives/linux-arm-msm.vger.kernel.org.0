Return-Path: <linux-arm-msm+bounces-94744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +hyCNHpapGn6egUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 16:25:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2C1D06AC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 16:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC1B630104AA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 15:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A579432142B;
	Sun,  1 Mar 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLlmBuHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464102FD1B3
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Mar 2026 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772378743; cv=none; b=siUwFpUYn5YU0r06tEqYQUvraF1B2j3TJxHRRJ6lynIDIVsExqw8mIPKj9v5NZ57wQdMNlW/6thscxDCHLsWBUgvZpSSKDqs6QpdETmBZiQFBWvFov4TjVjKezT5Fne1Hr9xDyi6M7ZBTkxp8VZYkmKdqZyS6ENcTbu9lbb5m3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772378743; c=relaxed/simple;
	bh=h6ocFL3/AvWAxocLlDGq5zzcmvXEVH6KytUwtl0c0pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dvphOwCAP0TTLB2X6awIJBCrcS8Gc+kzowvu/4++vmQwCtXMm/jqz1vFPb7D/zrRgF7rZQ1cnan20pcHCjBp3q++nIMMmjIt6KKa86sD7EJx9zJ5dICGiiTJGcRN4P1vbOfixaS47Sybfj9xQY5586a654Bekkfl/bRsAmi6CPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLlmBuHq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43992e3f9b8so3783152f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Mar 2026 07:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772378741; x=1772983541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Toq9rLJJmJQabXGJtB4h2P44C/ETgp3YsbTV0+WroY=;
        b=pLlmBuHq2piOfScEbOJyHI7LMNSuvGzPoBsVWl9QULJLxBMMDB3aezAQ4X6/DCa2oy
         eoJK6/0dwt0qlyMSKfWJI3lqIBmN+CqUY1LXQpbFzrfjpgU+mpC6V/2lVYcWHchH1NQG
         NSwzg1zv1/1p3/u5azmxyChN+MCYkPtDNOxNYsb2n+H/Cr6qX9wmTBk4yDjr6Z4XZe8Z
         0otOwGKlKrgZxEM/mF5ugQVkvBhwDsuE3Q84/W4+XFOMvehaG08bOg6g2luQX/2NkMle
         qy6h6tSodHGIezj8aNJxgFGPIPWCvYR/t28AaUofhTrX8OreMIIl+mMztNOZheizrP5J
         SiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772378741; x=1772983541;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Toq9rLJJmJQabXGJtB4h2P44C/ETgp3YsbTV0+WroY=;
        b=rT80tgzT0hEAUqn5zGDU8J2fH8dKjBuOdRiN+MqEI1nkbcq3RWGCrNF6X/lHCamBmW
         eVE9yMsoTExTP8MxdfeCK42Lp+aXmxeO0Qcz+/hHLOd+bEbcAPkRC5SJamGGsFhg6SVP
         nv0uGXf5QPI/qDxUaAt5Y/dTlZYJGmVQnhTRv6bZH7NOU9e2KdQu9e10+MzK+HvUNcQM
         xuEtIGl6O6jINVTiODaBrikaQu53rttkmguSRWsiLkpl2dzspIs6vqfAn/KEaj7wWp6K
         fWU77dMb2P4dT4rJX6ldssmWLyCE02UHvDH9YeisH4WirfJzbFc22ZM4be+peY6dbV+K
         tXuw==
X-Gm-Message-State: AOJu0YyFbcMp2G5ua7VqRWEMvUZtlMUDTiKWMPCzA+1mmOCKWlx4iJA7
	hsVtRShTuMn8F3JJHHtnwo9+KHnMKt5xhHbo0Cclp7itVVrbob3mT/dE0DXp2HgvkkU=
X-Gm-Gg: ATEYQzzmuZ4gAZD9doeVv0Rxo5OD2hQ03ACz0GtdF2R2Q2oBI1+jvzi0unMNQcPh7jD
	bxJt9RdmBncMufFQfx8pXgv7MRPcFA8jUbxDHRhJ/iei7whHfTbE+v759rwNQw4/2Armq+TUuRA
	cZQtLC8zoX7TsVQTb1FtA2kQugekZLwmwFMDzOGtjJXmxs6zkarT0tAyWydl2WtwdwWCnIdbhtK
	o2rkJO6atzVDbha0xGlFY5qmLVWMiyZUx/Gug+iKJVzqGBVyvtx2P7Kjqnf8bsbkoNEADKdPyqN
	qkew3XoU9u1wNIU83GwFmDii8/0TpmYJFTwCCwL4us3CCRWH5MP4+6mku7gIjuiAX9wDAxQFtUh
	TVR2kywMlIGmx2QvQlHfVRaSiUZuhuqpbNNssGRkrYDamXNzaJM7wLsQbB+8xkqJ7bB0m51Hiw1
	MpxE6tH1fSKhvgKzVghyxmHCgK16A56//P23uH6amwoXaEH3D/WX2gOiAErYR/15Nn
X-Received: by 2002:a05:6000:40db:b0:439:b60a:b400 with SMTP id ffacd0b85a97d-439b60ab4f5mr2117824f8f.31.1772378740601;
        Sun, 01 Mar 2026 07:25:40 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm4272236f8f.39.2026.03.01.07.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 07:25:40 -0800 (PST)
Message-ID: <11783570-cd00-4bec-9f45-65ff4e8eae19@linaro.org>
Date: Sun, 1 Mar 2026 15:25:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add
 ov02c10 RGB sensor on CSIPHY4
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <7177764d-fff7-465d-9ee4-f8e6f6455787@vinarskis.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <7177764d-fff7-465d-9ee4-f8e6f6455787@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94744-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 40A2C1D06AC
X-Rspamd-Action: no action

On 28/02/2026 13:05, Aleksandrs Vinarskis wrote:
> It probably got lost around as its been a while since last re-spin: as
> discussed in private and reported to 'issue' in Linaro's tree on gitlab,
> these are wrong. l7m/l2m/l4m are regulators used by Lenovo t14s, confirmed
> by device working and via AeoB dumps [1]. As per respective AeoB dump for
> Slim7x [2], these should be l7b/l1m/l3m instead. This arrangement was also
> confirmed working by community members (see discussion in gitlab issue [3]).
> 
> I have previously submitted a patch to Linaro tree to have this fixed [4],
> feel free to squash it with your changes.
> 
> [1]
> https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/lenovo- 
> thinkpad-t14s-g6/CAMF_RES_QRD.json#L117-L155
> [2]
> https://github.com/alexVinarskis/qcom-aeob-dumps/blob/master/lenovo- 
> yoga-slim7x/CAMF_RES_QRD.json#L116-L154
> [3]https://gitlab.com/Linaro/arm64-laptops/linux/-/issues/9
> [4]https://gitlab.com/Linaro/arm64-laptops/linux/-/work_items/26

Great, I remember now.

Thanks for the reminder.

---
bod

