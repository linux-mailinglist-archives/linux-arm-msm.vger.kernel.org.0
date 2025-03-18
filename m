Return-Path: <linux-arm-msm+bounces-51681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC28A66BC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEF1B7A7D39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1701EF375;
	Tue, 18 Mar 2025 07:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNXz8GvR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152631DE3A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742283286; cv=none; b=pDSFuMP3W8sDHMEsJ/A2QIHL1AbmdLzLAi6skTp/QEjb4AwyLfUPTsGSc/FJLecIXSs62sHpbYdHO9MrF+fuOSeEFoAwIUiDWVW4aoItG74OW14Y1k4YzDzAubAcOQuwtxpgwc2L55F0cmaPWciXBb8KUk3loaF04dK8xtNKPCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742283286; c=relaxed/simple;
	bh=Ie3if0QiE8quGYnbhmI4RJUqhXhjhyS2w8nEhrhhJJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ja4ZrzHBoUB77CFytOwhvUzRrwiJraNj5KsdoqaO3tDqrqPLD9IOcENaSF8YgkpwYVSmhrwbuXrmR6CdJr2zqCHiNLCXfvqWJp+HfqVwdMRn3gUqAcAjn726SDp+BDoiing7qPmwIrImRocLs5emJDsh0Wp4NtToNQSJs2jMfrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNXz8GvR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223594b3c6dso108447595ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742283282; x=1742888082; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sch7la5qdb49duMOy4vFgMfr/xMO2MbtEqZ0tC+N5Co=;
        b=mNXz8GvRVxSPnyWWROXnh144OIxi65p3zvhUJSmXMoCYmi9k544L8HVvVRzNUBXrgj
         h7DIRId/X/BWpo4rcPaVD3RgYiX3DmQGrIAsDZzcvU3jrVrNEqhVlKKinnYHFNIlMQjA
         QFF/exKiN/Eeu5EM1V1u+p1pzzdaECiLsiyOfjdiN6h+FcxEWufNSgv3jWhp6C7K/8aK
         4xpu5nahnGovm0T0+jVkB2b2T7pEAR1RRc7zOlijvjci4az1a0UqM8Xn8UM0TDRXy+lj
         EAwZtS1PAX4/BM6Svg4AohM7Q6WVWn5FFQrctZF7oYuKZFmeraoFI6v7WiycmJ5O0q3d
         CS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742283282; x=1742888082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sch7la5qdb49duMOy4vFgMfr/xMO2MbtEqZ0tC+N5Co=;
        b=FyVzfg98mdKcoo4iWUY/hVQopBk0CV8dzLyZr14fVrwwv6lt69jaR67KMsXEEVtlyS
         a1OtY+3B5dOr9fqK95HM7Fu0wGVbmJefrBfq6NERaWUspNtMQAfeBaZ05zfGaMfYrGC0
         0PGab9PjWd1dFxDknpnZYyHF7ZWIlFHqdY4Z/DzepDGkHjvM3lfKGjIBp1/OKUCj9cf/
         kpJJXhNooJMd2az6fWU5og2GlNWzvkH/iv3ccRd2lxZcyRrgExHqIbaJvHq0gv0awYfN
         Tm8amzDI8rCojL1Qw/6VSUL/mWRE+jYouIvce5IutjK2RQObt8Q6KSPYkDg2bJ+2ROz/
         L+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtDyJ94Dw2MypEezqtQaxn/DU1mTDQghiYCPRoDcjO8L61W7Wr2YMj8boUDeqKXFPEQ9vqQiWoSSMqXGGX@vger.kernel.org
X-Gm-Message-State: AOJu0YwSV+JcQIzZdfK/+L5UmoOYwKOtm1ko8WdIBiBkgaLEFChRNWzG
	D0/ObG22hUpsw1Qwm5f9jmFFuYtC2tpFo4jdKYzoGWMB0guhxUg4LYcg0hWgsw==
X-Gm-Gg: ASbGncvVHNZbM1ZR3HXoiJ7ZeORBGFlMghw6op5bCvakrEKX8ADKi+ftAbEfBMmlEo7
	0CFOoh8/uKfoBQvB8JzwlKC1vV0Sz8ZvJeWaPpyJxRBYwb5fD3rjGIhaxeyleD/plTIRg+e0F3B
	XJu/epXrNdADLd8LKrOxH7ddzqGIueBHELLgX2e7HV1X4UjB54p+vyTxfdRX4Nrq6a/ZGkmg74t
	7ssC3jetbb7dK6WaOvRVp+giirpN9xjNXSQkaC/eGjhG8mhFmx8qCVupn/Epbk7MWe8IzmeioT4
	pE+V/+IgBKUNNfKfYkScH3pYEJpF0r0lJMuQoVnHsP1zYNDgiA2DUSF6
X-Google-Smtp-Source: AGHT+IG5yxqfLmJatVY82JIyTMbAGWoGx5aMvFHioASOebuvnlP+jZZ+3cmaakAsF9c4YjxeoRTg9Q==
X-Received: by 2002:a17:903:230d:b0:220:e1e6:4457 with SMTP id d9443c01a7336-225e0a8dff2mr180297405ad.26.1742283282287;
        Tue, 18 Mar 2025 00:34:42 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba7260sm87304195ad.110.2025.03.18.00.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 00:34:42 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:04:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	broonie@kernel.org, bbrezillon@kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mtd: rawnand: qcom: Fix read len for onfi param
 page
Message-ID: <20250318073437.hmunilehmqdfkyg3@thinkpad>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
 <20250310120906.1577292-4-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310120906.1577292-4-quic_mdalam@quicinc.com>

On Mon, Mar 10, 2025 at 05:39:05PM +0530, Md Sadre Alam wrote:
> The minimum size to fetch the data from device to QPIC buffer
> is 512-bytes. If size is less than 512-bytes the data will not be
> protected by ECC as per QPIC standard. So while reading onfi parameter
> page from NAND device set nandc->buf_count = 512.
> 
> Cc: stable@vger.kernel.org
> Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
> Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

