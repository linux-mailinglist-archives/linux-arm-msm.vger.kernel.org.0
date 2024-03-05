Return-Path: <linux-arm-msm+bounces-13307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EA28711AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 01:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7F0B1F215C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 00:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48926EDE;
	Tue,  5 Mar 2024 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvyPTQ5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9273238F
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Mar 2024 00:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709598494; cv=none; b=oETpUUzSastYk1q29DNOyzJwNagLzTOXZBQSkvxe+S9YKDfV8VfQllLgZ73akXVBbQX2UzLYGJLFk3AcCRru3+mpsd/pZcNTVVfdqMbop+9jq8eXDlgaLFXmcJrdNBB0rNziQgLGcVQEoIIST2DDecDq+XTzvqI5T5uiLdQXsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709598494; c=relaxed/simple;
	bh=4AjwDlHx3YycEF4tI7pNTUo4oAM3+zIFAtp1wah21RI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yil5OPhtwmWs+CULuAqHZaQOTfcE18SBOS0o37C/peqVb0jQ0gTX5XdwdsPYBFuV8yKEBJGBhgsWLrB2X1dyXt7VxB1hGXpyLo/LTl4A8764lSAp6iylykE8Pyql3gVs1PN1qXhhJiXo+Q8QK18gzHJghnq7BAE7gftq7DOljuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lvyPTQ5Z; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso4329282e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 16:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709598491; x=1710203291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UgihA/j9MMe4W3y4lHJTNEdOriPRYiwOGRsjM+J9mKU=;
        b=lvyPTQ5ZbZXaGZvDLqAFKF0spichesYx7frXozgQSKM88zU+21JFcLVq0zxJhnBlKO
         d4bCn/kOhn7bKCL/oUm975hzFBf9V3JcxG56HUVl+7vnUUCPtua2aYy7K6g0+Z/x1vst
         MPPhPclxXnHqxvUkMtHKaz5qZKFxbz3vxeCbGqpLII0E6Zdd7+0/3Nq06XSrMMmPypW5
         yBrzmRPIS9ZlC0aEvkIrmuBo3o3uzL7TeqiyRSQT8CfUOYjgm+spU2NDH/JPTg6MHk/X
         xN6ulElgzibyMjNn0kkTSI6FvNLdy8W7CF+w6HnSvm2FxIN4w+m1Hpz07a9p7ysmcIQO
         L92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709598491; x=1710203291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UgihA/j9MMe4W3y4lHJTNEdOriPRYiwOGRsjM+J9mKU=;
        b=BUV1v/3BIFRksItlTxI13Rsv7p8jlaZuRYwa1poOQ8mE8iQ2twIHII/FdB9USlwWss
         hJgQeYeNedRqv/jstLQWks5WZnXKhI9wfTwVRHNJS443UJXj6uOQwMM9WXOuOG8xdH6H
         gj0f2K+eCHZ5wzUqIThGFl7zK9TmvFEifZoZJuzW4ONe9k1ah1soyFt6J8USzdZlSt1K
         zCYePCBs5DXQrY4jeKRppbDyBi5RzaY1KyhWgs8XmS8/Q49yId5Mfr3xP7IkgH0zuuga
         OCKbbduW6pq598gbtvHd+Bfm77jxg2TH6kab4yAcUJMzM+6l0lVUINbJz1+2vmPix9qF
         gbEg==
X-Forwarded-Encrypted: i=1; AJvYcCWGC9owFFsP2IZSaVcF+t546gx1Zv+97yiyXXS3fabSTvz1UQmRnBw38rFTfj10cN7WQytkVLN/mfDLjlOXqHkiUtzpr0T+X9p8GiSxVQ==
X-Gm-Message-State: AOJu0YxFuTW+/3i81quCGATbJtNAWunH5vpReQOX+sGBrG6pXM6XHr24
	v8u33VM+N/lGWepQVtWWdDDiAtKHQLhxWlXx+Pqjpfi2Q1fNl87q7xu+8IqAoSYtrnstQ/Es812
	9
X-Google-Smtp-Source: AGHT+IFDZK6sfIEdXRUKSjRI7ZdugsypJRMtPgYmqMfgXbm1nTdG+dB8phMOK0N67CVLvFXHeQOFIw==
X-Received: by 2002:a05:6512:282c:b0:513:2c50:9644 with SMTP id cf44-20020a056512282c00b005132c509644mr257056lfb.12.1709598490724;
        Mon, 04 Mar 2024 16:28:10 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s15-20020ac2464f000000b005133d11b261sm1149416lfo.92.2024.03.04.16.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 16:28:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Steev Klimaszewski <steev@kali.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm/dpu: debug commit_done timeouts
Date: Tue,  5 Mar 2024 02:28:08 +0200
Message-Id: <170959846405.1203069.5519628464509979288.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
References: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 26 Feb 2024 04:27:58 +0200, Dmitry Baryshkov wrote:
> In order to debug commit_done timeouts ([1]) display the sticky bits of
> the CTL_FLUSH register and capture the devcore dump when the first such
> timeout occurs.
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/issues/33
> 
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: make "vblank timeout" more useful
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f1d0b196ff2e
[2/3] drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d72a3d35b7ef
[3/3] drm/msm/dpu: capture snapshot on the first commit_done timeout
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4be445f5b6b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

