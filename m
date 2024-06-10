Return-Path: <linux-arm-msm+bounces-22213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A293902879
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 20:15:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C74E2288E8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 18:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E251422C4;
	Mon, 10 Jun 2024 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EIsUgmc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2822EEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043300; cv=none; b=UHtiwD/Y/mi4oCUjSQmE3Xmk/j/aAvM34waaIzAnka4azzVFcPFxCa+XUi9MsWbe7657idatJvm6u46HkIYparR27ZoUfAXH96c4NC/gcFqKgqYDteQwKjpoHfjuGRJ+IiSb61TH0esrHlDxQ1rZlGaJ4ZwMUNkWbte5gKZsdl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043300; c=relaxed/simple;
	bh=5lRVE5EtnGo3l/otBnhj882eevm6nGjXuCOslFjDdOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxcSqQzZTcPcoQOfs8cXHTH79mqeDwJ0+O73cS+FicuY6iwMaWrHqym7xeiToPvMGqhdiehsKhIfitIdKDytmcyUJaA3/aw26N6CW6lFdDdmxHm/PqdOJNlbkue64R6Ke6eeAeDIwkCy8i7MvKQ/T3PHxeqoSMfyt0+SWPHtXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EIsUgmc5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc274f438so348880e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718043297; x=1718648097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wtr16dFLtcDgr4ix78ZJ+KaOFCLgarKHcEOXJWG6N1s=;
        b=EIsUgmc5EzqD7X6sZO6KJkbC8Hk4GQdqEgYWAeROQjirrHYY8enNXFep6FwYdEFtUn
         HpWcEQ7wauhalOCmhimx/zX3pkIAX7kNkOQNsOir6EnZuc2kSC2jVu4Dhz5WllwX83i0
         Qbf0lfmoCBfs9DFVXYyhYTFQmpiPvr5lBtBcEoigPx69UAqpdcOUUyNM7r28Cd9ATqv/
         ccfq7DKwkTQoVJOBs7uA7WWw97o1WXkr8hiYF0C/VI8knvwyDqni/G4r5tf7ACgrX5c1
         3n4zpUBOF3hDXuvCLMnJ4AqwbTAq/sLtukrLEV5u6v7xiUMJkyxk2WEwEi/9Vv3FQ7Aw
         CRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043297; x=1718648097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtr16dFLtcDgr4ix78ZJ+KaOFCLgarKHcEOXJWG6N1s=;
        b=AbTgfInpfgQSeX9fFyy0dRWX5FBNVlsNzglEZ85LU6eFyXqkZft7ovVGpxV7RZMKLf
         27DWPzxVGwi4b4NtUYVTH4MbKisrSJe21wvd0KqnEg+BW+OCjopdImhUFi64dxlUwFEw
         Wwvmac1WWG1eAJS+dNqNP5Rru50Cdy2dI5JxeOk1fkRPMcPAFMgH3Dr1COKSKGriluZc
         /XuSrxMdVwsF+CVuYqwOA5WemcwsGnR6zQxQQewXqSuFwIrkCsJWq20bndkEsAr7dV2k
         6J4D3nK8axreDPRXXDWNtRKwoCAm1nqO9H/DipHY8K0eo9hbT2aSPKhx3pXlr0x94kac
         h5sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXplb8LBFtx8p6E/2ry6uduziolkz4j83TzNof7xJ1KvN/RnVrcBvtSZ3BID7a0SAQzvfoVCPY0kxtyjft/k8WamADvGagqTayEVqDQRQ==
X-Gm-Message-State: AOJu0Yx/8jwosz3eUQhCAo29LIvmLghY00tuHCcSRvpin6nWfQoEu74W
	OVcp+5tpJa8DsFgAb+XMgVZzy8RRWqo3nJFc49w/KTVRxXTjHpBQetjWvE1zrw0=
X-Google-Smtp-Source: AGHT+IGEjeKLsqSzyE0FX29aLG9XNHqjJst6sjRoQrKgrqjrYyhz1TnMAX3wCtF9FtHOTQM5N/PN0Q==
X-Received: by 2002:a05:6512:1310:b0:52b:c2be:8694 with SMTP id 2adb3069b0e04-52bc2be87c8mr6403854e87.39.1718043296813;
        Mon, 10 Jun 2024 11:14:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1f14sm1829320e87.8.2024.06.10.11.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:14:56 -0700 (PDT)
Date: Mon, 10 Jun 2024 21:14:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_jkona@quicinc.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
Message-ID: <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
 <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
 <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>

On Mon, Jun 10, 2024 at 02:41:10PM +0530, Taniya Das wrote:
> 
> 
> On 5/31/2024 6:53 PM, Konrad Dybcio wrote:
> > On 31.05.2024 11:02 AM, Taniya Das wrote:
> > > The RCG's clk src has to be parked at XO while disabling as per the
> > > HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> > > Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
> > > clk_branch2_aon_ops to keep the clock always ON.
> > > 
> > > Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > ---
> > 
> > Should the same fixes apply to 8350?
> > 
> 
> Yes Konrad, it is applicable for 8350 as well.

Can we please get the corresponding patches (as a separate patchset)?

-- 
With best wishes
Dmitry

