Return-Path: <linux-arm-msm+bounces-75247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E961DBA293C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B87924E1115
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00492AE8D;
	Fri, 26 Sep 2025 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LsgsQepp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8D327E054
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758869571; cv=none; b=vCkThgWm9iT4iDWhsiTAwHn91n/GFHLCjBs3m5bRb4wX0itfaasyEUEQjF7KqqwoDoURk2HpN2hulLKVSLdzy6DN8ojuZ6/IuVFNSgRL2z/4FLnPUqL8kEjiWH9gOYI8mqplmkQOOm2P3RB54OtcMxWNVw6xh7UWhzfbjjR20sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758869571; c=relaxed/simple;
	bh=b6ZKAv499VFPWlZnjzJkLC3vtFedefMkFojpCq3xoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKMInm5BPCmj7GOIUNYRuo9xZQUE69lY8FjSnUnv2fxhBBcfhXXTVv3zKI2OAd3fgUJFuxycYk8HxghZJ4vx4oy+GGSp0gDNp+OX/gWnH8qg30ew2+r1NtqpnaJJE0rz6OR1vAqHnwXHvHrCPlP/YAtaluiObIlR+Wcd8t0MhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LsgsQepp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so1406573f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758869567; x=1759474367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cb6AqBb6fW9MZc+lYACgw4a/Y2tXZeUAquTmyt8CTwg=;
        b=LsgsQeppe6iMq+adrryOy6Y5tnR7q6sn29nCFdqWuxgHRZOZRcgElO0Y7GOSd4tkA0
         z/nwHEszwiGWQjgp9f8JM+FCm/fVP5x/F9zbILGrOrvO7UrtKKZRWgfR9xT+fcgRqHck
         j7RNgY/JiLes6groTdCPdq0TQ4Qfbkd1jJc1SqGP8YpMyBnctoSQ1cNFsXTz/HOlpE2u
         pVWByqCz2YaygqbNvB/at/JXkPo0wg/y4joRuKh3NF9tvlS9qI0T1T5iytSDlm+2nGvy
         f/ZicCB3UxOlIsNaATPfYmzy+QM5poWzT1PAdU966CPvATrw2Ze8f30CGQzt15/VVhYB
         Bs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869567; x=1759474367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cb6AqBb6fW9MZc+lYACgw4a/Y2tXZeUAquTmyt8CTwg=;
        b=LDL68b2wiDCorGKETUVrgBEnnsHHFmc/cnfFLc4ZgfkzZZy7CMBt0llDaBk7wBhwZ5
         1ORf8r3KOe628JTq0E8YWTB+KUtHOkp+LGqZpNRA4b9QtyPWn0iHnDHMj4fPUIyclyjc
         3R/iW8J3H947vcHnrhXN+r8zBtrMB2MkRa6BUMYOu+sIeEWH4f7JSWQcyjqTqlxajJ+R
         whvLVVPDy4eEfUGTf/xobtPNOMoQqSoGILjYIe3myFYbS1PyuZ/SQUP8GXUZXwWZiIeP
         nCn9A84bD+I9HwclktcxC08mNZ1pwVd36EEHEDAXZ3T/1/HscGChtAIm+oIoEPykh5i/
         wfnw==
X-Forwarded-Encrypted: i=1; AJvYcCVy77/tk/1OdUYXSnFZlV6T5Z8YWtSNWkNnrkWskm0iIwE5y927AkLyGw/oxndIL0c9h1TnFX7kP1erB6By@vger.kernel.org
X-Gm-Message-State: AOJu0YzH7VpCSHdog3OxeLlE6kMCkaZcFv8hV6Nt6OAn2OtalOcUxz9v
	YVf7PI/Qg6HJXY8HWM56mCtxjmHARCzMGwAzydwMU3LyvZGI+MQ5qPrUjKmYKnYg9JQ=
X-Gm-Gg: ASbGnctrHGurCweiRiAyTw2WLeWGihYK5OM+plkjGqRLRrN44k1wjix3pvbX05z9FyB
	lPU7jy5F1Fsz4BBqKYCxtw+PcTRIclaotTYT88S1tJls9OUsTVXYU1UJMnBQdmcUbgFxC43zhFl
	mVp5KUO8CsVBSBxQIrgPiyd6XSaAQgxoRC6UYoqNYBNkHOwULdFLEAbds+vDHPj6Q3CokviymMv
	OuDXcyUzNoHYP27aeEpFCJ9ev+/eo1gvqSmHjdFg/J/CvjcNhgIfLYc7Cl/2oDiVsw/SdgIadld
	iOXDb9++T9vGkyrvdClaPwmphD02Mpxr4l12cvwxdh6bmvcLOnM8O+r5rW+GK9TUgJ6UCKUmaLY
	2AlKQQUUxl3XuJnzQW9rUmw==
X-Google-Smtp-Source: AGHT+IEYY8XchQpusLo9mXkJksDRrdwYhd7zVEns9EdpAQet0iFAo1DMOL7A0ElRmCcRVOjtwSPk5Q==
X-Received: by 2002:a05:6000:2385:b0:3e3:dc04:7e1e with SMTP id ffacd0b85a97d-40e458a9486mr5070069f8f.7.1758869567035;
        Thu, 25 Sep 2025 23:52:47 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc7d3780asm5678950f8f.52.2025.09.25.23.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:52:46 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:52:44 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur-crd: Enable eDP display
 support
Message-ID: <5awvbmtwa5tzyyvwhz4yigyt6uccozvr7i4iqlnrkd63dgbge2@usksmh5sbhl4>
References: <20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org>
 <20250925-dts-qcom-glymur-crd-add-edp-v1-2-20233de3c1e2@linaro.org>
 <p7btiavlbu3wqcq62j25vyv5reusdqenz7wtqr3zspywittdfl@iivegwoqfjk7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p7btiavlbu3wqcq62j25vyv5reusdqenz7wtqr3zspywittdfl@iivegwoqfjk7>

On 25-09-25 19:46:45, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 06:02:49PM +0300, Abel Vesa wrote:
> > Enable the MDSS (Mobile Display SubSystem) along with the 3rd
> > DisplayPort controller and its PHY in order to bring support
> > for the panel on Glymur CRD platform. Also describe the voltage
> > regulator needed by the eDP panel.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-crd.dts | 76 +++++++++++++++++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> > 
> > @@ -536,6 +552,52 @@ vreg_l4h_e0_1p2: ldo4 {
> >  	};
> >  };
> >  
> > +&mdss {
> > +	status = "okay";
> > +};
> > +
> > +&mdss_dp3 {
> > +	/delete-property/ #sound-dai-cells;
> > +
> > +	status = "okay";
> > +
> > +	aux-bus {
> > +		panel {
> > +			compatible = "samsung,atna60cl01", "samsung,atna33xc20";
> > +			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> > +			power-supply = <&vreg_edp_3p3>;
> > +
> > +			pinctrl-0 = <&edp_bl_en>;
> > +			pinctrl-names = "default";
> > +
> > +			port {
> > +				edp_panel_in: endpoint {
> > +					remote-endpoint = <&mdss_dp3_out>;
> > +				};
> > +			};
> > +		};
> > +	};
> > +
> > +	ports {
> > +		port@1 {
> > +			reg = <1>;
> > +			mdss_dp3_out: endpoint {
> 
> Define the endpoint in the SoC DTSI and just reference it here.

Will do.

Thanks for reviewing.

Abel

