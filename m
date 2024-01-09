Return-Path: <linux-arm-msm+bounces-6710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFCF827D37
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 04:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 920391C22EDB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jan 2024 03:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0E65390;
	Tue,  9 Jan 2024 03:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OpulYR5e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732EE5395
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jan 2024 03:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e7c1012a42so21215387b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 19:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704769601; x=1705374401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26JP9y1F4cMVTf91bkP52Z8nKjtVJapFjy43p2aiDF0=;
        b=OpulYR5eZQF12d8gtxCocpTnTVD8GHPmlhonVHu2fxeWXjM5WGTU5JRCiDBRxBT6ST
         GI1YmmXTxH1mU4g3QL7QBeAISLRcDMLlo7pfku/lgoUEEVBjK9J6fjUw0r4wRCuKi7t9
         Yhi0owJnXiIRcdx9N+NxLAvii70xwr9N4SufGPfyYZ0NXmoV2QV+03BMEp4yqNuWLbhX
         1W5MhoP4Ssj4w4GK+jWrstfwFXZsGHj1loU5S0FLjyppLp15/QH2ivemW8Col/bvde/i
         50APAgB7eFvCUqurv3e88olDfYXKFzZ0++kZNb4qQ49ezEa5mQW0nXwU+Bjuih1HZBhV
         7iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704769601; x=1705374401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26JP9y1F4cMVTf91bkP52Z8nKjtVJapFjy43p2aiDF0=;
        b=W9CR2WUnZowofMwS1ALea/XvXW6NWV6akYZfBtESDxgzoyUib0E4bgvDpLUCaCAy3r
         zePon4BijKl4d/3s61Tg/QlRrNE5Y31oumScjOCCspRTnp9g06wdjvvsfjqgwSwVNhr5
         AUd9zueO4FpVTrlXhU9Kkp5HDgIJ3BaUDRUjaT/vOrvd9PeR0aa7kAziFYhRloEz2FWn
         ykN3Vtc6ewPZTHyJ+q36xWX6nk3DBqSoLHJKGhHJ6AC74NjrMwyzc0gOX5hy0tI1Lt9P
         olCwuiZhpyeiOLufNpAH4Gq+gDPFPNhSktT8WRN9rM1KrEJTSiLF1/FfDIxUh5DRh15X
         EeiA==
X-Gm-Message-State: AOJu0YxPf7XffR0VV7eMLnY/mxbb4eBntcMI+gL5EaS4n6McFffmq6R0
	eGul4lUtSLNSrGjwqnfRlItgH9cSdTW/Z44XufuKjBgGaNf2GYpe+H+0OXm14aE=
X-Google-Smtp-Source: AGHT+IHS+E1oSB20aZLFgtENwyGxUcHbyRkiNyRCDWyRdZW5jlDKLhXMRV8NPOJypNxa26Fdje8wLmkpx1h0Bk/d6CA=
X-Received: by 2002:a0d:d7d1:0:b0:5ee:1ca0:b7ef with SMTP id
 z200-20020a0dd7d1000000b005ee1ca0b7efmr2614627ywd.42.1704769601306; Mon, 08
 Jan 2024 19:06:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
In-Reply-To: <20240109-phy-qmp-merge-common-v1-0-572899a14318@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Jan 2024 05:06:30 +0200
Message-ID: <CAA8EJppOtG2xBY+t0G_WrXDZs8DfN1dEdWjnqGOtzRYJ2ysezw@mail.gmail.com>
Subject: Re: [PATCH 0/8] phy: qcom: merge common register defines in QMP drivers
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jan 2024 at 05:04, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> After the split of the gigantic QMP PHY driver, individual drivers
> contained common regster bits definitions. Move them to the global
> header. While we are at it, also remove register definitions from the
> phy-qcom-sgmi-eth driver, which is yet another QMP driver with its own
> embedde register defines.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (8):
>       phy: qcom: qmp-usb-legacy: drop single-lane support
>       phy: qcom: qmp-usb-legacy: drop qmp_usb_legacy_iomap
>       phy: qcom: qmp: move common functions to common header
>       phy: qcom: qmp: split DP PHY registers to separate headers
>       phy: qcom: qmp: move common bits definitions to common header
>       fixup! phy: qcom: qmp: move common functions to common header

I haven't noticed the non-squashed fixup. I'll squash it for v2.

>       phy: qcom: sgmii-eth: use existing register definitions
>       phy: qcom: sgmii-eth: move PCS registers to separate header
>
>  drivers/phy/qualcomm/phy-qcom-edp.c              |   3 +-
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c        | 127 ++-----
>  drivers/phy/qualcomm/phy-qcom-qmp-common.h       |  59 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h    |  18 +
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v3.h    |  21 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v4.h    |  19 +
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v5.h    |  13 +
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v6.h    |  13 +
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h       |  62 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c |  70 +---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c         |  90 +----
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h    |  20 +
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c          |  72 +---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c   |  76 +---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c          | 101 +-----
>  drivers/phy/qualcomm/phy-qcom-qmp.h              | 111 ++----
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c        | 441 ++++++++++-------------
>  17 files changed, 516 insertions(+), 800 deletions(-)
> ---
> base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
> change-id: 20240108-phy-qmp-merge-common-d681dd1d1995
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>


-- 
With best wishes
Dmitry

