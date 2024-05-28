Return-Path: <linux-arm-msm+bounces-20739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD328D1A9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F72EB2774B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0891916D9B4;
	Tue, 28 May 2024 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="isO0cwAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7916D9A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716897866; cv=none; b=OoR/O2Wl53ilQ3cFibvdwWqwPo7IMb1GJEy+jkx88lrWRc4yTNYnHV9G0ElgHm+Sv3Tbj5+kU7AdV3b03+Ndav70ZFSSz80IysYZN6Sk9SACYCRhddGFsj6KeXPhTD/KKnNJStQCpGfSdZF0KpBjqzGdVp0hp0pQi/3aCRULPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716897866; c=relaxed/simple;
	bh=0Ij/KINcYLHPBuKsXbihOyL1OmkuLW0/wwn/yRXpAPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLfIk3aHCA/KAwDolcSiw5Z6xLMFfOXJ8cuWZuWy+gV+Ebp2H9d0N83XvvH5YMZm+pLRUCWIqhEZHBM8FKgsmQjHL1ehySGsR20iL9S+UBv8FEA2YLqcwLsgN1n3wgtLRH53MTluZICqRVQmiPHdHhC+khsAXAoc2jRklkyG39A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=isO0cwAb; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52389c1308dso950218e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716897863; x=1717502663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2n1mamSB8aQSoN8jQVWr+bWDjxdAuW2QMP/FZUKGCc=;
        b=isO0cwAb/C6vQga+Tg982fQAFp3v1N4lpILUqeTT/h6sW1fhGOxHpV7+L5IFTrUq7y
         VPbmvaduVfDiIBcpLigpSSKWGFM/rH1L5+ZEWBcgJ4Og2/ZkDxN56HTiTgT1X+vAbiI7
         peNZJo/ZxcuMD0CaWTh1kDCxWmmXXcEzoIzY8o9EFB3ZwmvN1GDmTnliEWSYWK11hqqt
         C7w31EAMGmnKsPxmDK6DUrBoo/jr9Nw2CYL0LPd5m79zU9IgbunaQ5KjlUi8uxT71CHY
         9QdtzGffuV6ARDqUgZLBA8BRs7PeBCqJoQAVtTWzRAamIDvGQtpCfaQLRtg4Awlqs7hM
         mAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716897863; x=1717502663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2n1mamSB8aQSoN8jQVWr+bWDjxdAuW2QMP/FZUKGCc=;
        b=G7rxBz1JyEGoWYFzyd/5KmKbWit1aRsehW90jMejjr6D6pPSYVvPLArT0t05XgDWpf
         5CgMsUS1OipGCG7MTNOvkYcsV/iMnxxtpjMQWAQS3+ynGPKInz6RNWzSVoKvFumOMz6Z
         FjfuBI40FbtdeyMupHg/3NCBziA6hVMIg/ABGT87d/v5yHOaK4b7MBZ/DbYF1bg6Kr65
         V3KCl6gwhi8zG/4UAL1OHYpA5gtKNYLzL69cbDFa5UvYqT+/+ud5Dqoz5zD1c69blffc
         Rr0h8DGpTsmZ76e1KLde6//Ja1Mi6zdhI47bV+R0uj1zFcBtCAEcCk1e+4CDGoXAQQRs
         m3bg==
X-Forwarded-Encrypted: i=1; AJvYcCU4K5AUyC8PqUGfOkxNoCM8nqP35j2aaPhGpSw/ufd6qlQJeI9sVNtNj7P1bBkHznGNlcw2JYw1GmSXZRJSZe7LMVLV80Zhk9q8j5Or8A==
X-Gm-Message-State: AOJu0Yy5zguYHGTR2tis9NDHuH/4wi4JePW0j8gwT0NYopCR9yxe/k87
	upH6t1K64TS62GqT1dcbx0JvPbqH0ZETgAJAJv7MZZjV+pLbcJeGqFA3fYEjQeY=
X-Google-Smtp-Source: AGHT+IEIY8A2npesmQ3mUf/n2t3PJAROyuphDhmkYyXfqog/2OjGf7gOc5Dbz4rYw0IFdScb/Le5lg==
X-Received: by 2002:ac2:4e94:0:b0:524:6cb:586b with SMTP id 2adb3069b0e04-52964baf2ecmr5596283e87.23.1716897863607;
        Tue, 28 May 2024 05:04:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c33106sm937924e87.190.2024.05.28.05.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:04:23 -0700 (PDT)
Date: Tue, 28 May 2024 15:04:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 1/8] misc: fastrpc: Add missing dev_err newlines
Message-ID: <shdxqx4x5mghqt3dcvrum73ox4ygm4xv2cclkjnbvqqbe2y465@uboh3rl6kbt6>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528112956.5979-2-quic_ekangupt@quicinc.com>

On Tue, May 28, 2024 at 04:59:47PM +0530, Ekansh Gupta wrote:
> Few dev_err calls are missing newlines. This can result in unrelated
> lines getting appended which might make logs difficult to understand.
> Add trailing newlines to avoid this.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

