Return-Path: <linux-arm-msm+bounces-19000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BE38B8237
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 23:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A1528131E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 21:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63EC1A0AF9;
	Tue, 30 Apr 2024 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AmnQ+JW9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47B1BED89
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 21:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714514392; cv=none; b=JZTlTRNsdv2Fp6ZGv5mII+L8k+4Hl0/fXpP/N7wkcKp2KvV3RR2IL1mvbjYSNHh6I5ZYrVsZR/fNMP8pyrC4moU4wY0epF4Rt+5GpKOq9LT5bDUu7uP7ZiXwaYDTlwi38LOLYcto7IU3SA2FeH9lSEsZKwxZVP2eOrsUNEcPsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714514392; c=relaxed/simple;
	bh=WjMKI4UZslQKccmIJplzRTJDSbleSPr2wCt6aMSDOzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pakVePhO+5IjME8j+AFdC0dRbNci4RbZdP6YUrkWwPYEKHTpOAFoLqt/cYXq/hDLstvOIU/u/g7tJDVfGJobm+ja7x+LGVV8Lfp8auyJISUfHvdR5pDCv8SY7Y0uwJTwC4OWBpR4Nd6xtgk+kYopmwNssX5FY5VqsFNweaRj5OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AmnQ+JW9; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-de610800da0so1733708276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 14:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714514389; x=1715119189; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aitWmRcAVpn7HzPwQhTVKeFU7re+mCUC33ppmlezlfs=;
        b=AmnQ+JW9Y+6at3/PERebiBD14XIGrSas2RWW/gb6Q7I31NlM7RM6z7evFSZR03Tj5g
         hbVKbbIk9OR8N4fHbxPpP4zdqUaGGViAJ12N1tnScolB21twraj7bdzRZY3CGGwIFWLs
         ZW4ferFC5t656guOxx3ZwZoHhJf828/677rDtIhwtqrTXivlGfxPO1oQ8lxtNedgRAO3
         1/+p4pBm7+rzMX+kXP3rgnRDROxzNq8MJDwTRyLtmiJHSCRgT8Qp9/yfOh3MtrxubET1
         Ck/C+IGh2ZfXsiAv8BuvVoNSiuqw9h2ZSlYMizymqcsTIbgT5/741R1rYoZwnIP9v+/u
         nxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714514389; x=1715119189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aitWmRcAVpn7HzPwQhTVKeFU7re+mCUC33ppmlezlfs=;
        b=FpnGrP42YUJJ5TKAh0QpHBpsGBjEXKERvcEfYwt/Yw+QXe/VkYzHCaxzO4iWG9zFPW
         VlOBf6SF3CbkRvGlTIaWfHh9dPWjOBrXc3w1HNT2QH1hZ0I7fEQHcOyuBR+Radq0z7uC
         bwuTwyLwK1IZh0zcDnC5tdGVLgKZULRv5s9H3wecVXMblcsw7wVVih/vIwYSvlc+GEzA
         cjq9VoxGN6afkQhZo2FmSPpHyyjZK6ZyH88KiHCQwwceBvr0T/qc+oP4f7Z96+/RpDzH
         eRNs39Pjxi7lpk99fKOcRgY9CMp9BUDHeo+q+rp7kZUy3yC6nlljmy3jy9skBaXtyabs
         YPpw==
X-Forwarded-Encrypted: i=1; AJvYcCUNtJmYeLrGcyKZ4PYeX6qOk0WbRCAqIBuJ0UgX+632jw13KelogUdWMmHgYBI27f8kxxCqidJGwPEgxcILQufTUDaUyLZx9+/dWK5m1Q==
X-Gm-Message-State: AOJu0YyGYUZ7ZUE8Lq3oeRbMnQFytSEWLlAlzqxdNfUid5QNcyPQsRfO
	wqBnvel8kdvBT6sgJ9CqHQCbAJ2wvVZOnUuHJdfTURk0W5vHSdOwR44uLX/Bl5X6fqDRc/nin0P
	xGvLjhblcxG62r3zDEyYTz/Ggcevh7wNtTbmTfw==
X-Google-Smtp-Source: AGHT+IE1KB8yrzrfhVxOHpSzlO3DAENKkQ1zAhecye+ph9WJKSb9t/G7xbAvzC7x1FXX+/8cofgIR2G0w2AQZg8an/o=
X-Received: by 2002:a25:907:0:b0:dcc:9e88:b15 with SMTP id 7-20020a250907000000b00dcc9e880b15mr878986ybj.41.1714514389105;
 Tue, 30 Apr 2024 14:59:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-7-mr.nuke.me@gmail.com>
 <CAA8EJpqY1aDZMaeqBULEOD26UeGYbLd8RsA16jZw7zXJ7_oGPQ@mail.gmail.com>
 <6726fa2b-f5fe-10fb-6aab-f76d61f0b3cd@gmail.com> <4a7b1e1d-ac68-4857-8925-f90c9e123fd1@gmail.com>
 <CAA8EJppGW=qyk2P6Z_S=dp0njsCjqZaXjw8qU4MY1HOZR-N=4A@mail.gmail.com>
 <Zi88Hdx6UgBo/gti@hu-varada-blr.qualcomm.com> <CAA8EJpq+Bbws8yH5Xq7rHyA+-=DaCcfEcgUa5RUt2+LWQW0kKg@mail.gmail.com>
 <ZjCQM24T2XIJ6GAR@hu-varada-blr.qualcomm.com> <9d9c569b-2e9c-4fd3-9a1a-50f198bd0884@gmail.com>
