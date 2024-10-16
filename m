Return-Path: <linux-arm-msm+bounces-34574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF99A06C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C6928165D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42EA0206069;
	Wed, 16 Oct 2024 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9W/hPY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA13C206063
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073588; cv=none; b=hpn1SJ7Jjtk4tzQk8vazUn5uUnOdacHM9DbqhJcKaOB8xdrrH7WzOCezl+SB+1otKNVAkaqSUnovBFidSuP6bAhQnpDcnfTKvVY3cUnDfAhVLVC3+7PErU/hfcmbns5LqDsVBnnVnQCD/zpvtRk8kFEKLg1M/L1jPYhRwNx5b10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073588; c=relaxed/simple;
	bh=kosfGqgbsmrPziE9kV+KR72ZR+ghK9krbvSRCLCr2No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ge6XUikO+7QTa3aYWiMY0tnay2l9DngghX3mXtfD9975HEJH0e388ON2zMLeY8xNB8lTl2YNIZyYa96V6FFevH6OPyPxzkzitxrxwLjUHeIBaHf48g1948vm4jRlb2LXnC3f9VcTh3y6m+SJhUzgVt59//mftMdt6g0K6/RPzMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9W/hPY8; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e74900866so1348609b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729073586; x=1729678386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zGqaylQwMPncUgZAWjBSrfBO2NTDcUGb2SRsgnLhOxo=;
        b=m9W/hPY8ZdHxA14A5zzgPawDu1z+9gtGFg5Gl4AyZC5Smc3+th2kJ5jwepf7XSptb3
         F8sPiqiYIN57M++Hr4clI6pOniSRK+B/a6ZdRqV7okHD38Z+sEvFyzJbZFusjk1kFPxR
         xbFGNvVj9pcoYMhPwBRfrXJquz5b2w1M0mqp+VLoQdShvOicqTHuxKIvFYMXHE36ooRI
         jHLpRyFoaCAqo36+qFGbVN88nVqM9TyHD/jswuXFH+kmVLHRZW4zFeoCiJwD6ZnnaSMX
         1FjGw452wgmwANh3JjTnPW2btWIb9g/uKM7kfDSRLoXu7deLTuD4jx24A0u6WDdQ+Lhz
         B+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073586; x=1729678386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGqaylQwMPncUgZAWjBSrfBO2NTDcUGb2SRsgnLhOxo=;
        b=fzxbeZ3XklKVtlHZ5gWXI7/3iMhcLnYx2U0mmJGVgWQGUFsasEr1NhwCdjKu3v752Y
         k6Lm/c8zCHsnjYkQjCrcI1pPXYPyI4520ijeBamRKPyVMfzA6zH8PD9o/GeV/mzvgdrg
         hTukEFWH4FippStq6l/4mdDN3p6646zF6KaXycpOkDqfPRlIMUXi9NK0JShmCB8mLTTs
         vdmqEMZJkBm4Z/nLwSPpqHURvrKv/jNQNxfQ0yE8kO6d1oN2GW+63gWrpDVNJyk42e2B
         hxfWLla6jQ+0T4A6h+5s73FMWCdwZGPJQYWCDdcn902mOEjDEt0iPB1lFWuR9uPSx6Sq
         XoGA==
X-Forwarded-Encrypted: i=1; AJvYcCUrY+xVEhQMRVanxF15Sa/dP+WFLeaAoL2Tq+ZDnikruFMJ8IgaX8L+ZsHBkQSr+Ofzsdo9Ehufjthrqj46@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+wVakA9G8LfdRjWoUqX9zOduqwUe2raGsEafPdIhFbBpw+N/R
	Tpep5eF/VxhCDggorHo8FaK+NSM2+74Vk64eOCxKghJRGhAiqbpQosF11LiAu927wQUULhrv1sM
	+Nr9KxfDqpzdXQqhS3JnYGkNwQXVBNumcEStwPA==
X-Google-Smtp-Source: AGHT+IEwd8MyH0+hSWZmYNw9ouU9HGb37kPhwSSchuPN6fwimoBy0iCQ0MBwEeyLx5gd0WMH5d1z8hura0zTDHH6+Ys=
X-Received: by 2002:a05:6a20:c890:b0:1d9:2a8:ce1e with SMTP id
 adf61e73a8af0-1d905f11a51mr4153381637.30.1729073586095; Wed, 16 Oct 2024
 03:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729071414.5410-1-quic_jinlmao@quicinc.com> <20240729071414.5410-2-quic_jinlmao@quicinc.com>
In-Reply-To: <20240729071414.5410-2-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 16 Oct 2024 11:12:53 +0100
Message-ID: <CAJ9a7Vgz7Nhm-6+=PA1=5B5WaRAVqt4fUvUPHawW2zjz1z9+BA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: Add arm,trace-id for coresight
 dummy source
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jul 2024 at 08:14, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> Some dummy source HW has static trace id which cannot be changed via
> software programming. Add arm,trace-id for static id support to
> coresight dummy source.
>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> index 6745b4cc8f1c..ecf3ba9cdd22 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> @@ -38,6 +38,12 @@ properties:
>      enum:
>        - arm,coresight-dummy-source
>
> +  arm,static-trace-id:
> +    description: If dummy source needs static id support, use this to set trace id.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 111
> +
>    out-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>
> --
> 2.41.0
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

