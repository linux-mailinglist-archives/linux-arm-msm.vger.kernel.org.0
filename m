Return-Path: <linux-arm-msm+bounces-76832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC281BCF49E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A0E119A0AEE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 11:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE712638B2;
	Sat, 11 Oct 2025 11:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HJ1psErk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10345263F4E
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760183006; cv=none; b=GyMPLl+n6jcLOCQKm/V1jOuhzjs94+l52/dq6WFhuDRDY+Gc7DZ+j5RwWccnXDEl5cFNMOoZ7UeoI63E9gIaWIulN5mcWTsczDPehpGXzDl26rNlJVrJsaszqNZpTkwpxM6eYTSpJ1Ljbws83bWMF3vtzElOMINbVNIUdJHOR50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760183006; c=relaxed/simple;
	bh=VNyemAc7vyXNsAZSmjzs75LPZtRSVe13x1Us9A7Fhtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5c+K7D9L9DNCb9MDsITDKkmpBx9DGCu/fv0MLl4c2140cEahQAtfAPpQqkAh/N229J8T/tNxcyUOBvm9YQOiQ0BMfi7ReIVoL+Fw21I4Azl8wXagm9GJ8IASy9rrms+5W2vFkBL9XlOVvikpz8XcV7aUzDi05H9zsunh/wuWXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HJ1psErk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e4f2696bdso30446895e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 04:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760182998; x=1760787798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hY5uvSgS29Hcw6WzxbdNBonbA1Uf41cjYtAAQjFbEX8=;
        b=HJ1psErkwauja7VgHlCCoAoabklIaYojylsuzqa9yMqJ0YakJkSP+HiUUOszBLnQZL
         mOa1hTv+YHHLVu2MFqoSIdfp8KQqQ6Cb0DNWKvWdbqyxCRm3a0o6+FDijVZYjyZW/lEg
         jRyEArW4094vwid7TwRMiP0cb/qpls3PVRNxFcMP6eEu32/9N4/fsGGL3f88nBmjpHWq
         5JyJsqnz6nYCHbvgMdQLAcaPWn0buHUVp6YhohulXngGEpky7v5d+1vStpDu9iqVhPB0
         Z1lU+hBrRuuqZFma8umwWxpmtkBOxSZpavtai1jvuFPzJxe4bte3YsBS52jfb5j4IjUk
         DKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760182998; x=1760787798;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hY5uvSgS29Hcw6WzxbdNBonbA1Uf41cjYtAAQjFbEX8=;
        b=qcXNTPXDvAsZmQH4czbbNQifBq7ixICUAoXn859tFz3Lr8GCp6/jJ9jHN35IloTkrY
         +HFfKpYUUuzCGKtayZtwgHgUnblI4P9CrMEUGhW6lFBN1PUkd1AjNrnQccNNSi+Wp0jC
         bMWsQAcnKZZZW7aNxvIwyXVK0gH7OrNqHVrl7Hh1aS0sxYNimCeC+HASc/tzxFWbrrY0
         USVUxkGpFGkl7fUiouzzzDaY7dXpZWHEmHuNNJfYs+YIhVipBH/OmXuqRoW7GdV31MXQ
         brI7oc2RQ8WhL10rrKn8Bpey8gXapxsfW8aaJFRndnkWD/Em3hMopAetXKUlpYJVeNy2
         w50A==
X-Forwarded-Encrypted: i=1; AJvYcCVFrew2QZ+hVoGsZ0sKm+LeIsGreeI8+kp+apBo2U/Joh1g8Sc5PD0nActy9L9o92hH9GjRvh++x9XjNcf5@vger.kernel.org
X-Gm-Message-State: AOJu0YzjLD5K/CBxQJmcL4mz0ns4NdjVz7tthSlv5qu0eBHodr+c9KAr
	+VBWv4WIOkVVFcc5FPqrBEnN8wtLxs/76S+CvnUsDQYRaBTjXSgZAkcggDBEQWOyJ7w=
X-Gm-Gg: ASbGncvKq6o7pNazLglCLN2ccCP0uMcRmUdKQWju7D71rkdh/AMDTEYtkBqJCIJdnBl
	sXPPOZnK2kKOw1Xf4LfPvI6JrTz6sDOnYOkRTQsQ1fT54jqpg4WJ+WiMzf9LdBFdJzJsR+IHUkc
	HVCEI6j3ibUlJmF01ilMLl2e5Gi9++cRgntPP7kSYJfdtRS6HEm7TgHZdq7LdCp5oIY0lCOXaep
	1y6hgCU13iBnJNRRUyDXcSz84y6nxrkdumi16Lgwh53/d7swFYobQP0Q/Ws6eLSqplMEbAE0huR
	VFDy9dd7irb/ZPI330mitmZVeGOw4KCJHYhf6R2TEyVM2Id+AzZHcfoeIZTd92ojdAimK6akL+v
	R4r6Sf84DRcBlqOleHzxMMo7i9e1b4o3bm2Mj5AMLOaj6vP0ZJqtY
X-Google-Smtp-Source: AGHT+IFRCrBmD7s1cgzkGkuICLV7U1JPlNpBXYM/m0v9awapqHAnkU1llQHTFmawWVqgaD2lMT2oZQ==
X-Received: by 2002:a05:600c:34c5:b0:46e:3d5a:d15d with SMTP id 5b1f17b1804b1-46fa9b064bcmr89831475e9.26.1760182997632;
        Sat, 11 Oct 2025 04:43:17 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb48a5bf9sm90105195e9.18.2025.10.11.04.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 04:43:15 -0700 (PDT)
Date: Sat, 11 Oct 2025 14:43:14 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Message-ID: <ilr7iaasabiwynzdu4ca6bhcyu5ubznc4yw4chfa3hkqsxjauw@2y6smgstv624>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
 <da2vvejbqdteaszzwyktczqivjblyawzh2k2giyoxdxlxcdrcb@fkuqivjmaggf>
 <aOiw75D0RhDNLZLQ@hu-qianyu-lv.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOiw75D0RhDNLZLQ@hu-qianyu-lv.qualcomm.com>

On 25-10-10 00:08:31, Qiang Yu wrote:
> On Wed, Oct 08, 2025 at 04:36:59PM +0300, Abel Vesa wrote:
> > On 25-09-25 12:02:27, Pankaj Patil wrote:
> > > From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > 
> > > Describe PCIe5 controller and PHY. Also add required system resources like
> > > regulators, clocks, interrupts and registers configuration for PCIe5.
> > > 
> > > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 207 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
> > > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > @@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
> > >  				 <0>,
> > >  				 <0>,
> > >  				 <0>,
> > > -				 <0>;
> > > +				 <&pcie5_phy>;
> > >  			#clock-cells = <1>;
> > >  			#reset-cells = <1>;
> > >  			#power-domain-cells = <1>;
> > > @@ -2511,6 +2511,212 @@ pcie_west_slv_noc: interconnect@1920000 {
> > >  			#interconnect-cells = <2>;
> > >  		};
> > >  
> > > +		pcie5: pci@1b40000 {
> > > +			device_type = "pci";
> > > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > 
> > The first compatible is definitely "qcom,pcie-glymur".
> 
> According to Documentation/devicetree/bindings/arm/qcom-soc.yaml
> the preferred order is qcom,socname-ipblock.

Fair enough.

Now I wonder what happened when we added the one for x1e80100.

