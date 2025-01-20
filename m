Return-Path: <linux-arm-msm+bounces-45557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B44DA16872
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 09:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7391609EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 08:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EB5196DB1;
	Mon, 20 Jan 2025 08:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QfK+390U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2074219580F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363128; cv=none; b=klgysVkBbUu4PP7DGw5EIdTnHsMOUPJE8hQjjgIhFiDXg3++lYNUmNkcr1ahlCm6WdHihEJbobEJ9C6naY+CvQ4dA2NdcrtGLOm8Xq6hSq924rUR5L0zsFgmeM5wrDwYCWM2leIVqkf+R6GZsN6qypa+XmfEvajS3jNBy9OL1D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363128; c=relaxed/simple;
	bh=1JUQYuhdGSLcJOMGmrsYFnhon7d1SuCZiQp/dEI6qDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAH5HjXQjH5vxLNS+1gAJaPz7lULwRjnnJr43XEYm8Squb+pG89IGvlg7mlXcHZiSAFQznV+0nQ81CWJ4lD1NLsy25pm01a9tU7UZUwTisZC20fwG0NkU9KR3bZ8ApZFGNwC4kTsEvc7je+b/LLjSVWa34uzlFw5IbfzYXfnHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QfK+390U; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3c47434eso4286627e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737363124; x=1737967924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YTpWMAEaMG9QvbcSNXP0KlGFWbtNf6yy+VBl+0ZfPnU=;
        b=QfK+390UU0vdfjJ4Wqlo1AoyNWMOaLojS3p/BSThGdIwXqH9kWuzeqZtOBzoS5lD62
         oLqAmQBcjDFhZxSouWrvcvfW2jUj4vuaGXwtEpU8vK12KMfAQNi4fi7aPSTsxf517XeG
         3fvqPDl4Ho0oNJXNndyBfacToZ8CbVKoYcimJSzZG0ApkO1znSp1Su5dAnooOZXsmqZ1
         1jp14km/pYKW5ufXAh8Cl8faXJJhLvrrhd1oNKrJ8lCUFVa4ShCZj0Uao6BJdJx/ko78
         EQi64CPP6Uyp4n1pr1hrjqVIox6TocaU+2sF2pMX7YJG77D/tICOtyRwIB2OhruEuzGh
         DgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363124; x=1737967924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTpWMAEaMG9QvbcSNXP0KlGFWbtNf6yy+VBl+0ZfPnU=;
        b=atvZRU/iB8c2h/riAunzkmrjQaSgY5CGODDEAABax3NxhFZycZVlW3YQSMv6bBiiff
         gEVMccmkTyJDcoSUhM4+OQ3zx8mi9hf16+zpJWvGDwXRJUXSNKsx45amF760drcQ5xv+
         sRLIgTWjwF2W9kVO4rTkcx4k0MQQLzLKZQLnSF9m9bDpKRxVhLw8iHmDjPDhisfKF/vo
         2I/H0cZXSKmWAC3pHXXlpnX+3NzYXkEk3LHSKxr2oacLdml3ttp+UJhTjL98GP6E3oML
         OFgqn58l4Ex+Orz2sH+XgUyWfAqUYo0hQ7jfNQ2cA3OQYLBEvSmQSMmvZ6hxr2inuQp5
         Kq+w==
X-Forwarded-Encrypted: i=1; AJvYcCWlFGnqxo7DhOEwJyM314lu3CK1NR0WF2v97vq4vBU4z7yf09uCRBOa3vFkiV9+1LsApZCje1oO6LSRWVzW@vger.kernel.org
X-Gm-Message-State: AOJu0YxzZ0S9Q53N2PBxmpdLLwfv7ylGnRqOzzSL+8vWcN5FXvSBEy7V
	/mbRuMIExRNFCeKgtEdj+4ZdUnONUbEo1NI75HXk4XWzcl9vaRv05XLS5EQL+nQ=
X-Gm-Gg: ASbGnct2Pi7zAj7grlcuqTTct0D7uwQOtFiloqJsPZ+sRCG0S8QZucB5YMAuKWObY3S
	bx1b1djEtmNp+RPQ8zohh33YhmR4T2lzsgkvS2FD1KlmobUNAxgjpPNeIb3johWE2evmDbgMi4m
	xlJ760rQh1hH/iHVzpjOGkj/HRyBhK5fmKhR3hL/wCd8homJmIA5rkn9avDpg3bBlW0kMR2MqPq
	l9e2d7/OHItbPFAklga/sTpnWJMJccnzUvPBqH1TfKI/sSEEHsxwrHdaQfD1xj5VVpmSHn6xjQq
	Eiy9jv1lgVcU7UTevMwcUQ26m/AjbwMLRKGIsvnAr6dh98tXQg==
X-Google-Smtp-Source: AGHT+IHyZ25gS5p5OdMxHhdDuUjFvCRRQRGi9F7ATGGW1jG6/T087u04d/e0A95xRpBXs5gJz2cjEw==
X-Received: by 2002:ac2:4c4f:0:b0:542:6d01:f55c with SMTP id 2adb3069b0e04-5439c216ba7mr4011525e87.3.1737363124175;
        Mon, 20 Jan 2025 00:52:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af07cffsm1216241e87.38.2025.01.20.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 00:52:02 -0800 (PST)
Date: Mon, 20 Jan 2025 10:52:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v4 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <czxiikfvffnfljngec6gdwoapx2khtvltauzhezexkxxitclfn@7pfnj7jtyfil>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
 <20250119-qcs615-mm-v4-clockcontroller-v4-4-5d1bdb5a140c@quicinc.com>
 <173728731976.808036.168078560019330137.robh@kernel.org>
 <a646b3af-9957-4720-893e-9013b2dca43a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a646b3af-9957-4720-893e-9013b2dca43a@quicinc.com>

On Mon, Jan 20, 2025 at 10:10:11AM +0530, Taniya Das wrote:
> 
> 
> On 1/19/2025 5:23 PM, Rob Herring (Arm) wrote:
> > y bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dts:19:18: fatal error: dt-bindings/clock/qcom,qcs615-gcc.h: No such file or directory
> >     19 |         #include <dt-bindings/clock/qcom,qcs615-gcc.h>
> >        |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.example.dtb] Error 1
> > make[2]: *** Waiting for unfinished jobs....
> > make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1506: dt_binding_check] Error 2
> > make: *** [Makefile:251: __sub-make] Error 2
> 
> The code https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/clock/qcom,qcs615-gcc.h
> 
> The cover letter also has the series mentioned.

Please. Stop using bindings for clock controllers in DT bindings for
other devices. It provides no benefits and complicates merging.

-- 
With best wishes
Dmitry

