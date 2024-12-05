Return-Path: <linux-arm-msm+bounces-40502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF839E551D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECCE728686F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 12:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CB0217F4E;
	Thu,  5 Dec 2024 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bXITlRob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EE9217710
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400792; cv=none; b=aOU9m5tKEKBfHjKvqWVF2KjUYUy5QmCKz+KAfq3y2wqHDat7OcGn0nKDakBgujEeiyWPWH5PhNerKoLe6pFRDBYQy2lNCtY0QRh1QsEDJn34fw2UZfv/yXAhEGMmtGpN3BDY9rD8vIJ83aloW5/tM6u3tzLzJ1FqbpmAEHNl1l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400792; c=relaxed/simple;
	bh=sHboXScQQp3WVNf3+fBRjPqQ6bd3yAYGJGxj1YWQxLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dnnvwka/YjtrgQ8JZCxBihQ2uDnIs6m3lvnQwdbWsLA2tFcAdCDYN+pdimJFxJ058fxm4CNut3UIjZeNRrsyK+dL4D2DrglQe6j++nTL0cen/6nTezWmbpO4GZ0Q1x5bSGhxfNhzAfAe3lYUMuUy0Cz5NFlYV0wmFEAu71NnTI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bXITlRob; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3001d009633so7332651fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 04:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733400788; x=1734005588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwrzwX+VjMp3rjgyMNnFp0aWkMg9bE4xU/GitUl2qDI=;
        b=bXITlRobOZZnemPXHadM7zA38iH8zx9yqh4fFNPtCJuJNwr2DDB0yEaU9mkq1RH2nD
         7O8aOCyT8k+HWqjNmdI9LkwtPHF/ryXUcSBLE9ar6bXCPOpNVxqKnNuVE09/Bny3K2vJ
         TozLQPr0GYj3BJZoAJju9E0RKUCXMy7e7jwk+jPu5rk9DDlGZopkvlpOgn4vh+ui2Mud
         jJE214tnlfJgCoFHdsZV5ICzUH1PnzB9XNMUAh+kGJemCb08rcwxdfLax8/c4uAXVayw
         pWVGiV51HwbUbOF5RaXoPbaVKElP/pNRQAM+rxoxM8Tbh8gYri7yK6GDFIgzsy3PM4jb
         72RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400788; x=1734005588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwrzwX+VjMp3rjgyMNnFp0aWkMg9bE4xU/GitUl2qDI=;
        b=REoXCONW6bO0hIj9XrI3WDffEPV+dH8FH0IUmttN7ZuDRq4tqu3q6HxuHeXtgw7BPP
         QMEkoFR7jZkbqEo0oE2IyhKF9vOJwhhg2ScYwYFpvRztesaRrtJw5BiZFk2HxoIk7yqJ
         nv4naQQ440JQVh1SUXC6aUPMWnxAK1wN+qmt3/4uxMoLS6quvJ2QTVum36GK9oJK9P3I
         o8PhAkM6ZSzA/gF7NLxoKii3r1wdBATOwB8CmZNfpcqIyEGV6W9cpoSkNkVggBSDRE2e
         F3zcVWOjkFTubSO3rb9bHwx1f/YptnRdyyRNyRva6YuPU6khXzb2xch77+4Jv+1gKJZx
         3fdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkp+OgYTmHxh5bdIcjRdA6/H9WDwkpYldHCTl0iL3ja54UA9BthsrY5Ha5e64D8M6EijnHyoaMgT7WE2Os@vger.kernel.org
X-Gm-Message-State: AOJu0YyP46oMx4rbOhSm2vNx7bnt5PLHns5z9FM4Ez+qUzXLsSGW8Sxu
	kCm1FveT4+xD931+80OeS111HrV46ci9HqiQVpHnXsvTq2yzS4OITAYzz+qTPeI=
X-Gm-Gg: ASbGncup1f1rkZBXtJpmA5tG6MRVSRi1YNhpK01/cdx0bT55wKnm7EyX0VFqFiUUOgV
	chG3EgEUOy8Hyth5ojEPi6OQWI77hepvhgz0fbzAl1ICTkFRPgFEf5POL7ZjLFnAkkbAex/cf5A
	BrOPLWdofU5QnJmQiyd1CBLq6sGxGTL/BiF7x2HrsweiAP43xQgFzNGmKEYwCIZXJ3lT7sJg3ns
	+3U6pLVIMQHp4tA37Y5Nb6seC/T4G2faOw+tblhH2zqxikGvCIoVgNcfAZmZ5xzBtDgVBWvZ6aK
	JyUf3fyZC0jhOq/YhEjgpayJ+APK0w==
X-Google-Smtp-Source: AGHT+IGIy5upWqQ/8rBXR0DSluBGUFaFQ1r+E84LOe3qMZ/THup3+2GJi7v+gFPtvdOWb134Dp/BPg==
X-Received: by 2002:a2e:b8c7:0:b0:2ff:c69c:db0f with SMTP id 38308e7fff4ca-30009c8abf3mr63428231fa.34.1733400787878;
        Thu, 05 Dec 2024 04:13:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020da27f1sm2063141fa.37.2024.12.05.04.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:13:06 -0800 (PST)
Date: Thu, 5 Dec 2024 14:13:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cheng Jiang <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com, 
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8775p-ride: Add firmware-name
 in BT node
Message-ID: <kgxxykbogtdfsnkyk3f5mpht54o3siqkhkfji5nqo7cyck44rf@x7kb2otqdo7n>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-4-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205102213.1281865-4-quic_chejiang@quicinc.com>

On Thu, Dec 05, 2024 at 06:22:13PM +0800, Cheng Jiang wrote:
> The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
> QCA6698 shares the same IP core as the WCN6855, it has different RF
> components and RAM sizes, requiring new firmware files. Use the
> firmware-name property to specify the NVM and rampatch firmware to load.
> 
> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> index 3fc62e123..e7fe53d95 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> @@ -857,6 +857,7 @@ &uart17 {
>  
>  	bluetooth {
>  		compatible = "qcom,wcn6855-bt";
> +		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";

And the rampatch is not going to be board-specific?

>  
>  		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
>  		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

