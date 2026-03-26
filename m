Return-Path: <linux-arm-msm+bounces-100063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFDtIr72xGmC5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:05:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF33331E57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 334A3304F6CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3B33BED01;
	Thu, 26 Mar 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L52QhdVO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168713BE16B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515764; cv=none; b=TQAZzfmBnlWFMXbqoMMBFlMNRZJSdk3/U+aL5EyFfGQpWTwPoRQC5LtA5lMjTgtT8du3eeUs0UGjwL7p2L9Ci2FtepxJjZ5V5eYoeUKhCeov6vNQ2B+NhqLyI2pKsVAiCiaxgjNCtRnbLewitQl+ckgBOjsbFu0gfIle1hvPyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515764; c=relaxed/simple;
	bh=J+rhQyRTfoZzJ0GI7GG9EXyupU3nMVnHvjxZxGN6brQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Njkw91frwuWgLEMv3yACiowyCAYcf9Alznh4EoYCufOOIMFlNc1GlUm0N97SG2CiQ04MGXVlC1L31ZxfjXdH7rWj8qABXf6K6jvNBVgoCf1/rKLaEQuYC/iFPaz8UQpqgemDdbAO5m7tAICpG5zvnb/E3gq/PX1bMrOatb9171g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L52QhdVO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b886fc047d5so106449066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515761; x=1775120561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXPKOAWpcR9xHk9hAzrUFCp6rLb1/uw3dh+uChYT9mc=;
        b=L52QhdVOzz/ndoThLufo6fEDjpf1zvoBSHkgmCa5IF+23bPvzJADXmj8QRy9WlXtd7
         wqtLnUWwHBGHlJMAsW/bKdKJabVWK64vBAqyi+Fh/f2IhVO0fh1wsY8ZWT4B/aTh23pD
         k3OaYxPcH4QYnGr4498LAF8Sy/atplEWcs7vyItje2XfiCFdvww981ie9BSCooyiClS5
         WAEqapKtwaJKZcI86lRymWWVSwAnVjS+l3EH6o1eQNDmofDJvMvnjfdavb6AEPNA8z/3
         K3IzjxdqxJUG5olCozkQ+9OStPr/yuh8IHTPuSeTCyZ4pp/flYmpyEbo3ID0SeGli+UL
         YDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515761; x=1775120561;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NXPKOAWpcR9xHk9hAzrUFCp6rLb1/uw3dh+uChYT9mc=;
        b=DUUEXx9qd3WX89yD4THOEwMHcIiBHHx0I/P3PlIOxAmXWRwnoX3yM/kKdqioOCOlsr
         8wFTLoNAPNBVxL02pRpthinyAJ246I8mF0YSC4WMFB+I3N2NkykB2bHZ7wwPvZzXiuZv
         5arqLdSsEHzteiQtGRwAMBNRpxEGuWwzdOh70rWNppbXBIsQRlKgUX//r+0YQNcriSwK
         8mb/Gr3MDUjEvwR1puXAbIHObJmWLNj48TGY0ns0ha2ZrsJIOtp2Vu9g+AL4XOW6GlvQ
         CQl2x5OrUMNPmDOlMYlHwr5z0axsigVxiD3ISiMPjIrcgUzF1wAY1S8VzglnYQwtHulq
         4sGA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDwE1dw0K9AbvfVa9+FRVlgXIwcpAkn3w1mvVec4N2dUMzS2P5sBneH4QN9EyN5eYk9jNVyPLiABA4Xma@vger.kernel.org
X-Gm-Message-State: AOJu0YxGiWBg7CV4kOJCAkNQYZzuE80AudiywD3Nhiz6Je2JXw1pIpZT
	cmKfKAjc9BzNvL/5i/Y8Qec0MorrKajOK5POBZrf/Xi6jWQAB/YbiqmyYaOKMHENhIs=
X-Gm-Gg: ATEYQzwZf+sNwjlzhAgcvBtcUWxiiY+8ZlEicAk5slfbt1ARJY/hEZM0/zrCYICCPIM
	ihrzoIcNqD+ar64XzfwFQD3MRN0JJ9DAFW/CG+fbo6up0yD1HVAMNZiGuNCpttGWjk9NkYntyNc
	Z3q+8Y7s+gAfZlJSMuUAI1ud7HEfSDRbZ7i1BUqbfGDa5folmFnNjM3DzJWUc5FgU+tlkhFyk69
	HWBrqMymds2HOX/JQOFhJM42jtqlUP4LDsfSuElapjHzYns2BAIL9nzzf4bsAL8uq8vvRj547tB
	zMGJUxwbrZIfEKlmD+AgKbUDEhvd65BK/ePQ4zzxMVXLLeomJW+EIlQ4HfVegsE00KrH6aAk25L
	DY2/0e0h0d0h04sMwkpC1MHHHrU8IhTtuE45DfcFLfdBYBlEK5V+Eiy+PbjlEWJPeBvyN8AOp6+
	pY1o9knoPv37ezblcdrHsNtFl/qmEzyVEWErFV5yMHZceg
X-Received: by 2002:a17:906:e097:b0:b97:ba90:edb2 with SMTP id a640c23a62f3a-b9a599a5322mr343969666b.50.1774515760204;
        Thu, 26 Mar 2026 02:02:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Yedaya Katsman <yedaya.ka@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
References: <20260320-panel-patches-v7-0-3eaefc4b3878@gmail.com>
Subject: Re: (subset) [PATCH v7 0/3] Add support for the Samsung S6E8FC0
 DSI and M1906F9 display panel
Message-Id: <177451575929.103892.7506565955077481700.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100063-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,postmarketos.org:url]
X-Rspamd-Queue-Id: 0CF33331E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Fri, 20 Mar 2026 16:41:37 +0200, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FC0 DSI controller with the
> M1906F9 display panel found in Xiaomi Mi A3 (xiaomi-laurel). The driver is
> generated using linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: Add Samsung S6E8FC0-M1906F9
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f4693b88bc730cddc6d69f6f11b64e6d93a8e373
[2/3] drm: panel: Add Samsung S6E8FC0 DSI controller for M1906F9 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/49837b6babe71fac84cda2a0d3cf9c085bf3a2f9

-- 
Neil


