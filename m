Return-Path: <linux-arm-msm+bounces-18495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 922948B13BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 21:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C38291C23AF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 19:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894D613B58A;
	Wed, 24 Apr 2024 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEVETtDR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D4A762D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713987861; cv=none; b=U+QvXu57llkOsQav9+T2HwXaaDEA0UfnHsfx4WYQ3Sgf0IZ/70oYN6HT/rB2f4xvifIMsj9bkqDl6adyVW/fkszYd6vhxDI1JXThuhLpWS6eqL37FPFvzuTs3V5GSx5NXCaql0kZZFBE4bdBoNzk1HMRFYz7ZsfSjcDgf5RlLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713987861; c=relaxed/simple;
	bh=SHS+idxz3xdv8Xun7bfL6z19nxq1XI4eGUs6WLzWbhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TF2aw6mfeMCwawiJUOw40m1X5moTCsHO79/x2EBwkAG0ygGhPDDIwCEYP8DywD+B3lwDvGaKmQm0bysaKTTnCoun6DnNVfuh3yqwcIYoS+tYGsGUAnH/luOkMULTXC9MtD+820qrHSUCr6lqtgXhktHxBZhABnuEtj6Q2QKwSJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEVETtDR; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so2209941fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 12:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713987857; x=1714592657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vafs3nvN9dgAZ9/CjOw5I4D2RBxmfmANPhjz8LrzFXE=;
        b=IEVETtDRnxV7DDEiZDWEDg+4m6D0jnPcE3kKE+EZRL4CjPEh5SMFdMCBBrmx7ryIGs
         7jl52TlzjGmUjIyszIXAeBcUzhlKNkqBJncZPSY61stiwiIjJ0FlKMB7Bw7A88SIIwQY
         H5M8OAg20LbNx0yaTX1RMgsmxh6O7Wb/cvC3XdE81+hdmiAOdbU+bSyxWN86roZ8xWOy
         Vcv85TKme1XbhgG2NqcFhyP3wyO1mUY/3Hy/iXF/nRf/vAkM48IISg3aItrjcmpGOiX8
         GstsCWKrdvTf/tghcDyC0cC4O/ZIWJ6xJoHdH8ic0NBeEO1oxVrAQPZ537y+iShkvf2R
         bDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713987857; x=1714592657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vafs3nvN9dgAZ9/CjOw5I4D2RBxmfmANPhjz8LrzFXE=;
        b=AHGfiAyhR8g65iPBx8mwOUGmu1PFV6stgzE2KfjzswHlqm4aqkZoMIpgT23iqr6aLN
         nguFp0yqGUXaWerPmkWSM8CHHBcGCaqTAlDUl3N+1y/GMrUgVe1GtF+y71g+Amui4aqO
         dSR21EshJKxMlHtOX9+S5EQCRdsCtk5aTbU7zJWFb3nFgPUxtZDpL+oL9e4OM48cmeqs
         dBbi31yXO3TAaBF4fUzSa3P6T+xUyzA2D4fQ8pJaIGgr2KgNisV88fI3frc/ihiE56pA
         tcwQN0RiDqLvtv6rg4WfoC+VlVPkQEh+oIjJgTiapgpK0tmz1hXekvukFIGbTwE1F1Nc
         MUOw==
X-Forwarded-Encrypted: i=1; AJvYcCWHFM5XQ+K7FeYDIOwVvJfONFk0y+zhtmkcXFg0lbSvy446Nb3W2pTY3r3yc4YVeYlK0PpFWdTTFTtbZaxol5y5a13xau3q4sBJyrAz0g==
X-Gm-Message-State: AOJu0YwbCzmNIoh+FqTTQrVTSMyPsuy2EqWlXHNJzQBCRzA65DvDBOjP
	bYyddvcGLlpcV1j6jxTn0gvjWprqQC3v1M2d4T0972FghNfjSC3AoU1W8eg7qis=
X-Google-Smtp-Source: AGHT+IGCXef3XnPsK5cT0g1DZqwuA9Q29qnFcMYr2Fhi61/p5wZFZniYAhOTTY+fOOdBRJuSyKKFxA==
X-Received: by 2002:a2e:9f0d:0:b0:2d8:6104:f95a with SMTP id u13-20020a2e9f0d000000b002d86104f95amr1980841ljk.23.1713987856997;
        Wed, 24 Apr 2024 12:44:16 -0700 (PDT)
Received: from [172.30.204.223] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id t15-20020a05651c204f00b002d864ef1d74sm2153371ljo.49.2024.04.24.12.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 12:44:16 -0700 (PDT)
Message-ID: <6b73369f-9cef-4ab5-abf4-c5732c2ad168@linaro.org>
Date: Wed, 24 Apr 2024 21:44:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8226-microsoft-common: Enable smbb
 explicitly
To: Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 Bryant Mairs <bryant@mai.rs>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240424174206.4220-1-rayyan@ansari.sh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240424174206.4220-1-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/24/24 19:42, Rayyan Ansari wrote:
> Enable the smbb node explicitly for MSM8x26 Lumia devices. These devices
> rely on the smbb driver in order to detect USB state.
> 
> It seems that this was accidentally missed in the commit that this
> fixes.
> 
> Fixes: c9c8179d0ccd ("ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by default")
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

