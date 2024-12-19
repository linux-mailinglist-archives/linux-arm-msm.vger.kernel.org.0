Return-Path: <linux-arm-msm+bounces-42723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEEF9F733A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 04:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F18AC16E921
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 03:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B5412B169;
	Thu, 19 Dec 2024 03:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6MZCd2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257408633C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 03:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734577648; cv=none; b=PYwJ1Tt1BrSqi1SLf2I38EVsX72mQTtYZ2a/QASjBP/TJzGtqDWB5WpgGaPg1ggTfCZRQMr+/N5qGn+5/QXHGwDg6Z7ZA60trSOdGj2t2HcKo/bWt32w1lTKIK15JhlPnLea/+s8SkUEO9Q/+OZwVS/sTCKPa2UF2JU331dOR0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734577648; c=relaxed/simple;
	bh=SLYBC++/D/JMkUPoo0W+l2FXVvFLN6VZx8TySI8ucjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7ebNY0TOfAUN4jaGXrrpfUoVU39drjMWuFZ27qytINffVsVLnajlunZF7Pc8zPZqDBtWUnVez0jpECD33AgvEe1xSUg+hvQmiKyUHo8ZK7Mgdz7dhU9NRwpCCN+qM9a7BsW+18XsayvECQMKjaqJfzYBY7KOPqFM8voYbPW/1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6MZCd2O; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e384e3481so201371e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 19:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734577644; x=1735182444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vlCUzSVqKvmEM4iynbl0dv6KjhCXMKa45bOKZ8keG7w=;
        b=c6MZCd2O9d5iExjLxQRvZxS75RBERpO5rD16vp0UgBNazgfRlJi78FefsgjAwzQByj
         4BWb0FJMRer5g5XkmG9VHGYVjP1VOTx3f8VPu/0JfU5m8AznCIEDu8Rb98NJ2Fve/R/x
         6zPF4n4RmYhW+E41yqn34W5n3ga6woleCHvNA2DZb2kiYBoU5Mv4OkoDGroD/VdjC8Qz
         JUbno0+Dz5AakMRDO9xGr9k2IxAGcRnYuGtd2xy+B/5GTfAsL3GRdIwDpIAQ+F+6o+Gz
         y7zDJAy/rASDxMYVlFkuc65URtoFVMRZUHV2iCIZeAq6hsqntejRvAQ7xGh+RtqKxDi2
         U74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734577644; x=1735182444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlCUzSVqKvmEM4iynbl0dv6KjhCXMKa45bOKZ8keG7w=;
        b=bY9zWek87MWM6lrpnTOnQSr7V2VnLXDSsE+lOMmL7OZTFuAmfbpOm5QhXyRJyE3syB
         Ivc+hq7BzzrqJb3aS19iJWuxLmXBlTUvatUPm0cU8pDKJoAehiMMh476DtVw8B12ckIK
         1FPT6PlwSk0zCY9Z6qKLXTt4tKBGlaB15qvxIbs95U5E8vnYxW9VTRz8c7oi+yweDILr
         grRXV9H+lxkofACQkXmJXKZMARQTYyp9gBKLqY+JKzCKqNyA0BHONkqPrQfwnK4lvctw
         85MumPPTxCoAfnqLj4ZjnZIEe8kmotNgsUyfmfcU5ZLg0vvpkBUyqIpXuMUtaciaZF9E
         2yxg==
X-Forwarded-Encrypted: i=1; AJvYcCXN9TNrnZNwbExtd8PFgUmxQ6GNG9/zZ3oqwfXYjWtgsWcInUJO8pjY+FYPkv/p7FKUEq39hJx6hCxzWNd5@vger.kernel.org
X-Gm-Message-State: AOJu0YzJfljpcW9zQDD4WLLGE4r7ze8G0Gs6MQ2Ta+UneHlbbD3CHGkv
	nEa37IWPhbM28SihnT4HOhlq79KvQ1lJknOJgQFhWXHKpJ7Xgg65Z3bE6FtKDFE=
