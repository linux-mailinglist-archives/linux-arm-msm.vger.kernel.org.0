Return-Path: <linux-arm-msm+bounces-74541-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75848B97435
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 21:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AC443208B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 19:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFD7302CB1;
	Tue, 23 Sep 2025 18:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+4NDdnw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FAF2FB084
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 18:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653994; cv=none; b=tEkWW5kpooLSV+aETU+mfpN8HUEsbrWLkCI3OkyF/edk4HR4hNDMzmig/9zoKyNfwl+jRzmGQKzXuUCsmtXr63k+jcMRae8Xt6h1smCK6EOXFaSwxSXbbn6Mj8PptpaEkUJSRlM1/JUfHi3URz9373fXqpur+59HHdtGNtA9ZRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653994; c=relaxed/simple;
	bh=DWcgQoC7mbLIcOae7OLDIeE5ye70Nq22n9Jh3BH3ixE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbml7+I+tjs/TrawK/Kt5UHJUAIEgR91kpaCGYcMQriNl5/+HIj7cKkjKey6qfiqCgTchixiuvVE6Pm0YYqcIEprpsdfQcRlqqRRk+mX8tyNzRA6ezo0AhzQqBmCDKY0n9IJwACvDbwfw7PFAwyMliyFraN9f9OoZidH3rg6e40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q+4NDdnw; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so831522166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 11:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758653990; x=1759258790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LORB79saQtcNPiyY44B6K0FPB3bszS2VB5LSvhgyj0k=;
        b=Q+4NDdnwc5FV4iltYyv1orIoLQPw3BpDoi9qEnGN8ZQo+vm7NJdcz8aMhQZf8C/i4/
         vGA8nwcta7z+Z9MR8Jh4rBccRziHGpkOr/IbrgGtPO6o50pPM/T5j597HMvuTFyQpmGD
         kab5SKsQUw5x8Fsso7+dpAxu0GP4mL/oC//6V1UiGixiwBpJodI0Gvp+2sduxrMkgjgV
         ZM7W/2Lt5itEe58FdMJV8SmujNyH8a8Vg+QD+K6uigu3AOMgjRSsU+8nNr0/6m3pUpXf
         VSngb94yAINIqIbP5d+kq/bvuwxD1Mc38OIjsePRkD8h8/I2MISnLku+kj/m3bpOLks/
         OePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758653990; x=1759258790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LORB79saQtcNPiyY44B6K0FPB3bszS2VB5LSvhgyj0k=;
        b=I2EzDZ8wdid5F8iOeiBPlz31Ld8qxKqO5Mj15pe5DEBmHCWJqgh8izAJwI9ljj63fw
         26tKJ0paBzmsqHVZbBcSFsL9/+W5TQJyQV9jWKtxH2FYPH3cW/vmR4kZvKSf5Ix1cUmX
         7moN58yUqgRRVVWD89axUbW77WAJMkhLqPUwsXtGqcYaqqcp9kbmMHP9EQTqaPDlhGqv
         DMaTnFTOOmyS+UjMsgkUAVD1aoAAyxqbCyyp6YHzn6I/kyg1ab9HWQgaxPTVoeKn66wV
         rwmnY2Bf+tYAGCmKg5I0X4PBfIFBTgRn7l15+DeRBTojKeQN4w55d+mPGNzhab9MNRVU
         xxHg==
X-Forwarded-Encrypted: i=1; AJvYcCXVAP4yoZW0CMBe4ny3b2yGHAddR+Ab6LaZ66Ofo5MjwwuZhwYDhqXiHRkCRkLy/D+OUorkYlPeaNJAHAG0@vger.kernel.org
X-Gm-Message-State: AOJu0YzyptX64ZOLWyhBoY/mjnU5kFOj5WtXamxLy35BD9YcmSkZzMJc
	uIaz6VvpifF7JPlUgyz3KClCxzujPHr4mwS5TVXjHNj/dnagFRE2zaInan3GWIIBdtw=
