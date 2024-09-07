Return-Path: <linux-arm-msm+bounces-31198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E9197016E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 11:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71E21F2213A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 09:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D316F156F21;
	Sat,  7 Sep 2024 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SDaB+r9d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193CD14BF87
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725703023; cv=none; b=oWaf5UYdbufmLitFTVln9amNDDEPWqJCCqXVfkUmO3tTjHiNK/sB9VaqP5O7S2/4v/8dejJgfQay8l1zCfOI6q9BOjS0WCP7hRoUq2BPrXbqXyJNPQgfFAWvFjMDFSqY4wDEzfnxYql0jjZwap6SsL71CX8W00M85WptOviCJ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725703023; c=relaxed/simple;
	bh=d5uqkatmIGWlvzVc6eVWYRYez+V0GBoQVCbctB++sKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AG51Uq41iTbmgXP4traWg62MK4qYWGsDv5GtobexR5MnjSse97yUtc0kQCG1dep/B4waIPQziywkJC+6fGVt/f6ZH+9ZiJKSU2fpNvgVdIHNdMqiyzGUtPpF5u1LIk02RIn7sM+qOlSOiuU91EVRKcBhvvPQE5LHs7SpEkJb7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SDaB+r9d; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f75de9a503so1750751fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 02:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725703020; x=1726307820; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eicKEigiMqbhVSAbLTFufXGbvpGXzYD4pjdTFviSqVs=;
        b=SDaB+r9dKxQeLZkdElb/SeIp39HT1JLoMxp/DZKzTkbxBHKJJGhj6EqgkHVAfJ5JOH
         UiIqI40yqpAqg7G18GSSfnmf0IkqtNYW+fbmFyiLGbXitedwFEuKcZwmTztAHtI02jum
         qgh1IcZAv0WpMMoh95Q3w4shEqj820fEaqSIQckcS8KXlXGtA6N32PJL8fRtQ3Rk7YWR
         6lGXUx7aIQ9sNnvAbc+SnApVPKPa5SO6nC7qI+RNyrb0+Hgys2LtGNs8aEZ6QXNlxcoP
         SK7/S7QfK8vlZl43PUniKpYfhCn/YDTKrwchgCHnJMKUuFUJa+rZEtN+j9fyO4vb7ng5
         C7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725703020; x=1726307820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eicKEigiMqbhVSAbLTFufXGbvpGXzYD4pjdTFviSqVs=;
        b=o4hJ2TLI46vbsPMX6gr0NFdB6/wKtMijZlZKKeMREmedeUfgsm9PpISk1EX4oMmjRc
         7DaS5kHYoTEbmnIDcJJJ67go8jzF2P65GRwIa2Hp1prHTjT6ZzJC+Gy2NvoWfufsUe6s
         saQMJUXzrPf0OlBhqGFi1cCFJt4Jl5P5n1LYRwrULNQMPfKCmZTCtF9GzN5+n5ne3ah9
         41+Hulhjpw5ksATnG9oT/iqr2rf8pRmLOBKx/LM/YcDWCkLUANwdOWhoudlm1268e2XV
         fsN+xutLSZjtaFKwaiE7z3NuBx8OnIsRulHgOaLkeWiharhijgl00xNjNcxPSAP7s/Hp
         wAYg==
X-Forwarded-Encrypted: i=1; AJvYcCXtocbvr7oKR7eJGNavF2Wvp7Y8RVyC/uqgMhziYd+JmE8WPxPJ6D5gEmJS/vlr684Vu4IB+PE1ifw+MUOi@vger.kernel.org
X-Gm-Message-State: AOJu0YzjCSGLxqeBb5RZnRweHUVwuJiZQgQaQD60kojhruRQLFl3LqGu
	qpITdnpzMyOouMno1TKbsxZjZIat7hzddNvSX1DRSJ4A4yYjcZLJw/vjY4idePg=
X-Google-Smtp-Source: AGHT+IGWx/RlDK2HtZJrNFTHBZKi5XkAFyGUhC68TraOorLDTMJaOWkWpmOmZ4vEVeAMBMcPmuW7yA==
X-Received: by 2002:a05:6512:3091:b0:52f:1a0:b49 with SMTP id 2adb3069b0e04-536587b43ddmr3460729e87.31.1725703019340;
        Sat, 07 Sep 2024 02:56:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f868ef9sm106703e87.50.2024.09.07.02.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 02:56:58 -0700 (PDT)
Date: Sat, 7 Sep 2024 12:56:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	regressions@lists.linux.dev, brgl@bgdev.pl, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, 
	quic_gurus@quicinc.com, luzmaximilian@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, srinivas.kandagatla@linaro.org, arnd@arndb.de, 
	quic_eberman@quicinc.com, elder@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, ahalaney@redhat.com, quic_djaggi@quicinc.com
Subject: Re: [REGRESSION] firmware: qcom: scm: smc: switch to using the SCM
 allocator
Message-ID: <vtdrxh57zxpu6xktzehcpx7hkaqclg5kya5jojrbkmo76yswxx@libmc5evobkb>
References: <692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com>
 <CACMJSes4cnCNUHiZUr4CF-K2c8-1VYzuh=T8JDi_erqfShkuZA@mail.gmail.com>
 <1f889bba-0c89-45db-b360-b21d6bba7772@gmail.com>
 <68b0476f-dfa1-44cb-a01a-f4afbaaa98e5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <68b0476f-dfa1-44cb-a01a-f4afbaaa98e5@gmail.com>

On Sat, Sep 07, 2024 at 01:49:02AM GMT, Rudraksha Gupta wrote:
> > Looks like qcom_scm_get_tzmem_pool() returns NULL. Not sure how this
> > happens. Can you confirm that the QCom SCM driver probed correctly?
> 
> Thanks for looking into this! Please let me know how I can help!
> 
> 
> I've been building the driver into the kernel I believe. Here's the relevant
> line in the config:
> 
> $ rg -i "scm"
> samsung/expressatt/linux.defconfig
> 1615:# CONFIG_ARM_SCMI_PROTOCOL is not set
> 1627:CONFIG_QCOM_SCM=y
> 1628:# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
> 
> 
> It seems like the scm driver is being probed:
> 
> ~ # dmesg | grep scm
> [    0.066438] qcom_scm: convention: smc legacy
> [    0.362543] bus: 'platform': add driver qcom_scm

The scm driver is added, but it is not probed as there is no SCM node in
DT. I'll send and RFT patch to add it. However the issue still persists:
the driver should not crash if there is no SCM device on a system.
qcom_scm_*_alloc should fall back if there is no SCM.

> 
> 
> Also here is the complete dmesg output (Had to paste in pastebin as it made
> the email bigger than 100 KB):
> 
> https://pastebin.com/4iWKvZ8z

-- 
With best wishes
Dmitry

