Return-Path: <linux-arm-msm+bounces-51582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16699A6409B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 07:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2093A7A5107
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 06:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B1E218ADC;
	Mon, 17 Mar 2025 06:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tw1G2f7+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311821506B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 06:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742191463; cv=none; b=Q9S3lH1k8Oy4SBBfwhbHvtH442ibXf/uANNLAP8aDyKYySbbbfFoaN9LOAdDmWbgh5S8ZaSdnJCT2MoeOgIifArHI056T+I603U2VlAjOhQzgo+if2Ku/qgGeRYQ2+xG63u5V8gxIsk5yIDz64WnppzZDhL+mAyDRDyHlza60Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742191463; c=relaxed/simple;
	bh=ml2pvES1bcDjWG1BADG1sOaAPR0s/wjw2CaSm11wlIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QArdbw8cklUnX5sWd11oOvCOKwhYcPpcljScxq/phq5zq1YsbE1M+MGneHFEsfj2b4XIKEm3g3aCmlMKQPaDlAIVIKpl21Vr3FBIjaOkn7LErfa/5nRp80gl+F6UCThD8fptPC3B+gELNyP+DSIaSt9nuNg9mnvnfQolkLt+yCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tw1G2f7+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2255003f4c6so65276625ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Mar 2025 23:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742191461; x=1742796261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v20yzStT9VGAjU5GNTzWqe+zrXLJCLLqnxAXXWJhWaw=;
        b=Tw1G2f7+LfQv7ktGT03S9FxFTebGzxflYagBecy+MgOBt3Ptmy9JwUCGl/Rt1yWNcj
         PEjVEo/cUwks097Aqz8dFcz0LenhLe9AMZEAGIDgDnT47JzLQAphYsUtJENLLsGkQvNE
         cEHXUvQruudAaq6yLO4DhmP4oIVeck6QolhrIFa4uRdhcCFHJZ0b18zitdNXDCEQkfrf
         uRTKi+zSLsOUwPjwT/dY0vAfJORRbBXxMHpTAvOurSl6jFeIUnOqI47U+EfbdS/CHYXM
         Zn0iZkAe1MyIr24VTh4qjYwgMgVcrny5Vu380G1S1MvDOsfcY6LFcZUc6cj/yxziER4Y
         qs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742191461; x=1742796261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v20yzStT9VGAjU5GNTzWqe+zrXLJCLLqnxAXXWJhWaw=;
        b=MR2aGSGpKAhOd24NCX8nlITA9FCRZsBgp23tZtDsMuE4mjxpRDubT2e3nes05u/5qd
         b9jl8LAMdoywp/eZAEfnOblW5p/+UOEOgxPKFwryD0NLRY9ytY0a8yEd8Res40soS3ZZ
         eZGMMoJ49takZVZ955GBpVX1HZDxCgbM/vQGTeD4nXkfzmwthd+u1T3OMdFBvn02arsm
         wa4x6Ht+z6F5QFs0lecAYsjhjnKQSrU4SfTxw3n9p3Ee9XJh4otNtFyj/C3xrNh9a4bh
         iP/txs4ukysuMXA6ufCJYSUS00jtbL+VtCeC/wdRt/MLyL6/1DHQzf2NvXIOm1x0vmFv
         Es1w==
X-Forwarded-Encrypted: i=1; AJvYcCXHlIHztrzHlO4M74HM617zfrBzUBkI/US6ANT/MRhPyX0Yk224z6pvbw93hR0qXQQTd/KOEAt4B1kik49k@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3WkvH0Pv6JJB23wO/SJ9Y8w8TE9WEa2l0oc5JozS+71viWuvk
	SgH98wTEKE/i0ktANUJ8qKs3uVItw5INwtJGFN4P5ALidAtdcAfZr12waD1zoGE=
X-Gm-Gg: ASbGnctgT0U8CB0HlRO+vg6N3z0WPxlC1t5KWs+5VbMVbeKpd6hTJpqSF4mqQLXuwlK
	EybUjoXvoq/c7V9Cdc/bIMA4yqXgdA/kOm00Wm7efKeJUUsygV42VgGzgCBumqdPCv1SOYp0DvC
	WcrKy6UsMGY3Ac0ujtXifhwplr81RBt0YNQ3PCZCttaLPW7sF9zQMjZn663c0+NqRi0gN8SPLa/
	AXvswqlwffiC4ZnnUr6Iyux0QB3T6dnxf4VIhZOAQhPeqdnEMNuE2Kaj80SWSMmM0nPaijZeGkg
	8LzUOJDDbOQZvTiOlAnQdv+rXDgeUDVtyXm6IK4hdZEriA==
X-Google-Smtp-Source: AGHT+IFe6jS1xlWkF22sbp8P4KRa+3Fa3e1mF+gfQI2nbyw2sog0uD5R60+Qr90Q84NCNk2zO7PuVg==
X-Received: by 2002:a17:902:e785:b0:220:fce7:d3a6 with SMTP id d9443c01a7336-225e0a75becmr156086615ad.23.1742191461318;
        Sun, 16 Mar 2025 23:04:21 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371152951bsm6998422b3a.15.2025.03.16.23.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:04:20 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:34:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: cpufreq-qcom-hw: Add QCS8300
 compatible
Message-ID: <20250317060418.7vmdznbz2igeppw6@vireshk-i7>
References: <20250313-qcs8300-cpufreq-scaling-v1-0-d4cd3bd9c018@quicinc.com>
 <20250313-qcs8300-cpufreq-scaling-v1-1-d4cd3bd9c018@quicinc.com>
 <20250313-valiant-fine-giraffe-c6acdd@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313-valiant-fine-giraffe-c6acdd@krzk-bin>

On 13-03-25, 09:52, Krzysztof Kozlowski wrote:
> On Thu, Mar 13, 2025 at 11:33:39AM +0530, Imran Shaik wrote:
> > Document compatible for cpufreq hardware on Qualcomm QCS8300 platform.
> > 
> > Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied [1/2]. Thanks.

-- 
viresh

