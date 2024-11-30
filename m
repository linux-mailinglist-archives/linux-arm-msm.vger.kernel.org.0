Return-Path: <linux-arm-msm+bounces-39700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB69DEFBE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 10:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1753B21164
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4518C155335;
	Sat, 30 Nov 2024 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j8wdfpN/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626C014D28C
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732960669; cv=none; b=fAAcLy9qQzbOFCalaRD6tsJr6iynz/hxQWtxwQ9Mzt4f1zteGFEAWgj1M3x41zbLvNSzG0/xSgsqeQVpNpBRYb9CzLrpn1P9GYJ2RnjRpiR8E1NPtYyQ3+UDd96Trfp7HoxJMTTdphTGR11e2vlIBP3TVJhjkVFpnGDs2MBzpmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732960669; c=relaxed/simple;
	bh=YIBpB2xE1kqIfJ2YLuejnuVyeiazkUuFy0aLl8X/CHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIXgt2lUw5awK0HsMT58+z2tit0kTC3TDY8UnEpbXgD3aXxk5C+YGvbODfTk02zHAQ1wafp+Nkc+vN13SOS265uxvuNYDAsYkE7cOHMzzs8v7k/AGW7iWdWxhR44yiebHZiwa0c4Np24Rlgkc26LA2YnnwMKSxOBni4SozY70gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j8wdfpN/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53df63230d0so3125309e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732960664; x=1733565464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayhYxiSJzuTPfKXgE0zJrJ7ilcsRu4Gvm8cOkR8Pij8=;
        b=j8wdfpN/npsp7D6THdpQLH4re3jJ6S1JeDodbcVXr7e8k6kz5GozCXw6pva80f+Ois
         OWH3SLULFuM8wn1nA1IktEVD/PhaZF33XjufS/n/Sd7wmKEvqp8VmTEnLvuOrZiJhar8
         5XeQKA9cEgjWZyt173qYDqiM6bwoCC+lKlEywXEjUeO3YB5LAvJ/XsAsuXVcSRrdIhMt
         V0U1/mAdcRw7VJPmpz92H7JAXiP3Ck3sHIXkfrh4V0wXd8v9d49jBTd3GpFAv+tRnHzd
         1HZ1zjlu2uUwQGWl38zjMQgOMTN+2UkQZemNwkPao3JUA3zKXa3boWLDCnXNi800qNQS
         bPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732960664; x=1733565464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayhYxiSJzuTPfKXgE0zJrJ7ilcsRu4Gvm8cOkR8Pij8=;
        b=RdzM4zQzAZ3wzFfAU/A6ZGThD3yDP0v326gUS8LNS3ulQ8unPiVtxJzb1H330UuOxQ
         izb1Tq8OTwfp3fyg0MYxp4HGoYJxoDl4NKwNsRqrlf9rf6bg0BdkcL0S+I7Aid0s6qxw
         br0VCzMV4a4tEopdHUmauHpw7Ewkx9Pg/jKPk6OrpdaBGoxe/MgxriSWGAVyLgBIs80k
         xiGQsb7swIC5T76DEL5EX45XdRgz6ug6ZwPMXnuTqcLHO8OA1JwpQfo0F1lqktw2MEuJ
         exbtibTWdY/FibhHE2bbPf/fvTEBPyy4jMX4akNRMU4PONaBUHUBIWYkoNIJVm1gWLEM
         /fWw==
X-Forwarded-Encrypted: i=1; AJvYcCVrPu8IUKQNSDRv0MM7BAdgrbmjzb4KIiJh5J9YiW9+HWU9tJBISOGY5NzLoz6vI0K+IjQRQjNdpvsQ8ieH@vger.kernel.org
X-Gm-Message-State: AOJu0YwtLK/3iP+rI1QdZFMXU0/ysyBTFAV2+6xnOsVwY5PfRtLZXyQu
	6+zVqVpxpZkm2T+hAppfjn5pco+kCi11O2pHh0PuFJTx3ApHlcOqk6Owb7ZsGz4=
