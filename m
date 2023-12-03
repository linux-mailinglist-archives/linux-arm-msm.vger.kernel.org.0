Return-Path: <linux-arm-msm+bounces-3120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8878A8022DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079521F2109F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5490BA51;
	Sun,  3 Dec 2023 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JauP0zVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8495C134
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:42 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9f8faf57bso6278981fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602801; x=1702207601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbKwG3bsiy6N+N1DD1CLsj/Q/q+O1WSIDYwjhlWFEhk=;
        b=JauP0zVecpmeZ+z3RHcYpN1DjW9X4kafDK7mSEZVT1zhnTgQ2C1Ckq8OgAUJyKVpgd
         2zgCVkWnnBHURo535WjBhsVlhCgRzLWGyGg+IxtEt0NJDF2oEc3j4X1kBUgcBdzYlYA1
         tgU/f0A/rS8WHargiY2biCD4fPtP5LivyCGr0R9YvVcxIZo5RV0uCAuQZfY/lHaoxhLH
         CxFv7qfr9KYJ7bObd6nDAuAgQXr+aw7vQkKcZLnwO2w1gaRwAsOevKdImrf6wFR4x6CY
         HCffs+pEi1FEDGyzWAz7XA0/ajHjFB26lsBIVhpIKb+iZANt6YuMF6vd8GHTkPsH+avs
         YJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602801; x=1702207601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbKwG3bsiy6N+N1DD1CLsj/Q/q+O1WSIDYwjhlWFEhk=;
        b=f7GqhpDu8AKf8lTUmzOkJdMV0xOQ0RuuvnTvw0gvEa0GVphgZWA3b+p+77J+UvDgga
         pAJGakdqNr6uHHtE08EtBVdQ5y9TBxPWKwYjMWfLXDK3aUkosJ+BiSGT4eiaW13sIpDH
         8wmUoT3leJtp7KNVk2XOBPdxdIMeX1Vesi0w575hVowPa4zL4wJt+PUnD6PPQf2Q6TFg
         LaTn1oqGUHnqiKKBneREvSYkZrdc9b6ljE13+jH1N/UlDY3780lM+/p717WOf9s4E+HQ
         96oZMQwafYdvYgXax2ENnbzGKxCj6c7cfaFfmDn37rycrZlThzNfWxS8F2K5mmbE4m7X
         joDw==
X-Gm-Message-State: AOJu0YyIrOw9B+jz+HkGloZoU2KNZ2LDxQ98ayYIJ7AO2GLgA9lJfZt4
	rk/wFtSzLCM0ap6dh3dU56HMgw==
X-Google-Smtp-Source: AGHT+IHXObFn5iWeVaQxMjM8NCWQ1Rahby/WyhApUWMTJIT7Qf7SFVR14cwLp/UcG7bQecH6ZqyZlg==
X-Received: by 2002:a19:8c48:0:b0:50b:d764:9691 with SMTP id i8-20020a198c48000000b0050bd7649691mr1631354lfj.117.1701602800856;
        Sun, 03 Dec 2023 03:26:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sm8250-mdss: add DisplayPort controller node
Date: Sun,  3 Dec 2023 14:26:25 +0300
Message-Id: <170160265545.1305159.1208126196892932328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107103600.27424-1-krzysztof.kozlowski@linaro.org>
References: <20231107103600.27424-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 Nov 2023 11:36:00 +0100, Krzysztof Kozlowski wrote:
> Document the DisplayPort controller node in MDSS binding, already used
> in DTS:
> 
>   sm8250-xiaomi-elish-boe.dtb: display-subsystem@ae00000: Unevaluated properties are not allowed ('displayport-controller@ae90000' was unexpected)
> 
> 

Applied, thanks!

[1/1] dt-bindings: display/msm: qcom,sm8250-mdss: add DisplayPort controller node
      https://gitlab.freedesktop.org/lumag/msm/-/commit/52e36770b174

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

