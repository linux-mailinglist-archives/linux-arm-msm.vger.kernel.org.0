Return-Path: <linux-arm-msm+bounces-8956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860FE841C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 07:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E5531F24CE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 06:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD17B3F9E3;
	Tue, 30 Jan 2024 06:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HTWnnUBb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5674F29421
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 06:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706597759; cv=none; b=rxb7+aacuqQXz7WCTUZ/P2UR4DeKkUWUMDE1E+PmtvhAzYcrm9/zoLXCVfy/UHDSZwXg9Wu9SCf8vbM2cU7p503qxiWHoMYCUOPy/o+wrJ7YHg3pM74FD2EskmR8QhprCSH9DJBvGPrBaDyTKPfwzxpLfTLIrpehj2CkGm1/mM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706597759; c=relaxed/simple;
	bh=f38rd62FtvryxBuzls0JeAXhQpMqirBsUt1TSAhd7+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9wrE3zhVsXzXJEhMtMyF21bXkB75diCIeCsJNjiUyR8Yed8CGiYgifb3CzYU8AqTdUa//ZB7sxAagplvrMmbDE96uCOSaUwk6RxypanP46PAo9yJ0Fehu64qRShnrASCZVPRUGvGldyCRQJOgGTEpG/VEsmId6arJ8kJiX0x3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HTWnnUBb; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d81b08d6f2so3086669a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 22:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706597757; x=1707202557; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5PJMH/HdUunOAP7tpQfdMSgZ5hDGSyOYNqx/qwkN+W4=;
        b=HTWnnUBbj1XOR11QxUL5xwZM7iW4vzbEwO1dseiCsuQI8wwDFWoMhn0/Cy+DgM9ln8
         LCM2hfn6MXVTYRmNThofHVEW9sdcV9fDcfcZswD0pgnScUTvpPT43Xz82W4aZmUyHhlU
         UvRkwlSN/yTwtl13Uu/e3xLyAmI2eKuVk7mr0gJv4xWmjS5scnUTkqq6cwTJSDAhWo9b
         Gf4Ilghq2Q/QH6peRjDQ689B2+i4+fMcj21iHeHsNEqMDOv2zuJTYJkx03tXyDnBiOci
         2FB0dILtl44vdigsPfsA/J7tDHpHLY+JaR2mX1/eUhf5DgRYm6u6IiJyYLTHr1yULQ9m
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706597757; x=1707202557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PJMH/HdUunOAP7tpQfdMSgZ5hDGSyOYNqx/qwkN+W4=;
        b=QC/ik859XBQic/7Rc86VJH0ULhxDfrg/o23DjRuozaZBtmeOywXKtiUW89sKG5kyAy
         /05mRkf6FYhLLA0bK0zUep8qGywO0im76qytIh/A3+SOx46vqZa7InOcOqD+1xqSeVAb
         qFbpj+qos2uRdQ/XwcoGVYSSAzA8S7+Opm85+U6a5Z3LZbn2l7Hi8UHwxpehK3dzdAZe
         XzhkN3mkrPX09PzXOma43eZEtIRnYo2fh1pzcHRv0d8Df4KfobNugUMPvirwPC2ryC61
         C5f85HXEY2AEbInro3PcdLA/cwwogNQLk15cwcoo/RwlDnBq3WbKe4khpG7qkSSNCDPL
         WUTA==
X-Gm-Message-State: AOJu0Yy+77wYs04U2Ggs8EgbIXLPNplCzZ0krkYFvkQVwbsQ8KZkAdY/
	iep8dy5S776uzwEwsZt42S2eSKAMo3n/tmxo/21GuBTrPFoIvuOX6wRcrxDo3Q==
X-Google-Smtp-Source: AGHT+IFpEKVElT7de8BCoRgnp58zQKc7aOBfHYJC5E5RO4pmtcDt56YFkl+Z4pxHAPHQcV7Yg0OhZg==
X-Received: by 2002:a05:6a20:4d99:b0:19a:54df:b77f with SMTP id gj25-20020a056a204d9900b0019a54dfb77fmr6054994pzb.60.1706597757608;
        Mon, 29 Jan 2024 22:55:57 -0800 (PST)
Received: from thinkpad ([117.202.188.6])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902b28200b001d8ef97de4asm2314948plr.38.2024.01.29.22.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 22:55:57 -0800 (PST)
Date: Tue, 30 Jan 2024 12:25:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Andy Gross <andy.gross@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8996: Add missing UFS host
 controller reset
Message-ID: <20240130065550.GF32821@thinkpad>
References: <20240129-ufs-core-reset-fix-v1-0-7ac628aa735f@linaro.org>
 <20240129-ufs-core-reset-fix-v1-3-7ac628aa735f@linaro.org>
 <CAA8EJpphzwoCaetGfnM8dE478ic1-BMqXKA3XVLeC9j5BBu3SA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpphzwoCaetGfnM8dE478ic1-BMqXKA3XVLeC9j5BBu3SA@mail.gmail.com>

On Mon, Jan 29, 2024 at 11:44:15AM +0200, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 09:55, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > UFS host controller reset is required for the drivers to properly reset the
> > controller. Hence, add it.
> >
> > Fixes: 57fc67ef0d35 ("arm64: dts: qcom: msm8996: Add ufs related nodes")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> I think I had issues previously when I attempted to reset the
> controller, but it might be because of the incomplete clocks
> programming. Let met check whether it works first.
> 

Sure. Please let me know.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

