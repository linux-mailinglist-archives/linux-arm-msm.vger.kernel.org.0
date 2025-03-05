Return-Path: <linux-arm-msm+bounces-50307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 052BAA4F503
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 03:59:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F031E1884B02
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 02:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407C1155A2F;
	Wed,  5 Mar 2025 02:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIJppOXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E06D1547E9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 02:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143518; cv=none; b=Hco77Z4BbWZD7q3hB6J0W5RRDy8ZWlFtoQ7BMJr6omPsEQ1xVJTEFSNWn9QSliHzNahhjR7L7Q54roaffKa6AAu/NZyKBiUHaCtA3sg7HaJ+dzqF2vpRmJ/2rFd43Z/rplfuw5gqDNB2OnaB6VQKqzGEOBgOgJnbY2W/fs2ZxYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143518; c=relaxed/simple;
	bh=N+nG/bO8D2vXra3mywxjpAtZicuK8zOlM9XvlDtvrXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY4ghpWemcafuRufULFV4CVEPMOg7fxzTne8gCnv+NhEavjv8JWxdkEYqSlPkipYSScj4Ou1Hm3sLjTHDRfwcdwvpU6dSJ3BYazun3GZjzy8bjzgwGQSN0tMOJ20sU3r04Tb6HZG2DQ6N9wstLy1cA1KXQDEZLx7I8d0n0MUzaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MIJppOXQ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549662705ffso3380830e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 18:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143513; x=1741748313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=;
        b=MIJppOXQYQrWaUjhTMcdq4Jn1ZXME97jwIkOSN46m1VigYBgs4tWXdzmJTE6/1N2Y9
         xTFUHJnTWGPfwteg+WByQZNGgRAsHzQNvs6Mspicx8OR9S2FQ4H0JvZ2BFXpF+YAzldA
         s1sLTMXTAIvN3COu0MndytJc02mDOafBkx7YGTGiwKaYbVvTzOlkZxCjsrmnSApCIDAh
         sBxiSkY/EJsCU1Y+S1HLAPHUsHbHwKF5pilUedFQBY/y7O7cs+u57RCbcnGc53M1VDNL
         3qGgNp4Te79y0a72WFtAtJwU1JwRhSPidmjSvcDA4cxRNkciCDFJmnpBUMWGtfIwPhnM
         xdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143513; x=1741748313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=;
        b=Y9umEp+xs3UFQwckPWm7XzsIcAInV/PWbrIMz3MD7Yuc9MCalDnViHQW5JmXnaBWyl
         mk5RRa7tw8ifuFjE/DfN/muUD2/O0qT9xunOaaGcYJPSMzFpCY7VIPWAmN7dfmT1lqYu
         grEkY7+MwAoPDtZy5jm9/KxpcfKa5gNZr0rbhz8NhowRSsSxFNWLgnK3nSoq++5tcL5N
         RbxDRRQcH1f4h2TsGE89CSgax1v8TmNFJOhD7eKriwl5MpnvhPnbJ+EU4DC9xJEMV7jD
         +yAhMhoMkMgGVgRzU2seb8/aHlNBBP2dBt9P04hNPhsHO4XAWXqjJg9RNd+9dtJe8oix
         6tJA==
X-Forwarded-Encrypted: i=1; AJvYcCWcPfvjMEXbYfQSMeq5ZUpTZAwPYFbWICTZ01fIy5oVzIJNMyj6G9BBEWU+M53ZVzZZWK5a3Vqxma2V9z3b@vger.kernel.org
X-Gm-Message-State: AOJu0YxbItj4FLZsiGp21xMK/mAkvXMT3ZsP5pzNm+ToD0ge8I99Zmn2
	7kPOGXfdTVTaLI7rJA4jOklfD2im3UascSfbzrheOOlbKHtfwuoLR8sOXfBCriY=
X-Gm-Gg: ASbGncu+HQ/djs5I2Kv5koPFsrQIAF/ij9q80OhktVT7HfvgijRMBoiQp/a2ujBVjjw
	X0E0YLTOa5dwuqHH5+qmiZEmUb7DGjNRhUOY6fEgOtgI3m7yoHpt1G6DlCrOEAEaH7reMqFfy54
	Sp7f+iEVfo6LQW5HcJ0AA+n8x554k4uyrZHjqW7ZP6BSdCEdlNSP9PC8/lfmSf8zaXJlJjBcRL1
	wLUgIFmI9wf1de5TxZuZrwhiwe63dA51r1Lor7rcXS5FKP35hQGnS68HC6i3eUPJNH3EzTvDffD
	eT7+3Wo7DDmlYaIn+6Vii06abfT7weIYRqiWjQuvVH7XlCvIlTdyECElZuvmt0Ya8AYr4f6vP4y
	fn8n1WVwFJ63w4231d/SQzrFx
X-Google-Smtp-Source: AGHT+IHEi7gu0pTeyCm6UNSNFzowmosNeq+ixhhTaaSaHiD2yIEwbXWQsqiTh1JFRh+rHJ1Tvh3IUw==
X-Received: by 2002:a05:6512:1156:b0:545:2544:6ae2 with SMTP id 2adb3069b0e04-5497d33624dmr555644e87.16.1741143512917;
        Tue, 04 Mar 2025 18:58:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549579424e4sm1320182e87.118.2025.03.04.18.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:58:31 -0800 (PST)
Date: Wed, 5 Mar 2025 04:58:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP and QRD platforms
Message-ID: <6msx5eontkkunldl45npigj756b5sst7xjhmomlnummbsmncif@ca3hkdvtdo44>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>

On Tue, Mar 04, 2025 at 01:56:41PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants.  The current definition
> will start the USB controller in peripheral mode by default until
> dependencies are added, such as USB role detection.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++

Nit: two separate commits please.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  2 files changed, 48 insertions(+)
> 

-- 
With best wishes
Dmitry

