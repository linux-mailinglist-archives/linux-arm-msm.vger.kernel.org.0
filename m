Return-Path: <linux-arm-msm+bounces-33881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C13998906
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 16:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A591B288C78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 14:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083481CEEA6;
	Thu, 10 Oct 2024 14:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WRd+9E0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1471CEAB9
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 14:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569517; cv=none; b=UTvQAJDNMmeysGqdMr5sQfdGKNsNTJR1QSMXEZzwZr9nwlkRmsJcaPmeyP9XSjh0t/k9BmWX9MoTXQqDQ/NLm0nh15sy565B5SocaiFebpQ1EWprfha36vygs+2gmDW+xw2Bh8HCl0d4p+wCiAuZ0Odt8e/H+KwP/PjV52IEpEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569517; c=relaxed/simple;
	bh=Kqu3Umq1tGzPWotpcgscd3wVQPd7vVFD3LEC7xmdsa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBvttAmFbcYUsYNU5MzEfrzSPyf5On8MIdAWGYSxW8f3dFCdD9iqcNx7e6FnZy0I4xJgVCFB4Fu21vx5oSDquhwlWzwM2D3zXcXeAYDnejMi0yFZqPCWEcv1rHwEbyRKjYP2ASIu9gasJtfHl4hCVOiwZTwewRoBvOUm4q3c+ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WRd+9E0Y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20b78ee6298so5496055ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 07:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728569516; x=1729174316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fxLlyQIQJJgdiI75ek6ACs/j78T35Co5yzYY4Qgs6Yw=;
        b=WRd+9E0Y5UeqWVHnJLVG1lI27z6wVaVifKGn+gqZCU7l4zn4xyKFJb48B/vmA22QKf
         aKy8LXYkPFel1Tx2zzBMuIV0aJ6AOic/wDDCJSboUfi5WCWD5+9/REUptPApDjhIAP9b
         XXbpAHHw3Y8aEu1ZsQChXBYLCfzecm6ooaKHDTFAIuYpqa8Z+U+oO8acGdad+gCrBLeS
         YiB4KCC0A130jtrISp3pMJUgZCB0rZTAB/Plubdjl5uixFTeoqf7wsg66OkcDfzVjQ+Q
         kGC/GZqNbgSK8VCZgEquiZW89fIHVjogUC/hk/M72HLyPkvcCVk2H66Gj7jBNYQl5md3
         edXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569516; x=1729174316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxLlyQIQJJgdiI75ek6ACs/j78T35Co5yzYY4Qgs6Yw=;
        b=Tf9vmMYzIwx3vo48JcO4odpClAFIqdWL/hwvAbzkSoqJCRn2YScjnr0yujI8CnDKjr
         FAg4hL9poA6EU+r+EPYnp7XvRFjtrCH6vNXaj3JhWh9l2XC0EPFPFBpOLeL6RW3Ol8Mu
         MiAPisOqnaB4R4TRQvNo9hkSotVttNtistLFCcwbqZQBF9Un49ysR2i+in2KvSRGU4zE
         qDFXTphdyahsKMd4N2zC2moQFRpElN1yzQYbcFPMOGtxRqC0z4lfYefg4oUsKRT++4+t
         A0D/PL7BX0LBlnCMnjeK9mhObqpfgKbnt8JjtfBcpG4neqASQCFWz8FG902vOIs6yExX
         j3xw==
X-Forwarded-Encrypted: i=1; AJvYcCXocoXN+MhDebQI64WFKQPyv7O+JQVgWFQdye+J4w1v9JcmtLIfNf30CxGaDaDlBmUq5CCy1ZaHdPueJOSt@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ6COGDVk1XZtnPEkWyoCU9c2ilDq0vwSo7s4PkBWHtmQC8oi3
	RVDtVU8AfiCpr8riskuwLSOXDDYjxEUtceF+CAcoO/NAiI4ZoDyzO7Lbz9ipIX9LMBjMSvRMg9P
	7Y1an6RRXxfu9BIhzviPU7WFPXhdItHXi2/vC9Q==
X-Google-Smtp-Source: AGHT+IEhasvLE5yjpIGoee9hmPWbwQLLyEu4QgFWIgNpHIHMhcKCpF7OJWfO7V9mYtlQ7TYOHC4EDf/4tu2SMkw2TAg=
X-Received: by 2002:a17:902:ecca:b0:20c:528d:7063 with SMTP id
 d9443c01a7336-20c637104bdmr113865075ad.19.1728569515691; Thu, 10 Oct 2024
 07:11:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009161715.14994-1-johan+linaro@kernel.org>
 <xwscnif4mqzykjinjtbr7jqsksy2buzindyttkk754jmumktm3@p5xxnmia7fxe> <Zwfei-Jn6goiya4H@hovoldconsulting.com>
In-Reply-To: <Zwfei-Jn6goiya4H@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 17:11:43 +0300
Message-ID: <CAA8EJpq1U7=An1V=DRqd2tAr527est1UFKc59CE8wRL1tdN_Ug@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2024 at 17:02, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Oct 10, 2024 at 04:54:19PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Oct 09, 2024 at 06:17:15PM GMT, Johan Hovold wrote:
> > > The DWC PCIe controller can be used with its internal MSI controller or
> > > with an external one such as the GICv3 Interrupt Translation Service
> > > (ITS).
> > >
> > > Add the msi-map properties needed to use the GIC ITS. This will also
> > > make Linux switch to the ITS implementation, which allows for assigning
> > > affinity to individual MSIs. This specifically allows NVMe and Wi-Fi
> > > interrupts to be processed on all cores (and not just on CPU0).
> > >
> > > Note that using the GIC ITS on x1e80100 will cause Advanced Error
> > > Reporting (AER) interrupts to be received on errors unlike when using
> > > the internal MSI controller. Consequently, notifications about
> > > (correctable) errors may now be logged for errors that previously went
> > > unnoticed.
> > >
> > > Also note that PCIe5 (and PCIe3) can currently only be used with the
> > > internal MSI controller due to a platform (firmware) limitation.
> > >
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >
> > > The PCIe Gen4 stability fixes [1] are now in 6.12-rc1 so that we can enable
> > > the GIC ITS without being flooded with link error notifications [2].
> >
> > Cc: <stable+noautosel@kernel.org> # Depends on driver stability fixes
>
> This patch is enabling a new feature, it is not a fix, so Bjorn please
> do not include the above tag when applying.

This is for stopping autosel from picking up the patch, not for
picking it up. After just helping to revert random patches being
picked by autosel I start to like this header.

>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> But thanks for reviewing.
>
> Johan



-- 
With best wishes
Dmitry

