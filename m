Return-Path: <linux-arm-msm+bounces-16781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC6E89BBC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 11:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CC881F218B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Apr 2024 09:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7006447F48;
	Mon,  8 Apr 2024 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJ2iZZN8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B766FBF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Apr 2024 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568866; cv=none; b=CKUMDii4Ams4pjWk04k8NEUz3HSgrKxHUlYTlDCItZl6HqRwwq/keTpFzg2kPuQXq8GaPvRSp+SKiwvHUf5nYnjUtX3hJNn559GonR+pzMl+IfC8sbQZC1poY598pwreKNmiYiC4A/HTfhSIx97HReqDwC9mFQaps3VamPA1CiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568866; c=relaxed/simple;
	bh=jVEBoWe0mok+ita+GP0jIRcLrJNCSnNIFQYdeB4TPlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWY3JGVFzKpousU8HdbDvaWHzlaL8dpF+COOWHc6qMqqamzv9ecXRt9gSxyWIrw2RzUATS806uP3TOgghpTu6J1bnJf+mgepAyJDFdnO63bC8w5YcYqDROu1NiCER8FRyAlLB5m2isbxLbDYeVNi0Fx66iTeTgYKb1qAsyvLYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MJ2iZZN8; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61587aa9f4cso42458377b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Apr 2024 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712568864; x=1713173664; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ccdZGemQtAOmH95htQ33GvCmGD7g1WiaWWMlzba2fiM=;
        b=MJ2iZZN8HBc5vtcr3vfCg8JXmFZo4FWwVC+/up+QVypwah28G/aydLWDAmCmAt1Pd+
         Cv0FQO0k/e66F48/83NCfRfmpr4G5sC2O4EP+qYKm5XapotU8E4Fw1C4mPYBlCGbjMru
         sjRV2HsbdZwfhfNEbHeLItY3/bQhiAmkMuAb4mWlBm12o5z7T7FjcHoYmUOhu23mVrXI
         SG4FMEjBapsR6aodwYnnHXBNPUoXc9HM0NcYplj752PRwOP1tVq9JRqE3+K2eDw7Z7YT
         YZ+1UuC5wPBEWZxAQ/kAgvJlj5YmMJbJS6BPKeA7Z3B4bFIEHoEyVsYTkrNGK6BYWsuu
         33mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568864; x=1713173664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ccdZGemQtAOmH95htQ33GvCmGD7g1WiaWWMlzba2fiM=;
        b=RDKZdgrRLpVgV5Bmj4MQ/0FgwzmlPh7UUr4nlgVMiC94dWr187do/7pAsOOlI3jmMj
         4nWWmT08yXlSrTEumOl+TUR4m3s+IKNo2iEzx9JxkvUmmb0IApneEesGrS2k/NtEabTg
         ivOBGA2CXla2jjW1DIM9t0VL0k0T/jaLHT1Qd2nBvwfhkP0HSNeKy8vVFbzkrzFYGr5c
         9uEMPr0pmsawPm9f32uuFpaQBQzKQqFMC4cMYm8ovoxHMRd+j/mYxdt0bDLo11DQ6MEa
         AmLn55vUtC8G0Om+Ii2ZDh5j543Ut9O/paLhcWlOtlg2cPeJRkzsjhmrTHBginFAGVyM
         8idQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOzS2C//+aJ/WAWphtm3yJuy6LuVEiyu1QINYlkgczw9/ZkV3wAWvp0wlwRsfdq+lUHP3d0m1kBCEpQurLmS6KyHpGqWjUDbSWogtR5Q==
X-Gm-Message-State: AOJu0Yw7heeP8KWtId1G2kPq5of4NjFjZcnL24Dveii6JIJexlcDhG0W
	0Ra7vrJePys9EM8GqjUMmoSgsTJIDTJ8wlajQU8LRy5FS36DhumZXGzutGuFbrd0hzyL9QMQIK1
	K5H9rJWTRkuy5l77lFFU/WQKVFn9mFxwUP8T68A==
X-Google-Smtp-Source: AGHT+IEeD23qNLKI4LzgG0ATSfJAy0faf9nFICLsUBkFLtFuNSQXk1zU83q6cji04DCofUDq/+oONg6lZ40XGPwiIJg=
X-Received: by 2002:a25:aea3:0:b0:dc6:d093:8622 with SMTP id
 b35-20020a25aea3000000b00dc6d0938622mr6172768ybj.15.1712568863856; Mon, 08
 Apr 2024 02:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408093023.506-1-johan+linaro@kernel.org>
In-Reply-To: <20240408093023.506-1-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 12:34:12 +0300
Message-ID: <CAA8EJpob42m4p_REGyjpM2KrdE02x91pGgCLGVhpW_i1vXSScA@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: fix VCO div offset on v5_5nm and v6
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Apr 2024 at 12:30, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Commit 5abed58a8bde ("phy: qcom: qmp-combo: Fix VCO div offset on v3")
> fixed a regression introduced in 6.5 by making sure that the correct
> offset is used for the DP_PHY_VCO_DIV register on v3 hardware.
>
> Unfortunately, that fix instead broke DisplayPort on v5_5nm and v6
> hardware as it failed to add the corresponding offsets also to those
> register tables.
>
> Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
> Fixes: 5abed58a8bde ("phy: qcom: qmp-combo: Fix VCO div offset on v3")
> Cc: stable@vger.kernel.org      # 6.5: 5abed58a8bde
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 2 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h | 1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h | 1 +
>  3 files changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

