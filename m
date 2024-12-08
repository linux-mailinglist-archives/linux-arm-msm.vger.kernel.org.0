Return-Path: <linux-arm-msm+bounces-40905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 116099E84A5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A602817DB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0AC13E02E;
	Sun,  8 Dec 2024 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0IH9upu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0088B535B9
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733657238; cv=none; b=nkzyQaH1+MlfKd6lDskkjru53qFPvfZhDWHR8IU7272qrJ1mAMfVefaCi1c/HjxYPktQTTD2GpxL1Q7RCpYAvUmXsMtwWkxymkKKLl3SDb/icyIw+o+3zNQ2YIeTc9Iw39XvsXd0RBoBee9H+q52kibU9alj78zhS4Jmgg0/a9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733657238; c=relaxed/simple;
	bh=f0Jo04c/T2mEssbQZfNecevl2eZUZV/9cEdpBG53Pu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jtnrtLMnDwhtICqfqTP/6CgDHEmnpnjXZ5C3TzfhOmFhU5pal0cI74MJEEpnp6u1TEOAagJJl/MeHJPCpQ0xjr75u/lRlJsOEOl+3rPI9s89K9/pVWqvK0TXHoeau/PKQLF91Zb7DaQWyzKrgBmBIzdzKEMekVrMYYALwDMFJ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0IH9upu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b364538so1140499f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733657235; x=1734262035; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CsVvC94nl2+83Y2oLBYdgCRMUN1ZyQsu5kZ8QEDXwqU=;
        b=V0IH9upuOgAkkRZjlkrU0Dmw5gHwzfLvi74Ag7cMDEC3L+crwxac+Uwbm0K9st8szB
         cR2jFbISYyTNWCIOPwaUCEegR8zhm/BIap/bIJLGMPkVEHldvE0igGZIT9NDx5O5HV0g
         tqdeTtwpUCuhPZtaHDa+S+FCW6C74+zJPKgZMuR/xpkJ6TSkME0qI5n6KxFKpvH2TW+2
         G938cU4p6LbaiUT/s6LM9tX2kh5W51ln4kuECy6D/e/ScPfMVDLpPMrm4/JQ26mV9dK+
         a13oofKQ6pRpR0sDAbLKoh6RtYx+ZnhwUL+jdwu/nZtiRJiz4Q4bAl0xGYdEp3+VZ9VY
         NZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733657235; x=1734262035;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CsVvC94nl2+83Y2oLBYdgCRMUN1ZyQsu5kZ8QEDXwqU=;
        b=QtTJaTCStvROhWAOc2fhV7I1kTplX+BXR/o3rw/vizcrz8ihoq7Kjl83vGBhCk9ZuF
         50uGQ7T+GC9ItiKxBmo8lMzKTsr/thhSFUIOpPq+a6NR/wRWWEXe0DaBFdteuyCp+lSh
         2iDPBM1G2/mPKyJiCi4ll5Xjs1PhiU/UN6Q/VDz0GHQKv4JVM+JqrUVdn25B6nZsjZCQ
         CV7z5cfPoZPrL5D3/WTSbYYU1CEHxCvq23tQAbHW666VPn7pMJUYBQeBHhynFjLslK8L
         NZ1e773dm2Ktg1JzoTX14Or6er5GQsi/J+qYaVCubW8YB1mKc308yXQA0ljET7oPkOub
         dYSg==
X-Forwarded-Encrypted: i=1; AJvYcCXXCVIvL7uewg8qZdjUHVvveIku71D0WFbTW211hkfV4W/CAkXkb4vYdE5MgIwoEcrQ4MtM2eqs2W6Ji+1J@vger.kernel.org
X-Gm-Message-State: AOJu0Yypa6dsCbKScB1KXIze4FuIKfrmA9TW0poBNiVOqEzb+Kpf/O9f
	4wPZeec2w72QA78Dmdk62uPHNAjcyQIRKnQqpkn9GKgFStDHJU+r7rHpZRVYACw=
X-Gm-Gg: ASbGncvvzTFPuIoQ8Ut8Jl47eQFcRsKiNOnBCNOhADxMvUcRIxQzKBOOE0EGmmzEeIg
	yfxes5G/fTd8zCSLTIoeRbJiAWLaEXPJfLXUMyeRmHQ8rR9YbXE0hjAQ8YQya/pAUOyi+p/0dBz
	lpe+VJh5nmv6un9lvqoWWE4j3/TlMUV2SuROmaoqf5cLCAI8rjhjNpe8aMWk9m4uP/Zv0/l+qvg
	9jjb60fCm9G+fX7aeMXmbmoHHUcyEAV1oULxpwVhos8U6LdWRbti3VTAWcP2E8=
X-Google-Smtp-Source: AGHT+IH//Ct388igxpj5Bg2HRBO2RyulR3RmoCk+xAmpaxF9sT8ZNwoRAF+tNrtLfoOXVJ033QX4iQ==
X-Received: by 2002:a5d:5889:0:b0:386:3d33:a61a with SMTP id ffacd0b85a97d-3863d33a7d8mr433893f8f.27.1733657235343;
        Sun, 08 Dec 2024 03:27:15 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4008sm9654693f8f.22.2024.12.08.03.27.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 03:27:14 -0800 (PST)
Message-ID: <fd8538b6-4c9f-411c-89db-6936ebed7464@linaro.org>
Date: Sun, 8 Dec 2024 11:27:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Add sm845 named power-domain support
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241208040055.30509-1-david@ixit.cz>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241208040055.30509-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2024 04:00, David Heidelberg wrote:
> From: Caleb Connolly <caleb.connolly@linaro.org>
> 
> Declare power-domain names "top", "ife0" and "ife1" eponymously for the
> power-domains TITAN_TOP_GDSC, IFE_0_GDSC and IFE_1_GDSC respectively.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git ./drivers/media/platform/qcom/camss/camss.c ./drivers/media/platform/qcom/camss/camss.c
> index 67fb11cbe865..62c556c4fcf8 100644
> --- ./drivers/media/platform/qcom/camss/camss.c
> +++ ./drivers/media/platform/qcom/camss/camss.c
> @@ -927,6 +927,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   		.interrupt = { "vfe0" },
>   		.vfe = {
>   			.line_num = 4,
> +			.pd_name = "ife0",
>   			.has_pd = true,
>   			.hw_ops = &vfe_ops_170,
>   			.formats_rdi = &vfe_formats_rdi_845,
> @@ -954,6 +955,7 @@ static const struct camss_subdev_resources vfe_res_845[] = {
>   		.interrupt = { "vfe1" },
>   		.vfe = {
>   			.line_num = 4,
> +			.pd_name = "ife1",
>   			.has_pd = true,
>   			.hw_ops = &vfe_ops_170,
>   			.formats_rdi = &vfe_formats_rdi_845,
> @@ -2647,6 +2649,7 @@ static const struct camss_resources sdm660_resources = {
>   
>   static const struct camss_resources sdm845_resources = {
>   	.version = CAMSS_845,
> +	.pd_name = "top",
>   	.csiphy_res = csiphy_res_845,
>   	.csid_res = csid_res_845,
>   	.vfe_res = vfe_res_845,

Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

