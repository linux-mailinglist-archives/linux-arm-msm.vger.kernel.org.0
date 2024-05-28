Return-Path: <linux-arm-msm+bounces-20762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2C28D1C31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 15:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE2151F235F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 13:10:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E42616DEDB;
	Tue, 28 May 2024 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmQsayfL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6AD16D9DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 13:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901803; cv=none; b=mo6cRsf6CFl3MU1A77JdjEqtYx0B5r8XmrkHmrEjj1PB14X3OPRT+ztRHdyyHKtuunRrHuVrFYgYanuF6prs956kCa+u04d1dU8DfNzA3y/eigWJokfY29FuiHJf2CDo5WDweLWSkzdgcCs9SI28Vni1I4FqUilP625WMt5wU04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901803; c=relaxed/simple;
	bh=oJRSdItw2anLfw/4zZaFRaP3Dn6ne/abmv6YdE3q5AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut334bxU9/TNA9Gy/fvLq/ffvlYF7hCBE2t0TqKPR0IPLneAuKnS2rURx/xlU4TxJGw0P1Vl3npDJdToz86y45XSucP0wf+nKHFEujpZyaRootzPkT0aGGXIHLvdGxeWLLduiJpoXIk0YWdZfeeIqFI41YhIsHHG/VwfAKCdvLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XmQsayfL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-529b4011070so1052460e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716901799; x=1717506599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PPwsTBTSG17+Fbzi2z4l/C98UM+jSBGnmgHkuUq/dfg=;
        b=XmQsayfLeDSkPS/1f9j2ZNaCnETid3Xyhe1IMqSQyOiKDQpa/7JaxQq0iwfxJvnZQI
         j6oJIntPosG6E2pfczc1oyYhIIOTRdqfhqZu09WtS9yPf7XATBFLc1RvW4kZC5dRn2iA
         /covHL5hkq7+gXezHJ4XBAxhtduW27rkjtD/6vDDcxl6i5emuHl4qavL2beY1sCtiqa9
         Z7lXx0mbFelsDTyRVMMbZ8+krH2GuuymbZSVddvT1PsQqd4HsbCf41HtVOOLO69E1YUE
         iELBkg6E3+/a/d+Kf/dcN0PIWKJsz+SCkIIEf9vzc0u5ViY/WiN9+2UCF1Dc/Usch8WF
         Dl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716901799; x=1717506599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPwsTBTSG17+Fbzi2z4l/C98UM+jSBGnmgHkuUq/dfg=;
        b=Hhr1/FzNEG+3Cisr3pVHrD+1z010ClsxpPGhEH9Z6FFKy3H2rIee+UeZQi4zGmJlZk
         HxcoUveXc2W22ZLb62/R9EsCaeN7orVjCjQWud4tbXRzzCXqQsSG9OCb1f/G5EYDhGhW
         g9c3sW5Not65+txSRl7Quk9Lwdg2bKZqmc/njvvWoP53td5ke/zlbolPap0A9AofNv3t
         esRpQl0V23+t8RPYgJiPw/EIgVtUX58Ua8XEPn5sn0x2Q7tIITio8keATc+qcYhfDgzI
         0ADmf5qPOvZIH+CYlw4TOF2pF1XJFiJZYh7WmWLnFKJFCfDJveYDhWwwaWngtf02npb4
         w5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSzn/RNSejSqhEpbyeCQm3sYrMUochRNKRsxeXb8DHDgwT9+KYi4ddKsAQoOvBnXxfWSoh5fZUxhb/h6XmXcEegUvJsX9EM/cflE27yQ==
X-Gm-Message-State: AOJu0Yzr+gmwR0sbgWInWx2iEr/R42Z0ZKLWRNvPsR5EU2Xsmm/9Q0VT
	GFD7mu+PxWwRX6rlGRMpAzLy+7YzMKcufSK0ddV80mDXUhJHCZZ6XO2gNBTl8kU=
X-Google-Smtp-Source: AGHT+IG5b3vXE8/MoabYI/9hNRRALdcl2EYh3i90PULGycLtPuvRCTBGfdkvBEQL5r2PPaFh0SwboQ==
X-Received: by 2002:a05:6512:acc:b0:529:593f:3f39 with SMTP id 2adb3069b0e04-52964caab87mr9168415e87.35.1716901799454;
        Tue, 28 May 2024 06:09:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970e1e75dsm944316e87.230.2024.05.28.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 06:09:58 -0700 (PDT)
Date: Tue, 28 May 2024 16:09:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100-crd: Add pmic-glink node
 with all 3 connectors
Message-ID: <wnja3vrlc7nnusdsi7zrb4yeej4oxslah4yac6xopojfe7hh2m@laexn6b5sxwr>
References: <20240527-x1e80100-dts-pmic-glink-v1-0-7ea5c8eb4d2b@linaro.org>
 <20240527-x1e80100-dts-pmic-glink-v1-2-7ea5c8eb4d2b@linaro.org>
 <68e51df8-5553-4df7-91f8-65bef924a407@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68e51df8-5553-4df7-91f8-65bef924a407@linaro.org>

On Tue, May 28, 2024 at 02:28:08PM +0200, Konrad Dybcio wrote:
> 
> 
> On 5/27/24 10:07, Abel Vesa wrote:
> > Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> > for USB only, for now. The DP port will come at a later stage since it
> > uses a retimer.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >   arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 143 ++++++++++++++++++++++++++++++
> >   1 file changed, 143 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index c5c2895b37c7..2fcc994cbb89 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -49,6 +49,101 @@ chosen {
> >   		stdout-path = "serial0:115200n8";
> >   	};
> > +	pmic-glink {
> > +		compatible = "qcom,x1e80100-pmic-glink",
> > +			     "qcom,sm8550-pmic-glink",
> > +			     "qcom,pmic-glink";
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> > +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> > +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> > +
> > +		connector@0 {
> 
> Could you describe them somehow? e.g.

Which reminds me that we should add OF bindings for physical_location
driver.

> 
> 
> /* Left rear port */
> connector @0 {
> 
> 
> There is probably some better terminology to describe the one closer and
> farther away from the user, do as you will..
> 
> For the QCP, they're numbered on the chassis
> 
> Konrad

-- 
With best wishes
Dmitry

