Return-Path: <linux-arm-msm+bounces-12488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82486862CEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464D328315B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 20:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6CE1B947;
	Sun, 25 Feb 2024 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsvVq1pD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5971B94A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 20:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894037; cv=none; b=Q5PWwtsF8XBuoBx6X5BCKEH/3jvRnrN+AefXV8azu7RqzH2efTGgYc/jE49+1ySDwZ4qhTqguGapdcSJjJ/G5KIwYNxvVPY0Zl5iFsqbCWO0nuiMJdaSGt8LWc18CTJ95/zffAwMaI9/7oYj007q9ogL6B852gly3b9MyYP30SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894037; c=relaxed/simple;
	bh=orWtM2LUxedNHJGeLMiagIv7Wxt7W0zqoM/kf6ZlpTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDdLQAnaHbFQHZMbwmIP8e7WUt4HIuO3CQRigfModWiXrTmzqfZIQ+XCqDB4t9CUjgPWViHvkpClCpYIpOK333JTI8Ul/fmPkaM9NqcEM2TTYtQSZl4vzOzi0vCTYf6MtCwD8vi+gBLaKfK+l/AQlSPhWsFNxlu79jBH+G9EVIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsvVq1pD; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-608d4d18887so10643877b3.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 12:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894035; x=1709498835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d77eu/FHVZi6zJ1GDoPzIaF8g+AKSzhW0pKJcjrEGhg=;
        b=nsvVq1pDa/F9T/4CYMxDS08Zg4m0Bnwg1WppeYEkOxmQJlBVA0MJE/FhmFypef5Xxi
         XD5ckNBQMftUUPa9qgvL92lOShxxDsouHzhvm1cGifRUuFoBH1Eio3sdMQAsLd53silH
         kfWz2toP/UWA/FEJGBf70GIEDZLzXXEzNoOab2MdPbh07a3GiDvUaQkq0nFFK5grOEAl
         oD5ppdN4CycebhrcJlPN968kY3+nCa7qfdmLMlOpb97JsNJnkyhnhK5gINF7g+gBol2h
         ymlDKz71d+KO6FGO1DSqONx9+soTsBDdug36kwiU9FbvgtrRekbPuORHI0uR3OHpPmOA
         R2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894035; x=1709498835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d77eu/FHVZi6zJ1GDoPzIaF8g+AKSzhW0pKJcjrEGhg=;
        b=K60Ypgvg16hwhUKGL3I2Ai3ZiDpQ7v23D3L+kpJXq4TczZ5Epehcn5t3YWpA9380Me
         QyZ/ZF8ilYDDD9vKLqqdbPNqxFQ8CyIOSuTKMAPp54/9uvi3mLpm6idge1a7KjvuubPe
         w67fRg5mjZAfq8McAdQHzEQjKjpo+MeIleVwiAqmutMCwpiGruj9uOK0KuWbqXCtOG/y
         yT0X+YyajLAJIr7KDJxuONH+i9w/77hpA4+N7bY44EBblBn/lg8Uq45XodMqqEYpppkq
         /FbCX7+XCw4GzZViwa40WJl3kK68WTTTHD0agp3rQ4siL+g6N3q9nOsE09dHLhHGc4kn
         9aWw==
X-Forwarded-Encrypted: i=1; AJvYcCUXoQEbbiYDAdxHS0pcbgymR/on5GVdIGZsbiT5BIFikR6I0dr6LTjF6waghC5So4UDyaN6AAuxHFnS3E6zkgOkkEhJzG8gWxARTZ18Xw==
X-Gm-Message-State: AOJu0Yx1jtPqflpIjitreOJfvZBTzcB+kLfWQ2rd3DzlGdLbDwJvkNV7
	nGKts6ftFoivxKbH7XQrAWnxR9ej9mA5+Ms+xeNPbJRWM4glGFikrimyIrvLnUM9hEtQHZnNbXO
	fylFZvL/1VGkcwMl2G5Rg2b8GzkO1fq1+mVxKoA==
X-Google-Smtp-Source: AGHT+IHTnUYcauY35oVfOaINpJ+/FyG5PANCFBjjE7zzg2RMkicpeC2FUdwaReaUnviNUVeuuUM34JGalg5D0RwPxwg=
X-Received: by 2002:a25:8d05:0:b0:dcc:b719:4e4f with SMTP id
 n5-20020a258d05000000b00dccb7194e4fmr2970999ybl.53.1708894035178; Sun, 25 Feb
 2024 12:47:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225202545.59113-1-krzysztof.kozlowski@linaro.org> <20240225202545.59113-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240225202545.59113-2-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 22:47:04 +0200
Message-ID: <CAA8EJppZrmCTR6tdJQzv-bOBi=BFtZZE7ZBDFDPo49DQOk1_TQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: aoss: add missing kerneldoc for qmp members
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Chris Lew <quic_clew@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 22:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Add missing kerneldoc to silence:
>
>   qcom_aoss.c:93: warning: Function parameter or struct member 'debugfs_root' not described in 'qmp'
>   qcom_aoss.c:93: warning: Function parameter or struct member 'debugfs_files' not described in 'qmp'
>
> Fixes: d51d984c5525 ("soc: qcom: aoss: Add debugfs interface for sending messages")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/soc/qcom/qcom_aoss.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

