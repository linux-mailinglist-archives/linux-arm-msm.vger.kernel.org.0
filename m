Return-Path: <linux-arm-msm+bounces-11998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A37E85D0E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 08:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7493286F4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 07:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E4C3BB46;
	Wed, 21 Feb 2024 07:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rKmildM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685513BB33
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708499315; cv=none; b=sAt0xR7TMmhmGGpAlS1c8gaA9z8FBvRo2sL4nkrIQnHChxm8ItWpDJgRhqwnfLjU/b8mLllKx2mrhsfNMyrBxIQjfTrS+HLCdixYLW1AX/3xHIrOyWhljbf5iZF8DXEgaqcerfxAPKRMHm1kcfLyxo+O3851mKmBEQogzE/0CtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708499315; c=relaxed/simple;
	bh=ILMWXHf1c4fKHxaiL2VfH6xoMnEXAVo72XaCgHVtOAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u+dMbSu52G1fY4B73N1tBZjXotbbBWp+P8Dtew3faDTZ6hlfCrS7ntErRwMe7xVdEUbM+quyxgapf9Pag6qKZzPgcWQ+dB+bKYV6KnWyDUO0BDVxLcA4UtJn+DXduvoIWnBa06NSuFyKiylhnvzR9vB3fluohdd8JgJLBgatv2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rKmildM2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41272d42207so5879655e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708499311; x=1709104111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wz/aacgnQr6q7J4QTYXshFSvodlW8ID/l/+tL4l/K6I=;
        b=rKmildM2H485LDT1Lcl3yjYXtkhF6AgUCCufhtZrnrswDT3qyGcwH2x0miM8iYxyRS
         r5mr5yAuxodts+4Hj84m4dlNt3ilKBEcmFYPJ3sZ79pDYGrnE6hTooJUmKn9KSewdkzh
         2vKHQCrRyCYTzEsJVCTeBkDoRBm9YvMMRYMRhjZ90n+mJRwFCEEUqmTGtaq0SZpgNXmm
         0W9mbfBA6XVQdqSpxnniaz5MHztQ/Loa4tpyv7b9p+AVskxN/am0rc1qP+52i+OcVz2p
         di9E0MYvj+ZC+DtM/PD4kRQW13H8DBIIWCbWs7G2vWriXUBPbITfVnGvhA7wXXGARqMw
         DuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708499311; x=1709104111;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wz/aacgnQr6q7J4QTYXshFSvodlW8ID/l/+tL4l/K6I=;
        b=LGp4RPZx/6OVP8lTif6J+zfkU9IZcF88y6EPK5I8r2fyNC2X1Fm5LhG1WNCeAsPk2b
         MKGt3smZnIrWV/QRTqzyTaW0objK29W0ALimpmkZFolUQfyvhBPevFWfSifU43ttq6uW
         pSR/ScRMoremvm3KxRGjJMKC8TeOiGJlTaGkz1b9UaqDih6GMYxQk05G8uQW977TnvGB
         37k3DvJPR8Cw3D5ohb5jN9RVilhjiBSgM1U2f0P6eE8ujkIdmsjPRF1lAgfK2/5Ym4sS
         8NaEf4quaXgdUwVYHuq49UjVeUI6bDhCbF7wP5FaR8mwPmtWcnt8VVUUw+l7I1DR9OUj
         yqow==
X-Gm-Message-State: AOJu0YyKlnJ1gIWqtrkFbgGEBRDcY8M1eBqiFPZT+IUK1HYBnnrtAQNK
	91biRGxxYsYSpUE/HPXBEfevVToOG2mCtfu6AxNwBoLDyvpb9ACCYI92V0wmguBxpHYMaKaDE62
	h
X-Google-Smtp-Source: AGHT+IHkNCk1VUxhjyPZwK1t9iqMEkJTTUWnWg1Cbi1kKmz7lDz1AItpjPBmJIU2ebvjOgJ900bIrg==
X-Received: by 2002:a05:600c:1c1e:b0:412:1d7d:6c51 with SMTP id j30-20020a05600c1c1e00b004121d7d6c51mr12626174wms.6.1708499311213;
        Tue, 20 Feb 2024 23:08:31 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b0041262ec5f0esm10700077wms.1.2024.02.20.23.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:08:30 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: linux-arm-msm@vger.kernel.org, Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
 stable <stable@kernel.org>
In-Reply-To: <20240108100513.19993-1-quic_ekangupt@quicinc.com>
References: <20240108100513.19993-1-quic_ekangupt@quicinc.com>
Subject: Re: [PATCH v1] misc: fastrpc: Pass proper arguments to scm call
Message-Id: <170849930946.22958.1400106110222273867.b4-ty@linaro.org>
Date: Wed, 21 Feb 2024 07:08:29 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 08 Jan 2024 15:35:13 +0530, Ekansh Gupta wrote:
> For CMA memory allocation, ownership is assigned to DSP to make it
> accessible by the PD running on the DSP. With current implementation
> HLOS VM is stored in the channel structure during rpmsg_probe and
> this VM is passed to qcom_scm call as the source VM.
> 
> The qcom_scm call will overwrite the passed source VM with the next
> VM which would cause a problem in case the scm call is again needed.
> Adding a local copy of source VM whereever scm call is made to avoid
> this problem.
> 
> [...]

Applied, thanks!

[1/1] misc: fastrpc: Pass proper arguments to scm call
      commit: 5169a077f22a23d27660d048d5f43a592fd2c62f

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


