Return-Path: <linux-arm-msm+bounces-39570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD99DC2C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 12:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C64C16391F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 11:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BBF199E8B;
	Fri, 29 Nov 2024 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCRIb0eL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BBB19922A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732879413; cv=none; b=S/YcIJreY2r+EoqUYYvJYlc3nlQ+hWGbbvV2C1eVrh+pW6Az35o3J22tEhEfAfK8S5KdY5NxZ/WEpE7sulJ+6I3SJJnqeUZSpe2rC5yavlPKLNtndpVUvjdR5pRmk/+6CT5G5TZ9Dcbvt8rkx0itzmBZe9LmbC/feyB18wmx2pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732879413; c=relaxed/simple;
	bh=HI5FQjIfiAkbmFy8K6SF1Wgbfg+NQpVtdyas5DXYWcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6nJZ1nQLCQdaoN2GtWCZrin+cKxCgB9+8RRW/MBNoJb6jQcWLwmg1VtDBpfiRzKRo0Xr2RKSSbP1ZNQPuwUNVVUPOYqfBiFb/q5V2igkzj1y+LIkEtgfuRTVSFfpYsMzWuJJY+MYnFeL3N0a63uOeHoEcC7gls6LP8UeEwjE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCRIb0eL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38232c6311fso1281029f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732879409; x=1733484209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wehBO9wd7/4qEClAe5Z+1iGP3dGbLJy57UrveIk2Hpc=;
        b=TCRIb0eLVfJZfBu2eRcX4tqBOCUTp8QcFS1oVlVFfdxllJ7Ta+WGM80fj4tfD+FAKS
         6amCjjSndnZp3qBuXmy4lZzBrHD07qvc6W4uCE8WJGZo5uYzsTRxY/6u/K/ty5EhG+2i
         0t23FXp/BXk4oL/29FTgVkVzKvjMW1OQ/rqKTmmOTBbW3QDAEl2BHVegWK/LqFy93R4W
         OytmqD39oP1MCAq7c66M5SC3jgGf1le2R8iw73xW7l6leXmqwM6BhlWLF/I7+SuPeOvo
         PbZ62uLpWVfspmrZpl0dzg5tCGIwkMzVWD2QY32sB7Bd7s9ALFYFLyw1gDUaaroRM30i
         kESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879409; x=1733484209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wehBO9wd7/4qEClAe5Z+1iGP3dGbLJy57UrveIk2Hpc=;
        b=Qzi5FZsblLJIa2zhHzKaD4W7P35nDzoR6sq8tzFxdOO1EIxm4fzfgZsmKfjiiCd0T+
         ogAHXeCkJmUVRvjmoeGf/DYvruns1EIKruZ6h4ALZXBTFxJFQllXKq2mHTa0UG9/dv+K
         g2dvUAoAuhsAK/elT/9m0RKw6gv+zldE2A9rFZMe02mn6cisoNyg9FnR/JlsQPVq2w/1
         AxTmREXeLTcSbmDz9bMmFnvd1TcQsyvPt3bMk5puxolI7dezSBoa0ntlSYKdZz/Ccq62
         8fVAO+Q8zkJuwcqTqGIztzH4VHOlMoHWblAs7EREql9omfWdI2cxyPfiSoA6G0/FiCvz
         b8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjtsHBof9//ovnaRgmmZHyj/grkwa9/cg+dH+y73JNhe7MaG8QGtoI4iDfhNN8NnrgVixshTyvtE/FaGct@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1mNX/aSG0uNlOk90RwBSbtGCTPl09WrxS55weTisnhdggzvR4
	7JrN+Up0rH5Vz50eIkiSx6zdHAUDnEMBYCqLqmQ0aMA4IiOYZ/5tj2eIe8j3yDE=
X-Gm-Gg: ASbGncvaUVkGDkbDCy+dkXTazPCAFpjfK6L0LOvEWyhIunIyaBoK3JMrAtOGJLlt6P3
	FEvA3aLc6h1OA6FXg8/Fj0tDLp/HQY+SYSk9dayotycHPt9Q1OgKz78JBlxMdmTHJ1nlwgukQwr
	I5hJ0C1NfHnWbCBreUW+xqHikKFCtQbRJeCH4lEukPU8td5oTVCschMOwIRE7FV4uCV3sUfv0xh
	/+WnCXugmF892Cs2zs9xql1iZ22iHS/thlSYQ4k1BpKqYE5IYWSylNxWt3qCVM=
X-Google-Smtp-Source: AGHT+IEAXNy/RWJn3Zcpg6BCPHgms/2bmga++LC07nE1WotVMszhnyHL0BPNUcD3C6x+4g0hwK/XgQ==
X-Received: by 2002:a5d:6d8b:0:b0:382:49f9:74c0 with SMTP id ffacd0b85a97d-385c6eddb90mr9570707f8f.38.1732879409622;
        Fri, 29 Nov 2024 03:23:29 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78120dsm80940945e9.24.2024.11.29.03.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:23:29 -0800 (PST)
Message-ID: <02029a14-3cc0-453e-b1ea-ec7dd30dbb33@linaro.org>
Date: Fri, 29 Nov 2024 11:23:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: qcom: camss: fix VFE pm domain off
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241128-vfe_pm_domain_off-v2-1-0bcbbe7daaaf@mainlining.org>
 <3a5fd596-b442-4d3f-aae2-f454d0cd8e5c@linaro.org>
 <5cccec71-0cc7-492a-9fb9-903970da05c5@linaro.org>
 <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d3a8d38c-9129-4fbd-8bd6-c91131d950ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 11:20, Vladimir Zapolskiy wrote:
> There should be no room for suppositions, the source code is open.
> 
> If the described by you case is true, and vfe_pm_domain_on() fails,
> then vfe_pm_domain_off() shall not be called, otherwise that's the
> real problem and it shall be fixed instead of being veiled by the
> proposed change.

Maybe, maybe not I'd like to hear more from Barnabás on that, who is in 
a position to replicate this bug.

---
bod

