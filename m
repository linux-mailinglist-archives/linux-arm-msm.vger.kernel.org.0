Return-Path: <linux-arm-msm+bounces-92026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL83LLTQhWmOGwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:29:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A9FD3FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11BDD305B0AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 11:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F54C392827;
	Fri,  6 Feb 2026 11:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ONImB0ez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBECD3612FE
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 11:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377220; cv=none; b=kVKvb3hKZGMROiO+lcrfAGlgn5N06tyoMw6GX9gRr07quLVeMunRIpR1DtDHLb//uX3ZTfD9TRwrF5OGmyF17VG0EsxRGDsAnquPtwR0V/b5mkYNpNoXodE+AKDydijEcTrb8G7H7ljqSheT94s8y89HKoE0MF1mFu+LL6u8TR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377220; c=relaxed/simple;
	bh=Pv+4mxHOkuQGdUlGt/TWxFbKeqDqXomI1Q3G96+VfbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8kS5fZiG8VwXdWA+ZmOums3xUt1RH7dg/R7lLfTEp3V5MtUDoG+VvQdxv6H9A1FBq9rOzKE70cOQD+72YM7UO2YgqH1XK8W0iH365a0/CqUx5BFL1L+IdkjiWukZZBJbaJuEmdIZqunQKLY/afhDLAmmjfS/g8Cc7EhmIqk4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ONImB0ez; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso20308255e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 03:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770377218; x=1770982018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kwf4O/lyGf9gvN08ToIQWPbaXEEjGuvKl+rS2tkfhIo=;
        b=ONImB0ezxDkENZoi5K6K4rjKByrChUJ6OJpRljv+GkC2kuVz5cXbpHJ0JI3TOigkRH
         uwOsxVH/5DbX8KODdlbYz7kc7uOaKyE15TyjCkqXDaq56P5mLjz/3l/Cp0fMvqmaokm+
         PJ4SfffxeXcRQ7Dgt0UkfCyubvdh6VaVmB4xaGLtM+m25b+YB18aUGkMZLGk5HapIhWS
         Scz4FQ0NOUOSHB2oiHJqqksH8v/lheMhbPdTpDDMrcjWlfOErXXFxmEfqVttwP3H61w9
         QA59cmEPPaqgQaVpWdRT3O4UZIvOZow4BNxKDUpd6pq0Y/I+D1KnFsdWJiwxfed2ITTr
         PC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377218; x=1770982018;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kwf4O/lyGf9gvN08ToIQWPbaXEEjGuvKl+rS2tkfhIo=;
        b=PHhLaozPd5TYtpXRpsr0c/TTNSsChEc4Gfxh7JrhrL5sYuXLBuW+XE0D53plJquZqv
         cChJGi14JH0R7jAMWj7qTGv00yJLfNYGl3ptUFA/sqKKCf5KFJf3qPyxSCOLHj8Q+Aqy
         9O7eg5oGmM3FocdyKy+g8Rt/FtfaNlFl4xEP7J5xNBuPVRfIYXouITHM/SULtgLJdIAH
         qCxvuo+jGdDT0vNj+1zKd7fysvY4pCeYpZVjYtDfzTa/l/R+YH3C0f6jB8mlE64yJlnm
         inpcHRSFvUke75QEMIRFB40SBU3IyM3xy9lX6WEAwgXyLSsOE6/gDFYKwA5NLwRUT6xl
         X1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX5GohUkKnzJjqllbOwIDD4qLReEnLk8/Ie6ZqFR29T3GnVBSitQa+2W8CioJ5FntDmbq5KKM+e6neJ28F9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbp5TLooeSNp7xojz1+FJBZrNRMfJgoJmwUCs+TxcXUHIh/Xel
	jGhWRbqW2hbnS5B/3Ydcr53yQfArG1IOvqqU0bgg8obW7OBqn57PUretfolRZ58pfqM=
X-Gm-Gg: AZuq6aIDepTvDCsO6zJKEhcNTyR2AEUSzVOJqxVR9YYXUdcmAUQ92B9OfEYiAmv5Plm
	VrLauBlUpHz0kLf72JPgh6cgXxItEb33oxMyr0eKAH6CTuwkd21Xh/0fyeZWMisk1cJdnWBmSUf
	rgAFsSPtmmQOZVSyYUcsepiBic+qbo/MrT6yEKQ0Aa6VIEKk9yVwc2ribGjXV/VDT1MEBdtr6IQ
	PmBoyOcgGOyEFQlLTyDqH35214VxwIXsc0+KzsI1H+PASsv8byfR7+HDHXdyXEzc2ckVPGItjWs
	f5zi1vXul5cm27QHoL10a0+eb7pn6tnXXxrQqJl7k26/Aj7xHJBDpwymaQa0T5y2FZKEDaYtofW
	83aIgO85ta3Q9NtszwVcTsghkr3uNLuqsKdkNNvw8KA7bhsKevnbi/GQGd96Yybw2GMNJB0aQfk
	tt7ZEUx0O1WX3h03QC5pwwnbcN/OhgvTbQ4malebOhANUhR0TzAE5r
X-Received: by 2002:a7b:c3d5:0:b0:47e:e38b:a83 with SMTP id 5b1f17b1804b1-483178ebf8emr55909675e9.7.1770377218103;
        Fri, 06 Feb 2026 03:26:58 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm111548255e9.2.2026.02.06.03.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 03:26:57 -0800 (PST)
Message-ID: <302a655c-ba75-4fe5-80ce-2a38941e25bc@linaro.org>
Date: Fri, 6 Feb 2026 11:26:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix QCOM_MDT_LOADER dependency
To: Arnd Bergmann <arnd@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <oRAGaDzYfKTWx8kKFDLQCghV3xwo2mXzA_JDjN9wyNZDdL1X33zlO7mPy2Nwx1aDr1-jdIe8WGE4iJDVwtw2tA==@protonmail.internalid>
 <20260205145623.1360105-1-arnd@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260205145623.1360105-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92026-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E4A9FD3FC
X-Rspamd-Action: no action

On 05/02/2026 14:56, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When build-testined with CONFIG_QCOM_MDT_LOADER=m and VIDEO_QCOM_IRIS=y,
> the kernel fails to link:
> 
> x86_64-linux-ld: drivers/media/platform/qcom/iris/iris_firmware.o: in function `iris_fw_load':
> iris_firmware.c:(.text+0xb0): undefined reference to `qcom_mdt_get_size'
> iris_firmware.c:(.text+0xfd): undefined reference to `qcom_mdt_load'
> 
> The problem is the conditional 'select' statement. Change this to
> make the driver built-in here regardless of CONFIG_ARCH_QCOM.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/media/platform/qcom/iris/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..5498f48362d1 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -3,7 +3,7 @@ config VIDEO_QCOM_IRIS
>           depends on VIDEO_DEV
>           depends on ARCH_QCOM || COMPILE_TEST
>           select V4L2_MEM2MEM_DEV
> -        select QCOM_MDT_LOADER if ARCH_QCOM
> +        select QCOM_MDT_LOADER
>           select QCOM_SCM
>           select VIDEOBUF2_DMA_CONTIG
>           help
> --
> 2.39.5
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

