Return-Path: <linux-arm-msm+bounces-36568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447C9B7E01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 16:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83271F21E42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9421BC07A;
	Thu, 31 Oct 2024 15:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zi6hKB+7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5261BC062
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 15:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387597; cv=none; b=tB40qmia0EsAMaun7J2jVAH4bRCCuIzYvIlRF2Ad73YbCkL06pPztH/U8ix6eBZR7i8hqtkXC1udWNhH+/6HRPsncZjg8bBTXMeDlQ3gLIpmGWMRHMNR8Z5tA+xwKlcaEuDy/l4OKqOnW7YsASiCL5178F6AxeghROEn6zuit6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387597; c=relaxed/simple;
	bh=qTo25L6lJakOHs7bQLmqHAn1KYMaDHnpIwjy2cJNPvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u68S9rya3j7qdEUsFJEonheEjzCrl+uOVbR4qkMfcD+ezs/UFqeBz1XTONs31Dl6xfn4re8AaVyhGaY8/YSPbmHKoYC7skRQcrfX3u9GiZ+RTA+DIdbBkFI1Jn1J9vn/LFaXNtOD2I6M2MQyugnaMDjIoNBSqRu4OMgZG6/oEwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zi6hKB+7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37f52925fc8so596092f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387593; x=1730992393; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCHAA65MmVVFpwvzylnSVqRrMzyJQ2PBeQVwuG34xXo=;
        b=zi6hKB+7s1MEFWGiw0USPqaR2wmy0Mn6r3JaXKscKFA3ytYbF9JBSOimKUqGrKAei0
         IAk2RI34l0TtIyufOZKPeLQtMQLoPPAU5gMr8TPr7brMVkyG28xm+iYhAo6Uvfydii/M
         ytb27m3LMsY3WfzuPtpxB7Ll1mxEzaAKlo9XbmEVZ8wQ0v0IHbokkqmObBK93TX4ASNc
         y6K1g5ZjGukpkv66tTzTIt1ZrifgmCBn1F5U2OVZtEMr2MK4Nip+bt1LyfAE0tg7sfUN
         TRq6bQsN7VBu5ZQt1A0L23XJPgo9ONwhSGm1Epky3coSwgNlyvLQRCogxiNp5xykp1sQ
         v+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387593; x=1730992393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCHAA65MmVVFpwvzylnSVqRrMzyJQ2PBeQVwuG34xXo=;
        b=N7qVMPC2bcQwdPrLAb6cJsPzFUdIDqwz6lox+UWM84/2fOKknsjaFHVLQrJ5o1B8dI
         OutRo4yIzowik1gdUf9AwWs13u0Cq+eWrs4o2CgYcOYSylSPu4sb25CUaGK5KfiwiDS6
         Kjj10F0Y6qyh7Mr7QwHbukwZPH2i5RtT5NpRw3yPwm77S26dHT3dlcyg087eRBU/Fh5V
         KToyPQ37vCWrq+EQqcove0b6Rg3PRyCwyzgw5rlEdeuC5W1UJnrWPz8leAgjC4/ohgDe
         h+DxcoTHY56LXl+sfxvjgPe1QhyhhECUD90wx8XU5qVurTQWKqSU5Cli0dIft1r31d+w
         r3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhS7k6/5EvVBqCEbZ6iG+HGoG3snKU9cEEGodunpFs/lDLEhMU4MSElULWlQhU0RmbgPMK43RLPfdjhzFD@vger.kernel.org
X-Gm-Message-State: AOJu0YyJR0EWuylM/cn4OH+80U2kuYSH3fF7cXyFKVnruQTHQ4xMt6z2
	zvBeBouj1+rG0YYBCyA3hi5GTWjC9YFaVCtlNUsiaCQ1F/WR+byEa3pln53lGUE=
X-Google-Smtp-Source: AGHT+IGLAhJViAJsWNEjJ1x0ZrUiOA5rP+aDAfisAGK0oMbFmg09U56thBBAHPC/VibMF55iqNG64w==
X-Received: by 2002:a05:6000:2c8:b0:37c:d1bc:2666 with SMTP id ffacd0b85a97d-381c7a472f7mr268493f8f.4.1730387593293;
        Thu, 31 Oct 2024 08:13:13 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:13:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 31 Oct 2024 17:12:46 +0200
Subject: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to control
 LTTPR transparent mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=qTo25L6lJakOHs7bQLmqHAn1KYMaDHnpIwjy2cJNPvM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI5559Yxkmuow38QV8wabJ2bKSot6NxTaSLYmN
 g2nH0RwB6yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOeeQAKCRAbX0TJAJUV
 VmDHD/481bhsfTSCoMir4f/4gp6iKjR2jI9+OveNVVHlg1D6Tz0vDg0quYA7KScPdxZ3d5uVuXw
 enHzdvlUtqxwUehaxfa9hA+1rZGtCLCHDeUYXk6jLzdYLUoa9Hs7M2qC4nuB9aSM4+9LrGwTnvN
 rhgbrUi4sFu/T7ilSm1kAYGc+YrU2kZSQ3YRrqL99tABGDJ1AnVCA2n3V/9D6YFBPn2xKXze/ab
 EAYGV4PMF9VTNEUO2hISo22WRF4cn1GydxAvOlkT23AATf0jrfkd3M9UkC/xMDuGAaJwBWamHPl
 sOhIuytjO+xJXPqyvnOtjg/jTs8EJozYqt2jxDV4L7Ht42ZecgOCp796FAg+0pEBYe1f6HXhtQy
 Yl0Sr2AKrrQLiEvciNjSwPniDR6cDNpHd4YvuA+D/Ufd9s4S4bnT0LkIxz2hS/9hyggj/Lyyl5u
 m9d/tn+1dxPtExVusFCpQ39E6mORcrXo5obxWLBwQwWOyXoBkgi2LCb8keBkEwL2nxYgNh7xN6E
 zvjxgTJQFmwlqQMUrLUR0rkou9XaCK08ynC2TtPtJ4RuAGJLxwvq4myWFgBXvS1zWNctzb9nf1u
 zdTSnqFWgEvIAEuhA3J86aVorFmH2PcymJNqPIlknYCiMZdzaCUkngv+Hjr9HvF77kbPUyBVaNL
 xfveNb5Mpb1506Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

LTTPRs operating modes are defined by the DisplayPort standard and the
generic framework now provides a helper to switch between them.
So use the drm generic helper instead as it makes the code a bit cleaner.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
 		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
 
 		if (nr) {
-			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-						DP_PHY_REPEATER_MODE_TRANSPARENT);
+			drm_dp_lttpr_set_transparent_mode(aux, true);
 
 			if (nr > 0) {
-				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
+				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
 				if (ret != 1) {
-					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
-								DP_PHY_REPEATER_MODE_TRANSPARENT);
+					drm_dp_lttpr_set_transparent_mode(aux, true);
 				} else {
 					outp->dp.lttpr.nr = nr;
 				}

-- 
2.34.1


