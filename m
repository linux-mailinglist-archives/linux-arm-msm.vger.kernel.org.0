Return-Path: <linux-arm-msm+bounces-14399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E987EB2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 15:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AEB81C2132D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CB54E1D3;
	Mon, 18 Mar 2024 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GLIqyO0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C84E1BA
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710772808; cv=none; b=oZGw4/BkMsjiNxqMHRAJr7K91Ls91TkgDc7+TxDdnCgcSkBAJceR2uc1sC/JS31zsBP615Vcs+YuDbfDhBizoryMojKRDsVjb6w2/SarrSoW/HOt64upZwYMoWxUZuseXo3jFZpSn/2U/yAf63VK814oOJrrRwJ+WoIrd6KFzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710772808; c=relaxed/simple;
	bh=IlAC/UAQd5MXYjl273/a718EIOUzFR+4LkQzxMq+JaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPX03LNz0LAE+tMks9ncNP+QDqMHXG4Mpq/mXKJrVYfo73PeZxlSSPLHKKoKdJsREf+4GprenrWrAqgpn7IjD4vbfaM1+wLraqceuoRfgXKg+TqOxuChdIWK1Vim3jBH+yXnkK3kQH5FHDpS0/bOczqygsX5A9flP5rZny4WSjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GLIqyO0N; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so4163899276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710772804; x=1711377604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMlNnEWOpYXUGBNsiFKWdAeOcGOvC9+fZTDj9HH/epI=;
        b=GLIqyO0NvbL6PtO9o/EISigaWGlmuZL/GrUApo/Dx7ucAbvJe+w+REXvhJXsxRSPQs
         fPsrG7uRLH8+IX+ZfOKzlfFLlZx4So4e9j5nEWAc2ResSzjzwunIBEquRsPHIiG2Au/E
         4jV0ZfNpT785PnMtjuyLDshMr9dMymP5sbqeePy2rRcqCDGzew63xaDk9CAgbdb/Kczg
         BgIoNO+DqNv6ow7HCc7t2vqHqfHsbTZRb85SQMoTf4IxiRpOwtUF9TMWLrD3+KxdX4AE
         brJXb/8xsmh6W7VxzOGR+eG3tneKsgHasgdOp0BefistIY+anu8TNQGHOZin5ZqffUyj
         WxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710772804; x=1711377604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMlNnEWOpYXUGBNsiFKWdAeOcGOvC9+fZTDj9HH/epI=;
        b=DHA3bTz5ujalPWRhptiAOJOf9g4KITC6358bRUeUkgV/9qfquR7Onx4Ke9DRi4Xy6p
         d89L27kuX1veRxRCHFREW+/jlYMr/Yl3hL3PCBQcopYrLb70KdDGav2cTFU1oqNWp/2F
         r+7dlNtPA2rG5tQfww/h7l9oG0bgExPd2lazwf3fGiqFkP5c+oq015+g276CTIvZ3ZAg
         0Vd5sUrgWICxcoBeYT12GVZnegeOy97SvY2WIPeuh0JxZhCY6+JmH9q9f5q5XOm4R9n9
         7EkeHB0aFf8L499ljxjn9DPPvVRGGU1+D1PL/i+/+wmB0Z32ucOMKDPCcS5p7lTQjtYV
         ZkIw==
X-Forwarded-Encrypted: i=1; AJvYcCV2v3U34prYIwBVYrnvya8pOkhrZFSzch7nNXjYdDpWVwwPg1Aof16KCBU92+Pa6ryIxe8DwpSXBxEM3fQC7m9hFvI/N17Z0oXyZymnSQ==
X-Gm-Message-State: AOJu0Yy4FsUnbXF/NEx33ZHUBzaMtrcm5Z9wsi6mDDO2Oc1r/4Iecyjn
	GiZKdJmo3LQbEYKCGDScQ8cWrU7x+6TTcU+wkS+sEM1j+g8IBSmJz207QJUX8kqzXY64lAEHWxZ
	VN/pLJdS2MQrKKYHuStiAPD0VYqylbfTCiJFpRw==
