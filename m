Return-Path: <linux-arm-msm+bounces-35555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED7B9AC093
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9A8F1F24832
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE98F154BFB;
	Wed, 23 Oct 2024 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odJ7LRLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDFA1531F9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729669623; cv=none; b=Pz5lqNn71iHIN0jk4saClGXMKk/V9SIsABfkGNDkE4Wzaspep5JJnSeg2xQm/dPNpcnrjiug7i2g79E4NR7w420gzlZg/7lQvKpL5wpdDds6S7mzoWCb02sXYkbfbPjPyEDNWA1R0O0xRjXH1QoLytyvZZCc9VPXHtZTqajTq0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729669623; c=relaxed/simple;
	bh=QuCmoqfngmnxfQ6uT2MtG4cs70OVMHmJ586aBYRnGaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L053D1YEaDcQhzC7Rm0KFjPbY1ypZxz6G0AwqJzCuQvbmM3Bjhhnw84RzQ+P9RI0FKsb7/HibjAICi0fB1PPbL2oCBtggnl517CgOzV3gtpOTGpnMpudkDtNRmIMm9iMEGgDDpga4sq8iDyh6vnieP+xIuL2e3AgHH3MJl7pJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=odJ7LRLg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431481433bdso68465405e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 00:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729669621; x=1730274421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liICTeLXULEGRFqaDSFlDIwiTh7kWdqnepDYW7yyxPA=;
        b=odJ7LRLgL0ZPB6aOH+1qJFPEmMNQPeyhTjstocRQ/MCXm5DkbHefiLph4bMeHnmBFf
         cNAG6U8uG7RIS2bZGtjt8Tu88oY9iZQtAePvEOk9tM7wLYD3al5RaL8y9EujDLR+owKD
         S3e+ztHU9J1g/anhH4gH5iFaSfwsRiFVerBOycL9Mzj1S3pjYT31LjNfvh8BHLgFfzVT
         h6/IAolg5pETY5YH+u+vf5jlB7ZrPqv3ZiJfGW8VFfp4KSx+at0hlutV3ubA4RevlCy7
         Ljx9MzojrJdZSTZArQx20C8uwBK6vFTF5OrkiMm1yQzR6GVdMzUocNbVZCncsANxbC9Z
         BgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729669621; x=1730274421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liICTeLXULEGRFqaDSFlDIwiTh7kWdqnepDYW7yyxPA=;
        b=IGjSKT2ACQB/ePBqRIwDB8A/7VrKGy5IWJcnf8rO8pcIzXG78kqkdtZmCZltSqQ5LK
         N+1WFbeH4mefwbxgVDiV2m9ZeutCapzrvSB3CmDW9B/xE65B0FOJEpRPWtYo6xru/vKP
         5WFcOWI4znEJMMMNhvsvVWHxYyeG2SRN9muZCJUYnBqa/A3VQCNCNoUblHG5vDyRvd58
         efLrQw8+F6um24UZG6Zh7dw/wfDaFMyOcE8JLil3wS0xkelHKyHtLThFsQwLedb1i8Iu
         vA2itaCbef9qokMZvZGbyaRKPn4z/JPmjqd/GCnMRb2f7R0XWrvYBU9mMyMM0osq7HzC
         desg==
X-Forwarded-Encrypted: i=1; AJvYcCUsQ1zCppUbnVvo9YDTBC8v1dbupR+hbnnBzUZkNBqrdpp3HjHMU+8Z6+7Wh+5CaDcRxSDQOf/gsiPvp40B@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzag4yt8pbdl6zH9UMC1YYOu/7nHdYPbW5vYv6IHk+kxnfFxOd
	1qeHQfZAiv95I3n/Ovy2OeV1TnGD7b//RcBEBvqlH4DX+JExn/ROsqN+Rf+ieDo=
X-Google-Smtp-Source: AGHT+IG2L/bf+gjq24KqYERf6MQ4wawa9hyuhpxIU5GnUxegChtaKctOKmfVTwI/Jjig1MCKlllQNg==
X-Received: by 2002:a05:600c:1390:b0:431:1512:743b with SMTP id 5b1f17b1804b1-43184169c3fmr13602085e9.21.1729669620617;
        Wed, 23 Oct 2024 00:47:00 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37df9sm8303727f8f.19.2024.10.23.00.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 00:47:00 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:46:58 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: x1e80100-crd: Enable external DP
Message-ID: <Zxip8j7dgrWkjOH/@linaro.org>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-4-68a95f351e99@linaro.org>
 <hoszdyny34qr5kmtkq2fk3m24kixuwlyavpr4ufrf5vo7gkz7o@gxo2mw2lbxj3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hoszdyny34qr5kmtkq2fk3m24kixuwlyavpr4ufrf5vo7gkz7o@gxo2mw2lbxj3>

On 24-10-22 19:32:18, Bjorn Andersson wrote:
> On Tue, Oct 22, 2024 at 01:26:57PM GMT, Abel Vesa wrote:
> > Enable the remaining MDSS DP instances and force 2 data lanes for each DP.
> 
> Please document why you're forcing 2 data lanes for each DP (should this
> restriction remain when we add support for 4 lanes?) - and I would be
> extra happy if you spelled out your abbreviations.

Will do. 

> 
> Regards,
> Bjorn

Thanks for reviewing.

Abel

> 
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index 7cc45a5cd7eb7e70915d04ea7e181b56f693f768..db36e3e1a3660f3bcd7d7ddc8286e1ff5d00c94a 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -1105,6 +1105,30 @@ &mdss {
> >  	status = "okay";
> >  };
> >  
> > +&mdss_dp0 {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp0_out {
> > +	data-lanes = <0 1>;
> > +};
> > +
> > +&mdss_dp1 {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp1_out {
> > +	data-lanes = <0 1>;
> > +};
> > +
> > +&mdss_dp2 {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp2_out {
> > +	data-lanes = <0 1>;
> > +};
> > +
> >  &mdss_dp3 {
> >  	compatible = "qcom,x1e80100-dp";
> >  	/delete-property/ #sound-dai-cells;
> > 
> > -- 
> > 2.34.1
> > 

