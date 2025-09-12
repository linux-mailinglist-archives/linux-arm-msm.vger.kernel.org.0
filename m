Return-Path: <linux-arm-msm+bounces-73322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E46B54C1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 14:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A034EAA22EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6933054C1;
	Fri, 12 Sep 2025 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sOLFe6yr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66143311C24
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678073; cv=none; b=Yc/Z3a6BkBW/Gap+PT0WMssNsad5zvlDBCOzjz21bOHJivFECD/asrOT1hH9c4z+nmEROa55W5UwJUpxtfp13Ase286c6nXaguwHk6PYBI2Ayfk3p/lhYfaBNI+PjGJ/8LHoCNU9tk89HNHofZ3ucgTA/RAPGUXTrLI600It6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678073; c=relaxed/simple;
	bh=8dgmXcEXo5nsJzSSoA3jVdxEsyn6/n1s9RzyN/4VNOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKaQVrn/WgAWa7HzypaaBaL/O7FDDA6kCcJ133k3bbfW/gJN+i3ksPYIAGbpEv+cbbKMcrPX633NL/2p7xthNxrzKQFNUI8YTgZvkGYI9RppBLfvFKzB+SReD2mXITGUISFlAnxXuuoTOtDKecUVMgjdbbLZrBCQG/LIvtah2qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sOLFe6yr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3e07ffffb87so1042095f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757678069; x=1758282869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKMe+P5Fr/vS0uG6/IhnGfpfCTdnh1yfTxc2uPgb+IY=;
        b=sOLFe6yrJegUFi/E1thfflAhGqdGSASQdg5Vtp1Pueew9X+Oyu+rCc8QOsubSTv0Z3
         tbljMU4JtiuSdxNCDnOwT+K/dK0pacMXAkJyuh2UkzlZiurZzgiAUBLvT5hKCU9Q60iJ
         9bmTM4gR8c1Qme2rI6WXDiZjqW245+LqnzFEqH5rSw1fZF27euX2Q1O0kNhTV8jGqOnv
         oP01yLp2/pGVSSA2tw1PfBJlTHKhShLx5ZDl1GRO6TTWxkqPXEk1J8prXCaiTjI/AHF6
         YbhwyufGzFNKbGVX3wJ7wOXVCx3rwMQTpXTshMXhhN6pDqJr+3xM0c5CIlkBEYrTMjiY
         8Ieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678069; x=1758282869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKMe+P5Fr/vS0uG6/IhnGfpfCTdnh1yfTxc2uPgb+IY=;
        b=Asv9kRiXP0MAf4D5KsVQUm92r+hhv+XEzFCvjVQx7amSZ4YTZeeenDZzJjPFnmatVd
         OQEHcjYm5GpepVOPRMkAro0RJccz9EhRx16wa//t/W9h/MM8AgFqLrPkdffLhk8eNVJu
         q2touiWx/KKXJyGoXrd4nQGxRB68n/HeiUsoG1gSu62Rrb+Y7ol6UyKCPP36ccYnLZ0x
         MLjLF1P3za9GQ9Qm6HBqRVw6tItZyXJ/Itp5L0K8Rj6cUQV8gBYgrHScCD86DwaWhZgc
         56qQ8bhpFCRllMpZD8kYkqZFsgqr6o8wxH3qhzhOyaVj4xIAh5ufEMcrvmjCixR4z9kJ
         /HHA==
X-Forwarded-Encrypted: i=1; AJvYcCU+4JzSm1MrsQx3aTzOsVzJ3doB3oho9LfvugqNSe+v4+WQgp9hQ1KO1jrFVQ9HXJm5DPgssqRkvT0dBtuP@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+hTN1e7CNyIjV4T8dfEMNs7BgqrbRSZR7WaZ9wlLyq3hT/sm
	Qh1l9puU7OgJycGnzDKDRCwZ6NBsP55vbJQJ1towYKNoZl9WA7nJM2HltB7qSqBxQlk=