X-Gm-Gg: ASbGncst8NbR0ctXq9lKtzQybYhf08zJJ/VvBeq6AYVLSTdONvAv92nKLG2j/QGIn5+
	DohYKdbYB4m2AMxORQogntsEBXeArNtazEdYuyZmVQciAs1cyqmoPPr78A9qNBIUDL8KAxvnCHw
	h7uaQZWaM5A9FN6s2yqPFjjs/M+L3oyBgteT31ENY6h1+zbL7zWrgU4gZwabpA3k6iGJXwQUWtY
	DvYmvnoP5DWVziCDedfMKIVemvzCJlqm3vjEnrl9XI1GfuJvhC3F0eUI5duKcyxl5d1245UDxkf
	WUVgFCp10TNrH4maE3MoXZdXZ1XLdFOTRh42
X-Google-Smtp-Source: AGHT+IEXyBo1AhKPiSfqz0CKT3S+iUCftNS7iPEOZXrIIqbgSSrnSNx5UfOq/sSeZ5QSVUFJgicYvA==
X-Received: by 2002:a05:6512:39d0:b0:540:1fb5:3fb4 with SMTP id 2adb3069b0e04-541ed90e0a1mr1831567e87.54.1734577643971;
        Wed, 18 Dec 2024 19:07:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813898sm47229e87.154.2024.12.18.19.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 19:07:22 -0800 (PST)
Date: Thu, 19 Dec 2024 05:07:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Prashanth K <quic_prashk@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH v3 00/19] Disable USB U1/U2 entry for QC targets
Message-ID: <3h2ur3wv3tso3qxv4ws2af4vmvdjdpvhax5smngszaaaotvgku@bo2q5cmhds2z>
References: <20241218102707.76272-1-quic_prashk@quicinc.com>
 <nvhrhnfls2i4sb6rrlax2dh3hf5thfttrq54bgug2jc7ol26rj@cnk5dtampfes>
 <e15bc97d-eef3-4e49-badf-5b3afbc113d9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e15bc97d-eef3-4e49-badf-5b3afbc113d9@quicinc.com>

On Wed, Dec 18, 2024 at 05:18:50PM +0530, Prashanth K wrote:
> 
> 
> On 18-12-24 04:57 pm, Dmitry Baryshkov wrote:
> > On Wed, Dec 18, 2024 at 03:56:48PM +0530, Prashanth K wrote:
> >> Enabling U1 and U2 power-saving states can lead to stability and
> >> performance issues, particularly for latency-sensitive or high-
> >> throughput applications. These low-power link states are intended
> >> to reduce power consumption by allowing the device to enter partial
> >> low-power modes during idle periods. However, they can sometimes
> >> result in unexpected behavior. Over the years, some of the issues
> >> seen are as follows:
> >>
> > 
> > [..]
> > 
> >>
> >> This series was earlier started by Krishna Kurapati where he disabled
> >> U1/U2 on some SM targets. I'm extending this to more devices including
> >> Auto, Compute and IOT platforms. On a side note, this quirk has been
> >> already included on some mobile targets like SM8550/8650.
> > 
> > Why are you resending previous patches rather than adding another series
> > on top of it?
> > 
> Hi Dmitry,
> 
> RFC had only one patch with quirks (to disable u1/u2) only for few
> targets (SM8150, 8250, 8350, 8450). It was later decided to split it
> into per-file commits as per the review comments. Hence I clubbed
> Krishna's changes along with few more targets. Let me know if this needs
> to be changed.

No, it's fine. The text in the commit message lead me to a wrong
conclusion.

> 
> >>
> >> Changes in v2:
> >> - Removed the wrongly added quirks from tcsr_mutex node.
> >> - Link to v2: https://lore.kernel.org/all/20241213095237.1409174-1-quic_prashk@quicinc.com/
> > 
> > What was changed in v3?
> It was supposed to be "Changes in v3" instead of v2.

Then where is a changelog between RFC and v2?

Please consider switching to the b4 tool, it handles such issues for
you.

> > 
> >>
> >> Link to RFC:
> >> https://lore.kernel.org/all/20241107073650.13473-1-quic_kriskura@quicinc.com/#Z31arch:arm64:boot:dts:qcom:sm8250.dtsi
> >>
> > 
> Regards,
> Prashanth K
> 

-- 
With best wishes
Dmitry

