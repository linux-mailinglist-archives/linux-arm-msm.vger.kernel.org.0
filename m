Return-Path: <linux-arm-msm+bounces-45683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18247A17D64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 12:59:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0303188BBE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 11:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96331F151B;
	Tue, 21 Jan 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4izTp50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD851F1519
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737460768; cv=none; b=E84Gx3BjrOr/bL6nB0n8y2kKQ8cXFyEEBbJ8BXW4Bm6C2B7hsB/3J5uzhNZODOGLP10Fo+hborItzoi/4m66WWjOC1Vi3AuCfqDRPjFUHCM0BTD3EPwkkVB9vkpXzIoteB5LIU92qv6zO6l6w6GaSMBs2rxbKhijnMQqmj4ECjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737460768; c=relaxed/simple;
	bh=vxzcy46pZfqioa6UEDq7OR7NwiFNfEeNMbgVFVJPpt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7mM6/QsglUdN4IsPpdUPENCTP5esrK4CuNnry9aHoGvh8oy6CKFT680DUKk2GysHzKR9sXtfkuZ1Nh4oOycCZ3lPeJMYYa0s3/jgpIigLyx0w3j+AIa0rlj8hrypOEHQrlf7Y+d+tcF1HNYi2PIcHWo2NO8wM4t8EhAPk+doKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m4izTp50; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so5735403e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 03:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737460765; x=1738065565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfx2czK9IacwWV5k4WwNZnsfuHADH5KtaNM2M6WqSlY=;
        b=m4izTp50BacBTuJ93Q7Wdmw0sJwreq/0Wr6mG2ca4/WjGjSZ9joeDx8NhpzMMgPJsa
         pFFCH2tNYFGUJNK/c+vQKiSs7pfu+MC8IZVDUwikuY/BF5zkz/ZY2PlBDSy+0Vy6Fxmp
         ZGXjcn/6B46I6fnKkFPACoWtnqOznDP7lb5J5wqhz8XuhoayV3tNZfHU6MWIQMopZGws
         Dw69Po13MK0U9P3zFmhrYMs/RhjqGB28eV6GQ0aooC2tCOpOXGb3uKYK1T9//3NxgXBD
         hTY+zY6Z3FHMmKK64KTp2HTM1MA0zMXjS631+LPfjqZDaa805v+wFtKIwTf5Hl7QzS7b
         SklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737460765; x=1738065565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mfx2czK9IacwWV5k4WwNZnsfuHADH5KtaNM2M6WqSlY=;
        b=X+i2wGis9zI9nRqTHwGXE3qqXqAV+m0rOgJ3xwKosq013VR1vPl8PwyrSix0ecTQGt
         Gf1baphYv9nEfoyaOi7eGdOc2uFEBiqGORCGC+hiq0fQ8tnvMH3BMKprIVmGNQhFf+ts
         PvFcLbCwb/gSBF7UKp6fxC0dxLke/fXqwT4s9C9kIbt5jfQoCj/5XBWERcQiyG6jrHEx
         0v4yw6X1YWXvFf8/vajUNf8613SxggiJkelBBTmxabUg0jJA08VSD3hifQ3RpUSBwU9E
         UDaDS+0Bsl2bbnPyvFVUFU0H7AIFb+nahG4itmTkuXJHDl2HqOBzq8OEcG6MmcZ1I+mK
         4Ufw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJzqiKLZ9XCkkH3vDqfQNZFoU/CX7gzfayCOBKp9Sc1NuNZ2Ej2quSeUmXEKCcHpirAF4yb7f6pAAAIsk@vger.kernel.org
X-Gm-Message-State: AOJu0YznYGC5GH5Uxq/t/8wG9svYf+2E5TjrCW8pUbB5MzcomMOOzoOp
	aKdnfZl8r/1hMLj1vz7vxM01WukMuyMPl9frz6SNezgC10tsko4Rwb+G9+AX2OM=
X-Gm-Gg: ASbGncuAXdCq1CZn2xsvGzXWqBLwVQo+6z8ZdwK99PI8hGzO2rs5GFSgfoRGKlMAQow
	5yN64lfyacb3ZaMaWrjOqfSFshv5xA4iEmNmt+sCdVJgdYF/aWEreQLBgJUUEa1C+eDKHi5WNCE
	zNPU1SaqaveskH+/JkxE9Uq8NKDdLn0YC0R/iyhY2/K+sIWmUXYIK8z1yzKWqqezwHt4tDu+ZOA
	54opCp9JqkQx9liXsSZl4kvi+3NDY164RZyY8N9mKF9bSvVnG5bRt86y6Su+c7/GFzRQPklNxXr
	u4XxzMjTrsOXaTuB2WutBm/bm08hIx6+99Q76i0gFaIvDQEq0A==
X-Google-Smtp-Source: AGHT+IHLCGkedLvV8IycQ4ZcIoP+8T+7S4QGPtqF8W9Y/w/Oh0NBSmPRr1svXj7yelPQJWAtVesRXw==
X-Received: by 2002:a05:6512:21a:b0:542:a73d:a39a with SMTP id 2adb3069b0e04-5439c22a8d2mr4598608e87.2.1737460764826;
        Tue, 21 Jan 2025 03:59:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0eb65sm1794488e87.93.2025.01.21.03.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 03:59:24 -0800 (PST)
Date: Tue, 21 Jan 2025 13:59:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_kuiw@quicinc.com, 
	quic_ekangupt@quicinc.com, quic_kartsana@quicinc.com, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: Delete duplicate fastrpc
 nodes
Message-ID: <7boe423isk36f6z2cqor7oj2y63t6cdo5gpfvjsioqhg4yqyjc@sitfdraxfjot>
References: <cover.1737459414.git.quic_lxu5@quicinc.com>
 <624c66935ac908f7427a6a238a3920cb415ca057.1737459414.git.quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624c66935ac908f7427a6a238a3920cb415ca057.1737459414.git.quic_lxu5@quicinc.com>

On Tue, Jan 21, 2025 at 05:24:03PM +0530, Ling Xu wrote:
> There are some items come out to be same value if we do SID & ~MASK.
> Remove duplicate compute-cb nodes for sa8775p to simplify.

No, you are not removing duplicate compute-cb nodes, you are removing
extra entries from the iommus property.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 240 +++-----------------------
>  1 file changed, 24 insertions(+), 216 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9da62d7c4d27..0aa27db21f3d 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4517,15 +4517,7 @@ compute-cb@1 {
>  						compatible = "qcom,fastrpc-compute-cb";
>  						reg = <1>;
>  						iommus = <&apps_smmu 0x2141 0x04a0>,
> -							 <&apps_smmu 0x2161 0x04a0>,
> -							 <&apps_smmu 0x2181 0x0400>,
> -							 <&apps_smmu 0x21c1 0x04a0>,
> -							 <&apps_smmu 0x21e1 0x04a0>,
> -							 <&apps_smmu 0x2541 0x04a0>,
> -							 <&apps_smmu 0x2561 0x04a0>,
> -							 <&apps_smmu 0x2581 0x0400>,
> -							 <&apps_smmu 0x25c1 0x04a0>,
> -							 <&apps_smmu 0x25e1 0x04a0>;
> +							 <&apps_smmu 0x2181 0x0400>;
>  						dma-coherent;
>  					};
>  

-- 
With best wishes
Dmitry

