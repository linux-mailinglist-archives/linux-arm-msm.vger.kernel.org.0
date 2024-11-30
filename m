Return-Path: <linux-arm-msm+bounces-39703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF219DEFE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 11:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D90FB2120A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 10:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B62156879;
	Sat, 30 Nov 2024 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p1s+mfuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCCB15573D
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732962398; cv=none; b=e/m8WvjbeLWPb1XCG4WSFzymoVz2YIU4QIBuYxbdQnlEedTJs5BFx0hUM8Rdhey4nwSZWowlJKclMuiacxu+NsUiPPyMcOQ2mhY4YqnaFjNTD22eTUdZrnrGFpvtW3WXqKHMulRWgQj8mKYK8tUfSdY2hHi4HzoOS8oohPO0So8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732962398; c=relaxed/simple;
	bh=eDJQoppfMN1lVMfa4jaHOqGoqkC2saALXH3Q4Rrsb/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8cwX36MRSYh8hSCkilB0J8l+s8c5ObvamVldEtof67X/SXskVoOJ9sS6IRqwSQzO79d/4PLaNPsT9V4yOE2A/k8oorwSeyC10q+1KFv/k1B/7nE3vHz91MwjVF1ZDRBEiUwt4S0TU2Abvae2zMZw7hSabnd+gyhZEDHCZFgkBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p1s+mfuM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53de852a287so2830279e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 02:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732962394; x=1733567194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvTccSJmx0934Um7HOqo8o286KNWawV///lCSR0MDWU=;
        b=p1s+mfuM3q22fyiwRCVTeI0dMR9wnST7RgZTQiCgRlNPtpdnXbC0znudziq4yklVha
         GdhdNGHQhnVdrb0Qz6BOqjJCweOWKB4Ue52VmhvbQeiY7BK6b/W0G+8GZd/2ijsOwXV8
         dgkeXqHyi2cfdIASvriHC7gdSm93LMX21qoPgeVPpwXX4ByzioIxGUMdEZmbd1WGc3OP
         ESyNDXXY4lLxbkIuwEcb6nJoE8cjczJl7LfowDfrAACG+RbxlDJoenRNzoE01QhIqAsP
         yITz7cg4ixB70LXsRBPl/3iN9HmuoHcJHfabCranBKfCQIX6GfFnabHd01x+8XU3QvsC
         K2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732962394; x=1733567194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvTccSJmx0934Um7HOqo8o286KNWawV///lCSR0MDWU=;
        b=Hu4ygItAbivX9MagU1pYFJe0TvJ6xZ6M5WRfEL+1+WQW8sNeIbRGbyiTwWGx+d9weN
         uia1NNZmDET5L+d24pmFyJAr97bTZ3xzIfUCQPEfg92WHHnEcLF1ZaEUH5S021YEZx03
         P9YnpTc8kb44WRq91xewVFmBK2IIpOljnGaer131TJR+YVYy9/+3wtAwpIrJpJ6bTXD5
         dzXVs1VX/h9J5wB+SHJkwJcIVkzDtLjMP/uNTbcunI6k7gvRCOQt6ZUZAem1/ethyhaE
         6ZXuEZS8fDh2ax4QH8JiRAAdZZYJp4D/6G5vHPUmJdFELVSrLgQ00IwWQrhYMvPz2kZA
         Rhjw==
X-Forwarded-Encrypted: i=1; AJvYcCWfTbEOsYaejP6RwV1eNJfqSLAhsRfcMHKGR19aQ1OLDOmoZ6BhW8nQ8pl7bJf3DNHonUmMsDL+NkKmaxLt@vger.kernel.org
X-Gm-Message-State: AOJu0Yya5VIiZgxIttBLtSxDMHTcyCEzp7lHe2fovjnMn9tN0cTRs14O
	MOYkEEtmSeYkbHdu0OnzkhKLuENH2LHozj9W8v4LQkod40ErvoH7Yct9K2via6M=
X-Gm-Gg: ASbGncuKuCJUWQzUC33RE0m/2d/ygLcBSq7+AhzXLCXdvtx8f7wtYci91XXTo5hrmeT
	fQtWkCdxRDk40GlHHKOlU/4we9MCfpqZlYB2CqIibo/hClD0LeC0Vhp/D2sGpsJsmvZO2TceoLT
	uN0C6psukL7FuGJzKXASQ6qLNM3lqDqQZJF+KsAPH/vIoBLHwZGEnI3+jj3qZs9TgrVXMMin8sX
	rOVJo7Cgg2dUoNtUNZGobStVTkftQaEpAgORXOkgDe2fEI/5o7Sx2wNv5p1aRS1ud1QgCJ0Eneo
	UBSJtxmA0NHXAqaX5wkmc0GZLDJAHA==
X-Google-Smtp-Source: AGHT+IGrAqc65dTA3vAAj8VxgDEeVfx2WF/Vu2h5+M8g7PoZsRRzBflVglyba38msIXK/Y9d+/AF8Q==
X-Received: by 2002:a05:6512:3e1e:b0:52f:ca2b:1d33 with SMTP id 2adb3069b0e04-53df00d4579mr5387608e87.20.1732962393846;
        Sat, 30 Nov 2024 02:26:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64a09e6sm739763e87.264.2024.11.30.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:26:32 -0800 (PST)
Date: Sat, 30 Nov 2024 12:26:30 +0200
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
Message-ID: <26lttxx7obu2oqvf4xnooqi3o7qwodhjzyjh4trjq5tlj2gzxs@uwihybmwbdid>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-20-b9a35858657e@linaro.org>
 <83990b97-3f37-47f0-9cc6-fdaa730a8df1@linaro.org>
 <zdhevcnj6gszvaayhu2dghubwm23cdoyeik2dcnqo376gcstnz@xv46iu6l6yvu>
 <90418b49-5b19-4bef-b0cd-398bb562aa8c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90418b49-5b19-4bef-b0cd-398bb562aa8c@kernel.org>

On Sat, Nov 30, 2024 at 11:00:32AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2024 10:57, Dmitry Baryshkov wrote:
> > On Sat, Nov 30, 2024 at 10:29:38AM +0100, Krzysztof Kozlowski wrote:
> >> On 30/11/2024 02:44, Dmitry Baryshkov wrote:
> >>> IPQ5018 is one of the platforms where board-level clocks (XO, sleep)
> >>> definitions are split between the SoC dtsi file and the board file.
> >>> This is not optimal, as the clocks are a part of the SoC + PMICs design.
> >>> Frequencies are common for the whole set of devices using the same SoC.
> >>> Remove the split and move frequencies to the SoC DTSI file.
> >>>
> >>> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> This contradicts DTS coding style and all my existing review. Obviously
> >> that's a NAK from me. If you want to merge this patch, please kindly
> >> carry my formal objection for this and all following "move board clocks"
> >> patches:
> >>
> >> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > I'd kindly ask Bjorn to chime in as a platform maintainer.
> 
> 
> To change my NAK? NAK is still a NAK. We discussed it many, many times
> already. We have coding style for this explicitly mentioning this case.
> Could not be more specific... plus all my reviews for Qualcomm, NXP, TI,
> ST and other platforms. I would be quite unpredictable or unfair if I
> gave here some sort of exception while expecting different code from
> other platforms.
> 
> Please carry my NAK.

Of course. I didn't mean to drop your tag or your objection.

BTW, would it be possible for you to clarify the policy on external
references? I mean, is it fine for DTSI to reference a label which is
not defined within that file or within one of the files that it includes?

-- 
With best wishes
Dmitry

