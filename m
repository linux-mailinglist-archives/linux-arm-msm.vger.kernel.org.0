Return-Path: <linux-arm-msm+bounces-83872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E21BDC9401D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98AA8345741
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371A630F80D;
	Sat, 29 Nov 2025 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IyuxZMsm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6421530E839
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427854; cv=none; b=t/bhTGRRUOg4J3LRXAV0csuUKICr/dTXrLXXUO25TZ8VIu7jyewy93GpEbziUXFGYLoDk8uld1luOVqxZzBBRx65+/ArEHJFTddItZvyJQRiZRQu++TUMxtkvxWVwbmc7SM8rmVACP74fjlDUrdgxGUrjSfawdKe8ILeGly0I6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427854; c=relaxed/simple;
	bh=On8iufHNupMUM8gQiRcj/sMjUlOBoIku4zCGN1itpwA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rqu0fB547nUgOkG0pB4qu/iwtDVbIt6iIgFJc9o2N0u9Lh8BXiJHLu3a8eaTquEMTElHI1rpopDxOR0PihSmZ1ueK1HdBiiPhbtl/sfTbfBE6BvBZ4TByFeG1vp8dtFoDQGhO/1GD1cZLIiCFaUlOLMeRzuy15RR0Y/qy95ANwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IyuxZMsm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3c965df5so1570979f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427851; x=1765032651; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctIpJYtrQV3nLKe/1NlZuGbTH89WBc7HNhCgLG2n0ts=;
        b=IyuxZMsmR76vTptkNE5lElzz/1qfJIrfVgY4Awu3WSbd/ALHao3ERTiI9lRjwUFmGW
         wGkTVKxcqSirvEmllIJAeL9QOiK7l4x0GK7OK5dpQZc7CrwPYtwOvqkEWh5FZTWFWFuc
         WU6thrTFKWFkpZNO09+MUYmmXYAnjMZhixzxWJ7UERIMraSe1EQNRg5nQGr+3b+NCZDo
         GZrKjR1Dcft+/bDK/wAe/OnrKrwPQhD67Y/djVlcpTiRd3LyNxt8p70YqH812uNMg1tF
         O0JsQkyLWEGhihS/ZYSCayoMmj43KsIOb1wGn81AF0cqoj2KuyYn+r4B+dEn+NxNtxkw
         h9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427851; x=1765032651;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctIpJYtrQV3nLKe/1NlZuGbTH89WBc7HNhCgLG2n0ts=;
        b=sRcy2v80pi9uBdWk+9zOkH3AXncCqOLdPdnroGkFB5B3J6vQ01tkAs2bT0OaU1V7Tp
         oEsSp/LJy4JM9RH4iNrqSKdJaUtZznK7zw0q+BcNm9KVHszaMfgUMvYNoyBMOw3x8lvZ
         GHJWLFv4JGLgjrL7WFfFTDFEaK193lyS0b/IXtF7l5O0dRUarWYp0gMQDuX1hkFNFK5H
         2vSfBSipx0YOiWpaHW/ZibygmME+9m8t5ZoYCI0eBUuV5jyxPQ966+v+fL3/btrMOOU2
         rdd/KMn/Ozkzj0LxyaCpUIA5j4uBgE2zQMvTNvu+l9WE779J2w4Fmw4OuFTaBXKjJvrM
         AAbA==
X-Forwarded-Encrypted: i=1; AJvYcCVlI2QYDmiz7UFwfpGs0aHBnJT8yYIFMA2WkbXd4JLNJNxn7KQcw2Y6tSCTx2yefaXG0+kw1/0KZl4OJrnt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe+JWn0BsJy0E73PwSCTKR74BCWuMoXKnAeNIn5YMubm6fm52h
	o5vh00WzIhniTtDl16a4B1QZSFzXL43dU+yMKwiYCQEcWxMiy/k/HetioS7lyYUUBcQ=
X-Gm-Gg: ASbGnctrNwJldyMWIuL+4bvopVEkDD87JhSaNsHxle1HIMSt07BOvYw5Aj/YFwz+/Bp
	HqCQs8oyWjJpxEBAkI5JkM1v+11rkNywuQDXKZiDvtZky1E9f7ZwyhIBx6wIT7gNt2m884pt3YB
	LYRbTCmsp2rpyv5sEmZWsPC0iRr5n31UYnVycm06uq5J0AbfcdZ995SamsSujlfb1YS+OImfuXO
	6NickzJ5aN6SaidvFBBIcgvi5e8wuveeKmQNBHGIHF8lkV5v2W8U6BZ/6ff6SUa+Mr5Dro9Nd03
	GK6m7xQzWsIdnrcDIkQxPWncDKmvpd7dXmLP70YdrkygNlUphYzmGHahHqdMlb+3yjWPiVraMIH
	JACWIhacf1VCZv4qXGohz3e0afg5mrNET1l6KXJldMbq2eXC7pV3SxbtR3jYME6iBHGtaga2VBt
	VKZGTk2OjyW8JiTcra
X-Google-Smtp-Source: AGHT+IEagBHd9lVZqVEQQFeawH/ZHO01RUoyPCy8iCQRfDy6+PBcG45QVAvcVinElE8Ql4ZFoPlYNw==
X-Received: by 2002:a05:6000:2410:b0:42b:36f4:cd22 with SMTP id ffacd0b85a97d-42e0f344714mr21478943f8f.38.1764427850629;
        Sat, 29 Nov 2025 06:50:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d618csm15509253f8f.14.2025.11.29.06.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:50:49 -0800 (PST)
Date: Sat, 29 Nov 2025 17:50:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH 0/4] remoteproc: qcom: Fix devm_ioremap_resource_wc() checking
Message-ID: <cover.1764427595.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The devm_ioremap_resource_wc() function returns error pointers and not
NULL.  I don't know, if you'll want to fold these patches all together
or not.  Or into the original patch, perhaps?

Dan Carpenter (4):
  remoteproc: qcom: Fix a NULL vs IS_ERR() check in
    adsp_alloc_memory_region()
  remoteproc: qcom: pas: Fix a couple NULL vs IS_ERR() bugs
  remoteproc: qcom: Fix NULL vs IS_ERR() bug in
    q6v5_alloc_memory_region()
  remoteproc: qcom_wcnss: Fix NULL vs IS_ERR() bug in
    wcnss_alloc_memory_region()

 drivers/remoteproc/qcom_q6v5_adsp.c | 5 +++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++----
 drivers/remoteproc/qcom_q6v5_wcss.c | 4 ++--
 drivers/remoteproc/qcom_wcnss.c     | 4 ++--
 4 files changed, 11 insertions(+), 10 deletions(-)

-- 
2.51.0


