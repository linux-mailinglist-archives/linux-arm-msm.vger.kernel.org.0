Return-Path: <linux-arm-msm+bounces-25519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208392AA7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 22:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43C8D1C21901
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 20:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 766F014A636;
	Mon,  8 Jul 2024 20:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYnLp7lP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D779146A98
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jul 2024 20:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470162; cv=none; b=bIwWGT1ge7zCmaLaEZ2jIUXH0YZQCqR5lU35RhxF9bNecm0BxNlVMabbspUpRYLB7+XqB6c7RBsOotFJqglf/bAROuB1eeh8Zj8nkQJ8rm6USdYKaMF6p+/Sv62Qg6MrWc9KUa0g3wUH3XVPl94TGEMb2af34mwH7xnL0rlBfmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470162; c=relaxed/simple;
	bh=/tHiwIuV0w2w8E/IoDrtrYClmzt/aUYrEPCIZ78YsjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9bumXDY4IQgL832DCAQkg2KYWVRXIOKfRkX9hXTPwffSh8z1Cy1HMi3gzWjwjNWjwqkR5rhIr/VEGBtXUO4+Z4MqAIKXY1vZiZ/yxL7fKn+xxi8BDMaQZnuJU44UUQKtEBFJdPnTgaUCIzf50Fo2uvGwlvJXB0i7FNfGWXV6KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYnLp7lP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e99060b0dso4795258e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720470159; x=1721074959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RcDw9JRzF5fOueVKdZ3IqePKyN6522lVxzvPXl6DrBo=;
        b=MYnLp7lP74r2BbiblhhcWvDw/e1od+UT4558z5UBzpog6jPSz4pLpTGwh0pfNUmpna
         a3QqPgK2KAGFAzUsC/WgxW+HdHqnw2Jvr+gcwNTg3QPUqufpRhVBArpapbX37x64CWn2
         V76qQOzLoNBrEkWZ2NGBXRAJfxYyRKVH1VzwkVPHsYSr90k+7I39fYQKJsjTfPtuKQ28
         5NCaA6HHP21vz4yILjCuHKPy1xqi/LgEsSSF13F/K+sj50lQB0cD0PPLhIIzNcrSyeF/
         eEHvaxyrU9DS1ct73usTl5U19j+q5+rAcpOnvMWY9MnAZvm5SKeYf+03VTRHN/egZG48
         nlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720470159; x=1721074959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcDw9JRzF5fOueVKdZ3IqePKyN6522lVxzvPXl6DrBo=;
        b=o6oxe+YkdjCvqgi6nRyV49iIK/NQr+OYmLRYBBM+pFQV4vhExB6NS15INLm/SSfdUP
         vsH/d+sX92siriJN7i5PhnL3VViFqBGsB2TLqVe4KVyA8DUY9bKDxMeyxOCJ1UjBNGw6
         yCFq49BjPPu24oXw7liX+H1jqM1CfQI8SJKlC59abNpZCxQp7PLNaEL1d4dGEuwuixn6
         5woPK37OvCJvXeW9CsLLqj2NzQ8kmDIT4B3f4cUg8wy4vtKyzA1h8bVW+gdL1MYyF5Lw
         77S57mGB/bGoVJY0bkFJkAG5pm7YWNP1akANKVncaY+c0TgSYCsf8EA0E0IFuImQkMG+
         yQpg==
X-Forwarded-Encrypted: i=1; AJvYcCUjPeZiBRWrhXAnYOLT717UOu7oU1Pn3N1ph5JyV4tK2yWUZlOwYrcxmixIKFNuXJhX05lm95Kk0EmvE9rCKVkDc3x3UPOa0D3tbio03Q==
X-Gm-Message-State: AOJu0YymockmQu6yZ8X5udtLkgDEeAlVptzXlMEKjNkb8yD1d++GniMx
	Ihb6KcCsf1UHD2VtayOtdz+DtroWiDN0M4rXByaqkMa0nG7tgq3Q4LbLuxNUzTU=
X-Google-Smtp-Source: AGHT+IE4F7aSmT2qF5qAraGDB4+ZO233Vb+G7hKtiTG6purDP6xcFjw/RNSRcMS+VpISHG3U6czT+g==
X-Received: by 2002:a05:6512:15a4:b0:52e:9fda:f18a with SMTP id 2adb3069b0e04-52eb99d4bf0mr231019e87.44.1720470158791;
        Mon, 08 Jul 2024 13:22:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb8e3466dsm59119e87.18.2024.07.08.13.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 13:22:38 -0700 (PDT)
Date: Mon, 8 Jul 2024 23:22:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] soc: qcom: pd_mapper: Add more older platforms
 without domains
Message-ID: <q335f3oppmnwmp5vl7fzmqqwvkg56asmbwr5whzev5u4qmw4in@se5lopultxjn>
References: <20240708-x1e80100-pd-mapper-v1-0-854386af4cf5@linaro.org>
 <20240708-x1e80100-pd-mapper-v1-2-854386af4cf5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-x1e80100-pd-mapper-v1-2-854386af4cf5@linaro.org>

On Mon, Jul 08, 2024 at 06:22:10PM GMT, Stephan Gerhold wrote:
> MSM8909, MSM8916 and MSM8939 all do not make use of pd-mapper, add them to
> the list similar to the other older platforms to avoid the following
> message in dmesg when booting:
> 
>  "PDM: no support for the platform, userspace daemon might be required."
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

