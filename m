Return-Path: <linux-arm-msm+bounces-34581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F099A0773
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0236828A340
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38732071F0;
	Wed, 16 Oct 2024 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jiufRnGf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3407206E66
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074625; cv=none; b=KZpdDVNpnzGAyxhjplrgAC//Lq3PuBsJUsEAOZmnVRl0b7ARXnBcPJQk4p3WNsu9qz16Bn7C0cOEilgIY760Ji5/x+O/VlmB180QYYDE9Aik/+WOZNr7wpN0m3E5ZIUR2WwoMA2vC/SAts2Xu8ZXzKaMG0wl722/j/mGu1/Xajg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074625; c=relaxed/simple;
	bh=cyr6m4C5QZsRM2pYWRxQJ3eSbG7DNnMjBSxrQH/7QT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiADA4ZNM0rEWqiZEmRvKTrFawwH38K8FQhOMXfmC3MDFitoL04oQW7cRJlTcxN7LDEsn0Ab7VC4Q09VxY3YVT8KKQbDbHwe4FJzR/koRL65bcGyIkP5oclT2Z6PfayGgp6CnQ+mwNf2exXPT2aYBgKP8LYcAuLCO1kcmGzPM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jiufRnGf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539ee1acb86so4227781e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729074622; x=1729679422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQSFPeENDoENYpbyNxZoNIhCobJqeAT8wBO30SKoc+M=;
        b=jiufRnGfZ8HH1cfS5XrFdkyZrvWJojCRPhG+aej7liX8CkvOCpRdQ8LyLUjiBKnr82
         sBnqPXBxGWyy1ww2Dvfd6nVkd+26smWtFgqI9dCfCUkoMYquBdR82alERjMiOfKuGypY
         EIGGnVdsgFTP4Hw4i3us6dbQTWUhKPEOS3XJRQgD/fshZrBhhyFE5R3zS/X7QJp+AADM
         P3Y2vXnSS4Y+86X8avdMq9SUgjk04o5qDRLyVQC1Ny00T8gdkmEz1C3v7rgtO7gblVVc
         WrOa9L1nAN1PrLBla/tEcTNzJx7CJx5OBRl0qFtlhz06zNs8VXtq3ffvn1qiLqH6D2JE
         LmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729074622; x=1729679422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQSFPeENDoENYpbyNxZoNIhCobJqeAT8wBO30SKoc+M=;
        b=fsShVFlSIk8US3rTR633qVHvPa2stiM0pI8XhURmxobvCHIjybNkpcb8QzU04Bqsu8
         +HZ4R70jFPLBMf9doF2g1TmvlgniMq0y+d26Tjgwoech9WrrvHFeEIKfxc71xIhXM5zJ
         UWRciTUlKk7dp4O2ldlBOUYl1yB6t7for7npG9SGmNjYooZMaM/nmmYXGfOeggI6SZMs
         6R9E7IYIK37UTdEeKKug7godlAG9RBd0QjpednTmV8hz2bRIFsjC6TBeu7tAZFXfdwDg
         6O+pmunsH+21HmZukSIpb0ECjGrRsif/GgywyY+I3Qg23q05ogdbLX7XWFSIQ0MYC/z0
         69Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUkwdWL57JKnNY/G9rgSuH5sAehetrJl9bt2Czidr5bbvmcTpH/6/H/SirK/0vpeyYqQlShfRdWebhn0+AE@vger.kernel.org
X-Gm-Message-State: AOJu0YyM9jr14kKTHsDXrhloXZUmA0pSNQkE2wupzKGrNfv3HakQZqCQ
	hMpxmIfhIoanWdstmmvSCWQOKmNdWrNBSXrCJuLFBX9cxkR9UFxSqkdjckG2MaI=
X-Google-Smtp-Source: AGHT+IFZU+MCWROhLS2WtO9kRlICAepTgZYo1pzmmsjqkteB1I5eUAuhrTa7pnapdJgkfLAB/FLp8Q==
X-Received: by 2002:a05:6512:a8e:b0:539:a924:74ba with SMTP id 2adb3069b0e04-539e574c7b6mr7157088e87.56.1729074621644;
        Wed, 16 Oct 2024 03:30:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa9441sm418092e87.56.2024.10.16.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:30:21 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:30:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: add wifi node for IPQ5332
 based RDP441
Message-ID: <gnv7i3m5ooxtyi4ywgq4q5sq3wj6j7xtjx6puuixoulypeiwjo@65wfj657x5ug>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-3-quic_rajkbhag@quicinc.com>
 <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>

On Wed, Oct 16, 2024 at 08:58:25AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 15, 2024 at 11:56:17PM +0530, Raj Kumar Bhagat wrote:
> > RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
> > device.
> > 
> > Describe and add WiFi node for RDP441. Also, reserve the memory
> > required by IPQ5332 firmware.
> > 
> > Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> 
> Don't send one DTS patch in 22 patchset targetting different subsystem.
> Imagine, how wireless maintainers are supposed to apply their bits? 21
> commands instead of one command?

Huh? b4 shazam -P 1,3-22 should work. Or ideally the DTS should be the
last one, so applying all other patches should be obvious. As a reviewer
I find it troublesome to review bindindings / driver without an actual
DTS snippet.

-- 
With best wishes
Dmitry

