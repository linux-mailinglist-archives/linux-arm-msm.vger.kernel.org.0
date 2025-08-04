Return-Path: <linux-arm-msm+bounces-67663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC8B1A054
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 13:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09BA1895974
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 11:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C5D25392B;
	Mon,  4 Aug 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dlw3pFsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAE21E5B6F
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754306025; cv=none; b=iqYh9WxsksTZart8Wsb0JB3nNjVOWOMe4RvV1Vt5KA7EBqChgITMV+oNrJwtSdVrYeg/tSUBedkYI+E9cqvMArhfCWGT5QNjyk8VZ1QDjEkjMLfU1pg+CJturzZN37uR4ovhZHZTh0O8mNO/CkrFX9b4H0nmIj29J03ksHzNmW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754306025; c=relaxed/simple;
	bh=/yT6SIbwMsDyXivBPq/u5jEb7k18emFAPJlUdi6+mro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7jgQDZB0FrZ9ioxukJBK9mSv1xtP44wLVY8lIz0CEcNehFdpEncHiX09C3fthIGDoCqUtK6wuA4do7Rwlj75P2BAAOSVldClyKbQOGIz0BZVZtDKE67mzXwoNuBylIkuL62nF+eq2V8pWk5CRu4T9d23GFakh54Uf4kxNHXbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dlw3pFsq; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7682560a2f2so4050688b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 04:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754306024; x=1754910824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYxFvBBR753en9vuNva6YOR53xSyO7VCvwj1GDT38Q8=;
        b=dlw3pFsq+p9GpRztCVrhzKP0lJcpdn5txTF0zArhvSwBI1CV4XDYWXofEwTCLcZYg+
         fVtPrkSWcdS02TXPg+Uv7kkqnqWeWwIpHQ+xuc+WBxbwUW7PAtfFt85cbfSsutXrxzS9
         rpceV+yfasP5YpzxuiCBe8Sx7zS0/8FGZc7DpIZ8HfzCiV+ZsKrmQ/ppSQ1KOAeU3qGk
         j7J5hetgKsB/9jBVI2g5ohM22iSIUedveBQkoGcxtgYXRmdT4ABkyaZnr2Ej0g2MRES4
         4qVmNVuqDDTarQElVNS4NtkI/SJokDkeojnnQQeBQFElpH/w0U0Xaz6b0mvEckv/vSgu
         Jp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754306024; x=1754910824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYxFvBBR753en9vuNva6YOR53xSyO7VCvwj1GDT38Q8=;
        b=CUXr+QAxXPfuIZEw4wz5fJJ5pFHRGXaFjNPkFOcoY+HSVB2y86liz3/zucPZtoqzDe
         lenLcCetbGmo9TZ4icYPKr1hRozZx+q5PXkrv6WpY6G4yiQ24wLZFh78Uhnf8zZpRUqD
         JW9iH9fw81sqEUot73G8WZO5eNQILQDMXwgFn1IxJ+O2tAZppP55ZfKzNzngg7ZKhqdV
         9m9kTh+irlD5lXd7kjDGufSEURnSVm/0tt47uIHBT/PrQYpGiruipXNKuW2X+qoKnkwS
         hey8LFilNYGM9CeLjv90icUdURyLfW0a3Cudu6s4Y7OT20s522af8M45NqtAnsziSyBx
         k2Og==
X-Forwarded-Encrypted: i=1; AJvYcCVort4wgz2+mkInEPWMRcMhGIsaOmXQw0GWs/EJTJiiHSlL6watYO/z75dXSKlA4JARGM9PKa65IRX95JLs@vger.kernel.org
X-Gm-Message-State: AOJu0YywNXpAKI1tX9CXKkkE3TkJuC+E1JFczujh2epkyQF+56q6+mEh
	mzJFDgA5kJTEykRSaf3FvpHJ2XTNzwZ+GNTtLt4zbJ59NH3INVtsfQe5yk+P7hcO+A0=
X-Gm-Gg: ASbGncsWz3eUnz85QcG2M07ozK7HOfMNhOx/IgzY9eR3CgnLo8bDK7BC9H4v2Ub8See
	CqKTLwj2pMkGBcZ1XyV/AGsOovia2ckHszmyQdiuzzAbaCLdRnlp7+8mUMuCnQEn+waJ/o31YI0
	/gzGnn8QWRRRXmgfELFxs9REl7wm/ECO6dgNkbVIEbxYNIpK3ORb7WSV4ZM17pyrXMg/Ov8hMtP
	QbhwN9752cwxToMSyEP9dmXFNy+zHfZ6KrjmjDS4ZV3OKbSn30gEFiots6hOzPmxmvJtnykoPCe
	lM+nubY8Yu/6XWdvHCJRIPKkQgolaFqENp2UXMp4h+Sfn3gaKmkrxLdouOgh6YJelfOXJxUUKTb
	enY/zwNm2kQoUS05jn2MC4rU=
X-Google-Smtp-Source: AGHT+IE3KOgmXKzWVwIXatZUzP0SpT7zF9MWUThR1kMx49+PPbc0ii9e8sraQgCudSaaczTwkfvsEg==
X-Received: by 2002:a05:6a00:ae15:b0:76b:fdac:d884 with SMTP id d2e1a72fcca58-76bfdacdd96mr5449606b3a.3.1754306023713;
        Mon, 04 Aug 2025 04:13:43 -0700 (PDT)
Received: from localhost ([122.172.83.75])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bfc270514sm3545933b3a.12.2025.08.04.04.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 04:13:43 -0700 (PDT)
Date: Mon, 4 Aug 2025 16:43:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] opp: Add bw_factor support to adjust bandwidth
 dynamically
Message-ID: <20250804111340.t62d4y2zg77rr3rp@vireshk-i7>
References: <20250717-opp_pcie-v1-0-dde6f452571b@oss.qualcomm.com>
 <0dfe9025-de00-4ec2-b6ca-5ef8d9414301@oss.qualcomm.com>
 <20250801072845.ppxka4ry4dtn6j3m@vireshk-i7>
 <7bac637b-9483-4341-91c0-e31d5c2f0ea3@oss.qualcomm.com>
 <20250801085628.7gdqycsggnqxdr67@vireshk-i7>
 <7f1393ab-5ae2-428a-92f8-3c8a5df02058@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f1393ab-5ae2-428a-92f8-3c8a5df02058@oss.qualcomm.com>

On 01-08-25, 15:05, Krishna Chaitanya Chundru wrote:
> Currently we are fetching the OPP based on the frequency and setting
> that OPP using dev_pm_opp_set_opp().
> 
> As you are suggesting to use dev_pm_opp_set_prop_name() here.
> This what I understood
> 
> First set prop name using dev_pm_opp_set_prop_name then
> set opp dev_pm_opp_set_opp()
> 
> if you want to change above one we need to first clear using
> dev_pm_opp_put_prop_name() then again call dev_pm_opp_set_prop_name
> & dev_pm_opp_set_opp()

dev_pm_opp_set_prop_name() should be called only once at boot time and not
again later on. It is there to configure one of the named properties before the
OPP table initializes for a device. Basically it is there to select one of the
available properties for an OPP, like selecting a voltage applicable for an OPP
for a device.

-- 
viresh

