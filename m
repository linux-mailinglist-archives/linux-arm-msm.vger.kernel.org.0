Return-Path: <linux-arm-msm+bounces-69775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C1B2C812
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 17:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D417E188995E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 15:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B819728000F;
	Tue, 19 Aug 2025 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asyH9tUP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D9275869
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615919; cv=none; b=HeRbaVsCuCO/DIb5u8Kah1rDA1cLCrDpZa2OA8eevTiy862jwxAkJ8FpUnsxPMRwhU99j7YpG66z8MW1CB9FHLDm2MWSH8zb7PpQ0HFIk3oJQKhbNE5mSeZ7hACHk0xLBr0hV7O2i9Ha2KPWtWgNMI6N72Vn33Xcp9DzbvwkL6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615919; c=relaxed/simple;
	bh=TIX+Ee8NEb/a3r6gXiqiPEEIYEocYif+rv1rShliL+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XhQLFQ5qH+TTXNLgCizeSEA2LliO23GWqtUNequ+iTKblloFwl6GnZpDx17cokwG8POrsF3+7cmMHDQlzQgBofUQCG/Jh7nYRlKjFDMlxnOTSurugfSt7Fmv4sSOyMzpi0DDsVmsbybW41UXsOaYTbzRvMd4GSxC3ftYBrh1u90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asyH9tUP; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7a0442bso795951066b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755615916; x=1756220716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HB1TK8MiMyt5D8q2I3xfM+5BRtgJsqXxPf3TbQkOCwU=;
        b=asyH9tUP5pbEhC5pkZ1VMfczlmotEScbp7LbSWcwf5yQAtbFQrnFI68DUtVDQLgnz0
         ZG9LJJCA6QI8MJNkcsbNYiDzPbAoMjbYbZtwoZd8JVAVGSx0OaRPsvDo5WT+kGnXn6d/
         mYItlYMeV9yA0jNgsuolekn58VXHf1g2HcU5VDNx6SUCyMNZ6M6/TmKuLW0pkDMZLDtF
         nGq3DKOrGiKi8vh9qV0pr+BCX3xhKge/CVK+kuD1jpE6BRqZlMZze4/YpDR99/jHkcvb
         FzQKz/HkgFK5m6y943oEORVt3pDx/rs+Gz10b9awAccUmKU6GOwnw3njkFQl/TwKnAXm
         i0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615916; x=1756220716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB1TK8MiMyt5D8q2I3xfM+5BRtgJsqXxPf3TbQkOCwU=;
        b=aUDqUgCsIIFbvr3BF0QSThzzCCCJlHzmcnHta8g33ueJryJonqIIzJccXH/URDrnxj
         h+e32QlkBNUjLSBn8kxDqUrgklBevm/nLuKQh0OQVNDEoBB3kRhajGkLq1hfERWvl4NE
         Ds0qYMaKJ+ThhycEBoedKzEk9vbMObKYm4KswnrQMKVBG1kMfF3Kdjz9c8tK4k2/pCLX
         r1DeXfqBYSEnIe7mmTXlzWDUCNBp61xgdGhGDT+iFcMayBFcv8eOY6y0yFkG9o6y1rK9
         rHIjyjM90TvOIE6txE9JjjBv4L6qwNB6y7UP66LGFfdYYgQ3LsK2DzA+MjQV2fu5T/a5
         BZJw==
X-Forwarded-Encrypted: i=1; AJvYcCWW+QfP+x9n5WTV3JERnMB88dp3SmxAWFrd084i4HsRptate3lYkFsE6nI5ZRvHtTAuLH5EJAh/uYd3R60D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ksbkHo7FTqUB7rH8S7+y2aJ0htswLzJx2ALbIExWFdH0kkSD
	7nGO+KpYX3VXoS6KRDz0rFxQtR2QoPxiBfq5KzfItbTbZdLZBmFR+HSozgiEAxDgzpo=
X-Gm-Gg: ASbGncuHt9ydGhYNalieQfThLab5UEriFBnSv0qfbsgsuvZHq9VAc7qHqs8DIkseOBP
	2NpbFbUwQdSmKrbwijwyyQ/elgNaGYmTFdmkh+6oU79c+8pc55wYJWYr/VeGZ0kEyqw33JYAoK0
	noTE+3P3aosZJDK94NjaBJ5ce0g/QeGPQE65nj7JsJNtDT2I5k3WXuMXthoNvFgeFeGLOsFwNDe
	uRyEusl//Ss/YnHepHpOxFZCxLOEg/uUsR7I6rQvG64nMSRCDs2pv+/XLB9G5sW7Zv3pWAmwxKt
	/7ZRpGsmZnEj0MXhJhQ/ONvsmf8xjpx/fD07zt8Lm5vULnr5B5O9dDfVUSPsAGoFkBXaM+tyCQ/
	H0fm8n8RxOBpF1bghJCXlunI55jxvfL1tp74=
X-Google-Smtp-Source: AGHT+IGeywteA2t6LtBxKbFOHU2kX8UJSx3r5/9iIliKQyi/MAgw5IMMeRSE7Wt/KuB7uYx83gPwDg==
X-Received: by 2002:a17:907:2d09:b0:ae0:e18b:e92f with SMTP id a640c23a62f3a-afddcbb89b2mr285426266b.23.1755615916125;
        Tue, 19 Aug 2025 08:05:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:3ab9:939f:d84a:b5f0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd016bffsm1013201866b.103.2025.08.19.08.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 08:05:15 -0700 (PDT)
Date: Tue, 19 Aug 2025 17:05:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 2/3] remoteproc: qcom_q6v5: Avoid handling handover twice
Message-ID: <aKSSqXV5FOW27VJo@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-2-de92198f23c7@linaro.org>
 <r4kjhua4aakkgni2y4feigk5vvaz73ncetdvegic74lhuadosg@s2yzjlgb65lu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r4kjhua4aakkgni2y4feigk5vvaz73ncetdvegic74lhuadosg@s2yzjlgb65lu>

On Tue, Aug 19, 2025 at 02:41:55PM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 01:08:03PM +0200, Stephan Gerhold wrote:
> > A remoteproc could theoretically signal handover twice. This is unexpected
> 
> theoretically or practically?
> 

You could easily trigger handover again from a custom remoteproc
firmware by setting the handover state to 0 and then back to 1. However,
if you find a firmware version doing this, you might want to have a
serious conversation with the firmware developer. It makes no sense to
do that. :-)

In other words, on technical level it is practical. From a conceptual
point of view it is just theoretical.

In any case, if it happens, we shouldn't mess up reference counters in
my opinion (or risk dereferencing invalid pointers etc).

Thanks,
Stephan