In-Reply-To: <9d9c569b-2e9c-4fd3-9a1a-50f198bd0884@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 May 2024 00:59:37 +0300
Message-ID: <CAA8EJpocetzWV-xoVzeD7HxkE9s4+iGq7Q-sZz8Ue89YuptdYw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] phy: qcom-qmp-pcie: add support for ipq9574 gen3x2 PHY
To: mr.nuke.me@gmail.com
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 May 2024 at 00:51, <mr.nuke.me@gmail.com> wrote:
>
> On 4/30/24 1:31 AM, Varadarajan Narayanan wrote:
> > On Mon, Apr 29, 2024 at 01:55:32PM +0300, Dmitry Baryshkov wrote:
> >> On Mon, 29 Apr 2024 at 09:20, Varadarajan Narayanan
> >> <quic_varada@quicinc.com> wrote:
> >>>
> >>> On Wed, Apr 17, 2024 at 12:50:49AM +0300, Dmitry Baryshkov wrote:
> >>>> On Wed, 17 Apr 2024 at 00:25, Alex G. <mr.nuke.me@gmail.com> wrote:
> >>>>>
> >>>>> Hi Dmitry,
> >>>>>
> >>>>> On 4/15/24 16:25, mr.nuke.me@gmail.com wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 4/15/24 15:10, Dmitry Baryshkov wrote:
> >>>>>>> On Mon, 15 Apr 2024 at 21:23, Alexandru Gagniuc <mr.nuke.me@gmail.com>
> >>>>>>> wrote:
> >>>>>>>>
> >>>>>>>> Add support for the gen3x2 PCIe PHY on IPQ9574, ported form downstream
> >>>>>>>> 5.4 kernel. Only the serdes and pcs_misc tables are new, the others
> >>>>>>>> being reused from IPQ8074 and IPQ6018 PHYs.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> >>>>>>>> ---
> >>>>>>>>    drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 136 +++++++++++++++++-
> >>>>>>>>    .../phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h   |  14 ++
> >>>>>>>>    2 files changed, 149 insertions(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>
> >>>>>>> [skipped]
> >>>>>>>
> >>>>>>>> @@ -2448,7 +2542,7 @@ static inline void qphy_clrbits(void __iomem
> >>>>>>>> *base, u32 offset, u32 val)
> >>>>>>>>
> >>>>>>>>    /* list of clocks required by phy */
> >>>>>>>>    static const char * const qmp_pciephy_clk_l[] = {
> >>>>>>>> -       "aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
> >>>>>>>> +       "aux", "cfg_ahb", "ref", "refgen", "rchng", "phy_aux",
> >>>>>>>> "anoc", "snoc"
> >>>>>>>
> >>>>>>> Are the NoC clocks really necessary to drive the PHY? I think they are
> >>>>>>> usually connected to the controllers, not the PHYs.
> >>>>>>
> >>>>>> The system will hang if these clocks are not enabled. They are also
> >>>>>> attached to the PHY in the QCA 5.4 downstream kernel.
> >>>>
> >>>> Interesting.
> >>>> I see that Varadarajan is converting these clocks into interconnects.
> >>>> Maybe it's better to wait for those patches to land and use
> >>>> interconnects instead. I think it would better suit the
> >>>> infrastructure.
> >>>>
> >>>> Varadarajan, could you please comment, are these interconnects
> >>>> connected to the PHY too or just to the PCIe controller?
> >>>
> >>> Sorry for the late response. Missed this e-mail.
> >>>
> >>> These 2 clks are related to AXI port clk on Aggnoc/SNOC, not
> >>> directly connected to PCIE wrapper, but it should be enabled to
> >>> generate pcie traffic.
> >>
> >> So, are they required for the PHY or are they required for the PCIe
> >> controller only?
> >
> > These 2 clks are required for PCIe controller only.
> > PCIE controller need these clks to send/receive axi pkts.
>
> Very interesting information, thank you!
>
> Dmitry, In light of this information do you want me to move these clocks
> out of the PHY and into the PCIe controller?

That's what I was thinking about.

>
> Alex
>
> > Thanks
> > Varada
> >
> >>>>> They are named "anoc_lane", and "snoc_lane" in the downstream kernel.
> >>>>> Would you like me to use these names instead?
> >>>>
> >>>> I'm fine either way.
> >>>>
> >>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry



-- 
With best wishes
Dmitry

