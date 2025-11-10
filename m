Return-Path: <linux-arm-msm+bounces-80990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCA2C464D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 12:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 978183480E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742AB30BB95;
	Mon, 10 Nov 2025 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yh5WZxVb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7DA30AACC
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 11:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762774556; cv=none; b=G3DZQVyoL5JKLIQS0N1Ih/eVLQS342drJfPNmL5KzBPRJeM88RRJlXAI2gorwGzleFzfHhjvzKZ1oB2yhJeJTHJF0UJ6VBPesUcVuFp8ozIv+b9A3PoAWC5vdHQbSLDTYlMPsaw570CF/WMBR6dp3V1KeN1f7QUkLK1WF72a278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762774556; c=relaxed/simple;
	bh=AL9VUTAnPmoOffKlIJNa0kvWod/v0SpUxAnrML35V+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAZ4eZ33ZVzsgpol8xJoPIP+Ai8XNavbq2hVzOA4jDAF4YKk5Mi7ozMoTIFFOXHACpluAm2EW0sNoYHEII2fZHbPWqwj3sssyIYdZEkY8kJwiRkIIWZ2KcjNPV9deh5qNUs1mjJSrHLTDrRiz/dIMMpBfO3urCHbRRA55KC3/e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yh5WZxVb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477549b3082so25779735e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 03:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762774553; x=1763379353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5y6wCAKSaMKPZ+2wBt9jzrpJq7K1/r6VCG/1Dr2iUWQ=;
        b=Yh5WZxVbt8FkT4g7ceHlcT4nG5nZjs4aiwypFKjbTCkX4X/A7PTlFZgdKCgBy4bsjI
         IAdI7RzbOVCCZKN22E+8M2FoNQxxnrE9NwjhhVDsUfae17K2xnpD+Fys49MMiogXY8q9
         2+hAhXk8nJCM30P8pG6PyS8GSwwEryLyCcq4PfEMpVO/dLSwyCVAE3s66SQgIiInHu92
         79W9KicD6e2eyArPu1op2ekeVsWKWGZ+UAp/z1rmGwuInIU1makD1Meewzx7ePplk40u
         fuTLVj3q5bXLLlh0kCL1B2egFwivheaMznl6P2fWBPrJSdAf228vdUrHvhLdceBgjyx2
         VI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762774553; x=1763379353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5y6wCAKSaMKPZ+2wBt9jzrpJq7K1/r6VCG/1Dr2iUWQ=;
        b=NmevaUkchEN92kiN8gxUqxhB3kVHydeHkhRBiqJSoQHzxGfkR+PvwWFkzvUFuwY/Dw
         F3f9HpJuSvbmuREDtD8K3dda6VzqTfbKjsd1XRqkv6L/k4SjUYdjYA6x/3g2TwqJjw7U
         x8YeFSn2QMXB3+Dohn+22lrib1QwwIC+7kptfBF9oPpqGfmZ/0BqemWRXrLKoHp+9/mS
         Wvf6TEhaWnKApo/kSlm3I+fTfEjfWQigQHPkYS16NGC+QaarIdIUU50x0zynKJNxqnW3
         tAmNL/pC51fWQkmvCAbe+GHuh/mpdmtL6WjvK5YUI5Ilcy10HwK81zTOATbqjeJhET1Z
         h8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXRm4P11VOTWrTcAf+EKsORpFe7xiwEsG5jGLoV7xfrMHZj62KqspfTFJcfEAmgJF0+fm1cXagEymw5CRQL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Roid+7jRGn9SFWFTHx92CfdaB71K0c8ivtbsm0TQsOT29zUN
	3cMiwjd67KCpt3Czvovc0Krf56NB9hGrUNB42rDV5+/86m+W4/WHIEU9IID289B4YZk=
X-Gm-Gg: ASbGncuFOHcdDg068W7EQ6y2EVZRQD7YrZRhSzRf97RhmnIKEm33KUhHqGvxnU3zzG0
	0dvbgZryvSZ/joOnjwVB9JDUbaaN9krhmnwW1RydMRcoM6Ug+lhmHn2rKL168MqNaJMEtsBEZdq
	W713xCghesFDIIqkvN0ytSZPZKFObc+rLO7yiT9KQD/hkDpEf5NFnKbNf/bN1AKzM/wPAycIku3
	Sm6DGNZCwOoWLEzJZpmcNKT2PkOTjNnJROpLbRCCdokzOmz88yqawH/xGQHYUGnkzsQqHNJCFxq
	xeSV266kzO3RHR1kdKbfiglWWGFTacYb9F9Ti4Chu+GcbvRdrtz0vD9wygxzaPM2dVFkHtgycZE
	mQ4dt5WLNDg0B6QbHUlG7+wh3+Mhh2pxE2JXs1WT9MyH/5jGEeT1IweGtLJU160DY/5fCyEARKv
	mucGL7t4IsQ7Pde/r/dQzYZceu1sJnw8Fyr25zT3g5Cg==
X-Google-Smtp-Source: AGHT+IH7a4ZIA6K1hyshUjilyezxAd12GR80z/y8NgV7hZhcHkivP2UCzIhZhQjPDXMAGanfBiROLA==
X-Received: by 2002:a05:600c:4704:b0:477:a9e:859b with SMTP id 5b1f17b1804b1-4777327cb50mr60888925e9.24.1762774552976;
        Mon, 10 Nov 2025 03:35:52 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bccd41bsm197008495e9.2.2025.11.10.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:35:52 -0800 (PST)
Message-ID: <26bc458f-1db1-44e3-937a-f3ee7c1027be@linaro.org>
Date: Mon, 10 Nov 2025 11:35:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] media: qcom: camss: csiphy: Introduce C-PHY
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2025 09:39, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Read C-PHY from the device-tree bus-type and save it into the csiphy
> structure for later use.
> 
> For C-PHY, skip clock line configuration, as there is none.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.h | 2 ++
>   drivers/media/platform/qcom/camss/camss.c        | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 895f80003c441..8f7d0e4c73075 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -28,11 +28,13 @@ struct csiphy_lane {
>   
>   /**
>    * struct csiphy_lanes_cfg - CSIPHY lanes configuration
> + * @cphy:     true if C-PHY is used, false if D-PHY is used
>    * @num_data: number of data lanes
>    * @data:     data lanes configuration
>    * @clk:      clock lane configuration (only for D-PHY)
>    */
>   struct csiphy_lanes_cfg {
> +	bool cphy;

Should be an integer from

include/dt-bindings/phy/phy.h

- PHY_TYPE_DPHY
- PHY_TYPE_CPHY

this should be indicated in the dt and latched here.

---
bod

