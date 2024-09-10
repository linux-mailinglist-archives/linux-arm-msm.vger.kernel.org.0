Return-Path: <linux-arm-msm+bounces-31438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94209744D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 23:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0EA1B24FF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 21:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639A41AB51A;
	Tue, 10 Sep 2024 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HB8VD2Dy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966E71AB50E;
	Tue, 10 Sep 2024 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726003794; cv=none; b=kGUqlQP+wjHA2bJZ8TfSGo3sxJm62Gs7VbqATKkzUs8gdYq7L+U7ssR3Nj/rwGrOCVxoB+oNQdrhzBj8cpB2yK85zLQ77Xk2iSqk5om99EPScBRziXn5puqyO3OqQWOY8up6bnmUgAti+39HkgWy1KvR3BT/nBMyYjX3blpmZME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726003794; c=relaxed/simple;
	bh=+ZZecFKHxOsdA35tvmUQcVg9MBeXYEO16VGrBztdllE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcgkShQlp9MHjPqKamJsVLzwWJ9A+JrNOgfEmLllokWAdQCrwnY7cDGyxv/C53tzvv+4SqPw/PGcf2stCRlbpku3GA1saUK4zoWt+YKlCnPYYAggVIEt9fZb411E6TInOEqX1ZsrxvHsi33tIvaSBsNgNx0WA4NqygGHerICsyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HB8VD2Dy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a86e9db75b9so174355666b.1;
        Tue, 10 Sep 2024 14:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726003791; x=1726608591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G3lNvJRVFAoF3FAWm3xlb8Tcm6SSIV8lJqbeARn0wGM=;
        b=HB8VD2Dyw72adBejMt+TusYXezm5G4bHBW+X8n05n6ZoIk1M+L/iJYHCv9+YseMFVY
         g8w03VOUN6cpY+LM7+opU6SnOesa7okXq0zve6mwTs0xMXzhoPc2IWnqctHgqu5J+7up
         Cn3VaPSFQp2GxU5HLwKP5u9O7VS5puTweJGorveS3jbRXJycF9vb+rwK9fhDGIZA+abG
         79eqDgOI/Pp7Crw8o6PytGRlxi+trLf4O0Ll/Bgd56kfNXiAFiOnNqJqQVI9ip6WFWzO
         JrHuyni/ySbKv09POhqBfyiNNYUoTetRG034kRZhQYLQl3ybB/LQdkqm9egJnectzpVf
         PvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726003791; x=1726608591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3lNvJRVFAoF3FAWm3xlb8Tcm6SSIV8lJqbeARn0wGM=;
        b=qpGnRC3kTeMi1RWklSborvnu5yc7ZEA/vt3Nc9sLbkThVJdi/l9HNZsO3aKJbMGq3d
         2iZ96hsbLeSnjuB54cqCf3Gbmw74shLzHdR78esMmU0StfOMlwVuU8qKITT2t5kJ9EK4
         IloBnxqF4fJ2svW3yaXiag5cjptfe4BxNi1/iknzGi6vYI2TnBi0lMBzuI2mqx5+rteO
         0qOEMRHZ+Kdz0+KkLBA4qTc47dnPAwZBCcJW2lMEMk22qfkD2/lyG5CDe+gFNJgfG8F/
         /iMoWe+NI7RdDlC7uKTfrBIvdN6F1r60dELHUlLPkWxT0xOmMKIQbeDh30Lx8qb6NN7s
         1VfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOqXvwjjijLrhE3GxNcEmX5N8ZiH9XqyDe/RQlikJwb6HoVwqNfL1ou6xwwO2byQOFBNcJBKawG4II@vger.kernel.org, AJvYcCWBDdLDNuXQUAHYRpuiN9PwfPgfgg0nQJF0V9xvKUNmQVtG6r4WA7nTOt9gMUPY3ITJ6KqnhPHV+EsEbNTsfg==@vger.kernel.org, AJvYcCWwFTvm6pACbyCgPGNCq0eMOcU0KwTNNpK911rlJE5/9RgqAUGP8TJ1ca0AVG+AFy6lSoKhFbF7mIcmd0+H@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUz43iEhTAlszB+d3IbAzMDMfX+w61keuYC2lGiItIJlEarFm
	jFMf7QCiBniA1lSJ3JUuU9NWT8QyKYVMS0cL9gfELSohkRMZHkrL
