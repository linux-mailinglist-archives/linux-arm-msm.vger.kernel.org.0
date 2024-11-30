Return-Path: <linux-arm-msm+bounces-39707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA19DF006
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 12:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40390281711
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:08:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28761155336;
	Sat, 30 Nov 2024 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tnvVy9lb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C928EA
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732964909; cv=none; b=T2bdYfSAouXL9LGDqUF3vijP5nmGbtTD3i1ljawDvpZ2ovbAdbvZDDdQMFTiGnyeT506qsuUQGJHsW8sKnZiIgc7w5T1ZmeQUHJh8sHkEzlzw3qrMJDNTnEH/6Krlb4AuFeSoCxht5cpe+r6+zD9g0r+cvHuw8+ZwW0hpHpBX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732964909; c=relaxed/simple;
	bh=NSEA1SSDSL084X4JuRKIRhUhOQDaB/BENf8Zl0fCm94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL04da3EyN2qEjDjOclU+N0X64EE+ToME6YQV56pXMhDZdZqrkQHHmH70rsa9QofSEpH9Nii6f9bcSkkjq/gkUW9AaqetBxZNcAM0qz7aj2eUgaW9rYxYXbukwxJjS1+GtsKy8miDa1vKvWjoOR98ottuQiIQM5tobEBU3G3RRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tnvVy9lb; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53de8ecb39bso3089065e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732964905; x=1733569705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VyBDDQ9RN1xVnr3Ge/Kd+7GiNG8p1vU/7DTAOuAlE7I=;
        b=tnvVy9lbXN/RaEfZp08h2oBdrZo1vL/DbbV/igFbwRHTJehpIt15Iel9/kvPgABa2m
         +l4LFIXe7YmkUMyi7s7gEvi/zek7RjHqSIRrkhEIVHhxcMl1wIxaN+seTpvLUOcFcg4U
         S7BFohp6lO1HNVtkR+xFtT+eKyomqz+HvTG69WVR0ewMRy3huC3gvCWJtT//DTTlPC2g
         tVgabiAjOzFhcNIB1hBSpuCknhtNOqoLOJEJWKKMmSLSU74Anhda2XGJ+gNAIIOjkxCU
         sMEKz441kDJmIRmAAQcha2BRbrgRl0tfIaGk0IwZzFZk2zhCaa/JIfBYo++lFW0As77W
         ZjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732964905; x=1733569705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyBDDQ9RN1xVnr3Ge/Kd+7GiNG8p1vU/7DTAOuAlE7I=;
        b=WYVTfRsIFOv4sQbG0xubGh1rjgD5jmhj18zE6KP6M/RleKnn9xs05iX0VIqhGbUhtQ
         DlFloxn6dDp7wQfZ0GCY9XhYxHQCOidEzygmuoGOOtG9H6ATJUdvxhbPN5jiF7XT8BZK
         VlG7nkx+Kq4AEtQT2PmBPzi8biloDI267rgSuCQ4gFs14gAval0KS1d4R6KtbWnYDdKe
         eUBbyx1Y9jf6SLoW9PYZ9Xhqa9Oq7vnXYELz8gfkV0q7uEzY+HSCo3DP8MtFsTgeahLM
         2jtP3/i+O+wnHKoZDhH+24B+58t8uRhW7RmK/0Jkxt+8o3XOQDMm8EHdCuJ/3rOHy/D2
         9N6g==
X-Forwarded-Encrypted: i=1; AJvYcCVreFIs38NDFLsmTtk2U2/+ZlTGZdvmz+qDsq1D11HJsjLzG/y5kGCBny8GyVdiZj7O42MsW34IxA+fK4U7@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/BPbzAPzZsCUX2MIWQQlp3KZGxbIbY8esV4Ly2ESMOV0Yinf
	Spfvu0a7Jojotl8OlcrRy7ovtctguEuWvBkAJB4IZMXfjWt3Ggj7kMJMDD4bmlo=
X-Gm-Gg: ASbGncuDGANwgQMemV1khWttBP2I+NuZA2P5nJEaXyzwBfkHhvmpvF/BXym5M8xtbNt
	jekK/T6AafidDTQxeNK+yXvcHXFlr72vRCcbH0ybnPACWCuGz3aTseuUTUtri41ES4ADtJWfSUr
	FBOsqtqder9r7gsMsFZWgHLwIXS06L+AF9sVFUV5fsR+QPD+IX8oEW8y+c75z0SgKQ+NhAj8aOK
	IyjyeqwCucK+IaNOmSqcIuCbUlL1aPpLo13yjNmx9SslTbULxIcFIxJ2K3p1KvUxCqcDCDD5imX
	iz1IF1D3A0XdZhWgLT823pERkpQlYg==
X-Google-Smtp-Source: AGHT+IGLsmBOtgxyMFI4fiUTJseDYY5c3VGf49SiTbcFYm56bV9Q7A9gzamHW6K2Byi57Jf8ndDGvg==
X-Received: by 2002:a05:6512:3d02:b0:53d:cef7:d88d with SMTP id 2adb3069b0e04-53df00dce40mr8808221e87.31.1732964905112;
        Sat, 30 Nov 2024 03:08:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df643121esm734460e87.56.2024.11.30.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 03:08:23 -0800 (PST)
