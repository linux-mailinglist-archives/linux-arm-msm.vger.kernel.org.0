Return-Path: <linux-arm-msm+bounces-1499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A867F44A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 12:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B0C281548
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F9C249E5;
	Wed, 22 Nov 2023 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SrQwfrir"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C70A110
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 03:02:56 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-da0cfcb9f40so6446922276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 03:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700650975; x=1701255775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=judoGuVj96yz0cfO1+LrQgdiCfR9oKHOka9ldKzU/iQ=;
        b=SrQwfrirV/5VWQilXkyfyRtt5jvd+FoLmuNpVWivxbn5oUnX+jRa2MOecV/oU9La3v
         ZYH3iVBOSwd9FwY+YKEPqVMEUmxNF/GnAmWAsDKXDDwaNg6Wq8KO9yeIB4xqR1UnTmtI
         qeHFlJmciGDxuNA9QIN3z6uAQ01dbiT7dF2/ILFTee76YpuZMFdn/cW2uTxyfY13LZrx
         i+M9OAegEWqsVY/mULJWzRt9Qv8qOlbI9MNoAGxB2ZnsG/eayPJhGb8sUyJG/DiqG3Wb
         EEq2G+u8yh6yu6QTI6YKdnQqNhw9NkNsm29/ccsyPGqxBC/JHEyN5Uzg2DYSuL8Fkjl3
         gMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700650975; x=1701255775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=judoGuVj96yz0cfO1+LrQgdiCfR9oKHOka9ldKzU/iQ=;
        b=lrjHIlR15p5BXStdNVpU0qIJn57/q73FCCzdxzHi+oH991xlPmHqLFVWQU59KhxG09
         fIoLyqKacTBUmw5+XmDNjpPVAZl0MXABIEVKFAGAzpoylZ/lbHJk+MuQWUGDHPo3bIVA
         q0CI3hCvMHMPf/nuuXBhjaRL9rrVup/qHj3uvL64EBUiUk/LtW1RO3uXsO5Pg2QUxQgs
         gQvUWI286Ebw57CLCqvbILlWQO1waXiyvK/osSH7XrWtWtebvATNTmZ72BY2CfYS3pEp
         kCgswRW1jZw5/0ss/H2rUjyt0LPUunl92XOc2K73zu4QSVsKxaUPrV4qPuwXSAFz4okC
         fK+g==
X-Gm-Message-State: AOJu0YwwkgkZt/7KCFldFPyQ0c6os2rp2Bwr9NrNlqMjy0m/Dost5Z3E
	jCALnumSfQcHGnT5CLHP28Bkw82Iv9xu+DInnAzmYw==
X-Google-Smtp-Source: AGHT+IG7QtdXMD/IbuQvfyaSezE4/wn9Rzi9wEyWCao4R2S63hXyZv7aDlf2lJ46E658E4CV4osFbPqMxC2QwFZs1R8=
X-Received: by 2002:a81:93c4:0:b0:5a8:2037:36d9 with SMTP id
 k187-20020a8193c4000000b005a8203736d9mr1961750ywg.25.1700650975747; Wed, 22
 Nov 2023 03:02:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-eusb2-x1e80100-v1-0-ce0991161847@linaro.org>
 <20231122-phy-qualcomm-eusb2-x1e80100-v1-1-ce0991161847@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-eusb2-x1e80100-v1-1-ce0991161847@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 13:02:44 +0200
Message-ID: <CAA8EJppov1ZtJvxyiXwik77bs5=dDfE_k_Wv8-DyzYtoEzvv4Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: snps-eusb2: Document the
 X1E80100 compatible
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:28, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 compatible to the list of supported PHYs.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> index 8f5d7362046c..ea1809efbf56 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,sm8650-snps-eusb2-phy
>            - const: qcom,sm8550-snps-eusb2-phy

Ah, I think this answers my question for patch2. Can we instead reuse
the existing compat string as it was done for sm8650?

>        - const: qcom,sm8550-snps-eusb2-phy
> +      - const: qcom,x1e80100-snps-eusb2-phy
>
>    reg:
>      maxItems: 1
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

