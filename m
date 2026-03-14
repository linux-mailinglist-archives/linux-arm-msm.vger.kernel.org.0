Return-Path: <linux-arm-msm+bounces-97668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KhnKE2zftGk1twAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:09:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AC07928B874
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 05:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 509DC3021D30
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 04:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3F632E121;
	Sat, 14 Mar 2026 04:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIFypa/m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B10314A64
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 04:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773461351; cv=none; b=C3P1T+o+U32YC/0LpLncKByYSHaHnFcHdPv6c7e0zjjlNftBFjg24FUr4JRpfNrNP400nDkoX2AZX9JXD880Ib8UoRfeDw6dS+g6OqT7CgYijz2nl/KlZJMO10SWpC9B6z7zMuefyyVcmA66Nz0RxxVdf6lpSptn0/CTNxHlgeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773461351; c=relaxed/simple;
	bh=PJN4+9Mca0Th0PJtmzAQpFS+PGYcX6JdGcwqPdpN9ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYQQvoIenn0U5lOKTwHVY/whr3KvLT2eswbOkANmYOuDLYPuK95T1WNcI1qYj6rZZaVjIaQd8qACyZtQy0bILs2avQZErw0LQ5AHWadM7UZhydd+KnhIdtOXkNuPR749UtKfOfYogSAgu2Wbt5Nuox0c7ZMtTtUcFG3s26lX8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIFypa/m; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-485392de558so17552505e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 21:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773461348; x=1774066148; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJN4+9Mca0Th0PJtmzAQpFS+PGYcX6JdGcwqPdpN9ew=;
        b=EIFypa/mJu7qpKhQJN693xvhM0oQS7HOlBR48/cViFU2Q5PDhkGOUy+uJ/TyqIGFQJ
         iasDs8h3NJ1o0iCDWvemmqfVDRgDVSmuKQkVSHK65GLYbdVTGV6kzt7zbe8WthC6DORZ
         InnshsedSCIelSwTICuICDS22Zwhr+khW+4RxC4DhB+hPgnh4h6WW0+QFh+sAxHsJFw9
         bWSayoETx0FJmPzvAgPPmzE/J2p6rzOqaGpzKA4mCdWAT4+nUJ9bkZraYYX8lguvbAqn
         mplUiU3UuvQPfxmZyoaLB4ftbDc4n7/B+TZpECuvDjzQxnCkvGVlGl9Ylf6F/ezQfP2I
         /4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773461348; x=1774066148;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJN4+9Mca0Th0PJtmzAQpFS+PGYcX6JdGcwqPdpN9ew=;
        b=cVbjm31Z9ROT3O/7m2fYerv69wmDpyqzL1B/rV26g0J67AUjcq2GE+ObqESZSJJbLb
         gQ10ZfUXT0SvguPbeOBVII4GpUhJLbcglILUaQg/M3on6uYJwnOnCs1f6KfQeqZqvO6V
         xPyLYsFEZFwrxbdfrjm4iTmq5hq33QxufAwSWDK9M4E7/xf1NfOon+VtGbt7cMnoxnZ6
         51I/Vc6mUzjX7IrTIHIGUhaWjG7cHiBsakwKwfpfKbKHbdJ2yh02oo+uhwvdImxoMNre
         EziPSz0pgIatqlZjRn0oO/QhKerOSi2uAG2mz2W/Ze1G/lnlm2qNf9wKT+hd4iG4oqu0
         JzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9anLKhBPyMRLeNeAy1UH2QxLj6MTRzfKXW9VIGgowLKgls3n7yLjov0L3pKyvDVF1QJFEEYXQmXt8NMjE@vger.kernel.org
X-Gm-Message-State: AOJu0YyQA/64MgOMFiHYs92OBAf1i/WDXA8rCa01251z+CJQxNKmiRP7
	e52wnj+NXQHSBqJt0bsoEUcVAYYxp8dwB+g7N5hMTEzkO9VsJriF7TVzljpRo9frHkc=
X-Gm-Gg: ATEYQzxtrHcvIlPFCD1NRsxmsj9Pp4zpvBwj6Tac2OGmuxlhwqQBPU4NjjXvCtl274U
	uAZ+kD3TkNxe5ORiFzes9WqE/164afeTSovUij4dwuBFy84KnTDaEaKEfewizWhvI+xjvf3Wpcf
	dAZHYE0Z+l6/9YXMUQpflBGWN5wSOeSzxBa6nlGn7x2iiFUGOpy3Fu+bOIvavqw+b3dNz4FU7YZ
	TekM2Ce/rvTxrotRwHQVA5pRJxU8B4xNJfY3JS14wn8PWtJy+MTLZwTSxotTjxZaFShF7bda9xZ
	FVtA6bc5eJydyHauxNlbnkm8QVMyGFx9gMV3p/u1qPZZqw3MZu7h/z9sA6vHQmi4BoFLVM89GxN
	V70D/K5T29JWZoW6YoqQifUZR5+Rddc149m0/Y4H/BcwFpjxegAeu5Da8GKkNEgh+TfzJZ5Y+ar
	kJi8C1Ck+TNSt8FSGGh6XpmI+rKzQ716mdtOQ=
X-Received: by 2002:a05:600d:6451:10b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48556705319mr65207605e9.25.1773461348314;
        Fri, 13 Mar 2026 21:09:08 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac34sm23085560f8f.3.2026.03.13.21.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 21:09:07 -0700 (PDT)
Message-ID: <ca7d675d-139d-4fbd-b57e-5b233a0e2922@linaro.org>
Date: Sat, 14 Mar 2026 04:09:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
 <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97668-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: AC07928B874
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/03/2026 17:17, Dmitry Baryshkov wrote:
>> Fan Count == 0 || Thermistor == 0 => error and probe() fail.
> WHy? EC is still there. QUite useless though.

You want to register when zero fans are found, zero thermistors... ?

That's a bit fruity.

---
bod

