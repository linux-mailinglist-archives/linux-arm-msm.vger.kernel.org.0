Return-Path: <linux-arm-msm+bounces-49617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEC9A474C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:41:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D8857A5C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4477921CC4D;
	Thu, 27 Feb 2025 04:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bk1eQrND"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429111F5820
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740631064; cv=none; b=SWOaUuyq2SwJtw9TSmZZEAjajD+1ukvLWNmlF+hB6blMMZN/ErD6J+HETfhTxuQA3np7AXUplgFG8BT9dB7bQmdavm1X5Te64/8qIkgXEMy22NtDXjRS+xA+vlguHNMJZoPro0VZ0rJY6WIzVK6IeH82Mmd3nAibhgCUT62P1Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740631064; c=relaxed/simple;
	bh=mzPhRSU1K0z6zdHezeX9nAkdqjhhiEvRvVnPJfmgA5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aE4nEAgVz2pvjlBAiq/BRGxiXoejOJ03wYKRxAfAxXWnsl6IH0F3ItahMEpOELeoEO1T54VvFQjmBdpuUfiRDq5sPXweaP/THFmP5DnEDewQqLAP+oRl5ohCBLKKJ3fNt9OBiZ4RIBL706ygUP5YxBLGYWuKKNYwgX8EF2FvlwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bk1eQrND; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54605bfcc72so1943308e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740631059; x=1741235859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYSgKUYrO2YlmDkolp8bEhCgpgQOBl0qveOjHBhwpts=;
        b=Bk1eQrND8qWbGuY4bBriEYXWm8dr2Wlkd5k2MqegmeEpvKXmFZLw8CSaMDyub2i4pc
         gnLIZXdir+YzxldiX3km2iaqOIbkae/AosvO1h3MTv5wTnWR0GJ0L9CCJNqQUrYi6/26
         owpZMooJDRqRlj6IiAZLZP0+rYFQeOeAdevu+95jUS+cASFCrCWk7mFMZ/S6klEwvzHJ
         DPuXyEXHaUz2QhT5yEtUHRKxaxkO2XRWAFU3mssNSFHCpiCk2mHCQq1wv8b4P3WsYvsv
         UIg177qxygZY7txGw4uv1CSwBzCct+0oIGSuJUYspVve2JuQFR3qP34K9blDQCFLo8rv
         LBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740631059; x=1741235859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kYSgKUYrO2YlmDkolp8bEhCgpgQOBl0qveOjHBhwpts=;
        b=NjrtHds0JH0WZJLvPGIpCB52c36Lmvz63yLQg390q9FJRk7Zt5x3u8KLrsXW73y+66
         cXlj6zNPbHgNY0Bgs/JQRyZ4Yp3J3grTbwweVgOVgjTsh63hltX4MpBJYWtnX0Qo4/v/
         +Fdq74M1MhmVGIgpU8qyUFjvikbw4LXoKgHAEMFiNy6uwy95+X2Mk4tpOBG+Q3N5mgwJ
         zCP4mLHHXOKRg3g4C7TfclOT65IWV3CjOAsdVXH/uPz+ucXZkWn8bnLHZVc+2b4oEW5S
         TUfXMrYZ6rwx3OuTQnLBeN0XgRkuojA6e2Kvk5UVNs9Oz3k8RmYWaqqufh/cF4opJ0C1
         bS+w==
X-Forwarded-Encrypted: i=1; AJvYcCWytjlyEm+CN85SkrISx3VvIC28iDGvax0lX6+23kwRGIE5oWbkzSUa8ex3wKogtCV5p4sJuSHl5vSYB5jQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IGK1IwrSYXvqtDla7A4cIlozzBVVFCIjmQQbhvfN7A9/1zDO
	sA5MjTHOhq0YUJZslCHyGcSmuorrSGjLD/c8IRAqQ1PO0PFnBNIDGwWwEcXzNGQ=
X-Gm-Gg: ASbGncul87ZX/OyFGTGfHEzVl1QBhG3qGTnmdpjzQqk1Wzaz+vEjBDDUd+MHYFgPPeW
	SOysM7ig3wInMGfEJ0PezFjNKI3WGPUFWQgYOW5/4JBECGXGtQpiaa5tI+ZtbP92nrddHcsK/Wo
	xD0fa7G5cJZ45cI4hUkdL/eZ6zjl3iku0wdOFTsnHrxx6sA1jOYaqnQDhwpmHdAn6vYbzviCkHu
	dVJNK7a6ciqWLxjCkeTyRnIGEpDz+j2DxqnMIDsghqb+j0umi93Htau8ED6ERY1yPiPW4MHbt7r
	Z+QP5U3WCZWur9X2b4aDKB59h6YZ0V0l/Smw30M/4Q==
X-Google-Smtp-Source: AGHT+IFJTbOhodvzE89VyWlm98mXeqCjUzL4IWC2ENgI8KAMI2IbCSRQGTMlBENkiboZNnQ5ghsFCA==
X-Received: by 2002:a05:6512:3b9b:b0:546:1ca7:81a1 with SMTP id 2adb3069b0e04-549432ccb18mr616846e87.3.1740631058787;
        Wed, 26 Feb 2025 20:37:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:37:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	jonathan@marek.ca,
	fekz115@gmail.com,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 0/4] Add and enable the panel
Date: Thu, 27 Feb 2025 06:37:22 +0200
Message-Id: <174063096229.3733075.14794380891862567011.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250217222431.82522-1-danila@jiaxyga.com>
References: <20250217222431.82522-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 18 Feb 2025 01:24:27 +0300, Danila Tikhonov wrote:
> This patch series adds support for the Visionox RM692E5 panel, which is
> used on the Nothing Phone (1) and then adds it to the DTS.
> 
> Before integrating the panel into the DTS, we update the DSI code to
> allow bits-per-component (bpc) values of 10 and 12, since the Visionox
> RM692E5 panel operates at 10 bpc.
> 
> [...]

Applied, thanks!

[3/4] drm/msm/dsi: Allow values of 10 and 12 for bits per component
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0e71c2637d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

