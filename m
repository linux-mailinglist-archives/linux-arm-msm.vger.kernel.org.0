Return-Path: <linux-arm-msm+bounces-17734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0398E8A8AF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0F71F23DCB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 18:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE12D172BCD;
	Wed, 17 Apr 2024 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bcKr//mH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44230146D7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 18:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713378263; cv=none; b=GRop8Ujtz9nZPAHehrAE+VgRoi0qaGJIbk9UYlpuNarRilHYMXQLK8t8gQfA4lItQnQTvm4ZZZgN4nqac/NNzreufvPX/Be8cQ2Vx6BUclgsSHg475h7nwjGssC0MOASID1RTqsyf7gJDtfFpZlVrCBuqlEKiicUObbTtCwBacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713378263; c=relaxed/simple;
	bh=Bom2TXNGEYr5lUGFhY21H+Ny60Z75gcM070ni5zqxso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iakdi5XfZHbV5e3AsHdzy9N2cYyu/YJ0uIDc4euVCLe7VxFDUGLBBvJL45H3KX8uSuQUA8CSBZW9bAc2M5GXxwQCbm2LKAiPmIrY5ldAWa2/A1L6msRaL/CUb24cm7TvwHYfUZH0dFI9OSI4acvtW8popn/zQHIfUmq1us4mjWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bcKr//mH; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de45e596a05so44550276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 11:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713378261; x=1713983061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wbBYw3GS4uodkC9UhlGoaV3hresTIfXPy+XD31Cgwho=;
        b=bcKr//mHmqgYQTHJWVhRoDG8GG+EBllXkrn3SiOJ/vsenIVE8uhK6I9lAnK4LyEM/C
         zVC6zhkCEv4A6rKlMc1/WQmu25oxoMWYF8wf3OHnmyDajRaMfRtXqQp2OGXtmJPsbdUq
         8zRAderDSAubR9wkYmb4keNdEypDzpr6J4/j1kTGdvaGvGr4O9D2M7OAbA2bt9nvkV5Q
         UvygrHaxxm+gEK96OA8l+909EOqiffjouPNwwbyAJNC+htDm5aInNT0vt+vYapM0nh6y
         3A1wSKZvQWFoBkouwrivnstH7LiP7SOy3e6NtORxHap9/+jwc4Z/lc1CGBQzw367exes
         0lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713378261; x=1713983061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbBYw3GS4uodkC9UhlGoaV3hresTIfXPy+XD31Cgwho=;
        b=ufC1iIWhhwT+K8E9TWuQuXgz1FQmJFq/cxHa4O7DruK/YwGgczmoffEa1FiPYR6M5m
         sX5RgeQQJY9sJKPsU4goFEr1N+CarcFqAIuk6GGDMNnvInwwGR+zyKKtFXSfVFs0mNvF
         Xl0T0CdyO73LrkecHmiwi02ATwmDDsJWlMSgPr0nFRc29EvW2s0082Eu9dyPVGs6ZBtg
         5Swv2AjcBMv4INpfezcTyNg09ZZ6Un3XS1f0N4o/zHEj2uvJnD1Qt7PpJlJfqFdfCOwh
         IDHJPrNVBnikNh2R8yVbQiodOZ1sOJQD3ERCpKSNx6a/n3RPYlxVoD/Ik2awQ2xMI4VM
         9aPw==
X-Forwarded-Encrypted: i=1; AJvYcCX/SEsdN3wOT+mILDe883FLAqOfWrWMYim7TusGeektj9dBCmVa8lvGEpi7Ny65buJGcHit7s8QMmHs4qVNaP+fBKNZZMZ8hUb0iPYe6Q==
X-Gm-Message-State: AOJu0YybTBoYi1a5LkZmj9RbsugE2oN044X20yoBhxYWF369F+J9GCeL
	IFXnQ3EWRFTKSSDca0PRrol/xBluRU1KkqW4rqJsVPtOY2axTqfjY9iSRoxY99h0D5c1dwf3hm6
	FHl2AW1mxm7NMtXPEJIi5womCcRPliBkxkZuwhQ==
X-Google-Smtp-Source: AGHT+IHHNONy71cySjy3MSKDmtVHvXqanJu+prl/oRyemyL9jS19vxHG/wWUHIq+2kERXydhw5hdws2TBl8ifZE6CeI=
X-Received: by 2002:a25:780f:0:b0:dc7:32ea:c89f with SMTP id
 t15-20020a25780f000000b00dc732eac89fmr144726ybc.15.1713378261334; Wed, 17 Apr
 2024 11:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240417120928.32344-1-quic_kbajaj@quicinc.com> <20240417120928.32344-3-quic_kbajaj@quicinc.com>
In-Reply-To: <20240417120928.32344-3-quic_kbajaj@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 21:24:10 +0300
Message-ID: <CAA8EJpqhHDSz0iSzg5zze=caGo=-Tw1Ycy6c5ThSc+8+GHMu8A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable various remoteprocs
To: Komal Bajaj <quic_kbajaj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, quic_tsoni@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Apr 2024 at 15:11, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>
> Enable the ADSP, CDSP and WPSS that are found on qcs6490-rb3gen2.
>
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

