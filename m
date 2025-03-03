Return-Path: <linux-arm-msm+bounces-50086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44470A4CF81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 00:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0978416C6F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 23:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002471F4264;
	Mon,  3 Mar 2025 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kkd25SYE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E191F3FCB
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046019; cv=none; b=iUBpaQdhz8kQY6wiu4R6EfYRBLN0VFJRgPFbcvKe0z/gN5wW2p1hhBB6pdMXoHKxSaiVXjqv+o/fmM/RPV362Xv6X0Z3OphU8HgPO+jH6stMMZihrpmCQqBGNNfkk9lF66zArzTIShmfSq5ys/clFSRdu+vgJcqiU3k5aK3KPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046019; c=relaxed/simple;
	bh=HWajZl9m4a1UKexoSEJtNSGCRxlp6IrjhL0YFHDl+eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWGzKA8ND3xhNDhxICpVqSzlIWTIRrUvDoyXCO0bdSS+xJ/VDKpBbdfv1D3c74U8JuqcwCSLq50seByp1Rmwcsa5Ff8WfqhQKbInEhvVOoWd1CCT869WALWkdAHLmlvHoocr5oh0Z+UxKNCqdjhEe8yjhyfvCQqH7COGxNubO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kkd25SYE; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5494cb8c2e7so4026003e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 15:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741046016; x=1741650816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sf6fUtrPbo4KPSrN8bROtgOQM/aO3Tc+YsXBGb4Iutg=;
        b=kkd25SYErv3qMv+2OFcVaQ7dXYQiGNr4VnJ+7cdft7+oCuJwyhwZ3b1iQDwiV7C0oN
         KHn/CddIJEiYU1tDKEDHKMH6V9RTEzyg6isWpp4F65fBytrFEF0EnMr/49X4g7cVjSbJ
         iIy1JMHwwEt9Qg2phLoMyXQZ4DXkFn/G5ZYDqbVHfYOG4gJfwSSDiAdb9yqC7jBlUTqU
         gFzp3NrIfJjL72hwu4o0R6uyio4tvVUeXlAMKKAPF+bthz4MNeV0UiSpPcWbAwhf4KYX
         bJUUVSfd8xA9QddJ+tzcH5BZ8MUznk2YMuhhh/RCLgTeHieWkX+lnT3OA8d/66N+oNxu
         JG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046016; x=1741650816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf6fUtrPbo4KPSrN8bROtgOQM/aO3Tc+YsXBGb4Iutg=;
        b=Q/568sljLoBiibQYPChuhIJjt6HCTo6G+HbdgT/jazUdmIZ4xF1qquGhhQTKXnJGed
         sgyDNAjvnGkvbJW/lwZdI3UNNEr1Ow7Ci3nctwhxaaiKwjcHN/o9PD6wwODMbGeWoWDO
         Ygs6k5zzFa0Nu2pxx/v/crkIITbStwHOShaHzvb9W9ml2DmtodIlguIKG4oqUhWPYvoS
         R4+tYjUIPnCcSNgzbuMbIzQq3Zses04XYoxg3Cn37fPYMZ5jMKtVhTUJNTSWME+5BVqF
         LtveBeEOi5HUUIiUFesTUtIqyzxTpk0Hk1DlbeLuyzs8x/mQ70GF8YwxdneYJhpwubNX
         reoA==
X-Forwarded-Encrypted: i=1; AJvYcCVCoa1ZlS8kBK+lkPE4dDQsq+UUnLcRCol4+L7rVI5orLjUur/ScLIH2otlZcyRS324/PMo8/EFvjbZ5TVU@vger.kernel.org
X-Gm-Message-State: AOJu0YyYKBpq1ldIHHOvt+CTe6yEavuwZW9sT/IOqfRWaKVfHHnHWG+g
	MJkbOfQGcQq/FxtWP7UtfvH8RXvne5hM3Tk3RvIdZ3a0AGGK3UVs1vReFfhrWLM=
X-Gm-Gg: ASbGncucHFP37islP4mXglILFfhda6S5narz4AsSJkp8aYo4CesZLRFBnHlvidrcUCd
	KxU429LfN0CwkYGPLhgEWKl6zH0PNiOuXGVAC0w4BnYToeNMmdpOZrUCMKchtEbHBLlDBfJ0u2A
	Pm+RrEBhXeloh+xHeJNphk3uNQk0FAxF30wCUqS8hzo9lRGnke7Zl4NyK9b2PC4vkUHBwZ+xy3U
	0Nz/fCANXuQsTcpNtq6/rXd8wdKhvHS3EgzKeLvhiWsWeYcSO/3TxSE+L40kBLBKXmBDOvUlK6I
	pZb7Im0xyomOaZtWIWBJPPDNYeKE7xNaCrxjGbEHuStQho/cfJyE2fbPyqg/UQ2Zk5J5Z+3HGuc
	7AMk9Z8KAb9RdRdgPukeODc3B
X-Google-Smtp-Source: AGHT+IHYbdfvfcKjb82FdaHImaxikNWTWiiwXZ2Lv/t9ESp4aFqk5YhtlXfIUFM2FhGGeY2XZUhNhg==
X-Received: by 2002:a05:6512:1106:b0:549:66c9:d0ce with SMTP id 2adb3069b0e04-54966c9d3d8mr2837350e87.28.1741046016202;
        Mon, 03 Mar 2025 15:53:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495305bcb5sm1088540e87.45.2025.03.03.15.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 15:53:34 -0800 (PST)
Date: Tue, 4 Mar 2025 01:53:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Message-ID: <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>

On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
> domains.

Are those really required to access the registers of the cammcc? Or is
one of those (MXC?) required to setup PLLs? Also, is this applicable
only to sm8550 or to other similar clock controllers?

> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index d02d80d731b9..d22b1753d521 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3329,7 +3329,8 @@ camcc: clock-controller@ade0000 {
>  				 <&bi_tcxo_div2>,
>  				 <&bi_tcxo_ao_div2>,
>  				 <&sleep_clk>;
> -			power-domains = <&rpmhpd SM8550_MMCX>;
> +			power-domains = <&rpmhpd SM8550_MXC>,
> +					<&rpmhpd SM8550_MMCX>;
>  			required-opps = <&rpmhpd_opp_low_svs>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