X-Google-Smtp-Source: AGHT+IEThwYsQiTWbzhJyLQT2bhri6zZ5h4WE+yPw/QIQxHFbJAdyafw0GpF8nLkJuL6ZdTQ3mAeQhmXFW/TggAVm3M=
X-Received: by 2002:a05:6902:100a:b0:dd9:20d6:fd2 with SMTP id
 w10-20020a056902100a00b00dd920d60fd2mr2336963ybt.27.1710772804148; Mon, 18
 Mar 2024 07:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315111046.22136-1-quic_jkona@quicinc.com>
In-Reply-To: <20240315111046.22136-1-quic_jkona@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Mar 2024 15:39:27 +0100
Message-ID: <CAPDyKFpOobCrmeeTaFhnwMMhoWGKC6qz9851VjVoDP2fBZEUzA@mail.gmail.com>
Subject: Re: [PATCH V5 0/5] PM: domains: Add control for switching back and
 forth to HW control
To: Jagadeesh Kona <quic_jkona@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

- trimmed cc list

On Fri, 15 Mar 2024 at 12:11, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> This series adds support for dev_pm_genpd_set_hwmode() and dev_pm_genpd_get_hwmode() APIs
> and support in gdsc provider drivers to register respective callbacks and venus consumer
> driver example using above API to switch the power domain(GDSC) to HW/SW modes dynamically
> at runtime.
>
> Changes in V5:
> - Updated 1st patch as per V4 review comments to synchronize the initial HW mode state by
>   invoking ->get_hwmode_dev()callback in genpd_add_device()
> - With above change, SW cached hwmode will contain correct value initially, and it will be
>   updated everytime mode is changed in set_hwmode, hence updated dev_pm_genpd_get_hwmode()
>   to just return SW cached hwmode in 1st patch
> - Updated commit text for 1st, 3rd, 4th and 5th patches
> - Updated 3rd and 5th patches as per review comments received on V4 series
> - Added R-By tags received in older series to 1st and 2nd patches
>
> Previous series:
> V4: https://lore.kernel.org/all/20240122-gdsc-hwctrl-v4-0-9061e8a7aa07@linaro.org/
> V3: https://lore.kernel.org/lkml/20230823114528.3677667-1-abel.vesa@linaro.org/
> V2: https://lore.kernel.org/lkml/20230816145741.1472721-1-abel.vesa@linaro.org/
> V1: https://lore.kernel.org/all/20230628105652.1670316-1-abel.vesa@linaro.org/
>
> Abel Vesa (1):
>   PM: domains: Add the domain HW-managed mode to the summary
>
> Jagadeesh Kona (3):
>   clk: qcom: gdsc: Add set and get hwmode callbacks to switch GDSC mode
>   clk: qcom: Use HW_CTRL_TRIGGER flag to switch video GDSC to HW mode
>   venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC mode on
>     V6
>
> Ulf Hansson (1):
>   PM: domains: Allow devices attached to genpd to be managed by HW
>
>  drivers/clk/qcom/gdsc.c                       | 37 +++++++++
>  drivers/clk/qcom/gdsc.h                       |  1 +
>  drivers/clk/qcom/videocc-sc7280.c             |  2 +-
>  drivers/clk/qcom/videocc-sm8250.c             |  4 +-
>  .../media/platform/qcom/venus/pm_helpers.c    | 39 ++++++----
>  drivers/pmdomain/core.c                       | 78 ++++++++++++++++++-
>  include/linux/pm_domain.h                     | 17 ++++
>  7 files changed, 157 insertions(+), 21 deletions(-)
>

This looks good to me! I can help to funnel the series through my
pmdomain tree, if that's the preferred route? Bjorn/Konrad, please let
me know.

Kind regards
Uffe

