Return-Path: <linux-arm-msm+bounces-47250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB7BA2D932
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 23:09:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 744F87A342F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 22:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8330B24395B;
	Sat,  8 Feb 2025 22:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zI+w0ylH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF22624396F
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Feb 2025 22:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739052570; cv=none; b=eMAHLZsNlYxlFhGS3vw+YXHPoXhnPZP0C1RQD/lqveWFBXB3kaxch733S+aBMI+7LkAft3yqyEHiWGmUyFlJRZjlTBg0bVuVoLjQ9HMDhVj23PQMkcXT3AN+AIZRwBkLnNsR7bvgiCn4+bMUeaF+cMDHdRvIAWzc9YCkNVz3slo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739052570; c=relaxed/simple;
	bh=nbh0lUP9+B3S+rH9TsK6SuaDCZWSaxFbqXXgX6kTQM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L22jgX6/dLf75oTJl7wK3SjpEMwDJ2T8+2rN2HNpQLfhL5tUbFLHbydbb+1m5aVCj2oxN/s6AcxpV8dHl81IRj8cOc6jAnKkRVbh0Wf2q5AkBy1cXbeIj0XoLpRJ+bci6vNBVSojdd8I8ElTnXoyZK3/+U9UcBUWYFeQRRU5ugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zI+w0ylH; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30229d5b229so30548851fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739052566; x=1739657366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=;
        b=zI+w0ylHtIKcWCDf5JCPH4CobNz97bPRa0iCKNK+66ZCfHwvMvA1UZErij8irRaT8U
         zan5Je+57zc0avCroPWKkO0ZSasD9zGLirKy+Fw9PD2HV6K0X8Zq1xqFitPAVN3cV4BN
         TdlpniSciuDd/Jeu3usGaN0fmlaHkahWrISbSV9Zt8XPSJFp5acbJPvIaskWCr988Tpw
         6u1rfkt/km4EYPUqwvY5wDz6q+5pIjW3oqyYAHH7l+V5UqD2mmgI4IczOU1nb/Yz8m1m
         8WFnVqgE+vc9evRQvxxd2pJPeiwa6WStY6YE8zgAXo5Y0exBGP8ExT7TKxabtPrHTTG5
         2sjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739052566; x=1739657366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTHcKUL0A9GikZYj1YTvr/EhlWV7sWgF6MMVtB1N/9Q=;
        b=TtBbhnSRocU0h28eMoYH92K8Qzmw21pfL797wyVvswF1ul0LH/XgjsvSBFVdhdmtxw
         8EQ2DN6C1RIaCxzxgARSNkqQQ2lAIp9RtSayi/5WFOvl+wPbWnbJanLYoi319tnjDaGx
         tUwRUJmT8CtIREg7kOqlxjX2HV3ATjLJQelpwRha06vtq/OACLU+0Fhwxtbklo1ChOzH
         JhdaUUktvFXZAp/5B9yUaFctuTL/g6z4f6zAeuhBBQ2eYsdyIkDPvNT/xGvDejmbWfGb
         pk3snngKRr+TZ8rjlSwPGrPnDfb7meWHoIkvlgVjN9A44op6DEXjvUibNC8y3mex3JmP
         K5tw==
X-Forwarded-Encrypted: i=1; AJvYcCV9z/3N/xx8I+/W5pxxsjO89wn4FuDp8qTRo1iLjacIXkqENwPuq3gXm2co4HOzY+/4zcl4BSj4yMxcQP8l@vger.kernel.org
X-Gm-Message-State: AOJu0YzYA2OITWd/ezsYUcukSX3ZDRMbJMQDNT9ldZjiCSWp6HM8Lor0
	op8/VSKI/QGCS/pPIO4y5OBdRQyj0pqCQ30PM14CYQiRyZFemxAPm6hhUdC+gLo=
X-Gm-Gg: ASbGncviETOESHp885Hm+nZLQDMjKVpbzv4fR4p/DlO+p7C03KS2pbSU3pOpmRhcGan
	z6UQAQpshYellFi252Ys/HckbWlnPs2816hRYfuj5l7uO9hZih3AmnGceoX/9xxo4DDOfy/rS+p
	hkyuAqPS3vhdQ0TZwE2RHuewwEbnheH7M5C4ppEcfQuJudb95X7+a0V2uyqEc31JCb4vqsL578Q
	Kv2hA8moFL0ihNaDauqg7sRr+oQJhvy9unSao0Vv30hON5ccXA89isSzkqplGGeHnXCHFd4JUZd
	OkyJxtvtiBKkEKm/9F5hw97hBJS0jKhm+OE6IllzIQTzku8INA5cqanABMpvFdzTBRq6Aw4=
X-Google-Smtp-Source: AGHT+IGUH3UmhIKInMLmECf90pr5INGbeBJEBwOwexzDKJYYzBRhSekRFOt84/bINUn54xlSrNAvSw==
X-Received: by 2002:a05:6512:1247:b0:543:f1a0:9e82 with SMTP id 2adb3069b0e04-54414a96211mr2604148e87.6.1739052565570;
        Sat, 08 Feb 2025 14:09:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm830251e87.3.2025.02.08.14.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 14:09:24 -0800 (PST)
Date: Sun, 9 Feb 2025 00:09:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org, 
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, 
	cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v13 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <mn5zxr72jn3qbn6uiqnzg6qf4s4bydjvmvqqxhd4wvrrmtf3ii@hoau7ge4wfk3>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-3-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208165232.2371889-3-quic_vikramsa@quicinc.com>

On Sat, Feb 08, 2025 at 10:22:32PM +0530, Vikram Sharma wrote:
> The Vision Mezzanine for the rb3gen2 ships with an imx577 camera sensor.

Qualcomm RB3 Gen 2

> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  4 +
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 89 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> 

-- 
With best wishes
Dmitry

