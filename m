Return-Path: <linux-arm-msm+bounces-24115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3E916B44
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 488431C21F71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B260F16D4D7;
	Tue, 25 Jun 2024 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mk35ZSav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97616F0F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719327403; cv=none; b=iiobFZSjkueZA+Bia1G3JejcTRZOiYysOLrAPKfSsRB5X/99QE+qylLjMdDmKfOQsCMIeHPEj1Hh2wQ0S/GgrH0BE19zx5oODW/D7XxI9tvt+qEROqT3OnTjeA/opiVmUFHeCcJsJWuax4Oisp5BzD9lV3/OaK73GrnH7XywUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719327403; c=relaxed/simple;
	bh=q8fz7osfxZ55BV+LRx1mWZBp5hp970s8cLmWQ9AGdO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g98ETvI8Ke0E9Nc5XwpQ4vOYY+DNZ0flTaAe+wmz7cKXjpUC8Qpk25VRyBtl/iu7IWLop6BHnwEz2nB7UNinLQrctz4+afujDoMeIHhFF0+g8RxIHYGKzx5Fy7lLPQnnmnmCoYEG7jw5lKz8lhrWQ+sYHHinP3x2sB0anTlrZeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mk35ZSav; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5295e488248so6432771e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719327400; x=1719932200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJLpd9x26v7wF/fApEc7Qe5167IuLVph4X9sxGmlGGA=;
        b=Mk35ZSavSl6foWgfiSzDGjn1aTaZGTvHbVhDq2Hf+eisVOsKOsg734RKLdVZku2yx1
         2siqKM3Dm6+OYTFs6oFjEX5ivDFm5Fc+81IQlHrcX+oK1/D6MujXBCbiqWITHeMRJlvA
         c5BDkEaLF9GqaUSXEl+o0mJzquXJKyXgRFpVQAjJopAGgaN+4lqKoQ7ZLJO6FWIARo9p
         YI3pTtVakQTBr+D4IW6QcrR5NMp8l/8EBV6iyycTjABsC8L40sAkSGHb8BvK2uBdkCJJ
         Sa1N4QJy7DfhvAtNFdpIvr6H84VfjjH3MvwWpkrWndJ1hAm9pYOiRl4s+kNNRD6/1lgo
         vbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327400; x=1719932200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJLpd9x26v7wF/fApEc7Qe5167IuLVph4X9sxGmlGGA=;
        b=tzmyS8qQ7pRayh4GomQI9MsfsPUgC7XSSZHyugHjbjEsDeFa/mkCisNvFC2EebDxzu
         IrlD0SRiLkxzyCc3IdQBxMnbPqMu38C7pgPL85PyQ7QvQtqo2ciNbZzkfeCLkOOWm9+1
         5PGCdDTyd7rAiDDw7wHxZw8EYiXE6pYj+mtm7IiDUO9IESya1RKXmn01HbdC46JOKIs1
         qLNw0FnAtojWPjpaFpf9c1Tl8isTdlky5HCQX8GEPXDA8JVY9w4yTZrImm+4taXRQMak
         Bm5WCob+qmqOb5ZwGWkA/bhTpGMgVEQ84ZNjxkuWEGMEUtzl4lBOPg6YScjyn/6dCkq5
         KIHQ==
X-Gm-Message-State: AOJu0YzikGSwjNsFDf/rgumo/p/Ebp5svm9hz+mFfBkO9v7LBkNP7rU0
	mW09JJihu+sH9Jq42dJm3j6E05YisQftqdmp/UdglHtzK/XeRJ3mNxbnA/jt7ZI=
X-Google-Smtp-Source: AGHT+IHmVvpHX9CK7J8+9e6YEWwkWkypw8ccedGQLbNwsWmOitv3YpuJqwgIOFdVLVSEwdlgCNL28w==
X-Received: by 2002:ac2:58cb:0:b0:52c:8596:5976 with SMTP id 2adb3069b0e04-52ce185e9c2mr3983923e87.55.1719327400338;
        Tue, 25 Jun 2024 07:56:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:56:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: remove CRTC frame event callback registration
Date: Tue, 25 Jun 2024 17:56:37 +0300
Message-Id: <171932736810.1437673.14531545327158209638.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
References: <20240625-dpu-no-crtc-register-v3-1-1b161df13776@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 25 Jun 2024 01:38:25 +0300, Dmitry Baryshkov wrote:
> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
> to NULL) and the data is always either the CRTC itself or NULL
> (correpondingly). Thus drop the event callback registration, call the
> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
> assigned using dpu_encoder_assign_crtc().
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: remove CRTC frame event callback registration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5b90752f9619

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

