Return-Path: <linux-arm-msm+bounces-23744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF1391389E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 09:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EE971C20CF1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 07:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C91F12E1D1;
	Sun, 23 Jun 2024 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmXKlxnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D503A7E574
	for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719126861; cv=none; b=n0JfQo8Pg2jf6+PM5nbRI2lDEiPGjbNRCLIK/ax8qykQF9B+0p/pid7+VZ8WDJTbl90DlrfzdmZ9MXaB3DBpqtJWesgqrI30xmqgTWYFnaIIlqH90xJED4xdNoiNAghQ/sNJvMC7SnfzkhKdsGGnDByvgsKa+b4Ps9zY0a0C14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719126861; c=relaxed/simple;
	bh=r1GyaNDuH0dnQOBTRqLdjX/f+vi1DRab71LLw2YZwc4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9CfRxm15XQAgIdmogEDrTfaWOXSKKkvcvuOKEg7GuJD7ZaLokZBzOj4/eCeLzCrmoqN9ZqY0fqeZcKY8TfaFGuvolwvYu7tncSjGu5TyIU+D9uWwTy/boYlr3tqK2L20Pg5UpMkU2ihPPhbn4eho3BJ+tW1fEjhYmzRox7KQ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmXKlxnI; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so38782081fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jun 2024 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719126858; x=1719731658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ao5ztXjHb4LHR9szDgOZeLEhmApDaFHqwxcIBuJSShc=;
        b=mmXKlxnIWBqpSTQ9wlBnkt+DjE8ztMPduPRSwjl/WAoZB+6m7sfUIJd3IyT3Iv470X
         b1VR6UiD19AkCru7JYmiynquRk8N7VB8ezsynFexkYu1l2jZGm0xblVIKAcF1imx6eDR
         B7Z2KJB8FsApgrOaHqKO0Zwa051S7xN9JwO8ZRKlK/+BYvZ/CpALOSp2gwzj0h5ziZOW
         MTDJbeUuJwevasfaUctoy0fhrG3NGkl0sXyzKVcYO4ljviMhxz6YPh5fqaiFYawLthcg
         2NNBZ1r0PihDP66FkGqj6iOfslMlriPCewl2PPApHlNDhhKMgr+6UfIj6BH3ONDxv7oS
         4UWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719126858; x=1719731658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ao5ztXjHb4LHR9szDgOZeLEhmApDaFHqwxcIBuJSShc=;
        b=tRUIyvP8W2Jnt3o4AJ2MZDkIkTKvpMF6b7XvovveaCAxm/qhbHtKl+Q+2565b+3QLe
         UfIRfCYj/uDvRu+ugR64/xdJsAyEyz+ya9pqRAQcKaWyd/6GAMT4JhbNNoputppU3U7I
         LfRzn4VAmUUXJo3EU6T1LbZemXqFcBwX4Vui41BE+N1jQL5s1g+ArRdfx6HlzWaQLngQ
         aO1zdOxEvZhNleC13YykhgOAC6VvsthqEf7U35YBkwPwKt3/ybBDIKU+3t1ZD5ZH7hjt
         2Uz/o0T3CHdlBsZ39lhKhEoHNPil3wppRfsgrciDAGUqPKI1nI8qiIiRLSocQOO8z34q
         0+4Q==
X-Gm-Message-State: AOJu0YwoPd7gF3IKoIbLiO78+6nwdnABHfEevT3zXZeqBgP+/8a5Tly2
	g7L0ph/hFTeWOZWZEGyZNmkqp22juVmxsNnfgviGVy8g8VKA40d5xBY+1tuWf70=
X-Google-Smtp-Source: AGHT+IGMrZ7Ab2hTrpfNCjoKkdN8iqLOosYDf5URywhJ9jd+sUequOrm6k6sz1yM2oRGbSPu4UNvIQ==
X-Received: by 2002:a2e:9dd8:0:b0:2ec:4aac:8fd4 with SMTP id 38308e7fff4ca-2ec5930fde5mr14912791fa.1.1719126858199;
        Sun, 23 Jun 2024 00:14:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: guard ctl irq callback register/unregister
Date: Sun, 23 Jun 2024 10:14:11 +0300
Message-Id: <171912674292.840248.16492908228445159189.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
References: <20240509-ctl_irq-v1-1-9433f2da9dc7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 09 May 2024 19:52:04 +0200, Barnabás Czémán wrote:
> CTLs on older qualcomm SOCs like msm8953 and msm8996 has not got interrupts,
> so better to skip CTL irq callback register/unregister
> make dpu_ctl_cfg be able to define without intr_start.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: guard ctl irq callback register/unregister
      https://gitlab.freedesktop.org/lumag/msm/-/commit/29cd76c6f897

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