X-Gm-Gg: ASbGncsdfkFVxvT+qp+Nm8k0by4hdNjoH3rfK/ob2X68NQ3nNdd0DBkCvn0INQR9t38
	bFWUdlPegcnXB/VV/EWKd7hzt5D5RA7/a/Sr0aTDqTuQ8voQg8Rf0gwRQDiIFQxWQJJlof0Akqw
	G4GdYjqaap2S0Gqif6+W8t89G6CLfUDiqQMl48tjvi1oxUkmWaRVmHGPMXYxTM1n/3kU4b/fUXd
	XFeRvVqbHR/L0P1lzdEKMK3DG4mZTVdeNAI8aKyBmoc1CkcltAPZXlEKBZ4j7DFL23AIBYqnfAT
	vJPUg7dh5rI7nuNh3oYtJBdb8VX8EQVpUYuO+ExiZ33r4Ty6DxzBfND+Q90VNJ2dOjtfw+Qggke
	4oDjditl8WjXekroKbKMDWJS69rD6pw+O
X-Google-Smtp-Source: AGHT+IHpNDrBMGpbrr+jACB56SjeewurC5sNC2bfrGwwMx9GpqNnbrlv/Ka/PcBzermBd/G+tFnJ7w==
X-Received: by 2002:a17:906:6a28:b0:aff:fe6:78f0 with SMTP id a640c23a62f3a-b302c20390dmr373202366b.54.1758653990098;
        Tue, 23 Sep 2025 11:59:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:bd4e:c20d:5910:982f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b31a562fe38sm86252966b.45.2025.09.23.11.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 11:59:49 -0700 (PDT)
Date: Tue, 23 Sep 2025 20:59:45 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: rename x1e80100 to hamoa
Message-ID: <aNLuIX1wcUYMpVBp@linaro.org>
References: <20250923-rename-dts-v1-0-21888b68c781@oss.qualcomm.com>
 <20250923-rename-dts-v1-2-21888b68c781@oss.qualcomm.com>
 <aNKAjIXT3ll3L0qT@linaro.org>
 <f5kgh4hivkrxcfkinberpdxdnyybw552zqup66cmobtgqag477@qldaejueyyr3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5kgh4hivkrxcfkinberpdxdnyybw552zqup66cmobtgqag477@qldaejueyyr3>

On Tue, Sep 23, 2025 at 06:14:45PM +0300, Dmitry Baryshkov wrote:
> On Tue, Sep 23, 2025 at 01:12:12PM +0200, Stephan Gerhold wrote:
> > On Tue, Sep 23, 2025 at 02:01:55PM +0300, Dmitry Baryshkov wrote:
> > > The X1E80100 and several other similar names (X1E78100, X1E001DE) all
> > > belong to the platform now known as 'hamoa'. Follow the example of
> > > 'lemans' and rename the x1e80100.dtsi to hamoa.dtsi and
> > > x1e80100-pmics.dtsi to hamoa-pmics.dtsi.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi                        | 4 ++--
> > >  arch/arm64/boot/dts/qcom/{x1e80100-pmics.dtsi => hamoa-pmics.dtsi} | 0
> > >  arch/arm64/boot/dts/qcom/{x1e80100.dtsi => hamoa.dtsi}             | 0
> > >  arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi                  | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1-crd.dtsi                               | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi                        | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                       | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi        | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts            | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts             | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                          | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts   | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts           | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts              | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts              | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts           | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi           | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                          | 4 ++--
> > >  arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts              | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts          | 2 +-
> > >  arch/arm64/boot/dts/qcom/x1p42100.dtsi                             | 4 ++--
> > >  21 files changed, 29 insertions(+), 29 deletions(-)
> > > 
> > > [...]
> > > diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > index 10d26958d3c66a5a4faf2ca6065e7b661f967b4e..2cecd2dd0de8c39f0702d6983bead2bc2adccf9b 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
> > > @@ -3,8 +3,8 @@
> > >   * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > >   */
> > >  
> > > -/* X1P42100 is heavily based on X1E80100, with some meaningful differences */
> > > -#include "x1e80100.dtsi"
> > > +/* X1P42100 is heavily based on hamoa, with some meaningful differences */
> > > +#include "hamoa.dtsi"
> > >  
> > 
> > If you're renaming X1E, please also rename X1P42100 ("X1(P) with 8
> > cores"(?)) for consistency. That one also covers multiple SoCs.
> 
> I haven't checked if we have clearence for that name.
> 

This is a good chance to ask then? :-) I'm pretty sure I've seen it
being used by someone on the mailing list already ...

Thanks,
Stephan

