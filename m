Return-Path: <linux-arm-msm+bounces-48959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68932A3FB7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B87AC7A62CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6491DED5F;
	Fri, 21 Feb 2025 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ty4rNvAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D691BC09A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740155386; cv=none; b=MvoLx2jUYxjtRrZvBCCaRE1o+8mYdILt34S90Nury8n0YBoSkcDM28dP0RTzZBU8MjBbX6sjGjDcFw4P3jL7diI04NVuY6K2SoEzyOHlNvmeceYosdUmb19oh8eApAzuBXLN2xjYlbu0jMuvSf9P6wf42qCtxWTN7+l71pBudto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740155386; c=relaxed/simple;
	bh=fBoYCwZcQCYhkm+R9DJkHNisr3S/E8IlAULXjqlh6mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwX1hz59dvKqmX1Es36fIyhP0j9h0N3x+dNRUbY0j0+m0E24ZUzbz5XYaAWlMaZVoVSn38mgIwT9Fsf8JtwMG8lwzs3X52A/to7O22ak3EUsFoB5i0+7E6vwDLo9TEs8j5e+SAysG0Kpijaw6k+JiOtj/sl2kded6qTPTCM0oI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ty4rNvAb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-546202d633dso2433542e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740155382; x=1740760182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNzke/B0jvL0u/biZ2WURSdaDRxmzZ+8zMviyRXTzMQ=;
        b=ty4rNvAbl8z2NDvAZxFn3LA6wHCn///RQeYxCbcjeRUkxUuSXUNQFU/c1VDCKDITpH
         nXqSw2WthCXwE/S4b83ZF73ISEnRgpk10YlMW8xyGa/KhyGble6mNBuwcRBMMx9z28a5
         0b6POKFppfW8cW6p/4PzJNpPZivU4GSDRBcdCJg10GDJ8sJwf6luFudPApRNZNFqFpeJ
         RDc7bPJTP8qXMt3GCt0yA3epRyEE2OPolaWuglpU5VzUmRHFuVIkuHkBaJ30Q+fIAnqw
         Lw34uevSHNXoLb+vWXM54cv2bgBdyTTil/4+DVPEBAskifnCXgd3eVC9iFUI1cqZuzjs
         Dxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155382; x=1740760182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNzke/B0jvL0u/biZ2WURSdaDRxmzZ+8zMviyRXTzMQ=;
        b=vZy/wwHfVgqNyp5gjHaVnxl1OPL98B5acIZ6xh/vYt+8sf7mUumFBEdr/M/HxYUU4y
         OHH82DeoruH22rMjFUsVaetvZYjO53RXysF0YhwZxNXjQCughJpdrdCp9r1QLzuazMZa
         hdska1sOjGwWVkt0QQmUcRzAP4Q1G5YsXZvS0Y+1O5gQt5656Do+9JpfcS3glP0vkMPo
         Zzz91XCm7qFStUHXVuR06NQIax8iXli4PGd4rVCodrQXLqI++vJ7GJPMgdxXik5tf8aO
         FMAIkgTyWkPp0MFMOCvpitYjM9M4lkIMVh0P0ZtQbGO0U5GD4eCyJ6gsOVfbq0CZX9Ba
         cPsw==
X-Gm-Message-State: AOJu0YyA6J5aeDCMDhQWDlMgL2uTPmpqYbftCjUb9zqWTw6ftD7hhB+S
	36RYdYUKYZcAZprMnc2dIlbDRN3mSl8Tp14OXTQeHVFRtPY2MOdWmJ8A8wk6flo=
X-Gm-Gg: ASbGncszONXq4mjdwrBq6n99RrT0QHj9U+E4byc+PpfIVRo2T+emKhbDiyuNzPH5HXx
	pI3PbR4dJsDf/1pZW0SThxBcasm7S6WkPjM3c//+2YOMAftPTaXZJkFvXA91ZqiJ8H26z2DDRNL
	j1CzmGRtQjfL3ILyBUz4CZSVjRAKUa19RMpT9Uq7WXjnOKJiCPI5GcDl+m1fy6jNuDxO/VyQmCs
	1K56G92KAf7yG9e+8ItO8CJUPDrJcmAbeK+NEmvmioa3AAqsPSdMxUuHwe34eRwA3XryvthtBOZ
	UnAUJtjkndJa55G0+DNVkoUzuHeOJzD0pANK+KAdzgj635q4/R1gHniuJ8eX4cDeypmezqCC0li
	M4SE/dA==
X-Google-Smtp-Source: AGHT+IHQHGtF1IRNvzfDKgAwDHfPBxdqZiPOZ1zVy8X+5men/XvW/Q187nct1imMKiSo1Kw74FRbQQ==
X-Received: by 2002:a05:6512:118a:b0:546:2f7a:38c1 with SMTP id 2adb3069b0e04-54838ee33b7mr1824643e87.11.1740155382579;
        Fri, 21 Feb 2025 08:29:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545309f68dasm2135184e87.239.2025.02.21.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:29:41 -0800 (PST)
Date: Fri, 21 Feb 2025 18:29:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, amitk@kernel.org, thara.gopinath@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: ipq5018: Add tsens node
Message-ID: <gozy64midqxmdguyzp37sqagzkfaozkfcgcdbq3zgzfwh5drru@znq44z5yi2ha>
References: <20250221161101.17204-1-george.moussalem@outlook.com>
 <DS7PR19MB88835D0B88C56EBE6127120C9DC72@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB88835D0B88C56EBE6127120C9DC72@DS7PR19MB8883.namprd19.prod.outlook.com>

On Fri, Feb 21, 2025 at 08:11:01PM +0400, George Moussalem wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> IPQ5018 has tsens V1.0 IP with 5 sensors, though 4 are in use.
> There is no RPM, so tsens has to be manually enabled. Adding the tsens
> and nvmem nodes and adding 4 thermal sensors (zones). With the
> critical temperature being 120'C and action is to reboot.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 169 ++++++++++++++++++++++++++
>  1 file changed, 169 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

