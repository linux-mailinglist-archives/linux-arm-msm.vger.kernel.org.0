Return-Path: <linux-arm-msm+bounces-8394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89D83D5C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F0A7B20AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DE18175B9;
	Fri, 26 Jan 2024 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H+JeTIhF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4D12E76
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706257129; cv=none; b=uSQ0CtHX6tsQWhmPfG3+p38RMHJEkDaJ9W6Q1Pvo/gEaacLhIW8/4HSKR+B1GHJOLcDkQJwgsJ+ZPKY/ezR7BmVOsKTso+E6sL6yFdKQT7DfPtfU7yv/WaQ4xF1Toz4p20xCAwmVXlml00YC4vUEu/PJXGEN/rCqHWKZYT9eni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706257129; c=relaxed/simple;
	bh=1v1p0jrAJR50Kueh7YF9CPLO/I/oXE+euJsb8wrKQ+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=juqYXi6TxByJOzRZ3Fg5LhnUW6JrVz5oRtiF/FuWHg8Ksre4LL4ErTnJGEyQgfW0SHuLhrRaZwWX6JgE/xYPY6Qm+cSGwDIIPx2kf5xefYRBXjf0LcByZYyF5861ucFD9x4QL24oCaRXRly3u+3bi3gCEU9cwUQwGbxgka4Z1vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H+JeTIhF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3122b70439so16338466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 00:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706257124; x=1706861924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3eKbQ9dPSaynT5h1DWbytWa8cizVUJhYOPdgPpMBlYw=;
        b=H+JeTIhFKdgDE97RUL23Y7vt9Hab569XLsLp7NT00I2ZZ74HeOAnxqIgK9P//DwNIG
         iengf9mXTH1kjZpDsMV97EfQMnViFr+2XiOieFlOKYEm37MRjy3bgOuJf6d+4LmHx+Hw
         QSR3yZCf3Xzj4LbZmJCYc54l63C/qrRMqqppr+nfT5a+mXSYQR/klx/C6og0iacysYVw
         q5QYVXfazGNnbgmsK7E8w5pezGWsHdGaJbv6NoMapvfzJNKuR4zWTo+jvraxBOiC9uGr
         1ONZj/FMDRb/dREzmF0rpo0ywp/nYHT7XfSsbyiVvGPaFfO1vwCnWO6aPOIZL4eQFXPn
         de+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706257124; x=1706861924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eKbQ9dPSaynT5h1DWbytWa8cizVUJhYOPdgPpMBlYw=;
        b=S4ILPesq1/3FaMszxS6YK4NFAVgboNhEA4fNFrNwaoz7l4W/JW3JPZGkBSyKrEnzwe
         pz0bdBc2UYJ2+46He0Ve40DJqnzlNHMJf4hSi2euQ75tBlVth5XyudwkFI9Jt8gCrWtT
         0/Wy6RErQhRaDLeH8Wvme/fqMOTyxEPsMlApH0fcIRTmYlvTksjeHzKYibawkmtGRVLk
         JZDgTB7NK/47GSYJLKdCd9HUv2JupM0BfdIAkW3Cb3gvYg/dEPz3R+TZcHWJjwrUSOcP
         pU8bpKmltB6e1AxvmCzwMsM35XZk37BwsQPWxniZGHZCfcXeYGmz8i/p5KwWsLRfw9Jo
         81Ig==
X-Gm-Message-State: AOJu0YxguxF1eKxB8lWdUfULG20/397WKjLIAlcYrwrUgoKMGtlIQVNB
	54JlNtQjDSyV/XyZJ3nzPvPGyJkGb9CR2NOOEybOIvs/3mztD/b0wxR/yw++360=
X-Google-Smtp-Source: AGHT+IGAHjYbYuhhbEn3hJ2jgzKambyOC27Tkan/Yq9Qzl1vlpSHYnZRuSY3GbgR8HYC+EhmgrcwyQ==
X-Received: by 2002:a17:907:1751:b0:a30:ec79:25f3 with SMTP id lf17-20020a170907175100b00a30ec7925f3mr893519ejc.42.1706257123688;
        Fri, 26 Jan 2024 00:18:43 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ck5-20020a170906c44500b00a31930ffa7esm358242ejb.153.2024.01.26.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:18:43 -0800 (PST)
Date: Fri, 26 Jan 2024 10:18:41 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/11] arm64: dts: qcom: x1e80100: Add TCSR node
Message-ID: <ZbNq4b813348ZiV8@linaro.org>
References: <20240123-x1e80100-dts-missing-nodes-v4-0-072dc2f5c153@linaro.org>
 <20240123-x1e80100-dts-missing-nodes-v4-5-072dc2f5c153@linaro.org>
 <b0f4236a-c87e-4d50-b1a0-42ed5b015b86@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b0f4236a-c87e-4d50-b1a0-42ed5b015b86@linaro.org>

On 24-01-23 19:09:37, Konrad Dybcio wrote:
> 
> 
> On 1/23/24 12:01, Abel Vesa wrote:
> > Add the TCSR clock controller and halt register space node.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> The former - yes, the latter - ?

Hm, so halt register space is at 0x1f60000. That would be in the mutex
region. But the mutex region is 0x20000 short, even on SM8650 and
SM8550. Need to see why is that, historically.

Either way, the tcsr node region still contains the regs needed by the
SCM driver to enable download mode. So I will rephrase this accordingly.

> 
> Konrad
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index be69e71b7f53..2b6c55a486b2 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -2606,6 +2606,14 @@ tcsr_mutex: hwlock@1f40000 {
> >   			#hwlock-cells = <1>;
> >   		};
> > +		tcsr: clock-controller@1fc0000 {
> > +			compatible = "qcom,x1e80100-tcsr", "syscon";
> > +			reg = <0 0x01fc0000 0 0x30000>;
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> >   		gem_noc: interconnect@26400000 {
> >   			compatible = "qcom,x1e80100-gem-noc";
> >   			reg = <0 0x26400000 0 0x311200>;
> > 

