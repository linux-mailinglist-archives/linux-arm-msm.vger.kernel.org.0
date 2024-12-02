Return-Path: <linux-arm-msm+bounces-39833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7B09DFE81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39E6281732
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ED71FDE35;
	Mon,  2 Dec 2024 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jTioyHDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41911FCCE1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733134360; cv=none; b=fatYleqqqo/idcdmkxVg2ieND9ssW7C+ugzKF+EjY9ijrz8K6D2WMjSQdv1oepDPavrd8aJWq4VQD6b2CcdxJzWNdcbXLFoTsrd5/in5RSGnR2QxxoXoIBFGKpKpolOOQs20ISOSWbWpkyqPynFZQuz1GpuemLZHHgSVQSa/uUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733134360; c=relaxed/simple;
	bh=cEz5WCEcvO0LA3NyHkeRpJjFKEfwc7Bb03yBcNKzoGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oudEyeA4UnbQKTDKZAeLNYM/9LGpLFePoAx9awsZ3Uk7pZiAPZXA+JyAEqqUdCASUEaF7q8Gh55Cx26Z2nsq613oAvvB5rH6+WA+NEMtOZ363p1CoAGwKWf7mwFVpoYbYg5QMOC8EGlTKMVB8UNrsrIuhigYw09fy1a0tvT1OG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jTioyHDM; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53de84e4005so4416024e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733134355; x=1733739155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PdrLpX+axI2CPbjnNH3X9noFZkYJRbcHp1c258OKeSY=;
        b=jTioyHDM/gKwYzRH83ICipPzoAfVgg/0SIwxVXVOChYhXA0icuZJDNukrXo2yPaBJV
         OjkWaXDpCgQDMK0d4w0JGEKtVt45gVeM/RKEWNt/YzBQX1Co16Sl00R+IZL9+rnQ+rFt
         IeoLScFYA7+PHsoz7CSORUuidhHKIV0fPWQU2shS/4f1BvyhOwcrc34OdyyEOAf278cp
         MSFAPvDQZbzt8DMHtxZy9j5VCIGQWj6joAtwmvNH5TEycb3o/VNeqq+g3elSpJRDCrcp
         RQAF3foIzsfRJuqhtBD7jmgV5oNO4rEiWnHPK8Lk/Mg/UVhqHoHhi5D4eAbinGqYQT1y
         L8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134355; x=1733739155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdrLpX+axI2CPbjnNH3X9noFZkYJRbcHp1c258OKeSY=;
        b=MPau5Nom+lhDxnvcuZ3rxzlii7kUmKlbNvL9QexuBCqpD/8+2FGYd7aJoo+tJsH1c7
         /h7Gq5Hdk4A8HkM6SYWuZA237M0w0OdwOaNwtF2wAl9z26vMYClyHzAK16md1lj4k3+I
         o8i1dwJT3vEpX843iiufx5MmHaVd0pGp7Ge6V1D19uYfEKh17BldRkmK7qWdTtJ2IgUH
         fLeUHzfgmhdDecpIO5xiiq0yShwnWVDJzL1bqehHaMraDBpGZmtNtZsxFg5cjpkSey2J
         ebhbwSLVeLBplsVWqUpgoYzo86detUkgqYi+PZ4QAhLQAPamgu+RhFB9N3xWDeiGjNe9
         gy0A==
X-Forwarded-Encrypted: i=1; AJvYcCUXtfPeM5uxBSqdgb8wozWguJ6X56Owxt63JMho31bnXSa+cy7NEVoOMXAyoMtgN0juz/6bP5AlRcvIW7rm@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc1/bMgrKzCdCuiKY4BtfJMlH4TVCQgn83yNCJ4IEcFR89Hqac
	EboAS4nAWWwen5MJykPmzRhPWa6VjvbLyvVR8P0vKtd7v3CLIAS1ebcQfRRVEMU=
X-Gm-Gg: ASbGncs2QNo14TcyovLXZqhTAImQNrGzEVMoEToUndjRl+p3HtCld+Soes74vqV8Zph
	lle8jFLZlju5krAxZmyVeVEpOW5TAwYECI3yUxS6tkqJsPJQ9bU2k7Use6SGO/jVYzKpVymibKl
	+Owk7FyBpnrmQDedVpPPZnxtFrDekM/AtWC9mHlG4VjOxF9M0Ed5Kt6G3/amVsqLAa3mLMDterp
	SWp4kR+lqdxljIv6n/zyBHbVzm1rwhp5rgLfx1TfMHZujdKl9fH3WgSoANBYL7HqxgFFklchRNz
	3hVqOpbx185D4IeeRiVt57zVW9nt8A==
X-Google-Smtp-Source: AGHT+IENA1UtOB2vC+9sMeQjU5RSPscJVa+h3RiiqVEgdoucohrY/p3JAOJdi4XwYr8/MGauEsX3WA==
X-Received: by 2002:a05:6512:400f:b0:53d:a93c:649e with SMTP id 2adb3069b0e04-53df0109024mr12516120e87.35.1733134355114;
        Mon, 02 Dec 2024 02:12:35 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64968d6sm1380786e87.200.2024.12.02.02.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:12:33 -0800 (PST)
Date: Mon, 2 Dec 2024 12:12:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	kernel@quicinc.com, quic_eberman@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Message-ID: <lzmfmo2ll5izofq2pcpv7dkhcdawwijxotw45cqu4vlydt4cle@yta6qyume6e5>
References: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-0-bdd306b4940d@quicinc.com>
 <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-3-bdd306b4940d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-adds-spmi-pmic-peripherals-for-qcs615-v6-3-bdd306b4940d@quicinc.com>

On Mon, Dec 02, 2024 at 05:37:24PM +0800, Tingguo Cheng wrote:
> Enable PMIC and PMIC peripherals for qcs615-ride board.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

