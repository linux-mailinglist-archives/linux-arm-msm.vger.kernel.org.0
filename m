Return-Path: <linux-arm-msm+bounces-67651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BB7B19ED7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F09F3B36CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 09:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1B754F81;
	Mon,  4 Aug 2025 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXW1+1OB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8169244667
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300175; cv=none; b=dMuah23cLSUmyxwOiWvt5wf87qH4io+lvwfdnqKMB/7V7bk/gpNiIWbCn/K748BTRLGK6L+UGnQ4Gh1cKwHDy5eLKwZANd7KGAcHSDPH2bz9XRNz+fUXQ6Fn4lIGhskeQNDPAyIKJEsc+y62s+7la2dciq5kMYB1qhy+xzIliOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300175; c=relaxed/simple;
	bh=0FpsZ6JoH+cK+BXMA2yOEAppQCFXR21ptAdDtJv7E34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUvnxw6O3of8evQHDO/l5j9fSXEiBEw8JRECfIOW+toXPZsiAQ+PV1L00D8tmAhaoTImT+GEUSSldydmTkt0tr4Z8gtV4/k+u39mCOc1qXbDJUrKelI1Nqz4/KNqQn4Gs+kviHGJyYkNahceM1Oy1yRwkAsVNeOD94RyI9/UD/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXW1+1OB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af9618282a5so218852466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754300172; x=1754904972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sx/lxIAWEYJpuVdb8IP1+iNGaxJ4NDbVF47nIMg6N4I=;
        b=rXW1+1OBSpV1cEXvF8uB325VSz/CzCuanFvI5MP+gjCDCDx+Kz/7VhOxxLhDDrLv6X
         PIIdNhgUaWzfnxeDLQLgufbogQN4Y1fv+ym47mSv2dM8udRPe6JKcvAbKL2yLXr4cFDF
         49wDTfH7uEdyhrqEpen8+VDJlV9g5G2g4/vZt8qyAbWg9Vd5pcZhSbaqV3Vjlbmkyr3v
         BTGs2MiQ8HZIBNzQJOimqClGDeCmq4a6oq6jLsBm9z6lrDktYfjBmGnG3MPaATkdJmXM
         dSIDTTqJI8XaNqAOusKmpDDN/F9cqLcxOznDluNilfMCAsBUdGGVpkoIz6uqLLyfBM/z
         wWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300172; x=1754904972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sx/lxIAWEYJpuVdb8IP1+iNGaxJ4NDbVF47nIMg6N4I=;
        b=GLAQQ6lbPl7+AAAiboGq5zdIJjKGBO6D8TBQpQhq98OPq5wz1aD83j35n2CgYZr9jz
         kYfD+K7rjgMQWGSnhQowlMpTEB0VXjO6aSPx4Ry+oCWU+oGVV35dHkNSu349MndIctBo
         yiDBriwkDVHe6uMSTxYQd0+YdOSztVa2QQmY3gzBNCgXKHLlIqhQoiyDZITXF4ZUEWJW
         Ftjh35rvaW2J/a3xcLnLvzrmzFLun0e1aqw/EWalqYkgJ7KBctuiGGrf8xbn2nDnxu6l
         NSfMaPSVP7qdSPpHAfVIFHufObC7Z9++bnqH+eYrS2eujIS6dm55+jIp2YQr8+K6+WeL
         szsA==
X-Forwarded-Encrypted: i=1; AJvYcCWEhSjpPdKL1EYRCjpw2LHQ8Ez8PFPYldhNLwFocsEG6rJouUjCvqX3DawyUiIULDN4APBI/i7lTXrpF+oP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx24vzAMcUNofoFSQsOLmVk/hCganaeoaH/Q/EU3G6TChCsh6Kn
	Pe6sZV4gF+ttrc++QrtMXHlDluLAG6NvAWiJNAf7Gdnn1g8k0C1TMzx8JcPW47ZU7MOXDhzZYl4
	NQSrreUg=
X-Gm-Gg: ASbGncswWNZpOKs2NFWTUHh+ZykZ1OwF1Q11m3PNhue/FsjNPT89vfxtW95CmNPqmML
	7QOAV62KfMFNyIs87lhy42ssQb4I5VRoogPf4Td0/zpdWWwRt1thw3J/xY/9VEArA6tq3oplieX
	PSwoNlMpUVyKoswbWnfneXwNnuMD3G4auC+Z2nJ75TTlNypo0UHD6Vhc/Z3AhXBOT9meh7641eL
	zE055SaKisB+ySkrr1m1jK9SGpa/XujEHBVOmunvFjAMortWcMwIR8m43oRO3yPF9O/XJPmwJcr
	gRbgEcujMZnbnmf5Eu1R74L47WPAokNMvJQOohUdssgZzRU6V0+vptajj/jVc/9Hi/3gLFC+uJ+
	lL1gGCtwslVoTUaskO10=
