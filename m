Return-Path: <linux-arm-msm+bounces-18304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F19448AE7B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 15:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACB9F28C2F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 13:15:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7BD1350FE;
	Tue, 23 Apr 2024 13:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lY1YWYB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CA01350CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713878097; cv=none; b=aTd3Q6do7fAI8c98E3AFWBI9Hl9cG0DO2ggW54nMWIcZJFJmMMGQPzjlAaJ5PCZ4DE7KTneVS/MWBbSktbd9Jpc9LWGqiOlIdfK6aWcS4D3KzA5FRpWvx/OEeAtolGv5ICyWKjriHz3qAcxKarc0S+Hx6Vbg1At3tEjpts8VAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713878097; c=relaxed/simple;
	bh=NZJdF448RrsCPNbeZK/mTKE+FYV/tNx8iYNQyTG8XM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrVIPVsjokJyiCfTtJYvwWf9IQMLP4wy0CTT3l3Ls2xyJs1PiyKqyDO0LPljdieJExUJs0SY1DNq1SsqCcJqgfrECKo+VIZVXFiON4z6p0olpn7iMIy0AmM4DnRsd7LlDWi0sh22DH50HHYG5MGfPIKHumwyqySSHAud5kYpIng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lY1YWYB9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so7359088e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713878094; x=1714482894; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsRbJyNM0CXnE8F6+OcG0OzXSZWaTx+tIqNQ0z6QZng=;
        b=lY1YWYB9jTD+1ad1/CdNtV/nufa2epV5mQKsP1BvZmEHlCjvSp121PKv1KuU7zD1dt
         Wav6euPVjw7B3POL6VwOX/zsn2NDRFXyQ1Anie8n5HIGi+56CuwhndNpyHsVozJDkbTa
         S2YM8zwny7q9zT/elAUJCeWBQBGWc7KMC8OzstNVLESZtZoPYko6Pc3wcAH/DW3ZSPv+
         xruN8anG/4ohpufTBjiFtdWQykYeEo9YJQ1amW19OgEH3ExiB6I7aSp3RJ9M4+2xwb6d
         9RDzDFhQESGNbVaJpjy1f203OzFcaHUEd7OD4DYP6+SnUg9vA32H/b04RVAj7OhmIYdU
         h0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713878094; x=1714482894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsRbJyNM0CXnE8F6+OcG0OzXSZWaTx+tIqNQ0z6QZng=;
        b=W6dTUefFWkZnDbSZhyphbjjSSUkAilz3ZAa6YKWpoEw/2Mn/7iW5kxET8bSY38kdhF
         kKuxkq5mk/65TGKJOsEGTf4S1FfLWnKN70NXgEJ+bspLBEHDF87Qxl/dkouEeotdUTsX
         CqN9TXMKPamEusWt2b1DHKLr493OHWjlE/SroPS0D7HJLVxJagOFEsCYeFC86PXiV0Yl
         4wwke0cgueDWMBRKF5+ijXjpbp/WBlvREtMcnHlMVAQhN1p1bFbvJw/5UL9Eg9tXWl2P
         qMxGIrE4G63rKEYxr9Gq9DgNK+2tx+Lza9ASb0FKAoIJ4v6yuzeMuhRZd7JOOOspOMQb
         42dg==
X-Gm-Message-State: AOJu0YywMGsNcyyGxqhlASWJBVKg++k0uVBZwyvJsw5wvLYfmwLhbgzl
	gvTDzNH/WjzJrUcOh95JY5+2tJnLFy2hPGGs4N7Gc3NB10+5zVLX4CwPbgqvlLA=
X-Google-Smtp-Source: AGHT+IEftV1iNFQoAzedq7/3dcHwNw0WwRRh8jVLELtQAgUWXAt4it0wfg6lRuvpZy+z3o3XT9J3Tg==
X-Received: by 2002:a19:8c5d:0:b0:51b:18a8:4cb1 with SMTP id i29-20020a198c5d000000b0051b18a84cb1mr5142819lfj.27.1713878093986;
        Tue, 23 Apr 2024 06:14:53 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k8-20020a192d08000000b0051ac9a297aasm1530900lfj.141.2024.04.23.06.14.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:14:53 -0700 (PDT)
Message-ID: <b46b8cbd-1d58-44dc-9aff-ef11d9cb7d33@linaro.org>
Date: Tue, 23 Apr 2024 15:14:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] clk: qcom: camcc-sc7280: Add parent dependency to
 all camera GDSCs
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
 <20240318053555.20405-7-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240318053555.20405-7-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/18/24 06:35, Taniya Das wrote:
> Camera titan top GDSC is a parent supply to all other camera GDSCs. Titan
> top GDSC is required to be enabled before enabling any other camera GDSCs
> and it should be disabled only after all other camera GDSCs are disabled.
> Ensure this behavior by marking titan top GDSC as parent of all other
> camera GDSCs.
> 
> Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

