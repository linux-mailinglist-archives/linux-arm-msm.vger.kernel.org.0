Return-Path: <linux-arm-msm+bounces-4625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6841A8122A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 00:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F0421C21419
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 23:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D856B8183A;
	Wed, 13 Dec 2023 23:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CY12NKHi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94DBDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 15:11:14 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cc3647bf06so16095231fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702509073; x=1703113873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/j1Onoc3138zJnsU8yDEiGjQqVsbV45Cqho1Gb5ccE=;
        b=CY12NKHirTZd/peeQpXugxANJZ+D4q5OPHO3Cxkol5PMRsmpRFLaNV9NU5GTg2LLwv
         JaorTwRE4USK+qjeibdMJ1Z3a4oBynyhR+MC7oTy980u95PKFIUVjHpmpMcNsG9CPNpo
         TVqatkRTIdgO0gjem54LbvODpg+bL+bROVRKNLbdjgUNOmkxjlNY07DOKsnEd8NvmB9N
         jr1BvH/f8aJdGhF5b9tF80UswG0G4RxB8WQni5rJhCQc4Llng9UMm1xjNHmhBheWC7Fk
         ia1mwl7t/tlmksqK9ReTd77Hr0Rd/i1ZXd0zmqWIuLNJk0zq4ZHV1x+KXzK8NvvlKHyg
         Hmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702509073; x=1703113873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/j1Onoc3138zJnsU8yDEiGjQqVsbV45Cqho1Gb5ccE=;
        b=KSK8ogxYw9itbNqyswONbNrpGkV1Yup7Ha0CcOdpZdU1XWCWXYsDibu17oaKq/+Qd3
         2PlLZHqxTKhGp7i9YnVpCspermeCY4wWkOs7htakaKq9+7Ub01ohJqfCYxTh7O2C2Q+9
         izIEo/fU/EJobwRTsRAIm3HGDEbdc/WxaW63/Bb2pRA/N/b1kg77iOHVmK9lupzf03R6
         a3GZIBu7udw5vHNmluohabu5Tu7coxv1CuefxRBQQIns8sYs8WutzpU+GoLO0oo6Mf7V
         t2yRcn5yeA+akRSgsqPBi67jO04jIxHq4hIG5MRzFjeylAiLAL10NjI4k+avA0Epp9ki
         qN0A==
X-Gm-Message-State: AOJu0YxEQmRTP0GodQlWzkcRGT05nMpa/UVRnJrCE0NLZDIXxPiyvoF+
	t97fS3TPKNyCCqkBrzKcARlqZA==
X-Google-Smtp-Source: AGHT+IEhLGLbpNE5ofHBlyMYQRBnTcLYD16vUtw/hL1PzWKS86x81znzu3niMguSuXMWF+hvlixwCg==
X-Received: by 2002:ac2:592f:0:b0:50b:c2ed:e28a with SMTP id v15-20020ac2592f000000b0050bc2ede28amr2806480lfi.13.1702509073150;
        Wed, 13 Dec 2023 15:11:13 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u17-20020ac248b1000000b0050c031e2873sm1735908lfg.288.2023.12.13.15.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 15:11:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] drm/msm/dpu: INTF CRC configuration cleanups and fix
Date: Thu, 14 Dec 2023 01:11:11 +0200
Message-Id: <170250905097.800728.11004644949884575762.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 13 Dec 2023 13:30:16 -0800, Jessica Zhang wrote:
> This series drops the frame_count and enable parameters (as they're always
> set to the same value). It also sets input_sel=0x1 for INTF.
> 

Applied, thanks!

[1/2] drm/msm/dpu: Set input_sel bit for INTF
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1b932e07c321
[2/2] drm/msm/dpu: Drop enable and frame_count parameters from dpu_hw_setup_misr()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e5c08a41bcf3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

