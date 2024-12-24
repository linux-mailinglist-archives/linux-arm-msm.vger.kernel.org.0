Return-Path: <linux-arm-msm+bounces-43281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD5E9FC255
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 21:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23061884234
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 20:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7202135D0;
	Tue, 24 Dec 2024 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WEPPV00P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015942135B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 20:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735072881; cv=none; b=C5Bz05JKUWskE6XqHtyUlTAUIcMdQ9kcUIVjpF2G7Vqak1sTK1qoVxx4TKw9vqMnLSYEZl3ZNv7Y7g7B8Z4VGaNmprkAwbG5epPmwZPXzqnaqsFe057A1m0D6S5Fyw8aC4i6LjZiOjoacU6a6+/37WGEs4gwOsok1xxRGEcnnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735072881; c=relaxed/simple;
	bh=FXFoDG45Qbkr6TGlb//7Kie5Nhe06TuhQAgCH3DU8YY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dUiMpRciVpCW7jRbu+DSXsc7+oyUEyeT4ppIdpwkJSjGZ/2Lzx4co88yo2j06spfg0jUs7scva+ukmRWIv/wGpXS0ev2dHM24hP80mFR7/p/POozDV/FZVDvp1a3iEhweYk+jRtLHqfAJW7XcUh0Kzq+8ivQRNYmxqX65enzF1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WEPPV00P; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30227c56b11so59120031fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735072878; x=1735677678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVL1dmPSr1vk7EWC2qU43PTuiWRQrYk/i8+6+hYoAwc=;
        b=WEPPV00P8Ze/q86ALLCt9EE1TYHzQPNF9lJZHS4FZAO0uYpTR7ZIwa5Ic8FTOKn909
         MZjqXS2Qnzg+2upaEDbtbz4+2O1UcytjivEuYmoDJKDrfhcSAYxaYvFOXf2Ya8bpAxZn
         cx7WxvX1lfzAEp1AxHm+q3qWDxwm+f1VFG5z+xBRddZGaFRMMD7f/2VHbRtylM0FgEPb
         lMuVMu7UMVzEfeQRUCjiJRqcpA+3YRJQ7PPJMGw0/pJ3mwnOq1Ti9KTVD3JZj4ayC77J
         NqhtNehXsvC89Ja1mADC4cSAPaZUWa6cdca3V/0tshUjopy3+bE7dvJOiMC9WDPbzVxe
         X7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735072878; x=1735677678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVL1dmPSr1vk7EWC2qU43PTuiWRQrYk/i8+6+hYoAwc=;
        b=HOOFerDR4r5gSsfb43+Bm3SQqBZMHZh2tNgfnmR1GMmkx7dfrmACr5xD206haEuZl6
         i2173n25eXezqxIEhl+7XYtkohsuSB0JMg/1JWzClb3f+sRGoLq4dB0M2IpVgust/Yc0
         EiBfBApguM/PCEWhuaJ6MjtwjqJreUVdwS7uWYuBhebVqLrwI9tvi3yCUUJ1pM+bPZQS
         hJBKp74nupkQD90SVQ/iB3KCJBs0ZCVxquBpMo+bFlDmN1ZqKNPR0HKG8JhhgzFUDiB7
         iB+2xIXhO7z3d0TKKmciViisQ26JNGRBHXD0nVVP/Fq0pOYON1U7EXtM2g8fv3UTv8+Q
         8C0w==
X-Forwarded-Encrypted: i=1; AJvYcCVWmEqOuLokI29sEOxG70qsADR6qrPjb8hIXqnz7tJpT9M/tI6L9SpN/I9e1hqnauwtV2roj7RVMyYJ3XYh@vger.kernel.org
X-Gm-Message-State: AOJu0YwFDpRMrNEarSYxZ9/yEPexrncmCX+aHZiUbT5kwQZG0QVQ6xuQ
	WZjBW+9MM2QmiCpfG8i94kcvzcuWLYwTSDpq7o8MS641sidk5Zcg7Reat2RjqgU=
X-Gm-Gg: ASbGncsVJ/tQymwq+TEKEyxCG8/Ypy5dfYZfNZHqsQf6ldycJsHS75sK2wl8MvaTtlx
	FQlw1iMNGmg5/sj0kMglFebOa6lI9n5qjX1xMCriovqDxN8KlE7GijyZ+/KuZ3SSI/R231H/teQ
	3YRL47Zwdy7LPGVSLZXWs6BFsepfWDBr/3THhEwH5tJHNnzPXynuuG9WU6cKGy12nHfcB3PUss4
	Lml1oqzzWYecsa6Sfn15MOPpKymPc/7o0zmhmqQTfbAEfmHGjt/liEELXJcXT7N2TkaS2Bc
X-Google-Smtp-Source: AGHT+IFRqkuN0v8Twfp+3aoJNzJcDiCl9dFl3FddoHLtEBoe+bPkHlNyv3Kkk7el3kN2e8ga03/35g==
X-Received: by 2002:a05:651c:4cb:b0:300:1448:c526 with SMTP id 38308e7fff4ca-3046861f16emr47329571fa.37.1735072878081;
        Tue, 24 Dec 2024 12:41:18 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:41:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	quic_abhinavk@quicinc.com,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_ebharadw@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback Support for DPU 10.x+
Date: Tue, 24 Dec 2024 22:41:03 +0200
Message-Id: <173507275848.561903.10083157563956874611.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 16 Dec 2024 16:43:11 -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> [...]

Applied, thanks!

[05/25] drm/msm/dpu: get rid of struct dpu_rm_requirements
        https://gitlab.freedesktop.org/lumag/msm/-/commit/835d10620445
[09/25] drm/msm/dpu: Add CWB entry to catalog for SM8650
        https://gitlab.freedesktop.org/lumag/msm/-/commit/989412edae5b
[10/25] drm/msm/dpu: Specify dedicated CWB pingpong blocks
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d1fe88dd53ae
[11/25] drm/msm/dpu: add devcoredumps for cwb registers
        https://gitlab.freedesktop.org/lumag/msm/-/commit/675c1edfa92d
[12/25] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aae8736426c6
[13/25] drm/msm/dpu: add CWB support to dpu_hw_wb
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a31a610fd44b
[14/25] drm/msm/dpu: Add RM support for allocating CWB
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a5463629299b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

