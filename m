Return-Path: <linux-arm-msm+bounces-3304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C50878036DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 15:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F141C20B03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F2828E10;
	Mon,  4 Dec 2023 14:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YaB/gZUf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D38FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 06:34:44 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d2d0661a8dso51199647b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 06:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701700483; x=1702305283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UBJs9HC3lM8sYwTRCXh1LpvZlOzGYSuuBBbJkIOs//U=;
        b=YaB/gZUfhLPXoqYnr1QPK96+E7oKc6HgYxa0Hoe+qWsBI0OsLUZqhiE+ee2/6cddv5
         ctTn9H9sDwBnpQzSu8BF8XEJdCGa5xXSJvP4Zl1SGlZbS6nNZI2UY/BkLtX/7ZZYevrv
         QkheP15F2U0dRWjJS7dr1C/myPZ8gIu+/2aOHUzlvn1F5qWxN70Lgmuv2z8T/obv1CiY
         bmSo7omQmPwIY/2dJO0igkk9MfllyzQ/56IAjytLwUVGgVE7fOmnbkXPaJ2jJFnaZ9IY
         roUN6luf3OYzgLdOCmKTB39WkRtMRcCuYi1GjVHANlpNYm62sJqadxUzZ0SwxBZqeEir
         PyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700483; x=1702305283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBJs9HC3lM8sYwTRCXh1LpvZlOzGYSuuBBbJkIOs//U=;
        b=rkzjFmjZKr2CxqzERIKcLW1WayieuvE2UZ6Ac5HyfMif5qcFPtFnUinacEzs3S6kq3
         vMnDevI1Kfc/EDfCXCHGO9E3eVXdoSq8YmCCVwMktNknqvZzRhqITpyyPqHRCH3h8MB1
         Qf+Jup29a2wkTdrWSETH9wLaMY88wZPL6pRP1Rnl+woLaHlKFne3LBeQV1+8U7yZBlD8
         NINGzaxOskrYI+GmT1tAm4gSsuGerRObQeisGsoSHK/9Bso+LaP1W9He0182311EjtMh
         QNzcX1900hkA+PtORpw+W864StSW8gQxXsz+oGuuvgMrSdh9cf44YlbtJX9Fpb2O8Ahe
         ztKw==
X-Gm-Message-State: AOJu0Yy94nQtn/O8GUqJWjyyhq+8CUVUkmmTwFojeuRMYaJzN6+4fsj0
	qhtxht5nhDDaWeXAVvrF49ngvDL6jiAPT4+NVa8Ikg==
X-Google-Smtp-Source: AGHT+IEQBiggNpMjfj9oThMBY/8bdATSwaG+XOy2BXMbwSykTrdtIUthOTH1NAuFhyC+vQtpeQxbkyOnMjBb+nYhN8M=
X-Received: by 2002:a05:690c:82c:b0:5d6:aea0:2236 with SMTP id
 by12-20020a05690c082c00b005d6aea02236mr3471440ywb.26.1701700483592; Mon, 04
 Dec 2023 06:34:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-0-21956ae0c5c3@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-7-21956ae0c5c3@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v2-7-21956ae0c5c3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 16:34:32 +0200
Message-ID: <CAA8EJpryFUtWU1PPHzW2+gkz9UOzWPTvao3NTS0ABhLO4HMFgw@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] phy: qcom-qmp: qserdes-txrx: Add v7 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Dec 2023 at 15:08, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The X1E80100 platform bumps the HW version of QMP phy to v7 for USB and PCIE.
> Add the new qserdes TX RX offsets in a dedicated header file.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v7.h    | 78 ++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  2 files changed, 79 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry

