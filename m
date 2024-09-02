Return-Path: <linux-arm-msm+bounces-30425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52C968DD0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 20:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97D97B20B36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92EE1A3AB0;
	Mon,  2 Sep 2024 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGU2/0r7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43E1A3AAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Sep 2024 18:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725302596; cv=none; b=fh1HXShCdjOAjOZ64PbRF24+yI7Wcr3iGjSwfFpL6hrZMRQNHY9dQSiGmg8u4scoT2ygbbQB4s2V4aCKqomjbxbJovGbF+xPCNiYDd00NAqztShjlcaBqmfMhSToFQinkLiZnTGOEkqzyAI2QLG7GU5tlG+v/aIJN0QaiZuj8xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725302596; c=relaxed/simple;
	bh=1bbiaZ0NWXgadUCHZY6bnVNo9uK6o9FPeWUhkyQFo7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvagxEVSP+oCuY1yUl4yRHDAIr+fsBe57vfiMhmkSp2U6hcyJPZP3jmPspK7cadJHJw9WxXXlCxb2P6B/OdMoZqwTmjUyaPaTS4xpxNu7ZuWU7CdJemNz0uaunJS/uvjfEWtTEG0ODXp+2dgBjaRjAr1NrOuMRRConJcZixSRVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGU2/0r7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-533496017f8so6065528e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 11:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725302593; x=1725907393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qcoVRQb/pS6osGt1mWOLTNXwlWse+J6Rw0TSoP66u4=;
        b=oGU2/0r7BGPKzRNmjaEdTxuN6IVvKO8eFomOG1f8uEaX3ZnFtvSzRIipizfrvEx/36
         ecVnZsOeNSW9MoSZqYjOJgVdzTtrgiPM55waFW6iosgFQDvwMep9asoknpm0wPIMbezU
         PEVkyDll2z7IyHiOHvwMy09qNpjKiakt1mPtPe8TjxX4x5EZW9+ym6JlDnh9Uqk/lW12
         6lFQVthYCPDhgwdt2dO4GNO5cbqDA4jUoVsea7DsFrEpmNl4BATAvohpmV0ZnBSJMDjR
         isdWY6uagzNnP/ewr677rWLtDTzsvy3wY+c5Dwfrk5EPNo2RjX1MYkdu2zzXaeqvy99X
         Hrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725302593; x=1725907393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qcoVRQb/pS6osGt1mWOLTNXwlWse+J6Rw0TSoP66u4=;
        b=mEmhetcLI1kiO+QaYQtndooHU5it516vhtLSZwZuPM+mKSbByBsyzcI0TbPK1zOFDS
         42HHS8rArXh2A6wv9muOKJPgsYMZUtAJrUmqIXMumnKP6B/GUxTpXMNiBYbMfUDi5ccc
         9t22pfS/6s1mGSILj29mqshbO5i9QXVY8qtaa/YdlIMKyAgqeYaqDcl7M3arR/vTlgot
         eVxKziMyR8TJ+I+BBYMLa+UUtEsWJNaEZb48WjjflCb8G269PsLJzZY1BqZN7O7/AB8Q
         STvxici+1G7urIBYPvxSZQ2YfggoNLSCKP9l4Gbpahko3FWtx+4VwS7PtNwEsubxbM1y
         +2Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXFDP8jewR++/DC6BU+OlTQ6as7yser7SnIIUkLskH4kMWwCzOodoonPf5gnAbdbofIJAcCwBbRdBpwAh5R@vger.kernel.org
X-Gm-Message-State: AOJu0YykCQjdMpAEVHrY0k5ZfeASAsSCsrJMqXKEtkb2MSNdrNhi+7pt
	BEWCLV5klL6xnsWSKc07IpQEyUe1/YVPRLNggJmUKjOKH9XXV3Tp2D3AyaEz0m4=
X-Google-Smtp-Source: AGHT+IEKj8e0DGH0IXL1EvzsJMVmLAGBgaS9VocL7h1EUrManS+QZRdErDq+tnhJINDLOvsL3YRdDw==
X-Received: by 2002:a05:6512:3c81:b0:52e:a7a6:ed7f with SMTP id 2adb3069b0e04-53546bbdf6amr5700636e87.60.1725302592251;
        Mon, 02 Sep 2024 11:43:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540841332sm1715733e87.203.2024.09.02.11.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 11:43:11 -0700 (PDT)
Date: Mon, 2 Sep 2024 21:43:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
	20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-romulus: Set up USB
 Multiport controller
Message-ID: <ag2rteealf3j6ejc4mdixlinrgx6orhkfzpi6wyuj4sgq25azf@5pemq5ymn5th>
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
 <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>

On Mon, Sep 02, 2024 at 04:50:34PM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> The USB MP controller is wired up to the USB-A port on the left side
> and to the Surface Connector on the right side. Configure it.
> 
> While at it, remove a stray double \n.
> 
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
> ---
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 59 +++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

