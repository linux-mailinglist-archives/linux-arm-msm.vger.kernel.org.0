Return-Path: <linux-arm-msm+bounces-1484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518D7F43A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 11:22:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16EE281643
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD3420300;
	Wed, 22 Nov 2023 10:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gVNuTINJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0630719E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:21:59 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5c9ea2ec8deso35755957b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 02:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700648518; x=1701253318; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/gZ0hKqy1f9kc8RcgP1XxUJkPdo24HWoCQORei+jumU=;
        b=gVNuTINJO3YZMS0daKp9tXQpCdfuT+DlFUNQwHLT6KPOZ1T/stDiOEl+nB01TKi0nm
         DQvngE+QQHlYGJM8zDqCkNbQeDV6aXptQ08AXxvdMK9hpu9gF15dnCaO330BEazvpH/u
         mUYu/PdXqzWCamADqrS1lxjgMqjEvP1Ikymg/2dkUMa62lntjABBk60FmUg9O7n+gwFM
         /crX9hsb552WN5zxiuDJ4W3P+FPcIs/zJLabczzVI/Lhd2bLsg0YKEjusrkBDw4/tD78
         Y76bE0fKO6VCyy7RA4YqeecEhNkMxmHwJcf0g5y6CfgMg6wjw+0fj3jJPTPj8Vyie6yv
         rs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700648518; x=1701253318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gZ0hKqy1f9kc8RcgP1XxUJkPdo24HWoCQORei+jumU=;
        b=wzkxybF2RTMy1Ia6uWPEAdw/M17QclbbO5npbWeGkEQMHb3byBKN5i8Rl4dZxXFQ7E
         vBkGs+VX4JmzFHWdBR0I40Mku7pcbwfXlrHXQ8XjoQ/DjUceM7ZGsvF0pfRPuC+a8BIE
         ajaytK2QVyk5bIKVb5ywpmOMBpjcQ4UXo1xaWFTwnzmoPwW2zy1N2mRFZXje+SCSUDze
         SM2q83ui0siAc+GSLscg0aTEs6G3Vlx5aRizBAjdXJlExYBiNos1r1v4HBvhc1goSfpV
         GhDEvAeBc1xA0kB1POJNVhCLkS7WL0V1k+G/9hTbsPxeRRlWu6cF408X2tEcdhb+edTc
         34vQ==
X-Gm-Message-State: AOJu0YypccEVs8YPy+ZJu/QR9wKTpcx9a0hr1kL3akQBr3oBPEpE8Nh7
	a+AuPJNGnSAcIadhBrR5D4EufPZoXru0xSyxReaGtA==
X-Google-Smtp-Source: AGHT+IEeRQ4qsIvFGcEJIwsctyI3Q+u4v4Ik5e2P38+EqeUPIaxGM5oXZGPeHDuCv4isrbvSHwDGDrO6Y+saFepsexE=
X-Received: by 2002:a05:690c:408a:b0:5cc:8f6f:39c0 with SMTP id
 gb10-20020a05690c408a00b005cc8f6f39c0mr713906ywb.28.1700648518161; Wed, 22
 Nov 2023 02:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-0-d9340d362664@linaro.org>
 <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-6-d9340d362664@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-v6-v6-20-v7-new-offsets-v1-6-d9340d362664@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 Nov 2023 12:21:47 +0200
Message-ID: <CAA8EJppSmWDxCqgKOhbr3JwhKjSvSB89HxtN859EeEPu82nxJA@mail.gmail.com>
Subject: Re: [PATCH 6/7] phy: qcom-qmp: qserdes-txrx: Add V6 N4 register offsets
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Nov 2023 at 12:04, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> There is a variant of V6 offsets that are different, the QMP PHY N4,
> and it is found on the X1E80100 platform.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6_n4.h | 51 ++++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  2 files changed, 52 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

