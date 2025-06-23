Return-Path: <linux-arm-msm+bounces-62062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAABAE3FBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F6C188ADA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 12:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C919D238C16;
	Mon, 23 Jun 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gsL0ov1r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74324A055
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680982; cv=none; b=G+k+i+QRe/PKWCFoFIagQCcRGY611v5z3SJrFe77f/FEAOZ8H0zrxQMyAlrV3sZnD3b13ET/fZSbZKFzxmAgbbcuvqnBLLR14cV2p164UCPOnALBJ74HA10ZsJ3XSWVwwZwj6/cstuDyhCCr461W3/OnNLPcbhcA+g37wJSbjTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680982; c=relaxed/simple;
	bh=NkXLZqiJfY/csdYeqd5+JOrKqFd5dWqsdN/hyy/5zL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iW/xHTE7pVU3OPO152kqxXqTt5bFEk8pBxqZAr6881sUMwnTveATyRjXjyw6uXWWevW3RyILjPiVPtwWLQxzgjaRE1W1CCsCmNy7xHDdaxrwPloRRFPDVmtICrcz8bdPWBQQgM0gypc5vRMMUgcrUng8t1vfEDF8WZC+XAgv9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gsL0ov1r; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so47659705e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680979; x=1751285779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tI+c5+DB9KdJhJt1LZtd5DtDnbtfkWz+1nzFqyeD/8s=;
        b=gsL0ov1rWp7V8txeD4D2i+tZvViClai0LdlAL+uxdeWoIQmeVpDGeB3dZE6QEd7U8V
         Ek5VjYRUmYA4fB+JuBMYDcJ07XCUK52zRCj7cIjvWVPalb1aSjyTZD2scf7hcFw+S0zw
         SnL+c/ODUlm0H8FYoq/IB6dUusy0FhYndvyfLC6AXB4jmjXFIHIxn+vM//Itvc9QjvZF
         orAqSFgfuMycZKgEMdqzMyF64UwoXzq0X47S7I62DVnT4X01IgF7qXqYIk2RLaCfgxM/
         gEXTxREfJuYaMnucziXNcac+ajtnOytFnaMFPhbkXkHzp4QsuX5R4OS+J1S4HnIFM80P
         M0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680979; x=1751285779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI+c5+DB9KdJhJt1LZtd5DtDnbtfkWz+1nzFqyeD/8s=;
        b=UxJXVsaYWeBNVcS7cPj+bZik+vQtGYyrNUMb//fOtqPalaQoim6tlU824ZczxsqMvA
         U1N26FUzfOaF9Dc7bo3E1vnvK0ddoUhD0RU2G/LnKTXFy0YGzToIcnM0dwCn/nD116vF
         mx77B3GMI2IT/cfggktoXwOnxbii8hrFhP0ZP3zh9IJZTzbSpW0Ezq/RaIgCxC36m1by
         WhuYTyFBQRdVUuYZ+zuXVT/8+xP65TDm+8Se9Sirqu3ncbv+il0Gibvee0JDvpgwCVyN
         51scGUrRxVCJ4l5ECyCQ+LG6e0sKfTybWj07DNFRgHwBNnmzJJ31vD63ybfHF8IYS1/S
         aehQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4YxQym/hTSlub7TxP7xOdwJMVKaLuVlBOsLI967icLk45O/3dV/kN8gznlaVg9PZ7MXTnhUV0GSArzQC4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+Cx4RoMqNa1Y2eGbIg1L77V0vjLnu5Rk8R/IrYgNgryerO8B
	imv0ao4kCsSVMCerp0wcd2Y+gCNl41nEo5jKqNa/OG1NdM5mLIiXHRJeV0IrFbxmdOs=
X-Gm-Gg: ASbGncuM+zbbnyCmi8rIio9CkpaioRU0hzZ0hQ6iRPipHSBOvS+kCsyiLRwaMIPBzXg
	zt8VH6mh8UVEdDnaefZ0pnje7Xh738ziy314+cybLHXEMejqQFpYo8r25aoHDwjrkI2wz9SznGg
	sKhO04f2eflCGe61HNrJinEL2K5JsW16KkQ+OwyDtFdtVu8rS8MgfvcmAwx0x5S5CXGaYXb6fSC
	/2NrJj/QJqSJdy9xDrvSM6kC7gOAYPLJWYKx3xjW9zEqHo4ZWglukr6xHarwYAK5NKS75FHHqUL
	nKLvxmReiQGvJWiqYCLZIdYgfqJty746fBCJ/T8l4gnz7JvJtUH58oarMZj8UMnkdiZPTMSXBg=
	=
X-Google-Smtp-Source: AGHT+IFldADGsyYQzcmWOXmHdcApCNvxHXRGgwlxtSHaBSQ6Vsn5s+guD1RaxkhQlgmOC9uJO8RIfQ==
X-Received: by 2002:a05:6000:2282:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a6d12e34b9mr11149269f8f.14.1750680978817;
        Mon, 23 Jun 2025 05:16:18 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647084a5sm109160175e9.38.2025.06.23.05.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:16:18 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:16:16 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Anthony Ruhier <aruhier@mailbox.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 Bluetooth support
Message-ID: <aFlFkD7uNC_lOtHg@linaro.org>
References: <20250610-slim7x-bt-v2-1-0dcd9d6576e9@oldschoolsolutions.biz>
 <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbedfcb3-a326-4357-8d10-3be925e5df8f@oss.qualcomm.com>

On Sat, Jun 14, 2025 at 09:54:05PM +0200, Konrad Dybcio wrote:
> On 6/10/25 6:59 PM, Jens Glathe via B4 Relay wrote:
> > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > 
> > To enable Bluetooth pwrseq appears to be required for the WCN7850.
> > Add the nodes from QCP.
> > Add uart14 for the BT interface.
> > 
> > Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > ---
> > This patch adds the Bluetooth support for the WCN7850 card on this laptop.
> > Since WCN7850 is supposed to need pwrseq, also added this from the QCP.
> > 
> > This is also part of my tree [1] for the Yoga Slim 7X.
> > definition for the pwrseq and regulators.
> > 
> > [1] https://github.com/jglathe/linux_ms_dev_kit/blob/jg/ubuntu-qcom-x1e-6.15.0-jg-6/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts 
> > ---
> > Changes in v2:
> > - rebased to next-20250610
> > - added tested-by from Anthony Ruhier
> > - Link to v1: https://lore.kernel.org/r/20250426-slim7x-bt-v1-1-d68f961af886@oldschoolsolutions.biz
> > ---
> 
> I'm mildly confused given the multitude of options - but does this
> check +Stephan's M.2 description appropriateness check?
> 

Well, Bjorn has already merged two instances of this description in
x1e80100-asus-vivobook-s15.dts and x1e80100-hp-omnibook-x14.dts, so it
doesn't sound fair anymore to block these kind of patches without
proposing an actually viable alternative solution.

From a quick glance at the Yoga Slim 7x mainboard, I think that WiFi/BT
is indeed a M.2 card there (like CRD/T14s, but unlike QCP). We haven't
decided on a good way to model that yet. It would be nice to have at
least my TODO comment that I added in the CRD/T14s commits so that it is
obvious that there is ideally still some rework to be done in the
future.

Jens, can you add the same TODO comment that exists in the other two
device trees mentioned above?

Thanks,
Stephan

