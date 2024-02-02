Return-Path: <linux-arm-msm+bounces-9545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9C84708C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 13:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BABD296703
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 12:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD73017E1;
	Fri,  2 Feb 2024 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDhr1bop"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5C046424
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 12:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706877827; cv=none; b=DRqQyCyHerT0CBlbu8mldxNLEl7cGsLjJdVEobvI+mTltC8dPDiJpG1hPN7MJhupWKoR7GVxCVHMu+fTim3e1CVrxOZkH+dwfCK+2ZZlr+SrknkL2366f/cnnbVcTzVSx3CkKAHMJjLmd5ngQFP0ZDMxn2jDOJaBj3ay9z5NerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706877827; c=relaxed/simple;
	bh=tj1CLBp7VIANs+EBehg+RJQhsJ0eFvzjfYM3FwLMB8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OC7hGyNqISbmucP0tu4keym+VYCQQ2OQ9VAQs+DkqsDAAysb7JW3r1surNnV8GPL65z8XQ+oF3i3qDurujbXJmY9Y+BJd60o6vl8oaijcSWW+fctABpWOX6/kH3N0y6NaPEGRG1hOvWwq3vDWpEcmNYXdquI4no23Qoz9pjDt7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDhr1bop; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d918008b99so16214425ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 04:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706877825; x=1707482625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9FESmdqRHWW100RpTBsBq8yPHH7qEEPiTE/zbAOfuA=;
        b=SDhr1bopjtxDq16hlQJpJ/Qx052J5cu19f8TsI1dKlyNp32jJ6pnpK9y777K4J+Q6n
         3Vw4lTtUldIAZvGsVyLpgF8qTtrMCPqqM01313ppc6m3utdUysENTOSiJy+cXTeASJeD
         gmSWqbSMsiUTrcqjppoq7+1GSfU3VDxrVRDblEusEsaac9/osBcj4O2hAJ6gsRavjV+d
         DlHwUJsC8rt/NfE+/CKl0S92z4uSIdsRcy88mLUP/F/6pcGKtFCOACSR0WHSk5064wLB
         wmFj0yAmm0u26bRqYLmlxyFAYnnqWjHHdT3oBHB2xUrRFxNyXOinpgubaNPsWdkkXLab
         Txkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706877825; x=1707482625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9FESmdqRHWW100RpTBsBq8yPHH7qEEPiTE/zbAOfuA=;
        b=pVnDo8Qa7qBPg1bVqR0T6/+WBQcBi7HImQl/ivvc7wpSpj1Oawo+hrLjSaHlzWpe3M
         gJ1oluFZc0PB5Hcb//B5RtC6vxVzILh3JATQeDYFTmI0wNXmiWYNP54nd5d77TTDJkLw
         dz05/dyASRh/soivGXTkZRwf18BwuN0u05n7oAKt8U6l83omwepkLtLJfFQkPUG1yyiw
         RRqkBw09OxN2FQlgk4p7pjEfRGfvvCVXbiAcTF39MnRwGDt0S3KXXCNAhqrXRdIxHCfa
         Fny9mMsACECxcQa0VFjExEo4+NqQ4UFONZNJxGFHNAzUs+X2oRSoJANKKUk3qENLmAwd
         bUEQ==
X-Gm-Message-State: AOJu0Ywu/dsM8kV0sDDxfDbaPXJ6Fj6dHUmEGWgOAvFAeJMffEgRYrqG
	P6QJd1XvLjr4k8CLtmqb1VgJrhZptCkx9UxqfAb3ttgzjxPotCHWm5eBsleWIw==
X-Google-Smtp-Source: AGHT+IHESOHJ8cWgQzgEjYBv8OWlxVRz/PcZ05Fwo0cb1mOSPNQNp5xpPehWQdHJA4Ba01V18NtaHA==
X-Received: by 2002:a05:6a20:3c91:b0:19c:7672:af4f with SMTP id b17-20020a056a203c9100b0019c7672af4fmr9002476pzj.61.1706877825584;
        Fri, 02 Feb 2024 04:43:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPmT2VqJaNyvNg5+co+4qpwvXqVptIjKTOsdryKgX566PiL11yq1irVf+15INBRQVb7cQ6AErXMt4AAR0TpWyRtzkXPVAgpqRE5sgrcoBJAE1LJQe7vtQKY+LfK0v381JVLjm5EYYwKp6i9LWxIb3TpTMALpiAIqfed+mKXWkdFbb4fAPFFgtSFA3BVLrD4sBgY5+tq/nSsnPASDF7n3XH91ecdDWxgaJxQqwvKh6ex3hHSnrNrn2Auk3aNLN1/6jLMw+ZFuMT0gCJkDI9jwWFjh9bQBsmqoT0ToyWZdNS9J0Xq9T0k7eS3jwAMAELF80yO45qq/+m8QkjpXDZnCwdsQ==
Received: from thinkpad ([120.56.198.122])
        by smtp.gmail.com with ESMTPSA id l4-20020a170903244400b001d8accb025fsm1487776pls.197.2024.02.02.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 04:43:45 -0800 (PST)
Date: Fri, 2 Feb 2024 18:13:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: neil.armstrong@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: qcom: Add X1E80100 PCIe support
Message-ID: <20240202124339.GE8020@thinkpad>
References: <20240129-x1e80100-pci-v2-0-a466d10685b6@linaro.org>
 <20240129-x1e80100-pci-v2-2-a466d10685b6@linaro.org>
 <30360d96-4513-40c4-9646-e3ae09121fa7@linaro.org>
 <a0034c34-4af7-4733-93f7-f82f665f36f3@linaro.org>
 <20240202084157.GE2961@thinkpad>
 <ZbzEhOK42tL5tAKf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZbzEhOK42tL5tAKf@linaro.org>

On Fri, Feb 02, 2024 at 12:31:32PM +0200, Abel Vesa wrote:
> On 24-02-02 14:11:57, Manivannan Sadhasivam wrote:
> > On Fri, Feb 02, 2024 at 09:13:25AM +0100, neil.armstrong@linaro.org wrote:
> > > On 01/02/2024 20:20, Konrad Dybcio wrote:
> > > > On 29.01.2024 12:10, Abel Vesa wrote:
> > > > > Add the compatible and the driver data for X1E80100.
> > > > > 
> > > > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > ---
> > > > >   drivers/pci/controller/dwc/pcie-qcom.c | 1 +
> > > > >   1 file changed, 1 insertion(+)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > index 10f2d0bb86be..2a6000e457bc 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > @@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
> > > > >   	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
> > > > >   	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
> > > > >   	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
> > > > > +	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
> > > > 
> > > > I swear I'm not delaying everything related to x1 on purpose..
> > > > 
> > > > But..
> > > > 
> > > > Would a "qcom,pcie-v1.9.0" generic match string be a good idea?
> > > 
> > > Yes as fallback, this is why I used qcom,pcie-sm8550 as fallback for SM8650.
> > > 
> > 
> > Right. Fallback should be used here also.
> 
> So after digging a bit more ...
> 
> Nope. Fallback approach doesn't work for X1E80100.
> 
> The ddrss_sf_qtb clock is, on this platform, under RPMH control,
> and therefore not registered by the GCC. This implies this clock cannot
> be provided to the pcie controller node in DT, which implies the
> bindings are different when compared to sm8550. So dedicated compatible
> is needed.
> 
> So this patchset should remain as is.
> 

Apologies! I just went with the conversation without cross checking the DT
binding. You have already listed it as a separate entry.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

