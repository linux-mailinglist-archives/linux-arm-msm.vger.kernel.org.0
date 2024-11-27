Return-Path: <linux-arm-msm+bounces-39329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C89DA95C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 14:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE33C2819F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F224C1FCFC0;
	Wed, 27 Nov 2024 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jjlTojNI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CF41FCF57
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732715583; cv=none; b=JUmXnFI3sRXLlQr/6pKCXLqpZTvRZOPrO513P3jWP1rgk4FgyMqzZwRDs7jpzRzxM1ybyirWvt9mQr0LqUKEDWwJhKvk+YA4Ay50RFx9Y4HJj7JxxogbnGmfPu6B6YH5o8nS2dKplHh34q2CZUn7ZRcWVBceBtEO/eO/GCGlNlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732715583; c=relaxed/simple;
	bh=4Cw79OlSsmeWvc5FvG9UqEOqdIJZu1hBHoIJTBQ2WY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gk/gP+jFI5qIMRzl3OrJ2tx4PVKPQgKoUMGb7H39b40nZCFNoR9Syt/i8jUKVQzSnZEUAf2u/QzL5J2HHK8cTZ3GHLCrNfDoxs31L4numo+FiQ2DnRbmT2DtZ+UWd48bvO9je9wpIUJ7VJk4bT7b01m2snCd1vhqE4zRyy+rqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jjlTojNI; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df1e0641fso605238e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 05:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732715579; x=1733320379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C4TAQTX45KjbD07bV+ebD3Bm2L1TSD7dI4Xlh2Tdxk8=;
        b=jjlTojNIO+qNFCKQKQSqC/qDcfYbUDzhnbbmLIs5+NDriUQn5HY4m9ILS1SKSlqBvE
         qH2m8BHLwzfzVH7JFBcClX08/3LfpwnbdoOK4YlFGXgUHfdFE6oYVgmrGYmbk6kdvrTb
         po3gk8fYwpPUScdISpxnJpNmxhJuBfLLssN9ighsBtJHIv4ZaDxHk4WiQr2Me0vD2NXq
         ZQwqejJ3C2soZDSerXVr0fE2z18fAoC4JPgplL6M2P59fiToSLkzsc8kqCsP0u2F2b78
         Dj2D4FoP90w4TzJpSB2p9UA9jK9+kHKs8n4ToAUsCm8WZ6fvrtOu05tBhLdUaEyg34h4
         ZYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732715579; x=1733320379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4TAQTX45KjbD07bV+ebD3Bm2L1TSD7dI4Xlh2Tdxk8=;
        b=EodcGNDp+jsFiFW1+ZNHAv4LkMVFRZJUc0MCqpMrMjHrEBj6rWaY7oS1jgLwyH7oLb
         Y8QIqsywSbrGLWcfzuNQqdvBMU+hfJviGyWscgwZ97i1mpIZhfddIet9W5ghNmWf21I2
         JIOh+LH/sOBULoHXys1Ibg3wjd7hMmRjZIYZq8hzHbpwf7gtyrQ0UzvAZA1dE1tc6cjr
         wK4kW+JxyyWZN+YpWlMNIWrhN/a0OaCnOQxMcNLZ/yerXR/If1bkg9J07wtFFV0MeS1F
         NWnjEuPkOm8E07XAF9nl9yWUp4SNmYwQ3Ahf7jC1nsNmmy1c6xULpu2+0jUjrPAV+xZh
         XGYw==
X-Forwarded-Encrypted: i=1; AJvYcCWmGk+Rgzv29RCXWk6rVjwdWEn+BMzoO9jGuyCgJ44ZOYzrUcM5gVR9sTDd7mJIreCTUXXRs7cG39RgteHz@vger.kernel.org
X-Gm-Message-State: AOJu0YzH64ZAN0kSIuZYXH/4RSTCuLIBXJBO0JIo+vtlSJZgkvDErHrl
	aQKcEd0UXg+wyzDQh1A7UFYitklFnuYmkGQNSkQyp1/1hw18wfzJx6O/Xfuhjyc=
X-Gm-Gg: ASbGncvakyU9kRwlHapHAEhmQlI6VlC5FgCuuW/Iv8ilLr815VvfSev5iaX0UpRK9sz
	p7tGPykVBlzPiZxvo7FF91MH+U9ZAnrfZ4KnsiCjkYuMhC4RWo8T01n/YFfJVgFKHVoJhtnSbQo
	WXr+KOtNje+87WDzRBjKfvBi8Lj8GW5SGc4p/lIemPqjzuRRMLS1hkTMnTH2hI6DD5S7lid+HXS
	lyVEwWnpT0+7OTVQUp+FGt1uP/74XODwjEb7ZFa0yvvxB+wLu2klfLubeBg+wByKj2xshIRTFna
	VPTHwQFzWLRCh56pWREc6bhYKCIrTA==
X-Google-Smtp-Source: AGHT+IGYADuFA26pMJrHLMzO1jvXPbYIAXbhv0Ob6Xw8c8Ir7HGjlq9gt3AUm5PCW3k8fSZi76WMOQ==
X-Received: by 2002:a05:6512:3c89:b0:53d:a2cb:349e with SMTP id 2adb3069b0e04-53df00c5ebamr1944019e87.4.1732715579361;
        Wed, 27 Nov 2024 05:52:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24518d7sm2314321e87.80.2024.11.27.05.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 05:52:59 -0800 (PST)
Date: Wed, 27 Nov 2024 15:52:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Enable Bluetooth on qcs6490-rb3gen2 board
Message-ID: <sntzr75d3by7ignomcrcsmzqdtbikonyuwj5niccuenoxndaxb@vhu5en6hetqx>
References: <20241127115107.11549-1-quic_janathot@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127115107.11549-1-quic_janathot@quicinc.com>

On Wed, Nov 27, 2024 at 05:21:05PM +0530, Janaki Ramaiah Thota wrote:
> - Patch 1/2 enable WCN6750 Bluetooth node for qcs6490-rb3gen2 board 
>   along with onchip PMU.
> - Patch 2/2 add qcom,wcn6750-pmu bindings.

- Bindings come before DT changes
- Driver changes should be separate, one patch per subtree (so one for
  BT, one for pwrseq).

> 
> Janaki Ramaiah Thota (2):
>   arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
>   regulator: dt-bindings: qcom,qca6390-pmu: document WCN6750
> 
>  .../bindings/regulator/qcom,qca6390-pmu.yaml  |  27 +++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 174 +++++++++++++++++-
>  drivers/bluetooth/hci_qca.c                   |   2 +-
>  drivers/power/sequencing/pwrseq-qcom-wcn.c    |  22 +++
>  4 files changed, 223 insertions(+), 2 deletions(-)
> 
> -- 

-- 
With best wishes
Dmitry

