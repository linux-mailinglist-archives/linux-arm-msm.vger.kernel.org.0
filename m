Return-Path: <linux-arm-msm+bounces-3693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F3B80879B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5F03283BE0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89C939AFF;
	Thu,  7 Dec 2023 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6R1feD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A57F84
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:23:25 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d4f71f7e9fso6664737b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701951804; x=1702556604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Zsow7R42bQ9UqU+3gHiABlqbyNHgme2JlA6feobUee8=;
        b=X6R1feD3NmBl6hch0z/pumU3NF6YLeGO5SzKZO4oA1h2vkUtL3KTaugyjWbxy0VmoB
         l2mz/ZOcFnpRAXezNodmw4z7nEeMOBVLb5vGR+ps1LDS1Yo99ChfLOgrK1bEzhxRXXC/
         E+seKQoedMToKtTgcF//xdJbbtxF93vJBaF4sHoh0X5gnsBjMTVpy3T4L+AubHv5dLIG
         ngkf/zx35oVNomz+fowGLmhnIlJfuPAa/p0iDPOoTIn9suJI/Mdbu1jJ3ReB3i7Cs/xl
         v9KBe0HFxIkBF2NwO83EbuSwuejwR+VWXyI4xVuA7olrTyW5+lLxwi9GvkTVhchF360C
         +7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951804; x=1702556604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zsow7R42bQ9UqU+3gHiABlqbyNHgme2JlA6feobUee8=;
        b=Jiepf6VjxRsr+71yEfo1NkGxXmGdBGoYC4TteWpwb/p04jBv9fVJ2bolXd1mWSxn5H
         QleMNa4Llnq1Kl4tEjgnZilWWK/dt5jyDJrwbLHUkFjliBlNVZtMbyLlhcEQMPbgTFNm
         CbFFLFse1uLJnwALledLI7mX7b/yAQCYSobbuTkXvhlWkOQsPSfFs99HPxsRhXtK6069
         moduudGBAxEYZzMpVil8tq0PFz7x0jPIyYdDOcFmvPiG3cbMLhh/QcA4OfP64UGhJYKa
         LgYfIjNFzp0JbgXeeMwfLFYVVJVjVtMy0DbHfHd1IKmqqJNjBi+g4EoSv68yxX+BVQky
         se4Q==
X-Gm-Message-State: AOJu0YzaM3aPG9CHcSsNnzC9UQLj9QQYP1YTAhYuFNbX2vqcFM5Bbpcl
	aJFSWipJb38cuEDrUaGX3SzVK3K0GqSKW37grGcF0Ohy6CcPD8jf4TE=
X-Google-Smtp-Source: AGHT+IFNoH29WEDXVoVkuFnOOvxiZfSITNbl6Pf075Eno11hrzpebhkcZjVIB++Oz8CQvurJ4Q/6cJw2CGk8SNkd9P4=
X-Received: by 2002:a81:ad19:0:b0:5d7:1940:dd60 with SMTP id
 l25-20020a81ad19000000b005d71940dd60mr2152488ywh.54.1701951804590; Thu, 07
 Dec 2023 04:23:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-0-dfd1c375ef61@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-4-dfd1c375ef61@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v3-4-dfd1c375ef61@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Dec 2023 14:23:13 +0200
Message-ID: <CAA8EJprJzmBKDkmnViD5o8z=SXS4Y873hTSe6NJGKwoEdG7X4A@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] phy: qcom-qmp: pcs-usb: Add v7 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Dec 2023 at 14:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> The X1E80100 platform bumps the HW version of QMP phy to v7 for USB.
> Add the new PCS USB specific offsets in a dedicated header file.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v7.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

