Return-Path: <linux-arm-msm+bounces-6085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF438200AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 18:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90FCF1F224D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 17:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8775D12B82;
	Fri, 29 Dec 2023 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y1U6Vteg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F21112B6A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-67f9ace0006so33862666d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 09:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703869818; x=1704474618; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bn7Ypr1yINWIrF1HsU+9Oaoc2yoSbevJLsQCr58V/sc=;
        b=Y1U6VtegJF6D5UfqzdCATQZHq+jDXOJOXMRW9iNHWTiHJmeigFHD4IObfLCnMSEFGZ
         BbxASrfi9jrDomb2C2u+mXBMV+ZoFVuy0wQYu3ys8Deyi0Gr54xkiOiJyw5Ob/zepOpj
         yRw8N6lcky5+6LVm8utLMF0VnTdyN8KusGYijwZXxN4uAvwqGqcxtlhlKta6fjyRdCP2
         0irugM5uBUop6gTBuWiZwsgRs/Fn+KTeL0URihIEKsX4oBWO0rAEm/nz3noEXtCyFz8v
         Qnz+PaD9XostiIHP4B+d+6Cd1FIRwHzt4M9Hf4cafDwojTBy32Aj3saVaLMI9aKlsxu0
         KdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703869818; x=1704474618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bn7Ypr1yINWIrF1HsU+9Oaoc2yoSbevJLsQCr58V/sc=;
        b=SW/m5KOfdrF/6GO4E15vy3TRQUfjxE445f1v2GVqBnUvcwJD9SR4YfEcrfRfp4Hi5X
         hnAVb18hg8V3MzS2tk3Z4FzwxsUZe1pX8yWKyF3M1GY7rum9Yk96K7UDjYWOvWwyjRGV
         +0jWfeEYSYuDhwZt0v4AFI9xBI16FK8vxayjkbf2xiqZHtUyqL9+c6Lcg6YCAwo/AjAU
         OULbXs+WnEQMHj0v0AvS9nW4dm4ihgSvl1fwA2XEVG98zXyIpeLstig98jxrNulDKr8l
         vyMRpcCmLHaqLq/wyvtq4Bl2OyDz4GAA3hPCI4KuGtfKeZbN6LT9bxXFmv2LLm027VRg
         PWOg==
X-Gm-Message-State: AOJu0YxvAL12Z4xGqBTx5kk9S68T0FHGdrYNHwHHsACchQyE50/nAzqL
	+1nnRFxoPWSu0tswwES/vcDzODb8Wpux
X-Google-Smtp-Source: AGHT+IFOtfZk5ygOqwlXAAgl64auJMA1fyIe+Ru1+46ug74bAuW5Qg0DbNqPe5nRjj9BaEWs7QXTtQ==
X-Received: by 2002:a05:6214:a51:b0:67f:cf88:9912 with SMTP id ee17-20020a0562140a5100b0067fcf889912mr6376835qvb.107.1703869818571;
        Fri, 29 Dec 2023 09:10:18 -0800 (PST)
Received: from thinkpad ([117.207.24.172])
        by smtp.gmail.com with ESMTPSA id t7-20020a056214118700b0067f80a27790sm7161516qvv.37.2023.12.29.09.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 09:10:18 -0800 (PST)
Date: Fri, 29 Dec 2023 22:40:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sc8280xp: Correct USB PHY power
 domains
Message-ID: <20231229171008.GB9098@thinkpad>
References: <20231227-topic-8280_pcie_dts-v1-0-13d12b1698ff@linaro.org>
 <20231227-topic-8280_pcie_dts-v1-2-13d12b1698ff@linaro.org>
 <ZY7DEpaIgvfL_A11@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZY7DEpaIgvfL_A11@hovoldconsulting.com>

On Fri, Dec 29, 2023 at 02:01:06PM +0100, Johan Hovold wrote:
> On Wed, Dec 27, 2023 at 11:28:27PM +0100, Konrad Dybcio wrote:
> > The USB GDSCs are only related to the controllers.
> 
> Are you sure?
> 

Yes, that's what I was told by UFS and PCIe teams and some of the internal
documentation also confirms the same.

> > The PHYs on the other
> > hand, are powered by VDD_MX and their specific VDDA_PHY/PLL regulators.
> > 
> > Fix the power-domains assignment to stop potentially toggling the GDSC
> > unnecessarily.
> 
> Again, there's no additional toggling being done here, but yes, this may
> keep the domains enabled during suspend depending on how the driver is
> implemented.
> 
> If that's the concern, then please spell that out too.
> 
> > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> 
> May not be needed either.
> 

Fixes tag is indeed needed on this platform and all other platforms too.

- Mani

> > @@ -2597,7 +2597,7 @@ usb_2_qmpphy0: phy@88ef000 {
> >  				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
> >  			reset-names = "phy", "phy_phy";
> >  
> > -			power-domains = <&gcc USB30_MP_GDSC>;
> > +			power-domains = <&rpmhpd SC8280XP_MX>;
> 
> Johan
> 

-- 
மணிவண்ணன் சதாசிவம்

