Return-Path: <linux-arm-msm+bounces-36132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFF09B2AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68810B21B66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2401990DB;
	Mon, 28 Oct 2024 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRgY1ReU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34137193091
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105342; cv=none; b=BsvENTjeQvFsZfYiP7/4LCTMD2tqrvv4PBC0fXPLl1BUROElWRSuaH74LKWLb1mkGRJOhcey6LFvK3AXwbtVj2VIje2RK9kKXVHGj68h1sMhWgvOUs5Lu6lemLoyBk2G7O/XYo7FCnVCdfmG2GQZLiIAMEL4ORU+s7PaOvN8hnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105342; c=relaxed/simple;
	bh=YmzdiVli4lYby9EUWBotCYouDofIO5rwoTrrfgeeQ2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJjg9TFbJ17tFsa12JXlu8hjw0ZGjUF+WOSMbGnXENivowoByrkcyE23U6b6F7GVVMQqZl66G1DQIq+uCn+xKgEvuuTxYxYiptxQsO8+XcwJAs5xNtK2xeIhv2+gUp1JGwpZrqCYst6k3i1VtrckyD9DFgQjBnTr8LgDH1klKAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yRgY1ReU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so41515265e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 01:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730105338; x=1730710138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NZHqE5FIZcWpwQkY/RrgB0YFJ0n6wWMGAIU6ebDFpm4=;
        b=yRgY1ReUAeABQ6NWrAOmhmC1uv1dRMA+lxwSwKaHLvIoUg4dRF372oBxiFdOauRUWQ
         EsbJmum+E+Rx7EVzPPBYpCWBVmXyaH5AsJYCa/7nkHl9deIgHo3O7XgaieE/BuvQgTfS
         0XpLR1BOg1iLbPO0NFuQQmigC5gEdkYWGrbtja4Vs/yRWm+5pGpi/slJnc3sR08xhyJN
         gJuCAuCO7qVhhdkzf4d+G8zhKExMxzXgrlFmVu5CQ+6PqjGPi0VkwCdw0flaLNvRrJrh
         TF8Xy2zuempPj8E/NPjJa+0T5mG6EsJkpWzquacsOiWiAFjeUDdPIeGrXWK7chmgKt8A
         LrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730105338; x=1730710138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZHqE5FIZcWpwQkY/RrgB0YFJ0n6wWMGAIU6ebDFpm4=;
        b=do4b2gdalvLxlo2dcODXlj6OizxtOJ2tXpjfA09VjkijIV7KmwxfPF/FkXUz+tfRV2
         eUkfgPXxRtVE1Fz8aU92vMeyHmil6foboAc/nFSZGg0nYv1GSopFC2cPY95M7HkPSJce
         VN/rCd35i3KArkkGM0tVrMte7qWmnWdN1Ear8btdwVxxyF1GhbWpTNz+9U7OV3vPC94e
         6RmjI9A4Rz3P6zBgTZmvo8A8CvmyT9f375HRMK8jyD6WxXoTeD43bvafgT0Xy1BlP2Ls
         GnCpd0yWFD7NrkFRSJOazPdox0Ay7Td7RbG83xUUniq6UApozhOEi4+4TuvB6/T4GcQO
         SzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzODcdMdg/hi6Lq7okEHJmMEbzufZcg5TbJYmY4JTlKmimrVSzsOlsUxDsqU9IHzmiHMqStEawLP/mTtPT@vger.kernel.org
X-Gm-Message-State: AOJu0YwtSTozwzPHEhrZS/FPAPoKFB1KWBjB5vrqmAwcDQ07RacbLM8z
	juC2SJAIEcjuFKmXcC2PrubbaZ15deUorYngqkguA8m+llNAkmzh34P5ep90ku4=
X-Google-Smtp-Source: AGHT+IEFxQSc2bqcOE6ZMtPaTM9U6ny4QVIlaUduSs6ZEGDMn5VQh1w848qM/SJNHxs0ooF44YbSVQ==
X-Received: by 2002:a05:600c:458f:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4319ad02659mr61662165e9.25.1730105338472;
        Mon, 28 Oct 2024 01:48:58 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5430b6sm132596245e9.3.2024.10.28.01.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:48:58 -0700 (PDT)
Date: Mon, 28 Oct 2024 10:48:56 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100: Describe TLMM pins
 for SDC2
Message-ID: <Zx9P+HQMOkJsJGcj@linaro.org>
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
 <20241022-x1e80100-qcp-sdhc-v3-2-46c401e32cbf@linaro.org>
 <a282021f-5e61-480c-84c4-272049e28244@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a282021f-5e61-480c-84c4-272049e28244@oss.qualcomm.com>

On 24-10-25 20:34:19, Konrad Dybcio wrote:
> On 22.10.2024 12:46 PM, Abel Vesa wrote:
> > Describe the SDC2 default and sleep state pins configuration
> > in TLMM. Do this in SoC dtsi file since they will be shared
> > across multiple boards.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> Not very useful on its own but okay..

Fair enough. For some reason, I'm not able to get sdc4 pinconf
to work. And there is no board that has a slot populated for it.
So I split the pinconf for sdc2 into a separate patch to make it more
obvious that sdc4 one is missing.

Let me know if you still want to me to squash this into the patch that
adds the controller nodes.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

Thanks for reviewing.

Abel

