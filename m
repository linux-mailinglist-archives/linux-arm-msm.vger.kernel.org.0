Return-Path: <linux-arm-msm+bounces-37666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2479C5E63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60F8B1F219C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BB920D51D;
	Tue, 12 Nov 2024 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wS+DmfxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3020C461
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431120; cv=none; b=deTDbY/nIJON0Gq7Fq4m+dPL0XFkTqfIuOg6a4g4PzrwdV4BIcFq0oU9z3BOKyzzWPy94sSLqokCIE3HKqk9Z1uT3K7Iyr0MgKeaWh/0wS5WDDZxDW0+20qdAmdzmerWHsxQ950Qfip5IJ2N9eKU4I1qQEiG2a5DHFm2IHa7iS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431120; c=relaxed/simple;
	bh=+QhHbvTsdoN+h39DtOSWHLGO5rsf6lseXPlK1bc8n5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEgpNK43GktTI11xwSE5KiiK4QRiEtGV+VDOqRL8f9Oi3OioA7OOVTN6y29rznTBn26PRQh4rk7nzvbBS1X/KmZI7oCPYWXinlRKxoQMwBq3w18+2MM7qp/WF/83hgIL1mILGa+t/OypVKNXlHmMx2cZXy+k5nwGc/vpu9OUM5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wS+DmfxZ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53a097aa3daso5745550e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 09:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731431117; x=1732035917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NVKRrFlkkb4wg4R0ZPc49NQ3y+4Jopn/wW8d5M2TTXY=;
        b=wS+DmfxZ3fjJTpiVxW2WgjHafA/BZ5bz0yMGe38l66xd3HT4Qko7oyNXE0AgA9wt8a
         RXn1nlBTf5UNi3Re0gbi7vDxN83qgVVygDDj5TUvO5Vq7VbOlZWyzUhYhmLCQAtVM3uF
         WLc91sJz0BGSRgUmKuljUc6uN9AFo607a6eNHDdkFQSL79zsAoiYm4MoRtCOn2qV2a1u
         pZKxLhfLtBp0mA4U9tq3VCyIfYmlv88Ssya4pBtDzcBaF0y4mNMYZbGBs2usmHrq/F3Y
         2doHzT9ChGioEKrX05Cg8jiTOzadR8ipwT2kDa1PhjGk3TGO1SX9mgB4s/W6HiyeX8Iv
         aM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431117; x=1732035917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVKRrFlkkb4wg4R0ZPc49NQ3y+4Jopn/wW8d5M2TTXY=;
        b=MxhFFbk+JZB5CJChxEzL+MKew9ERxR8bJ7OE9P/TaFccxx2K2B0dDNx1+D/ufRWrRM
         9RdjqUPssJWf4sIIgmUFMO9B0/5CKUaIiJyJJLHaV1DTK3A3RNOSQm5Ymj0jsrcplX0q
         EHyuW5oVTQHj0BSf3/wLNBRL7c1uJt3JFGtYLBBoF2Qjdjkcw30FBJF40DrQcx+uG6mO
         FSxJbBw663FgtD3hevyYHQpeL0UnHDn1h8/MDWGyKxIyrmjED/9uasyz0si9SCjS2nKB
         yC8nhkAZiiWxAw/bSYG93uFZH6jrULeIOvrzwSMBnZcZ8qXQeBs2vCjm1x69RSkenGrv
         wLCA==
X-Forwarded-Encrypted: i=1; AJvYcCV72puNoLLH439MPpVoceDvGhYAnk4DuNV/oPweNXT0xXU35a4zpJ5OKCqG9T7Qprn+bIi5VFsXFOCuemkq@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWFLmXoJcwwk5bP2rT7fE9VkDgfQ/LZPpId6/+V8Em0/dTsqO
	BdcuQVkwGzo0EY/ovjvj2br8VpmGHEi1ud1xkeN9DmHgOD16L33rjkv9tqC4U5g=
X-Google-Smtp-Source: AGHT+IFktvxSEG21Y1Go2yfQvxLoLb0yDrWBRzLeB2+SLpucDdFBur1x+XpMAnkAtOQ4xTIMku4bxg==
X-Received: by 2002:a05:6512:ac4:b0:53c:7624:586f with SMTP id 2adb3069b0e04-53d862c4785mr8425423e87.29.1731431117025;
        Tue, 12 Nov 2024 09:05:17 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e2a31sm214523895e9.36.2024.11.12.09.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:05:16 -0800 (PST)
Date: Tue, 12 Nov 2024 19:05:14 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: x1e80100-t14s: Enable external
 DisplayPort support
Message-ID: <ZzOKylgU3teUNuAe@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-6-4ad83af4d162@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-x1e80100-ps8830-v5-6-4ad83af4d162@linaro.org>

On 24-11-12 19:01:15, Abel Vesa wrote:
> The Lenovo ThinkPad T14s Gen6 provides external DisplayPort on all
> 2 USB Type-C ports. Each one of this ports is connected to a dedicated
> DisplayPort controller.
> 
> Due to support missing in the USB/DisplayPort combo PHY driver,
> the external DisplayPort is limited to 2 lanes.
> 
> So enable the first and second DisplayPort controllers and limit their
> data lanes number to 2.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Please do not merge this specific patch.

It is provided just for context and testing purposes.

See the cover note for more details.

> ---
>  .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> index ea3ecc7c5bda24f3a0a7bb027b456462b11daf4d..b08a173f0cfe2a2fc241a4e689d35b5e7e03d7e1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> @@ -746,6 +746,22 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +};
> +
> +&mdss_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +	data-lanes = <0 1>;
> +};
> +
>  &mdss_dp3 {
>  	compatible = "qcom,x1e80100-dp";
>  	/delete-property/ #sound-dai-cells;
> 
> -- 
> 2.34.1
> 

