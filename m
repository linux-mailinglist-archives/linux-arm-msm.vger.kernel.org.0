Return-Path: <linux-arm-msm+bounces-62104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5561AE4B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44FFA3A22D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7A128DF2B;
	Mon, 23 Jun 2025 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHnlrAH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13323C51F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750696297; cv=none; b=p0+r07ULEWB9DQ31YB6ezeSEfrdbTxVS7LxwDK7bQ/bQrV3+jCkffAb9PYIGwVD2QvsoSVzyoqs+R0XXPe8FpYPVQHVYAnKdX4bKyjv502VwCF2sGOxXLEx947u4lnfKZjeySpyApUmYtxXnzyLaBmsRFxiOo7m0iomvv/U0bSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750696297; c=relaxed/simple;
	bh=8KsekKS5aRcVIvVUBtntQtfWkhVyoUlhEiE174K9srA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DX7BujLE0u0NlnGGTDxjQbLDFrhsyrzyAJZeV2AVDFofsPP40h7/jT5LYh6oxovPZqgsQsDBTSBgOrDS9K+yvDUd619UNtEP+l+ze1Mb8HUUh49Cw3RhhGxGCXH8CqleLHp00aFqMQ9yipsIk7e3FmSzoJeDWROeUtlAdf/RxYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHnlrAH6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2476390f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750696294; x=1751301094; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0j8AmL2vgCPrh67szF4XCY9cmGpFOza5ajW2zlzTb44=;
        b=qHnlrAH65AWvyLf+ffRGDHFQlQ8UXXXXodW7rITXKEKgsBWRUUJ01Pt101tLfNdNgz
         druRmSX5U+bCqNoLkySpbRnNjBEvGhtqWEA6sZgE3faNVC1MOopFIt7aJgpedENnbgA+
         vLhT/oF+iV4NNJl7ZENbUwAqvYWH3iddwhnanR5l4wIgKj8vv6iI+GCZR6dQ89GS88lQ
         4HUQJcYLu1l64TswOFIPMbymXvof9EgYaCIw8NBp8I3/Eqx4VOXqXjnURJXJZOFsUk3g
         05y1QuuzYM81dH5UL1YrQufYoHDEwKgH0zffz4y/y13dXfC9GgNjUFU4R5cTo53tNQSx
         Q+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750696294; x=1751301094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0j8AmL2vgCPrh67szF4XCY9cmGpFOza5ajW2zlzTb44=;
        b=DEMQrujGAsH9MbABNz7vHWIWP++TE0SnyoqXClwdmtD5waSCb3pEux4Drl0L69hGqX
         wHhRFLEu88yUCD8s8+DyA7nYOxncKL+37A/yWmED0ZFYhYGpp0hSL0vH8ib+RW8KncTq
         qxoaZyeE0s+bF45ey17xNLA7CamXfrbDeD/BYx7rXNFZcFzKHaHhHqMoM5HKnCLIC0df
         Q2lzVYFRL6ihBmrfoGmT8/QOnZIPKSfL9AVtVmZ7cl1kMGNjJR0EIITro67PisfL9MWO
         oOFuXE3QPNtebdphPDyCvwaQWLzf6eJT/uTPdLGj8MPxA/rul+5vqlIt/4cocrszUOi7
         E+gw==
X-Forwarded-Encrypted: i=1; AJvYcCXrAK1+Tz/s3FpK4sVluzdomW6ufwmF86CYXpSMZLg4ROrUuuUDnb2t9ee/UgXEmviEWwWZzfjn4Mfgoayd@vger.kernel.org
X-Gm-Message-State: AOJu0YxHW+BY0MUb3zjxRw5IdCZnp8Q1Kbac2mL/31u4CYn/l7bBVPzY
	Ptfk76a091dNuae9LiJzU1QZljJ3CPfkEDH2teUyyzZpm80NCebp7/p5FZds6uF5IL0=
X-Gm-Gg: ASbGncv7AiK1/DfMnhQWti53UWO16pJI3cEhe/SfWKNXxqJvsdfjgMT3lSlTI8GO2Wh
	fc0ZTk4vetQPCGkY+Mi0ugDImmzGjuqxrZ5ux2Z3JgwJYgs/zhwYifrPuXIdsqNAacuUqHs4ubP
	l0qUCCjdJLOb2nVLsEfuTS9fZbSWJxw0NN0SXfcg9cjsSp5DGY4Z9ySUxNCo3lLW3NXfC7MbwJj
	V9DZFKQLb+y8ooBb+EqfFylliCw7fQuZDDM3E/XJsWdioKP3wbWBgmegw2tA2fY/W4Xl7uw3aNc
	OXanku86q4K+8d5dSqxFLryx+crQ1U8C8Tq1zwNEyVd4ZzUwa3/30QnxpMh9c6mNA3Rh0lXZmQo
	=
X-Google-Smtp-Source: AGHT+IFtp9SY06hL7tr/NWr3bIhdcZjACNg+h+Rg5V3jKzfHdcvWGYIa/oooWJLbVLfw9PBe9ecQTg==
X-Received: by 2002:adf:9dc8:0:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3a6d130ace1mr9778129f8f.25.1750696293870;
        Mon, 23 Jun 2025 09:31:33 -0700 (PDT)
Received: from [192.168.1.159] ([213.240.182.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187cf0sm9786922f8f.71.2025.06.23.09.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 09:31:33 -0700 (PDT)
Message-ID: <48c87af4-7d42-4283-b407-697b78d5b913@linaro.org>
Date: Mon, 23 Jun 2025 18:31:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: rectify file entry in QUALCOMM SMB CHARGER
 DRIVER
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250623081240.149446-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/23/25 10:12, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 4deeea4b0741  ("MAINTAINERS: add myself as smbx charger driver
> maintainer") adds the section QUALCOMM SMB CHARGER DRIVER in MAINTAINERS,
> including a file entry pointing to qcom_smbx_charger.c. Within the same
> patch series, the commit 5ec53bcc7fce ("power: supply: pmi8998_charger:
> rename to qcom_smbx") renames qcom_pmi8998_charger.c to qcom_smbx.c and not
> to qcom_smbx_charger.c, though. Note that the commit message clearly
> indicates the intentional removal of the "_charger" suffix.
> 
> Refer to the intended file.

oh dear, thanks for catching this!

> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Acked-by: Casey connolly <casey.connolly@linaro.org>

> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41f13ccef4c8..c76ea415c56f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20612,7 +20612,7 @@ M:	Casey Connolly <casey.connolly@linaro.org>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> -F:	drivers/power/supply/qcom_smbx_charger.c
> +F:	drivers/power/supply/qcom_smbx.c
>   
>   QUALCOMM QSEECOM DRIVER
>   M:	Maximilian Luz <luzmaximilian@gmail.com>

-- 
Casey (she/they)


