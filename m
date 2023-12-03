Return-Path: <linux-arm-msm+bounces-3152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D696802627
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 19:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D90BEB20988
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 18:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABECDDCD;
	Sun,  3 Dec 2023 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IItbyqSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7614DEA
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 10:12:27 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3b8903f7192so1774441b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 10:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701627147; x=1702231947; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg+rYehudk4zCa2J1cWSGcffMXq8x+Mv5QTHznDZ7UE=;
        b=IItbyqSaslJmRtggyu2MJS+ZvmgLSPiVPVxd2zCgP5su6Rzc0f436I16Kzy2d3iS7C
         z1e83YjuZ4XHkI0eXQsQcNsF9Q30ABDjm7EAxKQnGUdTRZPUxPKzyArV10HiKD4jnUrR
         BGjpu/N3DNis4/6iR3DnUlfgQhiw/py8pBKSNjBNEa/0owAG8s3GB2C0/gSN4rEFKxn1
         5kqxHQ2+Gh35xP8Wk+t8VBLlBf9+L1546BE8iOq/MyFyYvIY7tcSf8jpK+lVMZKAz8ce
         AxgOx5tKA8F8NJysQmRx06xrpnm7YbBbD5sUQuloYcKh5X7lm08SJYM4OdJh2riv0DF0
         xoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701627147; x=1702231947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lg+rYehudk4zCa2J1cWSGcffMXq8x+Mv5QTHznDZ7UE=;
        b=DBJqO/cFB4sxbB2rWTPOuc3GTosDjh5MpJeSBimrgha+AFeq2mEybcGaZjLzTFNpTf
         gupo1OAtCw7czzOBASv92kgtlV9SgBQ1O31CFwFp0Vl6debbDYcpjlpmi2J5YPKJ2vTQ
         TQEviXJPtz72U4+6mZtyyWKSz48X0mvKUUeSTZpEhzCCsXbKI4mO3b3u51jJK4PsiXc1
         njkPHXO/i0vCnjyZasBJAUeePkbATKLAf0sey3Bc3Ij99qrxwDu7zcTnHASWa9mO0DXo
         Td6EP5yHaWEe2oSNF4iVhXJnGgHHhUdeoDwQ9T4HWKxhUDZnLUTQ2TSXQUtXyiYufS1w
         BuXQ==
X-Gm-Message-State: AOJu0YxryA25HIymzCubp/2JGQ1K/C2o19HTA7D2VKpE13sir2+O9dDQ
	kp0F+FmiV/K67iQF5+M3AR2Zi7ajIWOknVL3w4e8GA==
X-Google-Smtp-Source: AGHT+IFKiSLUh69bXIrR+MV8gBrvB/vkxWpWEmjwGc5/RbIXCKbbWe0MXg9D42xuTng5Uf6CH97soxZ4iLXLqlDmZLs=
X-Received: by 2002:a05:6358:10a:b0:170:17eb:b3e with SMTP id
 f10-20020a056358010a00b0017017eb0b3emr2568531rwa.40.1701627146725; Sun, 03
 Dec 2023 10:12:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230612133452.47315-1-luhongfei@vivo.com> <3a32ad33-5f0e-4166-a118-1bbbec9c68e0@ixit.cz>
In-Reply-To: <3a32ad33-5f0e-4166-a118-1bbbec9c68e0@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 3 Dec 2023 20:12:16 +0200
Message-ID: <CAA8EJppC6kGVf2XKu8AWYtJu+p5auei3Mdttae1qvuxRrSa-gQ@mail.gmail.com>
Subject: Re: [PATCH v3] soc: qcom: pmic: Fix resource leaks in a
 device_for_each_child_node() loop
To: David Heidelberg <david@ixit.cz>
Cc: luhongfei@vivo.com, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Dec 2023 at 19:46, David Heidelberg <david@ixit.cz> wrote:
>
> Heya!
>
> I think this would be great candidate for backport, at least up to 6.6.
> What do you think?

Yes. Most likely it should have had:

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")


-- 
With best wishes
Dmitry

