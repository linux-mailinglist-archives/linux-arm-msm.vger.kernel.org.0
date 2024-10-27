Return-Path: <linux-arm-msm+bounces-36072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D78A39B1BDB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 03:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D5A1F21AB0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9436F4FA;
	Sun, 27 Oct 2024 02:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W5ojmkZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E11748A
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729994671; cv=none; b=Rwl4fYqn3RRUpnX7ciNSYeoHjqUIKK6H1XVSriU+jClWK8UP8eYK7KtiTY4rL6uLOTBlXJxJ8StjCv/8JeFze1w6SsZUihBVbxhEEIO6wl3r9id4Pqu2h2nJwWR+UnYuwRwNvDKFVG5GbdI4n/Ld3865e4T6vn1zSXhTIddHzA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729994671; c=relaxed/simple;
	bh=bQ5sls5naKiV8Vd4y8290tNvMJOAO7v3Xe9FdOuJp48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbAGR9r+lVOcJjOcTe0VIxW9O8vMhv6LCJoReOSh9oPNvNTpztKhRXMG660IpFaO7cnc64EGYbvU1OqFkjF7d9oyShQBOlDmHEv5+rR9DiIY/5ndHlprKeu4UCo5e6QeyYaSA5Fd6ydo18I5GiOY1MxCUgEXHwN6iJIpF9dJRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W5ojmkZy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539f7606199so3738426e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 19:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729994668; x=1730599468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGZSUHq/ZmNUpRTh2RnbZ3KXbycvJz8k34ztj3MvaYU=;
        b=W5ojmkZyF2wl3ZppSzC699ehmRtpq8+vosB5vSJhbnUQNAxp2605YbJlRxCOzgBWP6
         xvjegznK00CnMU5UfkRW5j8yQBsAlulJhPK/WsquZ1RIaIY9b6nhPBPlomT3sCxAbJ0I
         srxCkOeXAbXq4pErODAq3bImxTxDbFThzOVd46H8lri+JSx8kvlFh+8btHq+MHPcVq37
         oPbbcsBag9gdDG9a1+yPZtsb8pKL8ymJ/hf8mMtKrw+nrYzl9RH1zFitOct0a6RQhzNr
         3+QcNcHGNKfv46BthaZ01OmWv4DMfCEXYHPKYCN8a1CmtnrDjuGH81veHcSh1jan6lZQ
         XCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729994668; x=1730599468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGZSUHq/ZmNUpRTh2RnbZ3KXbycvJz8k34ztj3MvaYU=;
        b=IJMuOmSv6JI/ayb7IrAmD58pQboZ/FwO+0s7FaDfXfvQTqRB0UsyVnrYh8KHbSXke4
         uGpR/u2gp8kj/0v9io57HZ6mXFInIZXQJy8cpeQnL9clZgmVGJnCScOUiehg/qCrOC1y
         5JA0wTwBIyAcAa8YhzktQ91617jHVHOmQhvvKvsn4eYsBSg3NaP9b16WPDlBsGoGh55o
         Vv2ujGS8CeyynJ0SKb8QELU5ambG9Ooi5UNmORLF9/sphUp2ksIgHGClnGMBc486XBqI
         XnoVxoHOCEKiZU0NiQWr53MYdIpdJmBP1N95DZHHbL+1jsKL/IBCvIVzvt7pEdYlPUSU
         SK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCLKtcfM1cjKlzLB3uKRJDsX86rnGG070VFTdw+m47vs+8ksN1xjlFgrAIeBpjX/In21mLj5VemXBS9ELW@vger.kernel.org
X-Gm-Message-State: AOJu0YxSzXQRMFJaC2bQMhbc0+V3WpHx5WVH4pqXKRW1k1iWBvAf7NS7
	waSHbogwM5Tj5Y1KxBXk7RbTE2h1zjmx1R2fMv/MjtzLiiHnneXQPbMInXvamow=
X-Google-Smtp-Source: AGHT+IHPoUUcDRY5D2XJo8f0YTIXfcWPksVBaLDAXMrn0WjwoyAQfwqBD1jOM+o1BPYOuwrQECaMcQ==
X-Received: by 2002:a05:6512:3f03:b0:52f:ca2b:1d33 with SMTP id 2adb3069b0e04-53b348cb983mr1473251e87.20.1729994667621;
        Sat, 26 Oct 2024 19:04:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a915sm644940e87.12.2024.10.26.19.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 19:04:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
Date: Sun, 27 Oct 2024 04:04:26 +0200
Message-Id: <172999465408.389213.17351972800864480225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 14 Oct 2024 09:36:08 -0700, Douglas Anderson wrote:
> If the allocation in msm_disp_state_dump_regs() failed then
> `block->state` can be NULL. The msm_disp_state_print_regs() function
> _does_ have code to try to handle it with:
> 
>   if (*reg)
>     dump_addr = *reg;
> 
> [...]

Applied, thanks!

[3/3] drm/msm: Simplify NULL checking in msm_disp_state_dump_regs()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/74c374648ed0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

