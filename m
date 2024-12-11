Return-Path: <linux-arm-msm+bounces-41489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B729ECDBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C52441616E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23C23369C;
	Wed, 11 Dec 2024 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRLikzjc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA8381AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925386; cv=none; b=Rl+7B2Zg7SGbCHN4EtKVRyLLDPbEAl9WRHZDbcGAS72TXkeI/bP/tj59x7WXmSA8XgDzrJxMXsScFFMcGjEStVRALu2MkekXPwEW/GpXFA2Bq0zQJgriijtw2qD3scQkkWcfZ951trk8YegweR9W7o+O9WbeOZNnNYl9/5sv3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925386; c=relaxed/simple;
	bh=jJNvd5CzRMOJ5gUrBQXY1b7u4hCix9pxT1OewNbVyCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhTk9rfVvEc7iexQoL7mNb0l3MKtKbJ5bMSFjyM5yQvvqATTGz6qzRESNtGNDZA9Dq5vHC97tr2gdkr2JUiR/4IXYM+JzlaodrfcJLlG9zoS9G2vcJfn/a86OErjYTSTQHE6LrX5Oug/1gDDDr0re6caXdZ3CrtCjvmSoL00pYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRLikzjc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a766b475so64753865e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925383; x=1734530183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jtSEM+vm+bIJ/KTsXmMQlqO+KHdG4/pkOfrFSV7O0Lo=;
        b=mRLikzjcayj7jg7rQppmNaqnvV6z25LWDzY71mbo84HYprBkKtze/LrPHGqB3YlB8r
         pp/21g1/Cvds0yKrtnLI5qckd/1L5hU622ieRwdBQ5sIiUAUXQTT6vPEIWEBdME+Pxxp
         PutO3Vbvl+lhJuaCMzVyLXvdQRjtJfqWpaZ26pzTPPyXaw324EWdmYeRAxE7IijdHqW0
         MLNkMM6MvFi3t28R9P8Bct5TUDnqeyNrjUwUHg+U4ktWUymb/ryeiYkeZ5APfxVuRfTt
         Ngu9ngl79yRx/9P7xoUHGVeiDCkliYFHJlaakqAd25xerIyTM1CnjNr1FYUMBwIMYYX4
         rsqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925383; x=1734530183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtSEM+vm+bIJ/KTsXmMQlqO+KHdG4/pkOfrFSV7O0Lo=;
        b=EugzCzJZSMc62xmaplDgY4uI7k1SXsOEr1a7ZRPlJLC3f1ea0BEBCJl2Gbe5hCgm7D
         bbFXrcwAxU2CcJ7m2fZhgedQCt9MBjePhiC5H1pJh7/ay5Nz7+1OuQmRL1j+N7L8H9FK
         T106vpK1x1xqUES8Rd8Yn7jlwoMx1c/n1Sw41IioFRT3slB7VbDFyf0xY5ClX84zgScX
         B6xbFSnpYfKMPu+BxTjfPBIr+HfJvMOBif1eco8B4HuczmIds0riuGhfn60aZKX2K+U7
         yR7q+mV4orE2ooChCmmqOI/itoncy77fLZPFdM9pqBZoMli1WwSGlrLtkfXwHOubXg5Y
         8idw==
X-Forwarded-Encrypted: i=1; AJvYcCU40/tF+7GK4vgghWmUXa+oiSzhJaXYNMSijSAvhcHmrB0+PDpx/k6CTC7vbwbKjj9OQeTv5CyH8cgHeMKg@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqto924WY6LHAM6NF3TDIWmVIN4iDv6MZ8w6Sf2r6AeGDuk4B8
	byeS396wDliokuYygLq2S+kp/EgIODYL+xOGj6bDIWzL7ZtQmCz0Dl6y4xuy7os=
X-Gm-Gg: ASbGncsgjtrkuatb/4nMEzVwGbaRYC0fE41U5aevQjbtOcx7FIWdg6mIbzLs4zbyMYr
	Dd0DetKtm3vzfYdX8ExZaXDOxeS2hARDwn3q2r78KOqADa2/lDqyVKZVV5iAtSHxaELzyDzEYoZ
	+hYkil3Ze1ZtXuOwnfs9sMGpgFj4vrRj7vIPzH4lr3jbRF5o4s51V1R2Hsw+MkngT2kECUpaDbH
	5cZTPGp0I3u9eIjvlzeUukihbE2I7MemkhOI7jEQt8k6iK5QK1Z
X-Google-Smtp-Source: AGHT+IF2z7GNLeCXaPcEuFWlypAl7tCU8l7GX3KX4YAoY6IJG61/b+lP2czNLPCrQwDT7QmPykXLwg==
X-Received: by 2002:a05:600c:c89:b0:434:f5c0:3296 with SMTP id 5b1f17b1804b1-4361c3a35f8mr23007175e9.18.1733925383220;
        Wed, 11 Dec 2024 05:56:23 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361ec75410sm13569135e9.1.2024.12.11.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:56:22 -0800 (PST)
Date: Wed, 11 Dec 2024 15:56:21 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	"Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
 separately
Message-ID: <Z1maBcM3jG2SjhAo@linaro.org>
References: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>

On 24-12-10 09:36:01, Stephan Gerhold wrote:
> At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
> default and leaves the other two disabled. The third one was originally
> also enabled by default, but then disabled in commit a237b8da413c ("arm64:
> dts: qcom: x1e80100: Disable SMB2360_2 by default"). This is inconsistent
> and confusing. Some laptops will even need SMB2360_1 disabled by default if
> they just have a single USB-C port.
> 
> Make this consistent by keeping all SMB2360 disabled in x1e80100-pmics.dtsi
> and enable them separately for all boards where needed. That way it is
> always clear which ones are available and avoids accidentally trying to
> read/write from missing chips when some of the PMICs are not present.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Changes in v2:
> - Clarify commit message, there are actually two SMB2360 disabled by
>   default (3rd and 4th) and not just the third (Aiqun Yu (Maria))
> - Link to v1: https://lore.kernel.org/r/20241203-x1e80100-disable-smb2360-v1-1-80942b7f73da@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts               | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 8 ++++++++
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi               | 4 ++++
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  | 8 ++++++++
>  9 files changed, 68 insertions(+)
> 

[...]