X-Google-Smtp-Source: AGHT+IFo7rHKvTBfkgSDVk71Ltxl/K3wmUApqvZvH6fLOo+INrpt5eZJKuvqCx0VeTMJAqf6rt54Nw==
X-Received: by 2002:a17:906:4fca:b0:a8d:28dc:9e2b with SMTP id a640c23a62f3a-a9004a66ac2mr70079766b.44.1726003790444;
        Tue, 10 Sep 2024 14:29:50 -0700 (PDT)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72e7fsm527017866b.109.2024.09.10.14.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 14:29:50 -0700 (PDT)
Message-ID: <f9cbd1c3-eb05-4262-bdc6-6d37e83179e5@gmail.com>
Date: Tue, 10 Sep 2024 23:29:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] platform/surface: aggregator_registry: Add Surface
 Pro 9 5G
To: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-4-jerome.debretagne@gmail.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20240908223505.21011-4-jerome.debretagne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Looks good. Two very small nit-picks below, if this goes for a v3:

On 9/9/24 12:35 AM, Jérôme de Bretagne wrote:
> Add SAM client device nodes for the Surface Pro 9 5G, with the usual
> battery/AC and HID nodes for keyboard and touchpad support.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---
>   .../surface/surface_aggregator_registry.c       | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index 25c8aa2131d6..8b34d7e465c2 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -390,6 +390,21 @@ static const struct software_node *ssam_node_group_sp9[] = {
>   	NULL,
>   };
>   
> +/* Devices for Surface Pro 9 5G. */

Would be nice if you could change the comment on the SP9 node group to
"Surface Pro 9 (Intel/x86)" and the comment here to "Surface Pro 9 5G
(ARM/QCOM)" or something along those lines to make things a bit more
clear.

> +static const struct software_node *ssam_node_group_sp9_5G[] = {

(This is really just me being a bit obsessive:) It would be nice to have
all-lowercase variable names (regarding the 5G).

> +	&ssam_node_root,
> +	&ssam_node_hub_kip,
> +	&ssam_node_bat_ac,
> +	&ssam_node_bat_main,
> +	&ssam_node_tmp_sensors,
> +	&ssam_node_hid_kip_keyboard,
> +	&ssam_node_hid_kip_penstash,
> +	&ssam_node_hid_kip_touchpad,
> +	&ssam_node_hid_kip_fwupd,
> +	&ssam_node_hid_sam_sensors,
> +	&ssam_node_kip_tablet_switch,
> +	NULL,
> +};
>   
>   /* -- SSAM platform/meta-hub driver. ---------------------------------------- */
>   
> @@ -462,6 +477,8 @@ static const struct acpi_device_id ssam_platform_hub_acpi_match[] = {
>   MODULE_DEVICE_TABLE(acpi, ssam_platform_hub_acpi_match);
>   
>   static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
> +	/* Surface Pro 9 5G */
> +	{ .compatible = "microsoft,arcata", (void *)ssam_node_group_sp9_5G },
>   	/* Surface Laptop 7 */
>   	{ .compatible = "microsoft,romulus13", (void *)ssam_node_group_sl7 },
>   	{ .compatible = "microsoft,romulus15", (void *)ssam_node_group_sl7 },

Thanks!

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>

On a related note: I'm wondering whether we should also already add the
ACPI IDs for the as-of-now ARM-only devices. Technically, things won't
work with ACPI right now, but it's not because of the SAM driver stack.
Or maybe at least add them to the comments as a way of documenting it.

Best regards,
Max

