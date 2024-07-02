Return-Path: <linux-arm-msm+bounces-24863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 129D491F0A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 09:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 913361F226CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 07:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EA255C1A;
	Tue,  2 Jul 2024 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nlDVsS9W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689CB146010
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jul 2024 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907167; cv=none; b=mWQ4yvqLKY/QwF5rv3mpf4A6AmbK/jw6S/W7nVp9HZbVvyUnJLiFqd5ovuWG9TMoUCB+NOFeZP9n+ff68hUbocQ4XtSTcbFwreApAY9bLFRMHJcAaVC9KRyWps6SPxfmpp11oALl6Nm15rwjFKMEaiEBIfVfoHk9FUxLzpX6UEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907167; c=relaxed/simple;
	bh=xO4jgFcHGGtM3PtvZAzuNk3ui4TywDxw1FF2Di44KFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIazZD96E+3ypgEwvGdBgwcFMwZWkIhrG0itNdE/rOZTeRC/1EJ0u53K+gNSxasfezvdfqLRh4S+ROxfPRa72DqXSCaN82B4qQ9XBc9IrBpEbNtIc1i8k9u3I4++IxfOk8bfYX3zc8jwTePTPXEdqDMXDtGhiJbBvhpvfhPhops=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nlDVsS9W; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so3985648e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2024 00:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719907163; x=1720511963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpyvxQ8xbjmGUnixp39QhyA5GFx0SN+s+GmNtVx8+E0=;
        b=nlDVsS9WQkg8MQeV7oo59ZKzp7z2S1AkcllrYCvGu/tz8yqd1vKYNKItHDtMhsPPzw
         Q4+187fxnN+OmuzNyQXdmCdy/ExfcLntXwiKz5QB0GHNWWb7VUmjYYJo2n2If7OyGhVn
         YsKGwL0ZdDx2HCTpaAmMUddDRc6WemjGbRK0It4Xhdlq0YwqXpkTrnHo09qzbjllkqLI
         Egt1F3z1e2mjx/0IlyD6mYSZiiAkC+baPeRzBwjUtnr0HxGmD1REUWU1IJoi8rqYzXAj
         S+dHeZ9Yd34DBXHBFDaSSO0jko8RM4ZssC6ns6iRsPeqv43ZW0VtLbM1IaegU+cpd+r+
         oz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907163; x=1720511963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpyvxQ8xbjmGUnixp39QhyA5GFx0SN+s+GmNtVx8+E0=;
        b=HRab9l0ucE/DrMHqmKRSdCRyizz+jnV0tDLFU5Q8yH3eTmozhVr8pGlgPIUG5gaDSL
         vevQ/cgQLZ8AXJIv9ZWgQQqxsdrF32XozpmwLNcPuvXFnPkiQNbinZPK/nF3qZ1EHDA4
         hkH26sjQX3QtrxEZLXcMvyEvDzTj3yeNX4UQf7saL3nbcuY18GYX0LW0Z6XxgFpvGMwd
         STONkmDfA5Uj0RG7A38XsbLhl1gyJbNN+iySdQ4OTmtnQOnEQNzypm1tDT+3AmvJE/hx
         gFEVuSzqGwvfy1HktfmPAOeoziPDtm2HcnT/fHZQ8U23bj35QpIPG15Qd/S8cvlRaTsM
         2UdA==
X-Forwarded-Encrypted: i=1; AJvYcCXZVEPiEIHzV1tQ4R45m0zqTmV2U+6GCFgG8fn4c4+g1i1ftDEQxATHwf2NnIEC+1asGfNh8JqKjRxT8aCDz4sYoxi1R1rS+7664xkZxA==
X-Gm-Message-State: AOJu0YxYrMqKruG8yUIgELCUaItNRPMCu9XyU93rN3HjqJf/DW8ITCEW
	NvDhMw+NcDSvzE+z6X9Fn/dJkdr8TrsZmxu3j9v59qL+qmaK4lRbSWPzv0EgYJU=
X-Google-Smtp-Source: AGHT+IFu60DTwWGR8MMLwXSmwkhC75Hs8TtEXLJtowjRn73LqZP6vLcd/4pHjJ3ShXg72GnfNAT4Pg==
X-Received: by 2002:a05:6512:3a91:b0:52c:dca7:c9bd with SMTP id 2adb3069b0e04-52e82687f28mr4318804e87.30.1719907163576;
        Tue, 02 Jul 2024 00:59:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2f8b5sm1710321e87.233.2024.07.02.00.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 00:59:23 -0700 (PDT)
Date: Tue, 2 Jul 2024 10:59:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Cc: quic_bjorande@quicinc.com, andersson@kernel.org, quic_clew@quicinc.com, 
	mathieu.poirier@linaro.org, linux-kernel@vger.kernel.org, quic_deesin@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH V3 1/2] soc: qcom: smp2p: Use devname for interrupt
 descriptions
Message-ID: <nrqojhdkt3ay5mtj6fcpmzqlo6xjo6rkvwymm673nn2b3tqqxj@4cjlba7j4o3p>
References: <20240627104831.4176799-1-quic_sudeepgo@quicinc.com>
 <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627104831.4176799-2-quic_sudeepgo@quicinc.com>

On Thu, Jun 27, 2024 at 04:18:30PM GMT, Sudeepgoud Patil wrote:
> From: Chris Lew <quic_clew@quicinc.com>
> 
> When using /proc/interrupts to collect statistics on smp2p interrupt
> counts, it is hard to distinguish the different instances of smp2p from
> each other. For example to debug a processor boot issue, the ready and
> handover interrupts are checked for sanity to ensure the firmware
> reached a specific initialization stage.
> 
> Remove "smp2p" string from the irq request so that the irq will default
> to the device name. Add an .irq_print_chip() callback to print the irq
> chip name as the device name. These two changes allow for a unique name
> to be used in /proc/interrupts as shown below.
> 
> / # cat /proc/interrupts | grep smp2p
>  18:  ...      ipcc 196610 Edge      smp2p-adsp
>  20:  ...      ipcc 131074 Edge      smp2p-modem
> 170:  ...  smp2p-modem   1 Edge      q6v5 ready
> 178:  ...  smp2p-adsp   1 Edge      q6v5 ready
> 
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>

Your sign-off is missing. LGTM otherwise

> ---
>  drivers/soc/qcom/smp2p.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

> 

-- 
With best wishes
Dmitry

