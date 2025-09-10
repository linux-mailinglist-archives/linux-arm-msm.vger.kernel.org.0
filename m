Return-Path: <linux-arm-msm+bounces-72997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B843B51901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 16:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AE6D1889A01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 14:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9795322C6C;
	Wed, 10 Sep 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x5rKPwR0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B0D3218C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 14:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513342; cv=none; b=UPLTR2dRIykjWYqbEcIj1wwZAgFENDFt1MfXWbGlsu8DraV+GNpA7HLLkFE2GuuP1C/2NpTiTr3KlXt8ZsvEeT+ij4Lpj7glplBxSM4rI/Ib7YyaugKr1z2MOobUowsnMsuLTHwNjTfSLQm53bUjf3jX8cOlpTWmh88j09aMhE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513342; c=relaxed/simple;
	bh=jyWB+tQA8G60dRJ1a/3JvX4zUlNMFVNjVgIRaHfH1XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGN79jyBfRbuSXzQzvkS+1F1zl9zbkeitGlM8DsG7rsVeCZE2fRqgHGHbikU9H6BOn1oa9LiJGu/Zyfsj+ACtXmV2IoW8z/uRLfILWpzhsz7OnNtIR+UkYLiyCR7lNGBdtXjQh/8a4h5JfGoNYIe/dB5IM12abq0UWC1BuDv0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x5rKPwR0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3dae49b1293so3524085f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757513338; x=1758118138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhI8c9fUpWOPpWCEzFMrs816kFgN9hDlCR19oA75+ZA=;
        b=x5rKPwR0ni9QYPahflyh7NA9BywfQ1qQ5La0+gVuhhZeJ9sK+AEoUC2X65Zx7lLWEn
         jqDPnfC3wtM+wkkqU7qpe9PoAaz1huAyCIUlJukCawdssv6AFIY6Y0Sh3tu9exrUniRL
         e0YhXb/VLJeaHd0idlMr6n2e4yABsciHBWwZP/6Xs4JBgPpx5vWOPqGDiPWXS6jUWZL3
         iSFI6cSJYaNYpKLZSJZ8bzBd2qur5DiR/po1Be8BW6TXu6Io1Yc9KsjW+3xMK8RqDVKI
         018cxnb4eSquZhCnwYXqDrKgRwyntTleHA2nnux/g0swOd3BWmkHIrJ4GAvWPricRrKF
         ToDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513338; x=1758118138;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BhI8c9fUpWOPpWCEzFMrs816kFgN9hDlCR19oA75+ZA=;
        b=c9VOkgSkslZgtDd+rZ/fruYxUE2o8OgdQDIQKiCzgKHl3MToc2ZKQvlRH6x7csOllt
         c8qMyHBt5JhGheamNV57Sq7iGmzhZ3sweUzbcgqkiBH/gx7ZNdlfaVNfovWjK88g2iio
         n+UlQtVr5j9tR1XLzxAVShguzgXC2R7b5mkIakFy/H4a9vR5g0klIosUhf1GspTWCli8
         hzL4m8a03meezltUb9w9XIzzzpvIcsA5XbUAAQ9DaVfAqFvXuiuO2Iw/0FDYpmlEuZSI
         hCaQTjrfuqzYTH+fyloeolcvsHBJE02UvAp2aaqgoaozPkalSw/yNCIg5F9yM1r8Witj
         tMSw==
X-Forwarded-Encrypted: i=1; AJvYcCXmrZVwDo3pLe/w1MJicwRNYkRgxgpCH0g8Jx4QTAfTCtrrSS6/V/oeYIOCYMBVZrENYrkdxAsSHz5wIpYM@vger.kernel.org
X-Gm-Message-State: AOJu0YwuPoXCua1lQtDiDpKDVUjPw6mJuZAYpHXCJoqZv9JiC43LX8Ja
	E0VqM9GVgP/gYCAKJpd7x+2Hjh+/yJT+APphkvZfguQiAa/8YBnHJSLuAGhTyrDA1PU=
X-Gm-Gg: ASbGncsmi/rwkesLqVRVPIt45Vm8Kc1+GcwcIF0WdWxVbwLcaEhVn/2hO8H7coxIa/8
	4g1FEsFITr1mUO57NP6EP0Q98nWxD4826a9nxfFXoyZJhzr+Q9le27BdodXvGUBSJI0qKdBEx7K
	AKaT3OgzJ+B6vQqchdwRYaBES7OgQvb7oE/JbCGh4uaW53ZUw1BI0bIZN6j5nxGiHaUIo5BI+Sx
	ACNQq+AlNq+NLYPHrsL3BX/Gd0oY2olo/fQJ4M5UlAMnchyZjPKT5MzVFCEAQHdFxDOfjrjWcP0
	TqDMRd5Bp57u4a62Ekp/+lfmhuzybuo2nvlBSbob1+Q5oH2NRDglaFSEFi5BV2pRKUr2/DgJzXL
	UezFQbIacFR7kKYW7vU/IVXNEjZ1Fnl+iXL30B43BApXDyzgKwX/G9mlRDoHnBSqxETGlGES0II
	A4MMw2bWDm9L6OCdkiiJ4z9uf+oR7pVte7+ajgZZI9
X-Google-Smtp-Source: AGHT+IEU0i5tKvI1IML6r1qb9OCYAjtEaa8WFITlkibEW1V8pMtdtSftNzuAhODsfk/YrIRjrT2cRw==
X-Received: by 2002:a05:6000:24c1:b0:3e2:ac0:8c55 with SMTP id ffacd0b85a97d-3e643c1a48cmr13509406f8f.55.1757513338089;
        Wed, 10 Sep 2025 07:08:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223ea04sm6916892f8f.45.2025.09.10.07.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 07:08:57 -0700 (PDT)
Message-ID: <e72800d4-cb65-443b-be7e-0966a60fa5a9@linaro.org>
Date: Wed, 10 Sep 2025 15:08:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <21ea1149-9b61-487d-9afb-d3b8b41fe71a@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <21ea1149-9b61-487d-9afb-d3b8b41fe71a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/09/2025 15:07, Krzysztof Kozlowski wrote:
> On 10/09/2025 12:49, Vikram Sharma wrote:
>> Add the compatible string "qcom,qcs8300-camss" to support the
>> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
>>
>> The QCS8300 platform provides:
>> - 2 x VFE (version 690), each with 3 RDI
>> - 5 x VFE Lite (version 690), each with 6 RDI
>> - 2 x CSID (version 690)
>> - 5 x CSID Lite (version 690)
>> - 3 x CSIPHY (version 690)
>> - 3 x TPG
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> 
> Fast review only as courtesy to Bryan:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Next time patch which cannot be compared to previous version and has
> broken threading will end up at end of the queue.
> 
> Best regards,
> Krzysztof

Appreciated

---
bod

