Return-Path: <linux-arm-msm+bounces-76841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA46BCFA7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 20:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90CF04E45B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 18:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56DA3283FD0;
	Sat, 11 Oct 2025 18:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYJ6svKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E802836B0
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760206345; cv=none; b=hIkmiG70duywx2sX9HLaai21vQn7Luml0yCn0BxDUfZp5W4DNTZc1gmdN2QRqaD/iESj9/TTxaOskEa3Ur63LWsNvcAfLEvNv/+suOLephNMuoMelItvM4ooAbFGfQ73dKsESIIy/aSfdigAcv0PqlcW63dt6Lr7+dp1UVOOvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760206345; c=relaxed/simple;
	bh=JVyCen9ID7WfgBvuuobCEwAfQIMD3ZOSiRB+hExPSss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXwX4K12OEuQV97cj/150JZqPdv8Gw56jjB4wX+/wdIaGxEkEJ/7mskF3pmt7pQi8wPfsAUZ2DHFM5aRi3JKLpHgBW9ElZ9XeInxuUpuZ3UDBOjjK9SGEpYTqBX8pjVGcMirxbEjVG1dmu0kSCDoZrVMs408l6klWRscnjum5AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYJ6svKO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso22369115e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760206342; x=1760811142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byehOKya7clPyuO5oMzDVY12ALhC721UTQrHitcR078=;
        b=pYJ6svKOgToqWXUuYXTx61dpPMlgW7jhUHGKFN056+Wl5/PaqRfFKckKmiQkgyk+HS
         b4lqtABL8odPVXTjKgkazMPDktwkScfGLz8qZk4i7JVzzNBtCWdMvMD279o7uLMNJsM/
         rNh62sc4LYwoi++GI6Cse4Yk/ib9UxNiwDl27NUAyRbVRoOLi3gs7sH8RyqQ1Yp46DT9
         guqfCvAlf9iPIfRGquzuPOx/5QewdgIj9GybE7lXuxaRhljxJZBTBIG8e1Kk0/GWvO3k
         hAgOoOgmSm1C9/QmHdWmMSRKJXj1lD35YCo3UIwnHgc5Po46xh1BiAPmw+A+HgcSic79
         nh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206342; x=1760811142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byehOKya7clPyuO5oMzDVY12ALhC721UTQrHitcR078=;
        b=uysUCl9SYDAhJTod5iQN24ZDqvrMYCQ6uDOrPlJjzUYmwxSFbOXgv/5vVq369xvnPq
         LHUDeBH1bowD8Owm2yOUUjsP4upDIsFyutc7h/oiGI5w5G4tj8gt7V+VtiCVH7aPupzN
         EiZk2z/INwwY0jyOkIOgcAv9SAH8FQzaabrRi0Zjhmx3opCLqCR+XcwKOoyokKYGRXyn
         xC8arpzeV9zWmbYBlAUDgq/MEssWNd5x4HE6kHyc2hmLrOvVQ8QHD+ldnhR/n44KQqKZ
         RU4ACChiC56scfYM/ZcIDmENHFGCquOILKMkY02qsTQXkbYK2QQMPwxqEP/H+9RmGGz0
         GhBw==
X-Forwarded-Encrypted: i=1; AJvYcCV55fKVg1cBXeglTlgQagzx4Ba9LkQxOGhFMAj/njwABfuwmNeQ6VRuag9frk4iyxW8yFSv7yDcLPw8P4jI@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZA/t/coKWcLTva7juO8Oz5r2hyBf+abrlTWrVZWdE5DmIED9
	M8y7kYsl78X4mX83HhB8aTccgqHwYeszqmzKs3BSgmJBWmaoWYlRLk2cVeNkVzrQhn8=
