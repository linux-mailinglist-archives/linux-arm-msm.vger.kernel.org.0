Return-Path: <linux-arm-msm+bounces-28329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0DF94F13B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 17:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AD361F22CE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0081417F4FE;
	Mon, 12 Aug 2024 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sbD9cVYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2175717C7C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723475031; cv=none; b=ZsMYbGVFC3ocXjrZpjZ9bQ2yRVFVEOSuXxB90fOvuXnpVyaGShIPeHnYt1vNMomx982ZuE6kOXCWq8m416zpOJpiFchdF0TvsvrWUYS85g+1BGELc9sNCReoWDjTrVe78yrAAnqhcALy/sDspdBpdbGC0nOgGajE5guefIykoEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723475031; c=relaxed/simple;
	bh=Wxf95/7xZrC9XwE1yk43JofkaXpWLc49atap09H0tog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQpNqHJ02m2IVal2mBK9befGAyTFJLuG1KvbEXlciyS88QrFk0KIBM6oREMZIuQGqRe02jHyupJo7F+4ybQyzUxoQSMMPWzB6unW3hSsc3sD3HjQ90GH+P/vV028hu71D5zoFQ0KOXWAmp71rK3wV9IHn5f7UclWobU+52AZokA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sbD9cVYc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428119da952so31602785e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Aug 2024 08:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723475028; x=1724079828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wuDQEzhLbfCsKb872rcJdwN1AQNn7kR/XWS1IhrM88E=;
        b=sbD9cVYcmlU7ja5p49iljhJ6PHIBXh2/nHY+ZcHRm+7TxPysqUvxUWhZxl1DPG8y9r
         BRhwczEUoRYnjcNmtl8TfA3ck79CDEKj+87HQQOMIiG39QOStzVGnoV+Ng6ws/bFHwll
         VSeMqThTMjFyn0yn9uhMY+90wj+SH2OgEybkWpRNaTFXt3ue2lzxd2ROhHCRhvn1OD9Y
         Ah3UsViqhRPsICg3G7znM3BcWuCNrGXkZbaqCTto1/sgk6mQT2mq3uIPJPng8lxZW+3w
         QGH3BjdARsE2kFyffVgi1D+WbzcrP59DQL5IwGqD+zjTqe/Acv9QaOxB7ZQq7dW6i1IK
         s01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723475028; x=1724079828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wuDQEzhLbfCsKb872rcJdwN1AQNn7kR/XWS1IhrM88E=;
        b=OE3jiP7pBU3WzfrCM4YzSCpTi4CSrpPfndWG1V5+Nq+JtLlhdLwz3C7ysE3OUgVk0G
         dXC1SxPl3svttUF77rvNV0e2OCsMJXSNjvZU7jrAA5DI6JxvDUWT/rJgB2ZdH1yeR3d8
         BSK11nEmFov78o8++m3LPsgNISyp4p3YQTnI+CPQqwWn0g2r3ENrJ/I2UAg8khoLGVU8
         r55zT/tVuCgmOlbAvzfkqyzfK6ilaYSTsK6ug77wHGIrXWS1000RHNlmoBu0NqSPRDMt
         CZb5HNK1IkROE7Ew3tvmUSKIC+ltJ5pMlXQjlto3Smi0awUuYZmCMCWZlEn1thmifkpR
         3UiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoFmX0pwZSL45mjCIGvJUol3Rx0r2JqCa+lsEFv4ECqGtMStq4MshifX1Gubke7S+Bjog3gkBlQsFT88hGLP2vJXN5V+53jOE06k88tw==
X-Gm-Message-State: AOJu0Yy7w131bhYybYOVXW2aDxv2xnBKKfesL/38uXblz+BtTRzk18iF
	sTArBWBRshppvp8Oht+1gLnRCARzp98ZoGpI1k/JzJQW/w702dBuwLk8Nd1PkZ8=
X-Google-Smtp-Source: AGHT+IFFSAPnFh48tuuyx4nfdB94kZ30QIZLHyrA1XRTFHdUoc2QgON84c+1iAy9mgLSRlwf3h/aRw==
X-Received: by 2002:a5d:640e:0:b0:367:880f:b8b0 with SMTP id ffacd0b85a97d-3716ccf0559mr440023f8f.8.1723475028315;
        Mon, 12 Aug 2024 08:03:48 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4cfeef61sm7762167f8f.57.2024.08.12.08.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 08:03:47 -0700 (PDT)
Message-ID: <0640d530-404d-40cf-9737-0d7468dd0177@linaro.org>
Date: Mon, 12 Aug 2024 16:03:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] media: venus: Remove unused structs
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240618-cocci-flexarray-v5-0-6a8294942f48@chromium.org>
 <20240618-cocci-flexarray-v5-1-6a8294942f48@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240618-cocci-flexarray-v5-1-6a8294942f48@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2024 14:37, Ricardo Ribalda wrote:
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

I realise I'm going against the grain saying this but, I believe these 
structures - which document host <-> firmware data packets - the ABI - 
should be retained in the header, even if they are unused, since they 
are documentary and potentially of future use.

I'd rather fix the WARNING than zap the structure.

---
bod

