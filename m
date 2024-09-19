Return-Path: <linux-arm-msm+bounces-32036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C990597CE55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 21:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9282728523E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 19:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C03A139D12;
	Thu, 19 Sep 2024 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NM0n9yHY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB2873440
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726775919; cv=none; b=R3Q0BhYOSiCgunFF918UmXij3INKLkC1U/NFVvJ5HNzDy3LA05/POpIOPH8f5Tod5DaECvZQS/jWgCFZXfkw+MUtqRn48ILbd2EkyX11mBUEMRaLxjePyJuMln4+SjtI6GY7uxrJqhjRax/VbuJHeJ1LScLEmVeXJJMO2SDqt0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726775919; c=relaxed/simple;
	bh=mZc5slWscDi+VLpmojowCdwnlwPYKXjL0w123rEYIF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/B/v6naqGG7UNOxvkw4yJejwkG3CbOTMdV7XhuXtlmrr3Eg3MPHTBXKu6yHWdiR+yxpnJIVJMVaPaBhb2ux34X8ny2h3L7DrwMTbcjVYpXiGVXpt3ms8/memriN20MxDrXBG81fiOsgZ70LyQEKYv4857szjC3yU1Vs6JreULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NM0n9yHY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53660856a21so1220554e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2024 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726775916; x=1727380716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F1K/XTV312typZoYDCMaTZwbtUxzKf2221rzN06WBhg=;
        b=NM0n9yHYKhi6yrd5Nk5HhrXXxnkM6GFXwQAFsQ1sXr8wWS2BFEDUgLOQ8tLy6Rab/U
         Qa6d3tQYuo/P/uOezJ3L+D+0YRh/BsKmdi6Me1cFgEtR48LSgi/6kEuOb6nJhGJv5IKd
         rrkgknJ0M30GBdmmzAuJ4T3Rn2QjhF1UU91xg1a9YYTQI/OXs6Mt9FegbuVb8X0aN0c6
         JUcjWDOpOOPQRO9Upu6dVdXB0g1UBBIDnI77h6raAr+67QnbhiN35QEF850MMyLb4aGK
         8yoFoa7bLV5W3sAQd1JIvyw/Tljc9o+ioNJhBGVNDovsQYQTeIYb0G8dCw8EwzJcvfhr
         8LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726775916; x=1727380716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1K/XTV312typZoYDCMaTZwbtUxzKf2221rzN06WBhg=;
        b=dOad7lGOjAwcKG5wBMvEdB28hjDLQqBFqZfUo875CdunHP6C7Ufd/ZLTsO/vi3p6WH
         DoYIzvQw4QFn6XZAZLTGaKo/37Bh5ZKCu7To5tO/zW8eAnE5t60rrudkmVCBsS3kIsxi
         84xNV5o3jtcOFv+2kAz0Vm6Hc2k4dmKfO/NO4k7k22OV9dg3DCvn3n56JiUDZDWSkGpS
         xzt50v9z4SwLDGMLW99rMtWbzxIA1VqdJ1tv45eVg1Xt5u5EUr4nFioDE8plmQPE2qDF
         CH6ohJcQ+EX8CgATX1Nfll16HQAz5k+GSJrZ43vxUEnCKtYxuxZNujb9I1Feb1XD69ub
         aEog==
X-Forwarded-Encrypted: i=1; AJvYcCX0kd1uOBSrEK2nMqD3sCynSksBtx3wfo+fyyVvdOTGjnyp8yi9PQW/5269EauRa0HR9zPgz+WIL36QRlGx@vger.kernel.org
X-Gm-Message-State: AOJu0YxSofCrBbLpRE3Z+A5UwFy1DBv04j9JLiGalGzvZQtT7u7UV2wG
	CwmzCF0tgcvpoUeG8/2fIRPfkaejz7/ZaNYlgPk9E7WoSx5UzUXd6FBD6fmfWU9Zc6rC8jKP4k9
	mMhQ=
X-Google-Smtp-Source: AGHT+IGbSIMX+qtGCgEAG0A1RRLzJ/u9NNzPI21yDBnFaQ5RdO3gYc1gHtMx39H/tFjCp7nEk+AxTQ==
X-Received: by 2002:a05:6512:1153:b0:530:ae99:c7fa with SMTP id 2adb3069b0e04-536ac2ce3bfmr323835e87.10.1726775915894;
        Thu, 19 Sep 2024 12:58:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536a5f597e7sm366803e87.287.2024.09.19.12.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 12:58:35 -0700 (PDT)
Date: Thu, 19 Sep 2024 22:58:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v1 2/3] firmware: qcom: scm: Allow QSEECOM on Dell XPS 13
 9345
Message-ID: <zk67admssoi75sfnjzgv3uqkfm5m7wxxhbmop3zayf4c5evkqy@mwhjqno5fx7z>
References: <20240919170018.13672-1-alex.vinarskis@gmail.com>
 <20240919170018.13672-3-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919170018.13672-3-alex.vinarskis@gmail.com>

On Thu, Sep 19, 2024 at 06:59:33PM GMT, Aleksandrs Vinarskis wrote:
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

