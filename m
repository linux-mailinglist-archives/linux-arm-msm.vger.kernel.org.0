Return-Path: <linux-arm-msm+bounces-73139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6961B533DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0531F3A2E62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C97632A834;
	Thu, 11 Sep 2025 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DJJVXlpG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F69322DCA
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597701; cv=none; b=sS0JpKZr10BXCInMazXdjuT8WVOZWQPK14HwZMs23QWlkCPL7HjrGN+1h28HH7wYssX78fXxApr9ovLnkwuUntUk2msR61JfelmxbOf0JbGRP+LE8v2EGiIuc06FdRuTveaKH1ORGzCQllcJqNw5LIuRY3K1/ueo18fN7rBg8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597701; c=relaxed/simple;
	bh=dKD8GMOoG+4Yyag3B2X/sjwh1L9UvQheZXr6rel0Y0I=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsCgEBS/sBGQIX2/uN+Xzug6B5bTVwZVgXjmQh3G7dzv6nO6BTJQtx4fXp2l2CdkrOflzbttxhcdDGXw5V1tXnE0ks4xj45Q2cfRSgz6i7R4EhpOLh7jceUunHyMF7bUsmSIgMG1tIf0tH4oltfL02zEKYO75Sxy+IUBUtGvojQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DJJVXlpG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so1691065e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757597698; x=1758202498; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuU7uzJ803t+7G/jlS9fqoPlRvJYw9o9k9ZjizAu5JE=;
        b=DJJVXlpGtzC+xDmqltEFTTxXxDcfvZnVnMmnpNhysBeDurHm9H61+W61i/22Hd2FOt
         RSpCHxsw+mv2hrtqsQdwknz47rmGSlI0HHfJDRpF/pBQ9PlQzACqFbkUIVh/BQg1hIPz
         wxfhlCr8jmZom0t2ArdnNBTKvFhG6WyZpFREKxsBByHImUjPVZVmjVgRIIuD2msZ4Nqi
         +Q2vGMMx4DInfzGlDwa+SA3jhK86a9+rlPxSdyhnc84YrH3W5yxUDjzShbxzlaTv/LBf
         qPH83HkrT1M5A0/fONxifhSRHaDcTFNwrDWY0H+4abT1rPTu2qH6mAS0wLeJM2n5K65Q
         RgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597698; x=1758202498;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuU7uzJ803t+7G/jlS9fqoPlRvJYw9o9k9ZjizAu5JE=;
        b=IwKX0acjVzpVJ5z9qBo/lIdDaqUu0WJzMbVpkvyZcCOFkCpbJhszcRN3lzVLOOUiQ6
         tZCqR3M7NIcKY5vubqMFXp+2oKZiQSjiyU2jqhjQjyO9s/va+z6gE1+Xt0onpaP7gQqk
         nrqWYQh7j99rD9q32US1r8rqCDLNGejnwgcOLAnBz36Q3LEEdxqIbfzVjaPqlsiJ9iTx
         S+xxrQKE/tdFvODSraxRuqyAuiYWRt5rdQP/O04dClY1bglrME6PKCYea4R9oDFSBT4v
         5bp0KrP8YFU8Zsv3xFjqJ0XURMNXYXeB64EsaoNs1WDg/h/uqy6a2vilirRmVKiwodQq
         8scg==
X-Forwarded-Encrypted: i=1; AJvYcCXbF2cz5tTWc9SdvI968VBwS3F0AzD7heu0iOvKPExCHQrOs//gOw6InYOnqXkAyOLrtRWHzVQTmpoe2Vl7@vger.kernel.org
X-Gm-Message-State: AOJu0YzqV2bKdNLd7izK1tSf3OkA3l5lyxVaOs6bQkcFwOQejDvPGPax
	1w/8teXTFjxfKOLuZS07uv4w1p76Hv1RX4vClZEfZtSzp4BzDTqFkD2IMu9QvbQ6O3k45MZItGh
	d5ue3nJzjjdYRS2fB7ZsQLKS4IC87Nmt9i7biecUEig==
X-Gm-Gg: ASbGncs+ovF+bvlTGAscgSDbyWgfb9qsW7HOh25SEl7Uv6NSMSa0PFbrqXR+2Xxmte1
	j/svJlBiiEpuI9ojtAaHUVO5zoGH8RPui7NdTJKU+u2/sKqZZBGayHFqQbstmwAVKxowD+yIKk9
	snvSzWaPplN4ry7MenNN6Zfrpys8x7mP0c+fR5ufwO6LyqOEBnUU0YH+vWs8Wr12pBAf0587Pbp
	89w0iktRsed3wQxEX6NiJ0qfJOcaLfz4YDb7+8XSCzbpAsIyQ==
X-Google-Smtp-Source: AGHT+IGZyVuFS0SWwhsW0GkXG7C2O7hdvLrhWa2ouKXjUmaKEWGKB5rOyUWCPW4ZDky63sjUjVaIfTVqhhGY31to38o=
X-Received: by 2002:a05:6512:3b13:b0:560:87c4:e0ed with SMTP id
 2adb3069b0e04-56d789b0dc9mr1285479e87.18.1757597697646; Thu, 11 Sep 2025
 06:34:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:34:54 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Sep 2025 08:34:54 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250908-lemans-evk-bu-v4-6-5c319c696a7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com> <20250908-lemans-evk-bu-v4-6-5c319c696a7d@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 08:34:54 -0500
X-Gm-Features: Ac12FXwwEtmXKsTJF1Zy2OvzYXGdM0No2024s7j2f5LD4-m8j7oBYTl11y-yDd8
Message-ID: <CAMRc=MegZ4Xe8zc0U=ruACUMA4KpP=aw6jrKCN+=KRfUKTuLkA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] arm64: dts: qcom: lemans-evk: Add EEPROM and
 nvmem layout
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Sep 2025 10:19:56 +0200, Wasim Nazir
<wasim.nazir@oss.qualcomm.com> said:
> From: Monish Chunara <quic_mchunara@quicinc.com>
>
> Integrate the GT24C256C EEPROM via I2C to enable access to
> board-specific non-volatile data.
>
> Also, define an nvmem-layout to expose structured regions within the
> EEPROM, allowing consumers to retrieve configuration data such as
> Ethernet MAC addresses via the nvmem subsystem.
>
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