X-Google-Smtp-Source: AGHT+IEse4UFP82AYQdL5AatCM1CmVz//wV+clV83DiHGQLKKi0fbsuM8BYmlRcA2F5+4QJrB65tfA==
X-Received: by 2002:a17:906:794a:b0:ae8:fd2d:44b8 with SMTP id a640c23a62f3a-af9401b2de3mr877768766b.29.1754300172022;
        Mon, 04 Aug 2025 02:36:12 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078a28sm713481866b.3.2025.08.04.02.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:36:11 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:36:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, kernel@oss.qualcomm.com,
	Pankaj Patil <quic_pankpati@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <aJB/CRBUk+7x2jgT@linaro.org>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
 <aIoBFeo00PPZncCs@linaro.org>
 <784545d0-2173-4a8b-9d5d-bee11226351e@oss.qualcomm.com>
 <aIxRKHKdBHDefDs2@linaro.org>
 <d2c17575-f188-4154-bb63-e0b1b89d8100@oss.qualcomm.com>
 <b2f219d6-d441-45d0-a168-b2cdbc01b852@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2f219d6-d441-45d0-a168-b2cdbc01b852@oss.qualcomm.com>

On 25-08-04 14:30:00, Taniya Das wrote:
> 
> 
> On 8/1/2025 5:24 PM, Konrad Dybcio wrote:
> > On 8/1/25 7:31 AM, Abel Vesa wrote:
> >> On 25-08-01 10:02:15, Taniya Das wrote:
> >>>
> >>>
> >>> On 7/30/2025 4:55 PM, Abel Vesa wrote:
> >>>> On 25-07-29 11:12:37, Taniya Das wrote:
> >>>>> Add a clock driver for the TCSR clock controller found on Glymur, which
> >>>>> provides refclks for PCIE, USB, and UFS.
> >>>>>
> >>>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>>> ---
> >>>>>  drivers/clk/qcom/Kconfig         |   8 ++
> >>>>>  drivers/clk/qcom/Makefile        |   1 +
> >>>>>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
> >>>>>  3 files changed, 266 insertions(+)
> >>>>>
> >>>>
> >>>> [...]
> >>>>
> >>>>> +
> >>>>> +static struct clk_branch tcsr_edp_clkref_en = {
> >>>>> +	.halt_reg = 0x1c,
> >>>>> +	.halt_check = BRANCH_HALT_DELAY,
> >>>>> +	.clkr = {
> >>>>> +		.enable_reg = 0x1c,
> >>>>> +		.enable_mask = BIT(0),
> >>>>> +		.hw.init = &(const struct clk_init_data) {
> >>>>> +			.name = "tcsr_edp_clkref_en",
> >>>>> +			.ops = &clk_branch2_ops,
> >>>>
> >>>> As discussed off-list, these clocks need to have the bi_tcxo as parent.
> >>>>
> >>>> Otherwise, as far as the CCF is concerned these clocks will have rate 0,
> >>>> which is obviously not the case.
> >>>>
> >>>> Bringing this here since there is a disconnect between X Elite and
> >>>> Glymur w.r.t this now.
> >>>
> >>>
> >>> The ref clocks are not required to be have a parent of bi_tcxo as these
> >>> ideally can be left enabled(as a subsystem requirement) even if HLOS
> >>> (APSS) goes to suspend. With the bi_tcxo parent the ARC vote from
> >>> HLOS/APSS will not allow APSS to collapse.
> >>
> >> Is there a scenario where the APSS is collapsed and still the ref clock
> >> needs to stay enabled ? Sorry, this doesn't make sense to me.
> > 
> > MDSS is capable of displaying things from a buffer when the CPU is off,
> > AFAICU
> > 
> > We can do CXO_AO instead to have it auto-collapse if it's just Linux
> > requesting it to stay on, I think.
> > 
> 
> Thanks Konrad for adding the display use case.

OK, that usecase makes sense then.

> Abel, we earlier also had some PCIe, USB use cases where we had to leave
> the ref clocks ON and APSS could collapse.

Then we need to model that in a different way. Leaving those clocks
without parents should not be the option. Maybe the CXO_AO is the best
option then.

> 
> 
> -- 
> Thanks,
> Taniya Das
> 

