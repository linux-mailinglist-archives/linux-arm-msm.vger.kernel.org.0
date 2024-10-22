Return-Path: <linux-arm-msm+bounces-35387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DE9A9F24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88317281CA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8E219922E;
	Tue, 22 Oct 2024 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJkm1B1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67776196DA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590595; cv=none; b=BSPL6Erfq56RiXRL4LAwOxhe/mfOYckOb0WsHKseVR6wnKHovkLBI/qEO/hTckmv/eMkGDy1lOvadXYjrfMfJNB3vcPQOh0hgIdoBIxHLX8hakBuToQprSzP9HK69bvcUefPmlJ1tLZgBYu/iuWz7djoTUfSQLJ3hHN07cvpTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590595; c=relaxed/simple;
	bh=ucPxv8v8063nhyvHkY26XrVe11xBeay7vWd4UaefvoE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHdrv0RbTD08GlvnxOU6jpMD2/aD377y06yUxfDExPE+/2aO5ZNG1JvGAZrjhil7rnFQetqEifZA57WDrA6ZqXgaQJ323zrSh3ZPhcEUkGpWcs5qbIJR8KJVVBkpChQ1BR0bUDNm9L8wJKW2HBi9qg6OA+y75WWPhG5zfAxN7o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJkm1B1t; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso2883641a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729590594; x=1730195394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fRj9OXTql8TyVlExpaWtvY5+P9nZhBqC5DIwNAggGns=;
        b=HJkm1B1tsymwVAQmxgMlGelN6XZuRiwaq/KxTjg8qKenZr7B98Ltv0GmFjS9K0lND9
         y2dgc6AefLHtWasbrcPf+cG6+XotSdXV2kKIhJYryUBj2zYuu9TcV3DRh6+3jD0p6yEs
         QS8GF/oI4wIQoUvtFkJWRNtjoBsqpXnZvKeEa+2s6uPOOyGVWsxTcQXo1QABdJijMH5y
         fqoUPgw8ASxPufJ2S0nfs6uWm4I1IDooKG5DYuf1/hbxnJle0yNLk+PczRtaXa4jdInN
         7R4lq6TEFdCaL7BeIJdayFeG7ls9TqRubknDETG23ZmpG4ZdBpJttq3xVlPZLE+ay/uR
         pgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590594; x=1730195394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRj9OXTql8TyVlExpaWtvY5+P9nZhBqC5DIwNAggGns=;
        b=PJ8UoSPYIVqOpuWgJLWRxUdN9vsnjfbnF1ipCIUMV5pVkNfuwMq9DrMh2uoBbmKXVV
         6rOcULeWyy9vTb3eN6ElLvffAkYvYIborhAkY/G1o3unkj3rgfpiz4TvYPqC7brOLCBn
         zVfsGUNfL3T1zUfqg5sORVoUNFKylyADS5m5YLwf0Fn7qhcze1kTKCAXPdLSrNMBfChA
         QFjzSsqM23HH5eF8Xv+xRveuV6FEyox+5vnPy5DfoQX44pTfwLOfZ7XUn/R4xoDUZkB6
         HfeCuwi5JeNU3d0l3v0Jad53k8I/D3MMLEoHCggq2naDYxP+w7ckzNnUFWNshvp+CNc7
         T97g==
X-Forwarded-Encrypted: i=1; AJvYcCXIKmWyKqQO/fduWE7o9ta7bNb84fhtAua+EDAfyklgzaTBQInflnHfPemWFzjwYylH3JDP3hRUzbFSUGp1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29CH9N+XR1RERtOxoTbMMfLDd9G1YTLms893xrQazf+ZqkYLQ
	k0U3faFF1UT8eQQK1jPKxJv/O/JWklTsS4kqso+9JgFxZ193kkwGUuFZc/32lDFKnF13SrMZJP4
	KmtI2V648UqdsmD+14BwkTrsZWhY7x/SONzCH2g==
X-Google-Smtp-Source: AGHT+IEPl8TvCF4WHMkzmV6+C+089KSglwEosAUtKdVvP3kM20qYnQAdlYOhAKr/lEnlRi0DAeAxzTVKxy3L2gEvDpE=
X-Received: by 2002:a05:6a21:e88:b0:1c4:9f31:ac9e with SMTP id
 adf61e73a8af0-1d96df3bf9bmr1994876637.42.1729590593804; Tue, 22 Oct 2024
 02:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018032217.39728-1-quic_jinlmao@quicinc.com> <20241018032217.39728-2-quic_jinlmao@quicinc.com>
In-Reply-To: <20241018032217.39728-2-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 22 Oct 2024 10:49:41 +0100
Message-ID: <CAJ9a7VhkGrr10hT8-5r6Zp8SZj5hJjos8ZdPeOhuPqenMht_xw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: Add arm,static-trace-id for
 coresight dummy source
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 04:22, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> Some dummy source HW has static trace id which cannot be changed via
> software programming. Add arm,static-trace-id for static id support to
> coresight dummy source.
>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> index 04a8c37b4aff..742dc4e25d3b 100644
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
> 2.17.1
>

Reviewed-by: Mike Leach <mike.leach@linaro.org>

--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

