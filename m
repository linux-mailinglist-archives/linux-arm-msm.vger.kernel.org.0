Return-Path: <linux-arm-msm+bounces-3124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CB8022ED
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 388F4B20A27
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27A2D518;
	Sun,  3 Dec 2023 11:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uvUYY7TD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF1B9B
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:46 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bbb4de875so4775793e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602805; x=1702207605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUAZdkQfSAqXRz9x79MrIU9qVt7c+xHhhtTJPbP5odQ=;
        b=uvUYY7TDPXhmgN205QW6Bi3NbAoExDfFOzaLpxiVD81KA2OB3rFN8WMXWeqyTEWboI
         d27BXQEu1X+7kjnhkqlkyXoUNFtavZpjk/Yr2yleE6DRNHHvEyl0NUZcqw5PQsmiR9ce
         iLhVdy623F74rczIYLvfOPp3rZ2fcpB2+ycKmVjhB+TcQojDb+VboeSKZUVeYG3XRm8D
         QpCRk0yhSus8zZEGLFutE+Pa6oEYD8DOUQgUoWBcPIgS6NvDZSZY8wz+QkCEEY5N0iu4
         m2pyc6qn4nZgR0QFkrhnop8LwRvMUE5opHIU9yP/Emz/eCfySMaZ5ghJ/5n3pxZoMok3
         IlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602805; x=1702207605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUAZdkQfSAqXRz9x79MrIU9qVt7c+xHhhtTJPbP5odQ=;
        b=iMSB4Vt0iQKw15/c8W/0ucoRGWWo47k+FNxsdLtKEzkyX/d58WoDYICE1FpZSeFyKG
         HxPUIf6huDoK8LcUJOJ7u88RRaTe+02RwVPBuxW1bHXQFIvkF06mb7k0cmp8RrhzWE7u
         ewozqzmvYvdb5E5ieBDOmMwLvc3GqDTkGb3EwdX5vSgDi/WyLDS8fYDKHI65+UMVM8MG
         P5kxqqPJfbDdQNtGz3h50QCvT2sXSe+Gfvx1OmdxGE3cQho8TtQZAoecrH63xKCSXhPJ
         SHb/1OS+KaOzNOHhQbroPTnk3GoHO33xj/tvQjpUCVdjvOqrWQaBxsg4QHcenz0WumHZ
         p13w==
X-Gm-Message-State: AOJu0YzEVFAerkmDQXNOdS9gEmHJ6SljSBNB6NmmlIMypuyx+XOMbyha
	MHx5Up1Hm0FmZAZzslRGGjaCKw==
X-Google-Smtp-Source: AGHT+IHpk/z4/x3A1ROGUbkKTKcCtG2yf3p8Kv9XcKn7Zchlb9ULC0uBiXCrO5CVwkjyr6QNXtGPDw==
X-Received: by 2002:a05:6512:2352:b0:50a:778b:590 with SMTP id p18-20020a056512235200b0050a778b0590mr2401244lfu.68.1701602805313;
        Sun, 03 Dec 2023 03:26:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Paloma Arellano <quic_parellan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	seanpaul@chromium.org,
	swboyd@chromium.org,
	quic_abhinavk@quicinc.com,
	quic_jesszhan@quicinc.com,
	marijn.suijten@somainline.org,
	neil.armstrong@linaro.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
Date: Sun,  3 Dec 2023 14:26:30 +0300
Message-Id: <170160265539.1305159.16684138495833882761.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231130224740.24383-1-quic_parellan@quicinc.com>
References: <20231130224740.24383-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Nov 2023 14:47:37 -0800, Paloma Arellano wrote:
> Trigger a devcoredump to dump dpu registers and capture the drm atomic
> state when the frame_done_timer timeouts.
> 
> v2: Optimize the format in which frame_done_timeout_cnt is incremented
> v3: Describe parameter frame_done_timeout_cnt in dpu_encoder_virt
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Capture dpu snapshot when frame_done_timer timeouts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9cad81143ef0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

