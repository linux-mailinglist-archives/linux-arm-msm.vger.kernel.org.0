Return-Path: <linux-arm-msm+bounces-64833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9BFB0420F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 16:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1492E4A2BDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9451A258CD8;
	Mon, 14 Jul 2025 14:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYsinFTu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4D62580CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 14:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752504213; cv=none; b=nYHLkIObPYVhtezkXJ8Xz4YhKM3LPQ1iNEgiJxmPp4aicitbomy0BnJrcJFi4nFzs4uxwaDfSraXFpufoXuUmCI5sj9eUGhY25Y5uKZaYSZd5m56TpNIz2kbOrTr1vaTuAny4/HBuDv8QxGiyzgoO2RDoyOKgqsZ3IVGIi6MHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752504213; c=relaxed/simple;
	bh=+NdErqoSXalIYrtUeTTaieZr8gJQiDPFDzFk2W/aqPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAvSIOI1JHI2qGUXRpsEVFfesqLfcyaQ7ZNEpb3oXbaQLWiA0S14D4WRQRF//ZNDh4ObKH7QJ/eRqGSmoXLyPJ3R6qWdDmge6hrKUpEOkfaFGMcnqR8PiFPM5VRrug1OmpO05+KQjjM2bRRW71kTW6aKylnvo7SEDsExy92UJMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYsinFTu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so12197485e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752504210; x=1753109010; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tkk2ePHatcopmrnLKR6jR3UX6aWlk9GOwUaArm5vOU8=;
        b=tYsinFTusDPSHTHilP5txIO4lvaxYHJfjN716cxYVJWRH3CwBCjd5ydxPxKwpFURoz
         DOnwaWkbjaImpLAFrEHcegwJgeVN7NUCAl0mnpkwJOVFFUlopnyhDFawnyLKq0C4e19Y
         AGTe+KMx31RfXzXmZUBsOxTSygheh08XpUwe11MbZrweRZYS/3bU6MlgXl5uvcZRiG17
         ac9eeVgabDZQjEzJa/kqLaRskFPRMwM0NDzjR+hz8xQTRVlv9n3iaXestxq6PVe6H0mD
         bSRYY5BlEanyr2J+X/oXVvdFC/Jd07Yl1jhKbtAhkyIoZ1mHynNGnBSNE0MuysM1kCxB
         +ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504210; x=1753109010;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkk2ePHatcopmrnLKR6jR3UX6aWlk9GOwUaArm5vOU8=;
        b=k6b12IIdGT0OJg6QQBXjcXcF76yMFbKjH4eBeLoFwVRIzgHRhpyRetPiv+YKsMDP+X
         dOihsXtBcg0bIZtAg+W9ZRSskfUkxbEpfM7uBWwjzO6m91llD0oqV6m+gVu1tw3kdv1y
         +W2ks7bpJKmzicjUZTYEnPY8QFptoDDqkS28aYG7uuZ5Pfg5oYw2tKNywtZdIBOnkLo9
         eCRbjJD69lxRno+XI7yUW07KByJOomB6u6ilbxK4lWZPy9hqFdG3CR7iWt8etUIU8LIZ
         OgG9ovKhS1A6HesuVhgPmw+K1AM9cBHsR7RuFgn/dumANL3bhPGberV+xghLhV34VBpO
         XQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCViIQXjbOFKQLIuqK8fQpivhaUXTpjOH6BmYgKMy5HXYQiSdtn1qJwJqY7jWUq6eg2FrnipAgzqL5Fg31qe@vger.kernel.org
X-Gm-Message-State: AOJu0YxnV9r9wJ6kAicKWAQtzUvbMZ2CePmSTyWL1FL3Af2AeVNwWdmL
	DlQPMs1WcPtdRk2kRPLlc5LavikZatlRvAV44KmRE8/JvX14LZdvuqICGXsRD5RGZ0M=
X-Gm-Gg: ASbGncsYjcxmPhjlU+VU1lh76JGiwSV/9RGPppIi/y3SgQ2AZXGgVCTfZJmxgw0vbvN
	+VaXNt2+Z7thZlKsurOySzF1dBKJi8GHqnwo8k/O/MRlq47sWLs9/To+HiaQG5yhTYZPHNXTm9R
	uCRyGOYj1Cy1OwNHXHPuVl0BV04B8YN7T9gEoMgEEnuxqYi9wSGfPCEtXroLwd5RLpvx+IRZA+K
	AOn0X/PSrwH+p5Yr4ZqS8WA3FmYTb9RUOcltc3j0ydNfsejWMbvwNGN29LriOCAutaj9AhefgJ0
	XNmiszPxjvqTJUZ94nYuwxwFCxJ6TsSuXE/HJ6MDKq5Thwg9Ct6lh0p7YID1fr5VwzxfsA8+HB/
	uzXOS2lOnEPwfQftXbl2YU+h/YrvByDGoQC/uGdEZwMSA+x9OzzdIBlCbwCgfwYo=
X-Google-Smtp-Source: AGHT+IEtm3tvKJdmPSDwmiLwsHPDpBMJTkK2dAnaXapIl0i2sB2r0hRgPP5EDIr3l5jWUsMP16oQfg==
X-Received: by 2002:a05:600c:3e0e:b0:456:2379:c238 with SMTP id 5b1f17b1804b1-4562379c49fmr14225815e9.17.1752504210032;
        Mon, 14 Jul 2025 07:43:30 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5103c2asm171484605e9.33.2025.07.14.07.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:43:29 -0700 (PDT)
Message-ID: <08261aa4-689b-4d6b-bfd2-221c1976d254@linaro.org>
Date: Mon, 14 Jul 2025 15:43:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI D-PHY driver
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-2-74acbb5b162b@linaro.org>
 <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <11b573d5-ce4d-476c-b94c-216d427cd838@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/07/2025 15:16, Vladimir Zapolskiy wrote:
>> +#define DEBUG
> 
> Still under debugging?..

oops thanks.

> Well, the phy should be a multimedia device, and this driver is not
> the one, thus you can not use it to connect sensors and put the IP
> into a media pipeline.
Ah no, I don't agree.
Please see my previous email.

---
bod


