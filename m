Return-Path: <linux-arm-msm+bounces-12140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DF81385F390
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 09:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8072FB212CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 08:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E899837168;
	Thu, 22 Feb 2024 08:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PapNwf3y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F6A3715F
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592136; cv=none; b=AOgA0VTmcLBJ7QmHldtUdjixiMMuN/2Fse6lfy+wMwklNb91Oy67xM/xM9x0MAx80faUWeHeucEwA/nIQrxncFuvXWduKWeyv2zYAu05XQk0CrxiR1m1J5YADsdKKl9AaqIS+a1G7BSa+pwofbp+h56UHSZsaDY23gRvep4nTlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592136; c=relaxed/simple;
	bh=FjEV8hE5eZcXGtQ08yUqG4aewSRcZQEUdUXoAZyvLdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOK2M5wa+fONA4BaUAL20+ZWOXkBVJdsamM5X3GJvowWoySFqA3Y2bRx/ZzCbn63S3H9koOATGyLHUe7I4okgV76BwUM/eizB+s0yqBNoqLzbe7llOJhflR1QABXacw7ajMrUc4h6bue5gfCIbyBkQJ/64/8Xtweu00E5GMROQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PapNwf3y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512bde3d197so4266860e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708592133; x=1709196933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvafyN1Ki3gtTTRQp/+ld7EIImwoKNgmY7mZr4vWUK4=;
        b=PapNwf3y537Ms/L8k4eX+lIusjbE8m+RODhEiY3DAcffEEw1EQsrNG+6fbKIe9EyAW
         tIA45Lnl0v3HXhAbk4xOFyxtc+fv6xYtw106ggEykTsnmy8TakKtbWGpfkaiKbMjrYNY
         WsYM6B4j94DypUhEtw+ttyTmcF/hXFFIHEw0yRoHo8AHJQ4GdZCF5+zr6lp97ZC4ZFf6
         AyVDGex46/8PCDe7Q5y16MZUzdcKZzYe29pKlZA3knz9KU4s0zDkXTtuE2IiTwiRSu+/
         ffWo1xsBfSfdRIOY5WuNtaiAEjHaT9rwk9+PGKD+b9E43izvMczaPA41jjzuIO2sT2O1
         nZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708592133; x=1709196933;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvafyN1Ki3gtTTRQp/+ld7EIImwoKNgmY7mZr4vWUK4=;
        b=Y0muCmMffZlM+PfCpJIPS9E0TueI9Zei21Lcz8knvpDPc4K0csdmCcn1L+ZngEe8xx
         +XPHBQo6jEDzxDimu5XdgWXjb44/LJpMbDpZHT9aVQdpsWV1RH/4ck+QkBWJ6y2KWszr
         WRPRzr/KyvCBkzcKK4LFrab3aYvvEAmk8S//XXfMJqyZJ/1KMJGlaPQLaU56XE9LTC+T
         RWRbAJ/jBoO3LouwV6jK5XkDBaVDp0tJxHcce8QdsPgo1f1LJhS04jVW2XksyUdcLfBy
         zzRbxrjWMEvlXhIA+YATShmjVWP/sseZXDqgLusTlRuxcB3mdfUoTkMguhrAkH/Et8GB
         qK1g==
X-Gm-Message-State: AOJu0YwxZCyP0ZsxHOquCCIxj76h6XIBWzdfl5bFRRgwkHdjkjEm6FBx
	fdQec8avJxdfXXNT4siYJsBNcWH+ssVtLNn+YApsT4R8y5biuVva0q1LSYBOH5A=
X-Google-Smtp-Source: AGHT+IEtIiogO1qg0DsIHuHZDJdmbDgFoql2wOjjQ0dHxEtTw/GBno7cWP1Jf8NhMK0pYXBLxrLr8w==
X-Received: by 2002:a05:6512:128b:b0:512:d8fa:a0f2 with SMTP id u11-20020a056512128b00b00512d8faa0f2mr1752378lfs.22.1708592133207;
        Thu, 22 Feb 2024 00:55:33 -0800 (PST)
Received: from [87.246.222.6] (netpanel-87-246-222-6.pol.akademiki.lublin.pl. [87.246.222.6])
        by smtp.gmail.com with ESMTPSA id b6-20020ac24106000000b0051176ff32c1sm1992022lfi.62.2024.02.22.00.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 00:55:32 -0800 (PST)
Message-ID: <dcbf0e04-0252-4cda-be1e-ee4c707017f7@linaro.org>
Date: Thu, 22 Feb 2024 09:55:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] arm64: dts: qcom: sc7280: Make eDP/DP controller
 default DP
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-2-dc0964ef7d96@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/22/24 00:19, Bjorn Andersson wrote:
> The newly introduced mechanism for selecting eDP mode allow us to make a
> DisplayPort controller operate in eDP mode, but not the other way
> around. The qcom,sc7280-edp compatible is obviously tied to eDP, so this
> would not allow us to select DisplayPort-mode.
> 
> Switch the compatible of the mdss_edp instance and make it eDP for the
> SC7280 qcard.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

