Return-Path: <linux-arm-msm+bounces-3115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 289228022C4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD87D1C208F8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A6AB678;
	Sun,  3 Dec 2023 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvN9+Yd8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A775B6
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:37 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso334620e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602796; x=1702207596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koAqGh0cj+nLPUz5qL1jbnlsGU4HEcI7UrtOHweSbBA=;
        b=CvN9+Yd8YPViUPlRA+hE9bK2mwiy4gtOrTZs6cAHG6rfZfCa+XKiamVCeN9KKAwU+x
         dI3DnYtXs1wiWV6k8bo9onr+kBh6k71pl1hxa8RzvgOtiRruP9BcrvZ+dGb64eeEHIGJ
         2NmELPY29cKjsvVRU1nJBnYgnjPu84XDjaBYkYYf91zr5C6clnXLAdVjGLLPW5+EBEs5
         VrOFDLhEU7/XVJVM3FU3k3ShzPb9nbgPraVyllNyHWwE6VKfp3XFOEE9cLpQu371EcPt
         sp7zQTMnjvy22uDf39+ontPXb9ehZTNC7yXZpfNbi1A7PyadtPQv/na/wvVB3rI7ogvq
         ebzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602796; x=1702207596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=koAqGh0cj+nLPUz5qL1jbnlsGU4HEcI7UrtOHweSbBA=;
        b=fkStc5dF71+RioxOJ8RtF+hg3awxwlS/RRkWkmLp9a5Io5O9YBrM/lY9eVra8ScSoR
         prZsXxiSZFQHEleIKcsCQdCCmLbUF0RBIjmJAV0SRdhpPb1YKzGClBw+WYpSVmFqyBFY
         r6GQfMBtk71Y9E8ZGk4JFg9hvWGWuwxhLy8NzANX8gYNn1oujNLBAIBMyTzXs32Z+G/X
         1ZfiFXou0vH7J9XJouCf42SO6ve1rRhtObaTImv9Cyv3jMRTqxo6SDz18ZYrlNSenHIc
         FJhx2HnGAj+XtxHiegUfJHyNAxLL20KmMBO0YK/iv8Mqjh1GBJZjpkf+3EBld0MSrKKd
         NjGw==
X-Gm-Message-State: AOJu0Yx+QqHP6JwdN9+JuFmn5u7HfUMNsV3+6OsTuCRACVCNXBaa3dY3
	ZPJPcwnxe55/Li/BIag1c+lcYQ==
X-Google-Smtp-Source: AGHT+IFz1UZg+IADQFOUUwTq97nEaOdVnYEhDmuOk4ptxlXnCGzHfkwjiJBilMQGd4g08msgpAUxKg==
X-Received: by 2002:a05:6512:15a5:b0:50b:f3fc:1261 with SMTP id bp37-20020a05651215a500b0050bf3fc1261mr235997lfb.1.1701602795987;
        Sun, 03 Dec 2023 03:26:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: enable SmartDMA on SM8450
Date: Sun,  3 Dec 2023 14:26:20 +0300
Message-Id: <170160265548.1305159.2635502754416345095.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009165627.2691015-1-dmitry.baryshkov@linaro.org>
References: <20231009165627.2691015-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Oct 2023 19:56:27 +0300, Dmitry Baryshkov wrote:
> Enable the SmartDMA / multirect support on the SM8450 platform to
> support higher resoltion modes.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: enable SmartDMA on SM8450
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a9bd555de5e9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

