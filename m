Return-Path: <linux-arm-msm+bounces-32212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0097EC28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 15:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D51A1C20322
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Sep 2024 13:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB601993A3;
	Mon, 23 Sep 2024 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h8NwHA8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8653373
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727097582; cv=none; b=cb37JL0cZgiFURPPoL0t4rXu8UQn3FjWNNyQ7PPVfDKQAzrrtf+ynV3Q8AhSwjrVVaa8SRhVtIbISkHlUToq3asVnSRvQDp2x9Uq98pDbUNu2KXOCTzGj0XUwZfPm+RHVB9DA0OFpEudzY23SZ6ddBnx+q2kLnAExLUUk4jG8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727097582; c=relaxed/simple;
	bh=h/BEMtHgfJ7o98fvYyXlIv2+yWceMHMTagptnb1Zg5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXQPEE3kNrUM5e3bLvkAxj9eLBnSgpuF/QeZyOyzdM51MXljMvUNGh3zQTmIcy9wD6Zlmp52QjcQA36sZLdnn8nnsRoGuxwLJPAnpB2b1kmvQgy8oJgYgW19wqEJnh7XHnRET4rNQPhIjqcZGg802hk5eKgVbmdRiPiIa+JLgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h8NwHA8S; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53661ac5ba1so4497423e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 06:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727097578; x=1727702378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGk2orlX+fi9SeSwRZwCGAgpSwWImCEuGfUk0feNgoc=;
        b=h8NwHA8SYu29+jh1K5SUYEVF7UpFjCVuUepnDQ2bTAjCMnPgblqFhfm2GASvDJSHNl
         XFQOv5Efc9rrRST4hUc43+2aTJA9iJEX1ktTiF/uizWko349HRHc/eZCen3aDkHgEgIP
         L/oxws7rLqX5t35j5wGB1hSiCToVu0gjw+PuyDXaeYbHpI8gpXK3OxmTpZ3A4f1QS1Yt
         taXHQ0maHTVWr8Yn1cxa2KsAbUH/b3FL+B629nYVHiBFaZIh9iPOfLS6c44f+Yk6s20o
         ICGrWfKbi8se2WVSpNjFZ0SybAbanXXH63Ez4Nb8sX4wBR+S4R7PnJER5ChNDsLsLNEG
         94wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097578; x=1727702378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGk2orlX+fi9SeSwRZwCGAgpSwWImCEuGfUk0feNgoc=;
        b=S3MejjcIW00fdlt+/OCMlTKZ1mXjOEM8PLnAnOVVa+STVNvLSCtaoJp5MDa8evmCZ9
         DcLHkrWQrhD7ZmRWZ830+AeCzzJSgxp5dqcrhdgGtmH8Bau+I3s7dO3eMkwi+51q9K6q
         90LwQ259GepQPOUOqdQPjnP0OqcaCePiKhd3RdsFS10mG4DlJxTIBg+d27fmAk5feSVs
         OwOLDqVOp+BID+ARAD9FW7Yx/aSeBB4CoXFwoTvysG3GJB2ICOZ0Tz+BMzyVhHYERrqy
         NuxXTLdBNQpPrj43yU8yPG4J/EiQjQTILht9LSjYnjz6FUDxmMBQN0c4XTwURj8aPzBJ
         4Miw==
X-Forwarded-Encrypted: i=1; AJvYcCWhMw1YzvSn7S0GUkbXAGwO4ylR7e9V3HWDlGp5F2wNGLu0excXy1O0WW9lEqoDCAOi0lcn2SPjsjCzdviG@vger.kernel.org
X-Gm-Message-State: AOJu0YyUwH0c6dIStkXyqqZCWyoyKpVXkeyJeStHEpEmP/q4bSun7xzG
	UkD8EeC80eGrJd63T3cDgXFBb4BfhAbpYhkKjyqmoUA/4iu9O96x+gqTZxaE3oQ=
X-Google-Smtp-Source: AGHT+IGOBZJQI5jNN3s4SzM7Ap+2SyMdJN1H7lWTNYEIrJ6+UEojqKqP8ntoAuCXELz9jje36RoeLw==
X-Received: by 2002:a05:6512:1250:b0:536:7a88:616b with SMTP id 2adb3069b0e04-536ac2f462cmr5710269e87.26.1727097578302;
        Mon, 23 Sep 2024 06:19:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870b4108sm3276674e87.244.2024.09.23.06.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:19:37 -0700 (PDT)
Date: Mon, 23 Sep 2024 16:19:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, vkoul@kernel.org, kishon@kernel.org, 
	robh@kernel.org, andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org, 
	quic_msarkar@quicinc.com, quic_devipriy@quicinc.com, kw@linux.com, lpieralisi@kernel.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 2/6] dt-bindings: PCI: qcom: Add OPP table for X1E80100
Message-ID: <jz6eqbreus2hrhxadj643ibfy3ejr5tjhkerln6sh6bsvfhaw4@6uwpabq2d76a>
References: <20240923125713.3411487-1-quic_qianyu@quicinc.com>
 <20240923125713.3411487-3-quic_qianyu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923125713.3411487-3-quic_qianyu@quicinc.com>

On Mon, Sep 23, 2024 at 05:57:09AM GMT, Qiang Yu wrote:
> Add OPP table so that PCIe is able to adjust power domain performance
> state and ICC peak bw according to PCIe gen speed and link width.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> index 704c0f58eea5..3c6430fe9331 100644
> --- a/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie-common.yaml
> @@ -78,6 +78,10 @@ properties:
>      description: GPIO controlled connection to WAKE# signal
>      maxItems: 1
>  
> +  operating-points-v2: true
> +  opp-table:
> +    type: object
> +
>  required:
>    - reg
>    - reg-names

Please drop it from qcom,pcie-sm8450.yaml, it's redundant now.

> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

