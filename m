Return-Path: <linux-arm-msm+bounces-31437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52541974493
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 23:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA638B224BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 21:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D711A76A6;
	Tue, 10 Sep 2024 21:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYh0yjiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4541F951;
	Tue, 10 Sep 2024 21:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726002617; cv=none; b=RBUZUDVLuZiZ5WTgrIJvHFTlLBDumr2XH/5kKRYFbNtsSNY4P3fdwhLJw56+Q89hXGGd8tyRLNdWNG7+Pja0vbP0AEwKbRiUl0wKYX7pi3RFeWJPR3bBPXuVR2RBys1uTLMgDbS+YE5B6yqZzLaZG73xllRdM9L9gmIQBK1BTU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726002617; c=relaxed/simple;
	bh=RnYiSNi48onRY1d57mi9g9ODgXMQaczSLfQujFR20PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLipIuOvjPzUWusG7WynwP4kZxO9AJzAKXZ+RiqO8V+KkQYNHylnTnJRQ0BOh9MOnbP5EmooiSeH3aVaXJq6HtfutUXuL/8S4LdV9+pqlXvVlD4OY7X7aNEhk2WRS+zmsyWYKnTxMjYq2eVR1T4CxfVHhy6FtgTW58+UYkQSHRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYh0yjiW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a8d29b7edc2so499853366b.1;
        Tue, 10 Sep 2024 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726002614; x=1726607414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sUV8lPvIGwQMATrl/uVvnHpcqJh+pYJIVIWAS/5H65E=;
        b=jYh0yjiWkoQPTaW3m1TnjycBsPt1LKlePLuEexg8+fRlt03lRByDJ5Xk/AzjUVW6vS
         e6OXhyUdLXDK+oystLSUHim66OpwdcCtj2ccLAuPxAXUrvT66vJwSVPHqQRzU8ZrgcLv
         rd9gSCgMoX3jPtK9hr0W4ZHCKIX0zT6cil+/ZMAVackAE0YSPB9I0z26w3hRKurPTQf1
         zj6YFc/wtom8wBVthnn191Jhi8Zv9waTnoJjHiqVJW3/lkyWNgAUIgWNGEL0AJQqxUzy
         Hbsoctd/Zb0PtG35Ld0spQqh0tMzw3QdOfBlyU+v+YATKESfMfnZ5X8a9LlngtZEdTQq
         b3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726002614; x=1726607414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sUV8lPvIGwQMATrl/uVvnHpcqJh+pYJIVIWAS/5H65E=;
        b=Si2mXTUBn3aOdk541pZwICHEo1nVZESJ6fpSN4EVZHthHLTU3ZVoa5PoAdjV7MjXIz
         ZK5OC6LaLqMODDg7TxPwzWF8Aa5zfutaSqnRfDQfESxj0bIRWUf6Jn31ktWN9NPXs8Gy
         tDEE0K0Yg/qa237j5hI01cyu8IGRGnDwAjrZ+18xB4twm5P8FPAKkyHeVlONtO1P4oTG
         yuGswuf+iR/kZZ8cHypfCv9trm53IcsjP82bzWlnZC63ovJtzWa8gHwUKFr12cjgPZrP
         vHidA64XBhUF/iMCNFcikYhociWhQemccmYpjA1SY1x22B+jTOJLtE/a9KVsdi8ongdQ
         Ihmg==
X-Forwarded-Encrypted: i=1; AJvYcCW4ge4aKIqA/X5JJDznsPvl8lX5ZYrkW5AhCKmq1w+IHdNQrd0Pj0qVljpkHHdhef8Xm+fJNrFusUc6hGpD@vger.kernel.org, AJvYcCWWU6bKHb2MNNaWCc50nQooiGoIQ1DD+Ycfm+NzpoaAbmWw+7Dmt3dKdLxHBxsFMfC6NJte+q00SQf/@vger.kernel.org, AJvYcCX30bShjNBWZZpqyZAB3+JJLXldmfBKqXf8MK0bRCN2pjx2BbpCLh1lpmtoeeOgoF+2niBwMLFl+ynUJym/aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz19sCogC5QseRrrljX5+vImhkafVeoNTKJce3ALQXBK348fTlp
	ONMyYNYv16ujO/3PAHhrLKr9mg2p93ZYT6e4EtsfpBOVX0HcVj/FqdLkgw==
X-Google-Smtp-Source: AGHT+IEXe5RCMC0ZBnUd+NpnXEOztMAqqrv+pM6W0ALhbBb90RpBZ6M8Tq6/4vexqUdjagYG2s5LOA==
X-Received: by 2002:a17:907:7f29:b0:a7a:ba59:3164 with SMTP id a640c23a62f3a-a8ffae0b899mr192539366b.53.1726002613666;
        Tue, 10 Sep 2024 14:10:13 -0700 (PDT)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d258317e1sm529386666b.37.2024.09.10.14.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 14:10:13 -0700 (PDT)
Message-ID: <85eae93c-3533-4494-9277-43fd836112ce@gmail.com>
Date: Tue, 10 Sep 2024 23:10:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] firmware: qcom: scm: Allow QSEECOM on Microsoft
 Surface Pro 9 5G
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-3-jerome.debretagne@gmail.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20240908223505.21011-3-jerome.debretagne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/9/24 12:35 AM, Jérôme de Bretagne wrote:
> Add the SC8280XP-based Microsoft Surface Pro 9 5G to the allowlist.
> 
> Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 00c379a3cceb..5c8d8d75fb0a 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1725,6 +1725,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
>   static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
>   	{ .compatible = "lenovo,flex-5g" },
>   	{ .compatible = "lenovo,thinkpad-x13s", },
> +	{ .compatible = "microsoft,arcata", },
>   	{ .compatible = "qcom,sc8180x-primus" },
>   	{ .compatible = "qcom,x1e80100-crd" },
>   	{ .compatible = "qcom,x1e80100-qcp" },

Looks good to me.

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

