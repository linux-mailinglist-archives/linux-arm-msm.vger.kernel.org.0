Return-Path: <linux-arm-msm+bounces-45954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750AA1A310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91AC4161265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB1820E314;
	Thu, 23 Jan 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruBZpmjx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B2B20CCC3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632218; cv=none; b=AzSU5QX7T7Hy53euEAlZA8pP9tC21lpVgFlAbpxqo5xg/Mi1lt7XTIO0ytAXcwYj8UDo41iHrhYg/5ezKcvz960WDUYmVUVdR59nrF88HjHvmlHW+yOv3XzdKxC3hzgZODz6r006ZlUlqUG92Iv3ONcL5v3QxRNjMmcaix/x2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632218; c=relaxed/simple;
	bh=RdI6IJceYHWNDjwXbPHhGrnfntTwaSLvqJY46KDpWw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGxxpLF/cSFQ9PjHgEObSD2r6aaEFeE8QfLRnqmVpXMdWNm39utTVpn2oIZcEsPe3teQwlW8BIBouMzek9EUDdgFzB1dwyoEDJ+C+vBJaNqzV37C4qlLsKxRUX1h8amh30j6FqcnYUbABr3A2z7/9YZTc38SNPibYNpn+D2MvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruBZpmjx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f796586so8003475e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632215; x=1738237015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdI6IJceYHWNDjwXbPHhGrnfntTwaSLvqJY46KDpWw0=;
        b=ruBZpmjxkoV7rFM04585/V49ThTQUAvaUoPIQlGJWzO0nun0ewjdroUriFWzt1Lc+J
         0oz5R6UpXdGTTutIbdN1FSY2bAa9HbGnDMgosAj3hVzXMICzRUQRoNYHHZjSurEiAGN5
         j6CfxreKvhybXuVx2oY++gxygIOc+qpDt+SOkQ1AodfLMzPwPhdr99/gcfFwQ1T1C4u9
         YiiPlUCVr6H5RRgI66JSxopX2dXm/TGa/AcE1Dt4BNVDzp3NgdAUzAGUW2hF6Ko+7v2s
         TXZ/PDYoPuenvzpPcuyHFClX+0Fq1hvVzWb0cwno0Nuz0djvsaazkigH4fSA9uh8fw/F
         RRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632215; x=1738237015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RdI6IJceYHWNDjwXbPHhGrnfntTwaSLvqJY46KDpWw0=;
        b=TK3UYKaFhfPvxskjxveZ5N5ZunC4CKugjIiPS0Y2HjHCLFI4QoiVPs4MYXiMyKwYMz
         auG35cbdJ/ryrrFJIB4pB/J2VhWqLkBgYfCYS+WZOWavHz01FJG8ZdmvGBoJ7N8u4huo
         Kc9bV8mLRve3kN5C+5x4exO6au/TuqWNKsDPCiGi3tfYLwT9QXL9MalxxKdpNwc0eP4i
         MuHQvyhZJ9ur9kpo656zXBalYsyxm+mKI5s8vx7wHvzQBcOe8T/FcMKtVmsa1KbjNWnq
         oRI9CmCtGtXOUI5h35mQnLFz9ANSF9gD4J1xc89HnSfIY7+jkiJHCgxvF8ImG7VggN0H
         nkJQ==
X-Gm-Message-State: AOJu0Ywo6Ktrg7iawCA6jjn2rHUh5wgfDrHfAe27lKgEOzWNhOKP1uTz
	epOCDyTECHFzxi/sGzuORjWzJKk+tNYxasex+/tlGYlGY9O25L8aqxWdNXA6vUc=
X-Gm-Gg: ASbGncvH/r5ul/e2VD2hIuK49/hVfdFbPE+ynDc1uJ2axi9xhQdICE0kQv5QmuJRE1K
	HzBpHayIec21+KKMmKB+y6DkqH7ADzmE042R1D+7jQ99k3e6zF68dC/hzYYbbddKKiYCwpCwJtH
	hmV+Zgd658gOOTglu1GqIff+cesAMR8Z02MwXSE2Sr84CHx682Efx8FTMXoGYKWLybJnxOEJXzC
	lfOg6qgTon/hULu1O4Rn2Wyhv0HXLOXnMFlOHGMkbEIKYZYFwBej5vzD5y53n5zrUOA+KcNft33
	e1Kl96OiqPn7+CS1rQ==
X-Google-Smtp-Source: AGHT+IELUBxDoirlNG9SA4nq62ZMYmDw/0cKfHcaM4E/mFo7d2pn8cQOe4FUQ9oLCcMRfxLaJHQO3g==
X-Received: by 2002:a05:600c:3548:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-438913c6150mr239518495e9.3.1737632215254;
        Thu, 23 Jan 2025 03:36:55 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31c6fbasm58088275e9.33.2025.01.23.03.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:36:54 -0800 (PST)
Message-ID: <7f8bb83f-aa15-4a58-baf4-6241b479b412@linaro.org>
Date: Thu, 23 Jan 2025 11:36:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 addributes
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Keoseong Park <keosung.park@samsung.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-9-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250122100214.489749-9-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/2025 10:02, Ziqi Chen wrote:
> Add UFS driver sysfs addributes clkscale_enable, clkgate_enable and
> clkgate_delay_ms to this doucment.

I'm 99% sure you mean "attributes" not "addributes"

---
bod

