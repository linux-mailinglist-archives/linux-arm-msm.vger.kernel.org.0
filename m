Return-Path: <linux-arm-msm+bounces-31487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A6975008
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 12:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4B21F21829
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 10:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0004218454F;
	Wed, 11 Sep 2024 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmbDiOe9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF6183CCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 10:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051722; cv=none; b=EnXLxcxNIbDPNSpZX0OQGvT3Hw2rhwgvckXnAj6BVPN06cXeowjgHxiSn9BfR+ntTsmVf+OwE4iNwYN/WhpvJzCJIP8jrpuA927ucftcr2pdbUb6NYpVjexu5tQTtJBsL3qBrZzrbhlOROrejOOeI6QgQBzXSUO2hOg1+fh1TVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051722; c=relaxed/simple;
	bh=DaYoPeJg9shuCtx4J1jS+goJUrZrFxkVlSXl6dreLv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMfZE5dY2cqIh/OB4pQQHRNlw50Gd37aW/gzkKJlWI5jwINNj0hvalCYIO0cFtlbK4PQSsYmslBpo7B4bIkk1SoNKkVuGs6EywzAb2ZbUzA3G4Er5wxYy6At/NegedlGCx9yyxXf6U9A66rIhtlGK+UAgSgzsr9CJUDUbuuaGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmbDiOe9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-535be093a43so2504753e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2024 03:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726051719; x=1726656519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfOyw78Q7NNMTmln4lOFjsc2BJzJJyhZKXZ24axVdKQ=;
        b=kmbDiOe9yuyvgoiqx/32ejPtvqGWjZURAKk6YLMJe2daVekcyqVMOXpN5MFA2mzKLb
         4dWwgsEiXKy0spk6c3pNMLDb7Z7a+HMrX7cmf6PxI+hzhAQbyZlUCrNH8XvFl22Ons9B
         rl83cQPlu6fFE/zPtUFKlLOupfaz6AADsDiSx0HTpyK0k4MoTLyn7XiSMaCaN7yWW/HT
         w2cBj1RKz4GLwjeCt+dhJZXA0fiktrYdsS76rxFl3PTnFQgds3IcNwnyEStyPo8wG96s
         KdZPgpAn86cwn2aEMVTeQP7iywE1c6bvC/ooHwY3a6d4sSuEsmpQC4FT5M6WwiRoFpTh
         jcvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051719; x=1726656519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfOyw78Q7NNMTmln4lOFjsc2BJzJJyhZKXZ24axVdKQ=;
        b=G0g+/5Gn5N1LU6vzDK+Vqd1Sr+oLwKYOhTpRFilMHk12EaUV2hYfiJrRJqr1N5cIwf
         VhZ6fxxbbK60MtSg0frBZOiQtG9lLbP2CYBb6ja+HybvV2ISMXrZ96ZVtPSMR6yhLCmA
         ZaE1kEGSBucn5eo3ghMPfVzZKE/LXAP/uvcrvfcIdnFmsVBjxnvMZfCpwV2YZL1Am7DU
         OZgjO0yXuji1ytWOJ+TWAZtU+r8xqGD35vqk9YSG2VxZhWwFlnHgzazeXRTsD14X6+dz
         m9b8C4qcyrcyAMxTva/cR7rc0wuddmPpxEoMDAVb9D0wUeUJrssUCzULo33HQkhcO+Hw
         73aw==
X-Forwarded-Encrypted: i=1; AJvYcCUUnHtLFojCIcTKB3dW+whPBoo4xmrCsaPJ78TBOS+b7Vd05hJZjIx/2E4I5fAl71z4VIB5yvLoF9kVz0uw@vger.kernel.org
X-Gm-Message-State: AOJu0YxwusCebJoxUaQqYi7i7DBEu55cvGTkHKeVqTl72Su6S7Sm7RPY
	JbytgLBbbGTm376PDlGvAIflvpJPnHLJ78An/3OIITfE/Jw5ArZgR2GzX3hXRPQ=
X-Google-Smtp-Source: AGHT+IFmPMxpL0sfW2aEQVWqW2rvHHyXYZsNZluRoWH8pk2J0ZkdsSyNGv+Nxad6h/EbFiV9iGvsOg==
X-Received: by 2002:a05:6512:1107:b0:52e:be84:225c with SMTP id 2adb3069b0e04-53673b6b445mr1852457e87.33.1726051718895;
        Wed, 11 Sep 2024 03:48:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f870baasm1520467e87.96.2024.09.11.03.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:48:38 -0700 (PDT)
Date: Wed, 11 Sep 2024 13:48:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@kernkonzept.com>, Danila Tikhonov <danila@jiaxyga.com>, 
	Adam Skladowski <a39.skl@gmail.com>, Vladimir Lypak <vladimir.lypak@gmail.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Odelu Kukatla <quic_okukatla@quicinc.com>, 
	Mike Tipton <quic_mdtipton@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] interconnect: qcom: add QCS8300 interconnect
 provider driver
Message-ID: <3xjvx2kwrlruhhxw4aald26qjf5fzikay2ypzr3mwv75mlmf5q@lmn2o64npfg2>
References: <20240910101013.3020-1-quic_rlaggysh@quicinc.com>
 <20240910101013.3020-3-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910101013.3020-3-quic_rlaggysh@quicinc.com>

On Tue, Sep 10, 2024 at 10:10:13AM GMT, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in QCS8300
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/Kconfig   |   11 +
>  drivers/interconnect/qcom/Makefile  |    2 +
>  drivers/interconnect/qcom/qcs8300.c | 2088 +++++++++++++++++++++++++++
>  drivers/interconnect/qcom/qcs8300.h |  177 +++
>  4 files changed, 2278 insertions(+)
>  create mode 100644 drivers/interconnect/qcom/qcs8300.c
>  create mode 100644 drivers/interconnect/qcom/qcs8300.h

The driver looks pretty close to sa8775p one. Would it make sense to
have a single driver instead? Or would it complicate things
significantly?

-- 
With best wishes
Dmitry

