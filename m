Return-Path: <linux-arm-msm+bounces-33249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13806992035
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834C61F2195E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 18:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314AA18991B;
	Sun,  6 Oct 2024 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nqblB2C/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6B189B9B
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728237714; cv=none; b=SYMP9FS3B/QdXboSJ/Yey/zEMVUdrLaIdCIopD3EwAl7HqEs1Q/QUfIcCLCg2E00Lid1am79YDDQZMaBfD+XoNm0n9Lsdxk2jQo4ZjjelotSgMNnT9F/CcPun5e6MSqCy1N/LMLAs8pq0Y+uJJPLBRxXPJF1ClkTdLwRxpbJPSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728237714; c=relaxed/simple;
	bh=h/eHBMo75q4g8Vy5Dhgk5ZSSFphKBV3uac7pVYR9Tpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3Wzg8Irrs6Y6+IZdY0Ge2E/s0E224+onz/XbiqIRsa5c9j42YeB71ew96FLk1Q9sh0OdZSKUlptj0kF+Epb6z3B2hbhO71qFiDAbXi7edQXKHMnkv3zViQDIqDfsTailIhoYU5zJmVnOEdZmXlEK4roqpM17bdRdNDenD/moqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nqblB2C/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7e9ad969a4fso2189412a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 11:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728237712; x=1728842512; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SaMUBLoBBR07C/bYoUpjG4R9HZWfImadGC0U2YnHoLI=;
        b=nqblB2C/WZNS+I6IVKef1///tVEvG2r4YhbFp6j7fM3tHP7wxRku5up/WGks7Qy8EA
         IyF+QDTB5Fuec8l5Ofu/0fbhxXjcHECVpLZYO7R8v7OEZ99s7RZSmKclUaEHYS9RSb+E
         tZwywiJacFikcd3Gk4iIcgiiwSxjnDdlDUzvyurm/bhqtOisnVno6WHFyxePJYwLzTIw
         IPIO2x7KQ2bRwwdFVxQdLQwwVp28/iXcouZxFhPtCA0ShlEYwopH/7uFBDjN7PCx0QFS
         YAQkxnDKZWzWTQvnQu1wJ22ZFMGZ7N9/5ISVRe9hW+QgKV8A5SN2buReTUGXXQM1igqE
         ihkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728237712; x=1728842512;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SaMUBLoBBR07C/bYoUpjG4R9HZWfImadGC0U2YnHoLI=;
        b=ONwitUOCuovZTVmAIqL0qYR81ZvXZiO708T4ya0ugRDIRz4pmVI1jZAsbHw0mZRXTz
         +8rhYKCWWc6xBwAax4m4UmFUhp1XD2ZC3TJzOQxy3sdhuBhVNp2VrJDeIhZVQFdWuyXH
         tonXI7UN1m9rSaMWFDY475iBG9ZdDpDfo2sXmkgRw1UPVkKqcMapXttyYnVbSCob9AlH
         QA6DWjaiLPGZXH1Aqx6Xt1JBFWHHgG7KRRcT4pHGObAgC6deTTEEyF2VbfbkN7NVObm2
         hZKi6pcnm+aaNJNsJQiTeuAWADzTE4vR85uOGNCO4euLQSSx2U5o0JMJmpFpkKIUdQ6j
         LLWA==
X-Forwarded-Encrypted: i=1; AJvYcCWPi4TtyQxTEcGid4CZ0z6JjX4JNE5i8LIcz78UXZY7fy9cLhytg9fjRyQycYujKB0keeSb0pkn4PmIsyXA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Omfw55hwcFB5qstWare7L5huXaqjJqDVacij08qb63hVZsNF
	EPd/TmjC2+60F3rkDxlx93QubFmFfBv1/vep6MD1dxV/1ylXge9iAaVUNGYg4m9BNH5GnHGgarg
	=
X-Google-Smtp-Source: AGHT+IFyQRwLChkdAtgok+XKIQIoLYCmRv24p2cIvqhwFQFSIZbUzdcjHt6G40jahaoV8Hwts212Rg==
X-Received: by 2002:a05:6a20:438c:b0:1d6:b63c:53c4 with SMTP id adf61e73a8af0-1d6dfa1e5efmr14308957637.2.1728237711884;
        Sun, 06 Oct 2024 11:01:51 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6642dsm3014782b3a.168.2024.10.06.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:01:51 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:31:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	krzk+dt@kernel.org, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
Message-ID: <20241006180146.m6xvpwbvkiy7obpx@thinkpad>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
 <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
 <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>
 <20241001085105.iglzp3art5ysli2d@thinkpad>
 <b1d982c1-f800-97eb-1be3-e77e04a8e81d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1d982c1-f800-97eb-1be3-e77e04a8e81d@quicinc.com>

On Sun, Oct 06, 2024 at 12:33:21AM +0530, Sibi Sankar wrote:
> 
> 
> On 10/1/24 14:21, Manivannan Sadhasivam wrote:
> > On Tue, Oct 01, 2024 at 09:56:30AM +0300, Dmitry Baryshkov wrote:
> > > On October 1, 2024 5:42:35 AM GMT+03:00, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
> > > > > On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
> > > > [..]
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> > > > [..]
> > > > > > +
> > > > > > +&pcie5 {
> > > > > > +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> > > > > > +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> > > > > > +
> > > > > > +	vddpe-3v3-supply = <&vreg_wwan>;
> > > > > 
> > > > > Please use pwrseq instead.
> > > > > 
> > > > 
> > > > What benefit is there to wrap a single 3.3V regulator in pwrseq driver?
> > > 
> > > First of all, is it really just a 3.3V? Second, is it actually powering up the host controller (as expressed in the device tree? Is it a power supply to the slot (in this case, I think, it should be expressed differently)? Or is it a power supply to the card itself?
> > > 
> > 
> > Yeah, we should get into the details here. We were not paying attention till
> > now, but with the advent of pwrseq, we should describe the power supply properly
> > in DT.
> > 
> > Here I believe the supply is to the PCIe Mini Card connector where a modem is
> > connected. In that case, 3.3v supply should be connected to 3.3Vaux of the
> > connector and we should have a generic pwrseq driver for the mini cards.
> > 
> 
> Hey Mani, Dmitry,
> 
> The schematics are identical to that of the X1E CRD with
> the exception of the pcie daughter card having the rtl8125g
> on it. Yes, the 3.3V supply is connected to the card as well.
> 

Is this connected to the 3.3vaux of the card? Please specify the actual rail
name as the 'PCI Express Mini Card Electromechanical Specification' specifies
only 3.3Vaux and 1.5v supplies.

> Doesn't this mean all other x1e boards out there needs to be
> updated with pwrseq as well? Anway will get that addressed in
> v3.
> 

pwrseq is the kernel driver abstraction, nothing to do with DT. But for making
use of pwrseq, the supplies need to be described in the proper place. In this
case most likely under a separate node of PCIe bridge. Then you'd need a
separate pwrseq driver in kernel to parse the supply and take care of it.

I'm currently writing a pwrseq driver for standard slots (x8 for X1E) and should
be able to post it early next week. So you or someone could use it as a
reference to add a new driver for m-pcie cards.

If no one picks it up, I may just do it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

