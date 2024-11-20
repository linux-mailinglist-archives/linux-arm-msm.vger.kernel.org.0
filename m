Return-Path: <linux-arm-msm+bounces-38447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C91519D389F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:45:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE7D5B27079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560B719D8A0;
	Wed, 20 Nov 2024 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yf5ob8iv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0BA1991AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 10:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732099501; cv=none; b=IQZ1Do+nZSAWNXAQ8xclAYZC2eqafUrcJB0l+ua+z76oqpECAIoertAgeb4Shree+boy8n2bV7XJARooI5DPB5W2WXyJS/48owK9HSrevvOcFiVw1Pb3KBFqvPe7QHEhFq2tm4I/OsjlAVLPCECIbXduO4iY8n/szU5TqNSM71w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732099501; c=relaxed/simple;
	bh=t8rtOOyR1Sic/wfPMOnwbUSHPAhTaCWsScrHIcpxbPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khuhDuzhBxabYx1lDjaZPiterZZRuFXRUsl7gEYffdzmqNqDTMB4mnnvgXa/6LGIMeJWDCMG5CBkW3yYnQAAt+D0Ood4IjLMzEFoHoce2/w04hJmzcXP+UbX5jp3CHUSIFvbxvkGgNikOkVIA2dU0XUFqHEZv3lKih/CFxnh74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yf5ob8iv; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fb49c64aso6438931e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 02:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732099497; x=1732704297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi4AS2bqiAYTBYeemIAg6pMq2Y+iu6UwlnPqINFrgpM=;
        b=yf5ob8iva+5KQakqk/fttVKDvVkKSrF3Un2TW2zyY7X4QzP4Uj40/v/H2Gs7JTVZzL
         cHcXzZjDJGOz/WAC4iOq70o/Eekas5AJ9XM15xIL1iP5I44NyJe6o2V34XaNiS97lo5Q
         SwXa03q8x/OdWpXI5cIasqtgi5/9+F7dLedRA3peNJl/PX1N3IA9YdQVNOPwIOnhxGha
         EnIit227vuOc23ZkwipJjK2Lse3waNhg3QhmkwIjPyu5bD/H4WyLzgrAH/MGbqorxomh
         7kUX0rjc3FJLZlqqH4roY1pL7GBGki+++nd7P/+ZwpYnzHMPh33vCWsd/jCWI3JuUDlc
         WO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099497; x=1732704297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi4AS2bqiAYTBYeemIAg6pMq2Y+iu6UwlnPqINFrgpM=;
        b=hgwgeUhdQMiI/vEpJr15jYZEngIvLE3T5Cbi/6Au12la4T8TzytFTsJvSJmy2aT3p1
         Sv9t9zsjRT0nB3BCtGJXo86OSqLApEEeI5Rj32UXvQuE7nHnUFwAdH3Gj1tPYhaAL6WE
         tPU5NJKoCteYcLT37OqNQPtVRj4lezxddtdYVjFDOvneLRWny626QBY6ODaWf2slmg0L
         IRj01klRhMyuOiiACdg2jIelzd8iDym8nfFoDSF6FgcW7urrn8aBgFcbt6W1boYKD9HI
         cHbLnCZHeL53jBSDCGAOjw56BCelgS1ET3CH8EvKymDd7UdJY6aWx52plWTBGJM1sVGE
         3SXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkDSQbbnVixsV5u5kVaYHXYWFJclgHcCa646Jxfa1ORizKvbfTj7FpD1CEPFbIQobr9kidcCRkCKQy+K05@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJ4va4aXcjLm21Y5pJb4v0Uwzn6VQmByDGMgx44m4T4EM56Xe
	UU+4U/TENhHt2+PXz2+qjzI1HypCE5YmmpCUj3J7ZfJ0A451UiG8IycdeWyJzmE=
X-Google-Smtp-Source: AGHT+IEoIfnJUDG/LMRTAC0O1sjcvijpB24W9ioyTCFzP31CzNbBxr8VZVPDrctyH9REII3PGnOH+A==
X-Received: by 2002:a05:6512:3d21:b0:533:483f:9562 with SMTP id 2adb3069b0e04-53dc1363763mr1368979e87.42.1732099496907;
        Wed, 20 Nov 2024 02:44:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dc4906408sm40174e87.201.2024.11.20.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 02:44:55 -0800 (PST)
Date: Wed, 20 Nov 2024 12:44:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, quic_zijuhu@quicinc.com, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_mohamull@quicinc.com
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sa8775p-ride: update BT nodes
Message-ID: <syvnrytilr4fm3zxh5i5trddqkdxgciqfh75srg4uug2qbbkyv@3ndtkit6ldhl>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
 <20241120095428.1122935-4-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120095428.1122935-4-quic_chejiang@quicinc.com>

On Wed, Nov 20, 2024 at 05:54:27PM +0800, Cheng Jiang wrote:
> Add product-variant property to specify the IoT product line.
> Update the chip soc type, SA8775P-ride platform uses the QCA6698
> chip, which is compatible with the WCN6855. It's necessary to use this
> new SoC type to distinguish it from projects using WCN chips.

Why?

> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 3fc62e123689..da52f425c676 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -856,7 +856,8 @@ &uart17 {
>  	status = "okay";
>  
>  	bluetooth {
> -		compatible = "qcom,wcn6855-bt";
> +		compatible = "qcom,qca6698-bt";
> +		qcom,product-variant = <0x20000>;
>  
>  		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>  		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

