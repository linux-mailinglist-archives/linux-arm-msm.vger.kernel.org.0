Return-Path: <linux-arm-msm+bounces-3122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFF38022E5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7AB1C208E9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812A4CA49;
	Sun,  3 Dec 2023 11:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wY6DJRqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39235B6
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:26:44 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso194492e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701602802; x=1702207602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WSOjrDN/6/FPqqfnjx8kzs7rgpm6bARfoNrfKT8u5o=;
        b=wY6DJRqd7I9nU/n0JJVBF07JVrKVCfdeWjtfUxL0fUI7aJfdYuNcO0trvhvUtsKG1I
         bSoKMoRpffuSabhkSrx7Zz5JMTV/oQh1Xt3Ubh6f4vinX9vLgruq7nu3J2CW7M71iS1h
         mzoP/ZELBlkO7KY4Z/4rMViZH8d2gZmnpPKZR041SzKKrwbVFLykbJu6GN9lWqZpPtoz
         Ewe+xWTIHWVB4VCHl5AiSZCA4lmwG2j2P18oo96B2fkLYBZbgky+NLUAMbjanHyAJHMc
         CixagGyMSeJGAV8CJZnktnkxeF1U/7cHezcGud+z0Eh3UWJuvkUdai1e6ll7RTXco/Ko
         T3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701602802; x=1702207602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WSOjrDN/6/FPqqfnjx8kzs7rgpm6bARfoNrfKT8u5o=;
        b=hW27vIV9x2DLXDiwTFHqN9NSeltAjhcjjPvwBhB/0bAtywa8Yt2d5bK2bXTYnUTcu0
         rlHNoQNYsk1ZEAQ34YiZp/eruwcSDtcsD7aiyKNnzUw9JU+V0z0FXVP3Dht3i6q8ynAm
         A8XqndyqQ8uA+iYjJe2NKBHUHDRM6sP/GEd5q4ktvjfZSS4h7MRGtyGnUbCgUYuSLDYq
         2xK87AKNbX65iG8xRnD+rFlhgXluYjtcr4kMPJEdcPLEeqM7B7vqkXNZ9ZBhtvyKPKpE
         CrTkdl06c13o8MIS+4tbFepwsQgh4tu1ylCK0efo8zkrUIA/PAI8Yy7lkE9nlPhwWBss
         8ZBg==
X-Gm-Message-State: AOJu0YxLQ64ynBlPlLS9cSbpYlpOG6PJkVWjCkQUh+uCNxddzS14weQ1
	2RWZTTowGKVSindqYLykNW/xsw==
X-Google-Smtp-Source: AGHT+IHynZOlSfJkcuHWfgzZaQed2kczEHlHE2eWDEQkdE5lbgHNM141ZJ4rYNfMifeay+hwSL6g0w==
X-Received: by 2002:a05:6512:4894:b0:50b:e88a:1092 with SMTP id eq20-20020a056512489400b0050be88a1092mr290454lfb.174.1701602802514;
        Sun, 03 Dec 2023 03:26:42 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:26:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Archit Taneja <architt@codeaurora.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org,
	quic_jesszhan@quicinc.com,
	quic_parellan@quicinc.com,
	nespera@igalia.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits
Date: Sun,  3 Dec 2023 14:26:27 +0300
Message-Id: <170160265549.1305159.13000009091015495983.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
References: <20230911221627.9569-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Sep 2023 15:16:26 -0700, Abhinav Kumar wrote:
> Currently, dpu_plane_atomic_check() does not check whether the
> plane can process the image without exceeding the per chipset
> limits for MDP clock. This leads to underflow issues because the
> SSPP is not able to complete the processing for the data rate of
> the display.
> 
> Fail the dpu_plane_atomic_check() if the SSPP cannot process the
> image without exceeding the MDP clock limits.
> 
> [...]

Applied, thanks!

[2/2] drm/msm/dpu: try multirect based on mdp clock limits
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e6c0de5f4450

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

