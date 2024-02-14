Return-Path: <linux-arm-msm+bounces-10989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E76C8548CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 12:58:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C34361C22297
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 11:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405761B7F9;
	Wed, 14 Feb 2024 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TTrHitLZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719931BC2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 11:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707911861; cv=none; b=DnXbu7wVFAXapg4QoAaDKQDLuA2sxkeEhZbm1Q5EcWwUiz4s7LZYPYpaCJZu987DZUXmy+ElPaFcMNpOxfIUC23Fz2oJj2Yx9aBKd0Ph68AsfBulvC+RWd2/1xW8Z7c4n+wyntKsYgiqjhtPYMSAikuNHmTK/D1YAd2uwO+19No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707911861; c=relaxed/simple;
	bh=h4KbTL61QB+JiFC9XG6gAWCagP6OOPnl1hSrrrkSn/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBwWkyb87vLddnnLW2hQ4I2D1SBg5u6oyO/+bmvDEYlag/PAeobsWVhuHaW9eBi8yo7zrb1AvVceQKT+g3Q8vdb3XXelvj1FOzLSP6BCVMNz3XdaRnuhq+LjhTv5gbitCO61vVyYX1NPt/b4QM+WgRmgHgo4XKB3EIenjreQ8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TTrHitLZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5638de1d953so250651a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 03:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707911858; x=1708516658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67q8O6A3dDM88ECGRBJ5lZvEBNDnrZm5U5GWLi3eh9E=;
        b=TTrHitLZxZ7tH03ET0RbLTEKI3/tokTESngWlDZrONg0NONUJ6HFMoEkcssWHTRT3W
         jtKSOraYA/oWZ0ElFl3dhR5cDdLrmmk0s7DhJh6YhCJy7XmCaazJ2hC6I5o34NF+KzQP
         WPsVaEeIuVtADiyisA8FXGvYfRWqmnKbh0K7cs3RHlLHSA69Qvw8kAvSt0poPLrx0fLv
         siV6McpBRdrSi4N+i2jEFjsjPjAPgMTTT0kzOZV5vvWMybIx+nGVTWWhyDBGl4zMqfeJ
         3TckMXO8W612W2Rk6X4w8fT1sOq4/9BkC+TCbNcZnCX8zlbdcqzdqf9Pc4zix4JvxeBy
         2zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707911858; x=1708516658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67q8O6A3dDM88ECGRBJ5lZvEBNDnrZm5U5GWLi3eh9E=;
        b=hFwA3ZOl5cdB4vOb7e6vqW7r0pMUoDJwXz8hHqie2aHRf0Edhn9X0rBSP90KGqcCpO
         H5Gkrr3Klr78Cdl4SnTM8ltS6trNPvJ9+Y0dIye45/WJnyPDGhI57xVhzh++CpMUvdV/
         tmaPzljwuAQiKs0sLFC+yhGwCTa+Gv/ZnGP4Tpz10W2VxGGrfw2/onRyakGZpmHqGKZu
         /ccSZuRR6+BZQJl+9dtQf6qodHNV+fXaf9x2fy8q3uM3AtcB9/KYBxkfEszG/fjt8iCD
         SENJUO7F//FprhPhC/9ClDk1NkA/q4j6Y6mfQWODssUa2pvr2lRoOdMOov2O9vypRZ0q
         aPkA==
X-Forwarded-Encrypted: i=1; AJvYcCUfP+qj9FxxsCR76koF36VfCwVOSqXCStkyPnzMCFkTr2zw2IiBTabwqICazE/n0hGFp8AcmJ5Y6Q3Li7L0rgW3chU8IA2BWeekyWSs2g==
X-Gm-Message-State: AOJu0Yydj4G2v5qehv3epFk5xAsKg2Z+lCjVQP3ZICH3tYmLfhLntrI/
	TT6lDdlhDrxhySDFBxRYzW4mprryKs8Ytrg0CAQ8ydZvM7zB1fdN/u/TPcRE9YA=
X-Google-Smtp-Source: AGHT+IGE1Vuu7kglDmlBOi46q1a0g5RNdAQeeirYMFNz+tvDmx6rwXqVbVxN462cZFPcPsNwINX0EQ==
X-Received: by 2002:a17:906:5291:b0:a3d:5406:a437 with SMTP id c17-20020a170906529100b00a3d5406a437mr889248ejm.28.1707911857651;
        Wed, 14 Feb 2024 03:57:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVN8h0YmVC/rv0qAQYdSl4KNCIy+El5+WYB8lB5xiPBKPn3aLgLPJMrvXLIuDatahpbtz316xK0RKE9baEAzgEQTBcccwDm4+5V9V7NwJ+cf2XRWuoHnbqARh2FQD9Ml/kmm71rpTmU7S1gqN6nmePf/ZRhHBbECwIXTpdrVKa2p0fLJQWblUZmU7+IO7NwwjDGdZm46V62UaB6/TLbMJaKjotg7MttGq5ewADhqpxDRPYYWLehxi+YnSCDEjfE3pNO4fqWEx8WrYF+6E27LbnpsQRFibYUJxyGR/okQWx/3HCG08GhcQ8iv6IwVIus5yAT66vri30cro5zA86/xHOf8E7z8deH6lF2wupoMm6taXHyQsG9Tm6YB+qQHeVS1XDeokxjnEBRr6NtRx4hior7u3CvL3U+lrLhoGToIpaX2ORcey8phOcnHCjlEnVlbCdg6pdaWdv/U91qZlw6
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170907b9c400b00a3d669a2055sm88651ejc.88.2024.02.14.03.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 03:57:37 -0800 (PST)
Message-ID: <d1d95a3a-8164-44c3-9156-5233d3e787ba@linaro.org>
Date: Wed, 14 Feb 2024 12:57:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: PCI: qcom: Allow 'required-opps'
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212165043.26961-1-johan+linaro@kernel.org>
 <20240212165043.26961-2-johan+linaro@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212165043.26961-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2024 17:50, Johan Hovold wrote:
> Some Qualcomm SoCs require a minimum performance level for the power
> domain so add 'required-opps' to the binding.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


