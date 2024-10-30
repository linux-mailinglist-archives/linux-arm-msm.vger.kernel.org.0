Return-Path: <linux-arm-msm+bounces-36438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98F9B6319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2976F1F21AD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 12:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32421E8849;
	Wed, 30 Oct 2024 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJOAeuW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5BE1E9065
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291494; cv=none; b=LJ5Pii7Fnv1PSlP35T90dkOG/PiiM1JAHR5/6HHWQH1St3coI0nlk9rDBrk73EQSzTDb8Rkxn6UxjGLNRcis/Jld9j4zI5RyLT5NKmCmplZ5nYrCi7Sdd2hPUaQLy4ooND5IRDnOabiYDItbERK2Q9N8OmmrMeXc5DL9Xb1xkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291494; c=relaxed/simple;
	bh=c5UhKQdavJdtLfcrTrc0Pq+QbHSzwUAht7VSpXUFBO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j452lEj1Uo82IqY83uca8jpGhU4hHjZShNBXsc9h2FMjvJwH8YtUrZefd9KxyFBapDQcBw13KvJVYZPPzEc5tAvkqm2BMQc63N5ohi7vvybe1D1Cb1OCFqt5o1ueNGXlLSOzjbu8jxo8TxmlwCIW4/a5YPxsML/KgFcyE8p1bkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJOAeuW+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f1292a9bso7830329e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Oct 2024 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730291489; x=1730896289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2HB1B4iN3oWUrHv8ly8KNSVGjXRFIReK/a7cFEEc1o=;
        b=wJOAeuW+dtoZXFHLxSEn9k/sKyJL505R0VNBz7W1P7TIjiAfgu5JeL4Fyh6Czefzfy
         JgbsT9pqt4B9lJ42kLQzR8gu7+3nDh9kUt44+lDXS5LZ3B9Pu3X/w2xuQP+IsPtPydfq
         j9jbir8eoCWLpWlbX3YcTJbICMdq2ZognTZrWILEOz7fxUx09q49fy/CdYqdE6pX00cs
         CwTfjIl8dFDYU6e7IdMOKm04CDOzhYqvrlnXifmDKshWF/CfH9kOKKrbzBqjL2RU89T7
         4I5untgoEb0fMRYcXExhHKuEpIVnT3QE1gh3LqDEaQuWlhV3+0FvIUddYUGQUyQllSVw
         iPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730291489; x=1730896289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2HB1B4iN3oWUrHv8ly8KNSVGjXRFIReK/a7cFEEc1o=;
        b=cN5GmzI6OwHP3I/WK2ECLnIcbMIkSYKYf4BwlmEIur/D02ZLAhSnFgctXRWSA3S2RO
         Vs4F1arJV2z+XVev/DvUtwl98MBlEpjgjtDkT47HjzF+CBga6WUfuiNDtkk0/ACsDv3V
         bAv1gkNnceGaFr7l9vzAckUOT3cLgX+EeqDQssMxFYcMkqr6Dmm8xdDAccJsKaRtpZnF
         96ex9w+jrLVU9i0fZKSnsD3eTEWsFYDqts7dqsXzaY2jLQdviiIEz22qVNa5mudrs6cm
         ipdhIhCtfbNurEAvpkNJ9eE85I7lfAlA/lK4SQOeqa8+fdDwOpBBnGYP5AeIUIHV7He0
         KTsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwsJrZxRXt3sx+E+e4qJDsZ86weQoNp1TkDTkXOwpO8BWGkuRKmymHs7niM4kKpzc9NNwYmhoZohuCUS9L@vger.kernel.org
X-Gm-Message-State: AOJu0YxJwb8O9Bq2XbE5HqzInQBRDo2x9+C5nv/uaEozknxJ2ihtGxt7
	4bq3YoiG2RQfzgBQ9Sl6IINc5HY47cLqmCxLaPXzeyTAVUJwKsh8ihulPETCK4k=
X-Google-Smtp-Source: AGHT+IHLsrclSbDZwTl8mE7Mv4WoPP51WcILZWPPR/8gPywvqqqPPStO6/6vIkVUcLPPU1u+wGiErQ==
X-Received: by 2002:a05:6512:4022:b0:539:e333:1822 with SMTP id 2adb3069b0e04-53b348b7dc7mr7783566e87.4.1730291489365;
        Wed, 30 Oct 2024 05:31:29 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947d3csm20053725e9.11.2024.10.30.05.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 05:31:28 -0700 (PDT)
Message-ID: <7446e285-f311-42bd-bf0c-a6fe54a862e0@linaro.org>
Date: Wed, 30 Oct 2024 12:31:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: typec: qcom-pmic: init value of hdr_len/txbuf_len
 earlier
To: Rex Nie <rex.nie@jaguarmicro.com>, heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net,
 caleb.connolly@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 angus.chen@jaguarmicro.com, stable@vger.kernel.org
References: <20241030022753.2045-1-rex.nie@jaguarmicro.com>
 <20241030103256.2087-1-rex.nie@jaguarmicro.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241030103256.2087-1-rex.nie@jaguarmicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2024 10:32, Rex Nie wrote:
> If the read of USB_PDPHY_RX_ACKNOWLEDGE_REG failed, then hdr_len and
> txbuf_len are uninitialized. This commit stops to print uninitialized
> value and misleading/false data.
> 
> ---
> V2 -> V3:
> - add changelog, add Fixes tag, add Cc stable ml. Thanks heikki
> - Link to v2: https://lore.kernel.org/all/20241030022753.2045-1-rex.nie@jaguarmicro.com/
> V1 -> V2:
> - keep printout when data didn't transmit, thanks Bjorn, bod, greg k-h
> - Links: https://lore.kernel.org/all/b177e736-e640-47ed-9f1e-ee65971dfc9c@linaro.org/
> 
> Cc: stable@vger.kernel.org
> Fixes: a4422ff22142 (" usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Rex Nie <rex.nie@jaguarmicro.com>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> index 5b7f52b74a40..726423684bae 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c
> @@ -227,6 +227,10 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>   
>   	spin_lock_irqsave(&pmic_typec_pdphy->lock, flags);
>   
> +	hdr_len = sizeof(msg->header);
> +	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> +	txsize_len = hdr_len + txbuf_len - 1;
> +
>   	ret = regmap_read(pmic_typec_pdphy->regmap,
>   			  pmic_typec_pdphy->base + USB_PDPHY_RX_ACKNOWLEDGE_REG,
>   			  &val);
> @@ -244,10 +248,6 @@ qcom_pmic_typec_pdphy_pd_transmit_payload(struct pmic_typec_pdphy *pmic_typec_pd
>   	if (ret)
>   		goto done;
>   
> -	hdr_len = sizeof(msg->header);
> -	txbuf_len = pd_header_cnt_le(msg->header) * 4;
> -	txsize_len = hdr_len + txbuf_len - 1;
> -
>   	/* Write message header sizeof(u16) to USB_PDPHY_TX_BUFFER_HDR_REG */
>   	ret = regmap_bulk_write(pmic_typec_pdphy->regmap,
>   				pmic_typec_pdphy->base + USB_PDPHY_TX_BUFFER_HDR_REG,
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


