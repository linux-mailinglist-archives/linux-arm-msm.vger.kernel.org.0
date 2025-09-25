Return-Path: <linux-arm-msm+bounces-75122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14350B9F8BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259C51C21D05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF95D258CD7;
	Thu, 25 Sep 2025 13:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vPnSa8j3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46B25394A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758806401; cv=none; b=qy1WURHYUQ1a6snRaOSg+ny25PfUk+E1lwFqFTpdTmYy9hZPtwUtQllevYh7SAupHsg5PRZCYlMQ1QRKd9pBCAt3kKNkx2DxKeHCGtgPOWcDPldgiz4q0tM6UD7HcNy0pjpzB2VXrXPQ2tbc3YoUBW9cxltUbXweLuc5y7/euUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758806401; c=relaxed/simple;
	bh=YyK2lvbOXbBGryOpMQux96Q1vt+QrwWAbOiyxK6RAs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qj/7ejy8ZWbfjmYvsGQode2Ho3bIZr7oPJlFEfkmwlTxg1TOdpk83vWtLi0mPDRgsYBQ82zRChy0qWpRwva6gL9tOrwlX861Fimn8/UStbtmCEbq2iAsMhDsgF5KZ7lrNyUYqkiUCg6l9GUXunhszwBNAM8xLL0ViiwSvIyNEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vPnSa8j3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62ec5f750f7so1494066a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758806398; x=1759411198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EYsaOKNHwZcLmxeqQOplLWeI/iDmclk0EIqTKGLRVqU=;
        b=vPnSa8j3DmSaHYV50awVO1R/1Yo/oMdeY4VrK2XwhOp8vOgeL9P4jqjOlcKIjD8jfo
         WgiyMuthdBSgXDYbwbjZts39Bx4VVf5j84z/TBXSNLjlx2y7guzc1qCebppuyy17B+ih
         tjwycIuEhz08O47/Pgor2dxEMwr8C72Kx8YYsi1ALBGL1oo9sEm5Ri7YQeJRZtoNEc0A
         Jzqp1iR4gWZ+MQQ0I6WgfVh5J42Ip80iWOsjG44HaIhQddxUnmOqcGi1ZCieMYBBRRd6
         OR5DPyEmp5HozgTclZcSjQCfXuCB+IyYpOEpP2PRRY6PIToLg37/K6EZ5XhqSj7+Hq/l
         KC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758806398; x=1759411198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYsaOKNHwZcLmxeqQOplLWeI/iDmclk0EIqTKGLRVqU=;
        b=pCvzB6pZcCilXynnbNS0WWh792YMRnUEE3ZS/QymM9MnlC3t6+JpYjf9LT2CoZBPdg
         6LCterDcuyT27zd4jfbIiCKPBXH+WyTmEC5P2ukfMKpiP37iCGKkHha0ni/PVjbsX/Ld
         OA6NxyyNMqorn5zB6uSKFvFueH93E1tEANRy55n9I2TazAMhq2b6YELqfvO278P6ksEJ
         waGn7JJN1gZxwBB7iylz05mMgtqVxyaMJ7MU0Ag7KCaNJ+DxnnXNEJg1saivU07Rrpc2
         Ah+0SaAJeJ7uHoX2oc95/TQjnGBJUn5Xuf+m3DYM9+UrHGPkU3nsJNBjP9CtoRONIdDK
         /qFw==
X-Forwarded-Encrypted: i=1; AJvYcCVadRMmHj9jrSx+gWyjHu0KWWsZd7IF4xIJmjLPX4Ku5yvkmvlh0KYo7SF529fhWRJU8CVHn9FeMD/jJ62h@vger.kernel.org
X-Gm-Message-State: AOJu0YyK5rzCieUSIa6PrsIULsSRV25dIxkWIiBLw7TJLLJkpNoTXnQN
	tqRWbi4KYBbdtQcGWtY7hMV/yhoR9v1XQCybZXRVxBZuxoDfxmgiW8uehNEG7832BoE=
X-Gm-Gg: ASbGncu0chhPabHPHrnn3CWPiE9OXt6OIsTUGH20WKVOqWLfq3Mgeyf9DKclj2CVTgC
	jewuG0o7zZBwxNK8QMoxPC6945Blf9bAtrkV4V7y4QQrMOs2PX+pSaW2DDS8oDIdrk2Dz6iSMlj
	bquD3vvAOpw8EApiUlLpHiJ+FSpvUmBYECcckAuwjjn4TzZZV5y5iGHDBDZkBpxIdn1/nopXGWN
	+PaKYGE15B3lFJKBzASEawRmePDfnJ1zVMCy0yh3PVBPjywl5GQ94jvTsZAJCugZWJaqAyz9VD9
	9qhrxOxgAzEbcfmNaUPU1Q4EA4aw13D47Xwz6+xszde3LYXV18BxdFGEIJTYmUuVbP9rkYaRG1F
	tsUV/nEwXajkG46iC62VYMw==
X-Google-Smtp-Source: AGHT+IFGtxnVGv2ecu+++ctEtD2PwGh7olmiTWEA5Nd06S1qPZFvTUSBjy6wSrM3gBYU98dPW2fqdg==
X-Received: by 2002:a17:907:7211:b0:af1:f259:254d with SMTP id a640c23a62f3a-b34b79c7aa0mr338206166b.8.1758806397729;
        Thu, 25 Sep 2025 06:19:57 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa4c35sm165745666b.26.2025.09.25.06.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:19:56 -0700 (PDT)
Date: Thu, 25 Sep 2025 16:19:55 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH 23/24] arm64: dts: qcom: glymur: Add USB support
Message-ID: <wabocts3sscn2bvpgxamzpjmw3ivkbw2bo33aapospkmj7xtna@ynf2cwpw3fbw>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-23-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:31, Pankaj Patil wrote:
> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> 
> The Glymur USB system contains 3 USB type C ports, and 1 USB multiport
> controller.  This encompasses 5 SS USB QMP PHYs (3 combo and 2 uni) and 5
> M31 eUSB2 PHYs.  The controllers are SNPS DWC3 based, and will use the
> flattened DWC3 QCOM design.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 243 ++++++++++++++
>  arch/arm64/boot/dts/qcom/glymur.dtsi    | 569 ++++++++++++++++++++++++++++++++
>  2 files changed, 812 insertions(+)
> 

[...]

> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 8a563d55bdd4902222039946dd75eaf4d3a4895b..c48d3a70820e551822c5322761528159da127ca6 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -2417,6 +2417,231 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
>  			};
>  		};
>  

Also, as part of this patch, you need to attach the pipe clocks of the
PHY to the GCC.