X-Gm-Gg: ASbGncshvWbjqJCe0uO71UteD1vq7Liklg3+VVblnK6ivBzSGKvo7zvslJncjrpXCgM
	ptwly8R9nTTqVu5oOXSeMnnRfUVQ6tEcueW5KheilNjKuO6gbaKtbXyKI356XePC9ndp/8M7csm
	2/ReR83bpWCxLsz8drZR/7671/uOxUGL9Ss5E7tMBRc+/ka27LmgFJdejrLnbP9Qb5qsK+9jIqc
	+f5821E9mz6ZhEvrHnulKffARvC9eto3aPSSU1aQLjgp3HNAGZPZL1wY4LEJk+s1stcHflEQLvY
	241pn7ZodERiz42H3W+SeE9TOkim2A==
X-Google-Smtp-Source: AGHT+IE0kaUxRUyiwhzjR7KOYu9LRoA5PMpmgImUKZcJzs4qoeA8sIkGUNfm6CoNnOx71nPvgxUmyw==
X-Received: by 2002:a05:6512:3e1e:b0:53d:a9c4:9ed6 with SMTP id 2adb3069b0e04-53df00dc9a4mr7704840e87.25.1732960664465;
        Sat, 30 Nov 2024 01:57:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6431858sm723340e87.35.2024.11.30.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 01:57:43 -0800 (PST)
Date: Sat, 30 Nov 2024 11:57:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Joseph Gates <jgates@squareup.com>, Georgi Djakov <djakov@kernel.org>, 
	Shawn Guo <shawn.guo@linaro.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Zac Crosby <zac@squareup.com>, Bastian =?utf-8?Q?K=C3=B6cher?= <git@kchr.de>, 
	Andy Gross <andy.gross@linaro.org>, Jeremy McNicoll <jeremymc@redhat.com>, 
	Rohit Agarwal <quic_rohiagar@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, cros-qcom-dts-watchers@chromium.org, 
	Stephen Boyd <swboyd@chromium.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Martin Botka <martin.botka@somainline.org>, Jonathan Marek <jonathan@marek.ca>, 
	Vinod Koul <vkoul@kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>, 
	Fenglin Wu <quic_fenglinw@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexandru Marc Serdeliuc <serdeliuk@yahoo.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	James Willcox <jwillcox@squareup.com>, Max Chen <mchen@squareup.com>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Benjamin Li <benl@squareup.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 20/31] arm64: dts: qcom: ipq5018: move board clocks to
 ipq5018.dtsi file
Message-ID: <zdhevcnj6gszvaayhu2dghubwm23cdoyeik2dcnqo376gcstnz@xv46iu6l6yvu>
References: <20241130-fix-board-clocks-v2-0-b9a35858657e@linaro.org>
 <20241130-fix-board-clocks-v2-20-b9a35858657e@linaro.org>
 <83990b97-3f37-47f0-9cc6-fdaa730a8df1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83990b97-3f37-47f0-9cc6-fdaa730a8df1@linaro.org>

On Sat, Nov 30, 2024 at 10:29:38AM +0100, Krzysztof Kozlowski wrote:
> On 30/11/2024 02:44, Dmitry Baryshkov wrote:
> > IPQ5018 is one of the platforms where board-level clocks (XO, sleep)
> > definitions are split between the SoC dtsi file and the board file.
> > This is not optimal, as the clocks are a part of the SoC + PMICs design.
> > Frequencies are common for the whole set of devices using the same SoC.
> > Remove the split and move frequencies to the SoC DTSI file.
> > 
> > Suggested-by: Bjorn Andersson <andersson@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This contradicts DTS coding style and all my existing review. Obviously
> that's a NAK from me. If you want to merge this patch, please kindly
> carry my formal objection for this and all following "move board clocks"
> patches:
> 
> Nacked-by: Krzysztof Kozlowski <krzk@kernel.org>

I'd kindly ask Bjorn to chime in as a platform maintainer.

> 
> (I'll respond in next patches as well, just for formality/b4)
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

