Return-Path: <linux-arm-msm+bounces-37667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A283C9C5E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A3171F210EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C6B20D515;
	Tue, 12 Nov 2024 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ff0h8z1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39F920DD76
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731431134; cv=none; b=K2drE8ocKhm/UP8x4kDQ8Gk/ez3EQV+jpNNUlsIwMlHqWZ10Cm20QnqF9otXeW+Ew1uyfRdU9W0u1ZpWXo6xNcPndouvM17/M+YdwCfKvbnx+s50T1csIn71OD7OSpo8TBfxsEVE5DatidXixRIQkFxjCk+LJnCwxnUDMhQpmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731431134; c=relaxed/simple;
	bh=zbJlwKwjpmGDmOG6xUAsiPq7n6gvG1qs07CGKyuQyUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2Y15Weo9rZUFRssoSJi1C0G5CqPuznq9VOwCp0TSqcj0Pg73ZyqtkBoWVCHOvYAGsEV5jLXBKtoDtmOKTofnICzD6L7BlKWXvRHpDCcCC5c+HOnb/JywSa9X2YybolKkI+affqGAsNYUtChqABSPS9DB1cWGJdJ1jSslVTiu4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ff0h8z1s; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so56283835e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 09:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731431131; x=1732035931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA76HvsVqGyFKQBWOeklNEgPCKp4WQaY8k4DOslFroY=;
        b=Ff0h8z1spVOyCkvLhQohl8vuurx+TfC8PtHqFgAEspUkM9S7RNFCWU0Pz/n0POXBzh
         e5oroWTkbExh4Hc32MF4ugiINkCa4gqAqxpviGa2PtRB0dEIN7J3pIQyPUsJVnn0iAEF
         ZFTT3zWxh5CFGTbDBMwP9Z0Nu7XQZaDYnt43LgJhRI3jlRFVhtSwzAz/ggJLadeqqpnC
         XOGLWAGo8woB6VT4MsCso29I8e0QykI+ihT/Uq/L/hjrRoSdGFPjj1gz90FRPFOVZgbH
         ilQ6XKkuS2coz4rl6fQE5M6xX9OxXx8N2poNx/VGUrYrTfPqXDVEGzR3IF+4VgM7vQqw
         Ax9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431131; x=1732035931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZA76HvsVqGyFKQBWOeklNEgPCKp4WQaY8k4DOslFroY=;
        b=cK+1ACMdtotCer5dGt3//6pRXDu0qKi139kX1wdtUTVzk8qDk41pzCvSGMNmtj+BV+
         QF3v/2QMj9z1XNNJSBIAIH1FE2PwMaJKcG++QKf2aa1s1PlKKGF2vzxMCYWDllWFupC8
         AcL5lmdl+wIE+b8gSAVBkukQKn1/Y6YAhUpUBGVPlpPoKVekH9F0O/sJUktqlJmTiX3v
         cZZr1HXEKDWM2hrEQd2SxGut9nDybfrJ25M6ly5y6adaqoT2vzJNyKstR25Y9WBMB6B2
         rukBuoruAVRfuHMb5ysJpuxKHJyNOK/GCIJWSWq1OP5x10dFFQaRA0XAneGCz4xxvLRo
         tBqw==
X-Forwarded-Encrypted: i=1; AJvYcCWyikoaLLeykw/qZ+uUP1hoM0MeoVuIFJ0wu2/6cga2pLiovXmZe85v6RiXMr5D0up56mxhSZTZsvNuua2y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx+nlx1pvY58yY8qSyGCa+F1xO0x9Qpcozqi2hsxcj2gkGT2g0
	iWRbQ86e7J9kp01uCHSwoZrkQ2zNqcLw0GGEH71sAT8Xd8aaqaOy5Egfdhlw16kLCkHYP4W0EN/
	/
X-Google-Smtp-Source: AGHT+IF27nbwJEoFDjdSQfRglRNAF1hMrTs5hW3PeUftsDTpAady6wFHBQXm8zI24xcocfJrzZxOkQ==
X-Received: by 2002:a05:600c:3ca8:b0:42c:c003:edd1 with SMTP id 5b1f17b1804b1-432b7501d59mr149247325e9.10.1731431131236;
        Tue, 12 Nov 2024 09:05:31 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea4c5sm16147042f8f.76.2024.11.12.09.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:05:30 -0800 (PST)
Date: Tue, 12 Nov 2024 19:05:29 +0200
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
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: x1e80100-crd: Enable external
 DisplayPort support
Message-ID: <ZzOK2Xz1QQvugGnG@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-4-4ad83af4d162@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-x1e80100-ps8830-v5-4-4ad83af4d162@linaro.org>

On 24-11-12 19:01:13, Abel Vesa wrote:
> The X Elite CRD provides external DisplayPort on all 3 USB Type-C ports.
> Each one of this ports is connected to a dedicated DisplayPort
> controller.
> 
> Due to support missing in the USB/DisplayPort combo PHY driver,
> the external DisplayPort is limited to 2 lanes.
> 
> So enable all 3 remaining DisplayPort controllers and limit their data
> lanes number to 2.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Please do not merge this specific patch.

It is provided just for context and testing purposes.

See the cover note for more details.

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 659520404adec33c3551f8d0a5ae3db9e0a18d44..6dc2ebbf6d27fbbf0f224e58cd39ffd33792c6a1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -1125,6 +1125,30 @@ &mdss {
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
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
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

