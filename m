Return-Path: <linux-arm-msm+bounces-41132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E429E9D50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 123DC28323C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE9A1B0420;
	Mon,  9 Dec 2024 17:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SDMc/zLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F304E154BFC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766330; cv=none; b=Q8Ghc29ksWuV3iFBwP5LofVrYGot6zNR7k3vbLd4PH40vVZdTyQLwkA9ieIYMp1bPPMIGv8bfJBNVwt0k7F/Jwc8jSGaTUfU4gO5z0QhYyPzfZenzGUPVN+Em4UG+3FlkBt4ig5/jgrqONT7U2wR64cwUyOL1JbSgc+BWAGj2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766330; c=relaxed/simple;
	bh=bAYs8FkdlQE5eqssU46SL6Z8HP476md0o5S9+WxIxJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jwOL48XplHP9dziMHsUEkcbEgq4AGdcMPeNVtZDs8i/9TuL/EpxbQMDfecPP0jS39pFFGepEV1UHBJgfSEc/JLx5BW/2ppDtOyWytkKQQNne6WbdUCHP7OsIHT4TLp8m0uG2L1srJdtCGpdgMf2wfzEWrCR/V4sPm77ytSJvIHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SDMc/zLa; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-725ed193c9eso1101479b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766327; x=1734371127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEHuQ+kXoeUymHTN8eFGc9cWNeb9aYeLC76//Gda7iY=;
        b=SDMc/zLavq1qQZ8iEHyXR2eWNO9DNVQUoVF8QGsrCdxYS+Ir00ElAQySwQHtfj3DIv
         Grzt9anBLDgEa+C3uf2svO9pl4gHDPK18NDoqljklWvtRovTLr4ACAUkvc+PfwOQUB+A
         dq6H07+vLRsORVLxy+cqDSlAah5c6WyT1T6vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766327; x=1734371127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEHuQ+kXoeUymHTN8eFGc9cWNeb9aYeLC76//Gda7iY=;
        b=vZ04J6VD1Hpq7HF9PGZLTb9Ill5tqhz7/FjOz1KPdxpLpAb8dieXXAENlv/vXr/mwC
         smTwgVXr5QhZdu6b7Cu89pLZIE9CwoceZf1R4x7M+JYhqRcWI1e3k0WOoWsu2Ropi+x9
         dmjLiWEvlHsk2VXwKWGaMEgy41yd9btezaXfQ19txkYp7XmFr/Ae02GigzVVZeTOD02C
         4qCu2fPbRqySKQOqQPDvNMzet/lvX4MSopLLQfvmS6SSov0lwD2VJ7fLPhX+KEdAHQN/
         aF6IsJtDogtRuy/umyd89gBqh7nBsnlFPUdg0HdZDLedgn527tZ0Z+qIEK0tm0vsu+/g
         vEMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKTH7B4sefqsSkgZDtPZDwMFFN6hJTdm1E+kCEDPp/G9RckjU6CmKWX7NRdnYKsv/XT7I0UPfwQDyn5FIM@vger.kernel.org
X-Gm-Message-State: AOJu0YyOB0VThEtujjSHGLGBXBCfMvJzK6VdQe0Qaq6bQaERpIO8/Wt3
	CV7ZDRiZk+seSNIsPiwkvXtQYtFt9uxaB9pOsj7FQNMIhJD+VH2pNYPIGuPoRA==
X-Gm-Gg: ASbGncu20VqXsxddfFaE0h6a/N9EFt+Cjn7CCGkS5BHTN3zjh0ZcZGd8saxAvTSBdxs
	IMx5trctW51S4LPzLmxnfomN7WBflVcCfSrxDwinLjg2LYL95r1OxPMJ90ORIcKvAovhFmKTHQU
	15MrVU8t/7/9EDOEJ2DSGyPsS1s/t5b1D7Yr74o4w0m0YnTLABNvgNMT4n/Y//DcANyseGgJP5L
	AQWNKhzFZfxyen1epFOgo3gou8B8PYEyuOMrJ3ze93LpewghRf6viw8I6D9XES2SIOxYLLsAQ==
X-Google-Smtp-Source: AGHT+IFjr+LTfoeQGGEOWgSsIBHfiAjG9a3g370Vtf8TA8xvJXw9gKEbo9AZcL4ypGc2Hiq/SZ2LKg==
X-Received: by 2002:a05:6a21:9999:b0:1e1:a48f:1215 with SMTP id adf61e73a8af0-1e1b1b519b3mr2234419637.35.1733766327345;
        Mon, 09 Dec 2024 09:45:27 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:26 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
Date: Mon,  9 Dec 2024 09:43:11 -0800
Message-ID: <20241209094310.1.Ie4ef54abe02e7eb0eee50f830575719bf23bda48@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241209174430.2904353-1-dianders@chromium.org>
References: <20241209174430.2904353-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm Kryo 400-series Gold cores appear to have a derivative of an
ARM Cortex A76 in them. Since A76 needs Spectre mitigation then the
Kyro 400-series Gold cores also should need Spectre mitigation.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The "k" value here really should come from analysis by Qualcomm, but
until we can get that analysis let's choose the same value as A76: 24.

Ideally someone from Qualcomm can confirm that this mitigation is
needed and confirm / provide the proper "k" value.

 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..e149efadff20 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.47.0.338.g60cca15819-goog


