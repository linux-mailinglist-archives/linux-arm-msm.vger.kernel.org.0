Return-Path: <linux-arm-msm+bounces-33543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F39BB994842
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CC6B1C20EC9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7681DDC06;
	Tue,  8 Oct 2024 12:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VhP3Yqcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F3B1DE2A0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389458; cv=none; b=u9TtCmTzb/vLxwXPxc+MVYrAhk4vefREDOn5T1nW60jgFd1Q0R7OALVLHnXNzRRQmVVenm3TN+UghZN2r5iStowvCKy2MplL4kOgg8iYbQDPcnLeMJoQQ2kgGdRNruFlw0IvgAccsc9lyathXGzEPDf41zt495n8YZHnAL0zRFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389458; c=relaxed/simple;
	bh=R+qpWwcAYfeoHXoaJECFIuwVXiJSoywdmJFN7YXdY5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dT+4Iw9Bd98OhvX8cRrT9vBUeD20RyaUlOk4irDZsPUvClEKINZ0Ypwn/FLJXTEMBkkGLy0EjBs3ernDy2yYygwN8aGAYyDEtgKUN0CGCs92Nu2UGZ2KSO6zDBb7ImOUU9wPHkMLLm8ptNe8zeosVzGPQgt2HDMS/v+rR340Z6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VhP3Yqcy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5398e3f43f3so6356876e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728389454; x=1728994254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6rjAyv9sIYyvpctWeWeo3qeKI/L9cQNis1SHnCFRTQ=;
        b=VhP3YqcyGSviKPpLxOJvzimZg3q9oSpJjzr0kuKPmLt4BdYpT7te5dqSpjbfMYHiGZ
         SUBWyn1ZuFjs+rD3YZppUkaPq9bN4B5C/bOVM1r24JsdXIVUUMRX21kgVNJ6CQLM6u5T
         j4+zL4a+q7C3++w4FeCgBcCMZAw+OY9R1ZKiVO1A0z6CpvWrbEA+slMKhHBDQNCEAmRO
         2Z7S24h5G/U/d3p2oJKSNKN7h1dVqfJZre5plqjjoEaTXDC75x4mFQV1VjNL15myZov7
         z0Isrov0Kc4CLhBnlCLhSQYMFOWqkAJw3lD87ExOUgdqKYVR1zYK6mla921prAdmaT/3
         bVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389454; x=1728994254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X6rjAyv9sIYyvpctWeWeo3qeKI/L9cQNis1SHnCFRTQ=;
        b=nG3L/A/fxn8QoJDt+1RmrAye+LghKf2Td3tY5ige1AlLTQvKFHkDdTWUbk7nNJ7p1u
         w5d1kQHsMLauWmHgnKQrOrfw1YFYow3C4CQHpyye7JkrzxoTOo8jyde/AOSpwQpMtFaC
         QHiIjKYZ8gN2e2e7QsXO6aZsPhtGN9ZD3g9t3koUAFuYD/BjcQNoQGsGpoqghL7jhGWY
         Gowpn2wcSTOW8eaZHSBOueVXrxIr76lOG6DSk08wTrqGd0c4XqynhSCg6EO89Sug02Dj
         H5tE2OFTkdPcVqpJbcSNhoQSM3ycRva5csrg9dfzEBqbYtg7TT/ymD/UuOPO84INIWbN
         hkEA==
X-Forwarded-Encrypted: i=1; AJvYcCWDvQ5Xu1GKP61DryrJoIVXLv8K39RhSzmthtfNMBwJqDIJMgCk4L9TaR6K+rjhFpducPw+AOb+FmQmLJRA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo9BPcwZPDrYPuF5RI/lr4RbbpnPNgafUIbx6PRo8dDavoh+lM
	yZpL5fK0rQJPimCbE4gF6CerjGRR7kl7Chw8/TdRM5OXG4ONIHGTpsZTSa5fYSM=
X-Google-Smtp-Source: AGHT+IGVgFuWo2mZ8jgAZfC0G9Eqy3rDt2mSCGU5ZGvGqx6CyOFKBMNNM5kUT+/FWupXT0IvX/2y2Q==
X-Received: by 2002:a05:6512:ac7:b0:539:8f68:e032 with SMTP id 2adb3069b0e04-539ab9e421cmr6590174e87.43.1728389454147;
        Tue, 08 Oct 2024 05:10:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8297sm1175215e87.78.2024.10.08.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 05:10:53 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:10:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_rgottimu@quicinc.com, quic_kshivnan@quicinc.com, conor+dt@kernel.org, 
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM
 SCMI Generic Extension
Message-ID: <hxfg6ztpqy7qdsgzhvvapeyh2f55mj7hhuqqkz7si6g5i7nsng@xoyfwztk66aj>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
 <20241007061023.1978380-2-quic_sibis@quicinc.com>
 <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <q2vuiru7sqetwqyitg7azgqg7kge622i2zgq52b55zivwtbev4@4qgzb54xjioq>

On Tue, Oct 08, 2024 at 08:49:27AM GMT, Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 11:40:19AM +0530, Sibi Sankar wrote:
> > +/*
> > + * QCOM_MEM_TYPE_DDR_QOS supports the following states.
> > + *
> > + * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
> > + * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
> > + */
> > +#define QCOM_DDR_LEVEL_AUTO	0x0
> > +#define QCOM_DDR_LEVEL_PERF	0x1
> 
> I could not find any driver using these. Can you point me to usage in
> the drivers?

It's well hidden. These are the raw values used for DDR_QOS memory.

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

