Return-Path: <linux-arm-msm+bounces-19814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FB8C4CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 09:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 291E9B22160
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 07:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B106636AE4;
	Tue, 14 May 2024 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFnuYnPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03391374F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 07:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715671507; cv=none; b=IFx4srcC6HSpW5h1WLgWV4p3E1eXV7yy7O1699DOa6ws80fxeENiIhUYfPIuKlLjOL0utMAGd5kVRwRblwFaz9FJVYFYGm5kjEDnxrU7nsLH3HuudPBlxf4LepI4d14TQBr2CQmBofXjrn2cO7Kxs6kexOiJnjAlByGCoyBMvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715671507; c=relaxed/simple;
	bh=MrsK/SOAFyvJ5rW6noiqY2i2AWXHF7hXaxT2Iuly1Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbOkW4z+/Fdz+HqajQecD5VEY0N3K2HtOy3729/pD1Fd/9byfYacLn4TLMOwKY/bqzm3iPlc3Srs8fDVXEkfupbXkSp8xuQRyvYAv4IyUx74Ygx4L7HDUBu/+xw7xXpwx29eMvrD01UvN9oaYcNE6Pka6MPg6WPcx5KfpbgRfFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFnuYnPi; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59b097b202so1117056566b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715671504; x=1716276304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JB+Z0CRSJcLUU9yXDS+6zp2SY8ySyHlLC8dbiqLhtlQ=;
        b=VFnuYnPijUKB5OvXDY4k+InVPo5hmPze9ahmz5tkhJUqO7fsoeww5VCnnSCFttYCwU
         zcRnuUzTc0WaHbUp03SF28XAAbAaMvDY77hYTr8pVB2nCUfgwtZmN3hb7S0uNp0FrE4R
         ogOw1rNBSlcUrt6HzNMJEkq1qwAANH0bZMLBpyPvJKg6NdkctCoNbx5ieROcTDHE9ZOK
         OYbZ8tvx8YLKE/mHQ6yz4+kg/ch95kQuL7LmmsSZcuUg5VemintQU+s42IkTSIAbcZvV
         CwBdjJrFz1/eroLQ78WGb3KhYpTLgy7vpJXolTI140gMdYwsmZKxccYLggzpmEgE/Kww
         oKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715671504; x=1716276304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JB+Z0CRSJcLUU9yXDS+6zp2SY8ySyHlLC8dbiqLhtlQ=;
        b=SCgfyzbehyWWQfrWRN4zEKZ20Qm5GZ7JjHvDNNnIQWRBgAhVnCJ9/ZoYthHWE3hMI6
         wMapPd/TJu3MAEHgOteW5Ew4wKF5PFFI4KM6uI5JTd5CLlywDt/k7gTk9P5KpW8izQw4
         SZvC1rQkiSmSTpc55XS0QbC7VK1UYlrm8FlZFDR80UW+5PBIsQVao76YE0Gm4uX7C+p6
         I9pGHKaWUXvb22pBk7ycoAOdf04/lzNsFtrDSxmdWSOlxuRls4TayQRA5OK9ycLInNkd
         y3JYGJ/U49xXm7jR/gs5oaLoTLHP8Uu0nGVFzUYNLl4aREitiwC7NN1RTrinGFY58uCJ
         5e0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj1bVvp1zRYb4iynUrTIMwc2UeLaoZ55HtNWGZdAswcVNdED+bUxoKG1uGsoXpJ592uFqoD13D1BcJL9bYvN5X3W0BVkAjV52iesWcZw==
X-Gm-Message-State: AOJu0Yy2Jvh2F+pSDN17gToTvJSP7Z7nZ0rvA3OfY+geLV7VSi2J0Vy3
	nN4x8BMpkU60qc47pIEPZojlR4rDY4iJZ8gblbXNckExXgrs4xZOyIx9KO52SQ==
X-Google-Smtp-Source: AGHT+IEQTQ5t33iG1QpTljAk13ZjKCJq2arLVGhz/pfUDhGt2rL8ANrYeLV7xamqA3YFh7dM+6YrzA==
X-Received: by 2002:a17:906:ee86:b0:a59:aae5:5840 with SMTP id a640c23a62f3a-a5a2d6759e5mr1063776566b.75.1715671504270;
        Tue, 14 May 2024 00:25:04 -0700 (PDT)
Received: from thinkpad ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d2ecsm703097166b.16.2024.05.14.00.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 00:25:03 -0700 (PDT)
Date: Tue, 14 May 2024 09:25:02 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devi priya <quic_devipriy@quicinc.com>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH V5 3/6] dt-bindings: PCI: qcom: Document the IPQ9574 PCIe
 controller.
Message-ID: <20240514072502.GA2463@thinkpad>
References: <20240512082858.1806694-1-quic_devipriy@quicinc.com>
 <20240512082858.1806694-4-quic_devipriy@quicinc.com>
 <b3199f40-0983-4185-bd0c-2e2d45d690ad@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3199f40-0983-4185-bd0c-2e2d45d690ad@kernel.org>

On Mon, May 13, 2024 at 08:48:19AM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2024 10:28, devi priya wrote:
> 
> >  
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,pcie-ipq9574
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 6
> > +          maxItems: 6
> > +        clock-names:
> > +          items:
> > +            - const: ahb  # AHB clock
> > +            - const: aux  # Auxiliary clock
> > +            - const: axi_m # AXI Master clock
> > +            - const: axi_s # AXI Slave clock
> > +            - const: axi_bridge # AXI bridge clock
> > +            - const: rchng
> 
> That's introducing one more order of clocks... Please keep it
> consistent. The only existing case with ahb has it at after axi_m and
> others. Why making things everytime differently?
> 
> I also to propose to finally drop the obvious comments, like "AHB
> clock". It cannot be anything else. AXI Master / slave are descriptive,
> so should stay.
> 

+1 to drop the names.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

