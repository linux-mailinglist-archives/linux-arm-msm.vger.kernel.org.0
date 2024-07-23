Return-Path: <linux-arm-msm+bounces-26848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A765E939C4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C022832E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2C014B97E;
	Tue, 23 Jul 2024 08:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vt9Y7TAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E52313D537;
	Tue, 23 Jul 2024 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721722340; cv=none; b=ui7TYrAWTxGWD22znytFwBJ93T2zXdpNX7CpmrgzN2nc9pLRKIOGmpoJZe8i1994xcHSSJ3hJmRDnLurTNoT237yBQu7KObI7JN6l4vnk1Stk3UzHCvQmdWc7xJxNuvoMWAYLFBFC5fIpM37gQR+GA32XBODU8aGcmOfc42bNiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721722340; c=relaxed/simple;
	bh=Nci5shqAtW9z0JkmjWOgIm73ZkR48ZhIoecaqh1v3o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qJn1sEPdLQ3p5yYAMjYKkeEEYx0CcnboF4AYcbguwpXh0zliKG8MZYUgnoMQJi3tW3mabENAanoBoC4Frut5Tod2vChTL5qBqNPrx0xGl/X/hjMqdkQtjU7rPN1QfXLLdJMp/gitoA1JguzSjoaecbI7maMkgCiJ64YAGpE72qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vt9Y7TAP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266fd395eeso37237855e9.3;
        Tue, 23 Jul 2024 01:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721722337; x=1722327137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CM4w3yMUgJIqK5vukbkmgWzrmH9HIfj5GBxrPyujkoo=;
        b=Vt9Y7TAPHO42cdP9kuxgEHNLIZ18qHVH1S4Te6ITcrEjOdNSWVhDfQurmtvvQ7tQtA
         9kGr1PQygh4djm8RATwwsEM9MDhxXfSRp9tNjOFsVI3fmL1kqxIaUxMN1ieQg97qY4ky
         V5BRFPxO3ofS6Y6D4ifOFz1yDVQ4jLtzZqXbgXiy2kGWWIGX5O0RxH3b1AV6GTNnMMMB
         JQ04SXLNyLVTWhdGrBxWPx87y8tlDiTV6HApXglhzLR3xqcVUnK1u+iQAkfK8xHXApDZ
         8pm35yk/M4W2z70Il2bCqVyguCqp68mewiSqSGmx01wWk8tjt56A2nk+mdcaJdkwZK73
         RjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721722337; x=1722327137;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CM4w3yMUgJIqK5vukbkmgWzrmH9HIfj5GBxrPyujkoo=;
        b=lTWsGBzo2YwTv4JWO33D/2iXXhrIKtFp0AJHbLXGL3rmsA2q6/t7AYk7kN6L3Hd1oZ
         srfrLBL8aw+LhmOVwIxMDcQKIF6sKQnWs4d3Mf7DN62Cz8EM8NramVrXAu+4cllm+nWu
         3MOt8xhb9Hu7zxo5kGm3c+5A0YCppSG33+XlJdfDOyK9arlCbW+MaJMS20yYe2mAQX+I
         t6K22XTXSlZcIYE5fSosg2YQQOVMoECFAZjjWiIExDnjbaRrTx7W3fPZHNJ+bTuUNLdD
         ECb6IAyh2dpqRjFoHyj2vK3HJ4ZiKAiq4OvAslQInwek8aWaLjiWDjA1NBiDJXinFmpa
         TJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUZX6txbcQ8z2Fzh6znWozu4Bag3RoZj7+xkGnkKrdp5yPyynZpYkAE+fD9OJg+vP+yVDHiV3YUW+ywLHZgdN+3Fh2dJ9Z/9Gj6H6YNu5wh0zeSuftj8ofqqSEPHFfmLNtHIq6oQ+1t+UkZEiBxsXMKLyHLJztsSPGw5SmrbAZjIA==
X-Gm-Message-State: AOJu0YzgIhYO2xO8E3/eQVtIzUzggygvcAkgk93pOXthJ5H3SrIkVfPk
	mwfNZ8vn8tPmpXBPV65FcpijzcI6ZtJHIpAyqlIydLMT/5qdG2Qb2GLi2A==
X-Google-Smtp-Source: AGHT+IGJE1wZqeFHBiyy+ylY8S4SnHpUlSQBmitgx5l16e03ZYBnGsY5VZLmBRk8/HwaYXIe1VT/jg==
X-Received: by 2002:a05:600c:4f8e:b0:427:98b4:624b with SMTP id 5b1f17b1804b1-427df7aa65bmr52889685e9.24.1721722337240;
        Tue, 23 Jul 2024 01:12:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-427d2a53ccfsm186865295e9.11.2024.07.23.01.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 01:12:16 -0700 (PDT)
Message-ID: <7ae04ef2-bbd2-4e62-bf66-e61f64b12579@gmail.com>
Date: Tue, 23 Jul 2024 10:12:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as
 DMA coherent
To: Qingqing Zhou <quic_qqzhou@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ahalaney@redhat.com, manivannan.sadhasivam@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240723075948.9545-1-quic_qqzhou@quicinc.com>
From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Content-Language: en-US
Autocrypt: addr=k.kozlowski.k@gmail.com; keydata=
 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
 IS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240723075948.9545-1-quic_qqzhou@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2024 09:59, Qingqing Zhou wrote:
> The SMMUs on sa8775p are cache-coherent. GPU SMMU is marked as such,
> mark the APPS and PCIe ones as well.
> 
> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
> Fixes: 2dba7a613a6e ("arm64: dts: qcom: sa8775p: add the pcie smmu node")
> 

For the future: there is never, never a line break between tags.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Best regards,
Krzysztof


