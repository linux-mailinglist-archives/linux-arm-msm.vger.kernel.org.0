Return-Path: <linux-arm-msm+bounces-8398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E47083D62F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 10:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70ECEB24F9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 09:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1979C18EA8;
	Fri, 26 Jan 2024 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3DfRwi4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBB1BA53
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706259190; cv=none; b=Hkk0TVAqJd06OcpgpGBZqalN1O2RWoJysC91pRSUDKJ+A56ZzkfBM9R4g/IIvjEx7BzyQZ+Mky0WKszU9c723zqj0pMKft8q025gX4WQr7jAJJSAPXMuKpb7de/7HRuCfZQdrcZk9lVIv7qFyTK6wGxH2E5IW4wftOI2XPB42xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706259190; c=relaxed/simple;
	bh=2DUpsvYaNp6kOFWtVFpN1jPbtV9C2CZLk7v8Yy5LVpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvutnFrwX947Yqwt5swS6SZ29mEFHm+wk5VsSUBiHZu7xnZeYOt6Mhgekhn75Lh3rPQIj0LMD8/N0wMS5h0AoGoMTAVyzMojbMFf9nTMgThKm3S0sl/heKOMO3bTMYjnmzHiheLweNJNW9tp07KKuKYWKwv8jHQEdOHCZ228vLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3DfRwi4; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-602cf7dfeb1so1305897b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 00:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706259187; x=1706863987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uBG7JpOBgb/l7SFLPK3edINhuCMiTrRBotlDi9jgRxI=;
        b=I3DfRwi4ggkucmiYd2BZd495TW4nnRsSlfqX4v1eL/UWbPcshniiUzMJs0z9u5ZmLq
         53fiSIUaZRxxiOeKkBew1EqpSec2NDjis/W8qA+CYRSltJvEEVl+JODyFELcbj68hbZN
         VbfrhcKL0U/A0tqgvJNUY0D75VhJ8BN2+zwx/hKlXydSERNLF2XdfxpauG/vJRQQH2oy
         a2gkpm35SdciSGUG8M+PhJ/YB1d+y2ewverFESvvPH2Tfcqi4zcfR5cTOF8f3SNVQD5j
         byJGVBWGWPAkrCcnUxfNDs0yjt+MEFdnvfJtmMGSc2N5UueIga2usBAtpM8wP94VII4c
         w7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706259187; x=1706863987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBG7JpOBgb/l7SFLPK3edINhuCMiTrRBotlDi9jgRxI=;
        b=Y6pwWi3S5yWTOhkxFxkGVVV0kDERl72o5LcEBLHHwSJrSqT9xZjjPmnmMl/Cyv7/mD
         1GCNtRAoaz0Zm7fB1kbFox7m3MAR/eG0O7oIXK+pawDqlxqHDfxpXd/KS/glxShMqNbn
         W5jQ+setMTLcwUVsGrQ8yq7WIpZ/owOh6ZNG4oFtmSjQSj1C9x9rfLfzxinWzgB/ddYw
         Y/mVdtd5Pnoj94AMnM6gPpft0CrNr6ywZArV37DCMWZ2GJLecj27lnho7dMCIUzHHu+S
         +al76hZ49rtnrmyd6NJG3SuHJy1yZv+gaoXyJ3BurOtgmVrBFx5osyBNhM7wCUk6Oc6+
         yp3g==
X-Gm-Message-State: AOJu0YwvSMWrXdptytaD914PC1NGFPHMOfBfZB8Qa3bm0yRuOj/Trp+P
	tCTO8CeOpD8IBstF9Yk6ps89Yt+8NGPM4JbYxOgDrc//fOpK+cfnYfV4VY/MklQigPhYk2pkprC
	xyJ6HAzc0q1Rv+CKNAfw5dexz+WbslSz+zXUFMQ==
X-Google-Smtp-Source: AGHT+IGtJMR2wWXvWmk7JYRIuQnD7tvw0DN59oPKaclKbP6MX1a37Czd6V+zglEmXe7/2wP7eiF60wx5LotcVxO9+A8=
X-Received: by 2002:a81:7e41:0:b0:602:9dd4:d717 with SMTP id
 p1-20020a817e41000000b006029dd4d717mr869310ywn.49.1706259186796; Fri, 26 Jan
 2024 00:53:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126-phy-qmp-merge-common-v2-0-a463d0b57836@linaro.org> <20240126-phy-qmp-merge-common-v2-8-a463d0b57836@linaro.org>
In-Reply-To: <20240126-phy-qmp-merge-common-v2-8-a463d0b57836@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 10:52:56 +0200
Message-ID: <CAA8EJpo9aPZbujxJfn=TTGHzXS-DUtMOkf2OfZkAPGc4G=z41Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] phy: qcom: sgmii-eth: move PCS registers to
 separate header
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Jan 2024 at 01:23, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Follow the example of the rest of the QMP PHY drivers and move SGMII PCS
> registers to a separate header file.
>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-sgmii.h | 20 +++++++++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 64 +++++++++++----------------
>  2 files changed, 47 insertions(+), 37 deletions(-)
>

Carrying this from v1:

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride



-- 
With best wishes
Dmitry

