Return-Path: <linux-arm-msm+bounces-42268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D04B9F241D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 14:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777F3165492
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Dec 2024 13:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B019C190485;
	Sun, 15 Dec 2024 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKFL2YzE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C2918FC8F
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734268253; cv=none; b=HKsj1tgVwmOeKk+3ntN0SYQzsz/N0eJ1tg+2ZbWyBHijtDLvofe9pejY2bynczAcyi6Q+flTCY7OCLuL6EZcun2Angu9LJ9Ne9AVs092GtcBlU6CLzKQnrbTmuN/YDz6xf14vpMsRa+xTtWPRJu1UhmjKrvKYUMaIkg5jG5miGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734268253; c=relaxed/simple;
	bh=X8hZt4x1ZyhrL7OcBkzerILtj+v8BNdS+X1YF0sAOd4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5EiSm/WLeGWd9nUCIQFS2hnVhb6AUlFYCWFozPn5bKiCWFuC6eDljWKuoD6xMD2OAlrK1H9R08i+FlDrBTslve2wTytF1LWdUcqsQ1KkknPUiYR+GdpTGZe2pivQ77aBGlbKfqhwzE9QEfQfR+3pvs1EWhn8wlG+heHSI5ciag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKFL2YzE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53df19bf6a9so4743835e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734268250; x=1734873050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awxvmFGu6W8HI08GuYqSLCup3VkCru3mT3zlTswkMMk=;
        b=sKFL2YzEjQ6gK7QZXX2WuyAzPXSBY5+n++ECZGBMTfL3olav3SfKmyMyHs/x7GrCt1
         kavfArXlIg0LB6qAQtkFOxZZ+8n3nSuqkYpBIVFTSBcdj8zb+t7Stcqt8K7ir0w8XAoa
         db6hFQJDgewKdKkDPG0QwdT0BdyATdDr9aHCamx9bkNgcsjWSgxC8dv06qnyGghzLdT6
         5mPcEwDa3cdOOAvXoiGMJphIXVrS5WMXK6wYXD5+otH7ZxAKzNMCd0AEIAw03EOT+DmC
         zNM3t1lYofvUOP26y+I6jlYvpBCGsGatPsju8bPws3BmAwy9CoZzXgmYHb2h3s7owJKq
         ny3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734268250; x=1734873050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awxvmFGu6W8HI08GuYqSLCup3VkCru3mT3zlTswkMMk=;
        b=bclP5nVckIwzjOXXRfDLz1cuLVbBYaVC486SlIyILQYPblvLxj9Q46hLeubXI/AOt2
         RS+GU0yK1WTI0DJwHXz7VQjOSQKAqECLqVRTL5gygAmxX9Wx0PHihuwGxLM4HtQq+RnM
         zCIyMHz/iWhtvX5YDytgTr0tSLN+SQr5EjXdJtx3R6BlpVGsGVswNRTYyPRl9UsO27P6
         YsKrjQfOdXTwjUbG3JaN8X3VczWjJnB9I7PFkvGXMU9beBNORfVppo0Qxu13N2EE/mvN
         xPtt8xBTwxATfXKrHN7CZkQVY09PbH7s9rciWwc0kaMAacMY/FHENvLjwLklQqbX0lO3
         ZFKA==
X-Gm-Message-State: AOJu0Yxtf9E/WiTSzdELTeTN9oc3hd7z9qup7aZGcMTuvPMnWbkMI3CY
	2WcCgxP/KDpadCgzyFEKGr43PQX48NGujvjRB5uunvysZVJ8Efe/PxWk8J4OIwg=
X-Gm-Gg: ASbGnctoB9sVwFixKu+Iq/tv1CC/WgVdOiBqex+58uY5o+mgF8mA1fi1wzGDK8Ifcnp
	DzoaJM8VLSUYovTKWaqsie0rZjuORe4KeE3/duEfV4ZjI/aiyYU+3SFvSK3af4ImtSPiU68KaYw
	8R6q3n27xcDdPvPIpgMQNdq4AYAq5/4i9VaCgEiis6r/JLL9GXmnKyh5u2i9/R5tKK4MbwDqPf7
	TEBGZ1XzehkNWR68R9gWUxdOlc9sGZib6KLMvqTgtmF/BRS9L0FQ92UNL/3KHEVCxREQVzQ
X-Google-Smtp-Source: AGHT+IGrNf/u7LsRewYNxdnxXQOGY+8iY4gXe3eVKZbdSNgIMmlapF4Yec2PrHTH1Kv3kmEvwc4VkQ==
X-Received: by 2002:a05:6512:3a87:b0:540:1d6c:f1bf with SMTP id 2adb3069b0e04-5408ef55f89mr2518182e87.11.1734268250087;
        Sun, 15 Dec 2024 05:10:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 05:10:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: filter out too wide modes if no 3dmux is present
Date: Sun, 15 Dec 2024 15:10:41 +0200
Message-Id: <173426667308.2196979.9157253558561897505.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
References: <20241209-no_3dmux-v3-1-48aaa555b0d3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 09 Dec 2024 13:18:36 -0800, Abhinav Kumar wrote:
> On chipsets such as QCS615, there is no 3dmux present. In such
> a case, a layer exceeding the max_mixer_width cannot be split,
> hence cannot be supported.
> 
> Filter out the modes which exceed the max_mixer_width when there
> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> to return failure for such modes.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: filter out too wide modes if no 3dmux is present
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dbc7bb1a93f4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

