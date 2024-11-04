Return-Path: <linux-arm-msm+bounces-36920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683179BB327
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37D42B2475C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562AB1C75EB;
	Mon,  4 Nov 2024 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0bS7kYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854E21B3957
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718770; cv=none; b=MsxkVfUloQP42lLwrz9nN5635nAS9au2lKD1LamWYNRIJvlkbbtqxKvhhj/gnZDd5L3HRYpZUy9dbZDsRrtO9k0yzLIyw0GPb4RK70Yxhuijcm9SBXgKl+VO3CssNaQGIQERop4xItvHpxRw5Bw2PXd3qzBHgGl3G6l2wllAW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718770; c=relaxed/simple;
	bh=gs6t6Eyxm98dLeq+rr3RAZbz+zQJFNGOTTWK4uTfMFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyWnxPejScU+4Wiao/Q9J/OKndjGtzAr5gWU138JIGRukjfITWIvJszOEHbxmIKuUkEeW37uYrBO8p4LpBGibAht7+LGuZdo0DNxI4QT0vaxyV+0VuXl8hsFalxDlipujO3ioBqFxLpqtrJxahmtMKyOizoDbhFleuj32a1m3Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0bS7kYi; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e59dadebso4756771e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718766; x=1731323566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EAOjh0XmDxTvZHf6jM5CouCO0muUY1p/Q5Sn/b27kuY=;
        b=V0bS7kYisLOLX9F+yBtVlE7BZrJcJ7Bhj3KCJx/i5M6zf/4Cpt3alIwX2rJ014ZoGE
         TfsAnL0LvLDtT31EykZkwMe7lX8RlofC6yCa9OeqNyiHGr18zDiItYyuq/11t0k6HlHr
         jFfB7BcEfdbQeutPHuVc9hTzoOh9E8sm9pC2N8o3QD/lWwAt68Mtw97hJFBPNm2XJvzw
         1fCrs2CJYWWz9qRrKMkGrxisxAI+VGR+GoFjAYG0iLHNNPzIUB2GvsVvH8sRo8Wl6lCa
         krQMXDqf5DzD/09thVMp1/1kmpk1BwrFHCSvR6UZK/Q0AEN6HujoYT36I78vMEgN0SQp
         7K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718766; x=1731323566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAOjh0XmDxTvZHf6jM5CouCO0muUY1p/Q5Sn/b27kuY=;
        b=LEW7hzeTa2BpvMY8g4TrcRrS1yCgOMeZmsZvkQvcG2PmL48TEIoZJ35IwvsF6r1dte
         E3p9AzaWdnv+VCKKmiI5nepv3lhR6UuRxL5hvJd30EYFe8TpCBf1vJ6dykQPqwlMKP58
         G2qoWQ1vozP8u2jwM1iLHpX9jt5LUjKlIo7+/sHWWQaqfQzomQ9ZpafGgHfqBf1KjGOw
         AfL5I6WgGN/TScGFlz0zcvxWG/BNdSCYHsdr+RrLdVpedRU9tiI6MmcHhoqFS0ODcZVe
         6MMAnrTYxfNqO7DxcDBkQPsj0/slErwO7kdlzy8UoGgPS6GefXPATifGZpClFNuD6hRY
         +uxg==
X-Forwarded-Encrypted: i=1; AJvYcCW7GqZmdlFJyPpQcA5Ceazm2p9XJY3fMTspT1T8DIsCFxGQMWfg++iGK1sGIfx6bKYOUS1J0HceTn1kyZs2@vger.kernel.org
X-Gm-Message-State: AOJu0YwSsOfQl+pMgEdBvCkbsncmRysuSzNtdV4cS8834haqiHV6Jlna
	ZoTaAclhwuXuLUgjBumI/uIv0hS/+/Hahrcdmr3g6IAuSyV8MBh8s3komXl+ehw=
X-Google-Smtp-Source: AGHT+IFERsmNqkBWoMxQMqVbgM8msMLn9Gwm+rxaCEVGy4NhlS9KxmbTI5MDNM4EpBz5eSZ7MN6Z/A==
X-Received: by 2002:a05:6512:3e14:b0:539:8ad5:5093 with SMTP id 2adb3069b0e04-53b34a1943amr12925158e87.35.1730718765058;
        Mon, 04 Nov 2024 03:12:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce5c8sm1644055e87.141.2024.11.04.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:12:43 -0800 (PST)
Date: Mon, 4 Nov 2024 13:12:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: add base QCS615 RIDE
Message-ID: <27d2gjvgr7ajaf6ouk5maxhp5cms6c5z2wmybfpbqytet3lva2@4lu64yki4hyc>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
 <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>

On Mon, Nov 04, 2024 at 05:10:11PM +0800, Lijuan Gao wrote:
> Add initial support for Qualcomm QCS615 RIDE board and enable
> the QCS615 RIDE board to shell with uart console.
> 
> Written with help from Tingguo Cheng (added regulator nodes).
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 219 +++++++++++++++++++++++++++++++
>  2 files changed, 220 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

