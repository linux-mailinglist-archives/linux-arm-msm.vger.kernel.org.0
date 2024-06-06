Return-Path: <linux-arm-msm+bounces-21904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B991C8FE4FA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 13:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ECE11F22D59
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 11:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1BF195381;
	Thu,  6 Jun 2024 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tN7D1biM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AAA1870
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717672487; cv=none; b=L9TaL0GqKXaI0MuMc+rvvZGARviLq3sdUF7ueiyUCKDclT8Xy/y+Hjc2gADvuG7DGm/lSMw/xX5WI41uAo+VqNs3jkIQVwXLiOQ2VhkHW/YTfiZVokiegNTULoLWr8W2GHWcERlLaGW7uo2Nu8Vrx0LEys41JSivzSY/Df8HP2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717672487; c=relaxed/simple;
	bh=4OcKRZeubzftDOHF+PuyddVmW/pjLJTY+1r8WmH4zXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLdR1kmknXYPGAapJANHIDd38RdzL9UnoetoJnNNmbjhwB+jx2F8JrLehte4Mq/a2T2WMQ2rFWtj2TXoerLa0QKLJsF2wfR7Gg3BHV7bCDx5Ou8K8xhSNDQLstAFm8tlap7PkKC1l6Z9RSxr24AtUK6b6hqoEFOhJVv+dywZDCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tN7D1biM; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52b894021cbso1112064e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717672484; x=1718277284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pvSzGDf4yqX94jo6I3edAV4suUv3MXjnruxR7ZvygcE=;
        b=tN7D1biMEQsIR94IFExU4wi9QwfcFNT9fqWh1MTpshXgiRk2R14Z9olNgVShKVHV/l
         TWSQsx7OJaMp5epj/c9vF+QH9gqo1EaT44xt5uXS2KUJtl9eit0swhtnGWrcArkTraYO
         4JKWH8aQtl+2O4dwOEE8uYXykp0+ZrnTSuqMtHaXPg8xdNvZJnuh/CEtNVKzYxhmEvOU
         LgYNW6Mb1PRZ/hC4irP6bfGHRyewu0cwey/6pxtHSoAkDenOQasY+48rCf1BmnbBTiZr
         pwqWjy1U/SJryKfJB3Pw3sxZV2igcNP84Qd9JWyjTSMbA3dbM624/DTQ74/VhxD7m3uq
         WvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717672484; x=1718277284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvSzGDf4yqX94jo6I3edAV4suUv3MXjnruxR7ZvygcE=;
        b=H/IjxvwI+Kd9SHmqzKTMJhXIbZL0d+J2CbfXUO6JUSMoWn8DSaLYzsQYRxJXCsMxbj
         wCk6gqhfdB3VCww1lB3l7vl07IQHJSg5xoCVTmX561qd9bW5mvWTQTisON5/IjESEhlJ
         5mEeqmP7VyarykEHjzvrj263d9Canr3K1i7XCCRRTBu/DNR4Ee/00QfQ7Bifj0CcSHMu
         QwwSKnrFgwggiR55TVPem9oUstYVXwW0uKW6fBMmJwJkhfKu0AeLnsA2w+7YxQWgQGhD
         pi9dc/3CeTASJ187yLJ4f/5QJmjY25M0qNELgDYG2xqf5oKrTZc8BPjDDxV4mF8vQ4H3
         NZnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJLxuv66koB4zRnrbf4zexSigYv5GATjfmwWfOF8/pusmZDWnhkDQw9M2DRhs5wM2JZmvk0X9TRlOrHBQhadoLSc1zMIrHXnpVli4SFQ==
X-Gm-Message-State: AOJu0YwqeHVDgBW7dIlIj/Ncqk0m8M93et88+c4pWpcybeCC3cYokgrZ
	DDH4kqcofqEU5anP5owVjZzQXrlZFGhRHdY94fP8q9L7pX+wxncCLxtlP4+S1vs7+MEV6HONVKR
	d
X-Google-Smtp-Source: AGHT+IGwSSbQWF7LVxCdAZUUnKUh6JuUpUQHS2aBX1FqqgDbxBuwGRTyjAMQJ+TaeKBl9hDknGwDWQ==
X-Received: by 2002:ac2:544f:0:b0:52b:6cfe:a21f with SMTP id 2adb3069b0e04-52bab508dc6mr2965699e87.69.1717672484390;
        Thu, 06 Jun 2024 04:14:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb433c8e2sm164741e87.260.2024.06.06.04.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 04:14:44 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:14:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-qcp: Add pmic-glink
 node with all 3 connectors
Message-ID: <kgo5oeqcy7h4ejfbeowyhdjvyi6kd3eztohybe5wwrjxjlceua@ynqxsmafbuj2>
References: <20240606-x1e80100-dts-pmic-glink-v2-0-972c902e3e6b@linaro.org>
 <20240606-x1e80100-dts-pmic-glink-v2-3-972c902e3e6b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-x1e80100-dts-pmic-glink-v2-3-972c902e3e6b@linaro.org>

On Thu, Jun 06, 2024 at 01:41:54PM +0300, Abel Vesa wrote:
> Add the pmic-glink node and describe all 3 USB Type-C connectors. Do this
> for USB only, for now. The DP ports will come at a later stage since
> they use muxes.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

