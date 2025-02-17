Return-Path: <linux-arm-msm+bounces-48193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B644A3807F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:45:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3327188ED5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ED521766B;
	Mon, 17 Feb 2025 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJm40Mts"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309D217657
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789074; cv=none; b=YQe6xOu+McCYzufcus68OSgL8cG+khAMVGUB2eMqH5q0TcpLfpDnixzgKgfMzfUCy4kdXY5iBQEJ27Xrjb2ecEwLS2qVJBe7mrfAO7S1f/4aM735fl2FGdsLy5D4ls0ysaHlmXLbckI5WtNHyL8ad3oz89rOGqLVZ3XpijQjT+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789074; c=relaxed/simple;
	bh=lAVINVnHlWjTWaGVpFZbbokZJSBj5vEpW5VZeY4f3Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QW2CfAiGQGMOhxXp2UM8SnJiF+kMXV2OHDZeM0vgSzzTsGL2dY8HjY3gwhPWmRA3f0LVLhji81w0h2qwBXfoAgxeA4Bn5cBRQUIY3MIttpFCkcSSLJDb2BnJ0MXL2kiWTjBrn8hnqwqzvNdNHgoXAN9EoI1cVjEQQk6vaVsUcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJm40Mts; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abb86beea8cso253519766b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739789071; x=1740393871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QEbDsC7zOesvvA0J5tAlZE6+h1PCWgc42liU2tI3McI=;
        b=wJm40Mtsm01IIjp0pJOT9kUXukQqG0N/QpN4wHm0TM361GJW7JlaAgT3oyUTjIUmR9
         qImGSRYTQStQPs3aewejzhkhbqgzNANqZ01ON08QqiD173a7oSdoQJezq9r36rVNu+tn
         S7NFB8wriv6dZdZJHuoxC+4HVhJy7lO2y2DWRYggtzZ5pWGJ8a+WM7Il2EoApe+s3Q7c
         M+XjuBv4OrZjf0tn1i40Jn8MuRh0362PKZCrh0gAEDBCIsNziAVqk4cYPEIkZTQlTY7Q
         T2XLazv3HeyFXDpstHmRg2pRWvSu0WNwnYElogPcvV0U5EO07GxRo6fVmLra+OqQVBA3
         Rrgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789071; x=1740393871;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEbDsC7zOesvvA0J5tAlZE6+h1PCWgc42liU2tI3McI=;
        b=pgNBtURkvkiX3ExCSz5iMj5FBPRp5b7RrwET0lNFYQWQ/noBWXHO3yIWuNNk9fpiGf
         lLoLqHi53oQSPmUAaUrWLXc+0AmaqK9eEA6568xQK466uZWtFdMnHHZddmkCLfxjB4Gk
         2ZQW0OkB41smDAa2+u9eO7LLtIs8NHzKz0eTQYP4Ucd41qauxs9sAm0T2oB+sT2lLocl
         ylyOdThF84wVk6mjBZStAz4zfBlJI1LjCpuhCQUSZgP6SuT3J0B3TTHjWjNKDGfX7xe5
         kAl5w7AkazEwkf8LATKnU21Q6jaFyAVm64LpEG7yN+WZ6fMw+ogrr82BXJVTC5P8Pn5p
         j+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmqJhGZ3OnDf/wEh/+bVoaYroQMi+X2yPFpGfokj9O8ElUQnYJ+2HFXruzCAhM2x43qxPLYLVIEc8BClUH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0nM/ijH78GkTkv5m6Ko/56/tqENPv4gu8M/NqMC5mxOq62CoM
	59aG+WTE+Y2TypN4jLu6k3mM8d6GpPOpwrG2gyN1ZP9uuxyLJ7SRTTMMqZ2SzBE=
X-Gm-Gg: ASbGncvEReyXyNH9BbYS3rsATq1eS9dwruvyOa1Nz8HVo8lYJZIxXbXEE6OE0BgrCGn
	THF4o+Xf8IlW+vxbnNkii0p1YzXdVdsfo1ew8wqIu/dp2mqhFcYG3jJBF5W2A8P25TQO4zz5byQ
	Ih5DBRehiQfhF+6pTdD2U/GUvjaOJM1Pr+bKwtsaSV+6Ccvw82+2C6SNbV/fV2bhPP03YNVVLmu
	iXqle7UPlMusiDBOqqJuOty3H+SivqrMxDWsfSlDowbTHLBwFKXdx5DOmiz2sH+YO+WeO9KN1ld
	7cABVakPLgYYAJyQU6zvg0Y=
X-Google-Smtp-Source: AGHT+IE+qR+XkSpEa4n8UFFb2YUXaqm+JYBZqs/0Cfmj9Y8tSfbfIbKyD0WPukltsMDTzYdEa4UX0g==
X-Received: by 2002:a17:906:7312:b0:ab7:ca44:feb8 with SMTP id a640c23a62f3a-abb711304d9mr1001080366b.52.1739789071395;
        Mon, 17 Feb 2025 02:44:31 -0800 (PST)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb88c69c1bsm330535466b.110.2025.02.17.02.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:44:31 -0800 (PST)
Message-ID: <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
Date: Mon, 17 Feb 2025 12:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
To: Johannes Berg <johannes@sipsolutions.net>, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/17/25 12:23, Johannes Berg wrote:
> On Mon, 2025-02-17 at 12:16 +0200, Eugen Hristev wrote:
> 
>> This series comes as an RFC proposed solution to enhance pstore and
>> devcoredump with the following functionality:
> 
> ...
> 
>> This patch series attempts to solve this by reusing existing
>> infrastructure in pstore and devcoredump, and provide a copy-free
> 
> ...
> 
> You mention devcoredump multiple times, but it almost seems like you
> don't even know what devcoredump does? I don't see how there's any
> relation at all, and the code added to it seems to have no relation to
> the actual functionality of devcoredump either?

At this moment going through devcoredump is not something that impacts
the idea of the implementation.
The whole reason of going through it (because things work without it as
well), is to see whether this has any kind of impact or not, and if
there is any kind of fit/reason of going through it.
Devcoredump is involved because the whole core registration is similar
to a core area that devcoredump could use.
For example, would it be interesting to have a handler going through all
devices, and have the dump areas already registered ?
Meaning, when there is a request to generate a core dump, one could
directly dump this area instead of calling back the driver, and provide
that to the userspace instead of the driver calling the dev_coredumpv by
its own.

> 
> johannes


