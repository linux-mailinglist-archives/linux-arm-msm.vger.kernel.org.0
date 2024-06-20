Return-Path: <linux-arm-msm+bounces-23447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B99AB911383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72E05283D0D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C91C5820E;
	Thu, 20 Jun 2024 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWxnl3/l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8765915A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916112; cv=none; b=WmxfpBBgFqD/EouRAccCcQkx5NATckl7N97XlT/h1S1gT6LG5CMzV9V/XwSGVLxW0G4KfRUbAM1KyIKF8Kv2oVK7KU+YAqJsrWkHljLM0O0Uv6kSXlEqRFMci84im0AXc+7G7dbLyiQfDiItJRxZR+vS3ZLvHKYz8NXXxT8brjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916112; c=relaxed/simple;
	bh=jCRPeDhRTexacpaLMCQOVq+EqZtjNasVzgQEbK1/75s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IImXoVvJ5AH1m3TlX8yzbubrwn7oe7InZiBDlQSzQZ9I2oEMXrpK7ly00DTTaNcs8hp5A8yttb9gLhJoo1z5CyMpCr9PAC5HC5MfNJyksuxP6kqH3Qdpm9f0FCvytbM2Ph9EV31tIYSZcD+0p/le8L+LSY5tGrPgQQ+oNW0IbFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWxnl3/l; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c32d934c2so1354324e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718916109; x=1719520909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LV42KA4YMDhuTQbvBLdefHeipONZ+HZ8OMMqsUM/p24=;
        b=CWxnl3/lxP1H9NpJ07ZVp+ldCK5RkJ96WOsLeEtNkNDVMYeTapmo5C8hT+GT//89r+
         ipj8+hEN9PV7eaaCzbM4+SEiqeYaVwptpnrZT+290RySpWSk+OKhVVBnodIsn03G0T2H
         QftO7aD+pP2yr2C1KPj2vLnsiD+npRpoTBam6CZx+o6ltbnLUF5EAdEuvv/QO78A86th
         79rg6tiptD3+wf/kM1654k3fhr+/OsTYGmYAE0hRPgOznE/8V8C78k5rVPLejXj85vZi
         Em4CGrU9g8ys96o49Cla0dKNTDp795Acaziof/cucJUmApbnkja9TLWX8KJpss2xrj3M
         MwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916109; x=1719520909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV42KA4YMDhuTQbvBLdefHeipONZ+HZ8OMMqsUM/p24=;
        b=fL4SBTChtCqQyjo3TUuDUe/KRggROTt2QzvoUogX/lU2cjqTNVuTJ0ZEh5pMY9CDVv
         WCcQGDG4TAbxe/e9jUs/vWp0ApoZmyu0yG79okL7Sh6sg3BknhV2KRy+a+dMNfLwg7FH
         gydAqigcbR8LdZfng9XUBB1T9dWEKkKOEo0qgc/xbxKxj6s06xQIF1xHRuRHwGyiwI1w
         eab7oY6x+F5c6FL47/lJdcLFqtJrwF7QENN9wbbttwKpi+VfbHQf1z7Hs8kxdwCL/3v4
         wyiRjdkoATqtuXPFGUAABPcu3sA3kyGPM8d3GT/bRSsZNc578qXtJXpCUgBFUl9/EW4X
         RZvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJ6Fv6vm1ev59PdNHSWuD3UPfftG0NlwClZGa46/uLFZVylGsJzzgt92Un0GhpDZBBPKS5rcvKGFtn9wBjOPX+H1BFTcF+Mwfyu0n3Q==
X-Gm-Message-State: AOJu0Yxy0s/FXBmfL9F6YKMGDINXnCqN4Jk9vwM5kW6EQ1HTCCgk/U3r
	ESGT/4G5rJDgKECXotEFOm9SBzfrLKhHIuBp56XxAIqdidd3uxzSu8lLOyF4MCI=
X-Google-Smtp-Source: AGHT+IHRtv8ZxR7EYsMMf0CjZ2uGMGxflB30i6/Yb/bOaNtWDIKRz1l20HzQlyZfncdMDFY59vj67g==
X-Received: by 2002:a05:6512:3ba3:b0:52c:9c8b:f89f with SMTP id 2adb3069b0e04-52ccaa54b83mr4595217e87.48.1718916108756;
        Thu, 20 Jun 2024 13:41:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282efe1sm2155501e87.76.2024.06.20.13.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:41:48 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:41:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8939: Use mboxes in smsm node
Message-ID: <rl3jfufx6tegdt2ff3n6lveqvlqs76lypeegu2l3u4lupcfxcm@jlzxny4fmsns>
References: <20240619-smsm-mbox-dts-v1-0-268ab7eef779@lucaweiss.eu>
 <20240619-smsm-mbox-dts-v1-3-268ab7eef779@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-smsm-mbox-dts-v1-3-268ab7eef779@lucaweiss.eu>

On Wed, Jun 19, 2024 at 06:42:29PM GMT, Luca Weiss wrote:
> With the smsm bindings and driver finally supporting mboxes, switch to
> that and stop using apcs as syscon.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8939.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

