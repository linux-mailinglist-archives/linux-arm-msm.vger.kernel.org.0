Return-Path: <linux-arm-msm+bounces-3126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 325B78022EE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1BF6280EB6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5CBDDCD;
	Sun,  3 Dec 2023 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfMwrGeZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C3FB6
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:47 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50be24167efso1569866e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602806; x=1702207606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QBSxCXVzh9rXO4c/SO8NkEBuWtu15Ry8njynJOrfsY=;
        b=yfMwrGeZGwqMbpf9++hxuUmOnqXfa2Q4hmOCGkJAUZH+dGocf0UuSaXRgsbn9yaLSl
         amPtjnA/Z/c3wPcEIDTjF4lVtveIOJiA/SxjZuRpvlnKbvEhk0NSNghe4XL3NMOJvble
         kAXI7pJbrlaL4mzSB7Pt7dRDKIEmxl3gADnqplJc6X+4/Lny+e59tpt2FnkhhNqkhl4g
         Ql1izrneDpIDOV4PUIfdGAF+MYgdl/kAmt98+JHwo9Pv2WjKnMBnN+x3mK44OpmqBNKS
         9jUJvELozU6xjm4gx4hoSHRKZNvxWmkd5CQkzcY3UROFNuKVXVUrtfCDkejHoAAskHXn
         f45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602806; x=1702207606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QBSxCXVzh9rXO4c/SO8NkEBuWtu15Ry8njynJOrfsY=;
        b=FV0crU8bU8/tmSPUa4eyiPpgxrdisylnMM2Oqrp4hGOBj7vpGoe08+V6tvGEF5lNg7
         Q5Jqq1q+FDgP/72A/hfU2iuIo8cK7klHtx6+FKMSACvB9WCbf9V9vp5KR3d66+gJwP5Z
         rmmUOnyj0NLSnAangZiqSnwYY6Cu8tAVSmCk3o+gjmy1dmOv0Y2S0sGbt/wzvg4MqKLS
         /M7tAvJxOXyH+dlv6/Uekw+8v/j2BcNIKyzt0SRyDyairvXSphsn/e61qx884jTVDP0T
         eeDwFt8a6E240g+R6M/3InT2m5dOpMJokFx11UQ+dDTZYIwnzmWFrIp2nLqWltJiQSrN
         spgg==
X-Gm-Message-State: AOJu0YyCNLseQgOrHpnLCT1PI/ByIu+Gd3WH6vx5JNFKUnBLrwPD5f7D
	DBvyKRilMWA8xg8sup1qr+9MmQ==
X-Google-Smtp-Source: AGHT+IE7GxPDS+PrjdIRKoKcXEI0G00AkJ5kcwKcMEX1WNFa5xkbSILxwpIRZxmX3UUZ53Rok4brKg==
X-Received: by 2002:a05:6512:4019:b0:50b:debe:d35d with SMTP id br25-20020a056512401900b0050bdebed35dmr756886lfb.133.1701602806015;
        Sun, 03 Dec 2023 03:26:46 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Steev Klimaszewski <steev@kali.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Danylo Piliaiev <dpiliaiev@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Correct UBWC settings for sc8280xp
Date: Sun,  3 Dec 2023 14:26:31 +0300
Message-Id: <170160265539.1305159.17862781249540372821.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130192119.32538-1-robdclark@gmail.com>
References: <20231130192119.32538-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 11:21:18 -0800, Rob Clark wrote:
> The UBWC settings need to match between the display and GPU.  When we
> updated the GPU settings, we forgot to make the corresponding update on
> the display side.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Correct UBWC settings for sc8280xp
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0b414c731432

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

