Return-Path: <linux-arm-msm+bounces-4044-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4080ADBE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 21:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E41A2812C3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 20:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C5C57320;
	Fri,  8 Dec 2023 20:24:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55B2123;
	Fri,  8 Dec 2023 12:24:38 -0800 (PST)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-58a7d13b00bso1199267eaf.1;
        Fri, 08 Dec 2023 12:24:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702067078; x=1702671878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeRUCnhIs+MjcZMf3INslFBDe93yrMCfKLt3hZl/RSc=;
        b=nZoFGw6gw9S8zD1MRl1q4u0bJ6Zm/ALRjtgGDCdIL/tZtwcsBO4awm6opzQtYSnvt8
         hhntsgdpO1Vaycy537f0+AR0aeU2NuDT1WWoMmrGxW6CkmqFXL/IvFrGnz4tjdjsutRA
         7LOEoHAy74va2Sfmjqe0oMI/sTMJnvyAHcxmZbOwGtlbVU8ilRU/pyYrMmBixDnbpBJe
         DtDNyjbvUQFRDsHu+Ze8JtfnIiZ93qVC1D2Kv6EYFbVd8g5AbnQJsf6y30UUlSVLY1Dq
         n8ws1kxtTCSfI08O3FYVCS6ejINvR2C1LrH9WBYeQsTe+Bgl7cVu9HGndCuxYG/d6H0i
         molA==
X-Gm-Message-State: AOJu0YxEEQQ3jnHehqMXJI+9is886uBGnVriShLFigfWA7cVGiwAkPjN
	HKnMeT9GKHFtOq600goBcA==
X-Google-Smtp-Source: AGHT+IGz484CJxbMb/7Ut+O1ziOtwwClOSy6kCgdo6DSvH32Bmk/xC2cWOZaQtMZG0tYjzEef8Zf0A==
X-Received: by 2002:a05:6820:2294:b0:590:6b74:3bc3 with SMTP id ck20-20020a056820229400b005906b743bc3mr817431oob.2.1702067078109;
        Fri, 08 Dec 2023 12:24:38 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a4a7609000000b0058d76e8ce0dsm430434ooc.36.2023.12.08.12.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 12:24:37 -0800 (PST)
Received: (nullmailer pid 2644655 invoked by uid 1000);
	Fri, 08 Dec 2023 20:24:36 -0000
Date: Fri, 8 Dec 2023 14:24:36 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Mao Jinlong <quic_jinlmao@quicinc.com>, Hao Zhang <quic_hazha@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: coresight: restrict single port
 subnodes
Message-ID: <20231208202436.GA2627018-robh@kernel.org>
References: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206115332.22712-1-krzysztof.kozlowski@linaro.org>

On Wed, Dec 06, 2023 at 12:53:30PM +0100, Krzysztof Kozlowski wrote:
> "in-ports" and "out-ports" with single "port" subnode should use
> "additionalProperties: false" to disallow any other properties mentioned
> by graph schema which are not applicable for this case, e.g.
> "address-cells".

The graph schema should already check this case with this subschema:

    oneOf:
      - required:
          - port
      - required:
          - "#address-cells"
          - "#size-cells"

However, I now see this would allow port and #address-cells if 
#size-cells is omitted. (#address-cells is a dependency for 
##size-cells, but not vice-versa because interrupt-controllers can have 
##just #address-cells). Perhaps this should instead be:

    oneOf:
      - required:
          - port
      - anyOf:
	  - required:
              - "#address-cells"
	  - required:
              - "#size-cells"

We're missing a similar check on endpoint. Or I'm forgetting why I 
didn't add it.

I suspect there are a lot more cases if we fixed these in the users.

Rob

