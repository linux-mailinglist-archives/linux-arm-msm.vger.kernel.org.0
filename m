Return-Path: <linux-arm-msm+bounces-108441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKOfN9Q4DGq2aAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:17:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA657C093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C3A3C3037DD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAA64C9002;
	Tue, 19 May 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXmQU5YN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3654ADD97
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779185761; cv=none; b=tkZYKHo+DDaSEP4UVw90xXWzPMD53JtxvnUa5B/tS2UNuRgOKoQjEl9LwoBG25b1L9Vic80fxNzx4S+oDvSNs3FlVUCp12/NzuLa13ljCO9JjsxKwq4WMsAELUzfTmug8GdSK3+WYZDnXBnehlQ299AD7aIdYJyUB6tZrfreeek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779185761; c=relaxed/simple;
	bh=f8ALR0y3q5fP6vwtXgP9hBGv5oAQokxYrhtup0bsRmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KcG6wTi/O9FSq5qSBWZVn8HAQUHmtfOFJqr1aaeXkmJrq2U3q1t+Xinr0DHK1kO86tmcBtm+APFe7J9v9NW8CCuiGaDP/9FnTmV8S8Piqw3tbZIuuU2nU2HhCqdfFtVk1HCpwE2LuZqFzL/LWRTyBtdeFKMU7Mdu642sBUHY4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXmQU5YN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1875224f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 03:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779185752; x=1779790552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u5UZMUsOIuR/r+RRcuKln7+BwOOWAw5VkzUXX1sCtOA=;
        b=AXmQU5YNNvOnLnq7VA31jNKiWyi5cHbCjQO1E8NGxEk2GQ4/GjhXcxyUg5kDwy29r4
         OZdwzC61iM1F7qYqhnOKbgY7mfGBtcz5KY7o4jUgw64pt6+xgUsY50KPU2HuuVcJnN6X
         /wiav/XRokBbp4CJsYiRVVcfo51BgbNw0ghEDa6foVFnAbZJ1o1JWnjRfhmF8rJ6+fSa
         ECFHJx8hvv4yEvAVgHlPj05uhv+P7EmCUb48HlQEM/9jZVPzTQZ/ID0ihhGl7HDsvAr9
         +rAZilb6/AeaKO5NOOwc102YwWRveM0itRs3wb3EEGfvzetpm5QXkOAWn4AlZbKk12G8
         9CwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779185752; x=1779790552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5UZMUsOIuR/r+RRcuKln7+BwOOWAw5VkzUXX1sCtOA=;
        b=q8tT1ItG8NgXNXB5xp8AtbV6m6YoclXI28dQTUA4/ZtO8n6A3hEDL4u4qcW7QPt6Oi
         k/MIk8zHGaCESlwjeq9Sc9wxnpjXym3b2X5xGvpI+Kencu/B6lUJqcIo0MjLC8c7u+t0
         M2V2Cm0pSge7jKcGjZFvaiy3ozpfx6JCTo8FegQ4XDZ7BF868hKSUCGEoiKKXc4mr8F3
         uZ+ZmnuBNmSpQkTc6wZ6CfGzhXtpBxn7v6hwo4hmRx/jf3eCRq+GBHToXLxyyRYFdL78
         +KuNP0pX9anwESv4hiYA7gAlTvbwL/nIGA7RovORuQLUiM5WTAAv4lV2cJvTNPzJqYlF
         BLqg==
X-Forwarded-Encrypted: i=1; AFNElJ86CzmrLQ7dV1vmPFjUjloLSyl7tEJQzvu7ZPOj9T/1kO1so66i10BMrDbIBzRVAfaYeWs9w0vGVq0BmSCX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3GjkQ6NCscZitMlVVcZoKH4CItH6T5gjBQpWTJjstIbbSoCvS
	zFyXSVwP/mnFHXa95kC57FMkyoXlOs8EuT+R+Oz1Q90vcFzd0N0ohdCPEehz8PGBlXg=
X-Gm-Gg: Acq92OGBfwTTKqAC4Kqn8JOkV+ReOA71G09CBzWKSKlYcegximcFXZUJNRKwpL1I60Y
	C21nPqD+hx/RSZc8qxYXBW4K//s87O3nMIvVYGesGR5Q5OMb7mwIDzp6bUCWQfM5EJbuwfbFo60
	Wo0WHD18+7dNYcD/tPYhMe6v+FRG2aLjQMEKFwpan8I6PzhGDl1fo9DCI/ItftzmoObZM/5qhqN
	Me1CAK21FaGhMziMNNTTS0GtLG+UNyg7OR+J2eNPMDNTXfHp2WXwwQf64f6R0rW5oTDfqcEkYuG
	hB4clP4jYOLK8wF4OdMeQpKTLGE80Y1j70bBLAMZQa032swAeocNDrWMmwP4vc1jFx5WOmgmBuB
	qHJNFK4REcjbOfxYwC4mH7uencSY84hNHpjIlh6cgE4h5qDV+dhGdRO+K5UCsha3ycVsN6kOj7h
	itBmKGr9Rupq1FzXaeiNf7SDgZ89Pb7tHszw==
X-Received: by 2002:a05:600c:34d4:b0:48f:e245:394e with SMTP id 5b1f17b1804b1-48fe631f631mr307476515e9.27.1779185752498;
        Tue, 19 May 2026 03:15:52 -0700 (PDT)
Received: from [192.168.0.35] ([51.37.145.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm311206415e9.14.2026.05.19.03.15.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 03:15:52 -0700 (PDT)
Message-ID: <48daef97-de8d-452b-9f1d-e3306fc46ffa@linaro.org>
Date: Tue, 19 May 2026 11:15:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: typec: qcom-pmic-typec: Drop redundant header
 includes
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519100014.282058-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260519100014.282058-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108441-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A0EA657C093
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 11:00, Krzysztof Kozlowski wrote:
> Unlike other units in this module, this one does not request interrupts
> or regulator supplies.  It does not use OF graph, USB role switching or
> TypeC muxing APIs.  Drop redundant header includes to speed up
> preprocessor.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 3766790c1548..35320f89dad2 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -4,19 +4,14 @@
>    */
>   
>   #include <linux/err.h>
> -#include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> -#include <linux/of_graph.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
> -#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
> -#include <linux/usb/role.h>
>   #include <linux/usb/tcpm.h>
> -#include <linux/usb/typec_mux.h>
>   
>   #include <drm/bridge/aux-bridge.h>
>   

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

