Return-Path: <linux-arm-msm+bounces-32853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D7798B794
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 10:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983361C2260B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 08:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2A419D09A;
	Tue,  1 Oct 2024 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J2tOZD6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A6419D082
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 08:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772673; cv=none; b=Q6jJovelsb4tu3xC+hifEc5ONkxuq2pBl4B7JQfb/Q/CCeagWm1S1hnft4WMV0JoQHuu2YNJMS33H9Rch2Wqz9hT4RGd2pxTwiY+n62WrSs0NUUFEtehv/8hlysW8QjceXZu+9vkFejU6AAR2gMyTlJ8lvPz/7avqCEgNUXj8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772673; c=relaxed/simple;
	bh=rvq0jjtSeXp6memC+hL47Wgc3u62FSCpJtOGWn6ptDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSRRDHKXLYltc3Ccr7R4OONqQzLY/sFjg+7FKpVXxkD69exndBoRqIGQijvSYqtJbhV4XbwuG/NtgzNJT2cPMVYFcTGze7DTal7wip4heW3V4E5yub4Pgr/v0jpZmgQ3NIgZPTHGrc7P7qUwMfZDO1ud5VCaf5a/IucIrdH6p8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J2tOZD6/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71dbdb7afe7so255639b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727772671; x=1728377471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T33uUeB7DNOOLKHqcQQSNjPbvyI7kdL3R1vLdSkp1S0=;
        b=J2tOZD6/NHWwqbYxZ0MzAzhGv/flSDro1qgJEvJbkRtSfZ/jn99bOV805biPCD1iY+
         joqoI21pEVMDOuBGBi8H3V0FrGx2ptbTXIgSu0GaBeUgM8q3tMynmDZA46xUsldc6N8L
         abKDRCLTmzlUlIMxXPMeuR/HXBKIEXmJrHGRQT6I/d9rd1CD2Ce//IxCLG6dBBslV4yB
         2RlezwkTMuE08BYsOr2T/PE1NBP1avA80dWpUOkpskshlkk69vGYmnl949+zZOjeGbFh
         IEzt+kc14F8aRAX9LcTfy9aaenGrycjRwnOrkf/6gjCNlv8XGl1YdWhO7ByJpOPvXyRd
         OXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772671; x=1728377471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T33uUeB7DNOOLKHqcQQSNjPbvyI7kdL3R1vLdSkp1S0=;
        b=SDJ7e6n8a1pMVc/+9xtK3uwpjy2whC4eeKGSnpONi/On+wZFOE9qwsUczSCFP4BkmV
         rzk543idFevdQ5rYviZ6mV3TKOyW+EybMVy4D+EsCK6ZjmKDFzy6sQjGkVsZQXzx7voJ
         2LD1HWCMECsTvk1HLAxDphevUAMVe8kWL9e0Se7TIcm1G7FL3fRgaoX6mlld9mz4U1/e
         L/SZRJf4xwu2b7aLJFiADxjb11jyZY563BuCu3z8i4Yu38SS7vSIK5N+BN/McqUzaBAd
         QW9+d8/Q57bFJaxAbs6jcNjMgA8oddvJI6BzRAoeNUZxn3nMll6KuaElDyvhQYOZ6j1e
         LSWw==
X-Forwarded-Encrypted: i=1; AJvYcCU+0rZTbFEoCZ+UflfP0IpNiNMG2cbq3JVayJh47wqd4AN7bJ44mKoTZTQMA6SbDBosE7Pqw8npwiWcVb44@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9HDXWrEwXFKqxIouctWTN4wU+HKtPBs96jdPcJV4FPjIWy0Uh
	t4tu945nKGog5kaIktMHGjoYGF0HRvwtzlzFWQUpVsnzrRpvBitlWa8WRn4TWw==
X-Google-Smtp-Source: AGHT+IHmuCbCebubZdr7M8xU2lElWO48YfR8hemV4Nj08qcFiBJIN9/yuxY2PqUtwZjWMj9SXKl//g==
X-Received: by 2002:a05:6a00:b50:b0:714:160e:8f5f with SMTP id d2e1a72fcca58-71b25f39a66mr21477216b3a.11.1727772670928;
        Tue, 01 Oct 2024 01:51:10 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264ba53esm7551388b3a.56.2024.10.01.01.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 01:51:10 -0700 (PDT)
Date: Tue, 1 Oct 2024 14:21:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, konradybcio@kernel.org,
	krzk+dt@kernel.org, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	abel.vesa@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for
 Windows
Message-ID: <20241001085105.iglzp3art5ysli2d@thinkpad>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
 <20240911073337.90577-3-quic_sibis@quicinc.com>
 <pt4wtycddqhcvw2iblaojmzsdggmlafft4vu6lg5j2vstbhbqj@acenyi5k3yeq>
 <eqy4yicgeqlgaytgzybnitvbrdr7jmjjk5k2swmadad6scwk77@ubaf7a2kgmdm>
 <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1BBC34CC-92D9-4F6E-8DFA-1F2DA36D545A@linaro.org>

On Tue, Oct 01, 2024 at 09:56:30AM +0300, Dmitry Baryshkov wrote:
> On October 1, 2024 5:42:35 AM GMT+03:00, Bjorn Andersson <andersson@kernel.org> wrote:
> >On Wed, Sep 11, 2024 at 10:55:05AM GMT, Dmitry Baryshkov wrote:
> >> On Wed, Sep 11, 2024 at 01:03:37PM GMT, Sibi Sankar wrote:
> >[..]
> >> > diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> >[..]
> >> > +
> >> > +&pcie5 {
> >> > +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> >> > +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> >> > +
> >> > +	vddpe-3v3-supply = <&vreg_wwan>;
> >> 
> >> Please use pwrseq instead.
> >> 
> >
> >What benefit is there to wrap a single 3.3V regulator in pwrseq driver?
> 
> First of all, is it really just a 3.3V? Second, is it actually powering up the host controller (as expressed in the device tree? Is it a power supply to the slot (in this case, I think, it should be expressed differently)? Or is it a power supply to the card itself?
> 

Yeah, we should get into the details here. We were not paying attention till
now, but with the advent of pwrseq, we should describe the power supply properly
in DT.

Here I believe the supply is to the PCIe Mini Card connector where a modem is
connected. In that case, 3.3v supply should be connected to 3.3Vaux of the
connector and we should have a generic pwrseq driver for the mini cards.

Sibi, please verify the above in schematics.

- Mani
-- 
மணிவண்ணன் சதாசிவம்

