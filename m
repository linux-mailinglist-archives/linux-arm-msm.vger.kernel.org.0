Return-Path: <linux-arm-msm+bounces-31729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 196A797814E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 15:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B93E81F2512E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 13:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329751DB52A;
	Fri, 13 Sep 2024 13:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uReTE3yz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A657A1D88DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726234685; cv=none; b=tm1hSK0d/nZR7P8Zmb6+d5XgZpIl6ELEQ19GgTuJ4wAU1Vumhcno3gWdFOkaaD8Y6FRCRecIEFxzRxRlK/syZJt8u4ytYXD5wX4fjp8hjRwnqJq7YLTFI5ngTavEtXbG8gn1eUTLG7T4eifaSc0xTPr5u+q9c2iwmRdfG3kUUqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726234685; c=relaxed/simple;
	bh=PWgO44z09ebmgMtrjRxx7dE2A2UuqzUQ+JDOYxYQtpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J6XyF6k8rrgZ1LtFFNGSjlucVCc6UAFQWalOt/+aI/ho7C7B9Rkzge6oehRMROZXMKH13yfBfmhwFsStWLamEcuazxYzbLQ8nIsUG8jvgxvxpV826t9cbtoU51IlZDCJt7TMHfK8ZDlhvlblPzWUOE/LYMa8QLOHdDcw8ccu228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uReTE3yz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7191901abd6so677958b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Sep 2024 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726234683; x=1726839483; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BI2hDmwwKJCOx3VYE7RIwF7HNSiMnl3DjwM5Z3iw39A=;
        b=uReTE3yzkZMxJLBygzZm/+F/nhnRqFeFBsbDzCE/xZ1J8G9UaS9JJQWBJR3T2CFXnv
         qjPTlIKJAm6mcY12Ir4dTyqCmiZIg+ltlf2e5BP/VtWXuf5PjGoeKE46T5EuRg2UMvqL
         jwX0nN0i+1B5tUHtkuiNN7SjG+uWSColIzBuMNtRTs3nFjegHBNnLDKNdQ9qhC1gx743
         pKhYFPM94EcvRjtPQgIIdcWnz4GbueuxEsLZkyMz0g1O0rP8K+4WATRYRyj2g0UaMi95
         YwoG0Rsq1apHNEpdgIxTqKtjDCzU08PkrCGWO1nsbk4jy26WxkcUQzkwLO3c5vn148EI
         CIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726234683; x=1726839483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BI2hDmwwKJCOx3VYE7RIwF7HNSiMnl3DjwM5Z3iw39A=;
        b=j8uguZ/R3YSOraQNOzL8XhFi5Pw2oWchkJc2afnKwrD5NIGmGgR+a09lEt03zgbYdF
         ufVTduoBRDO6BRFm0vYgnT9GJflegjt8id22KaIW5/xLzExg2z1c/L1FXULoDgh1whu8
         NHlfOG60hio8A8FXPmonBD13uK5WH+efy2mKjFHZIL2iN7/eldlp/ES6ThKc7MeOUfFG
         zIC9AoMA8+ux1YclvYv9AZ2M/Zzzdmnh0V57gDLPEWKIZZrlGRVDGDCcDSx48keWJisU
         vRbOqFT+KvLpRVYKHS5CScCXtis5Ro4tmOadQ5wsmYtgBrK2HOP46/k9WgJYI0z7vHnZ
         reJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3byZMYn7V9XkkfiyM88kK1wBEFlXz3VUxdTttvfZUf15R8f5YA9GJSWIRrWjq9j7x7tvXcSJt21oYrGu3@vger.kernel.org
X-Gm-Message-State: AOJu0YwfIWmbInCRclcZyFUh9+nW7ND+DxfE0PW1HR0Lj76LEfgvq07n
	3XBL3AUAVRTpI1SkU29AqQpTWqnI6ex9AdgmLNCg0I8UWBFI2r8YhmsioeA17A==
X-Google-Smtp-Source: AGHT+IHkmtRHQ+rUmoFYCE/1t6yyLL89sOdatHoosm5maSEtNzYl+sXUvxBNTHJPrww1u/l+DLihkw==
X-Received: by 2002:a05:6a00:1ad3:b0:714:17b5:c1d9 with SMTP id d2e1a72fcca58-71936a2f094mr4539801b3a.1.1726234682735;
        Fri, 13 Sep 2024 06:38:02 -0700 (PDT)
Received: from thinkpad ([120.60.66.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b2c3fsm6095724b3a.165.2024.09.13.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 06:38:02 -0700 (PDT)
Date: Fri, 13 Sep 2024 19:07:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy:
 Document the X1E80100 QMP PCIe PHY Gen4 x8
Message-ID: <20240913133751.2yegqbobvfzbogxc@thinkpad>
References: <20240913083724.1217691-1-quic_qianyu@quicinc.com>
 <20240913083724.1217691-2-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240913083724.1217691-2-quic_qianyu@quicinc.com>

On Fri, Sep 13, 2024 at 01:37:20AM -0700, Qiang Yu wrote:
> PCIe 3rd instance of X1E80100 support Gen 4x8 which needs different 8 lane
> capable QMP PCIe PHY. Document Gen 4x8 PHY as separate module.
> 

Nit: please use 'Gen 4 x8'

- Mani

> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml    | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> index dcf4fa55fbba..680ec3113c2b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
> @@ -41,6 +41,7 @@ properties:
>        - qcom,x1e80100-qmp-gen3x2-pcie-phy
>        - qcom,x1e80100-qmp-gen4x2-pcie-phy
>        - qcom,x1e80100-qmp-gen4x4-pcie-phy
> +      - qcom,x1e80100-qmp-gen4x8-pcie-phy
>  
>    reg:
>      minItems: 1
> @@ -172,6 +173,7 @@ allOf:
>                - qcom,sc8280xp-qmp-gen3x2-pcie-phy
>                - qcom,sc8280xp-qmp-gen3x4-pcie-phy
>                - qcom,x1e80100-qmp-gen4x4-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x8-pcie-phy
>      then:
>        properties:
>          clocks:
> @@ -201,6 +203,7 @@ allOf:
>                - qcom,sm8550-qmp-gen4x2-pcie-phy
>                - qcom,sm8650-qmp-gen4x2-pcie-phy
>                - qcom,x1e80100-qmp-gen4x2-pcie-phy
> +              - qcom,x1e80100-qmp-gen4x8-pcie-phy
>      then:
>        properties:
>          resets:
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

