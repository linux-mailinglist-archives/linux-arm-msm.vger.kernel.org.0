Return-Path: <linux-arm-msm+bounces-39899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 844BE9E0671
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71CB316CF05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B032204F78;
	Mon,  2 Dec 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hb8RGcuY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863502040BB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150934; cv=none; b=Uu0KEwEnYUd7cJawLieGDFOpf4uYeluNfgnjLhCDhZUp+7doy6ZG7RCgC4t/l80VmBoH3THotWtT9pQylM+h9MTphhYTpHFUw7bu7id+Xdkp2q3jZF9W2UAE1fo9bzHCEht8aP0v3JxrdSf/CoE7hrdGLYXoJGz3UxeGpeSlSRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150934; c=relaxed/simple;
	bh=XYknei693eTxY8aq2XA9wDND4yyWPBY7zhkDQopy7l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdyKvY2lEvsQsAkX6dsOy+f/iuV7NvdlSOLAtZLaOPLLqEiW5u/872fpzWCriBGMLO9K153Fg1aq3QDVuLcrnS0WDC93T0ZsWhZ6IkDinj/UPyLsNOEbXrtgSl2A76PGkccH3yDr5QBPqgUze9SEw1uHN3aAHH1Fm91AMIYUXuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hb8RGcuY; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21578cfad81so11431785ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733150932; x=1733755732; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GpKDAl11fDGEFH2u0shHgW2aMBuMgZUzlcce2vSqOBc=;
        b=hb8RGcuYKhOi7tMJgRYG8tTJ7+Ab1PeCtAzgDmTXJ6D/Y4h3Mst9WscRTg8KST32h+
         omXakHLVSviaq8a0esaR+3lCm1fpoKXI2MVGKUeB5tsZ1X81ryefdMt1bEP7KsVNzl+G
         imr8yt+UmHPkOo4X4TSFccdPnIe/b8gK6+mLjknlrmTKKY8Y/KpjYmuIZul3xn6yTt0l
         xaUB3Z42AI/2FYZTjNy9M8dsxQXl/YA5AAyc9zerb7Q7fOHoE00uDgzPii0SN2L2p622
         JV55ClJOMxlUu9ZU2zDOCaMdlnVXLALXvKENiNyOR6gyeRVecZiBbNCBfgeRdI/qpa+7
         lT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150932; x=1733755732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GpKDAl11fDGEFH2u0shHgW2aMBuMgZUzlcce2vSqOBc=;
        b=FOcdq+Z0vjyptP24tfLGNxO8nUvUdIJIDnBDlOktuXM9LMAeOmti2Nq/B0QXrNWBHf
         kDwC5d9eq1lidwWfSfuvr2glyRieDIJdWZ8WHYiFaHdcvbfFuhf64Jyfj50LmYhq8Cz9
         mTgd7C4rE3bfOuMrGRI8kPijFsJNLA4ZEiUbm60t9zzAMuds6seydw5aESmDltI0iKoY
         PchGv2KTPXs5rsJLD77HGVeOp6kbWyPqmMZjbcUDcGEL+vVdl2ByDoHrhlzVvKErb72w
         WLd3LkoJlfnepwvFa0GrHjDbJOFmdfARzTbp7kOX+HXOm3yDeZ1iGA21fN5Se1N16QXc
         gr7A==
X-Forwarded-Encrypted: i=1; AJvYcCW8ub4FIghB8w7icvqwLHZq7gSjs+9f1EANih13ZPMpz/Oc1sVrpihCzDnRyNxDaa8UxWP+33//MZ9jyCCN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZwfnlWY02pmbVzwEYzeofSUUHSx4+Qzq0blIoAxSkh4q8oujQ
	GoMCyz88P/5UzQ+echpBTZPd5N7NhKn0B+peYVo+ZJOFmJyTNDsp21tt6cqQ3Q==
X-Gm-Gg: ASbGncs+G5TCWww9t1/gVu6fum/Q29Zd2O6xrRkEDwd/tX77kYZLZWkBR75uqmK6I7O
	+Npk7Btl5n1A1Vjeg6BZtfdy8FQya8sP6MJlFxMOKUiHTxOJwp5YqSwNeij8OTImTB5R3oUf+o7
	eIohJaiSBpkjsV/FQJM+LpUt3pgWKjdR9eutvGupvAWQaKejbfLg2i79p6gGXWQ9L6TEk+zwNMP
	+QNxQQVHack8PLv1alrAtvL3dOdUnwKGnA4FFUtIVuC/G8xv3t2//uF6VHYZA==
X-Google-Smtp-Source: AGHT+IEqa+tt8+8vAVIq3UE9y4O1HQ9UBxGGwNoUbUmxwVoafsrUcqpH/ZT38yQrrxK6IssCIyvowg==
X-Received: by 2002:a17:902:f611:b0:215:3fc6:7994 with SMTP id d9443c01a7336-2153fc67ba5mr207835105ad.49.1733150931824;
        Mon, 02 Dec 2024 06:48:51 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2154704346asm57084655ad.18.2024.12.02.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:48:51 -0800 (PST)
Date: Mon, 2 Dec 2024 20:18:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Xin Liu <quic_liuxin@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	quic_jiegan@quicinc.com, quic_aiquny@quicinc.com,
	quic_tingweiz@quicinc.com, quic_sayalil@quicinc.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs615-ride: Enable UFS node
Message-ID: <20241202144844.erqdn5ltsblyhy27@thinkpad>
References: <20241122064428.278752-1-quic_liuxin@quicinc.com>
 <20241122064428.278752-4-quic_liuxin@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122064428.278752-4-quic_liuxin@quicinc.com>

On Fri, Nov 22, 2024 at 02:44:28PM +0800, Xin Liu wrote:
> From: Sayali Lokhande <quic_sayalil@quicinc.com>
> 
> Enable UFS on the Qualcomm QCS615 Ride platform.
> 
> Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One question below.

> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6..79634646350b 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -214,6 +214,22 @@ &uart0 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_hc {

No 'reset-gpios' to reset the UFS device?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