X-Gm-Gg: ASbGnctCNYCKn7Jf9LApwZz6OmUcBYAE84x/C2crys9TgUGOugHqxTMq6Yz6nJKMyMJ
	vwUL2pVQt6tZoP0dNwZgk6grbT7WcwnNtHueHflcJegTLwIMBQASOWDDQdeL/+/KhCvjnfQ+aT0
	/x+wsJLyiOtpaIoQ6cJY+NerCfGjQJ8/jscntnJUTB5Ao/yjTrP6A2qb+yh/1Z1h8QfX2zOVFvo
	ub+pK3hn6KIWvm1LN4Rv7Sizha4Ao1CKj5hSoxCY2I9Dr4ZnHlsISnJ8NI53xPjOEdoM04AMoNS
	kfgT5nYw8G1DsBtRIK1pocbsul61M3OPV3hWnqSf4NPG1eCSvBseYX+Xa1chUI9nCszIYISRZX0
	mxbZQgHxaorDJlshx8yUEyJhM4JLXQu9W
X-Google-Smtp-Source: AGHT+IHZe3QhjYeZXRc81ioWKEpY39bxTqa5DxavkXwYBbtVB2Q2U+jSa501cmQkL7HE6ZiRiepFww==
X-Received: by 2002:a05:6000:2c07:b0:3e2:e079:ab32 with SMTP id ffacd0b85a97d-3e76579abc9mr2041088f8f.7.1757678068685;
        Fri, 12 Sep 2025 04:54:28 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:e708:677f:913a:8288])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd27dsm6186965f8f.41.2025.09.12.04.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 04:54:28 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:54:24 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] arm64: dts: qcom: x1e80100: Add IRIS video codec
Message-ID: <aMQJ8Nb7TZNmD1Vq@linaro.org>
References: <rPv92n3EVkoRrO1v7nlw_tPMn-nHUhpYhQP_FjmQsESL752mly20FWQqPHLs8JHGC4mklm9wfPABc5kd-x4LYg==@protonmail.internalid>
 <20250911-x1e-iris-dt-v1-0-63caf0fd202c@linaro.org>
 <980b7247-e8a5-40bd-ba20-c9c72c8a397a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <980b7247-e8a5-40bd-ba20-c9c72c8a397a@linaro.org>

On Fri, Sep 12, 2025 at 11:24:21AM +0100, Bryan O'Donoghue wrote:
> On 11/09/2025 19:38, Stephan Gerhold wrote:
> > Add the necessary definitions to enable the IRIS video codec for
> > accelerated video decoding on the X1E CRD and Lenovo ThinkPad T14s. The
> > additions are largely copied as-is from sm8550.dtsi with some minor changes
> > necessary for X1E.
> > 
> > The PAS interface used to boot the IRIS firmware is not functional in EL2.
> > The code to start it without using PAS exists already in the Venus driver,
> > but was not ported over to IRIS yet. Discussions how to model the
> > video-firmware IOMMU are still ongoing, so disable IRIS in x1-el2.dtso for
> > now to avoid regressions when running in EL2.
> > 
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> > Stephan Gerhold (4):
> >        arm64: dts: qcom: x1e80100: Add IRIS video codec
> >        arm64: dts: qcom: x1-el2: Disable IRIS for now
> >        arm64: dts: qcom: x1e80100-crd: Enable IRIS video codec
> >        arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable IRIS
> > 
> >   arch/arm64/boot/dts/qcom/x1-el2.dtso               |  5 ++
> >   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  5 ++
> >   arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  4 +
> >   arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 87 ++++++++++++++++++++++
> >   4 files changed, 101 insertions(+)
> > ---
> > base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
> > change-id: 20250909-x1e-iris-dt-eb0494a130ca
> > 
> > Best regards,
> > --
> > Stephan Gerhold <stephan.gerhold@linaro.org>
> > 
> > 
> 
> Could you please include the Dell Thena variants in v2 ?
> 

I didn't include that because the firmware-name setup isn't as
straightforward for that as for the T14s. I think all the Thena variants
have existing "firmware-name"s for ADSP though, so I can try to make a
patch that adopts the existing prefix for all the laptops that make use
of x1-dell-thena.dtsi. Or even better would be if you can send me a
tested patch to include. :-)

Thanks,
Stephan

