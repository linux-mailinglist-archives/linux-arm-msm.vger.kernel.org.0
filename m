Return-Path: <linux-arm-msm+bounces-61987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD55AE31C4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 21:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36DC416DE63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 19:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A751F237D;
	Sun, 22 Jun 2025 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PINn/ZXA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE4C1519A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750620259; cv=none; b=cdurcEQ9Hx4mXFA5+SbQbqgloriFCVt6wV56NgKsTOgTOHCLYBD52cGiWm8hQNt8zKtHWFwWqsjuXPeqO+sg3cPzApfx23/mCqoTxQpCEW8EQ1fXtR0ciGkYgwYXZgdZQsjRlTNM+bn50GaGsxhyjE2fAZr7KGWatDhwZ59FC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750620259; c=relaxed/simple;
	bh=aFEOGwXZo/AwrY6Y2o0qz0Ly30CX2ZmBavksQY0KkfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWnzUQjTMIpVXq8b8CPQZrLQXaDgqd3BKx0yg+SjmQZzhxgeFIJfPU6s1oIKD5jSUd7l5dKXsKZHwuaQOv8zoC3jFZ1FlLoUq+bmu5H1J0PY6+L2NmkbOYhVSvrPt5iHB2TuhIwD206LWr/0m9CyzdB8hMoILwZe5nPltzSUC10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PINn/ZXA; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adeaa4f3d07so712995866b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750620256; x=1751225056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IbjF/h91o8sYLkOV/LaCb7h1OWB7p+JRyaYdcedZZEg=;
        b=PINn/ZXASV6NRr9eUbnV9su3fYt84qChXDvb6c2qib//pX7/ujeHVIe63Y5bMt7rcP
         4B63u0K9fmLktGy4K4voyOnjVRlLpv9ivloks1MdqO2ru3rOMg3MTfHWika8Yw3G5WG+
         8pL4YNLQfRky8aOZy9KpwzJYpzSZDlZznUzWEgmm0b8bvgB/SmNBPyu8XODrg1b315sr
         xGrVokMG6LA8We6r+VVeXWtnLfKX0f18YTS1olN58rvqUijO7wF8XBhcw0ikM8A41EPg
         gDKvsUuPeVWPA3M6GUy8QluPeRb4X9BE7nyZh3f02p+8dl6exNMqt01d82VL5ESgCUl1
         LO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750620256; x=1751225056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbjF/h91o8sYLkOV/LaCb7h1OWB7p+JRyaYdcedZZEg=;
        b=WUN8oerfqLBZ809+VZEy3eRfQ74gJpmJ0+WZ3gQHxB2BnizEu1H59rWUKffXK9NRBL
         K6BW9as4YLtdlmPEA3bxvJ24XXe/m7dQHA/9jhX4N+jMPjiJYwXQV3T4COSditrj5i+T
         Z+52j48sIEiLLOMwmIXo8AmgYaLVvmJPAuZtSE3QIVOmekaNyMC1Ph1LcKjlO9lL23SJ
         1a4hlmgW4tPRNNvU+fNDqIgyKcKfwk1ea7Gyxlfm6sdNbxUuT4oyFE+uB3R8Cj4oJQzY
         FaqKDWQtx9siJVMiBHQCWErJx0Q0TnuquYHbYBnJ5izKG0xYZzGr/rcg4CKvFZ/As8PL
         G6zg==
X-Forwarded-Encrypted: i=1; AJvYcCUiY5HE8upbVchvo1e6j+iovVxVjDWvpfSzuqkaSyH3mU3YDlqskuXdUbbvN1lLo1z3ndkNR7u/fgTFf1dx@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjycuZSrjkbY2RVA8zmggin7kgEVK8g5bhda6ljUre6PBfHZK
	xXAOMlwQveid7Gd2V8GX/ueMbzfiL5mXaOs6OlAROMOq6L/iXZhiFFEpOxj7R7zs5w8=
X-Gm-Gg: ASbGncvesOEKf/Gb2Ri1HbQZRmlX4csPFQ+9++7KCspgeiMJzMKgL0BS1bh7TRpAXk1
	J1oDksjUDJmu2T/J+5swIYxcx7QHMJLMYv5w9WoaPL+sMHIEOIkUCTU34s1bFKPf5XDcxxvwBXV
	tJkz0s3IdlYdN2sqVhbQfBQ8LAxZEmTc5KuQ5jsHPXPEYAoS3EAi+aEfezQFniVlXtRme4QjnyW
	K5wu9dyVeMqAniIklDDEmLXgSYpqi1TJ/6xHPniWzRkWyU+hB5P9Uz6fqObi2XJngM6/zVDyKYe
	hMlG5EtBJ7IzBPp0efN5RnMqo8EYE3btnzuNtZgHkywKnAkfNC5Ogct2oAE=
X-Google-Smtp-Source: AGHT+IHnoYTbMPh1mNJsjdl28NGezTFEyAyfF+x9j3rQX5TVC51X/4ITVYOLyUMfiFovN1yLap6AKQ==
X-Received: by 2002:a17:906:9f8a:b0:adb:43d0:aedb with SMTP id a640c23a62f3a-ae057fa74c6mr937853066b.61.1750620256156;
        Sun, 22 Jun 2025 12:24:16 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e8218bsm577845166b.4.2025.06.22.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 12:24:15 -0700 (PDT)
Date: Sun, 22 Jun 2025 22:24:13 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
	bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
	konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
	quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V6 02/10] scsi: ufs: qcom: add a new phy calibrate API
 call
Message-ID: <aFhYXfBMRMluXgdv@linaro.org>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
 <20250526153821.7918-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526153821.7918-3-quic_nitirawa@quicinc.com>

On 25-05-26 21:08:13, Nitin Rawat wrote:
> Introduce a new phy calibrate API call in the UFS Qualcomm driver to
> separate phy calibration from phy power-on. This change is a precursor
> to the successive commits in this series, which requires these two
> operations to be distinct.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

