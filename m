Return-Path: <linux-arm-msm+bounces-38056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B755A9CF13D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 17:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75FB61F217F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 16:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E83F1D45F2;
	Fri, 15 Nov 2024 16:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpG/7G2H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEE21BCA19
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731687546; cv=none; b=cnh4qq1/0gPuMRY3XKg1sqmSid+ig8KTQx2Gx2v0mgZ+pFG66MScIMopBkjwBki5vHDvStSkwuniL8tWN8ByRHs3+oKOcemtVTXboeF7B3faMlDvcNaTG3fxXaqPEOFrrHLIIIhgv/pdZGzpBpCEAF8n/w+B8mcTkj62bcabzoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731687546; c=relaxed/simple;
	bh=oSLttDU/nPBsYRTacn1ln6jMk4TS6LyTrFp+H7EkddE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhcHU/3heotKNE1lnx0JRaeG8mm3ppnJsmCLZmxhMgdADliCfcGyeXN17DiiVjIOtjLoD0UWOWGcUXo0oWO0AVW8vIs7qVU+mp+xPIqPy/9pCW2KdzuEHjQuRbRaDoKB71/KdWzP6uG5DxvYqEjbp76MpaQvucItZBqKWat4+gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpG/7G2H; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da24e9673so2217755e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 08:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731687542; x=1732292342; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ZSdaY6MYVqw0kkQs4wwhcq1PIJ02qBirtyoujMtOFc=;
        b=FpG/7G2Hpdsk++PwLJWSDPBhxVD1p3tltn8Cl3V+R941c9PvSiHYe+VLQ5JCSV8+ZK
         qtdDn8WRYjT4NBaVJId9aVNGqIhbjaWmKtaqlXZh4FRcDksYd2hWCyXbKrbDKELCatt7
         DXHDLJeydZTXHHysEbJqoZquK6m/oMrJ6K30N6bl5KHYk8crGOW7Qfa+Z8p+GR/9KbUI
         2ZYnWvxhbd8jz47ujRoOZZBq2jNlkk+Bce1bplNklHpSoH5Gw5eU74YFXgkaYMiWdbSy
         ApRs+JjBVwVWwrHFlqDwLn9cQSNLYaT8S4dPTMq/LrFzawLJbf0sBZ+AKRs0kXO3xfHn
         2hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731687542; x=1732292342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZSdaY6MYVqw0kkQs4wwhcq1PIJ02qBirtyoujMtOFc=;
        b=CkFVd+8GmcN9AgAnyFkaUEoD/u2QbyqBPUKL0JuGH3VQ93QEyWaIUvo6pGb9WmTgGa
         3zZp0kzp8H+8FwMu6dGby/GxVTKowJDPfI4jPfHCvqW3mbCaGH6regQdhXrhAy4yHSJ7
         If5d0sVysgsCS25lAMY+kHrRHHynz5Vd0AlGxX3oaDBiNRsvivVV5Zyxt8TF2w8SepFp
         arf/BwKF0oCgq0T9iO896O2QLc+tihbqBt4ZE3uJMI9bFbc83lIif73PkTdQO7wICA7c
         eX07bOquCEw5NWGSAWIJDJ97o8oDZUGJupMsOqyhtMuB8/qrRdDd3Pq+89IoGE6fiGY9
         60Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVJlUO7kS+/F1JPeB+UIsvWEwrvS4pFJdcnRYY7px9DyyXBbvvVSU8hA/VFrg8lobzZ4UEvIx92M+XxyAgi@vger.kernel.org
X-Gm-Message-State: AOJu0YyAQWUv63lMfQ8BfwpqCjDStaTQWPwvY60N7xid14VeLVtN446u
	UBmG1ELqLiEBfM3wrRuL3r7aYaw5wZdqfwjPA6p6p5MbgxqhiFfptbnyHrtC5K8=
X-Google-Smtp-Source: AGHT+IELPHfUWq5IVHHPGNNQsvYE3pF3KuKgrqDO0uX3tepKYCixt40GsSqVIfDNU0RZVtYamVXCbQ==
X-Received: by 2002:a05:6512:398f:b0:539:fc75:99c4 with SMTP id 2adb3069b0e04-53dab29cb96mr1513149e87.20.1731687541809;
        Fri, 15 Nov 2024 08:19:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653e074sm619128e87.174.2024.11.15.08.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 08:19:00 -0800 (PST)
Date: Fri, 15 Nov 2024 18:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
Message-ID: <njqf74avebb6fiestidmofxvse4j3ftux5j5tupolbayqpskl7@jlyxtubdj5x6>
References: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
 <20241105164946.2357821-2-quic_kriskura@quicinc.com>
 <dbd8ae86-03a5-4b33-b774-846788bf8b89@gmail.com>
 <fb28e81b-2a0d-4a34-a8e6-d4e7812fbcd2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb28e81b-2a0d-4a34-a8e6-d4e7812fbcd2@quicinc.com>

On Tue, Nov 12, 2024 at 09:17:49PM +0530, Krishna Kurapati wrote:
> 
> 
> On 11/12/2024 4:34 PM, Konrad Dybcio wrote:
> > 
> > 
> > On 11/5/24 17:49, Krishna Kurapati wrote:
> > > Add support for USB controllers on QCS8300. The second
> > > controller is only High Speed capable.
> > > 
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > 
> > [...]
> > 
> > (the PHYs look good)
> > 
> > > +        usb_1: usb@a6f8800 {
> > > +            compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
> > > +            reg = <0x0 0x0a6f8800 0x0 0x400>;
> > > +            #address-cells = <2>;
> > > +            #size-cells = <2>;
> > > +            ranges;
> > 
> > Please match the property style with x1e80100.dtsi's dwc3 node
> 
> Meaning adding the 3 properties to before the starting of dwc3 node ?
> 
> > 
> > [...]
> > 
> > > +
> > > +            usb_2_dwc3: usb@a400000 {
> > > +                compatible = "snps,dwc3";
> > > +                reg = <0x0 0x0a400000 0x0 0xe000>;
> > > +                interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
> > > +                iommus = <&apps_smmu 0x20 0x0>;
> > > +                phys = <&usb_2_hsphy>;
> > > +                phy-names = "usb2-phy";
> > > +                snps,dis-u1-entry-quirk;
> > > +                snps,dis-u2-entry-quirk;
> > > +                snps,dis_u2_susphy_quirk;
> > > +                snps,dis_u3_susphy_quirk;
> > > +                snps,dis_enblslpm_quirk;
> > 
> > maximum-speed = "high-speed"
> 
> Ideally this is not needed for the driver to operate. Can I add this
> property when I send the patch to enable second controller on ride platform
> ? Only reason I ask is this is not a blocker and it would need another
> rebase.

I'd say, let's do it straight from the beginning.

-- 
With best wishes
Dmitry

