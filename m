Return-Path: <linux-arm-msm+bounces-43282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A039FC259
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 21:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C5547A1A26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6AE2139C6;
	Tue, 24 Dec 2024 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IAPPLDOu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E2E2135B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 20:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072884; cv=none; b=KK9glLb//0nklglj2f4/pyhNHHwCQL7j/NbMILeGwH3vE6P7cJB9wpuy4VHnYf+6WscD1kDxPeBJ0AYaIcYKsImTdAcTdkQHkAAUB6p7cf8o6Mh1yV3cgjmdcnYTjo5LoB5xzQBy2MBpCx818g8pOsRgv99XwRGH42eDw7yytvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072884; c=relaxed/simple;
	bh=CYgQCzvnilcdN3+zNruXLLlyE0l1FMZLohqbB1FGCMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QhgiQqF5jtCwPnbE+yHyX/E1x7EuxXHhYX0ZNwXy90Qrbn4DPFutWhh0NLckudczjhstlSakP9TnL6FwoCDyoBqNSztvqK6/pxEUVz4uafruO0OjuMBdAsIkzoAQPxTIREAqta4a4Ze7veL62jFf2OFFNzA5DLqoN9QCt04f1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IAPPLDOu; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3035046d4bfso48284241fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 12:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735072880; x=1735677680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSmx/3z/9KsMFggKELsYft98BetV5zNV0d+x+8R4lkg=;
        b=IAPPLDOuDES5IqRLk71EwRgRWa2u9wGT5Cwoy1LRtUBFJiSJ6nO8T5pyDbgUpYbRnF
         DWG6PfZJVuq2PZ3vVLfUXq786YQcmyq34SqTJ8bO/YLZbzXv0iB7DPMLDmFbhbcW0iEP
         RAyuD5Vy5Eu5GuP+X9m3Xyx5Lrh4ohfgdFUiYLXlvkrQu4sOSgpbScVs8jcBt0QTluXT
         dS1eNwpvfdquDnWY1ulRESvbKZ37j5lbKq4i5nxbXaZ5DpZYbaV+Fc8RAVxptmltUFKM
         YYsGgUms0buyTirpJ/PseovtPnKxp+JCaAJkSEP3IjFwfk4IHHiHwxU63MvjEsJfcXBw
         XcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072880; x=1735677680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSmx/3z/9KsMFggKELsYft98BetV5zNV0d+x+8R4lkg=;
        b=a6FBEiD7L47je6bn/10n/iRextw283M3osz5+Tixtsf+Q6Y4vyZ4kLDk+CEehSlIVI
         +wqIbhDolJ4zGSKVZEA8c21OopugHkfdfagdz25IdyOTQLWVcc+FCUKaImkGEH7UxgM3
         nCFNm9K8pd/l0OhJmGqfNU8jfvwzW3q3sHcNGn+YS0+52OKkwvNRl9Ae/vg/9QPlN0yt
         TYsuQ50NP+FcRn+G7xviOr1X7WCdjT5RceayYLMN65dKwDjMiEDfS2oxi6OLqCQ0M2wx
         nF+ZEuZLdUzOzQSDubuf+ITRmJj3jJOHKpiiS504qJa+06xbclcBiiQNhJf7Dt//wn6/
         Alvg==
X-Forwarded-Encrypted: i=1; AJvYcCWzYm581J3tv7BaUHjiB0W20dPpDHpaHV0EQXZknKgAPrW1N+lpEjUs8IG6pDgXGdWQf5s595DGu1CsrjQE@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfHfh5giAuqp4ki/INCXxflc1lmWPreTX9gQ6MFN5UwIsQx7H
	yhJzE8y+xuZ5mVz+4khOKhydVAD4g05NbJEu9xjpY19ACQ7Qb3o48aoIB8HFGTM=
X-Gm-Gg: ASbGncvzHko9j3o3QObz8zyfIqUFYkUAWzXizyfGkItUbLMQjNUgy3CKb+5A03ZhfMa
	b8xqeq92NJcEL51vi4pqZxhT/N/lwdoStS3C5b9BFmjK2rP9zefylsotFdKGpzLx37LSL2Tu8HD
	GEt0/pMJvMw6YNbVqLInJflXezKTEPPOxox50mkrTj8W+qu7EcL/vF7lpF9hLizRmuJZLVSaW9O
	29uuAL5qmBTuHgzTAsZBuInr5gjbrL5nOuhhhbebW9l/p7NXBhgil0s2nP9r4km+fOn6o5v
X-Google-Smtp-Source: AGHT+IGnBXUn8XrDRSk7MSHo/mbak7ZljAWLgb4oZ/IVbfIPiilmBmfXljpSRu+9hSl/CaBSMljYuQ==
X-Received: by 2002:a2e:a6a1:0:b0:300:1e0e:48db with SMTP id 38308e7fff4ca-304685722b5mr45998001fa.24.1735072880580;
        Tue, 24 Dec 2024 12:41:20 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:41:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Check return value of of_dma_configure()
Date: Tue, 24 Dec 2024 22:41:04 +0200
Message-Id: <173507275849.561903.11265213822765879155.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241104090738.529848-1-sui.jingfeng@linux.dev>
References: <20241104090738.529848-1-sui.jingfeng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Nov 2024 17:07:38 +0800, Sui Jingfeng wrote:
> Because the of_dma_configure() will returns '-EPROBE_DEFER' if the probe
> procedure of the specific platform IOMMU driver is not finished yet. It
> can also return other error code for various reasons.
> 
> Stop pretending that it will always suceess, quit if it fail.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Check return value of of_dma_configure()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b34a7401ffae

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

