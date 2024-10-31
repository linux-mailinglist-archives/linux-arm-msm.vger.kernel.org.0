Return-Path: <linux-arm-msm+bounces-36635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3749B86EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 00:17:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC7ED1C20B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 23:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7971DFD81;
	Thu, 31 Oct 2024 23:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cI8nZhkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0B91CC8B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 23:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730416674; cv=none; b=MkuSl0PeL4GjUinorJbUro/dyrJNOwSSY32jRmfzPNfo8/YRgoUkYAPT3pX2Y55baz+1nc8hkDrb57pmQXEVAtfy5IwzmUUjN9NVKkRzqWHDyFvoDcAo6r98M2VqyHh1c6b7ZWBdngzqz+YjmoELcfk9zwWl8gj7HqkSw/5ght0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730416674; c=relaxed/simple;
	bh=iIpPnqL50A/jarcK5/fv4DxrO6sb+ob1MtvXevZUq04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qm7cXq8wC+pB4iEBB8M1V9H9DZZkBZKbAx+jcfMlT338PYT4R6Um/JLs8ic1sWxTdCZYRnF554wZjIZeJ6VPlcQasV3/JFCkYJAuTVRip9JXZ0g+SZVb0N/M5+2reF0ofXUZ3XDiu/UNanb7a3bUKK4EVP5fFrbA6v8+oYHyXMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cI8nZhkJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso15579111fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730416667; x=1731021467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frsp46Okfb5QiVmFNAXVWYtRI09WjPuac7vIqiSQUO4=;
        b=cI8nZhkJXSD23lR0RpW4XXpm3jDRZAZVp/+CehJI68wKvUzJuAdC9h/4F2gEz5+R55
         ANtzqDEYbNA+6e/0fjeKvgUI+AGdJc4++pN+9BrkJ7vcHC3BGvGC6jXRXXKZ+3s9BRMS
         KDvO7MzCctklT6NG2kR6ZwYH/l+9utQ6uwmcztG0uyykz/5QUR976jI5xxzPV58BwmPn
         AktBpSZ7E+F1ZH2BhPtzsN2xDwi7jhEuWGcBk1aiT1McaR1X3VxdWkto5yijd5CBMKgT
         ecBEKY9QAGV9NFYCobpv9DRxi7sX6nKlKf0td7buuKcYpL0Z/hR6jsqZrTWMFoxdVyiR
         9B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730416667; x=1731021467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frsp46Okfb5QiVmFNAXVWYtRI09WjPuac7vIqiSQUO4=;
        b=cNcfQVj+0p9/4MIcm5jHorOb1/lXSyNS/WeTiKnkJJvNj0z87N0+ucYs3gTfJmo3jv
         P4CeqAtZXci94C2KQlHtrWNw5sXZKhwHdyDjcJgS1BGApN8qbAIU0S8jBXcNVJvWE7CA
         C+zndNnVeV+JzxJi6vcHa05OFE/kWZH3d5jpQW6p5y6CQuR3c0ZmMSy0deaAVl5ndQBF
         jJeVK5yeMjrnLj9VzZ2Mn/xEV70rE1v8Ab82UW8NE32cuwfStywHqNgBkqHg1e9RVOFZ
         qZUF26x46BVEtRl6Dxj/HkPdm8KVHMYxyU7vCOGSVoxuKPQSUwefX2tm2CtwaCp69s2K
         fBtA==
X-Gm-Message-State: AOJu0YxkN5lAXRdJWEzSlm03XOssfoFTeAxB3YAqbLEIJImXtav6cOWv
	SqcjpbeYq8/uUi+kddQOauQekVNxdpk+sgO2paE7ODeYiqru+2FtCRZF1Lqv3tE=
X-Google-Smtp-Source: AGHT+IErIn+8tk3gc2319GvFqnOquZWc1mPt8zpg0mrwwWOluM01t+jVj4/jowjH3KFQAqp0pQvtuw==
X-Received: by 2002:a2e:5109:0:b0:2fb:4428:e0fa with SMTP id 38308e7fff4ca-2fcbe04f435mr79462881fa.36.1730416666587;
        Thu, 31 Oct 2024 16:17:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef617ad0sm3536041fa.67.2024.10.31.16.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 16:17:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm: minor msm_drv.h cleanup
Date: Fri,  1 Nov 2024 01:17:41 +0200
Message-Id: <173041664077.3797608.17754324846652823290.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
References: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 31 Oct 2024 23:44:05 +0200, Dmitry Baryshkov wrote:
> As I stumbled upon msm_display_topology define, perform minor cleanup of
> msm_drv.h incldue file.
> 
> 

Applied, thanks!

[1/3] drm/msm: move msm_display_topology to the DPU driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f8706bff68cb
[2/3] drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      https://gitlab.freedesktop.org/lumag/msm/-/commit/858b64e21217
[3/3] drm/msm: drop MAX_BRIDGES define
      https://gitlab.freedesktop.org/lumag/msm/-/commit/26d841fd1c15

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

