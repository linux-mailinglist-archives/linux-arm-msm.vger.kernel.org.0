Return-Path: <linux-arm-msm+bounces-45521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9784A162A0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 16:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AE8D162047
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 15:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E4C1DF746;
	Sun, 19 Jan 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NaVBpdMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD01DF26F
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737300425; cv=none; b=of3pkzQbQGVkIICduhYMPoTFe4wlqURTi70YuK+ZGooPiE0uoz3URLMa/6Af4ZSD5xqBGxO4PqEunQwoplqFOV24hYptYZY8DQ3h1RtMcaodQFO7fxF23IKaaoWdTBTQvgm5VzaOp9bNq71MBRumQF0D87rEWNIHW3hqsR4rNoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737300425; c=relaxed/simple;
	bh=PWQpcLhH7Zeo4/EFrlP2gfivfal9zzDPsCLUkRO16zE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXDrDycT7m7tYQdkDGdPIyw+Wfi+hN4CodgpNUWcK7YY7noFVKty+otfGwsJX3wPBgb9zS1Zzk5H654b4mBA9l63weV+Pd49R5Slce+TFF8/4EQDRsyPr6CnaiKrorNfvyO9lcgIUxTfkcM8ZH3zdFd3vYWF2ICxC4RoTeSqAdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NaVBpdMZ; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so4698248a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737300423; x=1737905223; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gWLJNtDh2M0LrWGMJ4uX5maH7/SrzMNwJbKx9WRcHPQ=;
        b=NaVBpdMZI071+K9NmczBY5/PxLIwgGaruZottqEB8NFCgAq8RhXj954FscI2pRExkb
         p0LSrisa6Mg/UaptV6v3Sgh7rcGu9AEm5ycGJP4ibVVsWolIVH8Z6fByE96OWSvUqTiR
         +G6ErRdgHBotP7cPXALTm1IjdCusqq9IdvglxWMvw/Ehhh8noMJAQ+Y5VdJoJpgrUuJb
         zwaQQgwQqff+35EoUXqqZbwUpq9sWOcu0y9QPi1yjt5uxJN9LVYlqnkHwk7mQnFtpTHp
         ay94PoY4+VX3Zy29LJF7gpyVa9G63ljcrOzXXx+khLrbjQOhcWjOj+lIkE0bgHNTXfm1
         AIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737300423; x=1737905223;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWLJNtDh2M0LrWGMJ4uX5maH7/SrzMNwJbKx9WRcHPQ=;
        b=Fyj2ylO5gvBBHjLMkkd4DiWFXy5qeqlcfywg3GUrG8KpsuUprUQxCkQjI0ZBo+Fs4G
         5ueG9+XUmLpTrk96a3jsq3nQ+8aL78oTeM+892RVox4tQLKtz0rZVQRvz9Zy3aKBMLu7
         ugdfjsqf2mNou/TrxlJOFvxNq4hRnsM+zakoSmNRvnEJ3Fd4nWRsZCmbsz9I4cbkZoAP
         0vu0u92TaIDzqakiJxL11eghucd6PetY0PJSdd9vMmV4jfHkvNQGVJ4H4uHrzVynFIqp
         YdJ5KKBPBg/CE90V14y22KvtJvTMpLsrRo8VMJLDk8IjWUpkpCB72/vlY/cjy3HpfB5Z
         lJ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXm/iyW7wgDV5X295SJUZ/n22rmMHuc6+I1fRvimwL8clqT6qgaPLPyhv2p76z9XTqMF7WVoj35Je9ozpcQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzApj4H6zVQh1y4fof/UlgCqYwv6jyW+7+J4plf/uPmkzgFaudy
	sOhqYVK8jjrd0uKoNqORlDzK9mEAOqy93f5AlDLg/38Hfak8UCIXGDpcBnvTWQ==
X-Gm-Gg: ASbGncu6HwuVoyUB/O6K97l3kLxpuLI2ZBx16oV712TTNsElV2LgIevxuqv2mXV8/GB
	r7mS7uSrfgH7iv0fO5F+nJzETZbnoEJ8zqKddzfUJEXMR13uHlfjalUlqtH83ZtBsGOKFWDvIgJ
	ZF26NKJrNgOdppLPx8u+yKl+TPFFDSW7s9mGNKeQRZJYUHs3OZE6l4WEyiWKqXxDK32pTq+ICDE
	k0juDuwqM16BOXUb+c1p/Vbiq6jLpox4zjKwvus5o1fjoQT2EfiR9l3q/M4QTtg5ImA74CoUx4D
	gAJJLQ==
X-Google-Smtp-Source: AGHT+IENWqIH7vPK9qo4kAByRAYKRm1YyPEDyBpffvJczNdBlZH+Y7lmOf7IJkBmPUxBttv2OPLC8A==
X-Received: by 2002:a17:90a:7141:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2f782c70237mr16844568a91.12.1737300423171;
        Sun, 19 Jan 2025 07:27:03 -0800 (PST)
Received: from thinkpad ([120.56.195.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f77611a162sm5861697a91.2.2025.01.19.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 07:27:02 -0800 (PST)
Date: Sun, 19 Jan 2025 20:56:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: qcom-sm8[56]50: document and add 'global'
 interrupt
Message-ID: <20250119152655.g2w4evteqqastil2@thinkpad>
References: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126-topic-sm8x50-pcie-global-irq-v1-0-4049cfccd073@linaro.org>

On Tue, Nov 26, 2024 at 11:22:48AM +0100, Neil Armstrong wrote:
> Following [1], document the global irq for the PCIe RC and
> add the interrupt for the SM8550 & SM8650 PCIe RC nodes.
> 
> Tested on SM8550-QRD, SM8650-QRD and SM8650-HDK.
> 
> [1] https://lore.kernel.org/all/20240731-pci-qcom-hotplug-v3-0-a1426afdee3b@linaro.org/
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Neil Armstrong (3):
>       dt-bindings: PCI: qcom,pcie-sm8550: document 'global' interrupt
>       arm64: dts: qcom: sm8550: Add 'global' interrupt to the PCIe RC nodes
>       arm64: dts: qcom: sm8650: Add 'global' interrupt to the PCIe RC nodes
> 
>  Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml |  9 ++++++---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 12 ++++++++----
>  arch/arm64/boot/dts/qcom/sm8650.dtsi                        | 12 ++++++++----
>  3 files changed, 22 insertions(+), 11 deletions(-)
> ---
> base-commit: adc218676eef25575469234709c2d87185ca223a
> change-id: 20241126-topic-sm8x50-pcie-global-irq-712d678b5226
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

