Return-Path: <linux-arm-msm+bounces-49212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A5A43379
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 04:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8131E3A7555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 03:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB12241C98;
	Tue, 25 Feb 2025 03:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fOtDDi6y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3B24113C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740453452; cv=none; b=YcRptrgS19Hv6rsmZE1cAf+qI72iXGIBdp/kYCJAe2qI01Yy45INiHc44NRKG3SbbLSUVhFxyzL18qcu3+vPkxKTATDrSpCTxjRY/GyP9dCYojcbMQGOVLudkN7iLdd+5s6wbt5FuEV9enDdKmJ52p7xUi3WNiNelQ4KzqxJtAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740453452; c=relaxed/simple;
	bh=xdMJFduuFVdDfRcYXmcf+iepoeRKpVZBuh6VAxiDRjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JmeaatQWzo9ALmgG62jtojFjmwH+MCQZmLxCMDCYeXCJjD43ZZ9tLFk8uJb9molkiUQzJj9x69WpkTI/nN69Q1o8qFXB4KZgqcs3Jh2RvDtJuo7Y/78bbm9htRn2AmbfCnnbUhG2kPV7lduvs459mTS50KvmQQLqh7fcItP+NJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fOtDDi6y; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-547bcef2f96so5243480e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 19:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740453449; x=1741058249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErwZgVdj5p6xF2muLcoQXQqaXweqPuzZ5KXiqDnh9+o=;
        b=fOtDDi6ymek7vh1moImKKs11EnM2p7whvl8I55xKpBuyyTCKOtx7c/XCa7b4vI8AGA
         jMy4/Trhqi8vNbUcCIOgClzHFlCpEQshizFuAx5Vi5KKRgF60cO0h8VI68J8MkVFCqs1
         Y5a4KPEoTAMjoMuQu1ZgsdvrZKFYAUWrQ6hPecP+KjVWyo7TsyZC8+ojtO6gi8v83wEl
         /TFOa4CW00tzTQ7FhSu5eTUhqqHvxJVrGIuau8R3GR4FMjbTpovijbYOIigccgNAH7Ep
         c/1BCqVOP2BTu9wKt3j/APpjzQAEJM5JFnVXX2msJkNA+9ECT/QdlCR70wK7/DROv1C6
         lgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740453449; x=1741058249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErwZgVdj5p6xF2muLcoQXQqaXweqPuzZ5KXiqDnh9+o=;
        b=O6SKkmzswJ29gz+TOquvnzOeVD+RlRE/Mp8LYFJNHQrjmqRORaWUWp3KAenmrH8N2e
         fnIJyaPFCWpWXfULOqWSqo6a9Jr+LmRYiMeT1OtRo7NyMoxCXaXXAe5HTpNrw8+lqOBZ
         HdMPMeSuTH6xxAwFyqQzq1B3vz6FWlDhgsV+hy778ZqkSlNE7yAui9qOYpRBOhIrz85m
         RUjKHzrdLFWX4EEYDD0iZVMam3Fc9H56u+DkAD3kqsXf53n+7LRvMTS79y+By87D6T6o
         WBpM2GWhuS82BZquD/EXm/Rd3dzsClv9QMmi93N7fBcTQT8lRjiFpPcMhiwikhI9GLus
         /+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWtKuy3XWLrXVxxXSiqJTjcvFyRYICXq7T+VFSgctkOywNd/9HbFhDjEwFFM0xl/nm3sbDOXmgU5ogPEiZ8@vger.kernel.org
X-Gm-Message-State: AOJu0YyvsCic9XVQPunZAeRJ7DVKaSbk4ubUJlS8yfd/T11jFrwH3hYj
	BZ7KNsSKVokUlgi09akOA2xcVl3MueGr8YFGymZt9l91WMXa6o74lbJx1uZBYdI=
X-Gm-Gg: ASbGnct+Qfh0uoFHlm3zns9r1IfZrX19CbviKkjRF1qP9ocAvwMS0yi83dDRf2pOHhr
	R+/7kuGhEi5BunP9h4Nevs+eJLbQ2QI+TZLMPTBJg/azCiTWkCjxQ3DEUpILWlnnWGHZUV4sA+j
	HaqrPoBukRmHJMFruKj1WwwqESoLvGvzJJjjqMaUYuygCStn+qkh/AE5kVmq+PxC2c6Bk8afQgm
	jpfBe5kqvCknmy8obdRxOlDOtfxB9eG0kc8bmnVkv+vEPoMchLaGocvaZGdpVVylMlVmq0hSClc
	VmE/dH28oOQRnbDrTWRUzsTkhM+jTu/UR4BBa2uILtr7NyiJkjwsxUE3HZ9uYHjdoTNDQHq8FSp
	XFrv9ug==
X-Google-Smtp-Source: AGHT+IGNyDqvJxVxqP5uUjlG9LFxo0ubNdF4Qj+xzKe0poWIckWW0gNZNqJemNsdxd4SujSyFUqBGQ==
X-Received: by 2002:a05:6512:3dab:b0:545:285e:7777 with SMTP id 2adb3069b0e04-54838f4cc88mr6329025e87.39.1740453448575;
        Mon, 24 Feb 2025 19:17:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514b78dfsm62244e87.54.2025.02.24.19.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:17:27 -0800 (PST)
Date: Tue, 25 Feb 2025 05:17:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
Message-ID: <6pqjzeb6xxozxmfeowmxz7pa2hldiet4mibllpsvtqheijjxl3@j7xsmlbtjfxb>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
 <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
 <6d1a95a1-0b84-4bc5-9cb0-3cc514d292a6@oss.qualcomm.com>
 <82a9d623-2033-4d7f-93b8-67007b46be79@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82a9d623-2033-4d7f-93b8-67007b46be79@lucaweiss.eu>

On Mon, Feb 24, 2025 at 09:43:48PM +0100, Luca Weiss wrote:
> On 24-02-2025 9:27 p.m., Konrad Dybcio wrote:
> > On 24.02.2025 1:17 AM, Dmitry Baryshkov wrote:
> > > On Sat, Feb 22, 2025 at 02:00:49PM +0100, Luca Weiss wrote:
> > > > Set the paths where the device-specific firmware can be found for this
> > > > device.
> > > > 
> > > > Fairphone 3 was shipped with secure-boot off so any testkey-signed
> > > > firmware is accepted.
> > > > 
> > > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
> > > >   1 file changed, 7 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > > > index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> > > > @@ -82,6 +82,8 @@ nfc@28 {
> > > >   };
> > > >   &lpass {
> > > > +	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";
> > > 
> > > If any firmware is okay, wouldn't it be better to use
> > > "qcom/msm8953/foo.mbn" ? This way if we get any of the firmware (yeah,
> > > I'm a dreamer), then FB3 can pick it up.
> > 
> > No, the fw may have board/wiring differences encoded inside it
> 
> Second that, while I don't have access to the AMSS sources for this device,
> I'm sure there's at least some board-specific config in these images, and
> I'd rather not boot up some ADSP or modem firmware compiled for some
> Dragonboard or equivalent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

