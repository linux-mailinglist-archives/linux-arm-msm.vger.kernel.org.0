Return-Path: <linux-arm-msm+bounces-23738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF51913887
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068331F2240D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 07:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5173BBF6;
	Sun, 23 Jun 2024 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJyVZN+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C5C6EB55
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126856; cv=none; b=OEkc5CBXxv+JkZ/d2rga+CZjcvoffst1q8tr09D2DCiTFzpeWzmQx/j5LG+jrur9kgqDyBSSxSaUq95tMI2zRd8608E69YYFTfjzAHHRC8ZHvKgbufHwrb+NYHWyJbr0yKrQ/JYtZQcmCGpdJVW4IIbZUBOjVvNTaTbuui8rB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126856; c=relaxed/simple;
	bh=ScNvpn6q8Btg9GUETewQRHhi5kSZsX/tFN9YxCs/Erc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVqzjCyAqMcsAJCpPT230ViMsyJoNixVuD2CFr3nH9e1hq+CU0rJg8TG896jcYaw38QezpkC8kbX8pqKRCAhD71AIV04Mt+HpsDYVJ0XaZE9LIkzsr7wXQQ/KTDfI0kV+pM8mmbUx8F1j5O1FMlsL9S8U8ZxFcZLVluR8Rn3al8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJyVZN+J; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so34712181fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 00:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719126853; x=1719731653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdK+Z57kLe+iVSXD6oAbe65mu24X+W08m/s2wPEPRiY=;
        b=dJyVZN+JRGf20oXp08xdfG3HiA/RsT99nCo1SdogdEorSOvy/EWmhZ6TFHk36dnfwT
         1rHWr9ClbyrPLVfqPWwPqY2AGhRTk8AkwaguVhv2dghzpr+Oenz8fSXu4PEHJ1chAHAH
         RHtz4d39bMs+IcShMhWimOo/ckVdFq7Nh1DExB9h2wrOGPDS/MZk6bVvBK+rEwQb7Dz/
         u8em779APPyXbclF3ZBMDw5yTdMZyMqjdOKFafpNhDb2TdzVhv+hI12w393RNCH9eMie
         hWo5qwlTUaPg+0QbsWVHrMcbEPlO51IhmeeGSQ8qjUcdQ9xeLJ/lPrdgEsjFufxnyGZX
         S9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719126853; x=1719731653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdK+Z57kLe+iVSXD6oAbe65mu24X+W08m/s2wPEPRiY=;
        b=KVxL2vfj7qH6LOmZNJSBoN0BleKOhjqlN4aYkJASh61GB7WNM0c0rSp5eGEUNvg7nh
         X8NXuZ+GgKwW5D2Qp1fOpjkHSwhWa0+6BAu2r3q8umRyWOSh2+vla1tADtLf/gmwBroY
         k4GB8BL0I5XusyGMLBv5niCj9rjNiJP3oeHZSUg62qcb+MEcqOzoXQ/xehd1/jg7UBgi
         x5XqgfgUM155OflKbrflGqZoPHDHTVXatb+ITyjzzy4G4frQrME6KHVa3PFy3Qat3rg8
         a0YqDevuXcahwfp/HVb6qNOrgQyuCdwsjGS7oJ2ermnEPmN+OBeUUuRjyYV9CeKyml3A
         /gqg==
X-Gm-Message-State: AOJu0Yzxp4qPJqxMRi3/tFKj2CeSCoJgs84vffWPYQ32QOW/n3BL8mrx
	hHfBfjHP4qc6X9QE+0w6PhI4LbRWtBY+g5YjQd2p/hktJAJMJN3LObtxhqLcoQ4=
X-Google-Smtp-Source: AGHT+IEKqxbvtWfQPSdbxyZOKoTKzOfta9UYAGWkjh4gPijepxo+y2Odys4DRzztDMFEyCfQKNkPDQ==
X-Received: by 2002:a05:651c:152:b0:2ec:5603:41a with SMTP id 38308e7fff4ca-2ec5b36b266mr7424131fa.2.1719126852954;
        Sun, 23 Jun 2024 00:14:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 00:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quic_rmccann@quicinc.com,
	konrad.dybcio@linaro.org,
	neil.armstrong@linaro.org,
	jonathan@marek.ca,
	swboyd@chromium.org,
	quic_khsieh@quicinc.com,
	quic_jesszhan@quicinc.com,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add MDSS and DPU support for QCOM SM7150 SoC
Date: Sun, 23 Jun 2024 10:14:04 +0300
Message-Id: <171912674297.840248.14141240302342567945.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614215855.82093-1-danila@jiaxyga.com>
References: <20240614215855.82093-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 15 Jun 2024 00:58:51 +0300, Danila Tikhonov wrote:
> This series adds MDSS and DPU support for SM7150.
> 
> Changes in v3:
> - Swap DPU and MDSS patches (Krzysztof)
> - Add an explanation of the abbreviation DPU in patch 1 (Krzysztof)
> - Switch qseed3_1_4 on qseed3_2_4 in patch 2 (Dmitry)
> - Drop LM_4 and LM_5 in patch 2 (Dmitry)
> - Add Krzysztof's R-b tag to patch 1 and patch 3
> - Add Dmitry's R-b tag to patch 4
> - Link to v2:
> https://lore.kernel.org/all/20240612184336.11794-1-danila@jiaxyga.com/
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display/msm: Add SM7150 DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/64e2f4cb27e7
[2/4] drm/msm/dpu: Add SM7150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/75079df919ef
[3/4] dt-bindings: display/msm: Add SM7150 MDSS
      https://gitlab.freedesktop.org/lumag/msm/-/commit/726eded12dd7
[4/4] drm/msm: mdss: Add SM7150 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0f4786881281

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