Date: Sat, 30 Nov 2024 13:08:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>, Joseph Gates <jgates@squareup.com>, 
	Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Zac Crosby <zac@squareup.com>, 
	Bastian =?utf-8?Q?K=C3=B6cher?= <git@kchr.de>, Andy Gross <andy.gross@linaro.org>, 
	Jeremy McNicoll <jeremymc@redhat.com>, Rohit Agarwal <quic_rohiagar@quicinc.com>, 
	Melody Olvera <quic_molvera@quicinc.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	cros-qcom-dts-watchers@chromium.org, Stephen Boyd <swboyd@chromium.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Martin Botka <martin.botka@somainline.org>, 
	Jonathan Marek <jonathan@marek.ca>, Vinod Koul <vkoul@kernel.org>, 
	Tengfei Fan <quic_tengfan@quicinc.com>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Jun Nie <jun.nie@linaro.org>, James Willcox <jwillcox@squareup.com>, 
	Max Chen <mchen@squareup.com>, Vincent Knecht <vincent.knecht@mailoo.org>, 
	Benjamin Li <benl@squareup.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/31] arm64: dts: qcom: ipq5018: move board clocks to
 ipq5018.dtsi file
Message-ID: <wvrelorcsajlux73jfqysgsox5dge7udfvhktt2sto2yg2xb3a@t7cpherrt6z7>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-20-b9a35858657e@linaro.org>
 <83990b97-3f37-47f0-9cc6-fdaa730a8df1@linaro.org>
 <zdhevcnj6gszvaayhu2dghubwm23cdoyeik2dcnqo376gcstnz@xv46iu6l6yvu>
 <90418b49-5b19-4bef-b0cd-398bb562aa8c@kernel.org>
 <26lttxx7obu2oqvf4xnooqi3o7qwodhjzyjh4trjq5tlj2gzxs@uwihybmwbdid>
 <7778fea9-c127-428d-9653-e66e84f23c98@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7778fea9-c127-428d-9653-e66e84f23c98@kernel.org>

On Sat, Nov 30, 2024 at 11:43:34AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2024 11:26, Dmitry Baryshkov wrote:
> > On Sat, Nov 30, 2024 at 11:00:32AM +0100, Krzysztof Kozlowski wrote:
> >> On 30/11/2024 10:57, Dmitry Baryshkov wrote:
> >>> On Sat, Nov 30, 2024 at 10:29:38AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 30/11/2024 02:44, Dmitry Baryshkov wrote:
> >>>>> IPQ5018 is one of the platforms where board-level clocks (XO, sleep)
> >>>>> definitions are split between the SoC dtsi file and the board file.
> >>>>> This is not optimal, as the clocks are a part of the SoC + PMICs design.
> >>>>> Frequencies are common for the whole set of devices using the same SoC.
> >>>>> Remove the split and move frequencies to the SoC DTSI file.
> >>>>>
> >>>>> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>
> >>>> This contradicts DTS coding style and all my existing review. Obviously
> >>>> that's a NAK from me. If you want to merge this patch, please kindly
> >>>> carry my formal objection for this and all following "move board clocks"
> >>>> patches:
> >>>>
> >>>> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>>
> >>> I'd kindly ask Bjorn to chime in as a platform maintainer.
> >>
> >>
> >> To change my NAK? NAK is still a NAK. We discussed it many, many times
> >> already. We have coding style for this explicitly mentioning this case.
> >> Could not be more specific... plus all my reviews for Qualcomm, NXP, TI,
> >> ST and other platforms. I would be quite unpredictable or unfair if I
> >> gave here some sort of exception while expecting different code from
> >> other platforms.
> >>
> >> Please carry my NAK.
> > 
> > Of course. I didn't mean to drop your tag or your objection.
> > 
> > BTW, would it be possible for you to clarify the policy on external
> > references? I mean, is it fine for DTSI to reference a label which is
> > not defined within that file or within one of the files that it includes?
> 
> 
> It is fine, you have plenty of such examples of shared components like
> some audio blocks or PMICs.
> 
> All Qualcomm PMICs DTSI (e.g. arch/arm64/boot/dts/qcom/pmi632.dtsi )
> reference them. Chromebooks are even "worse" here:
> arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
> Nothing gets included there but hundred of phandles!
> 
> Are you planning to "fix" these as well?

No.

> 
> These are just Qualcomm, but same cases are everywhere else.
> 
> But *that's not even important* because I do not suggest to move clocks
> to DTSI. I suggest - and was almost always suggesting as best compromise
> - to follow DTS coding style by doing opposite of what this patch is
> doing. That's why I NAKed this and following patches, except last two
> which are different.

If you remmember my first attempt was implemented other way around. But
I think it still better to have both frequencies in the SoC dtsi, it
points out that it is tightly coupled with the RPM CC (and can not be
easily changed), it saves us from 32 kHz / 32.768 kHz / 32.764 kHz
typos, etc.

-- 
With best wishes
Dmitry

