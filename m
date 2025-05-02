Return-Path: <linux-arm-msm+bounces-56494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17BAA71C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8238E7A37D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0AB254AF3;
	Fri,  2 May 2025 12:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZmGfClC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A53253328
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188910; cv=none; b=RWHQR2HQb5YtHq/XUV8GtCgUUitrBjz9zzYNSWm4/X7iU3MQWsO8icxtjOcICnLdrdlHwdWBajaOv292IX06HXBLJFwaVBDis2Yf6oY65UOPajXR0VtZNqBeu3+B9doT1wq6bLceLZteRI6Td9l/m3xp0V7jX1yz+V6K+Ne1RSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188910; c=relaxed/simple;
	bh=uC44g044KcShpYumwGzfPKaaQH0BoggRjBL8awNC4zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkTLgvoGf9RcNypZH4a+fbNUaAz16hO/fRimAnfLcVs3825wm1AALyfqtkQdx7IyUmRLFJGYKfxHGoRRDIOc6LBcMi1GhysJ73coBiPIQl5OcIKA2mNpZ8n4rGq2RLwOThb2ETDR/k4glBK5Oz2KLImqyxSsCEgFizmKflcswZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZmGfClC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso18003765e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188906; x=1746793706; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFKlbhYbOYEqU3Hx7LL1L8k4PnOc/LhcaLrz8KQ4fp4=;
        b=uZmGfClCc6k6ztUAMU3yvHwOaaFLzKN82E85imeept29LiiO9eOAAWDVECLmx7Ke8+
         ebT1bKwCSzl9Gnhn9yWL5MlY4rOD0XUUK3YEgEWAq9hSdvjfwOEeZ3ajevZWlAFZX61M
         3H+RdQMLTwpiGy7la5kLIsNQzANTtf7PxQ+s+X2syiwF0N57IDQzUa2EnbZdrteDDvQo
         NphFQvpSL5ClWP4cR6F+sF2vLFw3ZvsIAOP7xwkZbF4VLiG57/V/iOC8GE9R2helPMAz
         ZYsUMcqvYDbQzNoARKoJLINwIi3OPxSJ9tTKU8C/h3u60z086khAjEZurFNo/05+EkpB
         zSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188906; x=1746793706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFKlbhYbOYEqU3Hx7LL1L8k4PnOc/LhcaLrz8KQ4fp4=;
        b=eNVDH3W82huupikUDfkg5sakJAzhHKNzLTXd79b1+MNfY4cDSpfmlwuA77KVZ5Me0+
         0eB+A8r85V6kUGTL+45SdKmAEgSyqruM8I/JolRho/NIzhimAoIY3aO4g0X6iHrWw13u
         GYgWRnco6bhDRG7vUMc76wAKJ+5+kQvTNMQ5GgL9uPVWoEg4voejiVkEyuoV7AnLz2CV
         PSncQEDl2m64Nqj53tQeH0aB5XeDxlj1l5yfaSBy2CrOD04be+DwbEttz5oMyY+5xu7y
         OcXS9udWP+Frcd7ZXDXK9BVzZS1UBAoY+Q0cDHBoL9ZJAejJGWb01AOhY4Oban6ly9ps
         x7wA==
X-Forwarded-Encrypted: i=1; AJvYcCXIaZ39f5VyYfhpjvvr6M5ZgK2wx/NdtoZvuMlLB74RA9TXW9vbrGk95wktAU9PnLv/B5MTcBKaRw9llAfy@vger.kernel.org
X-Gm-Message-State: AOJu0YzLDu/VW0/nOFGCmeQtUBhSE7IvpaP5UpWNj/BU5IEL9KqFKFu3
	fwBfuXQMYll85CGsqjaBCuFCONwucuZJCx5uyS/Z5RgKlDfxQ7lm44vrwmT5UPY=
X-Gm-Gg: ASbGnctEACieVIzTpD9nWWOvQQYR7FDdAQt2SDvoNiVfyAs6CoIE9JieKCdBY0fsB8k
	CPdVnj2ccesrXPWMFa3PawXEfIT/JKKv4AIEKsudaMQalVxv3L9CWoq1oNsz1W56A7b+jWzGEew
	L7Rrqq1YVkWtsgJALmCBXwGJj2mJiA90TH8L6mQh2u8TbBmkYSzxrTGfRQYabTzeiMYlhAknmqt
	FoJWy1HC1zKIr8h2MclVOzBWQA4+pYRLTz7Bx6yoWm2yC25ASxFqtC5BqSGDXwubNMabTkZoJtU
	LEg8E6FwwWsLvhWvEqyD6423LCHws2NbEOI8NWQ6lKVdHlxX4x/wYR4J1xqvNh+eLCF2wVpb/0N
	MK1UDEg==
X-Google-Smtp-Source: AGHT+IEkYYqC5HLJDXAnW5gzwBKk2/Wl+3ak0P8p7yEpFGbDPHanEhrJN2oVaPxj/s406NWQ0lakDw==
X-Received: by 2002:a05:600c:1f0a:b0:43c:efed:732d with SMTP id 5b1f17b1804b1-441bbec629emr22778825e9.16.1746188905909;
        Fri, 02 May 2025 05:28:25 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a31695sm43591945e9.40.2025.05.02.05.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:28:25 -0700 (PDT)
Message-ID: <b5179740-8717-4e5d-8adf-5f6d3f953fb5@linaro.org>
Date: Fri, 2 May 2025 13:28:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/23] media: iris: Fix missing function pointer
 initialization
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-7-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-7-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> The function pointers responsible for setting firmware properties were
> never initialized in the instance capability structure, causing it to
> remain NULL. As a result, the firmware properties were not being set
> correctly.
> 
> Fix this by properly assigning the function pointers from the core
> capability to the instance capability, ensuring that the properties are
> correctly applied to the firmware.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3a19d7b9e08b ("media: iris: implement set properties to firmware during streamon")
> Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 915de101fcba..13f5cf0d0e8a 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -157,6 +157,7 @@ void iris_session_init_caps(struct iris_core *core)
>   		core->inst_fw_caps[cap_id].value = caps[i].value;
>   		core->inst_fw_caps[cap_id].flags = caps[i].flags;
>   		core->inst_fw_caps[cap_id].hfi_id = caps[i].hfi_id;
> +		core->inst_fw_caps[cap_id].set = caps[i].set;
>   	}
>   }
>   
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

