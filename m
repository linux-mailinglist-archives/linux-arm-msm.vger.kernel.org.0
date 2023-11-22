Return-Path: <linux-arm-msm+bounces-1476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041307F434A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345881C2083C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA8525569;
	Wed, 22 Nov 2023 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n0cyBkXW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCAB93
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:11:30 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a877e0f0d8so5314087b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700647889; x=1701252689; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vP/wEMyyWeZXjpRHPyFJj2NtJhEcodvweIGAx/PKOf4=;
        b=n0cyBkXWblqsEl+hvxa/1Lpw6ZlkChqdzy53FGq9Lgg5N7STbru3hNxSinPUzCjgxB
         fGd9xouR0Mg/UPGl8E2bQPdjtt8mZ8nUYoEAc4m2F/JXA1+mqY59iYwhR6PmcX+d0HjN
         Emgl++Lf3VA+RxKcOr5GI+Gly7Fa8Q+Hx8gdpxBqPUbuqG4PgXiVFqRTCxU2wRvd2UdU
         NecvqnynQG8HHBoHHA5/llSpW4qy11NkGWdkbyWaITVna8jIKbpdsVsLNhLzNUgnjPDy
         Q++UbMoUhoECdKkzcUC2mer0qwRktl07Z/j5Lx3viZjHUFj4l0GMcSesUAH2rZhuydWs
         zpzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647889; x=1701252689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP/wEMyyWeZXjpRHPyFJj2NtJhEcodvweIGAx/PKOf4=;
        b=oDmRxJwAd6sBFkEi2rjDRs/DkSH20tLW9KOSJI3xqGvwgsz6g3pyhnnKkjZ94ZEIjK
         pqAMhqytdO4opDN/Ohfpppys1zo3H9eLwRNLxYe1Zv4ovU9umGRsfwuEAfYyNDcdQYY7
         vYevoN/I0/9QSMmEafkLgURWApkeqSGM2QjOUFCYpbhGOwaqM7IIglYBCaYD0UllRXib
         0wp8ejPWNEaRFeX5tv7D1VE8Qpb4lUdPIqjniqvG1mlQ/cdGmeOG94XQLXuVqA+iylht
         l/g1ZgHTbTeI95YCrQuulhtp0UZZeuCzEaIO+uMGmVLGl3qbp8gObl0WJ9F0KCkhglgP
         H5lQ==
X-Gm-Message-State: AOJu0YwSoMhw5DdRktzugFSS4Vw3Sx9uLhEst95U2xZ5tntF9WHeAsaZ
	j1CELNZhrZNptt4v16x7eI4XXme+68uShKk3PzevVg==
X-Google-Smtp-Source: AGHT+IGx29kdRTQQn8CGZoh3j5mVVsJVk0nuXV4JhCJ+BjSjpht2kOA/BnJgoIEbmsQqceZ6ItO/dEMl6AfW/UGfH3I=
X-Received: by 2002:a0d:cccb:0:b0:5cb:79:ef12 with SMTP id o194-20020a0dcccb000000b005cb0079ef12mr4360781ywd.0.1700647889451;
 Wed, 22 Nov 2023 02:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-2-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:11:18 +0200
Message-ID: <CAA8EJpq=3rPjJXRCBdf_pW5SVR1SgeHZd+4fXsyvw+qg6fd5cg@mail.gmail.com>
Subject: Re: [PATCH 2/7] phy: qcom-qmp: qserdes-txrx: Add some more v6.20
 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add some missing v6.20 registers offsets that are needed by the new
> Snapdragon X Elite (X1E80100) platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_20.h | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

