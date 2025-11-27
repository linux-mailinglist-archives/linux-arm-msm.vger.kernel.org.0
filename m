Return-Path: <linux-arm-msm+bounces-83605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB37C8E9F8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81D2A3B8895
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDB8315D52;
	Thu, 27 Nov 2025 13:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uLj1JFNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828A28C014
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251364; cv=none; b=Bi+UHw1hnn5fBOgK07CQF9ue0gO75eKlyy0dNJNvO4WTQCU63+ymrGwma+853XN+VADNlL0P4RWQdxR/VPDvuJwN6+QnANpZZ10mPMHU560V2aDRUPdZ+CUTbR5c/xC68/e8dkIRWvofcuwC9HkgOCOiaQIfy27xz783eSKMq2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251364; c=relaxed/simple;
	bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZrVUNaTNHGv8CJDu8nLNp6PH7AH6EQmnIUHZ6q2v0aplE6NlWD4vwrTOpO1mqOBLOgfzKI1DHqOOEPQdviPyDGJtWYPRI3ZWG5lo5bIlSWtS/Btg6w9TjDTa6yYxrO76G02bXb7nnnTsxLSmBjWLTxMRxDewjj2y/Llu9SM+7Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uLj1JFNa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5969c5af23bso947467e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764251360; x=1764856160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
        b=uLj1JFNaKbDfbxo09KGuxHCMyfKejpCJ1WTapAbhCouqWGf7nWZMdnozs59WqDSOOe
         pKh+xItKdnpSkz+ie4zbDtWnGqjhIUj5iJcN4GZc3r9OWWFjUDbtmIDFnDxS7kQs52N5
         o7zRwL9XMpj0ovWUukkXhdxO+Oom/eQ0xP1Bqhns1G3+RLZvbuTMbuE9wi0OoxAuFS/a
         PPG6CyfX81DIu4rzuUmZ0n2d7PklxBj89vNtazQQpqPzyAkP9MVXbw8pmaXbiQRlQAok
         Je2FL5kvoXJ0r70ZgvakShfVpiV4HBUa4RGJc9S0isAgm4GJ9jVZ2ODpt7XqWEIKhhNw
         jhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251360; x=1764856160;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djx46A/t4g9tFTNKTkwprP+1rBHg+hljQCYzR5C8ROA=;
        b=hXpHv4UnblXtlTChMd1hr/k7y9AsxxPArCkrJfHgLboYqT0YQQ0fnIyjYJkE94hlfb
         lYcmN/XS5P+ZdZDiXB4eb0j0JShBmXymZnXCfKLLzriVoZZHDCGaSuCGxHcFgb5SF7L1
         caTc1yrgB84qmElCghWOcvD49xnNdr4PNLTjSToXmb92oxzVIILzJEiwnBQfFOF9RqPM
         6D1h8cnKlQgArN0rmkS6k9fAigZQsnRyDUKTXf1UrVtkg9vjFdW+e8AGl4crj0PA/29y
         6cSHXzZEo9ms4FFgVQh295nWGJDwMhTmF94tYwCFL/0u+/Q8ajM/a82bUuW9acFXEMUq
         3BWA==
X-Forwarded-Encrypted: i=1; AJvYcCXX5qjPNz14cFrPRHhHZNMFASMeFcO1oRtHggBM+wXi+RTpb5QOSHSlS/NVxSQk/fTDXe3rB9Z6l3gBHXMh@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwsnVUmth1yoU7wUm0gqfDm8HydegOkSEBEDK1eUgDNLH/9S5
	6NgWpWHHV/Ef0KSvH09mEakjBHanC0nuXj7p2+vstikLNPetMqnoulomMItAsrIDX1gK1tPV7yB
	S85RKlAErd+0MbGh3mjgVJtRVp5dnWvxlxJC99oMFWA==
X-Gm-Gg: ASbGncs2sFNvzIke50feTJBK98NheDqz/7WPLy9Qw/zspzPbwrLU05N3Xzh9v6jxXjZ
	1YuruQ3XKCtsx4Gt3/7ZPwQLCMpOjVLNh57svm6fyeqllY5jJ2pZtAO8y+wtYwYGzCTXVzb4tW3
	V/yPy/653WFNyy+CnMg9YwX4FGoFIHVeO9ZSoaOU103Rd+qKKKBPqwBlhM9A+Wcmtb9NZLd/lTR
	mg4sHyLYdRoeJwbEN3CX195FBmxV3xe734k40HU4N8elA4FNIdEc0dpfey6p7DWoLTE8+pvTGjj
	PSMOYaHNTqot0t+rZa9/O2g+LzY=
X-Google-Smtp-Source: AGHT+IH+CDUfKujPpotwtmLcmyLVWHWVuqtFgSXM/kqLIDQE6VNVNZAmDKJw5gKN9s8jiNvQgCQtNi8buZoDHFa0ulg=
X-Received: by 2002:a05:6512:800c:20b0:596:a540:c95f with SMTP id
 2adb3069b0e04-596a540cb59mr5729287e87.19.1764251360301; Thu, 27 Nov 2025
 05:49:20 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:49:19 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 05:49:19 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-9-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-9-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 05:49:19 -0800
X-Gm-Features: AWmQ_bmLrPADj6DoaQnC1ZJGmDNpk5NRcjPDulR-pWqLbapX0f-JV3TGd0Beet4
Message-ID: <CAMRc=McQO4OKra4S+goHsrq75HJbO1U=pfOg_8RrGFxNwy_-pw@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] Bluetooth: hci_qca: Add support for WCN7850 PCIe
 M.2 card
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 15:45:13 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> The WCN7850 PCIe M.2 card connected to the UART controller exposes the
> 'WCN7850' serdev device and is controlled using the pwrseq framework.
>
> Hence, add support for it in the driver. It reuses the existing
> 'qca_soc_data_wcn7850' driver data.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

