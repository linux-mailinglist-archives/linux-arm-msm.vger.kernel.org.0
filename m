Return-Path: <linux-arm-msm+bounces-105894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG+8HwPC+Wn/DAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:10:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D0D4CA97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9FD73088E59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFAF335BDB;
	Tue,  5 May 2026 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5t9qPXR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5953B335064
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975514; cv=none; b=TD/IkmkzFAkrIc2hxtQ+YsJT4OUTneOJpTKOP08toaB/+4HFuCrRLsZF8LqX/T2u5DH32e6QxQOPMEvI2IXJ1waXPOkeRz2dpis0qBE4QvKfxeD3GRMTVQk3SMRDTgyvM7pHj1o64YpL+CwVuULJysuDxh7RoRBITHqa2bT7CAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975514; c=relaxed/simple;
	bh=lv+mkm4sJYT6ajqGepk25l/mtM+wHW7Q1AaYtDuKe4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gpc2D7pAQ/xSgFVtVZAj7+5/FbVfzVWjJGzM/ARsEWHa3wwHZHWcOqfNE5RzL1F3MrHtj900aoOxafRbpCnej8ARUaYdT5diIfVpX6v3ihRANY6CC3KoGwBssJ5y3EUaQP95U5jlB6ir1HNfPr+yIosrOdcUo1aW4hvEx7BBMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5t9qPXR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ad135063so47735705e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777975512; x=1778580312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5OO0966EsEvo3fVE74M/tu/i8lqlenm6UmjL55zrQY=;
        b=V5t9qPXRMGvwKbgREGbRSLmVbsVtUZmFdoeI79Gtb6Bd9A+z/6MeGYVSuboT5K1Pfx
         C8By8Op6L9Xm76Dl+4ag66vYpJa0ze41vzTLWVKi7OzBHc0fXsDVW3unHVKGA/uRGANM
         juATSChf3wfD9fUATao3ThcLT1mICzlQIje32jmVLbbzvyc5HM4I45z+nbAm2Ny3O4wt
         HZj3beBYBVIJsEo6tunJh+gEA50JwIenAZ++V04yxw1lCKgxEW5iq+foFTn/8dqHgolA
         meYsayzxtRjfrvI85NgeDP9qs4Fg6c87g7MTRfuGMPJkzl745YBuEU74jcPOQ2iVofFo
         umHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777975512; x=1778580312;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P5OO0966EsEvo3fVE74M/tu/i8lqlenm6UmjL55zrQY=;
        b=pE5e4vVZ+huO1+G51QW9lCwtDP+olCwoCjnqFPK6idX+WX4jzDepkHiADCkPglAEeR
         U2JJ/xLWIu2LNNFbIAWjV6zdgSQNhXRn3MVM7HUJVnfKunt+dryipaCFOomounY7kpjS
         qB947FlB6wzNhlxo3RybHJybZAubDoUYAOXR1Dl1bu+2rAzhHywOGI6OQ1YDaJDXbM0Z
         dsinTx3/xKTNcb7KpIaP69oqTeOR2hDl6ZabZh4XBbao32xrGDe3Q9+qGrVn/Nmkfgnr
         v0Zp+8JtVV3cBi17k7QRJgy5LYmNhjt4g0OkypHSkhbEhS4BLYLER1xFCQ9XFDTaB696
         oB5w==
X-Forwarded-Encrypted: i=1; AFNElJ9+7e7p4MYrXeA7ygnFFFDB1utorf1QMPuXkIB0NXAk3vp0IJgKEb4adqSgerXWSY2zgaZGmnvWUymvNNpC@vger.kernel.org
X-Gm-Message-State: AOJu0YzDzdgm1j7Ona5CH7C/SAI386rqH6q5h9lrrzE1FwO6zdWk6sUS
	Z5DKmX9BPDL2Lc8ISB/eDiheZkWrBME3Dw6zlTPO/jv52l1gO8JyW9woCBCYjN5jwVI=
X-Gm-Gg: AeBDiev4cLhHxpOMQDBBlMw7xxI3jV02EcGxKCIsLGI2DN3lQFUhu54T7xRRGeKPSZx
	GLaPOVF/9QoIJsmBgdrkk85UriiMFnQlVjGR9QXYjgO+DbA1yI8pgXLiREyhrKTT4p55CLzA1LB
	/7tje8Ydb8ZXY82bB4sBo7jlbmEosX5OWDfNj7btHWvqqlLLgNcgxdPUCaM14O7u7ubd0is8e1w
	muixHCNFE5vygXt2yjyXvnuoTcf9POW0GnppCre1Czob4oBIMvmEINo+5K+NO83E0BTtwjSfXBR
	LODWnNKDgdWF6vpR9Ja1EItCoI9Wg2CAEHzkL8fy9tnOrI00sC0tXXldsFOdoZ9etpQCLwNpLE+
	WqPeB+QF0KL5+HO/6AkL8kYe7I5YLfmg28wNa9sw0VOHDHTQQJ841WgXKkV4w+ST7t2zXQ0DVCY
	905THjh5tb1+BdkJoh6BHaxTKOOV3UAnKMCqQp9ofGWQk5GzTLHSn20/Y=
X-Received: by 2002:a05:600c:5290:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-48a988c0fd9mr243284795e9.24.1777975511458;
        Tue, 05 May 2026 03:05:11 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c8556sm381856295e9.4.2026.05.05.03.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:05:10 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
Subject: Re: (subset) [PATCH v5 0/6] Enable new features for flipkart-rimob
Message-Id: <177797550956.290023.16418895983264394741.b4-ty@b4>
Date: Tue, 05 May 2026 12:05:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Rspamd-Queue-Id: E7D0D4CA97D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105894-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gitlab.freedesktop.org:url,linaro.org:dkim]

Hi,

On Tue, 31 Mar 2026 11:47:08 +0200, Cristian Cozzolino wrote:
> This series enables a set of miscellaneous features for Billion Capture+
> (a handset using the MSM8953 SoC released in 2017):
> - Panel and GPU
> - Touchscreen
> - WiFi + Bluetooth
> - Hall sensor
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/6] dt-bindings: display: panel: Add Novatek NT35532 LCD DSI
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4b494c72555f6249331b16add879c40e920d3f1e
[2/6] drm/panel: Add driver for Novatek NT35532
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a0dd1b5c55f73b962dfa807e726f7214def6065

-- 
Neil


