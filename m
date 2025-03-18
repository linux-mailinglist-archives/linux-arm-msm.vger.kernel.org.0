Return-Path: <linux-arm-msm+bounces-51669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54983A669A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B8557A60B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 05:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1C91DC9B4;
	Tue, 18 Mar 2025 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPoyQHNN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A201C173D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742276502; cv=none; b=TcaLyWNFkuR6YTW+GaJTzb+OssaNFBkNaZ/8ci+7OJ4h9YUDUkZgy5yQeits/Hjg8UB7FaT38gf2a4A9OAYrx6AgnGbo8YB47LtMq4zrGRaFY0gttjgppMUjsXkggkkWUIU7r6DO3+ceFwvv7NSeOqtePj38dLAf9oAmt0MvGQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742276502; c=relaxed/simple;
	bh=mQj6tFq/A+KM1NbxtHNGKYMq97ddoFu6i8FJTPyt8CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2mxWPQVaIVbOeFSszBTaGduLh8/13QgXfazmE2pxwzZBBwqWQKKayfAmheWhBj9fIn2UG6u+Zv48vapVNo63JEFkb0054I2C8kXCRtwpPyXidZr8GXb7kBmWfqSsoluKakhJdePNafiDpqdmBIQMXGr8JhEMvDQX06259Wgwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPoyQHNN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2243803b776so58543945ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742276500; x=1742881300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dFhxTV9vQHoJcyDhkGjeDrqWSmMQ/bwgeo19wSWQ6dA=;
        b=FPoyQHNNaRxULjwAhYThZekPBOebtiSbRBkZL/T8E3cNM6h9gdujgQ46oR6majlMdb
         eULp6QozqcK7YyCYnXarERdVvWeZwSs6dHVgnV0eGNZj1Bn0ecliDPORvMDRneO8p4uI
         K1/SGq8hai3V6548OD28CdLdokVWiA1LoEJcGCefbbF86zJDTBq+WNfSl4R3j19VQ8fK
         eO8jE5EOArqciaXWlkX3qjpBJwIwxo7zC9vFrbxsOJNwTvxJdlt878oLG5jf6l8ZnXgG
         NHJV/6NXBvYxdlMdrGtVhANEs2DrEHmjU91I9VL1Ckl15ZIsj61rFjcD8pvQTTBtqRj5
         ebhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742276500; x=1742881300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFhxTV9vQHoJcyDhkGjeDrqWSmMQ/bwgeo19wSWQ6dA=;
        b=tLHWxmTM6kbul69vhl5UqkFfdYaSnb0czq8F3x5087ij2ufcfr3J+wkOxSMiDZ9ffC
         40HoQyk7eLkJMVy+lISxSiLvcjD+oP0wD0u7xE3TL9Gyj1HQbUCS7lKgate6ecl3YJAE
         LVzbl3hm/CD/NuPxaFhDXFxE/uj4K+M+pU+40gIuNPgdrSLA6X7rlQDKodkqcoo9t9ys
         lN4I7Gp9sYuzaDqMjyYcd2dhdQhz6uL/lxyedA1FsmM6WdEq3x8whUwhmcUqcUgmHbPP
         Od0GJT2koim7qObS65MWiyKX63p4N0MCOkTFRxfkAgu/TFdLX6L+W5zGHlgKxZAgPiUE
         nEyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0nyyrS0Fonkym8nePVv10G+t2kmS/XcltrSY0za5NUqqK8qkCCQai7/+wMwoShXMyoTuJj+qWbnFbCjX3@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ5LZJRa2GU5qpQ+bzcNJF4p1NIEbHbnqLDUGvga40xOAkldu5
	3jCFccC2Xkm6it6P6/cXvOG61U0cQN0xoaArOck/l54h8z8rVB5uVoGP3Fh1rg==
X-Gm-Gg: ASbGncutFe9WFwgf+Jpxbrzff/01nBR3T+00l+o/+X1onwKFK2KMJhPlp2S3717gfbv
	E0DAiIYGxN2n65eGlZWoqbwGkWHA3RltjPKGZ+xQYYCK5d7bi8vwN/X1H1rVOpOkw2zUJFKprqu
	41RnhbHlOeTVqRIsMGsb4dHmwXh3BTFFLOF6QURCCM3AiKgg8UPRv/iNqUnIxvgk+joz9W0z7dp
	m6LTLD5qYtgOWi0F/fYV6JQygx6U0CXTBGJGsEqKz5O/v2XIePAOAEOvg8/N/mcuwU2/RJ4Syef
	MVOrA0NYiCqzU53h5DAMjDUB59hwtMorDEncwL9nCQ/vVrCshsrLbu+FAxQ67Fa9P0w=
X-Google-Smtp-Source: AGHT+IFrbYeRnivYWhqthfQc3eWy+MTQ83guEmTp8doGdlxwXja1s1CeoiHOQzGg4CwnkxsA7aHQYA==
X-Received: by 2002:a17:902:f708:b0:223:90ec:80f0 with SMTP id d9443c01a7336-2262c55fcafmr33444765ad.22.1742276499952;
        Mon, 17 Mar 2025 22:41:39 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68883f2sm85528595ad.7.2025.03.17.22.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:41:39 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:11:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org, abel.vesa@linaro.org,
	quic_qianyu@quicinc.com, quic_krichai@quicinc.com,
	johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 3/8] dt-bindings: PCI: qcom,pcie-sa8775p: document
 qcs8300
Message-ID: <20250318054133.zrobaf5tvu2m4x2f@thinkpad>
References: <20250310063103.3924525-1-quic_ziyuzhan@quicinc.com>
 <20250310063103.3924525-4-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310063103.3924525-4-quic_ziyuzhan@quicinc.com>

On Mon, Mar 10, 2025 at 02:30:58PM +0800, Ziyue Zhang wrote:
> Add compatible for qcs8300 platform.

...with sa8775p as the fallback.

> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/qcom,pcie-sa8775p.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> index efde49d1bef8..19e3ee1b380d 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
> @@ -16,7 +16,12 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,pcie-sa8775p
> +    oneOf:
> +      - const: qcom,pcie-sa8775p
> +      - items:
> +          - enum:
> +              - qcom,pcie-qcs8300
> +          - const: qcom,pcie-sa8775p
>  
>    reg:
>      minItems: 6
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

