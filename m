Return-Path: <linux-arm-msm+bounces-21181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E364A8D5696
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E6D1C244C6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 23:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA7317B418;
	Thu, 30 May 2024 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0olzNZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0092918398A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717113166; cv=none; b=FcnQV/CQ6tHc79FnQ34Ul9d7FbDqLp9aGrU3AeoYOvuJxSakeQ/Oq3Pqz+xfxeRJxE2IRUlOEXsZLR/VnSySW3eNoovk3VJdIegeGw7VtG3k8FbIvCbMWaEynAvhSe/inuOQNznoLDrus7RORRu28yF3HHh0ceF9hDLbtQrx0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717113166; c=relaxed/simple;
	bh=ImWW8qC86D7+XycqM+D4WqrqAyiOTSC/Qrpfls4JNLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTqxEGjsNoK9YhMoVwRn1LtXsYwPIPzB7b27xyo0kS8ptKZaUUZUEbG79C7y8MFyrKSxZWf9RUYdwx8Hfb6mvA1a3EXtv6zgREg3iAWdxtF2lMmtmjvLm0usql0aRfX59LHsP/sc0ryC55Xpj2VKe1ImON96z2IxqGsLvUBiyWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0olzNZC; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a7545bdso14183061fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717113163; x=1717717963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYUkyPBrXc4crG0dXxGX0H7PVyjI72zgcZ0y87q5MZM=;
        b=G0olzNZCPQCpkVBomcKJYcQt0vyrrZGNaOGmXMjrpVbIZYXc6x1U5eLaE+OOLJpypJ
         ebZk/+LJKOolbrOX1eYr6JPnwpqxT5ebXnoe1wWb9Qj2Lsz627ouQUgbHw7H1Mqr0QJm
         17/1XdERMVfYRhHhyXtmGbqau/QGKaGChijV5+6sooi2M/velndJphPEJP+7p5+AfsIQ
         LmghLwE7nTN0Y/Dvq+VJiRgrQt75EdBVtXQhG6/hTzp66S/69N7XMHF4kA6sRHF5XBhR
         tpJyK3+FpDpyHO6INznnfR8VYN5GXlgZFFKDykukq+9xx5FYiES9U34+qWNX5Pa0470e
         ySqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717113163; x=1717717963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYUkyPBrXc4crG0dXxGX0H7PVyjI72zgcZ0y87q5MZM=;
        b=iQbRRksh22h7owS7oS66DYgljbo2nYwPsddAQxTOM9Ng2CvFhAR3oOHSt1lS+amyWU
         jCl+GXPkAa94jKpUsqbGX8H1pgCEZURZPjoCuqGsiMlCaelv39sIIZKaZ6yDoRsxmyAU
         K1XUxGBb0AB7yBwzT5pM8OVvIK+4xxKmonYF39ljU5a1cWKURblWsFu/RUeyIMBH4HBK
         tQdlMYyV9gsV8bpsqZn2dZ2/nYdcZcClvCY6zUNjAtWUgETx2q3FS1uyH49PetFU3YN5
         zsr71EJnMRNvPMPTRCE7MDzCtQ0BdicKaUJtsm8nEwsONtqmv6p8iE7SwscixU6n3dXK
         9/qw==
X-Forwarded-Encrypted: i=1; AJvYcCW+q07/JKHKwl1PpsbNEHRdzruNx2KfbdhfZM1uE/rEcFM1xrXKddCO6R4KiALBMAuwmLWNuZ3LTqnus+thBBQEtexKidspSMG406yTdw==
X-Gm-Message-State: AOJu0YwkHUU0DD48C1aU8vI4mCZ2LPhN6LKL/8KjLWj5uB0nOGi5pUHq
	CTn5Gh+jqqZTYd8XAQ+Ldd7IEydKwj3Fi9tB/Lv/Oz37TzvGoNOl94PiY8II6Rq5AWfPQExlfe3
	H
X-Google-Smtp-Source: AGHT+IFYDubIlQH/o2nv4jVv/ToUW+tCyTQXrEJzxSYlS4jVFX8gL0f5FFS7gJxxC9+XHbQoX/4T8w==
X-Received: by 2002:a2e:9290:0:b0:2e9:d4fa:1cc with SMTP id 38308e7fff4ca-2ea951e1b97mr2033981fa.39.1717113163091;
        Thu, 30 May 2024 16:52:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d750sm1186441fa.17.2024.05.30.16.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 16:52:42 -0700 (PDT)
Date: Fri, 31 May 2024 02:52:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100: Describe the PCIe 6a
 resources
Message-ID: <ghzkuqd7bizgtfof2nxl5lziugwe2poqjuj3vtqv4lrcike3gk@2cq6qhdjqaxd>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
 <20240530-x1e80100-dts-pcie6a-v1-3-ee17a9939ba5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-3-ee17a9939ba5@linaro.org>

On Thu, May 30, 2024 at 06:43:41PM +0300, Abel Vesa wrote:
> On both the CRD and QCP, on PCIe 6a sits the NVMe. Add the 3.3V
> gpio-controlled regulator and the clkreq, perst and wake gpios as
> resources for the PCIe 6a.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 52 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 52 +++++++++++++++++++++++++++++++
>  2 files changed, 104 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

