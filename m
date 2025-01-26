Return-Path: <linux-arm-msm+bounces-46139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 598CAA1C78D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 12:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20FAA1887FFD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 11:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7168155330;
	Sun, 26 Jan 2025 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XSJTIfQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2500711CAF
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737891553; cv=none; b=kZ0jQ7/j+SCF4zHW62hkvEBhCS8ud5bdw/7hfuqTMTXBQLDC3vQPiixAH9CMty0IvX5cQaFuMpezuBjOL3oxdoAUXeRhHEUVJi9tD5+mmHcEAf4cAO2D4b5vK6qobAX6TAMvXOK4+tqU8ywvLzBPOFvwdN3WlS2WwHF3Ht2C2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737891553; c=relaxed/simple;
	bh=Vcvl+jjlmmvw9f0BXdc7GAb6boRiVFapSbGNQ8KJ43E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEk4VpIWINHh7O02+HHgR7+DlgmHwV+KvZkzyuFN+LatJEuAEj5gWQ34SWbSQzdKJlgMRG25CXuA4smSAEM5TSelGgUNRhBW71+bA/SyFgxXXTzOujfiChZPYEc2Vfj9+YkP3DRqAeI8yxuHaH+T9qAyiNnxJghbw4JIpA6AqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XSJTIfQO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401c52000fso3243433e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jan 2025 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737891549; x=1738496349; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m3Z4T8xpTA0ju5YKhedGkcsXKqlbXo5WcnVj25PggZw=;
        b=XSJTIfQOGoaBU3VjLRxOQ5DB4FSeBrDdRkFWLK73nzfiSWFdQwOFoOun79NjN2nFmN
         2VxahfHLmDto3VyInagU9TMOgirldZ1X4q4KcEte7/IcwdpMx5zTSZ9Z2MUv/PxmnfMV
         YkeHJ4nD4wljAQvw9CK5aB4cfqxQKSxz7eLQVOmk9wXiWYHOW07cU5gTvVa2+N0eWqNx
         6XILaIod74PIq/wdGZ6FvBuBGFrJWZWfRnsonAjsaUFhZgWi2bc+r7AvXVLHxatFGaqL
         j0ac7oXbU3er8G4qtE5B60Wx7kO2KFU0AqzTemtiyA5CbRaQ0V0JpYcSkZwAfUBgeC0w
         Ko+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737891549; x=1738496349;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m3Z4T8xpTA0ju5YKhedGkcsXKqlbXo5WcnVj25PggZw=;
        b=Km5EA3zi3Z8+ehkIixSct2IjHagLFs3eqEdyDxe1rQBW9ZF8MX8itfQMr/z9bymxI7
         /0A5gwuao/d3P3e6mbHjHchjDWvyrIQzo0DJW6f3MGnVmKQA3/p3wwQWsLis2f8/XhXT
         lKD03FnIvMFQsTmK5KFvI8e9H+8/LmsvTLDCTeVXpgARG6H2R4+1D3JxY33AC58vgrlw
         C/QOZ1HQb94gwBcNsJQeYCzaCvzSH9wekKX7oWtcWGNOsrfA7ueqqK3hj36fRL5yZ3Vd
         /jBVjvwMXQV5jk4aoh2Ai1deDOvy1DPVR56qU6WQA6H6AL9Pb5IGx/L19Ys+cYfWjgOi
         okQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlXVbG4vgGTgKu0/YvVxmTw8hGLq+LM7eK98lvBKMBOOivB3Jc1pRXIlxm/ETucxwQgkjLLBaI0DT5RPEG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi0BVB63pa9JTRkoe2VrY3ZAfzVXpMhVaLQ4QqQYt2n2P3V2XU
	OBBZ14OKi0nBOSax3BLYVCT01IA0xs4UgKZKy2lGOsL4Av1DkQJsIz0pIdhrA4c=
X-Gm-Gg: ASbGncub+vmprB1Ch1SaCrClLShFyB0sioictRtQgrtrkXozZnlGWCA5whwW/Ba+XRI
	H+ABXjcV3fiKfGY2AHQyU6/SZ6+n/af0wGdVYvZ3jkKE5RgO5GeBoE2I0wCCkDDgjrgBi1TPZui
	lpZktr/JdhnMWPb3Q8RZj+a9OudfsPm4qDblJgcPcbSy4LYTIjkLmRXFGfX9EvVVZH2vJJL/XZR
	IuBU9ydbsQ8CncUAX7n2aiS5bFSwwBe7v0MPeIqjAXBcrkqfUthf+82S79AHbutLekf5UDps8V+
	HIs5N8OliAkaoidwzrNtdm3m7o/u37Y63PwBaG8YfIplqaO4jeArbEalRj2VF2xhibq6iZE=
X-Google-Smtp-Source: AGHT+IGMHz3yK8zw+JbmUqjlC1MUV7n1Bow+QOgrcHWxA5uT+4qGx15AKrfg0wrgyvIOzYzTx823pA==
X-Received: by 2002:ac2:5225:0:b0:542:241e:75ae with SMTP id 2adb3069b0e04-5439c22d82emr10805896e87.9.1737891549075;
        Sun, 26 Jan 2025 03:39:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822f785sm910462e87.75.2025.01.26.03.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 03:39:07 -0800 (PST)
Date: Sun, 26 Jan 2025 13:39:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Message-ID: <cy3x35h4id3gegwb23j6rwblx2pecpw7ffjpri5ddqdd35kzrt@bxdmaumb6bbp>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
 <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com>
 <h6zfhxkc4dj2ueaxipha6prbvmv7pnqglghtjs7vkhlc2s7ndi@vhbj4uojlzwd>
 <A64B8332-78F2-4B76-908E-4119E4A54BAE@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A64B8332-78F2-4B76-908E-4119E4A54BAE@linaro.org>

On Sun, Jan 26, 2025 at 12:59:52PM +0530, Manivannan Sadhasivam wrote:
> 
> 
> On January 25, 2025 11:00:23 PM GMT+05:30, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >On Sat, Jan 25, 2025 at 04:31:19AM +0100, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> 
> >> Add a new, common configuration for Gen4x4 V6 PHYs without an init
> >> sequence.
> >> 
> >> The bootloader configures the hardware once and the OS retains that
> >> configuration by using the NOCSR reset line (which doesn't drop
> >> register state on assert) in place of the "full reset" one.
> >
> >I know your opinion, but my 2c would still be for not depending on the
> >bootloader. I think that was the rule for ages for many possible
> >reasons.
> >
> 
> But if Linux or other OS can trust the bootloader, then it makes perfect sense to rely on them. Obviously, the question here is that on which platforms this level of trust should be established. And the answer I got was starting from the compute platforms (atleast X1E).

Is there any way how those values can be lost that we still might want
to support ? The GDSC going to the OFF state? Some deep sleep state or a
power collapse? Actual suspend to RAM (instead of current S2Idle)?

> 
> So let's take it on an experimental basis and see how it goes? If at all any problem arises, we can always resort to in kernel sequences.

Sounds like a good proposal. Can possibly have a corresponding 'do not
merge' patch with actual init tables?

> 
> - Mani
> 
> >> 
> >> Use this new configuration for X1P42100's Gen4x4 PHY.
> >> 
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >
> 
> மணிவண்ணன் சதாசிவம்

-- 
With best wishes
Dmitry

