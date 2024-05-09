Return-Path: <linux-arm-msm+bounces-19624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A5D8C19F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 01:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B1371F23ADE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 23:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62D4130AD3;
	Thu,  9 May 2024 23:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQ0dYwx/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19B12838D
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 23:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715297748; cv=none; b=p2E5w9ISR6daNMxcNmmlP46whultHJ2v1N16dFzQ2EANeTHEKaKJaWk1H75vI9QJNCbb+DdM2KLwkisP4bzilIcnMewrkZeavU4Ayay1m1aInnR1ZD3GKCSZ3ZyFYbv0urzwPcKSzDnJw/BcgRF8q7fa3HDzevOYHo45jsrAYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715297748; c=relaxed/simple;
	bh=ELfs6DERZG6TNlamGJTLy8QTFWYUxd9uDNBjBxfK1iA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eq5PvOyxi6Kdt0thC+55rx2LVgL2BQoXTD2gcNaTor5jSeKvBGRxwqaZQs5UfcOa5RXScuToGMP8SyiZz7qrydLKy6X/g7h5RgxpcjMwhEMxE0JA6fVHpv+01YxfD68uH9mndfjBcq4LHUFgArqiOIf82C9cHKADElvzdffqwdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FQ0dYwx/; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-34f7d8bfaa0so1076423f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 16:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715297744; x=1715902544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/yUQhJCg2bpB7CcNZxnvaOz3QKtDIeiLjjPtlq976w=;
        b=FQ0dYwx/Cilm+NVKwOf44WKdE3oJnqbYQ+Cw8SG9ZY7mKcsb+FkfzojcO32tRtH7o9
         YCVJAHsXZr/3xJfZFT2DnXRFRsqPULHmxBdtowfluJdnh848Jtgz8q823gh52w4wumX2
         Y2UAv331ARwu7d1FtiG7m6eJErlaICSwexVeMaFtovVrhgwkLqUDxOJhN/8Goe9r0rdT
         QVleN4Zfsg/OAf/CKfv6L1+DP5hxq7OyTURT/DAwGO0KHYoyjnwqRdXbC00kt1nBib9s
         DXHSnXgNT2YAse7Mael6s9dG2R/iw6ca0e9FV+bnhyzHKgF8FMvoUBSj8vEnSKggux5N
         xpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715297744; x=1715902544;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/yUQhJCg2bpB7CcNZxnvaOz3QKtDIeiLjjPtlq976w=;
        b=bDLc08hy2kFfkIMjrpeLGnrjO2UHNHFrRcSJybeBhne+/Teg4w064SJj5nBlM4sIPS
         h6WS89qduenkJe2NTj15W6MOIktUBy8eN05i9fmj4ERGOdJCRhArarHj4uyiUeGJByno
         RBXNlmE0atMf2BeSSW5Wz0XqAd/5ruXnpGWd0k5R/+taJE6PGOL19gpqQ/S31B4R/ft9
         R7PYbUObheo/7ShM2LdyTAbg1vQQkVUTbEPhkZl1pNhTzdrEhVYhXz1Fl8JXh29gLOIo
         8B3+1pZVp4IXb9cxQZ4KxN0qvjIvJgiPC5e1madsU4mOxfJ5Dk+HGww8PqZ9y7c2+/Hk
         A1mw==
X-Forwarded-Encrypted: i=1; AJvYcCUiYnVag9pYhpkhpYMOgzGDyNHfcx+MZwXX4WUb0dzE1k/sa0RQgiofgzsQEx5/la+QA9MiKI0hgjHX1c90Mh6ttepWEIpaHfCLSfoZWw==
X-Gm-Message-State: AOJu0Yz7/S9Tn/+GqjPqq2FEfFRtyTSPx8yPTqZQURfQuHrVWj3+GSzO
	StqWBH3xHQmFEpLMTjRZI2et6DUz3/IFXzzwYKzUJxC56Or+r7xV0ykesVNZTUc=
X-Google-Smtp-Source: AGHT+IEJES8+m0SqiwzhJWGREAqkK7RFJd6ikeWx74xU9bLXc+bqZv0fVhCa9Z0A1S4zEkSWghS4/Q==
X-Received: by 2002:adf:ef4c:0:b0:34c:f34e:68a9 with SMTP id ffacd0b85a97d-3504a62fef3mr746263f8f.11.1715297743844;
        Thu, 09 May 2024 16:35:43 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baad02csm2870605f8f.67.2024.05.09.16.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:35:43 -0700 (PDT)
Message-ID: <5eec6d69-badd-46f8-9da6-a578d5f7c3ba@linaro.org>
Date: Fri, 10 May 2024 00:35:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] media: venus: Remove unused structs
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-9-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-9-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> This structures are not used, and have a single element array at the end
> of them. Remove them.
> 
> This fix the following cocci warnings:
> drivers/media/platform/qcom/venus/hfi_helper.h:764:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1041:5-15: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1088:39-51: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1093:5-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1144:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1239:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_helper.h:1272:4-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_cmds.h:85:5-16: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_cmds.h:180:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> drivers/media/platform/qcom/venus/hfi_cmds.h:189:5-9: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

There's nothing inherently wrong with defining a protocol upfront in the 
form of a structure for future expansion.

These structures are documentary of the host <-> firmware interface and 
are of use when implementing new features.

I think these structures should just have the "[1] -> []" conversion 
done and be retained instead.

---
bod


