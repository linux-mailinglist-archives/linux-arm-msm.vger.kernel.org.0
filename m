Return-Path: <linux-arm-msm+bounces-72085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C8B43F97
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D84756860C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C2227CB0A;
	Thu,  4 Sep 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ad3dPfKy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBF21F1317
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997466; cv=none; b=XHreYLmROpwzAP3t3BA8nOgQUPm0qZJJ9pKc577nStFLMbfha4aSwfu5UIuwz3l5ZffFz4Z4I1vXrBC2ZncbaIidiWTbulL/YDG1ScK03MX1K0ZGcVq4/ywRSRFCxYZ5pEsN+SS4oyM3euhXFpCHOJoXeQOZxxVFejc0dURqzuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997466; c=relaxed/simple;
	bh=mFi8f12a1bnt/zRkKSTt0ZafY90Bf2dQ+K7+kVMIlZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r0B7pW4W96BZ894Xq/6BKkkWIqarsCmdTK+jqPCU21spTip0r4PMYJjAxMBzC2dgppCG8xUNVBPZzXgegvXMSGfUcuKz48OwgLYoJ0/Bhj349OW4/+C2sYdK4GXoRkuls5qJNL1BJHgi90ZhHxAnb9zNtNI19dot44lU7k4AYaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ad3dPfKy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45cb5492350so7778455e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756997463; x=1757602263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mm3xj885WkKRhuZyxbu5LG7P0HRA9OEYlHlAJLxX4fs=;
        b=Ad3dPfKyqQ41DNzpxCzTtiMqbCSl25zh8K3r9RAroQg2QQrjzCjBN4N9qJx3v/wYai
         /ruy2l9highlRFVPcgahoFE5JESgCnn8zuycfQLoOeJs351O+TOF5b51MK5Dxto0S5Am
         4zV6h0dxkqnYcKVl9S2u0eoT76fkV1OYkmSeLJVDeUR8PaYApYbfh4hmS3sNHbS+x7EL
         6yFjJHsw+Rm7q3awBX3LjAFWhk2OXlDWRDKpha4K51QzO8x1Bi0VN1TG0/VQV4WbeRCm
         zZuxWnhcY2f1J4rPnK1eJis6Su1WNG7vO8Rf4uUrX/d5xNDBvsNW20anGC9kXtdsn5xx
         NYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997463; x=1757602263;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm3xj885WkKRhuZyxbu5LG7P0HRA9OEYlHlAJLxX4fs=;
        b=g6aNL2eaGu3esLBz8MNtFiVI5oktATxLPybPZUNGn1jKJAAd5vQiTY4wP9hQfHJcOv
         vXDcS2lggQ/wxC1OfVfZMu8b+Z/2PpxQL+KlNkS9O9HP9JmheTpM/4HJRVUf+Prk17F7
         tA4W9ZgQ6GwPlH6HG4IjKrkoHTZhyVAaq7uBXCvXOZQ5WPdawhE3fjYOOFXqQR+0Oq+H
         zbYmXSgCtHkJNZgZwpgLVoi6C/IAy0jjQsF8fw8wbxtjGpC2vAAeU5lZKwY5izwYgiX8
         s2hJDou9/3MA5DGB6/xauVQU+wtqj8+Ydl5MiukoTXXuMhU7/oBgPhDH1+RWPCnPTWkv
         XprA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYi9ubObbNfsoni3EORZxLrxMwgxY0jaaqZgnswlUcZBHpz7lV6qb1M4U6jD4f8zpwb7iYunqbYhyEB45@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/GkdjjfkWotbtLNs2wj2mc93wMOdLvvwXA9p4doS1yYvpDKdf
	W7ggneotr+CZkmwxQMEtHWE7P2NCSD73hu7uvTOMtNmCc0miULa8zurv16byWs8zmF0=
X-Gm-Gg: ASbGncu6chScu5stZ997X3Mmy9ekeOcfc9Z4YacnyBvB534+GAKIR1IW1qaHQiB3tpn
	ppWZGMpm2oNpnfTSOLsBcgyRNpZLoTypN6hZNzFYnMP0LE1l0JfgLM8dADUC6Oq4lAv+CrIY4JF
	+m6SDPWRapObsPAoXoV1Zq8VcaG/8+nWtVNYs0EMEC8LXIo0DfqfJRqvILFy29BxyuWI6dG9THi
	QSCidEUHiDcx2He8ti4nheWQJocCCNyInfWCS0PpcaqYWT1QIMKTjmXCd3RpFpY1/ldbba1yzX8
	Kee/jZ6+y0iPNaupAKiVlVDLuBuhU+VCoJ1OM7KJ6KkvpOcVTxIO6a/qNNpUhrKSnrdt2jAPIw4
	AgxqJNEohem80c69RVFNLBSBlCbo5agi8cMw3pt2DZvpCu/xUOqOzTSyw5YOW2gW/XVyip3Zd82
	5H70VB+OL8SMofSgr7RvarYh7XMD6RFQ==
X-Google-Smtp-Source: AGHT+IGkh7sZxoYPIJSgoKIuQWnB6gAGim5zG62ByEZJnBJdkEVQMXHIGjBKP7FG3mVW3hDjXTcWGg==
X-Received: by 2002:a05:600c:a04:b0:45b:8504:3002 with SMTP id 5b1f17b1804b1-45b8554eb18mr173687245e9.10.1756997462953;
        Thu, 04 Sep 2025 07:51:02 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfc414f4sm22307435e9.0.2025.09.04.07.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 07:51:02 -0700 (PDT)
Message-ID: <6607f82a-e0d0-421c-a87a-fe67442c1c80@linaro.org>
Date: Thu, 4 Sep 2025 15:50:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: i2c: qcom-cci: Allow operating-points-v2
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
 <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250904-topic-cci_updates-v1-2-d38559692703@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2025 15:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> An OPP table is necessary to express combined voltage and frequency
> requirements for the CCI hw block.
> 
> Allow passing one, without requiring its presence.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b24e574bfc6bd7d8908f2f3895e087..1bb9a70661a944c1bdc01d336475952221450dba 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -54,6 +54,8 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> +  operating-points-v2: true
> +
>     power-domains:
>       maxItems: 1
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