X-Gm-Gg: ASbGnctoxgwDs4svUGF9cHhOiLjmIP9upKq7H0tN0EG6AN+VWiXWqwMysuZ507QLjCw
	f7VuNpCvoieetc6t/sku+wRmY/q3p++BuEyY2oGQ6i2Lmuv33aRXdlcWCBp/IlAqCaWMiu2RDYp
	B6zglfNhdDJ7V3D5g9gokadLZQY/bv8Ol57lpbdKm/yzY19n8qyMFO/qRghgRHw3eaIxBM303N7
	vwozdpzbRbcPt1UQcEWDxCk603B9QbZrUikkLJIZ3vcp1PBALx3ss5S8Oorr8rfhVn2iJSpxAS1
	EyxwTriA+0sairqKCgXOfbzDRrpKZeAOirUZwZlYRPgUYX82Y+e31hRH48OhtNAToAWZTjNpfhP
	Sn9mEpvLkC6i5GL25RYwUVwe59zDuTDNcmyi77f+sEQ==
X-Google-Smtp-Source: AGHT+IFJWjfI1n1Q1BGzFtpXqGVeGA3bk9apqrt0phLLs0Zin2ROyJdGQPpLFkG37xNdDNcr+MYP9g==
X-Received: by 2002:a05:600c:b96:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-46fa9ebe245mr116042085e9.11.1760206341387;
        Sat, 11 Oct 2025 11:12:21 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3b9sm9936139f8f.11.2025.10.11.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:12:20 -0700 (PDT)
Date: Sat, 11 Oct 2025 21:12:17 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Message-ID: <7tvwxsdzkyh5ncsm4x5p26qdc2lhuecqecou6aectezdqxz2sf@4wsq3sppx6b4>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
 <da2vvejbqdteaszzwyktczqivjblyawzh2k2giyoxdxlxcdrcb@fkuqivjmaggf>
 <aOiw75D0RhDNLZLQ@hu-qianyu-lv.qualcomm.com>
 <ilr7iaasabiwynzdu4ca6bhcyu5ubznc4yw4chfa3hkqsxjauw@2y6smgstv624>
 <a75ndv2mzwy3niihi3o2ux7lrkue7h5avj2vcxgqhs3hasunfg@cosy2knsveey>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75ndv2mzwy3niihi3o2ux7lrkue7h5avj2vcxgqhs3hasunfg@cosy2knsveey>

On 25-10-11 18:57:56, Dmitry Baryshkov wrote:
> On Sat, Oct 11, 2025 at 02:43:14PM +0300, Abel Vesa wrote:
> > On 25-10-10 00:08:31, Qiang Yu wrote:
> > > On Wed, Oct 08, 2025 at 04:36:59PM +0300, Abel Vesa wrote:
> > > > On 25-09-25 12:02:27, Pankaj Patil wrote:
> > > > > From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > > > 
> > > > > Describe PCIe5 controller and PHY. Also add required system resources like
> > > > > regulators, clocks, interrupts and registers configuration for PCIe5.
> > > > > 
> > > > > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
> > > > >  1 file changed, 207 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > > > index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > > > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > > > > @@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
> > > > >  				 <0>,
> > > > >  				 <0>,
> > > > >  				 <0>,
> > > > > -				 <0>;
> > > > > +				 <&pcie5_phy>;
> > > > >  			#clock-cells = <1>;
> > > > >  			#reset-cells = <1>;
> > > > >  			#power-domain-cells = <1>;
> > > > > @@ -2511,6 +2511,212 @@ pcie_west_slv_noc: interconnect@1920000 {
> > > > >  			#interconnect-cells = <2>;
> > > > >  		};
> > > > >  
> > > > > +		pcie5: pci@1b40000 {
> > > > > +			device_type = "pci";
> > > > > +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
> > > > 
> > > > The first compatible is definitely "qcom,pcie-glymur".
> > > 
> > > According to Documentation/devicetree/bindings/arm/qcom-soc.yaml
> > > the preferred order is qcom,socname-ipblock.
> > 
> > Fair enough.
> > 
> > Now I wonder what happened when we added the one for x1e80100.
> 
> Our PCIe hosts mostly follow the legacy approach and nobody wanted to
> change it up to now.

Yeah, makes sense. Thanks.

